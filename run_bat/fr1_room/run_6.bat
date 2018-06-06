@echo off
cd /d %~dp0
..\Png2Cloud.exe ../../rgbd_dataset_freiburg1_room/sandbox_6/depth/ ../../rgbd_dataset_freiburg1_room/sandbox_6/color/ ../../rgbd_dataset_freiburg1_room/sandbox_6/camera_para.txt ../../rgbd_dataset_freiburg1_room/sandbox_6/pointcloud/ ../../rgbd_dataset_freiburg1_room/sandbox_6/pointcloud_ds/ ../../rgbd_dataset_freiburg1_room/sandbox_6/pointcloud_xyzn/ ../../rgbd_dataset_freiburg1_room/sandbox_6/pointcloud_ds_xyzn/
..\Sift.exe ../../rgbd_dataset_freiburg1_room/sandbox_6/color/ ../../rgbd_dataset_freiburg1_room/sandbox_6/sift_correspondence.txt
..\ShiTomasi.exe ../../rgbd_dataset_freiburg1_room/sandbox_6/color/ ../../rgbd_dataset_freiburg1_room/sandbox_6/corner_correspondence.txt
..\Narf.exe ../../rgbd_dataset_freiburg1_room/sandbox_6/pointcloud_xyzn/ ../../rgbd_dataset_freiburg1_room/sandbox_6/keypoint/ ../../rgbd_dataset_freiburg1_room/sandbox_6/geometric_descriptor/
::SIFT matching
..\ColorCorrespondence.exe ../../rgbd_dataset_freiburg1_room/sandbox_6/pointcloud/ ../../rgbd_dataset_freiburg1_room/sandbox_6/pointcloud_ds/ ../../rgbd_dataset_freiburg1_room/sandbox_6/depth/ ../../rgbd_dataset_freiburg1_room/sandbox_6/sift_correspondence.txt ../../rgbd_dataset_freiburg1_room/sandbox_6/camera_para.txt 4.0 ../../rgbd_dataset_freiburg1_room/sandbox_6/sift_traj.txt ../../rgbd_dataset_freiburg1_room/sandbox_6/sift_info.txt
::ShiTomasi matching
..\ColorCorrespondence.exe ../../rgbd_dataset_freiburg1_room/sandbox_6/pointcloud/ ../../rgbd_dataset_freiburg1_room/sandbox_6/pointcloud_ds/ ../../rgbd_dataset_freiburg1_room/sandbox_6/depth/ ../../rgbd_dataset_freiburg1_room/sandbox_6/corner_correspondence.txt ../../rgbd_dataset_freiburg1_room/sandbox_6/camera_para.txt 4.0 ../../rgbd_dataset_freiburg1_room/sandbox_6/corner_traj.txt ../../rgbd_dataset_freiburg1_room/sandbox_6/corner_info.txt
..\GeometricCorrespondence.exe ../../rgbd_dataset_freiburg1_room/sandbox_6/pointcloud/ ../../rgbd_dataset_freiburg1_room/sandbox_6/pointcloud_ds/ ../../rgbd_dataset_freiburg1_room/sandbox_6/keypoint/ ../../rgbd_dataset_freiburg1_room/sandbox_6/geometric_descriptor/ ../../rgbd_dataset_freiburg1_room/sandbox_6/camera_para.txt 4.0 ../../rgbd_dataset_freiburg1_room/sandbox_6/narf_traj.txt ../../rgbd_dataset_freiburg1_room/sandbox_6/narf_info.txt
..\MergeInfo.exe ../../rgbd_dataset_freiburg1_room/sandbox_6/pointcloud_ds/ ../../rgbd_dataset_freiburg1_room/sandbox_6/narf_traj.txt ../../rgbd_dataset_freiburg1_room/sandbox_6/narf_info.txt ../../rgbd_dataset_freiburg1_room/sandbox_6/sift_traj.txt ../../rgbd_dataset_freiburg1_room/sandbox_6/sift_info.txt ../../rgbd_dataset_freiburg1_room/sandbox_6/corner_traj.txt ../../rgbd_dataset_freiburg1_room/sandbox_6/corner_info.txt ../../rgbd_dataset_freiburg1_room/sandbox_6/traj.txt ../../rgbd_dataset_freiburg1_room/sandbox_6/info.txt
..\GlobalOptimizer1.exe ../../rgbd_dataset_freiburg1_room/sandbox_6/pointcloud/ ../../rgbd_dataset_freiburg1_room/sandbox_6/traj.txt ../../rgbd_dataset_freiburg1_room/sandbox_6/info.txt ../../rgbd_dataset_freiburg1_room/sandbox_6/pose_opt1.txt ../../rgbd_dataset_freiburg1_room/sandbox_6/fail_build_complete_model.txt ../../rgbd_dataset_freiburg1_room/sandbox_6/selected_edge_opt1.txt 0.35 0.5 0.35 0.002
if exist ../../rgbd_dataset_freiburg1_room/sandbox_6/fail_build_complete_model.txt goto OVER
..\GlobalOptimizer2.exe ../../rgbd_dataset_freiburg1_room/sandbox_6/pose_opt1.txt ../../rgbd_dataset_freiburg1_room/sandbox_6/pointcloud/ ../../rgbd_dataset_freiburg1_room/sandbox_6/traj.txt ../../rgbd_dataset_freiburg1_room/sandbox_6/info.txt ../../rgbd_dataset_freiburg1_room/sandbox_6/pose_opt2.txt ../../rgbd_dataset_freiburg1_room/sandbox_6/traj_remain_opt2.txt ../../rgbd_dataset_freiburg1_room/sandbox_6/info_remain_opt2.txt 50.0
:OVER