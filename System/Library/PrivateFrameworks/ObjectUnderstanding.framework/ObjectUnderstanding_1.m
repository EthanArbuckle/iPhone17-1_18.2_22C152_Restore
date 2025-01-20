float OU3DObjectRGBSizeRefiner::ComputeOverlapScore<float>(int a1, void *a2, uint64_t *a3, box3d *a4)
{
  uint64_t v4;
  uint64_t v5;
  float v6;
  float v7;
  double v8;
  float v9;

  v4 = 0;
  v5 = *a3;
  v6 = 0.0;
  do
  {
    if (*(unsigned char *)(v5 + v4))
    {
      v7 = *(float *)(*a2 + 4 * v4);
      if (v7 != 0.0) {
        v6 = v6 + (float)((float)(v7 * (float)*(unsigned __int8 *)(v5 + v4)) / 255.0);
      }
    }
    ++v4;
  }
  while (v4 != 49152);
  v8 = v6;
  v9 = boxVolume(a4);
  return v8 / (pow(v9, 0.125) * 10000.0);
}

float OU3DObjectRGBSizeRefiner::ComputeOverlapScore<unsigned char>(int a1, void *a2, uint64_t *a3, box3d *a4)
{
  uint64_t v4 = 0;
  uint64_t v5 = *a3;
  float v6 = 0.0;
  do
  {
    unsigned int v7 = *(unsigned __int8 *)(*a2 + v4);
    if (*(unsigned char *)(v5 + v4)) {
      BOOL v8 = v7 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (!v8) {
      float v6 = v6 + (float)((float)((float)*(unsigned __int8 *)(v5 + v4) * (float)v7) / 255.0);
    }
    ++v4;
  }
  while (v4 != 49152);
  double v9 = v6;
  float v10 = boxVolume(a4);
  return v9 / (pow(v10, 0.125) * 10000.0);
}

uint64_t OUTLINED_FUNCTION_0_3(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2080;
  *(void *)(a3 + 14) = a2;
  return result;
}

void OUTLINED_FUNCTION_1_1(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_debug_impl(a1, a4, OS_LOG_TYPE_DEBUG, a2, a3, 0x16u);
}

void *utils::OUImageUtils::ResizeImageRGBA(utils::OUImageUtils *this, CVPixelBufferRef pixelBuffer, int a3)
{
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(pixelBuffer);
  OSType v6 = PixelFormatType;
  if (PixelFormatType != 1111970369 && PixelFormatType != 1380401729)
  {
    v12 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      utils::OUImageUtils::ResizeImageRGBA();
    }
    goto LABEL_20;
  }
  kdebug_trace();
  float Width = (float)CVPixelBufferGetWidth(pixelBuffer);
  size_t Height = CVPixelBufferGetHeight(pixelBuffer);
  float v9 = (float)Height;
  if (Width > (float)Height) {
    unint64_t v10 = (unint64_t)(float)((float)(Width / (float)Height) * (float)a3);
  }
  else {
    unint64_t v10 = a3;
  }
  if (Width > (float)Height) {
    unint64_t v11 = a3;
  }
  else {
    unint64_t v11 = (unint64_t)(float)((float)((float)Height / Width) * (float)a3);
  }
  if (MEMORY[0x237E2D090](&dest, v11, v10, 32, 0))
  {
    v12 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      utils::OUImageUtils::ResizeImageRGBA();
    }
LABEL_20:

    return 0;
  }
  CVPixelBufferLockBaseAddress(pixelBuffer, 0);
  *(_DWORD *)color = -16777216;
  vImageBufferFill_ARGB8888(&dest, color, 0);
  src.data = CVPixelBufferGetBaseAddress(pixelBuffer);
  src.height = (unint64_t)v9;
  src.width = (unint64_t)Width;
  src.rowBytes = CVPixelBufferGetBytesPerRow(pixelBuffer);
  if (vImageScale_ARGB8888(&src, &dest, 0, 0))
  {
    v12 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      utils::OUImageUtils::ResizeImageRGBA();
    }
    goto LABEL_20;
  }
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 1uLL);
  src.data = 0;
  if (CVPixelBufferCreateWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB08], dest.width, dest.height, v6, dest.data, dest.rowBytes, 0, 0, 0, (CVPixelBufferRef *)&src))
  {
    free(dest.data);
    v12 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      utils::OUImageUtils::ResizeImageRGBA();
    }
    goto LABEL_20;
  }
  kdebug_trace();
  return src.data;
}

CVPixelBufferRef utils::OUImageUtils::SquareCropImage(void **a1, __CVBuffer *a2, unsigned int a3, double a4, int32x2_t a5)
{
  int v5 = LODWORD(a4);
  int v6 = HIDWORD(a4);
  __int32 v7 = a5.i32[0];
  __int32 v8 = a5.i32[1];
  if ((LODWORD(a4) | a5.i32[0] | HIDWORD(a4) | a5.i32[1]) < 0) {
    return 0;
  }
  kdebug_trace();
  unsigned __int32 v12 = v7 - v8;
  if (v7 - v8 < 0) {
    unsigned __int32 v12 = v8 - v7;
  }
  unsigned __int32 v13 = v12 >> 1;
  HIDWORD(v14) = HIDWORD(a4);
  LODWORD(v15) = LODWORD(a4);
  HIDWORD(v15) = v13 + v6;
  double v16 = COERCE_DOUBLE(vdup_lane_s32(a5, 0));
  LODWORD(v14) = v13 + v5;
  double v17 = v14;
  double v18 = COERCE_DOUBLE(vdup_lane_s32(a5, 1));
  if (v7 > v8)
  {
    double v16 = v18;
    double v15 = v17;
  }
  CVPixelBufferRef v19 = utils::OUImageUtils::CropAndResizeImage(a1, a2, v15, v16, COERCE_DOUBLE(vdup_n_s32(a3)));
  if (!v20) {
    std::__throw_bad_optional_access[abi:ne180100]();
  }
  CVPixelBufferRef v21 = v19;
  kdebug_trace();
  return v21;
}

CVPixelBufferRef utils::OUImageUtils::CropAndResizeImage(void **a1, CVPixelBufferRef pixelBuffer, double a3, double a4, double a5)
{
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(pixelBuffer);
  OSType v9 = PixelFormatType;
  int v10 = 4;
  if (PixelFormatType != 1380401729 && PixelFormatType != 1111970369)
  {
    if (PixelFormatType != 24)
    {
      double v16 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        utils::OUImageUtils::CropAndResizeImage();
      }
      goto LABEL_14;
    }
    int v10 = 3;
  }
  CVPixelBufferLockBaseAddress(pixelBuffer, 1uLL);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
  int BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
  v13.i64[0] = SLODWORD(a4);
  v13.i64[1] = SHIDWORD(a4);
  *(int8x16_t *)&src.height = vextq_s8(v13, v13, 8uLL);
  src.rowBytes = BytesPerRow;
  src.data = &BaseAddress[v10 * LODWORD(a3) + HIDWORD(a3) * BytesPerRow];
  dest.data = utils::OUImageUtils::FindOrCreateBuffer((utils::OUImageUtils *)a1, SLODWORD(a5), SHIDWORD(a5), v10);
  dest.height = SHIDWORD(a5);
  dest.width = SLODWORD(a5);
  dest.rowBytes = v10 * (uint64_t)SLODWORD(a5);
  vImage_Error v14 = vImageScale_ARGB8888(&src, &dest, a1[3], 0);
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 1uLL);
  if (v14)
  {
    double v15 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      utils::OUImageUtils::CropAndResizeImage(v14, v15);
    }

    free(dest.data);
    return 0;
  }
  CVPixelBufferRef v20 = 0;
  if (CVPixelBufferCreateWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB08], SLODWORD(a5), SHIDWORD(a5), v9, dest.data, dest.rowBytes, 0, 0, 0, &v20))
  {
    free(dest.data);
    double v16 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      utils::OUImageUtils::CropAndResizeImage();
    }
LABEL_14:

    return 0;
  }
  return v20;
}

CVPixelBufferRef utils::OUImageUtils::CropImage(void **a1, __CVBuffer *a2, double a3, double a4)
{
  kdebug_trace();
  CVPixelBufferRef v8 = utils::OUImageUtils::CropAndResizeImage(a1, a2, a3, a4, a4);
  kdebug_trace();
  return v8;
}

void *utils::OUImageUtils::FindOrCreateBuffer(utils::OUImageUtils *this, uint64_t a2, uint64_t a3, uint64_t a4)
{
  for (i = *(void **)this; i != *((void **)this + 1); i += 4)
  {
    OSType v9 = (void *)i[3];
    if (*i == a2 && i[1] == a3 && i[2] == a4 && v9 != 0) {
      return v9;
    }
  }
  OSType v9 = malloc_type_malloc(a3 * a2 * a4, 0xDE1DA6C3uLL);
  unint64_t v13 = *((void *)this + 2);
  vImage_Error v14 = (void *)*((void *)this + 1);
  if ((unint64_t)v14 >= v13)
  {
    uint64_t v16 = ((uint64_t)v14 - *(void *)this) >> 5;
    unint64_t v17 = v16 + 1;
    if ((unint64_t)(v16 + 1) >> 59) {
      std::vector<float>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v18 = v13 - *(void *)this;
    if (v18 >> 4 > v17) {
      unint64_t v17 = v18 >> 4;
    }
    if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFE0) {
      unint64_t v19 = 0x7FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v19 = v17;
    }
    if (v19) {
      CVPixelBufferRef v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<utils::OUImageUtils::PreAllocateInfo>>((uint64_t)this + 16, v19);
    }
    else {
      CVPixelBufferRef v20 = 0;
    }
    CVPixelBufferRef v21 = &v20[32 * v16];
    v22 = &v20[32 * v19];
    *(void *)CVPixelBufferRef v21 = a2;
    *((void *)v21 + 1) = a3;
    *((void *)v21 + 2) = a4;
    *((void *)v21 + 3) = v9;
    double v15 = v21 + 32;
    v24 = *(char **)this;
    v23 = (char *)*((void *)this + 1);
    if (v23 != *(char **)this)
    {
      do
      {
        long long v25 = *((_OWORD *)v23 - 1);
        *((_OWORD *)v21 - 2) = *((_OWORD *)v23 - 2);
        *((_OWORD *)v21 - 1) = v25;
        v21 -= 32;
        v23 -= 32;
      }
      while (v23 != v24);
      v23 = *(char **)this;
    }
    *(void *)this = v21;
    *((void *)this + 1) = v15;
    *((void *)this + 2) = v22;
    if (v23) {
      operator delete(v23);
    }
  }
  else
  {
    *vImage_Error v14 = a2;
    v14[1] = a3;
    double v15 = v14 + 4;
    v14[2] = a4;
    v14[3] = v9;
  }
  *((void *)this + 1) = v15;
  return v9;
}

uint64_t utils::ConvertCVPixelBuffer(__CVBuffer *a1, __CVBuffer *a2, uint64_t a3)
{
  CVPixelBufferLockBaseAddress(a1, 1uLL);
  CVPixelBufferLockBaseAddress(a2, 0);
  utils::ConvertCVPixelBuffer(__CVBuffer *,__CVBuffer *,std::function<long ()(vImage_Buffer const*,vImage_Buffer const*)> const&)::$_0::operator()(a1, v9);
  utils::ConvertCVPixelBuffer(__CVBuffer *,__CVBuffer *,std::function<long ()(vImage_Buffer const*,vImage_Buffer const*)> const&)::$_0::operator()(a2, __p);
  uint64_t v6 = std::function<long ()(vImage_Buffer const*,vImage_Buffer const*)>::operator()(a3, (uint64_t)v9[0], (uint64_t)__p[0]);
  CVPixelBufferUnlockBaseAddress(a1, 1uLL);
  CVPixelBufferUnlockBaseAddress(a2, 0);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v9[0])
  {
    v9[1] = v9[0];
    operator delete(v9[0]);
  }
  return v6;
}

void sub_237CA218C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *utils::ConvertCVPixelBuffer(__CVBuffer *,__CVBuffer *,std::function<long ()(vImage_Buffer const*,vImage_Buffer const*)> const&)::$_0::operator()@<X0>(__CVBuffer *a1@<X0>, void *a2@<X8>)
{
  if (CVPixelBufferIsPlanar(a1))
  {
    size_t PlaneCount = CVPixelBufferGetPlaneCount(a1);
    result = std::vector<vImage_Buffer>::vector(a2, PlaneCount);
    if (!PlaneCount) {
      return result;
    }
  }
  else
  {
    size_t PlaneCount = 1;
    std::vector<vImage_Buffer>::vector(a2, 1uLL);
  }
  uint64_t v6 = 0;
  for (size_t i = 0; i != PlaneCount; ++i)
  {
    *(void *)(*a2 + v6 + 16) = CVPixelBufferGetWidthOfPlane(a1, i);
    *(void *)(*a2 + v6 + 8) = CVPixelBufferGetHeightOfPlane(a1, i);
    *(void *)(*a2 + v6 + 24) = CVPixelBufferGetBytesPerRowOfPlane(a1, i);
    result = CVPixelBufferGetBaseAddressOfPlane(a1, i);
    *(void *)(*a2 + v6) = result;
    v6 += 32;
  }
  return result;
}

void sub_237CA22A0(_Unwind_Exception *exception_object)
{
  v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::function<long ()(vImage_Buffer const*,vImage_Buffer const*)>::operator()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a3;
  uint64_t v6 = a2;
  uint64_t v3 = *(void *)(a1 + 24);
  if (!v3) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t *))(*(void *)v3 + 48))(v3, &v6, &v5);
}

uint64_t utils::ConvertDepthF32ToU16(utils *this, CVPixelBufferRef *a2, __CVBuffer **a3)
{
  v8[4] = *MEMORY[0x263EF8340];
  uint64_t v5 = *a2;
  v8[0] = &unk_26EAD68E0;
  v8[3] = v8;
  uint64_t v6 = utils::ConvertCVPixelBuffer(this, v5, (uint64_t)v8);
  std::__function::__value_func<long ()(vImage_Buffer const*,vImage_Buffer const*)>::~__value_func[abi:ne180100](v8);
  return v6;
}

void sub_237CA23C8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__function::__value_func<long ()(vImage_Buffer const*,vImage_Buffer const*)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

CVPixelBufferRef utils::anonymous namespace'::CheckCVPixelBuffers(utils::_anonymous_namespace_ *this, __CVBuffer *a2, CVPixelBufferRef *a3, __CVBuffer **a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (!this)
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::invalid_argument::invalid_argument[abi:ne180100](exception, "Invalid in_buffer.");
    __cxa_throw(exception, (struct type_info *)off_264CFAB20, MEMORY[0x263F8C080]);
  }
  int v4 = (int)a4;
  if (CVPixelBufferGetPixelFormatType(this) != a2)
  {
    vImage_Error v14 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {

    }
    double v15 = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::invalid_argument::invalid_argument[abi:ne180100](v15, (const char *)&unk_237CC3E0E);
    __cxa_throw(v15, (struct type_info *)off_264CFAB20, MEMORY[0x263F8C080]);
  }
  if (*a3)
  {
    CVPixelBufferRef result = (CVPixelBufferRef)CVPixelBufferGetPixelFormatType(*a3);
    if (result != v4)
    {
      CVPixelBufferRef v8 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {

      }
      OSType v9 = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
      std::invalid_argument::invalid_argument[abi:ne180100](v9, (const char *)&unk_237CC3E0E);
      __cxa_throw(v9, (struct type_info *)off_264CFAB20, MEMORY[0x263F8C080]);
    }
  }
  else
  {
    int v10 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v16 = 136315138;
      unint64_t v17 = "OUImageUtils";
      _os_log_impl(&dword_237C17000, v10, OS_LOG_TYPE_INFO, "[%s] creating out_buffer; user is responsible to release the buffer.",
        (uint8_t *)&v16,
        0xCu);
    }

    size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(this, 0);
    size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(this, 0);
    CVPixelBufferRef result = CreateCVPixelBuffer(WidthOfPlane, HeightOfPlane);
    *a3 = result;
  }
  return result;
}

void sub_237CA25F0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t utils::ConvertColor32BGRATo420f(utils *this, CVPixelBufferRef *a2, __CVBuffer **a3)
{
  v11[4] = *MEMORY[0x263EF8340];
  vImage_YpCbCrPixelRange v10 = *(vImage_YpCbCrPixelRange *)ymmword_237CB64A0;
  if (!byte_268947290)
  {
    uint64_t v5 = (const vImage_ARGBToYpCbCrMatrix *)*MEMORY[0x263EFAA18];
    utils::ConvertColor32BGRATo420f(__CVBuffer *,__CVBuffer *&)::conversion_info = 0u;
    unk_268947220 = 0u;
    xmmword_268947230 = 0u;
    unk_268947240 = 0u;
    xmmword_268947250 = 0u;
    unk_268947260 = 0u;
    xmmword_268947270 = 0u;
    unk_268947280 = 0u;
    byte_268947290 = 1;
    if (vImageConvert_ARGBToYpCbCr_GenerateConversion(v5, &v10, (vImage_ARGBToYpCbCr *)&utils::ConvertColor32BGRATo420f(__CVBuffer *,__CVBuffer *&)::conversion_info, kvImageARGB8888, kvImage420Yp8_CbCr8, 0))
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x237E2C1F0](exception, "failed to create conversion info.");
      __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
    }
  }
  uint64_t v6 = *a2;
  v11[0] = &unk_26EAD6970;
  v11[3] = v11;
  uint64_t v7 = utils::ConvertCVPixelBuffer(this, v6, (uint64_t)v11);
  std::__function::__value_func<long ()(vImage_Buffer const*,vImage_Buffer const*)>::~__value_func[abi:ne180100](v11);
  return v7;
}

void sub_237CA2768(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  __cxa_free_exception(v14);
  _Unwind_Resume(a1);
}

uint64_t utils::ConvertColor420fTo32BGRA(utils *this, CVPixelBufferRef *a2, __CVBuffer **a3)
{
  v11[4] = *MEMORY[0x263EF8340];
  vImage_YpCbCrPixelRange v10 = *(vImage_YpCbCrPixelRange *)ymmword_237CB64A0;
  if (!byte_268947320)
  {
    uint64_t v5 = (const vImage_YpCbCrToARGBMatrix *)*MEMORY[0x263EFAA30];
    utils::ConvertColor420fTo32BGRA(__CVBuffer *,__CVBuffer *&)::conversion_info = 0u;
    *(_OWORD *)algn_2689472B0 = 0u;
    xmmword_2689472C0 = 0u;
    unk_2689472D0 = 0u;
    xmmword_2689472E0 = 0u;
    unk_2689472F0 = 0u;
    xmmword_268947300 = 0u;
    unk_268947310 = 0u;
    byte_268947320 = 1;
    if (vImageConvert_YpCbCrToARGB_GenerateConversion(v5, &v10, (vImage_YpCbCrToARGB *)&utils::ConvertColor420fTo32BGRA(__CVBuffer *,__CVBuffer *&)::conversion_info, kvImage420Yp8_CbCr8, kvImageARGB8888, 0))
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x237E2C1F0](exception, "failed to create conversion info.");
      __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
    }
  }
  uint64_t v6 = *a2;
  v11[0] = &unk_26EAD69F0;
  v11[3] = v11;
  uint64_t v7 = utils::ConvertCVPixelBuffer(this, v6, (uint64_t)v11);
  std::__function::__value_func<long ()(vImage_Buffer const*,vImage_Buffer const*)>::~__value_func[abi:ne180100](v11);
  return v7;
}

void sub_237CA28E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  __cxa_free_exception(v14);
  _Unwind_Resume(a1);
}

uint64_t utils::ConvertLabelL008To32BGRA(utils *this, CVPixelBufferRef *a2, __CVBuffer **a3)
{
  CVPixelBufferLockBaseAddress(this, 1uLL);
  CVPixelBufferLockBaseAddress(*a2, 0);
  BaseAddress = CVPixelBufferGetBaseAddress(this);
  uint64_t v6 = (char *)CVPixelBufferGetBaseAddress(*a2);
  size_t Width = CVPixelBufferGetWidth(this);
  size_t Height = CVPixelBufferGetHeight(this);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(this);
  size_t v10 = CVPixelBufferGetBytesPerRow(*a2);
  bzero(v6, v10 * Height);
  if (Height)
  {
    for (uint64_t i = 0; i != Height; ++i)
    {
      if (Width)
      {
        uint64_t v12 = 0;
        uint64_t v13 = 2;
        do
        {
          v6[v13] = BaseAddress[v12++];
          v13 += 4;
        }
        while (Width != v12);
      }
      BaseAddress += BytesPerRow;
      v6 += v10;
    }
  }
  CVPixelBufferUnlockBaseAddress(this, 1uLL);
  vImage_Error v14 = *a2;
  return CVPixelBufferUnlockBaseAddress(v14, 0);
}

uint64_t utils::ConvertConfidenceL00fToVote32BGRA(utils *this, CVPixelBufferRef *a2, __CVBuffer **a3)
{
  CVPixelBufferLockBaseAddress(this, 1uLL);
  CVPixelBufferLockBaseAddress(*a2, 0);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(this);
  uint64_t v6 = (char *)CVPixelBufferGetBaseAddress(*a2);
  size_t Width = CVPixelBufferGetWidth(this);
  size_t Height = CVPixelBufferGetHeight(this);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(this);
  size_t v10 = CVPixelBufferGetBytesPerRow(*a2);
  bzero(v6, v10 * Height);
  if (Height)
  {
    for (uint64_t i = 0; i != Height; ++i)
    {
      if (Width)
      {
        uint64_t v12 = 0;
        size_t v13 = Width;
        do
        {
          if (*(float *)&BaseAddress[v12] > 0.0) {
            v6[v12 + 2] = 1;
          }
          v12 += 4;
          --v13;
        }
        while (v13);
      }
      BaseAddress += BytesPerRow;
      v6 += v10;
    }
  }
  CVPixelBufferUnlockBaseAddress(this, 1uLL);
  vImage_Error v14 = *a2;
  return CVPixelBufferUnlockBaseAddress(v14, 0);
}

void utils::WriteToTiff(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v14 = a5;
  OSType v9 = NSURL;
  if (*((char *)a2 + 23) >= 0) {
    size_t v10 = a2;
  }
  else {
    size_t v10 = (uint64_t *)*a2;
  }
  unint64_t v11 = [NSString stringWithUTF8String:v10];
  uint64_t v12 = [v9 fileURLWithPath:v11];

  size_t v13 = [MEMORY[0x263F00650] imageWithCVPixelBuffer:a1];
  [v14 writeTIFFRepresentationOfImage:v13 toURL:v12 format:a3 colorSpace:a4 options:MEMORY[0x263EFFA78] error:0];
}

void sub_237CA2C58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<utils::OUImageUtils::PreAllocateInfo>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(32 * a2);
}

void *std::vector<vImage_Buffer>::vector(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<vImage_Buffer>::__vallocate[abi:ne180100](a1, a2);
    int v4 = (char *)a1[1];
    bzero(v4, 32 * a2);
    a1[1] = &v4[32 * a2];
  }
  return a1;
}

void sub_237CA2D24(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<vImage_Buffer>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 59) {
    std::vector<float>::__throw_length_error[abi:ne180100]();
  }
  CVPixelBufferRef result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<utils::OUImageUtils::PreAllocateInfo>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[32 * v4];
  return result;
}

void std::__function::__func<utils::ConvertDepthF32ToU16(__CVBuffer *,__CVBuffer *&)::$_0,std::allocator<utils::ConvertDepthF32ToU16(__CVBuffer *,__CVBuffer *&)::$_0>,long ()(vImage_Buffer const*,vImage_Buffer const*)>::~__func()
{
}

void *std::__function::__func<utils::ConvertDepthF32ToU16(__CVBuffer *,__CVBuffer *&)::$_0,std::allocator<utils::ConvertDepthF32ToU16(__CVBuffer *,__CVBuffer *&)::$_0>,long ()(vImage_Buffer const*,vImage_Buffer const*)>::__clone()
{
  CVPixelBufferRef result = operator new(0x10uLL);
  void *result = &unk_26EAD68E0;
  return result;
}

void std::__function::__func<utils::ConvertDepthF32ToU16(__CVBuffer *,__CVBuffer *&)::$_0,std::allocator<utils::ConvertDepthF32ToU16(__CVBuffer *,__CVBuffer *&)::$_0>,long ()(vImage_Buffer const*,vImage_Buffer const*)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26EAD68E0;
}

vImage_Error std::__function::__func<utils::ConvertDepthF32ToU16(__CVBuffer *,__CVBuffer *&)::$_0,std::allocator<utils::ConvertDepthF32ToU16(__CVBuffer *,__CVBuffer *&)::$_0>,long ()(vImage_Buffer const*,vImage_Buffer const*)>::operator()(uint64_t a1, const vImage_Buffer **a2, const vImage_Buffer **a3)
{
  return vImageConvert_FTo16U(*a2, *a3, 0.0, 0.001, 0);
}

uint64_t std::__function::__func<utils::ConvertDepthF32ToU16(__CVBuffer *,__CVBuffer *&)::$_0,std::allocator<utils::ConvertDepthF32ToU16(__CVBuffer *,__CVBuffer *&)::$_0>,long ()(vImage_Buffer const*,vImage_Buffer const*)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<utils::ConvertDepthF32ToU16(__CVBuffer *,__CVBuffer *&)::$_0,std::allocator<utils::ConvertDepthF32ToU16(__CVBuffer *,__CVBuffer *&)::$_0>,long ()(vImage_Buffer const*,vImage_Buffer const*)>::target_type()
{
}

void *std::__function::__value_func<long ()(vImage_Buffer const*,vImage_Buffer const*)>::~__value_func[abi:ne180100](void *a1)
{
  v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void std::__function::__func<utils::ConvertColor32BGRATo420f(__CVBuffer *,__CVBuffer *&)::$_0,std::allocator<utils::ConvertColor32BGRATo420f(__CVBuffer *,__CVBuffer *&)::$_0>,long ()(vImage_Buffer const*,vImage_Buffer const*)>::~__func()
{
}

void *std::__function::__func<utils::ConvertColor32BGRATo420f(__CVBuffer *,__CVBuffer *&)::$_0,std::allocator<utils::ConvertColor32BGRATo420f(__CVBuffer *,__CVBuffer *&)::$_0>,long ()(vImage_Buffer const*,vImage_Buffer const*)>::__clone()
{
  CVPixelBufferRef result = operator new(0x10uLL);
  void *result = &unk_26EAD6970;
  return result;
}

void std::__function::__func<utils::ConvertColor32BGRATo420f(__CVBuffer *,__CVBuffer *&)::$_0,std::allocator<utils::ConvertColor32BGRATo420f(__CVBuffer *,__CVBuffer *&)::$_0>,long ()(vImage_Buffer const*,vImage_Buffer const*)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26EAD6970;
}

vImage_Error std::__function::__func<utils::ConvertColor32BGRATo420f(__CVBuffer *,__CVBuffer *&)::$_0,std::allocator<utils::ConvertColor32BGRATo420f(__CVBuffer *,__CVBuffer *&)::$_0>,long ()(vImage_Buffer const*,vImage_Buffer const*)>::operator()(uint64_t a1, const vImage_Buffer **a2, const vImage_Buffer **a3)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *a3;
  *(_DWORD *)permuteMap = 66051;
  if (!byte_268947290) {
    std::__throw_bad_optional_access[abi:ne180100]();
  }
  return vImageConvert_ARGB8888To420Yp8_CbCr8(v3, v4, v4 + 1, (const vImage_ARGBToYpCbCr *)&utils::ConvertColor32BGRATo420f(__CVBuffer *,__CVBuffer *&)::conversion_info, permuteMap, 0);
}

uint64_t std::__function::__func<utils::ConvertColor32BGRATo420f(__CVBuffer *,__CVBuffer *&)::$_0,std::allocator<utils::ConvertColor32BGRATo420f(__CVBuffer *,__CVBuffer *&)::$_0>,long ()(vImage_Buffer const*,vImage_Buffer const*)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<utils::ConvertColor32BGRATo420f(__CVBuffer *,__CVBuffer *&)::$_0,std::allocator<utils::ConvertColor32BGRATo420f(__CVBuffer *,__CVBuffer *&)::$_0>,long ()(vImage_Buffer const*,vImage_Buffer const*)>::target_type()
{
}

void std::__function::__func<utils::ConvertColor420fTo32BGRA(__CVBuffer *,__CVBuffer *&)::$_0,std::allocator<utils::ConvertColor420fTo32BGRA(__CVBuffer *,__CVBuffer *&)::$_0>,long ()(vImage_Buffer const*,vImage_Buffer const*)>::~__func()
{
}

void *std::__function::__func<utils::ConvertColor420fTo32BGRA(__CVBuffer *,__CVBuffer *&)::$_0,std::allocator<utils::ConvertColor420fTo32BGRA(__CVBuffer *,__CVBuffer *&)::$_0>,long ()(vImage_Buffer const*,vImage_Buffer const*)>::__clone()
{
  CVPixelBufferRef result = operator new(0x10uLL);
  void *result = &unk_26EAD69F0;
  return result;
}

void std::__function::__func<utils::ConvertColor420fTo32BGRA(__CVBuffer *,__CVBuffer *&)::$_0,std::allocator<utils::ConvertColor420fTo32BGRA(__CVBuffer *,__CVBuffer *&)::$_0>,long ()(vImage_Buffer const*,vImage_Buffer const*)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26EAD69F0;
}

vImage_Error std::__function::__func<utils::ConvertColor420fTo32BGRA(__CVBuffer *,__CVBuffer *&)::$_0,std::allocator<utils::ConvertColor420fTo32BGRA(__CVBuffer *,__CVBuffer *&)::$_0>,long ()(vImage_Buffer const*,vImage_Buffer const*)>::operator()(uint64_t a1, const vImage_Buffer **a2, const vImage_Buffer **a3)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *a3;
  *(_DWORD *)permuteMap = 66051;
  if (!byte_268947320) {
    std::__throw_bad_optional_access[abi:ne180100]();
  }
  return vImageConvert_420Yp8_CbCr8ToARGB8888(v3, v3 + 1, v4, (const vImage_YpCbCrToARGB *)&utils::ConvertColor420fTo32BGRA(__CVBuffer *,__CVBuffer *&)::conversion_info, permuteMap, 0xFFu, 0);
}

uint64_t std::__function::__func<utils::ConvertColor420fTo32BGRA(__CVBuffer *,__CVBuffer *&)::$_0,std::allocator<utils::ConvertColor420fTo32BGRA(__CVBuffer *,__CVBuffer *&)::$_0>,long ()(vImage_Buffer const*,vImage_Buffer const*)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<utils::ConvertColor420fTo32BGRA(__CVBuffer *,__CVBuffer *&)::$_0,std::allocator<utils::ConvertColor420fTo32BGRA(__CVBuffer *,__CVBuffer *&)::$_0>,long ()(vImage_Buffer const*,vImage_Buffer const*)>::target_type()
{
}

id GenerateCIImage(void *a1)
{
  id v1 = a1;
  v2 = (void *)[objc_alloc(MEMORY[0x263F00650]) initWithMTLTexture:v1 options:0];

  return v2;
}

void sub_237CA3190(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void DownloadMTLTexture(void *a1, uint64_t *a2)
{
  id v3 = a1;
  uint64_t v4 = v3;
  if (a2)
  {
    uint64_t v5 = [v3 width];
    uint64_t v6 = [v4 height];
    uint64_t v7 = *a2;
    memset(v8, 0, 24);
    v8[3] = v5;
    v8[4] = v6;
    void v8[5] = 1;
    objc_msgSend(v4, "getBytes:bytesPerRow:fromRegion:mipmapLevel:", v7, objc_msgSend(v4, "width"), v8, 0);
  }
}

void sub_237CA322C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL IsObjectBelongType(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = a2[1];
  if (*a2 == v4)
  {
    BOOL v7 = 0;
  }
  else
  {
    uint64_t v5 = *a2 + 8;
    do
    {
      id v6 = *(id *)(v5 - 8);
      BOOL v7 = v6 == v3;
      BOOL v8 = v6 == v3 || v5 == v4;
      v5 += 8;
    }
    while (!v8);
  }

  return v7;
}

__CFString *ObjectTypeConversion(NSString *a1)
{
  id v1 = a1;
  if ([(NSString *)v1 isEqualToString:@"Shelf"]) {
    v2 = @"Cabinet";
  }
  else {
    v2 = (__CFString *)v1;
  }
  id v3 = v2;

  return v3;
}

void sub_237CA32F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t utils::OUFrameWriter::OUFrameWriter(uint64_t a1, char *a2, uint64_t a3, char a4)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v5 = (void **)(a1 + 8);
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(unsigned char *)(a1 + 32) = a4;
  id v6 = (std::__fs::filesystem::path *)(a1 + 40);
  std::__fs::filesystem::path::path[abi:ne180100]<std::string,void>((std::string *)(a1 + 40), a2);
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  BOOL v7 = (void **)(a1 + 64);
  *(void *)(a1 + 80) = 0;
  *(unsigned char *)(a1 + 96) = 0;
  *(unsigned char *)(a1 + 160) = 0;
  *(_OWORD *)(a1 + 176) = 0u;
  BOOL v8 = (void **)(a1 + 176);
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(void *)(a1 + 224) = 0;
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v21);
  buf.__pn_.__r_.__value_.__s.__data_[0] = 48;
  OSType v9 = std::operator<<[abi:ne180100]<std::char_traits<char>>(&v22, (char *)&buf);
  *(void *)((char *)v9 + *(void *)(*v9 - 24) + 24) = 8;
  std::ostream::operator<<();
  std::stringbuf::str[abi:ne180100]<std::allocator<char>>((uint64_t)v23, &buf);
  if (*(char *)(a1 + 31) < 0) {
    operator delete(*v5);
  }
  *(std::__fs::filesystem::path *)uint64_t v5 = buf;
  std::__fs::filesystem::path::append[abi:ne180100]<std::string>(&v6->__pn_, (uint64_t)v5);
  std::__fs::filesystem::path::path[abi:ne180100]<char [9],void>(&__p, "cvplayer");
  std::__fs::filesystem::operator/[abi:ne180100]((std::__fs::filesystem::path *)&__p, (uint64_t)v6, &buf);
  if (*(char *)(a1 + 87) < 0) {
    operator delete(*v7);
  }
  *(_OWORD *)BOOL v7 = *(_OWORD *)&buf.__pn_.__r_.__value_.__l.__data_;
  *(void *)(a1 + 80) = *((void *)&buf.__pn_.__r_.__value_.__l + 2);
  *((unsigned char *)&buf.__pn_.__r_.__value_.__s + 23) = 0;
  buf.__pn_.__r_.__value_.__s.__data_[0] = 0;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  std::__fs::filesystem::__status(v6, 0);
  if (buf.__pn_.__r_.__value_.__s.__data_[0] && buf.__pn_.__r_.__value_.__s.__data_[0] != 255)
  {
    size_t v10 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      std::string::size_type v11 = (std::string::size_type)v6;
      if (*(char *)(a1 + 63) < 0) {
        std::string::size_type v11 = v6->__pn_.__r_.__value_.__r.__words[0];
      }
      LODWORD(buf.__pn_.__r_.__value_.__l.__data_) = 136315394;
      *(std::string::size_type *)((char *)buf.__pn_.__r_.__value_.__r.__words + 4) = (std::string::size_type)"OUFrameWriter";
      WORD2(buf.__pn_.__r_.__value_.__r.__words[1]) = 2080;
      *(std::string::size_type *)((char *)&buf.__pn_.__r_.__value_.__r.__words[1] + 6) = v11;
      _os_log_impl(&dword_237C17000, v10, OS_LOG_TYPE_INFO, "[%s] path %s already exists; override existing dataset.",
        (uint8_t *)&buf,
        0x16u);
    }
  }
  else
  {
    if (std::__fs::filesystem::__create_directories(v6, 0)) {
      goto LABEL_17;
    }
    size_t v10 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      utils::OUFrameWriter::OUFrameWriter(a1, v6, v10);
    }
  }

