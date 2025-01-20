@interface VGHRTFPostProcessor
- (BOOL)finished;
- (VGHRTFPostProcessor)initWithConfig:(id)a3 error:(id *)a4;
- (id)processCaptureUpdateData:(id)a3 error:(id *)a4;
@end

@implementation VGHRTFPostProcessor

- (VGHRTFPostProcessor)initWithConfig:(id)a3 error:(id *)a4
{
  v41[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v38.receiver = self;
  v38.super_class = (Class)VGHRTFPostProcessor;
  v7 = [(VGHRTFPostProcessor *)&v38 init];
  if (v7)
  {
    uint64_t v8 = [v6 version];
    version = v7->_version;
    v7->_version = (NSString *)v8;

    uint64_t v10 = [v6 debugDataRootPath];
    debugPath = v7->_debugPath;
    v7->_debugPath = (NSString *)v10;

    v12 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.visage"];
    if ([v12 BOOLForKey:@"useLocalHRTFModels"])
    {
      v13 = __VGLogSharedInstance();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_260C8D000, v13, OS_LOG_TYPE_INFO, " Using hrtf models from the Visage framework ", buf, 2u);
      }

      v14 = objc_msgSend(MEMORY[0x263F086E0], "vg_bundle");
      uint64_t v15 = [v14 resourcePath];
      modelsRootPath = v7->_modelsRootPath;
      v7->_modelsRootPath = (NSString *)v15;
    }
    else
    {
      v18 = [v6 modelsRootPath];
      BOOL v19 = v18 == 0;

      if (v19)
      {
        v27 = __VGLogSharedInstance();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_260C8D000, v27, OS_LOG_TYPE_ERROR, " No hrtf models root path received! ", buf, 2u);
        }

        vg::hrtf::setError(a4, @"Failed to initialize VGHRTFPostProcessor with nil models path");
        goto LABEL_22;
      }
      v20 = NSString;
      v14 = [v6 modelsRootPath];
      v41[0] = v14;
      v41[1] = @"HRTFModels";
      modelsRootPath = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:2];
      uint64_t v21 = [v20 pathWithComponents:modelsRootPath];
      v22 = v7->_modelsRootPath;
      v7->_modelsRootPath = (NSString *)v21;
    }
    v23 = __VGLogSharedInstance();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = v7->_modelsRootPath;
      *(_DWORD *)buf = 138412290;
      v40 = v24;
      _os_log_impl(&dword_260C8D000, v23, OS_LOG_TYPE_INFO, " Using HRTFModels at path: %@ ", buf, 0xCu);
    }

    if (![v6 writeDebugData]) {
      goto LABEL_16;
    }
    if (v7->_debugPath)
    {
LABEL_13:
      v25 = __VGLogSharedInstance();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        v26 = v7->_debugPath;
        *(_DWORD *)buf = 138412290;
        v40 = v26;
        _os_log_impl(&dword_260C8D000, v25, OS_LOG_TYPE_DEBUG, " Using dump path for HRTF post processor data: %@ ", buf, 0xCu);
      }

LABEL_16:
      v7->_finished = 0;
      v17 = v7;
LABEL_23:

      goto LABEL_24;
    }
    v28 = objc_opt_new();
    [v28 setDateFormat:@"yyyyMMdd_HHmmss_SSS"];
    v29 = [MEMORY[0x263EFF910] date];
    v30 = [v28 stringFromDate:v29];

    uint64_t v31 = [@"/private/var/mobile/Library/Caches/VisageTestApp/HRTF/" stringByAppendingPathComponent:v30];
    v32 = v7->_debugPath;
    v7->_debugPath = (NSString *)v31;

    v33 = [MEMORY[0x263F08850] defaultManager];
    v34 = v7->_debugPath;
    id v37 = 0;
    [v33 createDirectoryAtPath:v34 withIntermediateDirectories:1 attributes:0 error:&v37];
    id v35 = v37;

    if (!v35)
    {

      goto LABEL_13;
    }
    vg::hrtf::setError(a4, @"Failed to create debug path.");

LABEL_22:
    v17 = 0;
    goto LABEL_23;
  }
  vg::hrtf::setError(a4, @"Failed to initialize VGHRTFPostProcessor.");
  v17 = 0;
