time=$(date "+%Y%m%d-%H%M%S%3N")
name=${time}
dataset=114

mkdir -p ./logs/${dataset}

nnUNetv2_plan_and_preprocess -d ${dataset} --verify_dataset_integrity > ./logs/${dataset}/${name}_plan.log 2>&1 &