LABEL_17:
  std::__fs::filesystem::path::path[abi:ne180100]<char [9],void>(&__p, "color");
  std::__fs::filesystem::operator/[abi:ne180100]((std::__fs::filesystem::path *)&__p, a1 + 64, &buf);
  std::__fs::filesystem::__create_directories(&buf, 0);
  if (SHIBYTE(buf.__pn_.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(buf.__pn_.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  std::__fs::filesystem::path::path[abi:ne180100]<char [9],void>(&__p, "depth");
  std::__fs::filesystem::operator/[abi:ne180100]((std::__fs::filesystem::path *)&__p, a1 + 64, &buf);
  std::__fs::filesystem::__create_directories(&buf, 0);
  if (SHIBYTE(buf.__pn_.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(buf.__pn_.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  std::__fs::filesystem::path::path[abi:ne180100]<char [9],void>(&__p, "label");
  std::__fs::filesystem::operator/[abi:ne180100]((std::__fs::filesystem::path *)&__p, a1 + 64, &buf);
  std::__fs::filesystem::__create_directories(&buf, 0);
  if (SHIBYTE(buf.__pn_.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(buf.__pn_.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  std::__fs::filesystem::path::path[abi:ne180100]<char [9],void>(&__p, "vote");
  std::__fs::filesystem::operator/[abi:ne180100]((std::__fs::filesystem::path *)&__p, a1 + 64, &buf);
  std::__fs::filesystem::__create_directories(&buf, 0);
  if (SHIBYTE(buf.__pn_.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(buf.__pn_.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  id v12 = objc_alloc_init(MEMORY[0x263F00628]);
  size_t v13 = *(void **)(a1 + 224);
  *(void *)(a1 + 224) = v12;

  *(void *)(a1 + 232) = CGColorSpaceCreateDeviceRGB();
  *(void *)(a1 + 240) = CGColorSpaceCreateDeviceGray();
  id v14 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  double v15 = *v8;
  *BOOL v8 = v14;

  id v16 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  unint64_t v17 = *(void **)(a1 + 184);
  *(void *)(a1 + 184) = v16;

  v21[0] = *MEMORY[0x263F8C2B8];
  uint64_t v18 = *(void *)(MEMORY[0x263F8C2B8] + 72);
  *(void *)((char *)v21 + *(void *)(v21[0] - 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
  uint64_t v22 = v18;
  v23[0] = MEMORY[0x263F8C318] + 16;
  if (v24 < 0) {
    operator delete((void *)v23[8]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x237E2C480](&v25);
  return a1;
}

void sub_237CA3820(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  if (*(char *)(v19 - 89) < 0) {
    operator delete(*(void **)(v19 - 112));
  }
  if (a14 < 0) {
    operator delete(__p);
  }
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a15);

  if (*(char *)(v15 + 87) < 0) {
    operator delete(*v18);
  }
  if (*(char *)(v15 + 63) < 0) {
    operator delete(*v17);
  }
  if (*(char *)(v15 + 31) < 0) {
    operator delete(*v16);
  }
  _Unwind_Resume(a1);
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C328] + 104;
  *(void *)(a1 + 128) = MEMORY[0x263F8C328] + 104;
  uint64_t v3 = a1 + 16;
  uint64_t v4 = MEMORY[0x263F8C328] + 64;
  *(void *)(a1 + 16) = MEMORY[0x263F8C328] + 64;
  uint64_t v5 = (void *)MEMORY[0x263F8C2B8];
  uint64_t v6 = *(void *)(MEMORY[0x263F8C2B8] + 24);
  uint64_t v7 = *(void *)(MEMORY[0x263F8C2B8] + 16);
  *(void *)a1 = v7;
  *(void *)(a1 + *(void *)(v7 - 24)) = v6;
  *(void *)(a1 + 8) = 0;
  BOOL v8 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
  std::ios_base::init(v8, (void *)(a1 + 24));
  uint64_t v9 = MEMORY[0x263F8C328] + 24;
  v8[1].__vftable = 0;
  v8[1].__fmtflags_ = -1;
  uint64_t v10 = v5[5];
  uint64_t v11 = v5[4];
  *(void *)(a1 + 16) = v11;
  *(void *)(v3 + *(void *)(v11 - 24)) = v10;
  uint64_t v12 = v5[1];
  *(void *)a1 = v12;
  *(void *)(a1 + *(void *)(v12 - 24)) = v5[6];
  *(void *)a1 = v9;
  *(void *)(a1 + 128) = v2;
  *(void *)(a1 + 16) = v4;
  std::streambuf::basic_streambuf();
  *(void *)(a1 + 24) = MEMORY[0x263F8C318] + 16;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_DWORD *)(a1 + 120) = 24;
  return a1;
}

void sub_237CA3BB0(_Unwind_Exception *a1)
{
  std::iostream::~basic_iostream();
  MEMORY[0x237E2C480](v1);
  _Unwind_Resume(a1);
}

void *std::operator<<[abi:ne180100]<std::char_traits<char>>(void *a1, char *a2)
{
  uint64_t v3 = (char *)a1 + *(void *)(*a1 - 24);
  int v4 = *a2;
  if (*((_DWORD *)v3 + 36) == -1)
  {
    std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
    uint64_t v5 = std::locale::use_facet(&v8, MEMORY[0x263F8C108]);
    int v6 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v5->__vftable[2].~facet_0)(v5, 32);
    std::locale::~locale(&v8);
    *((_DWORD *)v3 + 36) = v6;
  }
  *((_DWORD *)v3 + 36) = v4;
  return a1;
}

void sub_237CA3C8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
}

std::__fs::filesystem::path *std::__fs::filesystem::operator/[abi:ne180100]@<X0>(std::__fs::filesystem::path *this@<X1>, uint64_t a2@<X0>, std::__fs::filesystem::path *a3@<X8>)
{
  if (*(char *)(a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&a3->__pn_, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)&a3->__pn_.__r_.__value_.__l.__data_ = *(_OWORD *)a2;
    a3->__pn_.__r_.__value_.__r.__words[2] = *(void *)(a2 + 16);
  }
  return std::__fs::filesystem::path::operator/=[abi:ne180100](a3, this);
}

void sub_237CA3CF8(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C2B8];
  uint64_t v3 = *MEMORY[0x263F8C2B8];
  *(void *)a1 = *MEMORY[0x263F8C2B8];
  uint64_t v4 = *(void *)(v2 + 72);
  *(void *)(a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 64);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = MEMORY[0x263F8C318] + 16;
  if (*(char *)(a1 + 111) < 0) {
    operator delete(*(void **)(a1 + 88));
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x237E2C480](a1 + 128);
  return a1;
}

void utils::OUFrameWriter::~OUFrameWriter(utils::OUFrameWriter *this)
{
  if (*((char *)this + 87) < 0) {
    operator delete(*((void **)this + 8));
  }
  if (*((char *)this + 63) < 0) {
    operator delete(*((void **)this + 5));
  }
  if (*((char *)this + 31) < 0) {
    operator delete(*((void **)this + 1));
  }
}

void utils::OUFrameWriter::Write(utils::OUFrameWriter *a1, void *a2, void *a3)
{
  uint64_t v7 = a2;
  id v5 = a3;
  unint64_t v6 = *(void *)a1 + 1;
  *(void *)a1 = v6;
  utils::OUFrameWriter::WriteFrame(a1, v7, v6);
  utils::OUFrameWriter::WriteKeyframe(a1, v5);
}

void sub_237CA3F70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void utils::OUFrameWriter::WriteFrame(utils::OUFrameWriter *this, _OUFrame *a2, unint64_t a3)
{
  uint64_t v133 = *MEMORY[0x263EF8340];
  id v5 = a2;
  if (v5)
  {
    v115 = v5;
    v100 = [(_OUFrame *)v5 sceneCamera];
    [v100 imageResolution];
    double v111 = v6;
    [v100 imageResolution];
    double v108 = v7;
    unsigned int Width = CVPixelBufferGetWidth([(_OUFrame *)v115 sceneDepthBuffer]);
    unsigned int Height = CVPixelBufferGetHeight([(_OUFrame *)v115 sceneDepthBuffer]);
    unsigned int v10 = Height;
    BOOL v12 = (int)v111 != Width || (int)v108 != Height;
    [v100 intrinsics];
    if (v12)
    {
      float32x4_t v101 = v13;
      float32x4_t v103 = v14;
      int8x16_t v105 = v15;
      v16.f64[0] = v111;
      v16.f64[1] = v108;
      v17.i64[0] = Width;
      v17.i64[1] = v10;
      float64x2_t v18 = vdivq_f64(vcvtq_f64_u64(v17), v16);
      double v19 = v18.f64[1];
      float64x2_t v99 = v18;
      if (vabdd_f64(v18.f64[0], v18.f64[1]) > 0.000001)
      {
        CVPixelBufferRef v20 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)std::__fs::filesystem::path buf = 136315138;
          *(void *)&buf[4] = "OUFrameWriter";
          _os_log_impl(&dword_237C17000, v20, OS_LOG_TYPE_INFO, "[%s] downsample factor is not the same in x and y direction.", buf, 0xCu);
        }
      }
      *(float *)&unsigned int v21 = v99.f64[0] * v101.f32[0];
      v22.i64[0] = __PAIR64__(v101.u32[1], v21);
      v22.i64[1] = v101.u32[2];
      float32x4_t v109 = v22;
      *(float *)&unsigned int v23 = v19 * v103.f32[1];
      v24.i64[0] = __PAIR64__(v23, v103.u32[0]);
      v24.i64[1] = v103.u32[2];
      float32x4_t v112 = v24;
      *(float32x2_t *)v22.f32 = vcvt_f32_f64(vmulq_f64(v99, vcvtq_f64_f32(*(float32x2_t *)v105.i8)));
      v22.i64[1] = vextq_s8(v105, v105, 8uLL).u32[0];
      float32x4_t v106 = v22;
    }
    else
    {
      v13.i32[3] = 0;
      v14.i32[3] = 0;
      v15.i32[3] = 0;
      float32x4_t v106 = (float32x4_t)v15;
      float32x4_t v109 = v13;
      float32x4_t v112 = v14;
    }
    if (!*((unsigned char *)this + 160)) {
      goto LABEL_22;
    }
    uint32x2_t v25 = (uint32x2_t)vceq_s32(*(int32x2_t *)((char *)this + 96), (int32x2_t)__PAIR64__(v10, Width));
    if ((vpmin_u32(v25, v25).u32[0] & 0x80000000) != 0)
    {
      uint32x4_t v26 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*((float32x4_t *)this + 8), v112), (int8x16_t)vceqq_f32(*((float32x4_t *)this + 7), v109)), (int8x16_t)vceqq_f32(*((float32x4_t *)this + 9), v106));
      v26.i32[3] = v26.i32[2];
      if ((vminvq_u32(v26) & 0x80000000) != 0) {
        goto LABEL_21;
      }
    }
    uint64_t v27 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)std::__fs::filesystem::path buf = 136315138;
      *(void *)&buf[4] = "OUFrameWriter";
      _os_log_impl(&dword_237C17000, v27, OS_LOG_TYPE_INFO, "[%s] camera parameter have changed; the latest one will be saved.",
        buf,
        0xCu);
    }

    if (*((unsigned char *)this + 160))
    {
LABEL_21:
      *((void *)this + 12) = __PAIR64__(v10, Width);
      *((float32x4_t *)this + 7) = v109;
      *((float32x4_t *)this + 8) = v112;
      *((float32x4_t *)this + 9) = v106;
    }
    else
    {
LABEL_22:
      *((void *)this + 12) = __PAIR64__(v10, Width);
      *((float32x4_t *)this + 7) = v109;
      *((float32x4_t *)this + 8) = v112;
      *((float32x4_t *)this + 9) = v106;
      *((unsigned char *)this + 160) = 1;
    }
    std::__fs::filesystem::path::path[abi:ne180100]<char [9],void>(&v129, "camera.txt");
    v114 = (char *)this + 64;
    std::__fs::filesystem::operator/[abi:ne180100]((std::__fs::filesystem::path *)&v129, (uint64_t)this + 64, (std::__fs::filesystem::path *)&v131);
    std::ofstream::basic_ofstream((uint64_t *)buf);
    if (SHIBYTE(v131.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v131.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v129.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v129.__r_.__value_.__l.__data_);
    }
    if (!*((unsigned char *)this + 160)) {
      std::__throw_bad_optional_access[abi:ne180100]();
    }
    v28 = (void *)std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v28, (uint64_t)" ", 1);
    v29 = (void *)std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v29, (uint64_t)" ", 1);
    v30 = (void *)std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v30, (uint64_t)" ", 1);
    v31 = (void *)std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v31, (uint64_t)" ", 1);
    v32 = (void *)std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v32, (uint64_t)" ", 1);
    std::ostream::operator<<();
    if (!std::filebuf::close()) {
      std::ios_base::clear((std::ios_base *)&buf[*(void *)(*(void *)buf - 24)], *(_DWORD *)&buf[*(void *)(*(void *)buf - 24) + 32] | 4);
    }
    if (*((char *)this + 31) >= 0) {
      size_t v33 = *((unsigned __int8 *)this + 31);
    }
    else {
      size_t v33 = *((void *)this + 2);
    }
    v34 = &v129;
    std::string::basic_string[abi:ne180100]((uint64_t)&v129, v33 + 1);
    if ((v129.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      v34 = (std::string *)v129.__r_.__value_.__r.__words[0];
    }
    if (v33)
    {
      if (*((char *)this + 31) >= 0) {
        v35 = (char *)this + 8;
      }
      else {
        v35 = (char *)*((void *)this + 1);
      }
      memmove(v34, v35, v33);
    }
    *(_WORD *)((char *)&v34->__r_.__value_.__l.__data_ + v33) = 95;
    std::to_string(&v127, a3);
    if ((v127.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v36 = &v127;
    }
    else {
      v36 = (std::string *)v127.__r_.__value_.__r.__words[0];
    }
    if ((v127.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type size = HIBYTE(v127.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type size = v127.__r_.__value_.__l.__size_;
    }
    v38 = std::string::append(&v129, (const std::string::value_type *)v36, size);
    long long v39 = *(_OWORD *)&v38->__r_.__value_.__l.__data_;
    v131.__r_.__value_.__r.__words[2] = v38->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v131.__r_.__value_.__l.__data_ = v39;
    v38->__r_.__value_.__l.__size_ = 0;
    v38->__r_.__value_.__r.__words[2] = 0;
    v38->__r_.__value_.__r.__words[0] = 0;
    v40 = std::string::append(&v131, ".tiff", 5uLL);
    long long v41 = *(_OWORD *)&v40->__r_.__value_.__l.__data_;
    std::string::size_type v118 = v40->__r_.__value_.__r.__words[2];
    *(_OWORD *)v117 = v41;
    v40->__r_.__value_.__l.__size_ = 0;
    v40->__r_.__value_.__r.__words[2] = 0;
    v40->__r_.__value_.__r.__words[0] = 0;
    if (SHIBYTE(v131.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v131.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v127.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v127.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v129.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v129.__r_.__value_.__l.__data_);
    }
    std::__fs::filesystem::path::path[abi:ne180100]<char [9],void>(&v127, "color");
    std::__fs::filesystem::operator/[abi:ne180100]((std::__fs::filesystem::path *)&v127, (uint64_t)v114, (std::__fs::filesystem::path *)&v129);
    std::__fs::filesystem::path::path[abi:ne180100]<std::string,void>(&v125.__pn_, (char *)v117);
    std::__fs::filesystem::operator/[abi:ne180100](&v125, (uint64_t)&v129, (std::__fs::filesystem::path *)&v131);
    if (SHIBYTE(v131.__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::__init_copy_ctor_external(&v116, v131.__r_.__value_.__l.__data_, v131.__r_.__value_.__l.__size_);
      if (SHIBYTE(v131.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v131.__r_.__value_.__l.__data_);
      }
    }
    else
    {
      std::string v116 = v131;
    }
    if (SHIBYTE(v125.__pn_.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v125.__pn_.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v129.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v129.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v127.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v127.__r_.__value_.__l.__data_);
    }
    uint64_t v42 = [(_OUFrame *)v115 GetSceneColorBufferBGRA];
    v43 = (__CVBuffer *)v42;
    v44 = (unsigned int *)MEMORY[0x263F00868];
    if (v12)
    {
      CVPixelBuffer = (__CVBuffer *)*((void *)this + 24);
      if (!CVPixelBuffer)
      {
        CVPixelBuffer = CreateCVPixelBuffer(Width, v10);
        *((void *)this + 24) = CVPixelBuffer;
      }
      v131.__r_.__value_.__r.__words[0] = (std::string::size_type)&unk_26EAD6A70;
      v132 = &v131;
      uint64_t v46 = utils::ConvertCVPixelBuffer(v43, CVPixelBuffer, (uint64_t)&v131);
      std::__function::__value_func<long ()(vImage_Buffer const*,vImage_Buffer const*)>::~__value_func[abi:ne180100](&v131);
      if (v46)
      {
        v47 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          LODWORD(v131.__r_.__value_.__l.__data_) = 136315138;
          *(std::string::size_type *)((char *)v131.__r_.__value_.__r.__words + 4) = (std::string::size_type)"OUFrameWriter";
          _os_log_impl(&dword_237C17000, v47, OS_LOG_TYPE_INFO, "[%s] failed to downsample color image.", (uint8_t *)&v131, 0xCu);
        }
      }
      else
      {
        utils::WriteToTiff(*((void *)this + 24), (uint64_t *)&v116, *v44, *((void *)this + 29), *((void **)this + 28));
      }
    }
    else
    {
      utils::WriteToTiff(v42, (uint64_t *)&v116, *MEMORY[0x263F00868], *((void *)this + 29), *((void **)this + 28));
    }
    v48 = [(_OUFrame *)v115 sceneDepthBuffer];
    if (utils::ConvertDepthF32ToU16(v48, (CVPixelBufferRef *)this + 25, v49))
    {
      v50 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        LODWORD(v131.__r_.__value_.__l.__data_) = 136315138;
        *(std::string::size_type *)((char *)v131.__r_.__value_.__r.__words + 4) = (std::string::size_type)"OUFrameWriter";
        _os_log_impl(&dword_237C17000, v50, OS_LOG_TYPE_INFO, "[%s] failed to convert depth image.", (uint8_t *)&v131, 0xCu);
      }
    }
    else
    {
      uint64_t v51 = *((void *)this + 25);
      std::__fs::filesystem::path::path[abi:ne180100]<char [9],void>(&v125.__pn_, "depth");
      std::__fs::filesystem::operator/[abi:ne180100](&v125, (uint64_t)v114, (std::__fs::filesystem::path *)&v127);
      std::__fs::filesystem::path::path[abi:ne180100]<std::string,void>(&__p, (char *)v117);
      std::__fs::filesystem::operator/[abi:ne180100]((std::__fs::filesystem::path *)&__p, (uint64_t)&v127, (std::__fs::filesystem::path *)&v129);
      if (SHIBYTE(v129.__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&v131, v129.__r_.__value_.__l.__data_, v129.__r_.__value_.__l.__size_);
      }
      else {
        std::string v131 = v129;
      }
      utils::WriteToTiff(v51, (uint64_t *)&v131, *MEMORY[0x263F00870], *((void *)this + 30), *((void **)this + 28));
      if (SHIBYTE(v131.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v131.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v129.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v129.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v127.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v127.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v125.__pn_.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v125.__pn_.__r_.__value_.__l.__data_);
      }
    }
    v52 = [(_OUFrame *)v115 semanticLabelBuffer];
    utils::ConvertLabelL008To32BGRA(v52, (CVPixelBufferRef *)this + 26, v53);
    uint64_t v54 = *((void *)this + 26);
    std::__fs::filesystem::path::path[abi:ne180100]<char [9],void>(&v125.__pn_, "label");
    std::__fs::filesystem::operator/[abi:ne180100](&v125, (uint64_t)v114, (std::__fs::filesystem::path *)&v127);
    std::__fs::filesystem::path::path[abi:ne180100]<std::string,void>(&__p, (char *)v117);
    std::__fs::filesystem::operator/[abi:ne180100]((std::__fs::filesystem::path *)&__p, (uint64_t)&v127, (std::__fs::filesystem::path *)&v129);
    if (SHIBYTE(v129.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&v131, v129.__r_.__value_.__l.__data_, v129.__r_.__value_.__l.__size_);
    }
    else {
      std::string v131 = v129;
    }
    uint64_t v55 = *v44;
    utils::WriteToTiff(v54, (uint64_t *)&v131, v55, *((void *)this + 29), *((void **)this + 28));
    if (SHIBYTE(v131.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v131.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v129.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v129.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v127.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v127.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v125.__pn_.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v125.__pn_.__r_.__value_.__l.__data_);
    }
    v56 = [(_OUFrame *)v115 semanticConfidenceBuffer];
    utils::ConvertConfidenceL00fToVote32BGRA(v56, (CVPixelBufferRef *)this + 27, v57);
    uint64_t v58 = *((void *)this + 27);
    std::__fs::filesystem::path::path[abi:ne180100]<char [9],void>(&v125.__pn_, "vote");
    std::__fs::filesystem::operator/[abi:ne180100](&v125, (uint64_t)v114, (std::__fs::filesystem::path *)&v127);
    std::__fs::filesystem::path::path[abi:ne180100]<std::string,void>(&__p, (char *)v117);
    std::__fs::filesystem::operator/[abi:ne180100]((std::__fs::filesystem::path *)&__p, (uint64_t)&v127, (std::__fs::filesystem::path *)&v129);
    if (SHIBYTE(v129.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&v131, v129.__r_.__value_.__l.__data_, v129.__r_.__value_.__l.__size_);
    }
    else {
      std::string v131 = v129;
    }
    utils::WriteToTiff(v58, (uint64_t *)&v131, v55, *((void *)this + 29), *((void **)this + 28));
    if (SHIBYTE(v131.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v131.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v129.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v129.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v127.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v127.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v125.__pn_.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v125.__pn_.__r_.__value_.__l.__data_);
    }
    v102 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", *(void *)this);
    v59 = (void *)*((void *)this + 22);
    v119 = @"timestamp";
    v60 = NSNumber;
    [(_OUFrame *)v115 timestamp];
    v61 = objc_msgSend(v60, "numberWithDouble:");
    v120 = v61;
    v62 = [NSDictionary dictionaryWithObjects:&v120 forKeys:&v119 count:1];
    [v59 setObject:v62 forKey:v102];

    v63 = (utils::_anonymous_namespace_ *)*((void *)this + 22);
    std::__fs::filesystem::path::path[abi:ne180100]<char [9],void>(&v129, "image_meta.json");
    std::__fs::filesystem::operator/[abi:ne180100]((std::__fs::filesystem::path *)&v129, (uint64_t)v114, (std::__fs::filesystem::path *)&v131);
    if (SHIBYTE(v131.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v131.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v129.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v129.__r_.__value_.__l.__data_);
    }
    v84 = (void *)*((void *)this + 23);
    int v97 = *((unsigned __int8 *)this + 32);
    if (*((unsigned char *)this + 32))
    {
      v63 = [(_OUFrame *)v115 sceneCamera];
      [(utils::_anonymous_namespace_ *)v63 pose];
    }
    else
    {
      [(_OUFrame *)v115 GetSceneCameraPoseInVisionWorld];
    }
    long long v110 = v66;
    long long v113 = v65;
    long long v104 = v68;
    long long v107 = v67;
    v83 = v63;
    v129.__r_.__value_.__r.__words[0] = [NSNumber numberWithFloat:*(double *)&v65];
    v98 = (void *)v129.__r_.__value_.__r.__words[0];
    v129.__r_.__value_.__l.__size_ = [NSNumber numberWithFloat:*(double *)&v110];
    v96 = (void *)v129.__r_.__value_.__l.__size_;
    v95 = [NSNumber numberWithFloat:*(double *)&v107];
    v129.__r_.__value_.__r.__words[2] = (std::string::size_type)v95;
    v94 = [NSNumber numberWithFloat:*(double *)&v104];
    v130 = v94;
    v93 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v129 count:4];
    v131.__r_.__value_.__r.__words[0] = (std::string::size_type)v93;
    HIDWORD(v69) = DWORD1(v113);
    LODWORD(v69) = DWORD1(v113);
    v92 = [NSNumber numberWithFloat:v69];
    v127.__r_.__value_.__r.__words[0] = (std::string::size_type)v92;
    HIDWORD(v70) = DWORD1(v110);
    LODWORD(v70) = DWORD1(v110);
    v91 = [NSNumber numberWithFloat:v70];
    v127.__r_.__value_.__l.__size_ = (std::string::size_type)v91;
    HIDWORD(v71) = DWORD1(v107);
    LODWORD(v71) = DWORD1(v107);
    v90 = [NSNumber numberWithFloat:v71];
    v127.__r_.__value_.__r.__words[2] = (std::string::size_type)v90;
    HIDWORD(v72) = DWORD1(v104);
    LODWORD(v72) = DWORD1(v104);
    v89 = [NSNumber numberWithFloat:v72];
    v128 = v89;
    v88 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v127 count:4];
    v131.__r_.__value_.__l.__size_ = (std::string::size_type)v88;
    v87 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v113), DWORD2(v113))));
    v125.__pn_.__r_.__value_.__r.__words[0] = (std::string::size_type)v87;
    v86 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v110), DWORD2(v110))));
    v125.__pn_.__r_.__value_.__l.__size_ = (std::string::size_type)v86;
    v85 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v107), DWORD2(v107))));
    v125.__pn_.__r_.__value_.__r.__words[2] = (std::string::size_type)v85;
    v73 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v104), DWORD2(v104))));
    v126 = v73;
    v74 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v125 count:4];
    v131.__r_.__value_.__r.__words[2] = (std::string::size_type)v74;
    v75 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v113), HIDWORD(v113))));
    __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v75;
    v76 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v110), HIDWORD(v110))));
    __p.__r_.__value_.__l.__size_ = (std::string::size_type)v76;
    v77 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v107), HIDWORD(v107))));
    __p.__r_.__value_.__r.__words[2] = (std::string::size_type)v77;
    v78 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v104), HIDWORD(v104))));
    v124 = v78;
    v79 = [MEMORY[0x263EFF8C0] arrayWithObjects:&__p count:4];
    v132 = v79;
    v80 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v131 count:4];

    [v84 setObject:v80 forKey:v102];
    if (v97) {

    }
    v81 = (utils::_anonymous_namespace_ *)*((void *)this + 23);
    std::__fs::filesystem::path::path[abi:ne180100]<char [9],void>(&v129, "pose.json");
    std::__fs::filesystem::operator/[abi:ne180100]((std::__fs::filesystem::path *)&v129, (uint64_t)v114, (std::__fs::filesystem::path *)&v131);
    if (SHIBYTE(v131.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v131.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v129.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v129.__r_.__value_.__l.__data_);
    }

    if (SHIBYTE(v116.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v116.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v118) < 0) {
      operator delete(v117[0]);
    }
    *(void *)std::__fs::filesystem::path buf = *MEMORY[0x263F8C2B0];
    *(void *)&buf[*(void *)(*(void *)buf - 24)] = *(void *)(MEMORY[0x263F8C2B0] + 24);
    MEMORY[0x237E2C2E0](&buf[8]);
    std::ostream::~ostream();
    MEMORY[0x237E2C480](&v122);

    id v5 = v115;
  }
}

void sub_237CA4F24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,void *a44,void *a45,uint64_t a46,int a47,__int16 a48,char a49,char a50,uint64_t a51,void *a52,uint64_t a53,int a54,__int16 a55,char a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61)
{
  if (*(char *)(v61 - 169) < 0) {
    operator delete(*(void **)(v61 - 192));
  }
  if (SLOBYTE(STACK[0x3C7]) < 0) {
    operator delete((void *)STACK[0x3B0]);
  }
  if (*(char *)(v61 - 201) < 0) {
    operator delete(*(void **)(v61 - 224));
  }
  if (*(char *)(v61 - 233) < 0) {
    operator delete(*(void **)(v61 - 256));
  }
  if (a50 < 0) {
    operator delete(a45);
  }
  if (a57 < 0) {
    operator delete(a52);
  }
  std::ofstream::~ofstream(&a61);

  _Unwind_Resume(a1);
}

