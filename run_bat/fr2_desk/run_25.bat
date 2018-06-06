@echo off
cd /d %~dp0
..\Png2Cloud.exe ../../rgbd_dataset_freiburg2_desk/sandbox_25/depth/ ../../rgbd_dataset_freiburg2_desk/sandbox_25/color/ ../../rgbd_dataset_freiburg2_desk/sandbox_25/camera_para.txt ../../rgbd_dataset_freiburg2_desk/sandbox_25/pointcloud/ ../../rgbd_dataset_freiburg2_desk/sandbox_25/pointcloud_ds/ ../../rgbd_dataset_freiburg2_desk/sandbox_25/pointcloud_xyzn/ ../../rgbd_dataset_freiburg2_desk/sandbox_25/pointcloud_ds_xyzn/
..\Sift.exe ../../rgbd_dataset_freiburg2_desk/sandbox_25/color/ ../../rgbd_dataset_freiburg2_desk/sandbox_25/sift_correspondence.txt
..\ShiTomasi.exe ../../rgbd_dataset_freiburg2_desk/sandbox_25/color/ ../../rgbd_dataset_freiburg2_desk/sandbox_25/corner_correspondence.txt
..\Narf.exe ../../rgbd_dataset_freiburg2_desk/sandbox_25/pointcloud_xyzn/ ../../rgbd_dataset_freiburg2_desk/sandbox_25/keypoint/ ../../rgbd_dataset_freiburg2_desk/sandbox_25/geometric_descriptor/
::SIFT matching
..\ColorCorrespondence.exe ../../rgbd_dataset_freiburg2_desk/sandbox_25/pointcloud/ ../../rgbd_dataset_freiburg2_desk/sandbox_25/pointcloud_ds/ ../../rgbd_dataset_freiburg2_desk/sandbox_25/depth/ ../../rgbd_dataset_freiburg2_desk/sandbox_25/sift_correspondence.txt ../../rgbd_dataset_freiburg2_desk/sandbox_25/camera_para.txt 4.0 ../../rgbd_dataset_freiburg2_desk/sandbox_25/sift_traj.txt ../../rgbd_dataset_freiburg2_desk/sandbox_25/sift_info.txt
::ShiTomasi matching
..\ColorCorrespondence.exe ../../rgbd_dataset_freiburg2_desk/sandbox_25/pointcloud/ ../../rgbd_dataset_freiburg2_desk/sandbox_25/pointcloud_ds/ ../../rgbd_dataset_freiburg2_desk/sandbox_25/depth/ ../../rgbd_dataset_freiburg2_desk/sandbox_25/corner_correspondence.txt ../../rgbd_dataset_freiburg2_desk/sandbox_25/camera_para.txt 4.0 ../../rgbd_dataset_freiburg2_desk/sandbox_25/corner_traj.txt ../../rgbd_dataset_freiburg2_desk/sandbox_25/corner_info.txt
..\GeometricCorrespondence.exe ../../rgbd_dataset_freiburg2_desk/sandbox_25/pointcloud/ ../../rgbd_dataset_freiburg2_desk/sandbox_25/pointcloud_ds/ ../../rgbd_dataset_freiburg2_desk/sandbox_25/keypoint/ ../../rgbd_dataset_freiburg2_desk/sandbox_25/geometric_descriptor/ ../../rgbd_dataset_freiburg2_desk/sandbox_25/camera_para.txt 4.0 ../../rgbd_dataset_freiburg2_desk/sandbox_25/narf_traj.txt ../../rgbd_dataset_freiburg2_desk/sandbox_25/narf_info.txt
..\MergeInfo.exe ../../rgbd_dataset_freiburg2_desk/sandbox_25/pointcloud_ds/ ../../rgbd_dataset_freiburg2_desk/sandbox_25/narf_traj.txt ../../rgbd_dataset_freiburg2_desk/sandbox_25/narf_info.txt ../../rgbd_dataset_freiburg2_desk/sandbox_25/sift_traj.txt ../../rgbd_dataset_freiburg2_desk/sandbox_25/sift_info.txt ../../rgbd_dataset_freiburg2_desk/sandbox_25/corner_traj.txt ../../rgbd_dataset_freiburg2_desk/sandbox_25/corner_info.txt ../../rgbd_dataset_freiburg2_desk/sandbox_25/traj.txt ../../rgbd_dataset_freiburg2_desk/sandbox_25/info.txt
..\GlobalOptimizer1.exe ../../rgbd_dataset_freiburg2_desk/sandbox_25/pointcloud/ ../../rgbd_dataset_freiburg2_desk/sandbox_25/traj.txt ../../rgbd_dataset_freiburg2_desk/sandbox_25/info.txt ../../rgbd_dataset_freiburg2_desk/sandbox_25/pose_opt1.txt ../../rgbd_dataset_freiburg2_desk/sandbox_25/fail_build_complete_model.txt ../../rgbd_dataset_freiburg2_desk/sandbox_25/selected_edge_opt1.txt 0.3 0.5 0.3 0.005
if exist ../../rgbd_dataset_freiburg2_desk/sandbox_25/fail_build_complete_model.txt goto OVER
..\GlobalOptimizer2.exe ../../rgbd_dataset_freiburg2_desk/sandbox_25/pose_opt1.txt ../../rgbd_dataset_freiburg2_desk/sandbox_25/pointcloud/ ../../rgbd_dataset_freiburg2_desk/sandbox_25/traj.txt ../../rgbd_dataset_freiburg2_desk/sandbox_25/info.txt ../../rgbd_dataset_freiburg2_desk/sandbox_25/pose_opt2.txt ../../rgbd_dataset_freiburg2_desk/sandbox_25/traj_remain_opt2.txt ../../rgbd_dataset_freiburg2_desk/sandbox_25/info_remain_opt2.txt 50.0
:OVER