@interface CRMLModel
- (CRMLModel)init;
- (CRMLModel)initWithURL:(id)a3 error:(id *)a4;
- (CRMLModel)initWithURL:(id)a3 restrictToCPU:(BOOL)a4 error:(id *)a5;
- (NSArray)modelShape;
- (NSString)modelName;
- (const)codeMap;
- (id)decodeActivations:(void *)a3;
- (id)decodeActivations:(void *)a3 blank:(unsigned __int16)a4 ctcAllowGarbage:(BOOL)a5 numResultNeeded:(int64_t)a6;
- (id)initRestrictingToCPU:(BOOL)a3;
- (id)predict:(id)a3 error:(id *)a4;
- (int)classCount;
- (int)inputHeight;
- (int)inputWidth;
- (int64_t)cpuBatchSize;
- (int64_t)gpuBatchSize;
- (vector<std::vector<std::vector<float>>,)activationsFromImage:(CRMLModel *)self;
- (void)setCpuBatchSize:(int64_t)a3;
- (void)setGpuBatchSize:(int64_t)a3;
- (void)setModelShape:(id)a3;
@end

@implementation CRMLModel

- (id)decodeActivations:(void *)a3
{
  return 0;
}

- (id)decodeActivations:(void *)a3 blank:(unsigned __int16)a4 ctcAllowGarbage:(BOOL)a5 numResultNeeded:(int64_t)a6
{
  return 0;
}