void utils::OUFrameWriter::WriteKeyframe(void *a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v24 = a2;
  if (v24)
  {
    uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v24, "count"));
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v4 = v24;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v34 objects:v40 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v35 != v6) {
            objc_enumerationMutation(v4);
          }
          id v8 = *(id *)(*((void *)&v34 + 1) + 8 * i);
          uint64_t v9 = OUKeyframeToDictionary(v8);
          unsigned int v10 = [v8 identifier];
          uint64_t v11 = [v10 UUIDString];
          [v3 setObject:v9 forKey:v11];
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v34 objects:v40 count:16];
      }
      while (v5);
    }

    BOOL v12 = (void *)a1[22];
    float32x4_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", *a1);
    float32x4_t v14 = [v12 objectForKeyedSubscript:v13];
    int8x16_t v15 = [v14 objectForKeyedSubscript:@"timestamp"];

    float64x2_t v16 = &unk_26EADC9C8;
    if (v15) {
      float64x2_t v16 = v15;
    }
    v38[0] = @"timestamp";
    v38[1] = @"objects";
    v39[0] = v16;
    v39[1] = MEMORY[0x263EFFA68];
    v38[2] = @"keyframes";
    v39[2] = v3;
    uint64x2_t v17 = [NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:3];
    std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v29);
    float64x2_t v18 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v30, (uint64_t)"fp_input_", 9);
    pn.__r_.__value_.__s.__data_[0] = 48;
    double v19 = std::operator<<[abi:ne180100]<std::char_traits<char>>(v18, (char *)&pn);
    *(void *)((char *)v19 + *(void *)(*v19 - 24) + 24) = 3;
    CVPixelBufferRef v20 = (void *)std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v20, (uint64_t)".plist", 6);
    std::stringbuf::str[abi:ne180100]<std::allocator<char>>((uint64_t)v31, &v25);
    std::__fs::filesystem::path v26 = v25;
    memset(&v25, 0, sizeof(v25));
    std::__fs::filesystem::operator/[abi:ne180100](&v26, (uint64_t)(a1 + 5), &__p);
    if (SHIBYTE(__p.__pn_.__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::__init_copy_ctor_external(&pn, __p.__pn_.__r_.__value_.__l.__data_, __p.__pn_.__r_.__value_.__l.__size_);
      if (SHIBYTE(__p.__pn_.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__pn_.__r_.__value_.__l.__data_);
      }
    }
    else
    {
      std::string pn = __p.__pn_;
    }
    if (SHIBYTE(v26.__pn_.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v26.__pn_.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v25.__pn_.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v25.__pn_.__r_.__value_.__l.__data_);
    }
    if ((pn.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_std::string pn = &pn;
    }
    else {
      p_std::string pn = (std::string *)pn.__r_.__value_.__r.__words[0];
    }
    float32x4_t v22 = [NSString stringWithUTF8String:p_pn];
    [v17 writeToFile:v22 atomically:1];

    if (SHIBYTE(pn.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(pn.__r_.__value_.__l.__data_);
    }
    v29[0] = *MEMORY[0x263F8C2B8];
    uint64_t v23 = *(void *)(MEMORY[0x263F8C2B8] + 72);
    *(void *)((char *)v29 + *(void *)(v29[0] - CVPixelBufferRelease(*((CVPixelBufferRef *)this + 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
    uint64_t v30 = v23;
    v31[0] = MEMORY[0x263F8C318] + 16;
    if (v32 < 0) {
      operator delete((void *)v31[8]);
    }
    std::streambuf::~streambuf();
    std::iostream::~basic_iostream();
    MEMORY[0x237E2C480](&v33);
  }
}

void sub_237CA57C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,void *__p,uint64_t a25,int a26,__int16 a27,char a28,char a29,uint64_t a30,uint64_t a31,int a32,__int16 a33,char a34,char a35,char a36)
{
  if (a29 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (a17 < 0) {
    operator delete(a12);
  }
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a36);

  _Unwind_Resume(a1);
}

uint64_t *std::ofstream::basic_ofstream(uint64_t *a1)
{
  uint64_t v2 = MEMORY[0x263F8C310] + 64;
  a1[52] = MEMORY[0x263F8C310] + 64;
  uint64_t v3 = a1 + 1;
  uint64_t v4 = *(void *)(MEMORY[0x263F8C2B0] + 16);
  uint64_t v5 = *(void *)(MEMORY[0x263F8C2B0] + 8);
  *a1 = v5;
  *(uint64_t *)((char *)a1 + *(void *)(v5 - CVPixelBufferRelease(*((CVPixelBufferRef *)this + 24)) = v4;
  uint64_t v6 = (std::ios_base *)((char *)a1 + *(void *)(*a1 - 24));
  std::ios_base::init(v6, a1 + 1);
  uint64_t v7 = MEMORY[0x263F8C310] + 24;
  v6[1].__vftable = 0;
  v6[1].__fmtflags_ = -1;
  *a1 = v7;
  a1[52] = v2;
  MEMORY[0x237E2C2D0](v3);
  if (!std::filebuf::open()) {
    std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 4);
  }
  return a1;
}

void sub_237CA5A64(_Unwind_Exception *a1)
{
  std::ostream::~ostream();
  MEMORY[0x237E2C480](v1);
  _Unwind_Resume(a1);
}

void utils::anonymous namespace'::WriteToJson(utils::_anonymous_namespace_ *this, NSDictionary *a2, const std::__fs::filesystem::path *a3)
{
  id v8 = this;
  uint64_t v4 = (void *)MEMORY[0x263EFF9E0];
  if (SHIBYTE(a2[2].super.isa) >= 0) {
    Class isa = (Class)a2;
  }
  else {
    Class isa = a2->super.isa;
  }
  uint64_t v6 = [NSString stringWithUTF8String:isa];
  uint64_t v7 = [v4 outputStreamToFileAtPath:v6 append:0];

  [v7 open];
  [MEMORY[0x263F08900] writeJSONObject:v8 toStream:v7 options:0 error:0];
  [v7 close];
}

void sub_237CA5B60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void *std::ofstream::~ofstream(void *a1)
{
  uint64_t v2 = MEMORY[0x263F8C2B0];
  uint64_t v3 = *MEMORY[0x263F8C2B0];
  *a1 = *MEMORY[0x263F8C2B0];
  *(void *)((char *)a1 + *(void *)(v3 - CVPixelBufferRelease(*((CVPixelBufferRef *)this + 24)) = *(void *)(v2 + 24);
  MEMORY[0x237E2C2E0](a1 + 1);
  std::ostream::~ostream();
  MEMORY[0x237E2C480](a1 + 52);
  return a1;
}

std::__fs::filesystem::path *std::__fs::filesystem::path::operator/=[abi:ne180100](std::__fs::filesystem::path *a1, std::__fs::filesystem::path *this)
{
  if (std::__fs::filesystem::path::__root_directory(this).__size_)
  {
    std::string::operator=(&a1->__pn_, &this->__pn_);
  }
  else
  {
    if (std::__fs::filesystem::path::__filename(a1).__size_) {
      std::string::push_back(&a1->__pn_, 47);
    }
    int v4 = SHIBYTE(this->__pn_.__r_.__value_.__r.__words[2]);
    if (v4 >= 0) {
      uint64_t v5 = this;
    }
    else {
      uint64_t v5 = (std::__fs::filesystem::path *)this->__pn_.__r_.__value_.__r.__words[0];
    }
    if (v4 >= 0) {
      std::string::size_type size = HIBYTE(this->__pn_.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type size = this->__pn_.__r_.__value_.__l.__size_;
    }
    std::string::append(&a1->__pn_, (const std::string::value_type *)v5, size);
  }
  return a1;
}

std::string *std::__fs::filesystem::path::path[abi:ne180100]<std::string,void>(std::string *a1, char *a2)
{
  a1->__r_.__value_.__r.__words[0] = 0;
  a1->__r_.__value_.__l.__size_ = 0;
  a1->__r_.__value_.__r.__words[2] = 0;
  LODWORD(v3) = a2[23];
  BOOL v4 = (int)v3 < 0;
  uint64_t v5 = *((void *)a2 + 1);
  if ((int)v3 < 0) {
    a2 = *(char **)a2;
  }
  uint64_t v3 = v3;
  if (v4) {
    uint64_t v3 = v5;
  }
  std::string::append[abi:ne180100]<char const*,0>(a1, a2, &a2[v3]);
  return a1;
}

void sub_237CA5D1C(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::stringbuf::str[abi:ne180100]<std::allocator<char>>@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t result = std::stringbuf::view[abi:ne180100](a1);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  uint64_t v5 = (const void *)result;
  size_t v6 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    uint64_t v9 = operator new(v7 + 1);
    a2[1] = v6;
    a2[2] = v8 | 0x8000000000000000;
    *a2 = v9;
    a2 = v9;
  }
  else
  {
    *((unsigned char *)a2 + 23) = v4;
    if (!v4) {
      goto LABEL_9;
    }
  }
  uint64_t result = (uint64_t)memmove(a2, v5, v6);
LABEL_9:
  *((unsigned char *)a2 + v6) = 0;
  return result;
}

uint64_t std::stringbuf::view[abi:ne180100](uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 96);
  if ((v1 & 0x10) != 0)
  {
    unint64_t v3 = *(void *)(a1 + 48);
    if (*(void *)(a1 + 88) < v3) {
      *(void *)(a1 + 88) = v3;
    }
    return *(void *)(a1 + 40);
  }
  else if ((v1 & 8) != 0)
  {
    return *(void *)(a1 + 16);
  }
  else
  {
    return 0;
  }
}

std::string *std::__fs::filesystem::path::append[abi:ne180100]<std::string>(std::string *this, uint64_t a2)
{
  if (*(char *)(a2 + 23) < 0)
  {
    if (!*(void *)(a2 + 8)) {
      goto LABEL_9;
    }
    unint64_t v4 = *(unsigned char **)a2;
  }
  else
  {
    unint64_t v4 = (unsigned char *)a2;
    if (!*(unsigned char *)(a2 + 23)) {
      goto LABEL_9;
    }
  }
  if (*v4 == 47)
  {
    if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
    {
      *this->__r_.__value_.__l.__data_ = 0;
      this->__r_.__value_.__l.__size_ = 0;
    }
    else
    {
      this->__r_.__value_.__s.__data_[0] = 0;
      *((unsigned char *)&this->__r_.__value_.__s + 23) = 0;
    }
    goto LABEL_12;
  }
LABEL_9:
  if (std::__fs::filesystem::path::__filename((const std::__fs::filesystem::path *)this).__size_) {
    std::string::push_back(this, 47);
  }
LABEL_12:
  int v5 = *(char *)(a2 + 23);
  BOOL v6 = v5 < 0;
  if (v5 >= 0) {
    uint64_t v7 = (char *)a2;
  }
  else {
    uint64_t v7 = *(char **)a2;
  }
  uint64_t v8 = *(unsigned __int8 *)(a2 + 23);
  if (v6) {
    uint64_t v8 = *(void *)(a2 + 8);
  }
  std::string::append[abi:ne180100]<char const*,0>(this, v7, &v7[v8]);
  return this;
}

std::string *std::__fs::filesystem::path::path[abi:ne180100]<char [9],void>(std::string *this, char *a2)
{
  *(_OWORD *)&this->__r_.__value_.__l.__data_ = 0uLL;
  this->__r_.__value_.__r.__words[2] = 0;
  unint64_t v3 = a2 - 1;
  while (*++v3)
    ;
  std::string::append[abi:ne180100]<char const*,0>(this, a2, v3);
  return this;
}

void sub_237CA5F18(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void std::__function::__func<utils::OUFrameWriter::WriteFrame(_OUFrame *,unsigned long)::$_0,std::allocator<utils::OUFrameWriter::WriteFrame(_OUFrame *,unsigned long)::$_0>,long ()(vImage_Buffer const*,vImage_Buffer const*)>::~__func()
{
}

void *std::__function::__func<utils::OUFrameWriter::WriteFrame(_OUFrame *,unsigned long)::$_0,std::allocator<utils::OUFrameWriter::WriteFrame(_OUFrame *,unsigned long)::$_0>,long ()(vImage_Buffer const*,vImage_Buffer const*)>::__clone()
{
  uint64_t result = operator new(0x10uLL);
  void *result = &unk_26EAD6A70;
  return result;
}

void std::__function::__func<utils::OUFrameWriter::WriteFrame(_OUFrame *,unsigned long)::$_0,std::allocator<utils::OUFrameWriter::WriteFrame(_OUFrame *,unsigned long)::$_0>,long ()(vImage_Buffer const*,vImage_Buffer const*)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26EAD6A70;
}

vImage_Error std::__function::__func<utils::OUFrameWriter::WriteFrame(_OUFrame *,unsigned long)::$_0,std::allocator<utils::OUFrameWriter::WriteFrame(_OUFrame *,unsigned long)::$_0>,long ()(vImage_Buffer const*,vImage_Buffer const*)>::operator()(uint64_t a1, const vImage_Buffer **a2, const vImage_Buffer **a3)
{
  return vImageScale_ARGB8888(*a2, *a3, 0, 0);
}

uint64_t std::__function::__func<utils::OUFrameWriter::WriteFrame(_OUFrame *,unsigned long)::$_0,std::allocator<utils::OUFrameWriter::WriteFrame(_OUFrame *,unsigned long)::$_0>,long ()(vImage_Buffer const*,vImage_Buffer const*)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<utils::OUFrameWriter::WriteFrame(_OUFrame *,unsigned long)::$_0,std::allocator<utils::OUFrameWriter::WriteFrame(_OUFrame *,unsigned long)::$_0>,long ()(vImage_Buffer const*,vImage_Buffer const*)>::target_type()
{
}

void _GLOBAL__sub_I_DataFileIO_mm()
{
  v0 = (void *)MEMORY[0x237E2CC70]();
  ObjectUnderstandingTest::Bundle = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.ObjectUnderstandingTests"];
}

void ou3dor::OU3DORParser::OU3DORParser(ou3dor::OU3DORParser *this)
{
  OU3DORIDTree::OU3DORIDTree(this);
  std::string::basic_string[abi:ne180100]<0>(&v1, "Chair");
}

void sub_237CA7A0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  OU3DORIDTree::~OU3DORIDTree(v20);
  _Unwind_Resume(a1);
}

void ou3dor::anonymous namespace'::CreateNode()
{
}

void sub_237CA8150(_Unwind_Exception *a1)
{
  MEMORY[0x237E2C510](v1, 0x1092C4055567BECLL);
  _Unwind_Resume(a1);
}

void ou3dor::OU3DORParser::ParseNetworkOutput(OU3DORIDTree::Node **a1@<X0>, void *a2@<X1>, unsigned __int8 **a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  uint64_t v4 = a2[1] - *a2;
  a4[1] = 0;
  a4[2] = 0;
  *a4 = 0;
  if (v4 == 188)
  {
    uint64_t Node = OU3DORIDTree::FindNode((uint64_t)a1, a3);
    uint64_t v7 = *(long long ***)(Node + 24);
    for (uint64_t i = *(long long ***)(Node + 32); v7 != i; ++v7)
    {
      uint64_t v8 = *v7;
      if (*((char *)*v7 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&v45, *(const std::string::value_type **)v8, *((void *)v8 + 1));
      }
      else
      {
        long long v9 = *v8;
        v45.__r_.__value_.__r.__words[2] = *((void *)v8 + 2);
        *(_OWORD *)&v45.__r_.__value_.__l.__data_ = v9;
      }
      unint64_t Range = OU3DORIDTree::FindRange((uint64_t)a1, (unsigned __int8 **)&v45);
      int v11 = Range;
      unint64_t v12 = HIDWORD(Range);
      std::__fs::filesystem::path __p = 0;
      v43 = 0;
      v44 = 0;
      float v13 = expf(*(float *)(*a2 + 4 * (int)Range));
      if (v11 <= (int)v12)
      {
        float32x4_t v14 = 0;
        uint64_t v15 = v11;
        int v16 = v12 + 1;
        do
        {
          float v17 = expf(*(float *)(*a2 + 4 * v15));
          float v18 = v17;
          if (v14 >= v44)
          {
            CVPixelBufferRef v20 = (float *)__p;
            uint64_t v21 = ((char *)v14 - (unsigned char *)__p) >> 2;
            unint64_t v22 = v21 + 1;
            if ((unint64_t)(v21 + 1) >> 62) {
              std::vector<float>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v23 = (char *)v44 - (unsigned char *)__p;
            if (((char *)v44 - (unsigned char *)__p) >> 1 > v22) {
              unint64_t v22 = v23 >> 1;
            }
            if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v24 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v24 = v22;
            }
            if (v24)
            {
              std::__fs::filesystem::path v25 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v44, v24);
              CVPixelBufferRef v20 = (float *)__p;
              float32x4_t v14 = v43;
            }
            else
            {
              std::__fs::filesystem::path v25 = 0;
            }
            std::__fs::filesystem::path v26 = (float *)&v25[4 * v21];
            *std::__fs::filesystem::path v26 = v18;
            double v19 = v26 + 1;
            while (v14 != v20)
            {
              int v27 = *((_DWORD *)v14-- - 1);
              *((_DWORD *)v26-- - 1) = v27;
            }
            std::__fs::filesystem::path __p = v26;
            v43 = v19;
            v44 = (float *)&v25[4 * v24];
            if (v20) {
              operator delete(v20);
            }
          }
          else
          {
            *float32x4_t v14 = v17;
            double v19 = v14 + 1;
          }
          v43 = v19;
          if (*(v19 - 1) >= v13)
          {
            float v13 = *(v19 - 1);
            int v11 = v15;
          }
          ++v15;
          float32x4_t v14 = v19;
        }
        while (v16 != v15);
      }
      LODWORD(v46.__r_.__value_.__l.__data_) = v11;
      {
        v28 = (float *)__p;
        double v29 = 0.0;
        while (v28 != v43)
        {
          float v30 = *v28++;
          double v29 = v29 + v30;
        }
        NodeBasedOnID = OU3DORIDTree::FindNodeBasedOnID(a1, v11);
        if (NodeBasedOnID)
        {
          OU3DORIDTree::GetRootToNodePath(a1, v11, 45, &v41);
          if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0) {
            std::string::__init_copy_ctor_external(&v46, v45.__r_.__value_.__l.__data_, v45.__r_.__value_.__l.__size_);
          }
          else {
            std::string v46 = v45;
          }
          if (*((char *)NodeBasedOnID + 23) < 0)
          {
            std::string::__init_copy_ctor_external(&v47, *(const std::string::value_type **)NodeBasedOnID, *((void *)NodeBasedOnID + 1));
          }
          else
          {
            long long v33 = *(_OWORD *)NodeBasedOnID;
            v47.__r_.__value_.__r.__words[2] = *((void *)NodeBasedOnID + 2);
            *(_OWORD *)&v47.__r_.__value_.__l.__data_ = v33;
          }
          if (SHIBYTE(v41.__r_.__value_.__r.__words[2]) < 0) {
            std::string::__init_copy_ctor_external(&v48, v41.__r_.__value_.__l.__data_, v41.__r_.__value_.__l.__size_);
          }
          else {
            std::string v48 = v41;
          }
          float v34 = v13 / v29;
          float v49 = v34;
          unint64_t v35 = a4[1];
          if (v35 >= a4[2])
          {
            uint64_t v36 = std::vector<ou3dor::OU3DORParser::AttibuteInfo>::__push_back_slow_path<ou3dor::OU3DORParser::AttibuteInfo const&>(a4, (long long *)&v46);
            long long v37 = a4;
          }
          else
          {
            std::construct_at[abi:ne180100]<ou3dor::OU3DORParser::AttibuteInfo,ou3dor::OU3DORParser::AttibuteInfo const&,ou3dor::OU3DORParser::AttibuteInfo*>((std::string *)a4[1], (long long *)&v46);
            uint64_t v36 = v35 + 80;
            long long v37 = a4;
            a4[1] = v35 + 80;
          }
          v37[1] = v36;
          if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v48.__r_.__value_.__l.__data_);
          }
          if (SHIBYTE(v47.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v47.__r_.__value_.__l.__data_);
          }
          if (SHIBYTE(v46.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v46.__r_.__value_.__l.__data_);
          }
          if (SHIBYTE(v41.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v41.__r_.__value_.__l.__data_);
          }
        }
        else
        {
          char v32 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            LODWORD(v46.__r_.__value_.__l.__data_) = 67109120;
            HIDWORD(v46.__r_.__value_.__r.__words[0]) = v11;
            _os_log_error_impl(&dword_237C17000, v32, OS_LOG_TYPE_ERROR, "There is no node for id: %d", (uint8_t *)&v46, 8u);
          }
        }
      }
      if (__p)
      {
        v43 = (float *)__p;
        operator delete(__p);
      }
      if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v45.__r_.__value_.__l.__data_);
      }
    }
  }
}

void sub_237CA85A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,void *a23,uint64_t a24,uint64_t a25,void *a26,uint64_t a27,int a28,__int16 a29,char a30,char a31,uint64_t a32,void *a33,uint64_t a34,int a35,__int16 a36,char a37,char a38,void *__p,uint64_t a40,int a41,__int16 a42,char a43,char a44)
{
  a33 = a14;
  std::vector<ou3dor::OU3DORParser::AttibuteInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)&a33);
  _Unwind_Resume(a1);
}

void ou3dor::OU3DORParser::AttibuteInfo::~AttibuteInfo(void **this)
{
  if (*((char *)this + 71) < 0) {
    operator delete(this[6]);
  }
  if (*((char *)this + 47) < 0) {
    operator delete(this[3]);
  }
  if (*((char *)this + 23) < 0) {
    operator delete(*this);
  }
}

uint64_t std::vector<ou3dor::OU3DORParser::AttibuteInfo>::__push_back_slow_path<ou3dor::OU3DORParser::AttibuteInfo const&>(uint64_t *a1, long long *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xCCCCCCCCCCCCCCCDLL * ((a1[1] - *a1) >> 4);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0x333333333333333) {
    std::vector<float>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xCCCCCCCCCCCCCCCDLL * ((a1[2] - v3) >> 4);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x199999999999999) {
    unint64_t v9 = 0x333333333333333;
  }
  else {
    unint64_t v9 = v5;
  }
  float v17 = a1 + 2;
  if (v9) {
    unsigned int v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ou3dor::OU3DORParser::AttibuteInfo>>(v7, v9);
  }
  else {
    unsigned int v10 = 0;
  }
  float v13 = v10;
  float32x4_t v14 = (std::string *)&v10[80 * v4];
  int v16 = &v10[80 * v9];
  std::construct_at[abi:ne180100]<ou3dor::OU3DORParser::AttibuteInfo,ou3dor::OU3DORParser::AttibuteInfo const&,ou3dor::OU3DORParser::AttibuteInfo*>(v14, a2);
  uint64_t v15 = &v14[3].__r_.__value_.__s.__data_[8];
  std::vector<ou3dor::OU3DORParser::AttibuteInfo>::__swap_out_circular_buffer(a1, &v13);
  uint64_t v11 = a1[1];
  std::__split_buffer<ou3dor::OU3DORParser::AttibuteInfo>::~__split_buffer((uint64_t)&v13);
  return v11;
}

void sub_237CA87BC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<ou3dor::OU3DORParser::AttibuteInfo>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

std::string *std::construct_at[abi:ne180100]<ou3dor::OU3DORParser::AttibuteInfo,ou3dor::OU3DORParser::AttibuteInfo const&,ou3dor::OU3DORParser::AttibuteInfo*>(std::string *this, long long *a2)
{
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v4 = *a2;
    this->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v4;
  }
  if (*((char *)a2 + 47) < 0)
  {
    std::string::__init_copy_ctor_external(this + 1, *((const std::string::value_type **)a2 + 3), *((void *)a2 + 4));
  }
  else
  {
    long long v5 = *(long long *)((char *)a2 + 24);
    this[1].__r_.__value_.__r.__words[2] = *((void *)a2 + 5);
    *(_OWORD *)&this[1].__r_.__value_.__l.__data_ = v5;
  }
  BOOL v6 = this + 2;
  if (*((char *)a2 + 71) < 0)
  {
    std::string::__init_copy_ctor_external(v6, *((const std::string::value_type **)a2 + 6), *((void *)a2 + 7));
  }
  else
  {
    long long v7 = a2[3];
    this[2].__r_.__value_.__r.__words[2] = *((void *)a2 + 8);
    *(_OWORD *)&v6->__r_.__value_.__l.__data_ = v7;
  }
  LODWORD(this[3].__r_.__value_.__l.__data_) = *((_DWORD *)a2 + 18);
  return this;
}

void sub_237CA888C(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 47) < 0) {
    operator delete(*v2);
  }
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *std::vector<ou3dor::OU3DORParser::AttibuteInfo>::__swap_out_circular_buffer(uint64_t *result, void *a2)
{
  uint64_t v2 = *result;
  uint64_t v3 = result[1];
  uint64_t v4 = a2[1];
  if (v3 == *result)
  {
    uint64_t v5 = a2[1];
  }
  else
  {
    do
    {
      uint64_t v5 = v4 - 80;
      long long v6 = *(_OWORD *)(v3 - 80);
      *(void *)(v4 - 64) = *(void *)(v3 - 64);
      *(_OWORD *)(v4 - 80) = v6;
      *(void *)(v3 - 72) = 0;
      *(void *)(v3 - 64) = 0;
      *(void *)(v3 - 80) = 0;
      long long v7 = *(_OWORD *)(v3 - 56);
      *(void *)(v4 - 40) = *(void *)(v3 - 40);
      *(_OWORD *)(v4 - 56) = v7;
      *(void *)(v3 - 48) = 0;
      *(void *)(v3 - 40) = 0;
      *(void *)(v3 - 56) = 0;
      long long v8 = *(_OWORD *)(v3 - 32);
      *(void *)(v4 - 16) = *(void *)(v3 - 16);
      *(_OWORD *)(v4 - 32) = v8;
      *(void *)(v3 - 24) = 0;
      *(void *)(v3 - 16) = 0;
      *(void *)(v3 - 32) = 0;
      *(_DWORD *)(v4 - 8) = *(_DWORD *)(v3 - 8);
      v3 -= 80;
      v4 -= 80;
    }
    while (v3 != v2);
  }
  a2[1] = v5;
  uint64_t v9 = *result;
  void *result = v5;
  a2[1] = v9;
  uint64_t v10 = result[1];
  result[1] = a2[2];
  a2[2] = v10;
  uint64_t v11 = result[2];
  result[2] = a2[3];
  a2[3] = v11;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<ou3dor::OU3DORParser::AttibuteInfo>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x333333333333334) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(80 * a2);
}

uint64_t std::__split_buffer<ou3dor::OU3DORParser::AttibuteInfo>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 80;
    std::__destroy_at[abi:ne180100]<ou3dor::OU3DORParser::AttibuteInfo,0>(i - 80);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t std::unordered_set<ou3dor::PartAttributeID>::unordered_set(uint64_t a1, int *a2, uint64_t a3)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = 1065353216;
  if (a3)
  {
    uint64_t v5 = 4 * a3;
    do
    {
      std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>(a1, a2, a2);
      ++a2;
      v5 -= 4;
    }
    while (v5);
  }
  return a1;
}

void sub_237CA8A78(_Unwind_Exception *a1)
{
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

void _GLOBAL__sub_I_OU3DORParser_mm()
{
  uint64_t v97 = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x237E2CC70]();
  *((void *)&v2 + 1) = @"Chair-chair_type-dining";
  LODWORD(v3) = 2;
  *((void *)&v3 + 1) = @"Chair-chair_type-swivel";
  LODWORD(v4) = 3;
  *((void *)&v4 + 1) = @"Chair-chair_type-other";
  LODWORD(v5) = 4;
  *((void *)&v5 + 1) = @"Chair-chair_leg_type-four";
  LODWORD(v6) = 5;
  *((void *)&v6 + 1) = @"Chair-chair_leg_type-star";
  LODWORD(v7) = 6;
  long long v8 = @"Chair-chair_leg_type-other";
  int v9 = 7;
  uint64_t v10 = @"Chair-chair_arm_type-missing";
  int v11 = 8;
  unint64_t v12 = @"Chair-chair_arm_type-existing";
  int v13 = 9;
  float32x4_t v14 = @"Chair-chair_back_type-missing";
  int v15 = 10;
  int v16 = @"Chair-chair_back_type-existing";
  int v17 = 11;
  float v18 = @"Chair-chair_seat_height-tall_seat";
  int v19 = 12;
  CVPixelBufferRef v20 = @"Chair-chair_seat_height-normal/low_seat";
  int v21 = 13;
  unint64_t v22 = @"Chair-chair_seat_shape-rectangular";
  int v23 = 14;
  unint64_t v24 = @"Chair-chair_seat_shape-round";
  int v25 = 15;
  std::__fs::filesystem::path v26 = @"Chair-chair_seat_shape-none";
  int v27 = 16;
  v28 = @"Sofa-sofa_type-rectangular";
  int v29 = 17;
  float v30 = @"Sofa-sofa_type-lShaped";
  int v31 = 18;
  char v32 = @"Sofa-sofa_type-singleSeat";
  int v33 = 19;
  float v34 = @"Sofa-sofa_type-lShapedMain";
  int v35 = 20;
  uint64_t v36 = @"Sofa-sofa_type-lShapedExtension";
  int v37 = 21;
  v38 = @"Sofa-sofa_type-lShapedMiddle";
  int v39 = 22;
  v40 = @"Sofa-sofa_type-other";
  int v41 = 23;
  uint64_t v42 = @"Sofa-sofa_arm_type-missing";
  int v43 = 24;
  v44 = @"Sofa-sofa_arm_type-two_arms";
  int v45 = 25;
  std::string v46 = @"Sofa-sofa_arm_type-none";
  int v47 = 26;
  std::string v48 = @"Sofa-sofa_back_type-missing";
  int v49 = 27;
  uint64_t v50 = @"Sofa-sofa_back_type-existing";
  int v51 = 28;
  v52 = @"Table-table_type-desk";
  int v53 = 29;
  uint64_t v54 = @"Table-table_type-coffee";
  int v55 = 30;
  v56 = @"Table-table_type-dining";
  int v57 = 31;
  uint64_t v58 = @"Table-table_type-other";
  int v59 = 32;
  v60 = @"Table-table_shape-rectangular";
  int v61 = 33;
  v62 = @"Table-table_shape-lShaped";
  int v63 = 34;
  v64 = @"Table-table_shape-circularElliptic";
  int v65 = 35;
  long long v66 = @"Table-table_shape-other";
  int v67 = 36;
  long long v68 = @"Table-table_leg_type-two_leg";
  int v69 = 37;
  double v70 = @"Table-table_leg_type-four_leg";
  int v71 = 38;
  double v72 = @"Table-table_leg_type-none";
  int v73 = 39;
  v74 = @"Table-table_attribute-with_storage";
  int v75 = 40;
  v76 = @"Table-table_attribute-without_storage";
  int v77 = 41;
  v78 = @"Cabinet-cabinet_type-standalone_cabinet";
  int v79 = 42;
  v80 = @"Cabinet-cabinet_type-kitchen_cabinet";
  int v81 = 43;
  v82 = @"Cabinet-cabinet_type-nightstand";
  int v83 = 44;
  v84 = @"Cabinet-cabinet_type-none";
  int v85 = 45;
  v86 = @"Cabinet-cabinet_attribute-no_countertop";
  int v87 = 46;
  v88 = @"Cabinet-cabinet_attribute-with_countertop";
  int v89 = 100;
  v90 = @"Sofa-sofa_arm_type-existing";
  int v91 = 101;
  LODWORD(v2) = 0;
  v92 = @"Storage-storage_type-cabinet";
  int v93 = 102;
  v94 = @"Storage-storage_type-shelf";
  int v95 = 103;
  v96 = @"Chair-chair_type-stool";
  std::unordered_map<ou3dor::PartAttributeID,NSString * {__strong}>::unordered_map((uint64_t)&ou3dor::k3DORSupportedAttributeTypeMap, (int *)&v2, 50);
  for (uint64_t i = 792; i != -8; i -= 16)

  __cxa_atexit((void (*)(void *))std::unordered_map<ou3dor::PartAttributeID,NSString * {__strong}>::~unordered_map[abi:ne180100], &ou3dor::k3DORSupportedAttributeTypeMap, &dword_237C17000);
  long long v4 = xmmword_237CB680C;
  long long v5 = unk_237CB681C;
  long long v6 = xmmword_237CB682C;
  long long v2 = xmmword_237CB67EC;
  long long v3 = unk_237CB67FC;
  uint64_t v7 = 0x2E0000002DLL;
}

void sub_237CA8F90(_Unwind_Exception *a1)
{
  for (uint64_t i = 792; i != -8; i -= 16)

  _Unwind_Resume(a1);
}

uint64_t std::map<NSString * {__strong},std::unordered_set<SemanticLabelv5>>::~map[abi:ne180100](uint64_t a1)
{
  return a1;
}

void ou3dor::Object3DEncoder::Object3DEncoder(uint64_t a1, long long *a2)
{
  *(void *)a1 = &unk_26EAD6AF0;
  long long v2 = *a2;
  long long v3 = a2[1];
  uint64_t v4 = *((void *)a2 + 4);
  *(_OWORD *)(a1 + 88) = 0u;
  *(void *)(a1 + 40) = v4;
  *(_OWORD *)(a1 + 8) = v2;
  *(_OWORD *)(a1 + 24) = v3;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_DWORD *)(a1 + 80) = 1065353216;
  *(_OWORD *)(a1 + 104) = 0u;
  *(void *)(a1 + 120) = 0;
  [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  if (objc_claimAutoreleasedReturnValue()) {
    operator new();
  }
  exception = __cxa_allocate_exception(0x10uLL);
  MEMORY[0x237E2C1F0](exception, "[3DOR] failed to get the bundle.");
  __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
}

void sub_237CA91E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v20 = v15[15];
  v15[15] = 0;
  if (v20) {
    (*(void (**)(uint64_t))(*(void *)v20 + 8))(v20);
  }
  uint64_t v21 = v15[14];
  v15[14] = 0;
  if (v21) {
    (*(void (**)(uint64_t))(*(void *)v21 + 8))(v21);
  }
  unint64_t v22 = *v18;
  if (*v18)
  {
    v15[12] = v22;
    operator delete(v22);
  }
  std::__hash_table<std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>>>::~__hash_table(v16);
  _Unwind_Resume(a1);
}

void ou3dor::Object3DEncoder::Process(ou3dor::Object3DEncoder *a1, void *a2, uint64_t *a3)
{
  id v6 = a2;
  ou3dor::Object3DEncoder::AddView((uint64_t)a1, v6, a3);
  long long v5 = (__CVBuffer *)[v6 sceneColorBuffer];
  [v6 deviceOrientation];
  ou3dor::Object3DEncoder::ExtractImageFeatures(a1, v5);
}

