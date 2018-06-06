@echo off
cd /d %~dp0
..\Png2Cloud.exe ../../ICL_NUIM_office/sandbox_20/depth/ ../../ICL_NUIM_office/sandbox_20/color/ ../../ICL_NUIM_office/sandbox_20/camera_para.txt ../../ICL_NUIM_office/sandbox_20/pointcloud/ ../../ICL_NUIM_office/sandbox_20/pointcloud_ds/ ../../ICL_NUIM_office/sandbox_20/pointcloud_xyzn/ ../../ICL_NUIM_office/sandbox_20/pointcloud_ds_xyzn/
..\Sift.exe ../../ICL_NUIM_office/sandbox_20/color/ ../../ICL_NUIM_office/sandbox_20/sift_correspondence.txt
..\ShiTomasi.exe ../../ICL_NUIM_office/sandbox_20/color/ ../../ICL_NUIM_office/sandbox_20/corner_correspondence.txt
..\Narf.exe ../../ICL_NUIM_office/sandbox_20/pointcloud_xyzn/ ../../ICL_NUIM_office/sandbox_20/keypoint/ ../../ICL_NUIM_office/sandbox_20/geometric_descriptor/
::SIFT matching
..\ColorCorrespondence.exe ../../ICL_NUIM_office/sandbox_20/pointcloud/ ../../ICL_NUIM_office/sandbox_20/pointcloud_ds/ ../../ICL_NUIM_office/sandbox_20/depth/ ../../ICL_NUIM_office/sandbox_20/sift_correspondence.txt ../../ICL_NUIM_office/sandbox_20/camera_para.txt -4.0 ../../ICL_NUIM_office/sandbox_20/sift_traj.txt ../../ICL_NUIM_office/sandbox_20/sift_info.txt
::ShiTomasi matching
..\ColorCorrespondence.exe ../../ICL_NUIM_office/sandbox_20/pointcloud/ ../../ICL_NUIM_office/sandbox_20/pointcloud_ds/ ../../ICL_NUIM_office/sandbox_20/depth/ ../../ICL_NUIM_office/sandbox_20/corner_correspondence.txt ../../ICL_NUIM_office/sandbox_20/camera_para.txt -4.0 ../../ICL_NUIM_office/sandbox_20/corner_traj.txt ../../ICL_NUIM_office/sandbox_20/corner_info.txt
..\GeometricCorrespondence.exe ../../ICL_NUIM_office/sandbox_20/pointcloud/ ../../ICL_NUIM_office/sandbox_20/pointcloud_ds/ ../../ICL_NUIM_office/sandbox_20/keypoint/ ../../ICL_NUIM_office/sandbox_20/geometric_descriptor/ ../../ICL_NUIM_office/sandbox_20/camera_para.txt -4.0 ../../ICL_NUIM_office/sandbox_20/narf_traj.txt ../../ICL_NUIM_office/sandbox_20/narf_info.txt
..\MergeInfo.exe ../../ICL_NUIM_office/sandbox_20/pointcloud_ds/ ../../ICL_NUIM_office/sandbox_20/narf_traj.txt ../../ICL_NUIM_office/sandbox_20/narf_info.txt ../../ICL_NUIM_office/sandbox_20/sift_traj.txt ../../ICL_NUIM_office/sandbox_20/sift_info.txt ../../ICL_NUIM_office/sandbox_20/corner_traj.txt ../../ICL_NUIM_office/sandbox_20/corner_info.txt ../../ICL_NUIM_office/sandbox_20/traj.txt ../../ICL_NUIM_office/sandbox_20/info.txt
..\GlobalOptimizer1.exe ../../ICL_NUIM_office/sandbox_20/pointcloud/ ../../ICL_NUIM_office/sandbox_20/traj.txt ../../ICL_NUIM_office/sandbox_20/info.txt ../../ICL_NUIM_office/sandbox_20/pose_opt1.txt ../../ICL_NUIM_office/sandbox_20/fail_build_complete_model.txt ../../ICL_NUIM_office/sandbox_20/selected_edge_opt1.txt 0.35 0.4 0.35 0.005
if exist ../../ICL_NUIM_office/sandbox_20/fail_build_complete_model.txt goto OVER
..\GlobalOptimizer2.exe ../../ICL_NUIM_office/sandbox_20/pose_opt1.txt ../../ICL_NUIM_office/sandbox_20/pointcloud/ ../../ICL_NUIM_office/sandbox_20/traj.txt ../../ICL_NUIM_office/sandbox_20/info.txt ../../ICL_NUIM_office/sandbox_20/pose_opt2.txt ../../ICL_NUIM_office/sandbox_20/traj_remain_opt2.txt ../../ICL_NUIM_office/sandbox_20/info_remain_opt2.txt 50.0
:OVER