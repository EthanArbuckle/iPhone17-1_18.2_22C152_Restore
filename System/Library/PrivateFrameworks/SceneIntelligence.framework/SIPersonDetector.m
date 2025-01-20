@interface SIPersonDetector
- (CGSize)getInputResolution;
- (CGSize)getOutputResolution;
- (SIPersonDetector)initWithNetworkConfiguration:(id)a3;
- (int64_t)copyResultsToData:(id)a3;
- (int64_t)evaluateForInput:(__CVBuffer *)a3;
- (int64_t)evaluateForInput:(id)a3 output:(id)a4;
@end

@implementation SIPersonDetector

- (SIPersonDetector)initWithNetworkConfiguration:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  kdebug_trace();
  v10.receiver = self;
  v10.super_class = (Class)SIPersonDetector;
  v5 = [(SIModel *)&v10 initWithNetworkConfiguration:v4];
  if (v5)
  {
    uint64_t v11 = kSIME5PersonDetectorInputTensorName;
    v6 = [[SIPixelBuffer alloc] initWithCVPixelBuffer:0];
    v12[0] = v6;
    v7 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
    [(SIModel *)v5 setInputs:v7];

    kdebug_trace();
    v8 = v5;
  }

  return v5;
}

- (CGSize)getInputResolution
{
  v3 = [(SIModel *)self network];
  unint64_t v4 = [v3 getInputWidth:kSIME5PersonDetectorInputTensorName];
  v5 = [(SIModel *)self network];
  double v6 = (double)(unint64_t)[v5 getInputHeight:kSIME5PersonDetectorInputTensorName];

  double v7 = (double)v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)getOutputResolution
{
  double v2 = 0.0;
  double v3 = 0.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (int64_t)evaluateForInput:(__CVBuffer *)a3
{
  v5 = [(SIModel *)self inputs];
  double v6 = [v5 objectForKeyedSubscript:kSIME5PersonDetectorInputTensorName];
  [v6 setPixelBuffer:a3];

  double v7 = [(SIModel *)self inputs];
  double v8 = [(SIModel *)self outputs];
  [(SIModel *)self evaluateWithInput:v7 outputs:v8];

  return 0;
}

- (int64_t)evaluateForInput:(id)a3 output:(id)a4
{
  id v5 = a3;
  int64_t v6 = -[SIPersonDetector evaluateForInput:](self, "evaluateForInput:", [v5 inputImageBuffer]);

  return v6;
}

- (int64_t)copyResultsToData:(id)a3
{
  uint64_t v109 = *MEMORY[0x263EF8340];
  v97 = [a3 boundingBoxes];
  kdebug_trace();
  unint64_t v4 = [(SIModel *)self network];
  unint64_t v98 = [v4 getOutputHeight:kSIME5PersonDetectorOutputHeatMapTensorName];

  id v5 = [(SIModel *)self network];
  unint64_t v6 = [v5 getOutputWidth:kSIME5PersonDetectorOutputHeatMapTensorName];

  double v7 = [(SIModel *)self network];
  uint64_t v8 = [v7 getRawOutput:kSIME5PersonDetectorOutputHeatMapTensorName];

  v9 = [(SIModel *)self network];
  uint64_t v10 = [v9 getRawOutput:kSIME5PersonDetectorOutputHeatMapMaxPoolTensorName];

  uint64_t v11 = [(SIModel *)self network];
  uint64_t v95 = [v11 getRawOutput:kSIME5PersonDetectorOutputBoundingBoxSizeTensorName];

  v12 = [(SIModel *)self network];
  uint64_t v94 = [v12 getRawOutput:kSIME5PersonDetectorOutputBoundingBoxCenterTensorName];

  v13 = [(SIModel *)self network];
  int v14 = [v13 supportFloat16IO];

  id v96 = v97;
  if (v14)
  {
    v103 = 0;
    uint64_t v104 = 0;
    v102 = (uint64_t *)&v103;
    v15 = (uint64_t *)&v103;
    if (v98)
    {
      uint64_t v16 = 0;
      uint64_t v17 = 2 * v6;
      do
      {
        if (v6)
        {
          uint64_t v18 = 0;
          v19 = (__int16 *)v8;
          v20 = (__int16 *)v10;
          unint64_t v21 = v6;
          do
          {
            _H0 = *v19;
            __asm { FCVT            D1, H0 }
            if (_D1 > 0.36)
            {
              __asm { FCVT            S1, H0 }
              _H2 = *v20;
              __asm { FCVT            S2, H2 }
              if ((float)(_S1 - _S2) == 0.0)
              {
                v99 = (char *)(v18 | v16);
                LOWORD(v100) = _H0;
                std::__tree<std::__value_type<std::pair<int,int>,float>,std::__map_value_compare<std::pair<int,int>,std::__value_type<std::pair<int,int>,float>,std::less<std::pair<int,int>>,true>,std::allocator<std::__value_type<std::pair<int,int>,float>>>::__emplace_unique_key_args<std::pair<int,int>,std::pair<std::pair<int,int>,half>>(&v102, (int *)&v99, (uint64_t)&v99);
              }
            }
            v18 += 0x100000000;
            ++v20;
            ++v19;
            --v21;
          }
          while (v21);
        }
        ++v16;
        v10 += v17;
        v8 += v17;
      }
      while (v16 != v98);
      v15 = v102;
    }
    v99 = 0;
    v100 = 0;
    uint64_t v101 = 0;
    std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:nn180100]<std::__map_iterator<std::__tree_iterator<std::__value_type<std::pair<int,int>,float>,std::__tree_node<std::__value_type<std::pair<int,int>,float>,void *> *,long>>,std::__map_iterator<std::__tree_iterator<std::__value_type<std::pair<int,int>,float>,std::__tree_node<std::__value_type<std::pair<int,int>,float>,void *> *,long>>,std::back_insert_iterator<std::vector<std::pair<std::pair<int,int>,half>>>>((uint64_t)buf, v15, &v103, &v99);
    unint64_t v31 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * ((v100 - v99) >> 2));
    if (v100 == v99) {
      uint64_t v32 = 0;
    }
    else {
      uint64_t v32 = v31;
    }
    std::__introsort<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<half>(half const*,half const*,half const*,half const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,half> const&,std::pair<std::pair<int,int>,half> const&)#1} &,std::pair<std::pair<int,int>,half>*,false>((unint64_t)v99, (unint64_t)v100, v32, 1);
    int v33 = v104;
    if ((int)v104 >= 100) {
      int v33 = 100;
    }
    v34 = v96;
    std::vector<std::pair<std::pair<int,int>,half>>::resize((uint64_t)&v99, v33);
    v35 = v100;
    if (v100 != v99)
    {
      uint64_t v36 = 0;
      unint64_t v37 = 0;
      float v38 = (float)v6;
      float v39 = (float)v98;
      uint64_t v40 = (int)v98 * (int)v6;
      v35 = v99;
      do
      {
        uint64_t v42 = *(int *)&v35[v36];
        uint64_t v41 = *(int *)&v35[v36 + 4];
        uint64_t v43 = v41 + v6 * v42;
        _H13 = *(_WORD *)(v94 + 2 * (v43 + v40));
        _H1 = *(_WORD *)(v94 + 2 * v43);
        __asm { FCVT            S1, H1 }
        float v47 = (float)(int)v41 + _S1;
        LOWORD(_S1) = *(_WORD *)(v95 + 2 * v43);
        __asm { FCVT            S11, H1 }
        _H14 = *(_WORD *)(v95 + 2 * (v43 + v40));
        float v50 = v47 - (float)(_S11 * 0.5);
        if (v50 < 0.0)
        {
          v51 = __SceneIntelligenceLogSharedInstance();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136380931;
            v106 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/PersonDetector/SIPersonDetector.mm";
            __int16 v107 = 1025;
            int v108 = 183;
            _os_log_impl(&dword_21B697000, v51, OS_LOG_TYPE_INFO, " %{private}s:%{private}d *** [Warning] negative origin x received from the model. Set to 0 ***", buf, 0x12u);
          }

          float v50 = 0.0;
        }
        __asm
        {
          FCVT            S1, H13
          FCVT            S13, H14
        }
        float v54 = (float)((float)(int)v42 + _S1) - (float)(_S13 * 0.5);
        if (v54 < 0.0)
        {
          v55 = __SceneIntelligenceLogSharedInstance();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136380931;
            v106 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/PersonDetector/SIPersonDetector.mm";
            __int16 v107 = 1025;
            int v108 = 188;
            _os_log_impl(&dword_21B697000, v55, OS_LOG_TYPE_INFO, " %{private}s:%{private}d *** [Warning] negative origin y received from the model. Set to 0 ***", buf, 0x12u);
          }

          float v54 = 0.0;
        }
        if (_S11 > v38)
        {
          v56 = __SceneIntelligenceLogSharedInstance();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136380931;
            v106 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/PersonDetector/SIPersonDetector.mm";
            __int16 v107 = 1025;
            int v108 = 193;
            _os_log_impl(&dword_21B697000, v56, OS_LOG_TYPE_INFO, " %{private}s:%{private}d *** [Warning] out of bound width received from the model. Set to max_width ***", buf, 0x12u);
          }

          _S11 = (float)v6;
        }
        if (_S13 > v39)
        {
          v57 = __SceneIntelligenceLogSharedInstance();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136380931;
            v106 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/PersonDetector/SIPersonDetector.mm";
            __int16 v107 = 1025;
            int v108 = 198;
            _os_log_impl(&dword_21B697000, v57, OS_LOG_TYPE_INFO, " %{private}s:%{private}d *** [Warning] out of bound height received from the model. Set to max_height ***", buf, 0x12u);
          }

          _S13 = (float)v98;
        }
        v58 = [SIPersonDetectorBoundingBox alloc];
        _H4 = *(_WORD *)&v99[v36 + 8];
        __asm { FCVT            S4, H4 }
        v61 = -[SIPersonDetectorBoundingBox initWithBoundingBox:confidence:](v58, "initWithBoundingBox:confidence:", (float)(v50 / v38), (float)(v54 / v39), (float)(_S11 / v38), (float)(_S13 / v39), _D4);
        [v96 addObject:v61];

        ++v37;
        v35 = v99;
        v36 += 12;
      }
      while (0xAAAAAAAAAAAAAAABLL * ((v100 - v99) >> 2) > v37);
    }
  }
  else
  {
    v103 = 0;
    uint64_t v104 = 0;
    v102 = (uint64_t *)&v103;
    v62 = (uint64_t *)&v103;
    if (v98)
    {
      uint64_t v63 = 0;
      uint64_t v64 = 4 * v6;
      do
      {
        if (v6)
        {
          uint64_t v65 = 0;
          v66 = (float *)v8;
          v67 = (float *)v10;
          unint64_t v68 = v6;
          do
          {
            float v69 = *v66;
            if (*v66 > 0.36 && (float)(v69 - *v67) == 0.0)
            {
              v99 = (char *)(v65 | v63);
              *(float *)&v100 = v69;
              std::__tree<std::__value_type<std::pair<int,int>,float>,std::__map_value_compare<std::pair<int,int>,std::__value_type<std::pair<int,int>,float>,std::less<std::pair<int,int>>,true>,std::allocator<std::__value_type<std::pair<int,int>,float>>>::__emplace_unique_key_args<std::pair<int,int>,std::pair<std::pair<int,int>,float>>(&v102, (int *)&v99, (uint64_t)&v99);
            }
            v65 += 0x100000000;
            ++v67;
            ++v66;
            --v68;
          }
          while (v68);
        }
        ++v63;
        v10 += v64;
        v8 += v64;
      }
      while (v63 != v98);
      v62 = v102;
    }
    v99 = 0;
    v100 = 0;
    uint64_t v101 = 0;
    std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:nn180100]<std::__map_iterator<std::__tree_iterator<std::__value_type<std::pair<int,int>,float>,std::__tree_node<std::__value_type<std::pair<int,int>,float>,void *> *,long>>,std::__map_iterator<std::__tree_iterator<std::__value_type<std::pair<int,int>,float>,std::__tree_node<std::__value_type<std::pair<int,int>,float>,void *> *,long>>,std::back_insert_iterator<std::vector<std::pair<std::pair<int,int>,float>>>>((uint64_t)buf, v62, &v103, &v99);
    unint64_t v70 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * ((v100 - v99) >> 2));
    if (v100 == v99) {
      uint64_t v71 = 0;
    }
    else {
      uint64_t v71 = v70;
    }
    std::__introsort<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<float>(float const*,float const*,float const*,float const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,float> const&,std::pair<std::pair<int,int>,float> const&)#1} &,std::pair<std::pair<int,int>,float>*,false>((unint64_t)v99, (unint64_t)v100, v71, 1);
    int v72 = v104;
    if ((int)v104 >= 100) {
      int v72 = 100;
    }
    v34 = v96;
    std::vector<std::pair<std::pair<int,int>,float>>::resize((uint64_t)&v99, v72);
    v35 = v100;
    if (v100 != v99)
    {
      uint64_t v73 = 0;
      unint64_t v74 = 0;
      float v75 = (float)v6;
      float v76 = (float)v98;
      uint64_t v77 = (int)v98 * (int)v6;
      v35 = v99;
      do
      {
        uint64_t v79 = *(int *)&v35[v73];
        uint64_t v78 = *(int *)&v35[v73 + 4];
        uint64_t v80 = v78 + v6 * v79;
        float v81 = *(float *)(v94 + 4 * (v80 + v77));
        float v82 = *(float *)(v95 + 4 * v80);
        float v83 = *(float *)(v95 + 4 * (v80 + v77));
        float v84 = (float)(*(float *)(v94 + 4 * v80) + (float)(int)v78) - (float)(v82 * 0.5);
        if (v84 < 0.0)
        {
          v85 = __SceneIntelligenceLogSharedInstance();
          if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136380931;
            v106 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/PersonDetector/SIPersonDetector.mm";
            __int16 v107 = 1025;
            int v108 = 183;
            _os_log_impl(&dword_21B697000, v85, OS_LOG_TYPE_INFO, " %{private}s:%{private}d *** [Warning] negative origin x received from the model. Set to 0 ***", buf, 0x12u);
          }

          float v84 = 0.0;
        }
        float v86 = (float)(v81 + (float)(int)v79) - (float)(v83 * 0.5);
        if (v86 < 0.0)
        {
          v87 = __SceneIntelligenceLogSharedInstance();
          if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136380931;
            v106 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/PersonDetector/SIPersonDetector.mm";
            __int16 v107 = 1025;
            int v108 = 188;
            _os_log_impl(&dword_21B697000, v87, OS_LOG_TYPE_INFO, " %{private}s:%{private}d *** [Warning] negative origin y received from the model. Set to 0 ***", buf, 0x12u);
          }

          float v86 = 0.0;
        }
        if (v82 > v75)
        {
          v88 = __SceneIntelligenceLogSharedInstance();
          if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136380931;
            v106 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/PersonDetector/SIPersonDetector.mm";
            __int16 v107 = 1025;
            int v108 = 193;
            _os_log_impl(&dword_21B697000, v88, OS_LOG_TYPE_INFO, " %{private}s:%{private}d *** [Warning] out of bound width received from the model. Set to max_width ***", buf, 0x12u);
          }

          float v82 = (float)v6;
        }
        if (v83 > v76)
        {
          v89 = __SceneIntelligenceLogSharedInstance();
          if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136380931;
            v106 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/PersonDetector/SIPersonDetector.mm";
            __int16 v107 = 1025;
            int v108 = 198;
            _os_log_impl(&dword_21B697000, v89, OS_LOG_TYPE_INFO, " %{private}s:%{private}d *** [Warning] out of bound height received from the model. Set to max_height ***", buf, 0x12u);
          }

          float v83 = (float)v98;
        }
        v90 = [SIPersonDetectorBoundingBox alloc];
        LODWORD(v91) = *(_DWORD *)&v99[v73 + 8];
        v92 = -[SIPersonDetectorBoundingBox initWithBoundingBox:confidence:](v90, "initWithBoundingBox:confidence:", (float)(v84 / v75), (float)(v86 / v76), (float)(v82 / v75), (float)(v83 / v76), v91);
        [v96 addObject:v92];

        ++v74;
        v35 = v99;
        v73 += 12;
      }
      while (0xAAAAAAAAAAAAAAABLL * ((v100 - v99) >> 2) > v74);
    }
  }
  if (v35)
  {
    v100 = v35;
    operator delete(v35);
  }
  std::__tree<std::__value_type<std::pair<int,int>,float>,std::__map_value_compare<std::pair<int,int>,std::__value_type<std::pair<int,int>,float>,std::less<std::pair<int,int>>,true>,std::allocator<std::__value_type<std::pair<int,int>,float>>>::destroy((uint64_t)&v102, v103);

  kdebug_trace();
  return 0;
}

- (void).cxx_destruct
{
}

@end