void sub_237CA9354(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ou3dor::Object3DEncoder::AddView(uint64_t a1, void *a2, uint64_t *a3)
{
  uint64_t v97 = *MEMORY[0x263EF8340];
  id v72 = a2;
  uint64_t v4 = [v72 sceneCamera];
  int v71 = v4;
  [v4 intrinsics];
  double v70 = v5;
  int WidthOfPlane = CVPixelBufferGetWidthOfPlane((CVPixelBufferRef)[v72 sceneColorBuffer], 0);
  int HeightOfPlane = CVPixelBufferGetHeightOfPlane((CVPixelBufferRef)[v72 sceneColorBuffer], 0);
  int Width = CVPixelBufferGetWidth((CVPixelBufferRef)[v72 semanticLabelBuffer]);
  int Height = CVPixelBufferGetHeight((CVPixelBufferRef)[v72 semanticLabelBuffer]);
  int v10 = Height;
  LODWORD(v11) = 1147207680;
  double v12 = v70;
  if (*(float *)&v70 <= 900.0
    || (LODWORD(v11) = 1040746633, (float)((float)Width / (float)WidthOfPlane) == 0.13333)
    && (*(float *)&double v12 = (float)Height / (float)HeightOfPlane, *(float *)&v12 == 0.13333))
  {
    objc_msgSend(v4, "pose", v11, v12);
    float v68 = v14;
    [v4 pose];
    uint64_t v17 = *a3;
    uint64_t v16 = a3[1];
    if (*a3 == v16) {
      goto LABEL_58;
    }
    int32x2_t v69 = (int32x2_t)__PAIR64__(v10, Width);
    float v18 = v15;
    int32x2_t v19 = vdup_n_s32(0x7F7FFFFFu);
    float32x2_t v20 = (float32x2_t)vdup_n_s32(0x3E088889u);
    while (1)
    {
      id v21 = *(id *)(v17 + 144);
      if (!v21)
      {
        int v45 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)std::__fs::filesystem::path buf = 0;
          _os_log_impl(&dword_237C17000, v45, OS_LOG_TYPE_INFO, "[3DOR] can't add view for object w/o uuid, skipping", buf, 2u);
        }

        goto LABEL_57;
      }
      id v22 = v71;
      [v22 pose];
      simd_float4x4 v99 = __invert_f4(v98);
      float32x4_t v78 = (float32x4_t)v99.columns[1];
      float32x4_t v79 = (float32x4_t)v99.columns[0];
      float32x4_t v76 = (float32x4_t)v99.columns[3];
      float32x4_t v77 = (float32x4_t)v99.columns[2];
      [v22 imageResolution];
      double v24 = v23;
      [v22 imageResolution];
      uint64_t v25 = 0;
      int v26 = 0;
      float v27 = v24;
      float v75 = v27;
      float v29 = v28;
      float v74 = v29;
      float32x2_t v30 = (float32x2_t)0x80000000800000;
      float32x2_t v31 = (float32x2_t)v19;
      while (1)
      {
        float32x4_t v32 = vaddq_f32(v76, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v79, COERCE_FLOAT(*(_OWORD *)(v17 + v25))), v78, *(float32x2_t *)(v17 + v25), 1), v77, *(float32x4_t *)(v17 + v25), 2));
        float32x4_t v80 = v32;
        v32.i32[0] = v32.i32[2];
        if (v32.f32[2] <= 0.0) {
          break;
        }
        objc_msgSend(v22, "intrinsics", *(double *)v32.i64);
        int32x4_t v36 = (int32x4_t)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v33, v80.f32[0]), v34, *(float32x2_t *)v80.f32, 1), v35, v80, 2);
        if (fabsf(*(float *)&v36.i32[2]) >= 0.000001)
        {
          float32x2_t v37 = vdiv_f32(*(float32x2_t *)v36.i8, (float32x2_t)vdup_laneq_s32(v36, 2));
          int v38 = v37.f32[0] >= 0.0;
          if (v37.f32[0] > v75) {
            int v38 = 0;
          }
          if (v37.f32[1] < 0.0) {
            int v38 = 0;
          }
          if (v37.f32[1] > v74) {
            int v38 = 0;
          }
          v26 += v38;
          float32x2_t v31 = (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v31, v37), (int8x8_t)v37, (int8x8_t)v31);
          float32x2_t v30 = (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v37, v30), (int8x8_t)v37, (int8x8_t)v30);
        }
        v25 += 16;
        if (v25 == 128)
        {
          int32x2_t v39 = vcvt_s32_f32(v31);
          int32x2_t v40 = vcvt_s32_f32((float32x2_t)__PAIR64__(LODWORD(v74), LODWORD(v75)));
          int32x2_t v41 = vcvt_s32_f32(v30);
          *(int8x8_t *)&long long v42 = vand_s8((int8x8_t)vcgez_s32(v39), (int8x8_t)vmin_s32(v40, v39));
          DWORD2(v87[1]) = v26;
          int v43 = v42;
          int v44 = DWORD1(v42);
          *(int32x2_t *)v81.f32 = vsub_s32((int32x2_t)vand_s8((int8x8_t)vcgez_s32(v41), (int8x8_t)vmin_s32(v40, v41)), *(int32x2_t *)&v42);
          *((void *)&v42 + 1) = v81.i64[0];
          *(_OWORD *)((char *)&v87[1] + 12) = v42;
          goto LABEL_26;
        }
      }
      int v44 = 0;
      int v43 = 0;
      int v26 = 0;
      memset((char *)&v87[1] + 8, 0, 20);
      v81.i64[0] = 0;
LABEL_26:

      if (*(void *)(a1 + 8) > (unint64_t)v26) {
        goto LABEL_57;
      }
      v46.i32[1] = v81.i32[1];
      if (v81.i32[0] <= v81.i32[1]) {
        __int32 v47 = v81.i32[1];
      }
      else {
        __int32 v47 = v81.i32[0];
      }
      if (v43 >= WidthOfPlane - v47) {
        LODWORD(v48) = WidthOfPlane - v47;
      }
      else {
        LODWORD(v48) = v43;
      }
      if (WidthOfPlane - v47 >= 0) {
        uint64_t v48 = v48;
      }
      else {
        uint64_t v48 = 0;
      }
      if (v44 >= HeightOfPlane - v47) {
        unsigned int v49 = HeightOfPlane - v47;
      }
      else {
        unsigned int v49 = v44;
      }
      if (HeightOfPlane - v47 >= 0) {
        uint64_t v50 = v49;
      }
      else {
        uint64_t v50 = 0;
      }
      int v51 = v43 + v47;
      if (v43 + v47 >= WidthOfPlane) {
        int v51 = WidthOfPlane;
      }
      uint64_t v52 = (v51 - v48);
      int v53 = v44 + v47;
      if (v53 >= HeightOfPlane) {
        int v53 = HeightOfPlane;
      }
      uint64_t v54 = (v53 - v50);
      uint64_t v55 = v52 | (v54 << 32);
      uint64_t v56 = v48 | (v50 << 32);
      *(void *)&v87[0] = v56;
      *((void *)&v87[0] + 1) = v55;
      v46.i32[0] = 1147207680;
      *(double *)v57.i64 = v70;
      if (*(float *)&v70 > 900.0)
      {
        HIDWORD(v87[1]) = (int)(float)((float)((float)v43 * 0.13333) + 0.5);
        LODWORD(v87[2]) = (int)(float)((float)((float)v44 * 0.13333) + 0.5);
        DWORD1(v87[2]) = (int)(float)((float)((float)v81.i32[0] * 0.13333) + 0.5);
        DWORD2(v87[2]) = (int)(float)((float)((float)v81.i32[1] * 0.13333) + 0.5);
        int32x2_t v58 = vcvt_s32_f32(vmla_f32((float32x2_t)0x3F0000003F000000, v20, vcvt_f32_s32((int32x2_t)__PAIR64__(v52, v48))));
        int8x16_t v57 = (int8x16_t)vshll_n_s32(vcvt_s32_f32(vmla_f32((float32x2_t)0x3F0000003F000000, v20, vcvt_f32_s32((int32x2_t)__PAIR64__(v54, v50)))), 0x20uLL);
        v59.i64[0] = v58.u32[0];
        v59.i64[1] = v58.u32[1];
        int8x16_t v46 = vorrq_s8(v57, v59);
        v87[0] = v46;
      }
      v60 = (__CVBuffer *)objc_msgSend(v72, "semanticLabelBuffer", *(double *)v46.i64, *(double *)v57.i64);
      int v61 = std::map<NSString * {__strong},std::set<unsigned char>>::at((uint64_t)&kObjectTypeToSemanticLabels, (unint64_t *)(v17 + 128));
      ou3dor::Object3DEncoder::ComputeSemanticMaskAndScore(v60, (int *)v87, (_DWORD *)&v87[1] + 3, v61, (uint64_t)&v84, v69);
      float v62 = v86;
      int v63 = v84;
      if (v86 >= 10.0) {
        break;
      }
      if (v84)
      {
        v64 = v84;
LABEL_56:
        operator delete(v64);
      }
LABEL_57:

      v17 += 224;
      if (v17 == v16) {
        goto LABEL_58;
      }
    }
    float32x2_t v65 = vmul_f32(vadd_f32(*(float32x2_t *)v17, *(float32x2_t *)(v17 + 32)), (float32x2_t)0x3F0000003F000000);
    float v66 = atan2f(v65.f32[1] - v18, v65.f32[0] - v68);
    if (v66 < 0.0) {
      float v66 = v66 + 6.2832;
    }
    *(_DWORD *)std::__fs::filesystem::path buf = (int)(float)(v66 * 0.95493);
    int v89 = (const char *)__PAIR64__(LODWORD(v62), DWORD2(v87[1]));
    v90 = v63;
    long long v91 = v85;
    v84 = 0;
    long long v85 = 0uLL;
    uint64_t v92 = v56;
    uint64_t v93 = v55;
    long long v94 = v87[0];
    char v95 = 0;
    char v96 = 0;
    id v67 = [v21 UUIDString];
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v67 UTF8String]);
    ou3dor::Object3DEncoder::AddToObjects(a1, (uint64_t)buf, (unsigned __int8 *)__p);
    if (v83 < 0) {
      operator delete(__p[0]);
    }

    v64 = v90;
    if (!v90) {
      goto LABEL_57;
    }
    goto LABEL_56;
  }
  int v13 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::__fs::filesystem::path buf = 136315138;
    int v89 = "Object3DEncoder";
    _os_log_impl(&dword_237C17000, v13, OS_LOG_TYPE_INFO, "[3DOR][%s] image resolution ratio != resize scale; will not extract embeddings",
      buf,
      0xCu);
  }

LABEL_58:
}

void sub_237CA99AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,void *__p,uint64_t a39,int a40,__int16 a41,char a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,void *a56)
{
  _Unwind_Resume(a1);
}

void ou3dor::Object3DEncoder::ExtractImageFeatures(ou3dor::Object3DEncoder *this, __CVBuffer *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  std::string::basic_string[abi:ne180100]<0>(&v3, "input_1");
  std::string::basic_string[abi:ne180100]<0>(&v2, "var_354");
  OUDnnInferenceInterface::GetInputSpan<half,void>();
}

void sub_237CAA1C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *__p,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33,void *a34,uint64_t a35)
{
  if (a27 < 0) {
    operator delete(__p);
  }
  if (a33 < 0) {
    operator delete(a28);
  }
  _Unwind_Resume(exception_object);
}

void ou3dor::Object3DEncoder::ExtractObjectFeatures(ou3dor::Object3DEncoder *this)
{
  std::string::basic_string[abi:ne180100]<0>(&v2, "feat_1");
  std::string::basic_string[abi:ne180100]<0>(&__p, "var_351");
  OUDnnInferenceInterface::GetInputSpan<half,void>();
}

void sub_237CAA448(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  _Unwind_Resume(exception_object);
}

void ou3dor::Object3DEncoder::SetEmbeddings(uint64_t a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  obuint64_t j = a2;
  uint64_t v3 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v3)
  {
    double v28 = (void *)(a1 + 48);
    uint64_t v29 = *(void *)v37;
    do
    {
      uint64_t v30 = v3;
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v37 != v29) {
          objc_enumerationMutation(obj);
        }
        id v31 = *(id *)(*((void *)&v36 + 1) + 8 * i);
        double v5 = [v31 identifier];
        BOOL v6 = v5 == 0;

        if (!v6)
        {
          uint64_t v7 = [v31 identifier];
          id v8 = [v7 UUIDString];
          int v9 = (char *)[v8 UTF8String];

          std::string::basic_string[abi:ne180100]<0>(__p, v9);
          int v10 = std::__hash_table<std::__hash_value_type<std::string,__CVBuffer *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,__CVBuffer *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,__CVBuffer *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,__CVBuffer *>>>::find<std::string>(v28, (unsigned __int8 *)__p);
          double v11 = v10;
          if (v35 < 0)
          {
            operator delete(__p[0]);
            if (!v11) {
              goto LABEL_21;
            }
          }
          else if (!v10)
          {
            goto LABEL_21;
          }
          double v12 = [MEMORY[0x263EFF980] arrayWithCapacity:*((int *)v11 + 10)];
          if (*((int *)v11 + 10) >= 1)
          {
            uint64_t v13 = 0;
            do
            {
              uint64_t v14 = (uint64_t)&v11[592 * v13 + 48];
              if (!*(unsigned char *)(v14 + 584)) {
                std::__throw_bad_optional_access[abi:ne180100]();
              }
              memcpy(__dst, (const void *)(v14 + 72), sizeof(__dst));
              float v15 = [MEMORY[0x263EFF980] arrayWithCapacity:256];
              for (uint64_t j = 0; j != 512; j += 2)
              {
                LOWORD(_D0) = *(_WORD *)&__dst[j];
                __asm { FCVT            S0, H0 }
                id v22 = [NSNumber numberWithFloat:_D0];
                [v15 addObject:v22];
              }
              [v12 addObject:v15];

              ++v13;
            }
            while (v13 < *((int *)v11 + 10));
          }
          [v31 setEmbedding2d:v12];
          if (!v11[2928]) {
            std::__throw_bad_optional_access[abi:ne180100]();
          }
          memcpy(v32, v11 + 2416, sizeof(v32));
          double v23 = [MEMORY[0x263EFF980] arrayWithCapacity:256];
          for (uint64_t k = 0; k != 512; k += 2)
          {
            LOWORD(_D0) = *(_WORD *)&v32[k];
            __asm { FCVT            S0, H0 }
            int v26 = [NSNumber numberWithFloat:_D0];
            [v23 addObject:v26];
          }
          [v31 setEmbedding3d:v23];
        }
LABEL_21:
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v3);
  }
}

void sub_237CAA790(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

float ou3dor::Object3DEncoder::ComputeSemanticMaskAndScore@<S0>(__CVBuffer *a1@<X0>, int *a2@<X1>, _DWORD *a3@<X2>, void *a4@<X3>, uint64_t a5@<X8>, int32x2_t a6@<D0>)
{
  if (CVPixelBufferGetPixelFormatType(a1) != 1278226488)
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    __cxa_throw(exception, (struct type_info *)off_264CFAB20, MEMORY[0x263F8C080]);
  }
  uint64_t v24 = a5;
  CVPixelBufferLockBaseAddress(a1, 1uLL);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a1);
  pixelBuffer = a1;
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(a1);
  unint64_t v12 = a2[3] * (uint64_t)a2[2];
  char v29 = 0;
  std::vector<BOOL>::vector(&v30, v12, (unsigned __int8 *)&v29);
  int v13 = a2[3];
  if (v13 < 1)
  {
    int v28 = 0;
  }
  else
  {
    int v14 = 0;
    int v15 = 0;
    int v28 = 0;
    uint64_t v16 = a2[1];
    uint64_t v17 = &BaseAddress[BytesPerRow * v16 + *a2];
    int v18 = a2[2];
    do
    {
      if (v18 >= 1)
      {
        uint64_t v19 = 0;
        int v20 = *a2;
        do
        {
          if (v20 + (int)v19 >= *a3 && v20 + (int)v19 < a3[2] + *a3)
          {
            int v21 = a3[1];
            if ((int)v16 >= v21 && (int)v16 < a3[3] + v21)
            {
              char v29 = v17[v19];
              if (std::__hash_table<std::__hash_value_type<unsigned char,std::vector<unsigned short>>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,std::vector<unsigned short>>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,std::vector<unsigned short>>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,std::vector<unsigned short>>>>::find<unsigned char>(a4, (unsigned __int8 *)&v29))
              {
                *(void *)(v30 + (((unint64_t)(v15 + v19) >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << (v15 + v19);
                ++v28;
              }
              int v18 = a2[2];
            }
          }
          ++v19;
        }
        while (v19 < v18);
        v15 += v19;
        int v13 = a2[3];
      }
      v17 += BytesPerRow;
      ++v14;
      LODWORD(v16) = v16 + 1;
    }
    while (v14 < v13);
  }
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 1uLL);
  float result = roundf((float)((float)(765 * v28) / (float)vmul_lane_s32(a6, a6, 1).i32[0]) * 100.0) / 100.0;
  *(void *)uint64_t v24 = v30;
  *(_OWORD *)(v24 + 8) = v31;
  *(float *)(v24 + 24) = result;
  return result;
}

void sub_237CAAAA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p)
{
  __cxa_free_exception(v16);
  _Unwind_Resume(a1);
}

void ou3dor::Object3DEncoder::AddToObjects(uint64_t a1, uint64_t a2, unsigned __int8 *a3)
{
  uint64_t v5 = a1 + 48;
  BOOL v6 = std::__hash_table<std::__hash_value_type<std::string,__CVBuffer *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,__CVBuffer *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,__CVBuffer *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,__CVBuffer *>>>::find<std::string>((void *)(a1 + 48), a3);
  if (v6)
  {
    ou3dor::Object3DEncoder::AddToObject((uint64_t)v6, (uint64_t *)a2, (int *)v6 + 10);
  }
  else
  {
    int v9 = a3;
    uint64_t v7 = std::__hash_table<std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v5, a3, (uint64_t)&std::piecewise_construct, (long long **)&v9);
    uint64_t v8 = *(void *)a2;
    *((_DWORD *)v7 + 14) = *(_DWORD *)(a2 + 8);
    *((void *)v7 + 6) = v8;
    std::vector<BOOL>::__move_assign((uint64_t)(v7 + 64), (void *)(a2 + 16));
    memcpy(v7 + 88, (const void *)(a2 + 40), 0x221uLL);
    *((_DWORD *)v7 + 10) = 1;
  }
}

uint64_t ou3dor::Object3DEncoder::CalculateBinIdx(float32x2_t *a1, float32x2_t a2)
{
  float32x2_t v2 = vsub_f32(vmul_f32(vadd_f32(*a1, a1[4]), (float32x2_t)0x3F0000003F000000), a2);
  float v3 = atan2f(v2.f32[1], v2.f32[0]);
  if (v3 < 0.0) {
    float v3 = v3 + 6.2832;
  }
  return (int)(float)(v3 * 0.95493);
}

