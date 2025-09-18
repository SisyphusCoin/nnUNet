dataset=114
mkdir -p ./logs/${dataset}

## 1st batch：fold 0、fold 1
time=$(date "+%Y%m%d-%H%M%S%3N")
name=${time}
CUDA_VISIBLE_DEVICES=0 nnUNetv2_train ${dataset} 3d_lowres 0 > ./logs/${dataset}/${name}_3d_lowres_fold0_gpu0.log 2>&1 &
CUDA_VISIBLE_DEVICES=1 nnUNetv2_train ${dataset} 3d_lowres 1 > ./logs/${dataset}/${name}_3d_lowres_fold1_gpu1.log 2>&1 &
wait

## 2nd batch：fold 2、fold 3
time=$(date "+%Y%m%d-%H%M%S%3N")
name=${time}
CUDA_VISIBLE_DEVICES=0 nnUNetv2_train ${dataset} 3d_lowres 2 > ./logs/${dataset}/${name}_3d_lowres_fold2_gpu0.log 2>&1 &
CUDA_VISIBLE_DEVICES=1 nnUNetv2_train ${dataset} 3d_lowres 3 > ./logs/${dataset}/${name}_3d_lowres_fold3_gpu1.log 2>&1 &
wait

## 3rd batch：fold 4
time=$(date "+%Y%m%d-%H%M%S%3N")
name=${time}
CUDA_VISIBLE_DEVICES=0 nnUNetv2_train ${dataset} 3d_lowres 4 > ./logs/${dataset}/${name}_3d_lowres_fold4_gpu0.log 2>&1 &
wait