- (vector<std::vector<std::vector<float>>,)activationsFromImage:(CRMLModel *)self
{
  v83[5] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  v79 = (uint64_t **)retstr;
  id v69 = v6;
  if ([v6 width] >= (unint64_t)self->_modelWidth
    && [v69 height] == self->_modelHeight)
  {
    std::vector<std::vector<std::vector<float>>>::resize((uint64_t *)retstr, 1uLL);
    if ((unint64_t)([v69 width] - self->_modelWidth + 1) >= 2) {
      uint64_t v7 = (unint64_t)([v69 width] - self->_modelWidth + 1) >> 1;
    }
    else {
      uint64_t v7 = 1;
    }
    uint64_t v9 = [(CRMLModel *)self gpuBatchSize];
    std::vector<std::vector<float>>::resize(*v79, v7);
    uint64_t v66 = vcvtps_s32_f32((float)v7 / (float)v9);
    if (v66 >= 1)
    {
      uint64_t v67 = v7;
      uint64_t v71 = 0;
      uint64_t v72 = v9;
      uint64_t v10 = 0;
      v77 = 0;
      uint64_t v65 = 2 * v9;
      do
      {
        uint64_t v11 = v72;
        uint64_t v70 = v10;
        if (v66 - 1 == v10)
        {
          uint64_t v11 = v72;
          if (v67 != v72) {
            uint64_t v11 = v67 % v72;
          }
        }
        uint64_t v78 = v11;
        id v12 = objc_alloc(MEMORY[0x1E4F1E9A8]);
        v83[0] = &unk_1F3932EF0;
        v75 = [NSNumber numberWithInteger:v72];
        v83[1] = v75;
        v73 = [(CRMLModel *)self modelShape];
        v13 = [v73 objectAtIndexedSubscript:0];
        v83[2] = v13;
        v14 = [(CRMLModel *)self modelShape];
        v15 = [v14 objectAtIndexedSubscript:1];
        v83[3] = v15;
        v16 = [(CRMLModel *)self modelShape];
        v17 = [v16 objectAtIndexedSubscript:2];
        v83[4] = v17;
        v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v83 count:5];
        id v68 = (id)[v12 initWithShape:v18 dataType:65600 error:0];

        long long v81 = 0u;
        long long v82 = 0u;
        if (v69) {
          [v69 vImage];
        }
        id v76 = v68;
        uint64_t v19 = [v76 dataPointer];
        if (v78 >= 1)
        {
          uint64_t v20 = 0;
          int v21 = 0;
          uint64_t v22 = *((void *)&v81 + 1);
          v23 = (unsigned __int8 *)(v81 + v71);
          do
          {
            if (v22)
            {
              uint64_t v24 = 0;
              uint64_t modelWidth = self->_modelWidth;
              uint64_t v26 = *((void *)&v82 + 1);
              v27 = v23;
              do
              {
                if ((int)modelWidth >= 1)
                {
                  v28 = (double *)(v19 + 8 * v21);
                  v21 += modelWidth;
                  v29 = v27;
                  uint64_t v30 = modelWidth;
                  do
                  {
                    unsigned int v31 = *v29++;
                    *v28++ = (float)((float)v31 / 255.0);
                    --v30;
                  }
                  while (v30);
                }
                ++v24;
                v27 += v26;
              }
              while (v24 != v22);
            }
            v20 += 2;
            v23 += 2;
          }
          while (2 * v78 > v20);
        }
        id v80 = v77;
        v32 = [(CRMLModel *)self predict:v76 error:&v80];
        id v74 = v80;

        if (v74) {
          NSLog(&stru_1F38F0768.isa, v74);
        }
        v33 = [v32 shape];
        v34 = [v33 objectAtIndexedSubscript:0];
        BOOL v35 = [v34 integerValue] < v78;

        if (v35)
        {
          v36 = [v32 shape];
          v37 = [v36 objectAtIndexedSubscript:0];
          NSLog(&cfstr_Corerecognitio.isa, v32, v37, v72);
        }
        v38 = [v32 shape];
        v39 = [v32 shape];
        v40 = objc_msgSend(v38, "objectAtIndexedSubscript:", objc_msgSend(v39, "count") - 1);
        uint64_t v41 = [v40 integerValue];
        BOOL v42 = v41 == [(CRMLModel *)self classCount];

        if (!v42)
        {
          id v64 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Codemap size doesn't match model output class" userInfo:0];
          objc_exception_throw(v64);
        }
        if (v78 >= 1)
        {
          for (uint64_t i = 0; i != v78; ++i)
          {
            int v44 = 0;
            uint64_t v45 = i + v70 * v72;
            while (v44 < [(CRMLModel *)self classCount])
            {
              uint64_t v46 = **v79;
              uint64_t v47 = [v32 dataPointer];
              float v48 = *(double *)(v47 + 8 * (int)(v44 + [(CRMLModel *)self classCount] * i));
              uint64_t v49 = v46 + 24 * v45;
              v52 = *(float **)(v49 + 8);
              uint64_t v51 = v49 + 8;
              v50 = v52;
              unint64_t v53 = *(void *)(v51 + 8);
              if ((unint64_t)v52 >= v53)
              {
                v55 = (void **)(v46 + 24 * v45);
                v56 = (float *)*v55;
                uint64_t v57 = ((char *)v50 - (unsigned char *)*v55) >> 2;
                unint64_t v58 = v57 + 1;
                if ((unint64_t)(v57 + 1) >> 62) {
                  std::vector<int>::__throw_length_error[abi:ne180100]();
                }
                uint64_t v59 = v53 - (void)v56;
                if (v59 >> 1 > v58) {
                  unint64_t v58 = v59 >> 1;
                }
                if ((unint64_t)v59 >= 0x7FFFFFFFFFFFFFFCLL) {
                  unint64_t v60 = 0x3FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v60 = v58;
                }
                if (v60)
                {
                  v61 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v51 + 8, v60);
                  v50 = *(float **)v51;
                  v56 = (float *)*v55;
                }
                else
                {
                  v61 = 0;
                }
                v62 = (float *)&v61[4 * v57];
                float *v62 = v48;
                v54 = v62 + 1;
                while (v50 != v56)
                {
                  int v63 = *((_DWORD *)v50-- - 1);
                  *((_DWORD *)v62-- - 1) = v63;
                }
                *v55 = v62;
                *(void *)uint64_t v51 = v54;
                *(void *)(v51 + 8) = &v61[4 * v60];
                if (v56) {
                  operator delete(v56);
                }
              }
              else
              {
                float *v50 = v48;
                v54 = v50 + 1;
              }
              *(void *)uint64_t v51 = v54;
              ++v44;
            }
          }
        }

        uint64_t v10 = v70 + 1;
        v71 += v65;
        v77 = v74;
      }
      while (v70 + 1 != v66);
    }
  }
  else
  {
    NSLog(&cfstr_AttemptToRecog.isa, [v69 width], objc_msgSend(v69, "height"), self->_modelWidth, self->_modelHeight);
  }

  return result;
}

- (CRMLModel)init
{
  v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v4 = [(CRMLModel *)self modelName];
  v5 = [v3 pathForResource:v4 ofType:@"bundle"];

  id v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5];
  uint64_t v7 = [(CRMLModel *)self initWithURL:v6 error:0];

  return v7;
}