void ou3dor::Object3DEncoder::AddToObject(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v5 = (uint64_t *)(a3 + 2);
  int v6 = (*a3)++;
  uint64_t v7 = (uint64_t)&a3[148 * v6 + 2];
  uint64_t v8 = *a2;
  *(_DWORD *)(v7 + 8) = *((_DWORD *)a2 + 2);
  *(void *)uint64_t v7 = v8;
  std::vector<BOOL>::__move_assign(v7 + 16, a2 + 2);
  memcpy((void *)(v7 + 40), a2 + 5, 0x221uLL);
  unint64_t v9 = *a3;
  unint64_t v10 = 126 - 2 * __clz(v9);
  if (v9) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  std::__introsort<std::_ClassicAlgPolicy,ou3dor::Object3DEncoder::AddToObject(ou3dor::Object3DEncoder::ObjectView &&,ou3dor::Object3DEncoder::ObjectWithViews<3ul> &)::$_0 &,ou3dor::Object3DEncoder::ObjectView*,false>(v5, (uint64_t)&v5[74 * (int)v9], v11, 1);
  unint64_t v12 = *a3;
  if ((int)v12 >= 4)
  {
    LOBYTE(__p[0]) = 0;
    std::vector<BOOL>::vector(&v29, v12, (unsigned __int8 *)__p);
    unsigned __int8 v27 = 0;
    std::vector<BOOL>::vector(__p, 6uLL, &v27);
    unint64_t v13 = *a3;
    int v14 = v29;
    if ((int)v13 < 1)
    {
      int v16 = 0;
    }
    else
    {
      unint64_t v15 = 0;
      int v16 = 0;
      uint64_t v17 = __p[0];
      do
      {
        unint64_t v18 = *(int *)v5;
        unint64_t v19 = v18 >> 6;
        uint64_t v20 = 1 << v18;
        uint64_t v21 = v17[v19];
        if ((v20 & v21) == 0)
        {
          v17[v19] = v20 | v21;
          *(void *)((char *)v14 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
          ++v16;
        }
        if (++v15 >= v13) {
          break;
        }
        v5 += 74;
      }
      while (v16 < 3);
      int v14 = v29;
      if ((int)v13 >= 2 && v16 <= 2)
      {
        unint64_t v22 = 1;
        do
        {
          uint64_t v23 = v14[v22 >> 6];
          if ((v23 & (1 << v22)) == 0)
          {
            v14[v22 >> 6] = v23 | (1 << v22);
            ++v16;
          }
          ++v22;
        }
        while (v22 < v13 && v16 < 3);
      }
    }
    unint64_t v24 = 0;
    uint64_t v25 = a3 - 146;
    do
    {
      uint64_t v26 = *(void *)((char *)v14 + ((v24 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v24;
      ++v24;
      v25 += 148;
    }
    while ((v26 & 1) != 0);
    if ((int)v24 < (int)v13)
    {
      do
      {
        *(void *)uint64_t v25 = *((void *)v25 + 74);
        v25[2] = v25[150];
        std::vector<BOOL>::operator=((void **)v25 + 2, (uint64_t)(v25 + 152));
        memcpy(v25 + 10, v25 + 158, 0x221uLL);
        v25 += 148;
        LODWORD(v24) = v24 + 1;
      }
      while (*a3 > (int)v24);
    }
    *a3 = v16;
    if (__p[0]) {
      operator delete(__p[0]);
    }
    if (v29) {
      operator delete(v29);
    }
  }
}

void sub_237CAAE1C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void ou3dor::Object3DEncoder::~Object3DEncoder(ou3dor::Object3DEncoder *this)
{
  ou3dor::Object3DEncoder::~Object3DEncoder(this);
  JUMPOUT(0x237E2C510);
}

{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  *(void *)this = &unk_26EAD6AF0;
  float32x2_t v2 = *((void *)this + 15);
  *((void *)this + 15) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  float v3 = *((void *)this + 14);
  *((void *)this + 14) = 0;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  uint64_t v4 = (void *)*((void *)this + 11);
  if (v4)
  {
    *((void *)this + 12) = v4;
    operator delete(v4);
  }
  std::__hash_table<std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>>>::~__hash_table((uint64_t)this + 48);
}

void *std::pair<NSString * const {__strong},std::unordered_set<SemanticLabelv5>>::pair[abi:ne180100]<true,0>(void *a1, id *a2, uint64_t a3)
{
  *a1 = *a2;
  std::unordered_set<SemanticLabelv5>::unordered_set((uint64_t)(a1 + 1), a3);
  return a1;
}

void sub_237CAAEC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t std::unordered_set<SemanticLabelv5>::unordered_set(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__rehash<true>(a1, *(void *)(a2 + 8));
  for (uint64_t i = *(unsigned __int8 **)(a2 + 16); i; uint64_t i = *(unsigned __int8 **)i)
    std::__hash_table<SemanticLabelv5,std::hash<SemanticLabelv5>,std::equal_to<SemanticLabelv5>,std::allocator<SemanticLabelv5>>::__emplace_unique_key_args<SemanticLabelv5,SemanticLabelv5 const&>(a1, i + 16, i + 16);
  return a1;
}

void sub_237CAAF3C(_Unwind_Exception *a1)
{
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

void *std::vector<unsigned char>::vector(void *a1, size_t a2, unsigned char *a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    size_t v5 = a2;
    std::vector<unsigned char>::__vallocate[abi:ne180100](a1, a2);
    int v6 = (unsigned char *)a1[1];
    uint64_t v7 = &v6[v5];
    do
    {
      *v6++ = *a3;
      --v5;
    }
    while (v5);
    a1[1] = v7;
  }
  return a1;
}

void sub_237CAAFB8(_Unwind_Exception *exception_object)
{
  float v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *std::__introsort<std::_ClassicAlgPolicy,ou3dor::Object3DEncoder::AddToObject(ou3dor::Object3DEncoder::ObjectView &&,ou3dor::Object3DEncoder::ObjectWithViews<3ul> &)::$_0 &,ou3dor::Object3DEncoder::ObjectView*,false>(uint64_t *result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v8 = (int *)a2;
  m = result;
  __dst[69] = *MEMORY[0x263EF8340];
  uint64_t v92 = (int *)a2;
  uint64_t v93 = result;
  while (1)
  {
    uint64_t v10 = (char *)v8 - (char *)m;
    unint64_t v11 = 0x14C1BACF914C1BADLL * (((char *)v8 - (char *)m) >> 4);
    if (!(!v5 & v4))
    {
      switch(v11)
      {
        case 0uLL:
        case 1uLL:
          return result;
        case 2uLL:
          uint64_t v92 = v8 - 148;
          float v55 = *((float *)v8 - 146);
          float v56 = *((float *)m + 2);
          if (v55 > v56 || v55 == v56 && *(v8 - 147) > *((_DWORD *)m + 1)) {
            float result = (uint64_t *)std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ou3dor::Object3DEncoder::ObjectView *&,ou3dor::Object3DEncoder::ObjectView *&>(&v93, (uint64_t *)&v92);
          }
          break;
        case 3uLL:
          uint64_t v92 = v8 - 148;
          float result = (uint64_t *)std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,ou3dor::Object3DEncoder::AddToObject(ou3dor::Object3DEncoder::ObjectView &&,ou3dor::Object3DEncoder::ObjectWithViews<3ul> &)::$_0 &,ou3dor::Object3DEncoder::ObjectView*>((float *)m, (uint64_t)(m + 74), (uint64_t)(v8 - 148));
          break;
        case 4uLL:
          uint64_t v92 = v8 - 148;
          float result = (uint64_t *)std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,ou3dor::Object3DEncoder::AddToObject(ou3dor::Object3DEncoder::ObjectView &&,ou3dor::Object3DEncoder::ObjectWithViews<3ul> &)::$_0 &,ou3dor::Object3DEncoder::ObjectView*>((uint64_t)m, (uint64_t)(m + 74), (uint64_t)(m + 148), (uint64_t)(v8 - 148));
          break;
        case 5uLL:
          uint64_t v92 = v8 - 148;
          float result = (uint64_t *)std::__sort5_maybe_branchless[abi:ne180100]<std::_ClassicAlgPolicy,ou3dor::Object3DEncoder::AddToObject(ou3dor::Object3DEncoder::ObjectView &&,ou3dor::Object3DEncoder::ObjectWithViews<3ul> &)::$_0 &,ou3dor::Object3DEncoder::ObjectView*,0>((uint64_t)m, (uint64_t)(m + 74), (uint64_t)(m + 148), (uint64_t)(m + 222), (uint64_t)(v8 - 148));
          break;
        default:
          JUMPOUT(0);
      }
      return result;
    }
    if (v10 <= 14207) {
      break;
    }
    if (!a3) {
      return (uint64_t *)std::__partial_sort[abi:ne180100]<std::_ClassicAlgPolicy,ou3dor::Object3DEncoder::AddToObject(ou3dor::Object3DEncoder::ObjectView &&,ou3dor::Object3DEncoder::ObjectWithViews<3ul> &)::$_0 &,ou3dor::Object3DEncoder::ObjectView*,ou3dor::Object3DEncoder::AddToObject(ou3dor::Object3DEncoder::ObjectView &&,ou3dor::Object3DEncoder::ObjectWithViews<3ul> &)::$_0 &>((int *)m, v8, (uint64_t *)v8);
    }
    unint64_t v12 = v11 >> 1;
    uint64_t v13 = (uint64_t)(v8 - 148);
    if ((unint64_t)v10 >= 0x12801)
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,ou3dor::Object3DEncoder::AddToObject(ou3dor::Object3DEncoder::ObjectView &&,ou3dor::Object3DEncoder::ObjectWithViews<3ul> &)::$_0 &,ou3dor::Object3DEncoder::ObjectView*>((float *)m, (uint64_t)&m[74 * (v11 >> 1)], v13);
      uint64_t v14 = 74 * v12;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,ou3dor::Object3DEncoder::AddToObject(ou3dor::Object3DEncoder::ObjectView &&,ou3dor::Object3DEncoder::ObjectWithViews<3ul> &)::$_0 &,ou3dor::Object3DEncoder::ObjectView*>((float *)v93 + 148, (uint64_t)&v93[v14 - 74], (uint64_t)(v92 - 296));
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,ou3dor::Object3DEncoder::AddToObject(ou3dor::Object3DEncoder::ObjectView &&,ou3dor::Object3DEncoder::ObjectWithViews<3ul> &)::$_0 &,ou3dor::Object3DEncoder::ObjectView*>((float *)v93 + 296, (uint64_t)&v93[v14 + 74], (uint64_t)(v92 - 444));
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,ou3dor::Object3DEncoder::AddToObject(ou3dor::Object3DEncoder::ObjectView &&,ou3dor::Object3DEncoder::ObjectWithViews<3ul> &)::$_0 &,ou3dor::Object3DEncoder::ObjectView*>((float *)&v93[v14 - 74], (uint64_t)&v93[v14], (uint64_t)&v93[v14 + 74]);
      __dst[0] = (uint64_t)&v93[v14];
      std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ou3dor::Object3DEncoder::ObjectView *&,ou3dor::Object3DEncoder::ObjectView *&>(&v93, __dst);
    }
    else
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,ou3dor::Object3DEncoder::AddToObject(ou3dor::Object3DEncoder::ObjectView &&,ou3dor::Object3DEncoder::ObjectWithViews<3ul> &)::$_0 &,ou3dor::Object3DEncoder::ObjectView*>((float *)&m[74 * (v11 >> 1)], (uint64_t)m, v13);
    }
    --a3;
    unint64_t v15 = v93;
    if (a4)
    {
      uint64_t v88 = a3;
      float v16 = *((float *)v93 + 2);
    }
    else
    {
      float v17 = *((float *)v93 - 146);
      float v16 = *((float *)v93 + 2);
      if (v17 <= v16 && (v17 != v16 || *((_DWORD *)v93 - 147) <= *((_DWORD *)v93 + 1)))
      {
        unint64_t v36 = (unint64_t)v92;
        unint64_t v94 = (unint64_t)v92;
        uint64_t v37 = v93[2];
        int v39 = *(_DWORD *)v93;
        int v38 = *((_DWORD *)v93 + 1);
        long long v89 = *(_OWORD *)(v93 + 3);
        v93[2] = 0;
        v15[3] = 0;
        v15[4] = 0;
        memcpy(__dst, v15 + 5, 0x221uLL);
        float v40 = *(float *)(v36 - 584);
        if (v16 > v40 || v16 == v40 && v38 > *(_DWORD *)(v36 - 588))
        {
          float v41 = *((float *)v15 + 150);
          if (v16 <= v41)
          {
            int8x16_t v46 = (float *)v15 + 149;
            do
            {
              if (v16 == v41 && v38 > *(_DWORD *)v46) {
                break;
              }
              float v41 = v46[149];
              v46 += 148;
            }
            while (v16 <= v41);
            uint64_t i = (uint64_t *)(v46 - 1);
          }
          else
          {
            uint64_t i = v15 + 74;
          }
        }
        else
        {
          for (uint64_t i = v15 + 74; (unint64_t)i < v36; i += 74)
          {
            float v45 = *((float *)i + 2);
            if (v16 > v45 || v16 == v45 && v38 > *((_DWORD *)i + 1)) {
              break;
            }
          }
        }
        char v95 = (float *)i;
        if ((unint64_t)i < v36)
        {
          for (unint64_t j = v36 - 1176; v16 > v40 || v16 == v40 && v38 > *(_DWORD *)(j + 588); j -= 592)
            float v40 = *(float *)j;
          unint64_t v36 = j + 584;
          unint64_t v94 = j + 584;
        }
        if ((unint64_t)i < v36)
        {
          do
          {
            std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ou3dor::Object3DEncoder::ObjectView *&,ou3dor::Object3DEncoder::ObjectView *&>((uint64_t **)&v95, (uint64_t *)&v94);
            float v48 = v95[150];
            if (v16 <= v48)
            {
              unsigned int v49 = v95 + 149;
              do
              {
                if (v16 == v48 && v38 > *(_DWORD *)v49) {
                  break;
                }
                float v48 = v49[149];
                v49 += 148;
              }
              while (v16 <= v48);
              uint64_t i = (uint64_t *)(v49 - 1);
            }
            else
            {
              uint64_t i = (uint64_t *)(v95 + 148);
            }
            char v95 = (float *)i;
            unint64_t v50 = v94;
            do
            {
              do
              {
                v50 -= 592;
                float v51 = *(float *)(v50 + 8);
              }
              while (v16 > v51);
            }
            while (v16 == v51 && v38 > *(_DWORD *)(v50 + 4));
            unint64_t v94 = v50;
          }
          while ((unint64_t)i < v50);
        }
        uint64_t v52 = i - 74;
        if (i - 74 != v15)
        {
          uint64_t v53 = *v52;
          *((_DWORD *)v15 + 2) = *((_DWORD *)i - 146);
          *unint64_t v15 = v53;
          std::vector<BOOL>::__move_assign((uint64_t)(v15 + 2), i - 72);
          memcpy(v15 + 5, i - 69, 0x221uLL);
        }
        *(_DWORD *)uint64_t v52 = v39;
        uint64_t v54 = (void *)*(i - 72);
        *((_DWORD *)i - 147) = v38;
        *((float *)i - 146) = v16;
        if (v54) {
          operator delete(v54);
        }
        *(i - 72) = v37;
        *(_OWORD *)(i - 71) = v89;
        float result = (uint64_t *)memcpy(i - 69, __dst, 0x221uLL);
        a4 = 0;
        m = (uint64_t *)v95;
        goto LABEL_104;
      }
      uint64_t v88 = a3;
    }
    unint64_t v18 = (unint64_t)v92;
    uint64_t v86 = v93[2];
    int v20 = *(_DWORD *)v93;
    int v19 = *((_DWORD *)v93 + 1);
    long long v84 = *(_OWORD *)(v93 + 3);
    v93[2] = 0;
    v15[3] = 0;
    v15[4] = 0;
    memcpy(__dst, v15 + 5, 0x221uLL);
    for (uint64_t k = 0; ; k += 74)
    {
      float v22 = *(float *)&v15[k + 75];
      if (v22 <= v16 && (v22 != v16 || SHIDWORD(v15[k + 74]) <= v19)) {
        break;
      }
    }
    uint64_t v23 = &v15[k + 74];
    char v95 = (float *)v23;
    if (k * 8)
    {
      unint64_t v24 = v18 - 592;
      float v25 = *(float *)(v18 - 584);
      if (v25 <= v16)
      {
        unint64_t v26 = v18 - 1176;
        do
        {
          if (v25 == v16 && *(_DWORD *)(v26 + 588) > v19) {
            break;
          }
          float v25 = *(float *)v26;
          v26 -= 592;
        }
        while (v25 <= v16);
LABEL_26:
        unint64_t v24 = v26 + 584;
      }
    }
    else
    {
      unint64_t v24 = v18;
      if ((unint64_t)v23 < v18)
      {
        unint64_t v24 = v18 - 592;
        float v27 = *(float *)(v18 - 584);
        if (v27 <= v16)
        {
          unint64_t v26 = v18 - 1176;
          while (1)
          {
            unint64_t v43 = v26 + 584;
            if (v27 == v16)
            {
              if (*(_DWORD *)(v26 + 588) > v19 || (unint64_t)v23 >= v43) {
                break;
              }
            }
            else if ((unint64_t)v23 >= v43)
            {
              goto LABEL_26;
            }
            v24 -= 592;
            float v27 = *(float *)v26;
            v26 -= 592;
            if (v27 > v16) {
              goto LABEL_26;
            }
          }
        }
      }
    }
    unint64_t v94 = v24;
    m = v23;
    if ((unint64_t)v23 < v24)
    {
      do
      {
        std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ou3dor::Object3DEncoder::ObjectView *&,ou3dor::Object3DEncoder::ObjectView *&>((uint64_t **)&v95, (uint64_t *)&v94);
        for (m = (uint64_t *)(v95 + 148); ; m += 74)
        {
          float v28 = *((float *)m + 2);
          if (v28 <= v16 && (v28 != v16 || *((_DWORD *)m + 1) <= v19)) {
            break;
          }
        }
        char v95 = (float *)m;
        unint64_t v29 = v94 - 592;
        float v30 = *(float *)(v94 - 584);
        if (v30 <= v16)
        {
          unint64_t v31 = v94 - 1176;
          do
          {
            if (v30 == v16 && *(_DWORD *)(v31 + 588) > v19) {
              break;
            }
            float v30 = *(float *)v31;
            v31 -= 592;
          }
          while (v30 <= v16);
          unint64_t v29 = v31 + 584;
        }
        unint64_t v94 = v29;
      }
      while ((unint64_t)m < v29);
    }
    float32x4_t v32 = m - 74;
    if (m - 74 != v15)
    {
      uint64_t v33 = *v32;
      *((_DWORD *)v15 + 2) = *((_DWORD *)m - 146);
      *unint64_t v15 = v33;
      std::vector<BOOL>::__move_assign((uint64_t)(v15 + 2), m - 72);
      memcpy(v15 + 5, m - 69, 0x221uLL);
    }
    *(_DWORD *)float32x4_t v32 = v20;
    float32x4_t v34 = (void *)*(m - 72);
    *((_DWORD *)m - 147) = v19;
    *((float *)m - 146) = v16;
    if (v34) {
      operator delete(v34);
    }
    *(m - 72) = v86;
    *(_OWORD *)(m - 71) = v84;
    memcpy(m - 69, __dst, 0x221uLL);
    a3 = v88;
    if ((unint64_t)v23 < v24) {
      goto LABEL_51;
    }
    BOOL v35 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,ou3dor::Object3DEncoder::AddToObject(ou3dor::Object3DEncoder::ObjectView &&,ou3dor::Object3DEncoder::ObjectWithViews<3ul> &)::$_0 &,ou3dor::Object3DEncoder::ObjectView*>((uint64_t)v93, (uint64_t)(m - 74));
    float result = (uint64_t *)std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,ou3dor::Object3DEncoder::AddToObject(ou3dor::Object3DEncoder::ObjectView &&,ou3dor::Object3DEncoder::ObjectWithViews<3ul> &)::$_0 &,ou3dor::Object3DEncoder::ObjectView*>((uint64_t)m, (uint64_t)v92);
    if (!result)
    {
      if (!v35)
      {
LABEL_51:
        float result = (uint64_t *)std::__introsort<std::_ClassicAlgPolicy,ou3dor::Object3DEncoder::AddToObject(ou3dor::Object3DEncoder::ObjectView &&,ou3dor::Object3DEncoder::ObjectWithViews<3ul> &)::$_0 &,ou3dor::Object3DEncoder::ObjectView*,false>(v93, m - 74, v88, a4 & 1);
        a4 = 0;
      }
LABEL_104:
      uint64_t v93 = m;
      goto LABEL_105;
    }
    if (v35) {
      return result;
    }
    uint64_t v92 = (int *)(m - 74);
    m = v93;
LABEL_105:
    uint64_t v8 = v92;
  }
  int8x16_t v57 = m + 74;
  BOOL v59 = m == (uint64_t *)v8 || v57 == (uint64_t *)v8;
  if (a4)
  {
    if (v59) {
      return result;
    }
    uint64_t v60 = 0;
    int v61 = m;
    while (2)
    {
      float v62 = v61;
      int v61 = v57;
      float v63 = *((float *)v62 + 150);
      float v64 = *((float *)v62 + 2);
      if (v63 > v64)
      {
        int v65 = *((_DWORD *)v62 + 149);
        goto LABEL_127;
      }
      if (v63 == v64)
      {
        int v65 = *((_DWORD *)v62 + 149);
        if (v65 > *((_DWORD *)v62 + 1))
        {
LABEL_127:
          int v87 = *((_DWORD *)v62 + 148);
          uint64_t v66 = v62[76];
          uint64_t v67 = v62[77];
          uint64_t v90 = v62[78];
          v62[76] = 0;
          v62[78] = 0;
          v62[77] = 0;
          memcpy(__dst, v62 + 79, 0x221uLL);
          uint64_t *v61 = *v62;
          *((_DWORD *)v61 + 2) = *((_DWORD *)v62 + 2);
          uint64_t v68 = (uint64_t)(v62 + 2);
          std::vector<BOOL>::__move_assign((uint64_t)(v61 + 2), v62 + 2);
          int32x2_t v69 = v62 + 5;
          memcpy(v61 + 5, v62 + 5, 0x221uLL);
          if (v62 == m)
          {
            float v62 = m;
          }
          else
          {
            uint64_t v83 = v67;
            long long v85 = v61;
            uint64_t v70 = v60;
            do
            {
              int v71 = (char *)m + v70;
              float v72 = *(float *)((char *)m + v70 - 584);
              if (v63 <= v72)
              {
                if (v63 != v72)
                {
                  float v62 = (uint64_t *)((char *)m + v70);
                  int32x2_t v69 = (uint64_t *)((char *)m + v70 + 40);
                  uint64_t v68 = (uint64_t)m + v70 + 16;
                  goto LABEL_136;
                }
                if (v65 <= *(_DWORD *)((char *)m + v70 - 588)) {
                  goto LABEL_136;
                }
              }
              *(void *)int v71 = *((void *)v71 - 74);
              *((_DWORD *)v71 + 2) = *((_DWORD *)v71 - 146);
              uint64_t v68 = (uint64_t)(v62 - 72);
              std::vector<BOOL>::__move_assign((uint64_t)(v71 + 16), (void *)v71 - 72);
              int32x2_t v69 = v62 - 69;
              memcpy(v71 + 40, v71 - 552, 0x221uLL);
              v62 -= 74;
              v70 -= 592;
            }
            while (v70);
            int32x2_t v69 = m + 5;
            float v62 = m;
LABEL_136:
            int v61 = v85;
            uint64_t v67 = v83;
          }
          *(_DWORD *)float v62 = v87;
          *((_DWORD *)v62 + 1) = v65;
          *((float *)v62 + 2) = v63;
          if (*(void *)v68)
          {
            operator delete(*(void **)v68);
            *(void *)(v68 + 8) = 0;
            *(void *)(v68 + 16) = 0;
          }
          *(void *)uint64_t v68 = v66;
          v62[3] = v67;
          v62[4] = v90;
          float result = (uint64_t *)memcpy(v69, __dst, 0x221uLL);
        }
      }
      int8x16_t v57 = v61 + 74;
      v60 += 592;
      if (v61 + 74 == (uint64_t *)v8) {
        return result;
      }
      continue;
    }
  }
  if (!v59)
  {
    for (n = m + 3; ; n += 74)
    {
      float v74 = m;
      m = v57;
      float v75 = *((float *)v74 + 150);
      float v76 = *((float *)v74 + 2);
      if (v75 > v76) {
        break;
      }
      if (v75 == v76)
      {
        int v77 = *((_DWORD *)v74 + 149);
        if (v77 > *((_DWORD *)v74 + 1)) {
          goto LABEL_149;
        }
      }
LABEL_157:
      int8x16_t v57 = m + 74;
      if (m + 74 == (uint64_t *)v8) {
        return result;
      }
    }
    int v77 = *((_DWORD *)v74 + 149);
LABEL_149:
    int v78 = *(_DWORD *)v57;
    uint64_t v79 = v74[76];
    long long v91 = *(_OWORD *)(v74 + 77);
    v74[76] = 0;
    v74[78] = 0;
    v74[77] = 0;
    memcpy(__dst, v74 + 79, 0x221uLL);
    for (iuint64_t i = n; ; ii -= 74)
    {
      ii[71] = *(ii - 3);
      *((_DWORD *)ii + 144) = *((_DWORD *)ii - 4);
      std::vector<BOOL>::__move_assign((uint64_t)(ii + 73), ii - 1);
      memcpy(ii + 76, ii + 2, 0x221uLL);
      float v81 = *((float *)ii - 152);
      if (v75 <= v81 && (v75 != v81 || v77 <= *((_DWORD *)ii - 153))) {
        break;
      }
    }
    *((_DWORD *)ii - 6) = v78;
    *((_DWORD *)ii - 5) = v77;
    *((float *)ii - 4) = v75;
    v82 = (void *)*(ii - 1);
    if (v82) {
      operator delete(v82);
    }
    *(ii - 1) = v79;
    *(_OWORD *)iuint64_t i = v91;
    float result = (uint64_t *)memcpy(ii + 2, __dst, 0x221uLL);
    goto LABEL_157;
  }
  return result;
}

void *std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ou3dor::Object3DEncoder::ObjectView *&,ou3dor::Object3DEncoder::ObjectView *&>(uint64_t **a1, uint64_t *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  float32x2_t v2 = *a1;
  uint64_t v3 = *a2;
  uint64_t v10 = **a1;
  int v11 = *((_DWORD *)*a1 + 2);
  uint64_t v4 = (*a1)[2];
  uint64_t v5 = (*a1)[3];
  uint64_t v6 = (*a1)[4];
  v2[2] = 0;
  v2[3] = 0;
  v2[4] = 0;
  memcpy(__dst, v2 + 5, sizeof(__dst));
  int v7 = *(_DWORD *)(v3 + 8);
  uint64_t *v2 = *(void *)v3;
  *((_DWORD *)v2 + 2) = v7;
  std::vector<BOOL>::__move_assign((uint64_t)(v2 + 2), (void *)(v3 + 16));
  memcpy(v2 + 5, (const void *)(v3 + 40), 0x221uLL);
  *(void *)uint64_t v3 = v10;
  *(_DWORD *)(v3 + 8) = v11;
  uint64_t v8 = *(void **)(v3 + 16);
  if (v8) {
    operator delete(v8);
  }
  *(void *)(v3 + 16) = v4;
  *(void *)(v3 + 24) = v5;
  *(void *)(v3 + 32) = v6;
  return memcpy((void *)(v3 + 40), __dst, 0x221uLL);
}

void *std::__sort5_maybe_branchless[abi:ne180100]<std::_ClassicAlgPolicy,ou3dor::Object3DEncoder::AddToObject(ou3dor::Object3DEncoder::ObjectView &&,ou3dor::Object3DEncoder::ObjectWithViews<3ul> &)::$_0 &,ou3dor::Object3DEncoder::ObjectView*,0>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  float v22 = (float *)a2;
  uint64_t v23 = (uint64_t *)a1;
  int v20 = (float *)a4;
  uint64_t v21 = (float *)a3;
  uint64_t v19 = a5;
  float result = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,ou3dor::Object3DEncoder::AddToObject(ou3dor::Object3DEncoder::ObjectView &&,ou3dor::Object3DEncoder::ObjectWithViews<3ul> &)::$_0 &,ou3dor::Object3DEncoder::ObjectView*>(a1, a2, a3, a4);
  float v11 = *(float *)(a5 + 8);
  float v12 = *(float *)(a4 + 8);
  if (v11 > v12 || v11 == v12 && *(_DWORD *)(a5 + 4) > *(_DWORD *)(a4 + 4))
  {
    float result = std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ou3dor::Object3DEncoder::ObjectView *&,ou3dor::Object3DEncoder::ObjectView *&>((uint64_t **)&v20, &v19);
    float v13 = v20[2];
    float v14 = *(float *)(a3 + 8);
    if (v13 > v14 || v13 == v14 && *((_DWORD *)v20 + 1) > *(_DWORD *)(a3 + 4))
    {
      float result = std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ou3dor::Object3DEncoder::ObjectView *&,ou3dor::Object3DEncoder::ObjectView *&>((uint64_t **)&v21, (uint64_t *)&v20);
      float v15 = v21[2];
      float v16 = *(float *)(a2 + 8);
      if (v15 > v16 || v15 == v16 && *((_DWORD *)v21 + 1) > *(_DWORD *)(a2 + 4))
      {
        float result = std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ou3dor::Object3DEncoder::ObjectView *&,ou3dor::Object3DEncoder::ObjectView *&>((uint64_t **)&v22, (uint64_t *)&v21);
        float v17 = v22[2];
        float v18 = *(float *)(a1 + 8);
        if (v17 > v18 || v17 == v18 && *((_DWORD *)v22 + 1) > *(_DWORD *)(a1 + 4)) {
          return std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ou3dor::Object3DEncoder::ObjectView *&,ou3dor::Object3DEncoder::ObjectView *&>(&v23, (uint64_t *)&v22);
        }
      }
    }
  }
  return result;
}

int *std::__partial_sort[abi:ne180100]<std::_ClassicAlgPolicy,ou3dor::Object3DEncoder::AddToObject(ou3dor::Object3DEncoder::ObjectView &&,ou3dor::Object3DEncoder::ObjectWithViews<3ul> &)::$_0 &,ou3dor::Object3DEncoder::ObjectView*,ou3dor::Object3DEncoder::AddToObject(ou3dor::Object3DEncoder::ObjectView &&,ou3dor::Object3DEncoder::ObjectWithViews<3ul> &)::$_0 &>(int *result, int *a2, uint64_t *a3)
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  if (result != a2)
  {
    uint64_t v4 = a2;
    uint64_t v5 = (float *)result;
    float v62 = (float *)result;
    uint64_t v6 = (char *)a2 - (char *)result;
    uint64_t v7 = ((char *)a2 - (char *)result) / 592;
    if ((char *)a2 - (char *)result >= 593)
    {
      unint64_t v8 = (unint64_t)(v7 - 2) >> 1;
      unint64_t v9 = v8 + 1;
      uint64_t v10 = &result[148 * v8];
      do
      {
        float result = (int *)std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,ou3dor::Object3DEncoder::AddToObject(ou3dor::Object3DEncoder::ObjectView &&,ou3dor::Object3DEncoder::ObjectWithViews<3ul> &)::$_0 &,ou3dor::Object3DEncoder::ObjectView*>(v5, v7, v10);
        v10 -= 148;
        --v9;
      }
      while (v9);
    }
    int v61 = (uint64_t *)v4;
    if (v4 != (int *)a3)
    {
      float v11 = (uint64_t *)v4;
      do
      {
        float v12 = *((float *)v11 + 2);
        float v13 = v62[2];
        if (v12 > v13 || v12 == v13 && *((_DWORD *)v11 + 1) > *((_DWORD *)v62 + 1))
        {
          std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ou3dor::Object3DEncoder::ObjectView *&,ou3dor::Object3DEncoder::ObjectView *&>(&v61, (uint64_t *)&v62);
          float result = (int *)std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,ou3dor::Object3DEncoder::AddToObject(ou3dor::Object3DEncoder::ObjectView &&,ou3dor::Object3DEncoder::ObjectWithViews<3ul> &)::$_0 &,ou3dor::Object3DEncoder::ObjectView*>(v62, v7, (int *)v62);
          float v11 = v61;
        }
        v11 += 74;
        int v61 = v11;
      }
      while (v11 != a3);
      uint64_t v5 = v62;
      uint64_t v6 = (char *)v4 - (char *)v62;
    }
    if (v6 >= 593)
    {
      int64_t v14 = v6 / 0x250uLL;
      uint64_t v54 = v5 + 10;
      float v55 = v5 + 4;
      uint64_t v53 = v5;
      do
      {
        float v15 = v4;
        uint64_t v63 = *(void *)v5;
        int v64 = *((_DWORD *)v5 + 2);
        float v16 = (void *)*((void *)v5 + 2);
        uint64_t v57 = *((void *)v5 + 4);
        uint64_t v59 = *((void *)v5 + 3);
        v55[1] = 0;
        v55[2] = 0;
        *float v55 = 0;
        memcpy(__dst, v54, 0x221uLL);
        uint64_t v17 = 0;
        float v18 = v5;
        do
        {
          uint64_t v19 = v18;
          uint64_t v20 = v17 + 1;
          v18 += 148 * v17 + 148;
          uint64_t v21 = 2 * v17;
          uint64_t v17 = (2 * v17) | 1;
          int64_t v22 = v21 + 2;
          if (v22 < v14)
          {
            float v23 = v19[148 * v20 + 2];
            float v24 = v18[150];
            if (v23 > v24 || v23 == v24 && SLODWORD(v19[148 * v20 + 1]) > *((_DWORD *)v18 + 149))
            {
              v18 += 148;
              uint64_t v17 = v22;
            }
          }
          uint64_t v25 = *(void *)v18;
          v19[2] = v18[2];
          *(void *)uint64_t v19 = v25;
          unint64_t v26 = v18 + 4;
          std::vector<BOOL>::__move_assign((uint64_t)(v19 + 4), (void *)v18 + 2);
          float v27 = v19 + 10;
          float v28 = v18 + 10;
          memcpy(v27, v18 + 10, 0x221uLL);
        }
        while (v17 <= (uint64_t)((unint64_t)(v14 - 2) >> 1));
        v4 -= 148;
        if (v18 == (float *)(v15 - 148))
        {
          uint64_t v36 = v63;
          *((_DWORD *)v18 + 2) = v64;
          *(void *)float v18 = v36;
          uint64_t v37 = (void *)*((void *)v18 + 2);
          if (v37) {
            operator delete(v37);
          }
          *((void *)v18 + 2) = v16;
          *((void *)v18 + 3) = v59;
          *((void *)v18 + 4) = v57;
          int v38 = __dst;
          int v39 = v18 + 10;
        }
        else
        {
          uint64_t v29 = *(void *)v4;
          *((_DWORD *)v18 + 2) = *(v15 - 146);
          *(void *)float v18 = v29;
          float v30 = (void **)(v15 - 144);
          std::vector<BOOL>::__move_assign((uint64_t)(v18 + 4), (void *)v15 - 72);
          unint64_t v31 = v15 - 138;
          memcpy(v18 + 10, v31, 0x221uLL);
          *(void *)uint64_t v4 = v63;
          v4[2] = v64;
          if (*v30) {
            operator delete(*v30);
          }
          __CFString *v30 = v16;
          *((void *)v4 + 3) = v59;
          *((void *)v4 + 4) = v57;
          float result = (int *)memcpy(v31, __dst, 0x221uLL);
          uint64_t v5 = v53;
          if ((char *)(v18 + 148) - (char *)v53 < 593) {
            continue;
          }
          unint64_t v32 = (((char *)(v18 + 148) - (char *)v53) / 0x250uLL - 2) >> 1;
          uint64_t v33 = &v53[148 * v32];
          float v34 = v33[2];
          float v35 = v18[2];
          if (v34 <= v35)
          {
            if (v34 != v35) {
              continue;
            }
            int v60 = *((_DWORD *)v18 + 1);
            if (SLODWORD(v53[148 * v32 + 1]) <= v60) {
              continue;
            }
          }
          else
          {
            int v60 = *((_DWORD *)v18 + 1);
          }
          int v51 = *(_DWORD *)v18;
          uint64_t v56 = *((void *)v18 + 3);
          uint64_t v58 = *((void *)v18 + 2);
          uint64_t v52 = *((void *)v18 + 4);
          *unint64_t v26 = 0;
          *((void *)v18 + 3) = 0;
          *((void *)v18 + 4) = 0;
          unint64_t v50 = ((char *)(v18 + 148) - (char *)v53) / 0x250uLL - 2;
          memcpy(__src, v18 + 10, 0x221uLL);
          int v40 = *((_DWORD *)v33 + 2);
          *(void *)float v18 = *(void *)v33;
          *((_DWORD *)v18 + 2) = v40;
          float v41 = &v53[148 * v32];
          long long v42 = v41 + 4;
          std::vector<BOOL>::__move_assign((uint64_t)v26, (void *)v41 + 2);
          unint64_t v43 = v41 + 10;
          memcpy(v28, v41 + 10, 0x221uLL);
          if (v50 >= 2)
          {
            while (1)
            {
              unint64_t v45 = v32 - 1;
              unint64_t v32 = (v32 - 1) >> 1;
              int v44 = &v53[148 * v32];
              float v46 = v44[2];
              if (v46 <= v35 && (v46 != v35 || SLODWORD(v53[148 * v32 + 1]) <= v60)) {
                break;
              }
              uint64_t v47 = *(void *)v44;
              v33[2] = v44[2];
              *(void *)uint64_t v33 = v47;
              float v48 = &v53[148 * v32];
              long long v42 = v48 + 4;
              std::vector<BOOL>::__move_assign((uint64_t)(v33 + 4), (void *)v48 + 2);
              unint64_t v43 = v48 + 10;
              memcpy(v33 + 10, v43, 0x221uLL);
              uint64_t v33 = &v53[148 * v32];
              if (v45 <= 1) {
                goto LABEL_39;
              }
            }
          }
          int v44 = v33;
LABEL_39:
          *(_DWORD *)int v44 = v51;
          *((_DWORD *)v44 + 1) = v60;
          v44[2] = v35;
          if (*(void *)v42)
          {
            operator delete(*(void **)v42);
            *((void *)v42 + 1) = 0;
            *((void *)v42 + 2) = 0;
          }
          *(void *)long long v42 = v58;
          *((void *)v44 + 3) = v56;
          *((void *)v44 + 4) = v52;
          int v38 = __src;
          int v39 = (void *)v43;
        }
        float result = (int *)memcpy(v39, v38, 0x221uLL);
      }
      while (v14-- > 2);
    }
  }
  return result;
}

float *std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,ou3dor::Object3DEncoder::AddToObject(ou3dor::Object3DEncoder::ObjectView &&,ou3dor::Object3DEncoder::ObjectWithViews<3ul> &)::$_0 &,ou3dor::Object3DEncoder::ObjectView*>(float *result, uint64_t a2, uint64_t a3)
{
  float v15 = result;
  uint64_t v13 = a3;
  int64_t v14 = (float *)a2;
  float v3 = *(float *)(a2 + 8);
  float v4 = result[2];
  if (v3 > v4 || v3 == v4 && *(_DWORD *)(a2 + 4) > *((_DWORD *)result + 1))
  {
    float v5 = *(float *)(a3 + 8);
    if (v5 > v3 || v5 == v3 && *(_DWORD *)(a3 + 4) > *(_DWORD *)(a2 + 4))
    {
      uint64_t v6 = &v15;
LABEL_19:
      uint64_t v10 = &v13;
      return (float *)std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ou3dor::Object3DEncoder::ObjectView *&,ou3dor::Object3DEncoder::ObjectView *&>((uint64_t **)v6, v10);
    }
    float result = (float *)std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ou3dor::Object3DEncoder::ObjectView *&,ou3dor::Object3DEncoder::ObjectView *&>((uint64_t **)&v15, (uint64_t *)&v14);
    float v11 = *(float *)(v13 + 8);
    float v12 = v14[2];
    if (v11 > v12 || v11 == v12 && *(_DWORD *)(v13 + 4) > *((_DWORD *)v14 + 1))
    {
      uint64_t v6 = &v14;
      goto LABEL_19;
    }
  }
  else
  {
    float v7 = *(float *)(a3 + 8);
    if (v7 > v3 || v7 == v3 && *(_DWORD *)(a3 + 4) > *(_DWORD *)(a2 + 4))
    {
      float result = (float *)std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ou3dor::Object3DEncoder::ObjectView *&,ou3dor::Object3DEncoder::ObjectView *&>((uint64_t **)&v14, &v13);
      float v8 = v14[2];
      float v9 = v15[2];
      if (v8 > v9 || v8 == v9 && *((_DWORD *)v14 + 1) > *((_DWORD *)v15 + 1))
      {
        uint64_t v6 = &v15;
        uint64_t v10 = (uint64_t *)&v14;
        return (float *)std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ou3dor::Object3DEncoder::ObjectView *&,ou3dor::Object3DEncoder::ObjectView *&>((uint64_t **)v6, v10);
      }
    }
  }
  return result;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,ou3dor::Object3DEncoder::AddToObject(ou3dor::Object3DEncoder::ObjectView &&,ou3dor::Object3DEncoder::ObjectWithViews<3ul> &)::$_0 &,ou3dor::Object3DEncoder::ObjectView*>(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v27 = a2;
  float v28 = (uint64_t *)a1;
  uint64_t v4 = (a2 - a1) >> 4;
  BOOL result = 1;
  switch(0x14C1BACF914C1BADLL * v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      uint64_t v27 = a2 - 592;
      float v6 = *(float *)(a2 - 584);
      float v7 = *(float *)(a1 + 8);
      if (v6 > v7 || v6 == v7 && *(_DWORD *)(a2 - 588) > *(_DWORD *)(a1 + 4))
      {
        std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ou3dor::Object3DEncoder::ObjectView *&,ou3dor::Object3DEncoder::ObjectView *&>(&v28, &v27);
        return 1;
      }
      return result;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,ou3dor::Object3DEncoder::AddToObject(ou3dor::Object3DEncoder::ObjectView &&,ou3dor::Object3DEncoder::ObjectWithViews<3ul> &)::$_0 &,ou3dor::Object3DEncoder::ObjectView*>((float *)a1, a1 + 592, a2 - 592);
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,ou3dor::Object3DEncoder::AddToObject(ou3dor::Object3DEncoder::ObjectView &&,ou3dor::Object3DEncoder::ObjectWithViews<3ul> &)::$_0 &,ou3dor::Object3DEncoder::ObjectView*>(a1, a1 + 592, a1 + 1184, a2 - 592);
      return 1;
    case 5:
      std::__sort5_maybe_branchless[abi:ne180100]<std::_ClassicAlgPolicy,ou3dor::Object3DEncoder::AddToObject(ou3dor::Object3DEncoder::ObjectView &&,ou3dor::Object3DEncoder::ObjectWithViews<3ul> &)::$_0 &,ou3dor::Object3DEncoder::ObjectView*,0>(a1, a1 + 592, a1 + 1184, a1 + 1776, a2 - 592);
      return 1;
    default:
      float v8 = (uint64_t *)(a1 + 1184);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,ou3dor::Object3DEncoder::AddToObject(ou3dor::Object3DEncoder::ObjectView &&,ou3dor::Object3DEncoder::ObjectWithViews<3ul> &)::$_0 &,ou3dor::Object3DEncoder::ObjectView*>((float *)a1, a1 + 592, a1 + 1184);
      uint64_t v9 = a1 + 1776;
      if (a1 + 1776 == v2) {
        return 1;
      }
      int v10 = 0;
      float v11 = (float *)(a1 + 1224);
      break;
  }
  while (1)
  {
    float v12 = *(float *)(v9 + 8);
    float v13 = *((float *)v8 + 2);
    if (v12 <= v13)
    {
      if (v12 != v13) {
        goto LABEL_25;
      }
      int v14 = *(_DWORD *)(v9 + 4);
      if (v14 <= *((_DWORD *)v8 + 1)) {
        goto LABEL_25;
      }
    }
    else
    {
      int v14 = *(_DWORD *)(v9 + 4);
    }
    int v26 = v10;
    int v24 = *(_DWORD *)v9;
    uint64_t v15 = *(void *)(v9 + 16);
    uint64_t v16 = *(void *)(v9 + 24);
    uint64_t v25 = *(void *)(v9 + 32);
    *(void *)(v9 + 16) = 0;
    *(void *)(v9 + 24) = 0;
    *(void *)(v9 + 32) = 0;
    memcpy(__dst, (const void *)(v9 + 40), sizeof(__dst));
    *(void *)uint64_t v9 = *v8;
    *(_DWORD *)(v9 + 8) = *((_DWORD *)v8 + 2);
    uint64_t v17 = v8 + 2;
    std::vector<BOOL>::__move_assign(v9 + 16, v8 + 2);
    float v18 = (float *)(v8 + 5);
    memcpy((void *)(v9 + 40), v8 + 5, 0x221uLL);
    uint64_t v19 = v28;
    if (v8 != v28)
    {
      uint64_t v23 = v16;
      float v18 = v11;
      while (1)
      {
        float v20 = *(v18 - 156);
        if (v12 <= v20)
        {
          if (v12 != v20) {
            goto LABEL_20;
          }
          if (v14 <= *((_DWORD *)v18 - 157)) {
            break;
          }
        }
        uint64_t v21 = (uint64_t *)(v18 - 158);
        *((void *)v18 - 5) = *((void *)v18 - 79);
        *(v18 - 8) = *(v18 - 156);
        uint64_t v17 = v8 - 72;
        std::vector<BOOL>::__move_assign((uint64_t)(v18 - 6), (void *)v18 - 77);
        int64_t v22 = v18 - 148;
        memcpy(v18, v18 - 148, 0x221uLL);
        v18 -= 148;
        v8 -= 74;
        if (v21 == v19)
        {
          float v8 = v19;
          float v18 = v22;
          goto LABEL_20;
        }
      }
      uint64_t v17 = (uint64_t *)(v18 - 6);
      float v8 = (uint64_t *)(v18 - 10);
LABEL_20:
      uint64_t v16 = v23;
    }
    *(_DWORD *)float v8 = v24;
    *((_DWORD *)v8 + 1) = v14;
    *((float *)v8 + 2) = v12;
    if (*v17)
    {
      operator delete((void *)*v17);
      v17[1] = 0;
      v17[2] = 0;
    }
    *uint64_t v17 = v15;
    v8[3] = v16;
    v8[4] = v25;
    memcpy(v18, __dst, 0x221uLL);
    int v10 = v26 + 1;
    if (v26 == 7) {
      return v9 + 592 == v27;
    }
    uint64_t v2 = v27;
LABEL_25:
    float v8 = (uint64_t *)v9;
    v11 += 148;
    v9 += 592;
    if (v9 == v2) {
      return 1;
    }
  }
}

void *std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,ou3dor::Object3DEncoder::AddToObject(ou3dor::Object3DEncoder::ObjectView &&,ou3dor::Object3DEncoder::ObjectWithViews<3ul> &)::$_0 &,ou3dor::Object3DEncoder::ObjectView*>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v17 = (float *)a2;
  float v18 = (uint64_t *)a1;
  uint64_t v15 = a4;
  uint64_t v16 = (float *)a3;
  BOOL result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,ou3dor::Object3DEncoder::AddToObject(ou3dor::Object3DEncoder::ObjectView &&,ou3dor::Object3DEncoder::ObjectWithViews<3ul> &)::$_0 &,ou3dor::Object3DEncoder::ObjectView*>((float *)a1, a2, a3);
  float v9 = *(float *)(a4 + 8);
  float v10 = *(float *)(a3 + 8);
  if (v9 > v10 || v9 == v10 && *(_DWORD *)(a4 + 4) > *(_DWORD *)(a3 + 4))
  {
    BOOL result = std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ou3dor::Object3DEncoder::ObjectView *&,ou3dor::Object3DEncoder::ObjectView *&>((uint64_t **)&v16, &v15);
    float v11 = v16[2];
    float v12 = *(float *)(a2 + 8);
    if (v11 > v12 || v11 == v12 && *((_DWORD *)v16 + 1) > *(_DWORD *)(a2 + 4))
    {
      BOOL result = std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ou3dor::Object3DEncoder::ObjectView *&,ou3dor::Object3DEncoder::ObjectView *&>((uint64_t **)&v17, (uint64_t *)&v16);
      float v13 = v17[2];
      float v14 = *(float *)(a1 + 8);
      if (v13 > v14 || v13 == v14 && *((_DWORD *)v17 + 1) > *(_DWORD *)(a1 + 4)) {
        return std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ou3dor::Object3DEncoder::ObjectView *&,ou3dor::Object3DEncoder::ObjectView *&>(&v18, (uint64_t *)&v17);
      }
    }
  }
  return result;
}

float *std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,ou3dor::Object3DEncoder::AddToObject(ou3dor::Object3DEncoder::ObjectView &&,ou3dor::Object3DEncoder::ObjectWithViews<3ul> &)::$_0 &,ou3dor::Object3DEncoder::ObjectView*>(float *result, uint64_t a2, int *a3)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  unint64_t v3 = a2 - 2;
  if (a2 >= 2)
  {
    float v5 = result;
    uint64_t v6 = v3 >> 1;
    if ((uint64_t)(v3 >> 1) >= 0x14C1BACF914C1BADLL * (((char *)a3 - (char *)result) >> 4))
    {
      uint64_t v8 = (0x2983759F2298375ALL * (((char *)a3 - (char *)result) >> 4)) | 1;
      float v9 = &result[148 * v8];
      if (0x2983759F2298375ALL * (((char *)a3 - (char *)result) >> 4) + 2 < a2)
      {
        float v10 = result[148 * v8 + 2];
        float v11 = v9[150];
        if (v10 > v11 || v10 == v11 && SLODWORD(result[148 * v8 + 1]) > *((_DWORD *)v9 + 149))
        {
          v9 += 148;
          uint64_t v8 = 0x2983759F2298375ALL * (((char *)a3 - (char *)result) >> 4) + 2;
        }
      }
      float v12 = v9[2];
      float v13 = *((float *)a3 + 2);
      if (v12 <= v13)
      {
        if (v12 == v13)
        {
          int v14 = a3[1];
          if (*((_DWORD *)v9 + 1) > v14) {
            return result;
          }
        }
        else
        {
          int v14 = a3[1];
        }
        int v27 = *a3;
        uint64_t v15 = (uint64_t)(a3 + 4);
        uint64_t v29 = *((void *)a3 + 3);
        uint64_t v30 = *((void *)a3 + 2);
        uint64_t v28 = *((void *)a3 + 4);
        *((void *)a3 + 2) = 0;
        uint64_t v16 = a3 + 10;
        *((void *)a3 + 3) = 0;
        *((void *)a3 + 4) = 0;
        memcpy(__dst, a3 + 10, sizeof(__dst));
        int v17 = *((_DWORD *)v9 + 2);
        *(void *)a3 = *(void *)v9;
        a3[2] = v17;
        float v18 = v9 + 4;
        std::vector<BOOL>::__move_assign(v15, (void *)v9 + 2);
        uint64_t v19 = v9 + 10;
        memcpy(v16, v9 + 10, 0x221uLL);
        if (v6 >= v8)
        {
          while (1)
          {
            uint64_t v22 = 2 * v8;
            uint64_t v8 = (2 * v8) | 1;
            float v20 = &v5[148 * v8];
            if (v22 + 2 < a2)
            {
              float v23 = v5[148 * v8 + 2];
              float v24 = v20[150];
              if (v23 > v24 || v23 == v24 && SLODWORD(v5[148 * v8 + 1]) > *((_DWORD *)v20 + 149))
              {
                v20 += 148;
                uint64_t v8 = v22 + 2;
              }
            }
            float v25 = v20[2];
            if (v25 > v13 || v25 == v13 && *((_DWORD *)v20 + 1) > v14) {
              break;
            }
            uint64_t v26 = *(void *)v20;
            v9[2] = v20[2];
            *(void *)float v9 = v26;
            float v18 = v20 + 4;
            std::vector<BOOL>::__move_assign((uint64_t)(v9 + 4), (void *)v20 + 2);
            uint64_t v19 = v20 + 10;
            memcpy(v9 + 10, v20 + 10, 0x221uLL);
            float v9 = v20;
            if (v6 < v8) {
              goto LABEL_14;
            }
          }
        }
        float v20 = v9;
LABEL_14:
        *(_DWORD *)float v20 = v27;
        *((_DWORD *)v20 + 1) = v14;
        v20[2] = v13;
        uint64_t v21 = (void *)*((void *)v20 + 2);
        if (v21)
        {
          operator delete(v21);
          v18[1] = 0;
          v18[2] = 0;
        }
        *float v18 = v30;
        *((void *)v20 + 3) = v29;
        *((void *)v20 + 4) = v28;
        return (float *)memcpy(v19, __dst, 0x221uLL);
      }
    }
  }
  return result;
}