LABEL_24:

  return v17;
}

- (id)processCaptureUpdateData:(id)a3 error:(id *)a4
{
  uint64_t v112 = *MEMORY[0x263EF8340];
  id v90 = a3;
  v4 = __VGLogSharedInstance();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_260C8D000, v4, OS_LOG_TYPE_DEBUG, " Started HRTF model processing... ", buf, 2u);
  }

  id v5 = [[VGHRTFPostProcessUpdateData alloc] initEmpty];
  [v5 setState:0];
  std::string::basic_string[abi:ne180100]<0>(buf, (char *)[(NSString *)self->_modelsRootPath UTF8String]);
  vg::hrtf::HRTFModel::create((uint64_t *)buf, &v103);
  if (SBYTE7(v98) < 0) {
    operator delete(*(void **)buf);
  }
  if (!v103)
  {
    v39 = @"Failed to create HRTFModel.";
LABEL_51:
    vg::hrtf::setError(a4, v39);
    id v80 = 0;
    goto LABEL_52;
  }
  id v6 = [v90 faceCaptureUpdateData];
  if (!v6)
  {
    v39 = @"Face capture update data unavailable.";
    goto LABEL_51;
  }
  v86 = v5;
  v7 = [v90 faceCaptureUpdateData];
  uint64_t v8 = [v7 result];
  BOOL v9 = v8 == 0;

  if (v9)
  {
    v39 = @"Face capture update data unavailable.";
LABEL_50:
    id v5 = v86;
    goto LABEL_51;
  }
  id v5 = v86;
  uint64_t v10 = [v90 earCaptureUpdateData];
  if (!v10)
  {
    v39 = @"Ear capture update data unavailable.";
    goto LABEL_51;
  }
  v11 = [v90 earCaptureUpdateData];
  v12 = [v11 result];
  BOOL v13 = v12 == 0;

  if (v13)
  {
    v39 = @"Ear capture update data unavailable.";
    goto LABEL_50;
  }
  *(_OWORD *)__p = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  *(_OWORD *)buf = 0u;
  long long v98 = 0u;
  v14 = [v90 faceCaptureUpdateData];
  v89 = [v14 result];

  for (unint64_t i = 0; i < [v89 count]; ++i)
  {
    v94 = [v89 objectAtIndexedSubscript:i];
    *(void *)&long long v105 = [v94 rgbImage];
    v16 = [v89 objectAtIndexedSubscript:i];
    *((void *)&v105 + 1) = [v16 depthImage];
    v17 = [v89 objectAtIndexedSubscript:i];
    [v17 depthIntrinsics];
    long long v19 = v18;
    HIDWORD(v19) = v93;
    HIDWORD(v20) = v92;
    HIDWORD(v21) = v91;
    long long v106 = v19;
    long long v107 = v20;
    long long v108 = v21;
    v22 = [v89 objectAtIndexedSubscript:i];
    id v23 = [v22 landmarks];
    unint64_t v24 = [v23 count];
    size_t v25 = (((4 * v24) & 0x3FFFFFFF8) + 31) & 0x7FFFFFFE0;
    v109 = 0;
    size_t v110 = v25 >> 2;
    memptr[0] = 0;
    malloc_type_posix_memalign(memptr, 0x20uLL, v25, 0x49090899uLL);
    v26 = memptr[0];
    v109 = memptr[0];
    int v111 = v24 >> 1;
    if (v111)
    {
      uint64_t v27 = 0;
      uint64_t v28 = v24 & 0x1FFFFFFFELL;
      do
      {
        v29 = [v23 objectAtIndexedSubscript:v27];
        [v29 floatValue];
        v26[v27] = v30;

        uint64_t v31 = [v23 objectAtIndexedSubscript:(v27 + 1)];
        [v31 floatValue];
        v26[(v27 + 1)] = v32;

        v27 += 2;
      }
      while (v28 != v27);
    }

    uint64_t v33 = *(void *)&buf[8];
    if (*(void *)&buf[8] >= (unint64_t)v98)
    {
      uint64_t v38 = std::vector<vg::hrtf::FaceFrameData>::__push_back_slow_path<vg::hrtf::FaceFrameData>((uint64_t *)buf, &v105);
      v34 = v109;
    }
    else
    {
      v34 = 0;
      long long v35 = v105;
      long long v105 = 0u;
      **(_OWORD **)&buf[8] = v35;
      long long v36 = v107;
      long long v37 = v108;
      *(_OWORD *)(v33 + 16) = v106;
      *(_OWORD *)(v33 + 32) = v36;
      *(_OWORD *)(v33 + 48) = v37;
      *(_OWORD *)(v33 + 64) = 0u;
      *(void *)(v33 + 64) = v109;
      *(void *)(v33 + 72) = v110;
      *(_DWORD *)(v33 + 80) = v111;
      v109 = 0;
      size_t v110 = 0;
      int v111 = 0;
      uint64_t v38 = v33 + 96;
    }
    *(void *)&buf[8] = v38;
    free(v34);
  }
  v40 = [v90 earCaptureUpdateData];
  v41 = [v40 result];
  v42 = [v41 leftEarFrames];

  v43 = [v90 earCaptureUpdateData];
  v44 = [v43 result];
  v45 = [v44 rightEarFrames];

  for (unint64_t j = 0; j < [v42 count]; ++j)
  {
    v47 = [v42 objectAtIndexedSubscript:j];
    uint64_t v48 = [v47 rgbImage];
    v49 = [v42 objectAtIndexedSubscript:j];
    uint64_t v50 = [v49 depthImage];
    v51 = [v42 objectAtIndexedSubscript:j];
    [v51 earBox];
    long long v53 = v99;
    if ((unint64_t)v99 >= *((void *)&v99 + 1))
    {
      long long v95 = v52;
      uint64_t v55 = (uint64_t)(v99 - *((void *)&v98 + 1)) >> 5;
      unint64_t v56 = v55 + 1;
      if ((unint64_t)(v55 + 1) >> 59) {
        std::vector<vg::hrtf::FaceFrameData>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v57 = *((void *)&v99 + 1) - *((void *)&v98 + 1);
      if ((uint64_t)(*((void *)&v99 + 1) - *((void *)&v98 + 1)) >> 4 > v56) {
        unint64_t v56 = v57 >> 4;
      }
      if ((unint64_t)v57 >= 0x7FFFFFFFFFFFFFE0) {
        unint64_t v58 = 0x7FFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v58 = v56;
      }
      *(void *)&long long v107 = (char *)&v99 + 8;
      v59 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<vg::hrtf::EarFrameData>>((uint64_t)&v99 + 8, v58);
      v60 = &v59[32 * v55];
      *(void *)&long long v105 = v59;
      *((void *)&v105 + 1) = v60;
      *((void *)&v106 + 1) = &v59[32 * v61];
      *(void *)v60 = v48;
      *((void *)v60 + 1) = v50;
      *((_OWORD *)v60 + 1) = v95;
      *(void *)&long long v106 = v60 + 32;
      std::vector<vg::hrtf::EarFrameData>::__swap_out_circular_buffer((uint64_t *)&v98 + 1, &v105);
      uint64_t v54 = v99;
      std::__split_buffer<vg::hrtf::EarFrameData>::~__split_buffer((uint64_t)&v105);
    }
    else
    {
      *(void *)long long v99 = v48;
      *(void *)(v53 + 8) = v50;
      uint64_t v54 = v53 + 32;
      *(_OWORD *)(v53 + 16) = v52;
    }
    *(void *)&long long v99 = v54;
  }
  for (unint64_t k = 0; k < [v45 count]; ++k)
  {
    v63 = [v45 objectAtIndexedSubscript:k];
    uint64_t v64 = [v63 rgbImage];
    v65 = [v45 objectAtIndexedSubscript:k];
    uint64_t v66 = [v65 depthImage];
    v67 = [v45 objectAtIndexedSubscript:k];
    [v67 earBox];
    uint64_t v69 = *((void *)&v100 + 1);
    if ((void *)*((void *)&v100 + 1) >= __p[0])
    {
      long long v96 = v68;
      uint64_t v71 = (uint64_t)(*((void *)&v100 + 1) - v100) >> 5;
      unint64_t v72 = v71 + 1;
      if ((unint64_t)(v71 + 1) >> 59) {
        std::vector<vg::hrtf::FaceFrameData>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v73 = (uint64_t)__p[0] - v100;
      if ((uint64_t)((uint64_t)__p[0] - v100) >> 4 > v72) {
        unint64_t v72 = v73 >> 4;
      }
      if ((unint64_t)v73 >= 0x7FFFFFFFFFFFFFE0) {
        unint64_t v74 = 0x7FFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v74 = v72;
      }
      *(void *)&long long v107 = __p;
      v75 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<vg::hrtf::EarFrameData>>((uint64_t)__p, v74);
      v76 = &v75[32 * v71];
      *(void *)&long long v105 = v75;
      *((void *)&v105 + 1) = v76;
      *((void *)&v106 + 1) = &v75[32 * v77];
      *(void *)v76 = v64;
      *((void *)v76 + 1) = v66;
      *((_OWORD *)v76 + 1) = v96;
      *(void *)&long long v106 = v76 + 32;
      std::vector<vg::hrtf::EarFrameData>::__swap_out_circular_buffer((uint64_t *)&v100, &v105);
      uint64_t v70 = *((void *)&v100 + 1);
      std::__split_buffer<vg::hrtf::EarFrameData>::~__split_buffer((uint64_t)&v105);
    }
    else
    {
      **((void **)&v100 + 1) = v64;
      *(void *)(v69 + 8) = v66;
      uint64_t v70 = v69 + 32;
      *(_OWORD *)(v69 + 16) = v68;
    }
    *((void *)&v100 + 1) = v70;
  }
  version = self->_version;
  if (version) {
    v79 = [(NSString *)version UTF8String];
  }
  else {
    v79 = "";
  }
  std::string::__assign_external((std::string *)&__p[1], v79);
  LOBYTE(v105) = 0;
  BYTE8(v106) = 0;
  debugPath = self->_debugPath;
  if (debugPath)
  {
    memptr[0] = (void *)[(NSString *)debugPath UTF8String];
    std::optional<std::string>::operator=[abi:ne180100]<char const*,void>((std::string *)&v105, (std::string::value_type **)memptr);
  }
  v84 = vg::hrtf::HRTFModel::predict(v103, (const vg::hrtf::HRTFModelInputs *)buf, (uint64_t)&v105);
  if (v84)
  {
    [v86 setState:1];
    [v86 setResult:v84];
    v85 = __VGLogSharedInstance();
    if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(memptr[0]) = 0;
      _os_log_impl(&dword_260C8D000, v85, OS_LOG_TYPE_DEBUG, " Successfully finished HRTF model processing ", (uint8_t *)memptr, 2u);
    }

    self->_finished = 1;
    id v80 = v86;
  }
  else
  {
    vg::hrtf::setError(a4, @"Failed to predict HRTF results.");
    id v80 = 0;
  }

  if (BYTE8(v106) && SBYTE7(v106) < 0) {
    operator delete((void *)v105);
  }

  if (SHIBYTE(v102) < 0) {
    operator delete(__p[1]);
  }
  *(void *)&long long v105 = &v100;
  std::vector<vg::hrtf::EarFrameData>::__destroy_vector::operator()[abi:ne180100]((void ***)&v105);
  *(void *)&long long v105 = (char *)&v98 + 8;
  std::vector<vg::hrtf::EarFrameData>::__destroy_vector::operator()[abi:ne180100]((void ***)&v105);
  *(void *)&long long v105 = buf;
  std::vector<vg::hrtf::FaceFrameData>::__destroy_vector::operator()[abi:ne180100]((void ***)&v105);
  id v5 = v86;
LABEL_52:
  v81 = (void ***)v103;
  v103 = 0;
  if (v81)
  {
    vg::hrtf::HRTFModel::~HRTFModel(v81);
    MEMORY[0x2612278D0]();
  }

  return v80;
}

- (BOOL)finished
{
  return self->_finished;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_modelsRootPath, 0);

  objc_storeStrong((id *)&self->_debugPath, 0);
}

@end