- (id)initRestrictingToCPU:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v6 = [(CRMLModel *)self modelName];
  uint64_t v7 = [v5 pathForResource:v6 ofType:@"bundle"];

  v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v7];
  uint64_t v9 = [(CRMLModel *)self initWithURL:v8 restrictToCPU:v3 error:0];

  return v9;
}

- (CRMLModel)initWithURL:(id)a3 error:(id *)a4
{
  return [(CRMLModel *)self initWithURL:a3 restrictToCPU:0 error:a4];
}

- (CRMLModel)initWithURL:(id)a3 restrictToCPU:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  v31.receiver = self;
  v31.super_class = (Class)CRMLModel;
  uint64_t v9 = [(CRMLModel *)&v31 init];
  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F1E990] defaultConfiguration];
    if ((deviceHasAppleNeuralEngine() & 1) == 0) {
      [v10 setAllowBackgroundGPUCompute:1];
    }
    if (v6) {
      [v10 setComputeUnits:0];
    }
    uint64_t v11 = [MEMORY[0x1E4F1E968] modelWithContentsOfURL:v8 configuration:v10 error:a5];
    model = v9->model;
    v9->model = (MLModel *)v11;

    if (a5 && *a5 || (v13 = v9->model) == 0)
    {

      v29 = 0;
      goto LABEL_16;
    }
    v14 = [(MLModel *)v13 modelDescription];
    v15 = [v14 inputDescriptionsByName];
    v16 = [v15 objectForKeyedSubscript:@"data"];
    v17 = [v16 multiArrayConstraint];
    v18 = [v17 shape];
    [(CRMLModel *)v9 setModelShape:v18];

    uint64_t v19 = [(CRMLModel *)v9 modelShape];
    uint64_t v20 = [v19 objectAtIndexedSubscript:1];
    v9->_modelHeight = [v20 intValue];

    int v21 = [(CRMLModel *)v9 modelShape];
    uint64_t v22 = [v21 objectAtIndexedSubscript:2];
    v9->_uint64_t modelWidth = [v22 intValue];

    [(CRMLModel *)v9 setGpuBatchSize:256];
    v23 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v24 = [v23 objectForKey:@"com.apple.CoreRecognition.gpu_batch_size"];
    uint64_t v25 = [v24 integerValue];

    if (v25 >= 1)
    {
      [(CRMLModel *)v9 setGpuBatchSize:v25];
      NSLog(&cfstr_UsingCustomGpu.isa, [(CRMLModel *)v9 gpuBatchSize]);
    }
    [(CRMLModel *)v9 setCpuBatchSize:512];
    uint64_t v26 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v27 = [v26 objectForKey:@"com.apple.CoreRecognition.cpu_batch_size"];
    uint64_t v28 = [v27 integerValue];

    if (v28 >= 1)
    {
      [(CRMLModel *)v9 setCpuBatchSize:v28];
      NSLog(&cfstr_UsingCustomCpu.isa, [(CRMLModel *)v9 cpuBatchSize]);
    }
  }
  v29 = v9;
LABEL_16:

  return v29;
}

- (int)inputWidth
{
  return self->_modelWidth;
}

- (int)inputHeight
{
  return self->_modelHeight;
}

- (NSString)modelName
{
  return (NSString *)&stru_1F38EED68;
}

- (id)predict:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v7 setObject:v6 forKeyedSubscript:@"data"];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1E930]) initWithDictionary:v7 error:a4];
  uint64_t v9 = self;
  objc_sync_enter(v9);
  uint64_t v10 = [(MLModel *)v9->model predictionFromFeatures:v8 error:a4];
  objc_sync_exit(v9);

  uint64_t v11 = [v10 featureValueForName:@"softmax_output"];
  id v12 = [v11 multiArrayValue];

  return v12;
}

- (const)codeMap
{
  return self->_codeMap;
}

- (int)classCount
{
  return self->_classCount;
}

- (NSArray)modelShape
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setModelShape:(id)a3
{
}

- (int64_t)gpuBatchSize
{
  return self->_gpuBatchSize;
}

- (void)setGpuBatchSize:(int64_t)a3
{
  self->_gpuBatchSize = a3;
}

- (int64_t)cpuBatchSize
{
  return self->_cpuBatchSize;
}

- (void)setCpuBatchSize:(int64_t)a3
{
  self->_cpuBatchSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelShape, 0);
  objc_storeStrong((id *)&self->model, 0);
}

@end