uint64_t std::map<NSString * {__strong},std::unordered_set<SemanticLabelv5>>::map[abi:ne180100](uint64_t a1, unint64_t *a2, uint64_t a3)
{
  *(void *)(a1 + 8) = 0;
  uint64_t v4 = (void *)(a1 + 8);
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = a1 + 8;
  if (a3)
  {
    uint64_t v6 = 48 * a3;
    do
    {
      std::__tree<std::__value_type<NSString * {__strong},std::unordered_set<SemanticLabelv5>>,std::__map_value_compare<NSString * {__strong},std::__value_type<NSString * {__strong},std::unordered_set<SemanticLabelv5>>,std::less<NSString * {__strong}>,true>,std::allocator<std::__value_type<NSString * {__strong},std::unordered_set<SemanticLabelv5>>>>::__emplace_hint_unique_key_args<NSString * {__strong},std::pair<NSString * const {__strong},std::unordered_set<SemanticLabelv5>> const&>((uint64_t **)a1, v4, a2, (id *)a2);
      a2 += 6;
      v6 -= 48;
    }
    while (v6);
  }
  return a1;
}

void sub_237CAC92C(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<NSString * {__strong},std::unordered_set<SemanticLabelv5>>,std::__map_value_compare<NSString * {__strong},std::__value_type<NSString * {__strong},std::unordered_set<SemanticLabelv5>>,std::less<NSString * {__strong}>,true>,std::allocator<std::__value_type<NSString * {__strong},std::unordered_set<SemanticLabelv5>>>>::destroy(v1, *(void **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::__value_type<NSString * {__strong},std::unordered_set<SemanticLabelv5>>,std::__map_value_compare<NSString * {__strong},std::__value_type<NSString * {__strong},std::unordered_set<SemanticLabelv5>>,std::less<NSString * {__strong}>,true>,std::allocator<std::__value_type<NSString * {__strong},std::unordered_set<SemanticLabelv5>>>>::__emplace_hint_unique_key_args<NSString * {__strong},std::pair<NSString * const {__strong},std::unordered_set<SemanticLabelv5>> const&>(uint64_t **a1, void *a2, unint64_t *a3, id *a4)
{
  uint64_t v6 = (uint64_t **)std::__tree<std::__value_type<NSString * {__strong},std::set<unsigned char>>,std::__map_value_compare<NSString * {__strong},std::__value_type<NSString * {__strong},std::set<unsigned char>>,std::less<NSString * {__strong}>,true>,std::allocator<std::__value_type<NSString * {__strong},std::set<unsigned char>>>>::__find_equal<NSString * {__strong}>(a1, a2, &v10, &v9, a3);
  BOOL result = *v6;
  if (!*v6)
  {
    std::__tree<std::__value_type<NSString * {__strong},std::unordered_set<SemanticLabelv5>>,std::__map_value_compare<NSString * {__strong},std::__value_type<NSString * {__strong},std::unordered_set<SemanticLabelv5>>,std::less<NSString * {__strong}>,true>,std::allocator<std::__value_type<NSString * {__strong},std::unordered_set<SemanticLabelv5>>>>::__construct_node<std::pair<NSString * const {__strong},std::unordered_set<SemanticLabelv5>> const&>((uint64_t)a1, a4, (uint64_t)&v8);
    std::__tree<int>::__insert_node_at(a1, v10, v6, v8);
    return v8;
  }
  return result;
}

void *std::__tree<std::__value_type<NSString * {__strong},std::unordered_set<SemanticLabelv5>>,std::__map_value_compare<NSString * {__strong},std::__value_type<NSString * {__strong},std::unordered_set<SemanticLabelv5>>,std::less<NSString * {__strong}>,true>,std::allocator<std::__value_type<NSString * {__strong},std::unordered_set<SemanticLabelv5>>>>::__construct_node<std::pair<NSString * const {__strong},std::unordered_set<SemanticLabelv5>> const&>@<X0>(uint64_t a1@<X0>, id *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  uint64_t v6 = operator new(0x50uLL);
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v5;
  *(unsigned char *)(a3 + 16) = 0;
  BOOL result = std::pair<NSString * const {__strong},std::unordered_set<SemanticLabelv5>>::pair[abi:ne180100](v6 + 4, a2);
  *(unsigned char *)(a3 + 16) = 1;
  return result;
}

void sub_237CACA30(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0;
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<NSString * {__strong},std::unordered_set<SemanticLabelv5>>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

void *std::pair<NSString * const {__strong},std::unordered_set<SemanticLabelv5>>::pair[abi:ne180100](void *a1, id *a2)
{
  uint64_t v3 = (uint64_t)(a2 + 1);
  *a1 = *a2;
  std::unordered_set<SemanticLabelv5>::unordered_set((uint64_t)(a1 + 1), v3);
  return a1;
}

void sub_237CACA90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<NSString * {__strong},std::unordered_set<SemanticLabelv5>>,void *>>>::operator()[abi:ne180100](uint64_t a1, id *a2)
{
  if (*(unsigned char *)(a1 + 8))
  {
    std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)(a2 + 5));
  }
  else if (!a2)
  {
    return;
  }
  operator delete(a2);
}

void std::__tree<std::__value_type<NSString * {__strong},std::unordered_set<SemanticLabelv5>>,std::__map_value_compare<NSString * {__strong},std::__value_type<NSString * {__strong},std::unordered_set<SemanticLabelv5>>,std::less<NSString * {__strong}>,true>,std::allocator<std::__value_type<NSString * {__strong},std::unordered_set<SemanticLabelv5>>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<NSString * {__strong},std::unordered_set<SemanticLabelv5>>,std::__map_value_compare<NSString * {__strong},std::__value_type<NSString * {__strong},std::unordered_set<SemanticLabelv5>>,std::less<NSString * {__strong}>,true>,std::allocator<std::__value_type<NSString * {__strong},std::unordered_set<SemanticLabelv5>>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<NSString * {__strong},std::unordered_set<SemanticLabelv5>>,std::__map_value_compare<NSString * {__strong},std::__value_type<NSString * {__strong},std::unordered_set<SemanticLabelv5>>,std::less<NSString * {__strong}>,true>,std::allocator<std::__value_type<NSString * {__strong},std::unordered_set<SemanticLabelv5>>>>::destroy(a1, a2[1]);
    std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)(a2 + 5));

    operator delete(a2);
  }
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>>>::__deallocate_node(a1, *(void **)(a1 + 16));
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>>>::__deallocate_node(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v2 = a2;
    do
    {
      uint64_t v3 = (void *)*v2;
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,0>((uint64_t)(v2 + 2));
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,0>(uint64_t a1)
{
  for (uint64_t i = 1824; i != -544; i -= 592)
  {
    uint64_t v3 = *(void **)(a1 + i);
    if (v3) {
      operator delete(v3);
    }
  }
  if (*(char *)(a1 + 23) < 0)
  {
    uint64_t v4 = *(void **)a1;
    operator delete(v4);
  }
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1, unsigned __int8 *a2, uint64_t a3, long long **a4)
{
  uint64_t v8 = (void *)(a1 + 24);
  unint64_t v9 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  unint64_t v10 = v9;
  unint64_t v11 = *(void *)(a1 + 8);
  if (v11)
  {
    uint8x8_t v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    unint64_t v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      unint64_t v4 = v9;
      if (v9 >= v11) {
        unint64_t v4 = v9 % v11;
      }
    }
    else
    {
      unint64_t v4 = (v11 - 1) & v9;
    }
    int v14 = *(unsigned __int8 ***)(*(void *)a1 + 8 * v4);
    if (v14)
    {
      for (uint64_t i = *v14; i; uint64_t i = *(unsigned __int8 **)i)
      {
        unint64_t v16 = *((void *)i + 1);
        if (v16 == v10)
        {
          if (std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, i + 16, a2)) {
            return i;
          }
        }
        else
        {
          if (v13 > 1)
          {
            if (v16 >= v11) {
              v16 %= v11;
            }
          }
          else
          {
            v16 &= v11 - 1;
          }
          if (v16 != v4) {
            break;
          }
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(a1, v10, a4, (uint64_t)v26);
  float v17 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v18 = *(float *)(a1 + 32);
  if (!v11 || (float)(v18 * (float)v11) < v17)
  {
    BOOL v19 = 1;
    if (v11 >= 3) {
      BOOL v19 = (v11 & (v11 - 1)) != 0;
    }
    unint64_t v20 = v19 | (2 * v11);
    unint64_t v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21) {
      size_t v22 = v21;
    }
    else {
      size_t v22 = v20;
    }
    std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__rehash<true>(a1, v22);
    unint64_t v11 = *(void *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11) {
        unint64_t v4 = v10 % v11;
      }
      else {
        unint64_t v4 = v10;
      }
    }
    else
    {
      unint64_t v4 = (v11 - 1) & v10;
    }
  }
  float v23 = *(void **)(*(void *)a1 + 8 * v4);
  if (v23)
  {
    *(void *)v26[0] = *v23;
    void *v23 = v26[0];
  }
  else
  {
    *(void *)v26[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v26[0];
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (*(void *)v26[0])
    {
      unint64_t v24 = *(void *)(*(void *)v26[0] + 8);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v24 >= v11) {
          v24 %= v11;
        }
      }
      else
      {
        v24 &= v11 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v24) = v26[0];
    }
  }
  uint64_t i = (unsigned __int8 *)v26[0];
  v26[0] = 0;
  ++*v8;
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,void *>>>>::reset[abi:ne180100]((uint64_t)v26, 0);
  return i;
}

void sub_237CACED0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,void *>>>>::reset[abi:ne180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

std::string *std::__hash_table<std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, long long **a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  uint64_t v8 = (char *)operator new(0xB78uLL);
  *(void *)a4 = v8;
  *(void *)(a4 + 8) = v7;
  *(unsigned char *)(a4 + 16) = 0;
  *(void *)uint64_t v8 = 0;
  *((void *)v8 + 1) = a2;
  BOOL result = std::pair<std::string const,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>::pair[abi:ne180100]<std::string const&>((std::string *)(v8 + 16), *a3);
  *(unsigned char *)(a4 + 16) = 1;
  return result;
}

void sub_237CACF40(_Unwind_Exception *a1)
{
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,void *>>>>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

std::string *std::pair<std::string const,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>::pair[abi:ne180100]<std::string const&>(std::string *this, long long *a2)
{
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v3 = *a2;
    this->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v3;
  }
  bzero(&this[1], 0xB50uLL);
  for (uint64_t i = 0; i != 2368; i += 592)
  {
    uint64_t v5 = (char *)this + i;
    *((void *)v5 + 6) = 0;
    *((void *)v5 + 7) = 0;
    *((void *)v5 + 8) = 0;
    v5[104] = 0;
    v5[616] = 0;
  }
  this[100].__r_.__value_.__s.__data_[0] = 0;
  this[121].__r_.__value_.__s.__data_[8] = 0;
  return this;
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,0>((uint64_t)v2 + 16);
    }
    operator delete(v2);
  }
}

void _GLOBAL__sub_I_Object3DEncoder_mm()
{
  v120[7] = *MEMORY[0x263EF8340];
  context = (void *)MEMORY[0x237E2CC70]();
  LODWORD(v64) = 0;
  *((void *)&v64 + 1) = @"Unknown";
  LODWORD(v65) = 1;
  *((void *)&v65 + 1) = *((id *)&v64 + 1);
  LODWORD(v66) = 2;
  *((void *)&v66 + 1) = *((id *)&v65 + 1);
  LODWORD(v67) = 3;
  *((void *)&v67 + 1) = *((id *)&v66 + 1);
  LODWORD(v68) = 4;
  *((void *)&v68 + 1) = *((id *)&v67 + 1);
  LODWORD(v69) = 5;
  *((void *)&v69 + 1) = *((id *)&v68 + 1);
  LODWORD(v70) = 6;
  unint64_t v21 = @"Door";
  *((void *)&v70 + 1) = v21;
  LODWORD(v71) = 7;
  unint64_t v20 = @"Window";
  *((void *)&v71 + 1) = v20;
  LODWORD(v72) = 8;
  *((void *)&v72 + 1) = *((id *)&v69 + 1);
  LODWORD(v73) = 9;
  float v18 = @"Fireplace";
  *((void *)&v73 + 1) = v18;
  LODWORD(v74) = 10;
  *((void *)&v74 + 1) = *((id *)&v72 + 1);
  LODWORD(v75) = 11;
  *((void *)&v75 + 1) = *((id *)&v74 + 1);
  LODWORD(v76) = 12;
  BOOL v19 = @"Stairs";
  *((void *)&v76 + 1) = v19;
  LODWORD(v77) = 13;
  int v14 = @"Bed";
  *((void *)&v77 + 1) = v14;
  LODWORD(v78) = 14;
  uint64_t v79 = @"Cabinet";
  LODWORD(v80) = 15;
  float v17 = @"Chair";
  float v81 = v17;
  int v82 = 16;
  uint64_t v83 = v79;
  int v84 = 17;
  long long v85 = v83;
  LODWORD(v86) = 18;
  unint64_t v16 = @"Sofa";
  int v87 = v16;
  int v88 = 19;
  uint64_t v15 = @"Table";
  long long v89 = v15;
  int v90 = 20;
  unint64_t v13 = @"Toilet";
  long long v91 = v13;
  LODWORD(v92[0]) = 21;
  unint64_t v11 = @"Sink";
  v92[1] = v11;
  int v93 = 22;
  uint8x8_t v12 = @"Bathtub";
  unint64_t v94 = v12;
  int v95 = 23;
  id v96 = *((id *)&v75 + 1);
  LODWORD(v97[0]) = 24;
  v0 = @"Refrigerator";
  v97[1] = v0;
  int v98 = 25;
  uint64_t v1 = @"Stove";
  simd_float4x4 v99 = v1;
  int v100 = 26;
  uint64_t v2 = @"Washer";
  float32x4_t v101 = v2;
  LODWORD(v102[0]) = 27;
  long long v3 = @"Oven";
  v102[1] = v3;
  int v103 = 28;
  unint64_t v4 = @"Dishwasher";
  long long v104 = v4;
  int v105 = 29;
  id v106 = v96;
  LODWORD(v107[0]) = 30;
  uint64_t v5 = v85;
  v107[1] = v5;
  int v108 = 31;
  id v109 = v106;
  int v110 = 32;
  unint64_t v10 = @"Screen";
  double v111 = v10;
  std::unordered_map<int,NSString * {__strong}>::unordered_map((uint64_t)&kSemanticsODLabelMap, (int *)&v64, 33);
  for (uint64_t i = 520; i != -8; i -= 16)

  __cxa_atexit((void (*)(void *))std::unordered_map<int,NSString * {__strong}>::~unordered_map[abi:ne180100], &kSemanticsODLabelMap, &dword_237C17000);
  long long v74 = xmmword_237CB6910;
  long long v75 = unk_237CB6920;
  long long v76 = xmmword_237CB6930;
  long long v77 = unk_237CB6940;
  long long v70 = xmmword_237CB68D0;
  long long v71 = unk_237CB68E0;
  long long v72 = xmmword_237CB68F0;
  long long v73 = unk_237CB6900;
  long long v66 = xmmword_237CB6890;
  long long v67 = unk_237CB68A0;
  long long v68 = xmmword_237CB68B0;
  long long v69 = unk_237CB68C0;
  long long v64 = xmmword_237CB6870;
  long long v65 = unk_237CB6880;
  uint64_t v78 = 28;
  std::unordered_map<int,SemanticLabelv5>::unordered_map((uint64_t)&kSparseSSDSemanticLabels, (int *)&v64, 29);
  __cxa_atexit((void (*)(void *))std::unordered_map<int,SemanticLabelv5>::~unordered_map[abi:ne180100], &kSparseSSDSemanticLabels, &dword_237C17000);
  LODWORD(v64) = 0;
  *((void *)&v64 + 1) = v5;
  LODWORD(v65) = 1;
  *((void *)&v65 + 1) = v0;
  LODWORD(v66) = 2;
  *((void *)&v66 + 1) = @"Shelf";
  LODWORD(v67) = 3;
  *((void *)&v67 + 1) = v1;
  LODWORD(v68) = 4;
  *((void *)&v68 + 1) = v14;
  LODWORD(v69) = 5;
  *((void *)&v69 + 1) = v11;
  LODWORD(v70) = 6;
  *((void *)&v70 + 1) = v2;
  LODWORD(v71) = 7;
  *((void *)&v71 + 1) = v13;
  LODWORD(v72) = 8;
  *((void *)&v72 + 1) = v12;
  LODWORD(v73) = 9;
  *((void *)&v73 + 1) = v3;
  LODWORD(v74) = 10;
  *((void *)&v74 + 1) = v4;
  LODWORD(v75) = 11;
  *((void *)&v75 + 1) = v18;
  LODWORD(v76) = 12;
  *((void *)&v76 + 1) = @"Stool";
  LODWORD(v77) = 13;
  *((void *)&v77 + 1) = v17;
  LODWORD(v78) = 14;
  uint64_t v79 = v15;
  LODWORD(v80) = 15;
  float v81 = v10;
  int v82 = 16;
  uint64_t v83 = v16;
  int v84 = 17;
  long long v85 = v19;
  LODWORD(v86) = 18;
  int v87 = v20;
  int v88 = 19;
  long long v89 = v21;
  int v90 = 20;
  long long v91 = @"BuildInCabinet";
  std::unordered_map<int,NSString * {__strong}>::unordered_map((uint64_t)&kSparseSSDObjectLabels, (int *)&v64, 21);
  for (uint64_t j = 328; j != -8; j -= 16)

  __cxa_atexit((void (*)(void *))std::unordered_map<int,NSString * {__strong}>::~unordered_map[abi:ne180100], &kSparseSSDObjectLabels, &dword_237C17000);
  __int16 v61 = 4366;
  char v62 = 30;
  std::unordered_set<SemanticLabelv5>::unordered_set((uint64_t)v63, (unsigned __int8 *)&v61, 3);
  std::pair<NSString * const {__strong},std::unordered_set<SemanticLabelv5>>::pair[abi:ne180100]<true,0>(&v64, (id *)&OU3DObjectTypeCabinet, (uint64_t)v63);
  unsigned __int8 v59 = 24;
  std::unordered_set<SemanticLabelv5>::unordered_set((uint64_t)v60, &v59, 1);
  std::pair<NSString * const {__strong},std::unordered_set<SemanticLabelv5>>::pair[abi:ne180100]<true,0>(&v67, (id *)&OU3DObjectTypeRefrigerator, (uint64_t)v60);
  __int16 v56 = 4366;
  char v57 = 30;
  std::unordered_set<SemanticLabelv5>::unordered_set((uint64_t)v58, (unsigned __int8 *)&v56, 3);
  std::pair<NSString * const {__strong},std::unordered_set<SemanticLabelv5>>::pair[abi:ne180100]<true,0>(&v70, (id *)&OU3DObjectTypeShelf, (uint64_t)v58);
  unsigned __int8 v54 = 25;
  std::unordered_set<SemanticLabelv5>::unordered_set((uint64_t)v55, &v54, 1);
  std::pair<NSString * const {__strong},std::unordered_set<SemanticLabelv5>>::pair[abi:ne180100]<true,0>(&v73, (id *)&OU3DObjectTypeStove, (uint64_t)v55);
  unsigned __int8 v52 = 13;
  std::unordered_set<SemanticLabelv5>::unordered_set((uint64_t)v53, &v52, 1);
  std::pair<NSString * const {__strong},std::unordered_set<SemanticLabelv5>>::pair[abi:ne180100]<true,0>(&v76, (id *)&OU3DObjectTypeBed, (uint64_t)v53);
  unsigned __int8 v50 = 21;
  std::unordered_set<SemanticLabelv5>::unordered_set((uint64_t)v51, &v50, 1);
  std::pair<NSString * const {__strong},std::unordered_set<SemanticLabelv5>>::pair[abi:ne180100]<true,0>(&v80, (id *)&OU3DObjectTypeSink, (uint64_t)v51);
  unsigned __int8 v48 = 26;
  std::unordered_set<SemanticLabelv5>::unordered_set((uint64_t)v49, &v48, 1);
  std::pair<NSString * const {__strong},std::unordered_set<SemanticLabelv5>>::pair[abi:ne180100]<true,0>(&v86, (id *)&OU3DObjectTypeWasher, (uint64_t)v49);
  unsigned __int8 v46 = 20;
  std::unordered_set<SemanticLabelv5>::unordered_set((uint64_t)v47, &v46, 1);
  std::pair<NSString * const {__strong},std::unordered_set<SemanticLabelv5>>::pair[abi:ne180100]<true,0>(v92, (id *)&OU3DObjectTypeToilet, (uint64_t)v47);
  unsigned __int8 v44 = 22;
  std::unordered_set<SemanticLabelv5>::unordered_set((uint64_t)v45, &v44, 1);
  std::pair<NSString * const {__strong},std::unordered_set<SemanticLabelv5>>::pair[abi:ne180100]<true,0>(v97, (id *)&OU3DObjectTypeBathtub, (uint64_t)v45);
  unsigned __int8 v42 = 27;
  std::unordered_set<SemanticLabelv5>::unordered_set((uint64_t)v43, &v42, 1);
  std::pair<NSString * const {__strong},std::unordered_set<SemanticLabelv5>>::pair[abi:ne180100]<true,0>(v102, (id *)&OU3DObjectTypeOven, (uint64_t)v43);
  unsigned __int8 v40 = 28;
  std::unordered_set<SemanticLabelv5>::unordered_set((uint64_t)v41, &v40, 1);
  std::pair<NSString * const {__strong},std::unordered_set<SemanticLabelv5>>::pair[abi:ne180100]<true,0>(v107, (id *)&OU3DObjectTypeDishwasher, (uint64_t)v41);
  unsigned __int8 v38 = 9;
  std::unordered_set<SemanticLabelv5>::unordered_set((uint64_t)v39, &v38, 1);
  std::pair<NSString * const {__strong},std::unordered_set<SemanticLabelv5>>::pair[abi:ne180100]<true,0>(v112, (id *)&OU3DObjectTypeFireplace, (uint64_t)v39);
  unsigned __int8 v36 = 15;
  std::unordered_set<SemanticLabelv5>::unordered_set((uint64_t)v37, &v36, 1);
  std::pair<NSString * const {__strong},std::unordered_set<SemanticLabelv5>>::pair[abi:ne180100]<true,0>(v113, (id *)&OU3DObjectTypeStool, (uint64_t)v37);
  unsigned __int8 v34 = 15;
  std::unordered_set<SemanticLabelv5>::unordered_set((uint64_t)v35, &v34, 1);
  std::pair<NSString * const {__strong},std::unordered_set<SemanticLabelv5>>::pair[abi:ne180100]<true,0>(v114, (id *)&OU3DObjectTypeChair, (uint64_t)v35);
  unsigned __int8 v32 = 19;
  std::unordered_set<SemanticLabelv5>::unordered_set((uint64_t)v33, &v32, 1);
  std::pair<NSString * const {__strong},std::unordered_set<SemanticLabelv5>>::pair[abi:ne180100]<true,0>(v115, (id *)&OU3DObjectTypeTable, (uint64_t)v33);
  unsigned __int8 v30 = 32;
  std::unordered_set<SemanticLabelv5>::unordered_set((uint64_t)v31, &v30, 1);
  std::pair<NSString * const {__strong},std::unordered_set<SemanticLabelv5>>::pair[abi:ne180100]<true,0>(v116, (id *)&OU3DObjectTypeScreen, (uint64_t)v31);
  unsigned __int8 v28 = 18;
  std::unordered_set<SemanticLabelv5>::unordered_set((uint64_t)v29, &v28, 1);
  std::pair<NSString * const {__strong},std::unordered_set<SemanticLabelv5>>::pair[abi:ne180100]<true,0>(v117, (id *)&OU3DObjectTypeSofa, (uint64_t)v29);
  unsigned __int8 v26 = 12;
  std::unordered_set<SemanticLabelv5>::unordered_set((uint64_t)v27, &v26, 1);
  std::pair<NSString * const {__strong},std::unordered_set<SemanticLabelv5>>::pair[abi:ne180100]<true,0>(v118, (id *)&OU3DObjectTypeStairs, (uint64_t)v27);
  unsigned __int8 v24 = 7;
  std::unordered_set<SemanticLabelv5>::unordered_set((uint64_t)v25, &v24, 1);
  std::pair<NSString * const {__strong},std::unordered_set<SemanticLabelv5>>::pair[abi:ne180100]<true,0>(v119, (id *)&OU3DObjectTypeWindow, (uint64_t)v25);
  unsigned __int8 v22 = 6;
  std::unordered_set<SemanticLabelv5>::unordered_set((uint64_t)v23, &v22, 1);
  std::pair<NSString * const {__strong},std::unordered_set<SemanticLabelv5>>::pair[abi:ne180100]<true,0>(v120, (id *)&OU3DObjectTypeDoor, (uint64_t)v23);
  std::map<NSString * {__strong},std::unordered_set<SemanticLabelv5>>::map[abi:ne180100]((uint64_t)&kObjectTypeToSemanticLabels, (unint64_t *)&v64, 20);
  uint64_t v8 = 960;
  do
  {
    std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)&v63[v8]);

    v8 -= 48;
  }
  while (v8);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)v23);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)v25);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)v27);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)v29);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)v31);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)v33);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)v35);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)v37);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)v39);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)v41);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)v43);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)v45);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)v47);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)v49);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)v51);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)v53);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)v55);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)v58);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)v60);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)v63);
  __cxa_atexit((void (*)(void *))std::map<NSString * {__strong},std::unordered_set<SemanticLabelv5>>::~map[abi:ne180100], &kObjectTypeToSemanticLabels, &dword_237C17000);
}

void sub_237CADCAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,char a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,char a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  uint64_t v74 = 960;
  do
  {
    std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table(v72 + v74 - 40);

    v74 -= 48;
  }
  while (v74);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)&a24);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)&a30);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)&a36);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)&a42);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)&a48);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)&a54);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)&a60);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)&a66);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)&a72);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)&STACK[0x228]);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)&STACK[0x258]);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)&STACK[0x288]);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)&STACK[0x2B8]);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)&STACK[0x2E8]);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)&STACK[0x318]);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)&STACK[0x348]);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)&STACK[0x378]);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)&STACK[0x3A8]);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)&STACK[0x3D8]);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)&STACK[0x408]);
  _Unwind_Resume(a1);
}

CVPixelBufferRef CreateCVPixelBuffer(uint64_t a1, uint64_t a2)
{
  v15[4] = *MEMORY[0x263EF8340];
  CVPixelBufferRef pixelBufferOut = 0;
  CVPixelBufferPoolRef poolOut = 0;
  v14[0] = *MEMORY[0x263F04180];
  unint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
  v15[0] = v4;
  v14[1] = *MEMORY[0x263F04240];
  uint64_t v5 = [NSNumber numberWithUnsignedLong:a1];
  v15[1] = v5;
  v14[2] = *MEMORY[0x263F04118];
  uint64_t v6 = [NSNumber numberWithUnsignedLong:a2];
  v14[3] = *MEMORY[0x263F04130];
  v15[2] = v6;
  v15[3] = MEMORY[0x263EFFA78];
  CFDictionaryRef v7 = (const __CFDictionary *)[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:4];

  CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CVPixelBufferPoolCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, v7, &poolOut);
  if (CVPixelBufferPoolCreatePixelBuffer(v8, poolOut, &pixelBufferOut))
  {
    unint64_t v10 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      CreateCVPixelBuffer(v10);
    }

    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x237E2C1F0](exception, &unk_237CC3E0E);
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  CVPixelBufferPoolRelease(poolOut);
  return pixelBufferOut;
}

void sub_237CAE0F8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

float GetVoteWeight(float a1, float a2)
{
  double v2 = vabds_f32(a1, a2);
  float result = 3.0;
  if (v2 >= 0.1)
  {
    float result = 2.0;
    if (v2 >= 0.2)
    {
      float result = 0.0;
      if (v2 < 0.3) {
        return 1.0;
      }
    }
  }
  return result;
}

unint64_t HistogramMaxBin(float **a1, uint64_t a2, float a3)
{
  uint64_t v5 = *a1;
  uint64_t v6 = a1[1];
  if (v5 == v6 || (char *)v6 - (char *)v5 != *(void *)(a2 + 8) - *(void *)a2)
  {
    uint64_t v25 = 0;
    unint64_t v26 = 0;
  }
  else
  {
    LOBYTE(v29) = 0;
    CFAllocatorRef v8 = std::__minmax_element_impl[abi:ne180100]<std::__wrap_iter<float const*>,std::__wrap_iter<float const*>,std::__identity,std::__less<void,void>>(v5, v6);
    unint64_t v10 = (int)(vcvtms_s32_f32((float)((float)(*v9 + a3) - *v8) / a3) + 1);
    int v29 = 0;
    std::vector<float>::vector(&__p, v10, &v29);
    unint64_t v11 = *a1;
    uint8x8_t v12 = (float *)__p;
    uint64_t v13 = (char *)a1[1] - (char *)*a1;
    if (v13)
    {
      unint64_t v14 = v13 >> 2;
      uint64_t v15 = *(float **)a2;
      if (v14 <= 1) {
        unint64_t v14 = 1;
      }
      do
      {
        float v16 = *v11++;
        signed int v17 = vcvtms_s32_f32((float)(v16 - *v8) / a3);
        float v18 = *v15++;
        v12[v17] = v18 + v12[v17];
        --v14;
      }
      while (v14);
    }
    if (v12 == v31)
    {
      unint64_t v20 = v12;
    }
    else
    {
      BOOL v19 = v12 + 1;
      unint64_t v20 = v12;
      if (v12 + 1 != v31)
      {
        float v21 = *v12;
        unint64_t v20 = v12;
        unsigned __int8 v22 = v12 + 1;
        do
        {
          float v23 = *v22++;
          float v24 = v23;
          if (v21 < v23)
          {
            float v21 = v24;
            unint64_t v20 = v19;
          }
          BOOL v19 = v22;
        }
        while (v22 != v31);
      }
    }
    float v27 = *v8 + (float)((float)(v20 - v12) * a3);
    uint64_t v25 = (int)*v20;
    if (v12)
    {
      unint64_t v31 = v12;
      operator delete(v12);
    }
    unint64_t v26 = (unint64_t)LODWORD(v27) << 32;
  }
  return v26 | v25;
}

void SmoothObjectUponHistory(OU3DObject *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v225 = *MEMORY[0x263EF8340];
  long long v3 = a1;
  unint64_t v4 = v3;
  if (!v3) {
    goto LABEL_93;
  }
  uint64_t v5 = [(OU3DObject *)v3 refined_box_history];

  if (!v5) {
    goto LABEL_93;
  }
  uint64_t v6 = [(OU3DObject *)v4 refined_box_history];
  unint64_t v7 = [v6 count];

  if (v7 < 3) {
    goto LABEL_93;
  }
  CFAllocatorRef v8 = [(OU3DObject *)v4 refined_box_history];
  unint64_t v9 = v7 - 1;
  unint64_t v10 = [v8 objectAtIndexedSubscript:v7 - 1];
  if (!v10) {
    goto LABEL_92;
  }
  unint64_t v11 = [(OU3DObject *)v4 refined_box_history];
  uint8x8_t v12 = [v11 objectAtIndexedSubscript:v9];
  uint64_t v13 = [v12 refinedBox];

  if (!v13)
  {
LABEL_93:
    *(unsigned char *)a2 = 0;
    *(unsigned char *)(a2 + 128) = 0;
    goto LABEL_94;
  }
  CFAllocatorRef v8 = [(OU3DObject *)v4 refined_box_history];
  unint64_t v14 = [v8 objectAtIndexedSubscript:v9];
  uint64_t v15 = [v14 preRefinedBox];
  if (!v15)
  {

LABEL_92:
    goto LABEL_93;
  }
  float v16 = [(OU3DObject *)v4 refined_box_history];
  signed int v17 = [v16 objectAtIndexedSubscript:v9];
  float v18 = [v17 preRefinedBox];
  uint64_t v19 = [v18 count];

  if (v19 != 8) {
    goto LABEL_93;
  }
  float32x4_t v222 = 0u;
  float32x4_t v223 = 0u;
  float32x4_t v220 = 0u;
  float32x4_t v221 = 0u;
  float32x4_t v218 = 0u;
  float32x4_t v219 = 0u;
  float32x4_t v216 = 0u;
  float32x4_t v217 = 0u;
  unint64_t v20 = [(OU3DObject *)v4 refined_box_history];
  float v21 = [v20 objectAtIndexedSubscript:v9];
  unsigned __int8 v22 = [v21 preRefinedBox];
  box3dFromNSArray(v22, (uint64_t)&v216);

  box3dToCentroidSizeAngle(&v216, (uint64_t *)__p);
  float v23 = *((float *)__p[0] + 6);
  __p[1] = __p[0];
  operator delete(__p[0]);
  if (v23 < -9.0) {
    goto LABEL_93;
  }
  v214 = 0;
  v213 = 0;
  v215 = 0;
  v211 = 0;
  v210 = 0;
  v212 = 0;
  v208 = 0;
  v207 = 0;
  v209 = 0;
  v205 = 0;
  v204 = 0;
  v206 = 0;
  long long v202 = 0u;
  long long v203 = 0u;
  long long v200 = 0u;
  long long v201 = 0u;
  float v24 = [(OU3DObject *)v4 refined_box_history];
  uint64_t v25 = [v24 countByEnumeratingWithState:&v200 objects:v224 count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v201;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v201 != v26) {
          objc_enumerationMutation(v24);
        }
        unsigned __int8 v28 = *(void **)(*((void *)&v200 + 1) + 8 * i);
        int v29 = [v28 refinedBox];
        if (v29)
        {
          unsigned __int8 v30 = [v28 refinedBox];
          BOOL v31 = [v30 count] == 8;

          if (v31)
          {
            float32x4_t v222 = 0u;
            float32x4_t v223 = 0u;
            float32x4_t v220 = 0u;
            float32x4_t v221 = 0u;
            float32x4_t v218 = 0u;
            float32x4_t v219 = 0u;
            float32x4_t v216 = 0u;
            float32x4_t v217 = 0u;
            unsigned __int8 v32 = [v28 refinedBox];
            box3dFromNSArray(v32, (uint64_t)&v216);

            box3dToCentroidSizeAngle(&v216, (uint64_t *)__p);
            float v33 = *((float *)__p[0] + 6);
            __p[1] = __p[0];
            operator delete(__p[0]);
            if (vabds_f32(v33, v23) < 0.2)
            {
              unsigned __int8 v34 = v205;
              if (v205 >= v206)
              {
                unsigned __int8 v36 = (char *)v204;
                uint64_t v37 = (v205 - (unsigned char *)v204) >> 2;
                unint64_t v38 = v37 + 1;
                if ((unint64_t)(v37 + 1) >> 62) {
                  goto LABEL_155;
                }
                uint64_t v39 = v206 - (unsigned char *)v204;
                if ((v206 - (unsigned char *)v204) >> 1 > v38) {
                  unint64_t v38 = v39 >> 1;
                }
                if ((unint64_t)v39 >= 0x7FFFFFFFFFFFFFFCLL) {
                  unint64_t v40 = 0x3FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v40 = v38;
                }
                if (v40)
                {
                  float v41 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v206, v40);
                  unsigned __int8 v34 = v205;
                  unsigned __int8 v36 = (char *)v204;
                }
                else
                {
                  float v41 = 0;
                }
                unsigned __int8 v42 = (float *)&v41[4 * v37];
                *unsigned __int8 v42 = v33;
                float v35 = (char *)(v42 + 1);
                while (v34 != v36)
                {
                  int v43 = *((_DWORD *)v34 - 1);
                  v34 -= 4;
                  *((_DWORD *)v42-- - 1) = v43;
                }
                v204 = v42;
                v205 = v35;
                v206 = &v41[4 * v40];
                if (v36) {
                  operator delete(v36);
                }
              }
              else
              {
                *(float *)v205 = v33;
                float v35 = v34 + 4;
              }
              v205 = v35;
              unsigned __int8 v44 = v208;
              if (v208 >= (float32x4_t *)v209)
              {
                unsigned __int8 v52 = (float32x4_t *)v207;
                uint64_t v53 = ((char *)v208 - (unsigned char *)v207) >> 7;
                unint64_t v54 = v53 + 1;
                if ((unint64_t)(v53 + 1) >> 57) {
                  goto LABEL_154;
                }
                uint64_t v55 = v209 - (unsigned char *)v207;
                if ((v209 - (unsigned char *)v207) >> 6 > v54) {
                  unint64_t v54 = v55 >> 6;
                }
                if ((unint64_t)v55 >= 0x7FFFFFFFFFFFFF80) {
                  unint64_t v56 = 0x1FFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v56 = v54;
                }
                if (v56)
                {
                  char v57 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<box3d>>((uint64_t)&v209, v56);
                  unsigned __int8 v44 = v208;
                  unsigned __int8 v52 = (float32x4_t *)v207;
                }
                else
                {
                  char v57 = 0;
                }
                uint64_t v58 = (float32x4_t *)&v57[128 * v53];
                float32x4_t v59 = v216;
                float32x4_t v60 = v217;
                float32x4_t v61 = v219;
                v58[2] = v218;
                v58[3] = v61;
                *uint64_t v58 = v59;
                v58[1] = v60;
                float32x4_t v62 = v220;
                float32x4_t v63 = v221;
                float32x4_t v64 = v223;
                v58[6] = v222;
                v58[7] = v64;
                v58[4] = v62;
                v58[5] = v63;
                if (v44 == v52)
                {
                  uint64_t v72 = &v57[128 * v53];
                }
                else
                {
                  long long v65 = (float32x4_t *)&v57[128 * v53];
                  do
                  {
                    float32x4_t v66 = v44[-8];
                    float32x4_t v67 = v44[-7];
                    float32x4_t v68 = v44[-5];
                    v65[-6] = v44[-6];
                    v65[-5] = v68;
                    v65[-8] = v66;
                    v65[-7] = v67;
                    float32x4_t v69 = v44[-4];
                    float32x4_t v70 = v44[-3];
                    float32x4_t v71 = v44[-1];
                    uint64_t v72 = (char *)&v65[-8];
                    v65[-2] = v44[-2];
                    v65[-1] = v71;
                    v65[-4] = v69;
                    v65[-3] = v70;
                    v44 -= 8;
                    v65 -= 8;
                  }
                  while (v44 != v52);
                }
                int v51 = v58 + 8;
                v207 = v72;
                v208 = v58 + 8;
                v209 = &v57[128 * v56];
                if (v52) {
                  operator delete(v52);
                }
              }
              else
              {
                float32x4_t v45 = v216;
                float32x4_t v46 = v217;
                float32x4_t v47 = v219;
                v208[2] = v218;
                v44[3] = v47;
                float32x4_t *v44 = v45;
                v44[1] = v46;
                float32x4_t v48 = v220;
                float32x4_t v49 = v221;
                float32x4_t v50 = v223;
                v44[6] = v222;
                v44[7] = v50;
                v44[4] = v48;
                v44[5] = v49;
                int v51 = v44 + 8;
              }
              v208 = v51;
            }
            long long v73 = v211;
            if (v211 >= v212)
            {
              long long v75 = (char *)v210;
              uint64_t v76 = (v211 - (unsigned char *)v210) >> 2;
              unint64_t v77 = v76 + 1;
              if ((unint64_t)(v76 + 1) >> 62) {
LABEL_155:
              }
                std::vector<float>::__throw_length_error[abi:ne180100]();
              uint64_t v78 = v212 - (unsigned char *)v210;
              if ((v212 - (unsigned char *)v210) >> 1 > v77) {
                unint64_t v77 = v78 >> 1;
              }
              if ((unint64_t)v78 >= 0x7FFFFFFFFFFFFFFCLL) {
                unint64_t v79 = 0x3FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v79 = v77;
              }
              if (v79)
              {
                uint64_t v80 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v212, v79);
                long long v73 = v211;
                long long v75 = (char *)v210;
              }
              else
              {
                uint64_t v80 = 0;
              }
              float v81 = (float *)&v80[4 * v76];
              float *v81 = v33;
              uint64_t v74 = (char *)(v81 + 1);
              while (v73 != v75)
              {
                int v82 = *((_DWORD *)v73 - 1);
                v73 -= 4;
                *((_DWORD *)v81-- - 1) = v82;
              }
              v210 = v81;
              v211 = v74;
              v212 = &v80[4 * v79];
              if (v75) {
                operator delete(v75);
              }
            }
            else
            {
              *(float *)v211 = v33;
              uint64_t v74 = v73 + 4;
            }
            v211 = v74;
            uint64_t v83 = v214;
            if (v214 >= (float32x4_t *)v215)
            {
              long long v91 = (float32x4_t *)v213;
              uint64_t v92 = ((char *)v214 - (unsigned char *)v213) >> 7;
              unint64_t v93 = v92 + 1;
              if ((unint64_t)(v92 + 1) >> 57) {
LABEL_154:
              }
                std::vector<float>::__throw_length_error[abi:ne180100]();
              uint64_t v94 = v215 - (unsigned char *)v213;
              if ((v215 - (unsigned char *)v213) >> 6 > v93) {
                unint64_t v93 = v94 >> 6;
              }
              if ((unint64_t)v94 >= 0x7FFFFFFFFFFFFF80) {
                unint64_t v95 = 0x1FFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v95 = v93;
              }
              if (v95)
              {
                id v96 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<box3d>>((uint64_t)&v215, v95);
                uint64_t v83 = v214;
                long long v91 = (float32x4_t *)v213;
              }
              else
              {
                id v96 = 0;
              }
              uint64_t v97 = (float32x4_t *)&v96[128 * v92];
              float32x4_t v98 = v216;
              float32x4_t v99 = v217;
              float32x4_t v100 = v219;
              void v97[2] = v218;
              v97[3] = v100;
              *uint64_t v97 = v98;
              v97[1] = v99;
              float32x4_t v101 = v220;
              float32x4_t v102 = v221;
              float32x4_t v103 = v223;
              v97[6] = v222;
              v97[7] = v103;
              v97[4] = v101;
              v97[5] = v102;
              if (v83 == v91)
              {
                double v111 = &v96[128 * v92];
              }
              else
              {
                long long v104 = (float32x4_t *)&v96[128 * v92];
                do
                {
                  float32x4_t v105 = v83[-8];
                  float32x4_t v106 = v83[-7];
                  float32x4_t v107 = v83[-5];
                  v104[-6] = v83[-6];
                  v104[-5] = v107;
                  v104[-8] = v105;
                  v104[-7] = v106;
                  float32x4_t v108 = v83[-4];
                  float32x4_t v109 = v83[-3];
                  float32x4_t v110 = v83[-1];
                  double v111 = (char *)&v104[-8];
                  v104[-2] = v83[-2];
                  v104[-1] = v110;
                  v104[-4] = v108;
                  v104[-3] = v109;
                  v83 -= 8;
                  v104 -= 8;
                }
                while (v83 != v91);
              }
              int v90 = v97 + 8;
              v213 = v111;
              v214 = v97 + 8;
              v215 = &v96[128 * v95];
              if (v91) {
                operator delete(v91);
              }
            }
            else
            {
              float32x4_t v84 = v216;
              float32x4_t v85 = v217;
              float32x4_t v86 = v219;
              v214[2] = v218;
              v83[3] = v86;
              float32x4_t *v83 = v84;
              v83[1] = v85;
              float32x4_t v87 = v220;
              float32x4_t v88 = v221;
              float32x4_t v89 = v223;
              v83[6] = v222;
              v83[7] = v89;
              v83[4] = v87;
              v83[5] = v88;
              int v90 = v83 + 8;
            }
            v214 = v90;
          }
        }
      }
      uint64_t v25 = [v24 countByEnumeratingWithState:&v200 objects:v224 count:16];
    }
    while (v25);
  }

  uint64_t v112 = (char *)v208 - (unsigned char *)v207;
  if ((unint64_t)((char *)v208 - (unsigned char *)v207) > 0x17F)
  {
    double v115 = rotationZMatrix(v23);
    v199.columns[0].i32[2] = v116;
    v199.columns[1].i32[2] = v117;
    unint64_t v118 = v112 >> 7;
    *(double *)v199.columns[0].i64 = v115;
    v199.columns[1].i64[0] = v119;
    v199.columns[2].i32[2] = v120;
    v199.columns[2].i64[0] = v121;
    std::vector<box3d>::vector(&v197, v112 >> 7);
    uint64_t v122 = 0;
    if (v118 <= 1) {
      uint64_t v123 = 1;
    }
    else {
      uint64_t v123 = v118;
    }
    uint64_t v124 = v123;
    do
    {
      rotateBoxCorners((float32x4_t *)&v199, (const box3d *)((char *)v207 + v122), (uint64_t)&v216);
      std::__fs::filesystem::path v125 = (float32x4_t *)((char *)v197 + v122);
      float32x4_t v126 = v216;
      float32x4_t v127 = v217;
      float32x4_t v128 = v219;
      v125[2] = v218;
      v125[3] = v128;
      v125[1] = v127;
      float32x4_t v129 = v223;
      float32x4_t v131 = v220;
      float32x4_t v130 = v221;
      v125[6] = v222;
      v125[7] = v129;
      v125[4] = v131;
      v125[5] = v130;
      *std::__fs::filesystem::path v125 = v126;
      v122 += 128;
      --v124;
    }
    while (v124);
    v132 = [(OU3DObject *)v4 refined_box_history];
    uint64_t v133 = [v132 lastObject];
    v134 = [v133 preRefinedBox];

    if (v134)
    {
      float32x4_t v222 = 0u;
      float32x4_t v223 = 0u;
      float32x4_t v220 = 0u;
      float32x4_t v221 = 0u;
      float32x4_t v218 = 0u;
      float32x4_t v219 = 0u;
      float32x4_t v216 = 0u;
      float32x4_t v217 = 0u;
      box3dFromNSArray(v134, (uint64_t)__p);
      rotateBoxCorners((float32x4_t *)&v199, (const box3d *)__p, (uint64_t)&v216);
      v135 = operator new(0x30uLL);
      _OWORD *v135 = xmmword_237CB69A0;
      v135[1] = xmmword_237CB69B0;
      v135[2] = xmmword_237CB69C0;
      std::vector<float>::vector(v188, 6uLL);
      for (uint64_t j = 0; j != 6; ++j)
      {
        v137 = (int *)v135 + 2 * j;
        int v138 = v137[1];
        uint64_t v139 = *v137;
        std::vector<float>::vector(__p, v118);
        std::vector<float>::vector(v180, v118);
        v140 = (char *)v197 + 16 * v139;
        v141 = (float *)__p[0];
        v142 = (float *)v180[0];
        uint64_t v143 = v123;
        do
        {
          float v144 = *(float *)&v140[4 * (v138 & 3)];
          float *v141 = v144;
          double v145 = vabds_f32(v144, *(float *)((unint64_t)(&v216 + v139) & 0xFFFFFFFFFFFFFFF3 | (4 * (v138 & 3))));
          float v146 = 3.0;
          if (v145 >= 0.1)
          {
            float v146 = 2.0;
            if (v145 >= 0.2)
            {
              if (v145 >= 0.3) {
                float v146 = 0.0;
              }
              else {
                float v146 = 1.0;
              }
            }
          }
          *v142++ = v146;
          ++v141;
          v140 += 128;
          --v143;
        }
        while (v143);
        unint64_t v147 = HistogramMaxBin((float **)__p, (uint64_t)v180, 0.05);
        *((_DWORD *)v188[0] + j) = HIDWORD(v147);
        if (v180[0])
        {
          v180[1] = v180[0];
          operator delete(v180[0]);
        }
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
      }
      v149.n128_u32[0] = *(_DWORD *)v188[0];
      float v150 = *((float *)v188[0] + 4);
      float v151 = *((float *)v188[0] + 5);
      float32x2_t v152 = *(float32x2_t *)((char *)v188[0] + 4);
      __n128 v153 = v149;
      v153.n128_u32[1] = *((_DWORD *)v188[0] + 3);
      v153.n128_u64[0] = (unint64_t)vmul_f32(vadd_f32(v152, (float32x2_t)v153.n128_u64[0]), (float32x2_t)0x3F0000003F000000);
      v153.n128_f32[2] = (float)(v150 + v151) * 0.5;
      float v175 = *(float *)v188[0];
      float v176 = v152.f32[0];
      *(float *)v148.i32 = v152.f32[0] - *(float *)v188[0];
      float v154 = v152.f32[1];
      float v177 = *((float *)v188[0] + 3);
      *(float *)&v148.i32[1] = v177 - v152.f32[1];
      *(float *)&v148.i32[2] = v151 - v150;
      long long v195 = 0u;
      long long v196 = 0u;
      long long v193 = 0u;
      long long v194 = 0u;
      long long v191 = 0u;
      long long v192 = 0u;
      *(_OWORD *)std::__fs::filesystem::path __p = 0u;
      long long v190 = 0u;
      int32x4_t v155 = vzip1q_s32((int32x4_t)v199.columns[0], (int32x4_t)v199.columns[2]);
      v178.columns[0] = (simd_float3)vzip1q_s32(v155, (int32x4_t)v199.columns[1]);
      v178.columns[1] = (simd_float3)vzip2q_s32(v155, vdupq_lane_s32(*(int32x2_t *)v199.columns[1].f32, 1));
      v178.columns[2] = (simd_float3)vzip1q_s32(vzip2q_s32((int32x4_t)v199.columns[0], (int32x4_t)v199.columns[2]), vdupq_laneq_s32((int32x4_t)v199.columns[1], 2));
      centroidSizeAngleToBox3d(v180, v153, v148, 0.0);
      rotateBoxCorners((float32x4_t *)&v178, (const box3d *)v180, (uint64_t)__p);
      unint64_t v156 = 0;
      while (1)
      {
        float32x4_t v157 = vsubq_f32(*(float32x4_t *)&__p[v156 / 8], v208[v156 / 0x10 - 8]);
        float32x4_t v158 = vmulq_f32(v157, v157);
        if (sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v158, 2), vaddq_f32(v158, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v158.f32, 1))).f32[0]) > 0.15)break; {
        v156 += 16;
        }
        if (v156 == 128) {
          goto LABEL_122;
        }
      }
      v160 = [(OU3DObject *)v4 refined_box_history];
      v161 = [v160 lastObject];
      [v161 setIsOutlier:1];

LABEL_122:
      __n128 v162 = v198[-8];
      int8x16_t v163 = (int8x16_t)v198[-7];
      float v164 = v198[-6].n128_f32[0];
      if (vabds_f32(v164, v175) >= 0.1) {
        float v164 = v175;
      }
      if (vabds_f32(*(float *)v163.i32, v176) >= 0.1) {
        float v165 = v176;
      }
      else {
        LODWORD(v165) = v198[-7];
      }
      if (vabds_f32(*(float *)&v163.i32[1], v154) >= 0.1) {
        float v166 = v154;
      }
      else {
        LODWORD(v166) = HIDWORD(v198[-7].n128_u64[0]);
      }
      if (vabds_f32(v162.n128_f32[1], v177) >= 0.1) {
        float v167 = v177;
      }
      else {
        LODWORD(v167) = HIDWORD(v198[-8].n128_u64[0]);
      }
      if (vabds_f32(v162.n128_f32[2], v150) >= 0.1) {
        float v168 = v150;
      }
      else {
        LODWORD(v168) = v198[-8].n128_u64[1];
      }
      if (vabds_f32(v198[-4].n128_f32[2], v151) >= 0.1) {
        float v169 = v151;
      }
      else {
        float v169 = v198[-4].n128_f32[2];
      }
      v162.n128_f32[0] = (float)(v165 + v164) * 0.5;
      v162.n128_f32[1] = (float)(v167 + v166) * 0.5;
      v162.n128_f32[2] = (float)(v168 + v169) * 0.5;
      *(float *)v163.i32 = v165 - v164;
      *(float *)&v163.i32[1] = v167 - v166;
      *(float *)&v163.i32[2] = v169 - v168;
      long long v186 = 0u;
      long long v187 = 0u;
      long long v184 = 0u;
      long long v185 = 0u;
      long long v182 = 0u;
      long long v183 = 0u;
      *(_OWORD *)v180 = 0u;
      long long v181 = 0u;
      int32x4_t v170 = vzip1q_s32((int32x4_t)v199.columns[0], (int32x4_t)v199.columns[2]);
      v179.columns[0] = (simd_float3)vzip1q_s32(v170, (int32x4_t)v199.columns[1]);
      v179.columns[1] = (simd_float3)vzip2q_s32(v170, vdupq_lane_s32(*(int32x2_t *)v199.columns[1].f32, 1));
      v179.columns[2] = (simd_float3)vzip1q_s32(vzip2q_s32((int32x4_t)v199.columns[0], (int32x4_t)v199.columns[2]), vdupq_laneq_s32((int32x4_t)v199.columns[1], 2));
      centroidSizeAngleToBox3d(&v178, v162, v163, 0.0);
      rotateBoxCorners((float32x4_t *)&v179, (const box3d *)&v178, (uint64_t)v180);
      long long v171 = v185;
      *(_OWORD *)(a2 + 64) = v184;
      *(_OWORD *)(a2 + 80) = v171;
      long long v172 = v187;
      *(_OWORD *)(a2 + 96) = v186;
      *(_OWORD *)(a2 + 112) = v172;
      long long v173 = v181;
      *(_OWORD *)a2 = *(_OWORD *)v180;
      *(_OWORD *)(a2 + 16) = v173;
      long long v174 = v183;
      *(_OWORD *)(a2 + 32) = v182;
      *(_OWORD *)(a2 + 48) = v174;
      *(unsigned char *)(a2 + 128) = 1;
      if (v188[0])
      {
        v188[1] = v188[0];
        operator delete(v188[0]);
      }
      operator delete(v135);
    }
    else
    {
      v159 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
      if (os_log_type_enabled(v159, OS_LOG_TYPE_DEBUG)) {
        SmoothObjectUponHistory(v159);
      }

      *(unsigned char *)a2 = 0;
      *(unsigned char *)(a2 + 128) = 0;
    }

    if (v197)
    {
      v198 = (__n128 *)v197;
      operator delete(v197);
    }
  }
  else
  {
    long long v113 = [(OU3DObject *)v4 refined_box_history];
    v114 = [v113 lastObject];
    [v114 setIsOutlier:0];

    *(unsigned char *)a2 = 0;
    *(unsigned char *)(a2 + 128) = 0;
  }
  if (v204)
  {
    v205 = (char *)v204;
    operator delete(v204);
  }
  if (v207)
  {
    v208 = (float32x4_t *)v207;
    operator delete(v207);
  }
  if (v210)
  {
    v211 = (char *)v210;
    operator delete(v210);
  }
  if (v213)
  {
    v214 = (float32x4_t *)v213;
    operator delete(v213);
  }
LABEL_94:
}

void sub_237CAF038(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,void *a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  operator delete(v58);

  float32x4_t v62 = (void *)STACK[0x218];
  if (STACK[0x218])
  {
    STACK[0x220] = (unint64_t)v62;
    operator delete(v62);
  }
  float32x4_t v63 = (void *)STACK[0x2A0];
  if (STACK[0x2A0])
  {
    STACK[0x2A8] = (unint64_t)v63;
    operator delete(v63);
  }
  float32x4_t v64 = (void *)STACK[0x2B8];
  if (STACK[0x2B8])
  {
    STACK[0x2C0] = (unint64_t)v64;
    operator delete(v64);
  }
  long long v65 = (void *)STACK[0x2D0];
  if (STACK[0x2D0])
  {
    STACK[0x2D8] = (unint64_t)v65;
    operator delete(v65);
  }
  float32x4_t v66 = (void *)STACK[0x2E8];
  if (STACK[0x2E8])
  {
    STACK[0x2F0] = (unint64_t)v66;
    operator delete(v66);
  }

  _Unwind_Resume(a1);
}

float *std::__minmax_element_impl[abi:ne180100]<std::__wrap_iter<float const*>,std::__wrap_iter<float const*>,std::__identity,std::__less<void,void>>(float *result, float *a2)
{
  double v2 = result;
  if (result != a2 && result + 1 != a2)
  {
    float v5 = *result;
    float v4 = result[1];
    if (v4 < *result) {
      ++result;
    }
    uint64_t v6 = v4 >= *v2 ? v2 + 1 : v2;
    unint64_t v7 = v2 + 2;
    if (v7 != a2)
    {
      if (v4 >= v5) {
        float v4 = v5;
      }
      while (v7 + 1 != a2)
      {
        float v9 = *v7;
        float v8 = v7[1];
        if (v8 >= *v7)
        {
          if (v9 < v4)
          {
            float v4 = *v7;
            float result = v7;
          }
          if (v8 >= *v6) {
            uint64_t v6 = v7 + 1;
          }
        }
        else
        {
          float v4 = *result;
          if (v8 < *result)
          {
            float v4 = v7[1];
            float result = v7 + 1;
          }
          if (v9 >= *v6) {
            uint64_t v6 = v7;
          }
        }
        v7 += 2;
        if (v7 == a2) {
          return result;
        }
      }
      if (*v7 < *result) {
        return v7;
      }
    }
  }
  return result;
}

dispatch_queue_t CreateFixedPrioritySerialDispatchQueue(_anonymous_namespace_ *a1, const char *a2, uint64_t a3, uint64_t a4, os_workgroup_t *a5)
{
  v8 = dispatch_qos_class_t v6 = a2;
  dispatch_workloop_set_qos_class_floor();
  if (*a5) {
    dispatch_workloop_set_os_workgroup(v8, *a5);
  }
  dispatch_activate(v8);
  float v9 = dispatch_queue_attr_make_with_qos_class(0, v6, 0);
  dispatch_queue_t v10 = dispatch_queue_create_with_target_V2((const char *)a1, v9, v8);

  return v10;
}

dispatch_queue_t CreateFixedPrioritySerialDispatchQueue(_anonymous_namespace_ *a1, const char *a2, uint64_t a3, os_workgroup_t *a4)
{
  dispatch_qos_class_t v6 = ;
  dispatch_workloop_set_scheduler_priority();
  if (*a4) {
    dispatch_workloop_set_os_workgroup(v6, *a4);
  }
  dispatch_activate(v6);
  dispatch_queue_t v7 = dispatch_queue_create_with_target_V2((const char *)a1, 0, v6);

  return v7;
}

id CreateWorkGroup(const char *a1)
{
  int v1 = os_workgroup_attr_set_flags();
  if (v1)
  {
    int v2 = v1;
    long long v3 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      CreateWorkGroup(v2, v3);
    }

    float v4 = 0;
  }
  else
  {
    float v4 = (void *)os_workgroup_create();
  }
  return v4;
}

dispatch_workloop_t anonymous namespace'::CreateWorkloop(_anonymous_namespace_ *this, const char *a2)
{
  v13[2] = *MEMORY[0x263EF8340];
  std::string::basic_string[abi:ne180100]<0>(&__p, ".workloop");
  if (this)
  {
    std::string::basic_string[abi:ne180100]<0>(&v9, (char *)this);
    long long v3 = std::string::append(&v9, ".workloop", 9uLL);
    float v4 = (void *)v3->__r_.__value_.__r.__words[0];
    v13[0] = v3->__r_.__value_.__l.__size_;
    *(void *)((char *)v13 + 7) = *(std::string::size_type *)((char *)&v3->__r_.__value_.__r.__words[1] + 7);
    char v5 = HIBYTE(v3->__r_.__value_.__r.__words[2]);
    v3->__r_.__value_.__l.__size_ = 0;
    v3->__r_.__value_.__r.__words[2] = 0;
    v3->__r_.__value_.__r.__words[0] = 0;
    if (v12 < 0) {
      operator delete(__p);
    }
    std::__fs::filesystem::path __p = v4;
    *(void *)unint64_t v11 = v13[0];
    *(void *)&v11[7] = *(void *)((char *)v13 + 7);
    char v12 = v5;
    if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v9.__r_.__value_.__l.__data_);
    }
  }
  if (v12 >= 0) {
    p_p = (const char *)&__p;
  }
  else {
    p_p = (const char *)__p;
  }
  dispatch_workloop_t inactive = dispatch_workloop_create_inactive(p_p);
  if (v12 < 0) {
    operator delete(__p);
  }
  return inactive;
}

void sub_237CAF664(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  _Unwind_Resume(exception_object);
}

void GetDeviceOrientation_cold_1()
{
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_237C17000, v0, OS_LOG_TYPE_DEBUG, "cannot determine orientation.", v1, 2u);
}

void LoadImageToCVPixelBuffer()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_237C17000, v0, v1, "Untested pixel format type, only support 'BGRA' and 'L016'.", v2, v3, v4, v5, v6);
}

void LoadRGBToDictionary()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_237C17000, v0, v1, "Loaded scene_color cvpixelbuffer size: %d vs %d", v2, v3);
}

void LoadSemanticToDictionary()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_237C17000, v0, v1, "Loaded semantic_label cvpixelbuffer size: %d vs %d", v2, v3);
}

void LoadSemanticConfToDictionary()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_237C17000, v0, v1, "Loaded semantic_confidence cvpixelbuffer size: %d vs %d", v2, v3);
}

void LoadDepthToDictionary(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_237C17000, log, OS_LOG_TYPE_DEBUG, "Loaded scene_depth cvpixelbuffer size: %zu vs %zu", (uint8_t *)&v3, 0x16u);
}

void FindImageFilePath(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_237C17000, a2, OS_LOG_TYPE_DEBUG, "Loaded image file %s", (uint8_t *)&v2, 0xCu);
}

void GenerateOUFramesFromCvplayer_cold_1(uint8_t *buf, uint64_t a2, uint64_t a3, os_log_t log)
{
  *(_DWORD *)std::__fs::filesystem::path buf = 134218240;
  *(void *)(buf + 4) = a2;
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = a3;
  _os_log_error_impl(&dword_237C17000, log, OS_LOG_TYPE_ERROR, "The camera timestamps and poses have different numbers: %zu vs %zu", buf, 0x16u);
}

void GenerateOUFramesFromCvplayer_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_237C17000, v0, v1, "camera timestamp and pose doesn't match.", v2, v3, v4, v5, v6);
}

void percentile(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void OU3DKitchenObjectMerger::IsSimilarHeight(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void OU3DKitchenObjectMerger::AlignInsideObject(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void OU3DKitchenObjectMerger::AlignSinkWithDishwasher(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *std::__fs::filesystem::path buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_237C17000, log, OS_LOG_TYPE_DEBUG, "[3DOD] Warning, sink and washer doesn't align, skip crop.", buf, 2u);
}

void std::construct_at[abi:ne180100]<OU3DKitchenObject,OU3DKitchenObject const&,OU3DKitchenObject*>(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 160);
  if (v2)
  {
    *(void *)(a1 + 168) = v2;
    operator delete(v2);
  }
}

void ou3dor::OU3DLShapeSofaOfflineMerger::MergeLShape(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 24);
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_237C17000, a2, OS_LOG_TYPE_DEBUG, "[3DOD Lshape merge] need_merge_list size %lu", (uint8_t *)&v3, 0xCu);
}

void percentile(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_237C17000, log, OS_LOG_TYPE_DEBUG, "[3DOD] Invalid input argument for function percentile: empty input.", v1, 2u);
}

void ou3dod::J4InputSpecialHandling(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_237C17000, a2, OS_LOG_TYPE_ERROR, "[3DOD] input size is less than target_num_voxel %d", (uint8_t *)v2, 8u);
}

void ou3dod::J4OutputSpecialHandling(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_237C17000, a2, OS_LOG_TYPE_ERROR, "[3DOD] input size is less than min_capacity %d", (uint8_t *)v2, 8u);
}

void ou3dor::OU3DOROfflineEspressoV2::SetEmbedding<float>()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_237C17000, v0, v1, "[3DOR] offline network rgb feature input not allocated", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_237C17000, v0, v1, "[3DOR] offline network embedding feature not matched", v2, v3, v4, v5, v6);
}

{
  while (1)
    ;
}

void ou3dor::OU3DOROfflineEspressoV2::SetInputs()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_237C17000, v0, v1, "[3DOR] offline mdoel input bind is invalid.", v2, v3, v4, v5, v6);
}

uint64_t ou3dod::OU3DAnchorFreeDetector::createForOnline(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 8))(a1);
}

void ou3dod::OU3DAnchorFreeDetector::Preprocess(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "OU3DAnchorFreeDetector";
  _os_log_error_impl(&dword_237C17000, log, OS_LOG_TYPE_ERROR, "[3DOD][%s] Invalid point cloud.", (uint8_t *)&v1, 0xCu);
}

void CameraPCFromARFrameSceneCamera(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_debug_impl(&dword_237C17000, log, OS_LOG_TYPE_DEBUG, "[3DOD] WARNING: There is no valid point from ARFrame.", v1, 2u);
}

void OUEspressoV2Inference::LoadModel(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "OUEspressoV2Inference";
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_237C17000, a2, OS_LOG_TYPE_ERROR, "[%s] Unexpected num_functions=%lu", (uint8_t *)&v2, 0x16u);
}

double ou3dod::PrintBoxCorner(_OWORD *a1, NSObject *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  double v2 = COERCE_FLOAT(*a1);
  double v3 = COERCE_FLOAT(HIDWORD(*(void *)a1));
  double v4 = COERCE_FLOAT(a1[1]);
  double v5 = COERCE_FLOAT(HIDWORD(*((void *)a1 + 2)));
  long long v6 = a1[2];
  long long v7 = a1[3];
  int v9 = 134219776;
  double v10 = v2;
  __int16 v11 = 2048;
  double v12 = v3;
  __int16 v13 = 2048;
  double v14 = v4;
  __int16 v15 = 2048;
  double v16 = v5;
  __int16 v17 = 2048;
  double v18 = *(float *)&v6;
  __int16 v19 = 2048;
  double v20 = *((float *)&v6 + 1);
  __int16 v21 = 2048;
  double v22 = *(float *)&v7;
  __int16 v23 = 2048;
  double v24 = *((float *)&v7 + 1);
  _os_log_debug_impl(&dword_237C17000, a2, OS_LOG_TYPE_DEBUG, "[3DOD Lshape merge] corner: %f, %f, %f, %f, %f, %f, %f, %f", (uint8_t *)&v9, 0x52u);
  return result;
}

void ou3dod::AdjustBoxCornerOrder()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_237C17000, v0, v1, "[3DOD Lshape merge] skip merging due to inability", v2, v3, v4, v5, v6);
}

void ou3dod::AdjustBoxCornerOrder(int a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_debug_impl(&dword_237C17000, log, OS_LOG_TYPE_DEBUG, "[3DOD Lshape merge] nearest_box1_corner_idx: %d, nearest_box2_corner_idx: %d", (uint8_t *)v3, 0xEu);
}

void ou3dod::MaybeClipExtendLShapeObjects()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_237C17000, v0, v1, "[3DOD Lshape merge] skip filling the corner box because less points", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_237C17000, v0, v1, "[3DOD Lshape merge] force merge extend corner", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_237C17000, v0, v1, "[3DOD Lshape merge] skip filling the corner box", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_237C17000, v0, v1, "[3DOD Lshape merge] not l shape fill", v2, v3, v4, v5, v6);
}

void ou3dod::MaybeClipExtendLShapeObjects(uint8_t *buf, NSObject *a2, float a3)
{
  *(_DWORD *)std::__fs::filesystem::path buf = 134217984;
  *(double *)(buf + 4) = a3;
  _os_log_debug_impl(&dword_237C17000, a2, OS_LOG_TYPE_DEBUG, "[3DOD Lshape merge] overlap ratio %f", buf, 0xCu);
}

void ou3dod::MaybeClipExtendLShapeObjects(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_237C17000, a2, OS_LOG_TYPE_DEBUG, "[3DOD Lshape merge] less point %lu", (uint8_t *)&v2, 0xCu);
}

void _GLOBAL__sub_I_OUCannyEdgeDetectorSemantic_mm_cold_1(uint64_t a1, uint64_t a2)
{
  do
  {
    std::__tree<int>::destroy(a1 - 24, *(void **)(a1 - 16));
    uint64_t v4 = *(void **)(a1 - 32);
    a1 -= 32;
  }
  while (a1 != a2);
}

void anonymous namespace'::nonMaxSuppressBoxes(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_237C17000, log, OS_LOG_TYPE_DEBUG, "[3DOD] Error: removeBoxFlags should be the same size of detected boxes. Skip cross-class nms.", v1, 2u);
}

void ou3dor::OU3DOREspressoV2Interface::OU3DOREspressoV2Interface(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_237C17000, log, OS_LOG_TYPE_ERROR, "[3DOR] The espresso v2 model can't be loaded successfully. We will skip 3dor process.", v1, 2u);
}

void ou3dor::OU3DOREspressoV2Interface::LoadModel(char *a1, uint8_t *buf, os_log_t log)
{
  if (a1[23] >= 0) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(char **)a1;
  }
  *(_DWORD *)std::__fs::filesystem::path buf = 136315138;
  *(void *)(buf + 4) = v4;
  _os_log_debug_impl(&dword_237C17000, log, OS_LOG_TYPE_DEBUG, "Network path not found: %s", buf, 0xCu);
  if (a1[23] < 0) {
    operator delete(*(void **)a1);
  }
}

void ou3dor::OU3DOREspressoV2Interface::Inference(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_237C17000, log, OS_LOG_TYPE_ERROR, "3DOR model input is invalid, please the error messages for input data feeding.", v1, 2u);
}

void ou3dor::CadModelRetriever::CadModelRetriever(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  int v2 = "CadModelRetriever";
  _os_log_error_impl(&dword_237C17000, log, OS_LOG_TYPE_ERROR, "[3DOR][%s] Mismatch size for asset tables.", (uint8_t *)&v1, 0xCu);
}

{
  int v1;
  const char *v2;
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  uint64_t v5 = *MEMORY[0x263EF8340];
  int v1 = 136315394;
  int v2 = "CadModelRetriever";
  uint64_t v3 = 2048;
  uint64_t v4 = 256;
  _os_log_error_impl(&dword_237C17000, log, OS_LOG_TYPE_ERROR, "[3DOR][%s] incorrect size of asset embeddings, must be multiple of %lu.", (uint8_t *)&v1, 0x16u);
}

void ou3dor::CadModelRetriever::RetrieveCadModel(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  int v2 = "CadModelRetriever";
  _os_log_error_impl(&dword_237C17000, log, OS_LOG_TYPE_ERROR, "[3DOR][%s] mismatching object embedding dimension.", (uint8_t *)&v1, 0xCu);
}

void writeBox3ds(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_debug_impl(&dword_237C17000, log, OS_LOG_TYPE_DEBUG, "The number of input boxes doesn't match the box types. ", v1, 2u);
}

void loadBoxes(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_debug_impl(&dword_237C17000, log, OS_LOG_TYPE_DEBUG, "There is no valid corners.", v1, 2u);
}

void isBoxRectangle(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

{
  OUTLINED_FUNCTION_0_1(&dword_237C17000, a1, a3, "object box is not rectangle for side 23 and 12: %f", a5, a6, a7, a8, 0);
}

{
  OUTLINED_FUNCTION_0_1(&dword_237C17000, a1, a3, "object box is not rectangle for side 23 and 30: %f", a5, a6, a7, a8, 0);
}

void ou3dod::OU3DSparseSSDetector::Preprocess(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  int v2 = "SparseSSD";
  _os_log_error_impl(&dword_237C17000, log, OS_LOG_TYPE_ERROR, "[3DOD][%s] Invalid point cloud.", (uint8_t *)&v1, 0xCu);
}

void ou3dod::OU3DLShapeObjectMerger::MergeLShape(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *std::__fs::filesystem::path buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_237C17000, log, OS_LOG_TYPE_DEBUG, "[3DOD Lshape merge] merge previous pair", buf, 2u);
}

void ou3dod::OU3DLShapeObjectMerger::MergeLShape(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 64);
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_237C17000, a2, OS_LOG_TYPE_DEBUG, "[3DOD Lshape merge] history_l_shape_uuids_paired_ %lu", (uint8_t *)&v3, 0xCu);
}

void ou3dor::OU3DObjectRepresentation::RotateImage()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_237C17000, v0, v1, "[OUFrame Error]: invalid device orientation. Skip data saving.", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_237C17000, v0, v1, "Generating upright image starts", v2, v3, v4, v5, v6);
}

void ou3dor::OU3DObjectRepresentation::AddObjects2DFeatures()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_237C17000, v0, v1, "If any of the camera, scene color or depth is not available, we then skip embedding.", v2, v3, v4, v5, v6);
}

void ou3dor::OU3DObjectRepresentation::AddObjectRepresentation()
{
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_237C17000, v0, OS_LOG_TYPE_ERROR, "[OR] Offline prediction parser not initialized.", v1, 2u);
}

void ou3dor::OU3DObjectRepresentation::AddObjectRepresentation(void *a1, uint8_t *buf, void *a3, os_log_t log)
{
  *(_DWORD *)std::__fs::filesystem::path buf = 138412290;
  *a3 = a1;
  _os_log_debug_impl(&dword_237C17000, log, OS_LOG_TYPE_DEBUG, "[OR] The %@ is not considered for 3dor", buf, 0xCu);
}

{
  *(_DWORD *)std::__fs::filesystem::path buf = 138412290;
  *a3 = a1;
  _os_log_debug_impl(&dword_237C17000, log, OS_LOG_TYPE_DEBUG, "[OR] The %@ has no raw box.", buf, 0xCu);
}

void ou3dor::OU3DOROnlineEspressoV2::GetOutputInternal<half>()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(&dword_237C17000, v0, v1, "[3DOR] output image number of elements %lu", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(&dword_237C17000, v0, v1, "[3DOR] output image tensor shape h %lu", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(&dword_237C17000, v0, v1, "[3DOR] output image shape w %lu", v2, v3, v4, v5, v6);
}

{
  while (1)
    ;
}

void ou3dor::OU3DOROnlineEspressoV2::SetInputInternal<half>()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_237C17000, v0, v1, "[3DOR] online mdoel input bind is invalid.", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_237C17000, v0, v1, "[3DOR] online mdoel image crop size not matched", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_237C17000, v0, v1, "[3DOR] online mdoel number of pixel not matched", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_237C17000, v0, v1, "[3DOR] online mdoel pixel format not matched", v2, v3, v4, v5, v6);
}

{
  while (1)
    ;
}

void OU3DObjectRGBSizeRefiner::ShouldRefineObject()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_1(&dword_237C17000, "[3DOD RGB Refine] Object uuid: %@ box type: %s is not supported. ", v4, v5);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_1(&dword_237C17000, "[3DOD RGB Refine] Object uuid: %@ box type: %s fov length is not reached", v4, v5);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_1(&dword_237C17000, "[3DOD RGB Refine] Object uuid: %@ box type: %s does not need refine. ", v4, v5);
}

void OU3DObjectRGBSizeRefiner::ShouldRefineObject(void *a1, uint8_t *buf, os_log_t log, float a4)
{
  *(_DWORD *)std::__fs::filesystem::path buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2048;
  *(double *)(buf + 14) = a4;
  _os_log_debug_impl(&dword_237C17000, log, OS_LOG_TYPE_DEBUG, "[3DOD RGB Refine] Object uuid: %@ Distance: %f is out of maximum range", buf, 0x16u);
}

void OU3DObjectRGBSizeRefiner::IsBoxInFOVCorner(uint64_t a1, uint8_t *buf, int a3, os_log_t log)
{
  *(_DWORD *)std::__fs::filesystem::path buf = 136315650;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = a3;
  *((_WORD *)buf + 9) = 1024;
  *((_DWORD *)buf + 5) = 5;
  _os_log_debug_impl(&dword_237C17000, log, OS_LOG_TYPE_DEBUG, "[3DOD RGB Refine] Object uuid: %s number of visible corners: %d is less than required: %d.", buf, 0x18u);
}

void OU3DObjectRGBSizeRefiner::RefineObjects(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_237C17000, log, OS_LOG_TYPE_DEBUG, "[3DOD RGB Refine] Skip the frame due to no object should be refined", v1, 2u);
}

void utils::OUImageUtils::ResizeImageRGBA()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_237C17000, v0, v1, "ImageResize only supports RGBA or BGRA", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_237C17000, v0, v1, "Image crop failed when create cropped cvpixelbuffer.", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_237C17000, v0, v1, "ImageResize scale vImage_buffer failed.", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_237C17000, v0, v1, "ImageResize init vImage_buffer failed.", v2, v3, v4, v5, v6);
}

void utils::OUImageUtils::CropAndResizeImage()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_237C17000, v0, v1, "ImageCrop only supports RGBA or RGB", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_237C17000, v0, v1, "image crop failed when create cropped cvpixelbuffer.", v2, v3, v4, v5, v6);
}

void utils::OUImageUtils::CropAndResizeImage(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_237C17000, a2, OS_LOG_TYPE_ERROR, "image crop error %ld", (uint8_t *)&v2, 0xCu);
}

void utils::anonymous namespace'::CheckCVPixelBuffers()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_2_2();
  _os_log_error_impl(&dword_237C17000, v0, OS_LOG_TYPE_ERROR, "[%s] out_buffer's pixel format must be %d", (uint8_t *)v1, 0x12u);
}

{
  os_log_t v0;
  int v1[6];
  uint64_t v2;

  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_2_2();
  _os_log_error_impl(&dword_237C17000, v0, OS_LOG_TYPE_ERROR, "[%s] in_buffer's pixel format must be %d", (uint8_t *)v1, 0x12u);
}

void utils::OUFrameWriter::OUFrameWriter(uint64_t a1, void *a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (*(char *)(a1 + 63) < 0) {
    a2 = (void *)*a2;
  }
  int v3 = 136315394;
  uint64_t v4 = "OUFrameWriter";
  __int16 v5 = 2080;
  uint8_t v6 = a2;
  _os_log_error_impl(&dword_237C17000, log, OS_LOG_TYPE_ERROR, "[%s] failed to create output directory %s.", (uint8_t *)&v3, 0x16u);
}

void CreateCVPixelBuffer(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_237C17000, log, OS_LOG_TYPE_ERROR, "Failed to create CV pixel buffer.", v1, 2u);
}

void SmoothObjectUponHistory(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_237C17000, log, OS_LOG_TYPE_DEBUG, "[3DOD Error: the pre-refined box in object history shouldn't be null.", v1, 2u);
}

void CreateWorkGroup(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_237C17000, a2, OS_LOG_TYPE_ERROR, "ERROR [createWorkGroup]: Failed to set workgroup flags with error (%d)\n", (uint8_t *)v2, 8u);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

void CFRelease(CFTypeRef cf)
{
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x270EE59E8](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x270EE59F8](context);
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C60]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C68]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextRelease(CGContextRef c)
{
}

CFDataRef CGDataProviderCopyData(CGDataProviderRef provider)
{
  return (CFDataRef)MEMORY[0x270EE62B8](provider);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x270EF4F20](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x270EF4F48](idst);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x270EE67C0](image);
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return (CGDataProviderRef)MEMORY[0x270EE67E8](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x270EF5018](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5040](url, options);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA150](allocator, width, height, *(void *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

CVReturn CVPixelBufferCreateWithBytes(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, void *baseAddress, size_t bytesPerRow, CVPixelBufferReleaseBytesCallback releaseCallback, void *releaseRefCon, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA168](allocator, width, height, *(void *)&pixelFormatType, baseAddress, bytesPerRow, releaseCallback, releaseRefCon);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x270EEA190](pixelBuffer);
}

void *__cdecl CVPixelBufferGetBaseAddressOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return (void *)MEMORY[0x270EEA1A0](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1B0](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA1C8](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetDataSize(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1D0](pixelBuffer);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1E8](pixelBuffer);
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA1F8](pixelBuffer, planeIndex);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x270EEA200](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA218](pixelBuffer);
}

size_t CVPixelBufferGetPlaneCount(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA220](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA240](pixelBuffer);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA250](pixelBuffer, planeIndex);
}

Boolean CVPixelBufferIsPlanar(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA258](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x270EEA260](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferPoolCreate(CFAllocatorRef allocator, CFDictionaryRef poolAttributes, CFDictionaryRef pixelBufferAttributes, CVPixelBufferPoolRef *poolOut)
{
  return MEMORY[0x270EEA278](allocator, poolAttributes, pixelBufferAttributes, poolOut);
}

CVReturn CVPixelBufferPoolCreatePixelBuffer(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA288](allocator, pixelBufferPool, pixelBufferOut);
}

void CVPixelBufferPoolRelease(CVPixelBufferPoolRef pixelBufferPool)
{
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x270EEA320](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x270EEA330](pixelBuffer, unlockFlags);
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x270EF4C28](properties);
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4D48](buffer);
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4DE0](buffer);
}

uint64_t MGGetSInt64Answer()
{
  return MEMORY[0x270F95FF0]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x270EF5E20]();
}

void NSLog(NSString *format, ...)
{
}

uint64_t VTImageRotationSessionCreate()
{
  return MEMORY[0x270F06758]();
}

uint64_t VTImageRotationSessionInvalidate()
{
  return MEMORY[0x270F06760]();
}

uint64_t VTImageRotationSessionTransferImage()
{
  return MEMORY[0x270F06778]();
}

OSStatus VTPixelTransferSessionCreate(CFAllocatorRef allocator, VTPixelTransferSessionRef *pixelTransferSessionOut)
{
  return MEMORY[0x270F067E0](allocator, pixelTransferSessionOut);
}

void VTPixelTransferSessionInvalidate(VTPixelTransferSessionRef session)
{
}

OSStatus VTPixelTransferSessionTransferImage(VTPixelTransferSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x270F067F0](session, sourceBuffer, destinationBuffer);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void utils::RotateInPlace<half,void>()
{
  while (1)
    ;
}

void ou3dod::PreprocessDense<half,true>()
{
  while (1)
    ;
}

void ou3dor::OU3DOROnlineEspressoV2::SetInputInternal<float>()
{
  while (1)
    ;
}

void ou3dor::OU3DOROfflineEspressoV2::SetEmbedding<half>()
{
  while (1)
    ;
}

void ou3dor::OU3DOROfflineEspressoV2::SetVoxelFeatures<half>()
{
  while (1)
    ;
}

void ou3dor::OU3DOROfflineEspressoV2::SetVoxelFeatures<float>()
{
  while (1)
    ;
}

void ou3dor::OU3DOROfflineEspressoV2::SetContextFeaturesAndPadding<half>()
{
  while (1)
    ;
}

void ou3dor::OU3DOROfflineEspressoV2::SetContextFeaturesAndPadding<float>()
{
  while (1)
    ;
}

void OUDnnInferenceInterface::GetInputSpan<half,void>()
{
  while (1)
    ;
}

void OUDnnInferenceInterface::GetInputSpan<float,void>()
{
  while (1)
    ;
}

void OUDnnInferenceInterface::GetOutputSpan<half,void>()
{
  while (1)
    ;
}

void OUDnnInferenceInterface::GetOutputSpan<float,void>()
{
  while (1)
    ;
}

void ou3dor::OU3DOROnlineEspressoV2::GetOutputInternal<float>()
{
  while (1)
    ;
}

void ou3dor::OU3DOROfflineEspressoV2::GetOutputInternal<half>()
{
  while (1)
    ;
}

void ou3dor::OU3DOROfflineEspressoV2::GetOutputInternal<float>()
{
  while (1)
    ;
}

const std::__fs::filesystem::directory_entry *__cdecl std::__fs::filesystem::directory_iterator::__dereference(const std::__fs::filesystem::directory_iterator *this)
{
  return (const std::__fs::filesystem::directory_entry *)MEMORY[0x270F98278](this);
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__filename(const std::__fs::filesystem::path *this)
{
  uint64_t v1 = (const std::string_view::value_type *)MEMORY[0x270F98288](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__root_directory(const std::__fs::filesystem::path *this)
{
  uint64_t v1 = (const std::string_view::value_type *)MEMORY[0x270F982A0](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x270F982E8](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x270F982F8](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::string *a2)
{
  return (std::logic_error *)MEMORY[0x270F98338](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x270F983B0](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::string *a2)
{
  return (std::runtime_error *)MEMORY[0x270F983B8](this, a2);
}

void std::invalid_argument::~invalid_argument(std::invalid_argument *this)
{
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x270F98458](__n);
}

void std::string::__grow_by_and_replace(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add, const std::string::value_type *__p_new_stuff)
{
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984E8](this, __pos, __s, __n);
}

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x270F98548](this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x270F98560](this, __str);
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x270F98638]();
}

uint64_t std::filebuf::close()
{
  return MEMORY[0x270F98640]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x270F98650]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x270F98658]();
}

uint64_t std::istream::peek()
{
  return MEMORY[0x270F98670]();
}

uint64_t std::istream::read()
{
  return MEMORY[0x270F98678]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x270F986D0]();
}

uint64_t std::istream::operator>>()
{
  return MEMORY[0x270F986E8]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x270F98758]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x270F98760]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x270F98770]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x270F987A0]();
}

{
  return MEMORY[0x270F987A8]();
}

{
  return MEMORY[0x270F987B0]();
}

{
  return MEMORY[0x270F987C0]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x270F98870]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x270F988A8]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x270F988B0]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

std::__fs::filesystem::directory_iterator *__cdecl std::__fs::filesystem::directory_iterator::__increment(std::__fs::filesystem::directory_iterator *this, std::error_code *__ec)
{
  return (std::__fs::filesystem::directory_iterator *)MEMORY[0x270F98AF8](this, __ec);
}

std::__fs::filesystem::directory_iterator *__cdecl std::__fs::filesystem::directory_iterator::directory_iterator(std::__fs::filesystem::directory_iterator *this, const std::__fs::filesystem::path *a2, std::error_code *a3, std::__fs::filesystem::directory_options a4)
{
  return (std::__fs::filesystem::directory_iterator *)MEMORY[0x270F98B00](this, a2, a3, a4);
}

BOOL std::__fs::filesystem::__create_directories(const std::__fs::filesystem::path *a1, std::error_code *a2)
{
  return MEMORY[0x270F98B08](a1, a2);
}

std::__fs::filesystem::file_status std::__fs::filesystem::__status(const std::__fs::filesystem::path *a1, std::error_code *__ec)
{
  return (std::__fs::filesystem::file_status)MEMORY[0x270F98B60](a1, __ec);
}

uint64_t std::__sort<std::__less<float,float> &,float *>()
{
  return MEMORY[0x270F98BE0]();
}

uint64_t std::__sort<std::__less<unsigned long,unsigned long> &,unsigned long *>()
{
  return MEMORY[0x270F98BF8]();
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x270F98DE8]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, float __val)
{
  return (std::string *)MEMORY[0x270F98E00](retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x270F98E08](retstr, *(void *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return (std::string *)MEMORY[0x270F98E10](retstr, *(void *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x270F98E20](retstr, __val);
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x270F98E38]();
}

void std::exception::~exception(std::exception *this)
{
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x270ED7DA0](lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x270F98F10](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

simd_float4x4 __invert_f4(simd_float4x4 a1)
{
  MEMORY[0x270ED7E20]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2], (__n128)a1.columns[3]);
  result.columns[3].i64[1] = v8;
  result.columns[3].i64[0] = v7;
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  MEMORY[0x270ED7E90](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

simd_float4 _simd_round_f4(simd_float4 x)
{
  MEMORY[0x270ED8338]((__n128)x);
  return result;
}

float atan2f(float a1, float a2)
{
  MEMORY[0x270ED86B8](a1, a2);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x270ED9468](label, attr, target);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x270ED95D0](label);
}

void dispatch_workloop_set_os_workgroup(dispatch_workloop_t workloop, os_workgroup_t workgroup)
{
}

uint64_t dispatch_workloop_set_qos_class_floor()
{
  return MEMORY[0x270ED95F8]();
}

uint64_t dispatch_workloop_set_scheduler_priority()
{
  return MEMORY[0x270ED9600]();
}

uint64_t e5rt_buffer_object_create_from_iosurface()
{
  return MEMORY[0x270F27AE8]();
}

uint64_t e5rt_buffer_object_release()
{
  return MEMORY[0x270F27B20]();
}

uint64_t e5rt_e5_compiler_compile()
{
  return MEMORY[0x270F27B30]();
}

uint64_t e5rt_e5_compiler_create()
{
  return MEMORY[0x270F27B48]();
}

uint64_t e5rt_e5_compiler_options_create()
{
  return MEMORY[0x270F27B60]();
}

uint64_t e5rt_e5_compiler_options_release()
{
  return MEMORY[0x270F27B68]();
}

uint64_t e5rt_e5_compiler_release()
{
  return MEMORY[0x270F27B80]();
}

uint64_t e5rt_execution_stream_create()
{
  return MEMORY[0x270F27B90]();
}

uint64_t e5rt_execution_stream_encode_operation()
{
  return MEMORY[0x270F27BA0]();
}

uint64_t e5rt_execution_stream_execute_sync()
{
  return MEMORY[0x270F27BB0]();
}

uint64_t e5rt_execution_stream_operation_create_precompiled_compute_operation()
{
  return MEMORY[0x270F27BC0]();
}

uint64_t e5rt_execution_stream_operation_create_precompiled_compute_operation_with_options()
{
  return MEMORY[0x270F27BD0]();
}

uint64_t e5rt_execution_stream_operation_get_input_names()
{
  return MEMORY[0x270F27BE0]();
}

uint64_t e5rt_execution_stream_operation_get_num_inputs()
{
  return MEMORY[0x270F27BF0]();
}

uint64_t e5rt_execution_stream_operation_get_num_outputs()
{
  return MEMORY[0x270F27BF8]();
}

uint64_t e5rt_execution_stream_operation_get_output_names()
{
  return MEMORY[0x270F27C08]();
}

uint64_t e5rt_execution_stream_operation_release()
{
  return MEMORY[0x270F27C28]();
}

uint64_t e5rt_execution_stream_operation_retain_input_port()
{
  return MEMORY[0x270F27C30]();
}

uint64_t e5rt_execution_stream_operation_retain_output_port()
{
  return MEMORY[0x270F27C40]();
}

uint64_t e5rt_execution_stream_release()
{
  return MEMORY[0x270F27C68]();
}

uint64_t e5rt_get_last_error_message()
{
  return MEMORY[0x270F27C88]();
}

uint64_t e5rt_io_port_bind_buffer_object()
{
  return MEMORY[0x270F27C98]();
}

uint64_t e5rt_io_port_release()
{
  return MEMORY[0x270F27CD8]();
}

uint64_t e5rt_io_port_retain_tensor_desc()
{
  return MEMORY[0x270F27CF0]();
}

uint64_t e5rt_precompiled_compute_op_create_options_create_with_program_function()
{
  return MEMORY[0x270F27D00]();
}

uint64_t e5rt_precompiled_compute_op_create_options_release()
{
  return MEMORY[0x270F27D08]();
}

uint64_t e5rt_program_function_release()
{
  return MEMORY[0x270F27D18]();
}

uint64_t e5rt_program_library_get_function_names()
{
  return MEMORY[0x270F27D48]();
}

uint64_t e5rt_program_library_get_num_functions()
{
  return MEMORY[0x270F27D50]();
}

uint64_t e5rt_program_library_release()
{
  return MEMORY[0x270F27D60]();
}

uint64_t e5rt_program_library_retain_program_function()
{
  return MEMORY[0x270F27D70]();
}

uint64_t e5rt_tensor_desc_dtype_get_component_dtype()
{
  return MEMORY[0x270F27E10]();
}

uint64_t e5rt_tensor_desc_dtype_get_component_pack()
{
  return MEMORY[0x270F27E18]();
}

uint64_t e5rt_tensor_desc_dtype_get_component_size()
{
  return MEMORY[0x270F27E20]();
}

uint64_t e5rt_tensor_desc_dtype_get_element_size()
{
  return MEMORY[0x270F27E28]();
}

uint64_t e5rt_tensor_desc_dtype_get_num_components()
{
  return MEMORY[0x270F27E30]();
}

uint64_t e5rt_tensor_desc_dtype_release()
{
  return MEMORY[0x270F27E38]();
}

uint64_t e5rt_tensor_desc_get_rank()
{
  return MEMORY[0x270F27E48]();
}

uint64_t e5rt_tensor_desc_get_shape()
{
  return MEMORY[0x270F27E58]();
}

uint64_t e5rt_tensor_desc_get_strides()
{
  return MEMORY[0x270F27E68]();
}

uint64_t e5rt_tensor_desc_release()
{
  return MEMORY[0x270F27E78]();
}

uint64_t e5rt_tensor_desc_retain_dtype()
{
  return MEMORY[0x270F27E88]();
}

uint64_t espresso_buffer_pack_tensor_shape()
{
  return MEMORY[0x270F27EC8]();
}

uint64_t espresso_context_destroy()
{
  return MEMORY[0x270F27EE0]();
}

uint64_t espresso_create_context()
{
  return MEMORY[0x270F27F08]();
}

uint64_t espresso_create_plan()
{
  return MEMORY[0x270F27F20]();
}

uint64_t espresso_network_bind_buffer()
{
  return MEMORY[0x270F27F78]();
}

uint64_t espresso_network_change_input_blob_shapes_seq_rank()
{
  return MEMORY[0x270F28000]();
}

uint64_t espresso_network_query_blob_shape()
{
  return MEMORY[0x270F28038]();
}

uint64_t espresso_plan_add_network()
{
  return MEMORY[0x270F28068]();
}

uint64_t espresso_plan_build()
{
  return MEMORY[0x270F28070]();
}

uint64_t espresso_plan_build_clean()
{
  return MEMORY[0x270F28080]();
}

uint64_t espresso_plan_destroy()
{
  return MEMORY[0x270F28090]();
}

uint64_t espresso_plan_execute_sync()
{
  return MEMORY[0x270F280A0]();
}

uint64_t espresso_plan_get_phase()
{
  return MEMORY[0x270F280B0]();
}

float expf(float a1)
{
  MEMORY[0x270ED9870](a1);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

void free(void *a1)
{
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

long double ldexp(long double __x, int __e)
{
  MEMORY[0x270EDA028](*(void *)&__e, __x);
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x270EDA458](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_workgroup_attr_set_flags()
{
  return MEMORY[0x270EDAB68]();
}

uint64_t os_workgroup_create()
{
  return MEMORY[0x270EDAB88]();
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x270EDACF8](__x, __y);
  return result;
}

int rand(void)
{
  return MEMORY[0x270EDB0D8]();
}

void srand(unsigned int a1)
{
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

long double tan(long double __x)
{
  MEMORY[0x270EDB810](__x);
  return result;
}

time_t time(time_t *a1)
{
  return MEMORY[0x270EDB930](a1);
}

void vDSP_svesq(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
}

void vDSP_vsub(const float *__B, vDSP_Stride __IB, const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

vImage_Error vImageBufferFill_ARGB8888(const vImage_Buffer *dest, const Pixel_8888 color, vImage_Flags flags)
{
  return MEMORY[0x270EDEF10](dest, color, *(void *)&flags);
}

vImage_Error vImageBuffer_Init(vImage_Buffer *buf, vImagePixelCount height, vImagePixelCount width, uint32_t pixelBits, vImage_Flags flags)
{
  return MEMORY[0x270EDEF18](buf, height, width, *(void *)&pixelBits, *(void *)&flags);
}

vImage_Error vImageConvert_420Yp8_CbCr8ToARGB8888(const vImage_Buffer *srcYp, const vImage_Buffer *srcCbCr, const vImage_Buffer *dest, const vImage_YpCbCrToARGB *info, const uint8_t permuteMap[4], const uint8_t alpha, vImage_Flags flags)
{
  return MEMORY[0x270EDEF70](srcYp, srcCbCr, dest, info, permuteMap, alpha, *(void *)&flags);
}

vImage_Error vImageConvert_ARGB8888To420Yp8_CbCr8(const vImage_Buffer *src, const vImage_Buffer *destYp, const vImage_Buffer *destCbCr, const vImage_ARGBToYpCbCr *info, const uint8_t permuteMap[4], vImage_Flags flags)
{
  return MEMORY[0x270EDEF88](src, destYp, destCbCr, info, permuteMap, *(void *)&flags);
}

vImage_Error vImageConvert_ARGBToYpCbCr_GenerateConversion(const vImage_ARGBToYpCbCrMatrix *matrix, const vImage_YpCbCrPixelRange *pixelRange, vImage_ARGBToYpCbCr *outInfo, vImageARGBType inARGBType, vImageYpCbCrType outYpCbCrType, vImage_Flags flags)
{
  return MEMORY[0x270EDEFE0](matrix, pixelRange, outInfo, *(void *)&inARGBType, *(void *)&outYpCbCrType, *(void *)&flags);
}

vImage_Error vImageConvert_FTo16U(const vImage_Buffer *src, const vImage_Buffer *dest, float offset, float scale, vImage_Flags flags)
{
  return MEMORY[0x270EDF010](src, dest, *(void *)&flags, offset, scale);
}

vImage_Error vImageConvert_YpCbCrToARGB_GenerateConversion(const vImage_YpCbCrToARGBMatrix *matrix, const vImage_YpCbCrPixelRange *pixelRange, vImage_YpCbCrToARGB *outInfo, vImageYpCbCrType inYpCbCrType, vImageARGBType outARGBType, vImage_Flags flags)
{
  return MEMORY[0x270EDF140](matrix, pixelRange, outInfo, *(void *)&inYpCbCrType, *(void *)&outARGBType, *(void *)&flags);
}

vImage_Error vImageScale_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x270EDF328](src, dest, tempBuffer, *(void *)&flags);
}