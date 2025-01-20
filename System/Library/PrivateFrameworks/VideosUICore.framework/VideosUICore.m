void sub_1E29E3958(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1E29E3A20(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1E29E3CD4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1E29E40F0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1E29E41FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1E29E43F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

unint64_t VUIViewContentModeFromUIContentMode(unint64_t result)
{
  if (result >= 0xD) {
    return 1;
  }
  return result;
}

unint64_t VUIUIViewContentModeFromVUIContentMode(unint64_t result)
{
  if (result >= 0xD) {
    return 1;
  }
  return result;
}

void sub_1E29E5D48(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1E29E6294(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

double VUIRoundValue(double a1)
{
  if (VUIRoundValue_onceToken != -1) {
    dispatch_once(&VUIRoundValue_onceToken, &__block_literal_global_7);
  }
  double v2 = *(double *)&VUIRoundValue_sDisplayScale;
  if (*(double *)&VUIRoundValue_sDisplayScale == 0.0) {
    double v2 = 1.0;
  }
  return round(v2 * a1) / v2;
}

__CFString *VUIBoolLogString(int a1)
{
  if (a1) {
    return @"YES";
  }
  else {
    return @"NO";
  }
}

void sub_1E29E84B4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 64));
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_1E29E96F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, id *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  objc_destroyWeak((id *)(v28 - 112));
  _Unwind_Resume(a1);
}

void sub_1E29EA014(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1E29EA13C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id VUICImageLogObject()
{
  if (VUICImageLogObject_onceToken != -1) {
    dispatch_once(&VUICImageLogObject_onceToken, &__block_literal_global_4_1);
  }
  v0 = (void *)VUICImageLogObject_logger;
  return v0;
}

void sub_1E29EB4D8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 136));
  _Block_object_dispose((const void *)(v2 - 128), 8);
  _Unwind_Resume(a1);
}

CGFloat VUIRectWithFlippedOriginRelativeToBoundingRectWithCondition(int a1, double a2, double a3, double a4, double a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  if (a1)
  {
    v17.origin.x = a6;
    v17.origin.y = a7;
    v17.size.width = a8;
    v17.size.height = a9;
    double v15 = a2 - CGRectGetMinX(v17);
    v18.origin.x = a6;
    v18.origin.y = a7;
    v18.size.width = a8;
    v18.size.height = a9;
    return CGRectGetMaxX(v18) - v15 - a4;
  }
  return a2;
}

id VUICDefaultLogObject()
{
  if (VUICDefaultLogObject_onceToken != -1) {
    dispatch_once(&VUICDefaultLogObject_onceToken, &__block_literal_global_9);
  }
  v0 = (void *)VUICDefaultLogObject_logger;
  return v0;
}

uint64_t VUIUserInterfaceStyleFromTheme(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (VUIUserInterfaceStyleFromTheme_onceToken != -1) {
    dispatch_once(&VUIUserInterfaceStyleFromTheme_onceToken, &__block_literal_global_6);
  }
  if ([v3 length])
  {
    v4 = [(id)VUIUserInterfaceStyleFromTheme_sTypeMap objectForKeyedSubscript:v3];

    if (v4)
    {
      v5 = [(id)VUIUserInterfaceStyleFromTheme_sTypeMap objectForKeyedSubscript:v3];
      a2 = [v5 unsignedIntegerValue];
    }
  }

  return a2;
}

void __VUIRoundValue_block_invoke()
{
  id v1 = [MEMORY[0x1E4F42D90] mainScreen];
  objc_msgSend(v1, "vui_nativeScale");
  VUIRoundValue_sDisplayScale = v0;
}

void sub_1E29EE934(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t __VUICImageLogObject_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.VideosUICore", "Image");
  uint64_t v1 = VUICImageLogObject_logger;
  VUICImageLogObject_logger = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __VUICDefaultLogObject_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.VideosUICore", "Default");
  uint64_t v1 = VUICDefaultLogObject_logger;
  VUICDefaultLogObject_logger = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void VUIRequireMainThread()
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    os_log_t v0 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v1 = *MEMORY[0x1E4F1C3B8];
    id v2 = [MEMORY[0x1E4F29060] currentThread];
    [v0 raise:v1, @"Running on %@ instead of main thread.", v2 format];
  }
}

void __VUIUserInterfaceStyleFromTheme_block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v2[0] = @"light";
  v2[1] = @"dark";
  v3[0] = &unk_1F3DFD620;
  v3[1] = &unk_1F3DFD638;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:2];
  uint64_t v1 = (void *)VUIUserInterfaceStyleFromTheme_sTypeMap;
  VUIUserInterfaceStyleFromTheme_sTypeMap = v0;
}

void sub_1E29EF230(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1E29F2614(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_1E29F3C40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double VUISnap(double a1, double a2, double a3)
{
  if (a3 == 0.0) {
    a3 = 1.0;
  }
  if (a2 == 0.0) {
    a2 = 1.0;
  }
  return a2 * round(a3 * a1 / a2) / a3;
}

double VUICeilValue(double a1)
{
  if (VUICeilValue_onceToken != -1) {
    dispatch_once(&VUICeilValue_onceToken, &__block_literal_global_2);
  }
  double v2 = *(double *)&VUICeilValue_sDisplayScale;
  if (*(double *)&VUICeilValue_sDisplayScale == 0.0) {
    double v2 = 1.0;
  }
  return ceil(v2 * a1) / v2;
}

void __VUICeilValue_block_invoke()
{
  id v1 = [MEMORY[0x1E4F42D90] mainScreen];
  objc_msgSend(v1, "vui_nativeScale");
  VUICeilValue_sDisplayScale = v0;
}

double VUICeilSnap(double a1, double a2, double a3)
{
  if (a3 == 0.0) {
    a3 = 1.0;
  }
  if (a2 == 0.0) {
    a2 = 1.0;
  }
  return a2 * ceil(a3 * a1 / a2) / a3;
}

double VUIFloorValue(double a1)
{
  if (VUIFloorValue_onceToken != -1) {
    dispatch_once(&VUIFloorValue_onceToken, &__block_literal_global_4_0);
  }
  double v2 = *(double *)&VUIFloorValue_sDisplayScale;
  if (*(double *)&VUIFloorValue_sDisplayScale == 0.0) {
    double v2 = 1.0;
  }
  return floor(v2 * a1) / v2;
}

void __VUIFloorValue_block_invoke()
{
  id v1 = [MEMORY[0x1E4F42D90] mainScreen];
  objc_msgSend(v1, "vui_nativeScale");
  VUIFloorValue_sDisplayScale = v0;
}

double VUIFloorSnap(double a1, double a2, double a3)
{
  if (a3 == 0.0) {
    a3 = 1.0;
  }
  if (a2 == 0.0) {
    a2 = 1.0;
  }
  return a2 * floor(a3 * a1 / a2) / a3;
}

CGFloat VUIRectWithFlippedOriginRelativeToBoundingRect(double a1, double a2, double a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  v16.origin.x = a5;
  v16.origin.y = a6;
  v16.size.width = a7;
  v16.size.height = a8;
  double v14 = a1 - CGRectGetMinX(v16);
  v17.origin.x = a5;
  v17.origin.y = a6;
  v17.size.width = a7;
  v17.size.height = a8;
  return CGRectGetMaxX(v17) - v14 - a3;
}

CGFloat VUIRectMakeWithDirectionalOriginRelativeToBoundingRect(int a1, double a2, double a3, double a4, double a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  if (a1)
  {
    v17.origin.x = a6;
    v17.origin.y = a7;
    v17.size.width = a8;
    v17.size.height = a9;
    double v15 = a2 - CGRectGetMinX(v17);
    v18.origin.x = a6;
    v18.origin.y = a7;
    v18.size.width = a8;
    v18.size.height = a9;
    return CGRectGetMaxX(v18) - v15 - a4;
  }
  return a2;
}

double VUIMakeLargestSizeWithGivenSizeAndAspectRatio(double result, double a2, double a3)
{
  if (result < a2) {
    result = a2;
  }
  BOOL v3 = a3 <= 1.0;
  double v4 = result * a3;
  if (!v3) {
    return v4;
  }
  return result;
}

void sub_1E29F9994(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E29FA918(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_1E29FCA1C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 128));
  objc_destroyWeak((id *)(v1 - 120));
  _Unwind_Resume(a1);
}

void sub_1E29FCBFC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

CGImage *VUICompositeBitmapImageOfSizeForImages(void *a1, int a2, int a3, double a4, double a5, double a6)
{
  id v11 = a1;
  uint64_t v12 = [v11 count];
  BOOL v13 = a6 <= 0.0 && v12 == 1;
  if (!v13
    || ((double v14 = (CGImage *)[v11 firstObject],
         size_t Width = CGImageGetWidth(v14),
         size_t Height = CGImageGetHeight(v14),
         double v17 = round(a4),
         round(a5) == (double)Height)
      ? (BOOL v18 = v17 == (double)Width)
      : (BOOL v18 = 0),
        !v18 ? (BOOL v19 = a3 == 0) : (BOOL v19 = 0),
        v19))
  {
    if ([v11 count])
    {
      uint64_t v21 = [v11 firstObject];
      if ((unint64_t)[v11 count] > 1) {
        +[VUIGraphicsImageRenderer preferredFormat];
      }
      else {
      v22 = +[VUIGraphicsImageRenderer formatWithCGImage:v21];
      }
      [v22 setOpaque:0];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __VUICompositeBitmapImageOfSizeForImages_block_invoke;
      v25[3] = &unk_1E6DDD2C8;
      double v27 = a6;
      double v28 = a4;
      double v29 = a5;
      id v26 = v11;
      int v30 = a2;
      +[VUIGraphicsImageRenderer imageWithSize:format:cgContextActions:](VUIGraphicsImageRenderer, "imageWithSize:format:cgContextActions:", v22, v25, a4, a5);
      id v23 = objc_claimAutoreleasedReturnValue();
      v20 = (CGImage *)[v23 CGImage];
      CGImageRetain(v20);
    }
    else
    {
      v20 = 0;
    }
  }
  else
  {
    v20 = CGImageRetain(v14);
  }

  return v20;
}

void __VUICompositeBitmapImageOfSizeForImages_block_invoke(uint64_t a1, CGContextRef c)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (*(double *)(a1 + 40) > 0.0)
  {
    +[VUICoreUtilities radiiFromRadius:](VUICoreUtilities, "radiiFromRadius:");
    double v4 = +[VUICoreUtilities createPathForRadii:inRect:isContinuous:](VUICoreUtilities, "createPathForRadii:inRect:isContinuous:", 1);
    CGContextAddPath(c, v4);
    CGPathRelease(v4);
    CGContextClip(c);
  }
  ClipBoundingBodouble x = CGContextGetClipBoundingBox(c);
  double x = ClipBoundingBox.origin.x;
  double y = ClipBoundingBox.origin.y;
  double width = ClipBoundingBox.size.width;
  double height = ClipBoundingBox.size.height;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v9 = *(id *)(a1 + 32);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        double v14 = *(CGImage **)(*((void *)&v25 + 1) + 8 * i);
        size_t v15 = CGImageGetWidth(v14);
        size_t v16 = CGImageGetHeight(v14);
        double v17 = *(double *)(a1 + 48) / (double)v15;
        double v18 = (double)v16;
        if (v17 < *(double *)(a1 + 56) / (double)v16) {
          double v17 = *(double *)(a1 + 56) / (double)v16;
        }
        CGAffineTransformMakeScale(&v24, v17, v17);
        v32.origin.double x = 0.0;
        v32.origin.double y = 0.0;
        v32.size.double width = (double)v15;
        v32.size.double height = v18;
        CGRect v33 = CGRectApplyAffineTransform(v32, &v24);
        double v19 = v33.origin.x;
        double v20 = v33.origin.y;
        double v21 = v33.size.width;
        double v22 = v33.size.height;
        CGContextSaveGState(c);
        CGBlendMode v23 = *(_DWORD *)(a1 + 64);
        if (v23) {
          CGContextSetBlendMode(c, v23);
        }
        +[VUICoreUtilities centerRect:inRect:](VUICoreUtilities, "centerRect:inRect:", v19, v20, v21, v22, x, y, width, height);
        CGContextDrawImage(c, v34, v14);
        CGContextRestoreGState(c);
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v11);
  }
}

void sub_1E29FDDF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E29FE5B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sDefaultHandler_block_invoke(uint64_t a1, void *a2, __CFString *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  v5 = @"nil event";
  if (a3) {
    v5 = a3;
  }
  v6 = v5;
  v7 = [v4 logObject];

  if (v7)
  {
    v8 = [v4 logObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [v4 name];
      int v12 = 138412546;
      BOOL v13 = v9;
      __int16 v14 = 2112;
      size_t v15 = v6;
      _os_log_impl(&dword_1E29E1000, v8, OS_LOG_TYPE_DEFAULT, "State machine named [%@] processed unhandled event [%@]", (uint8_t *)&v12, 0x16u);
    }
  }
  uint64_t v10 = [v4 currentState];

  return v10;
}

void sub_1E29FEA24(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1E29FED1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E29FEEC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1E29FF2A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1E29FF5DC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1E2A0201C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, id a18)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a18);
  _Unwind_Resume(a1);
}

void VUIDeferredRelease(void *a1)
{
  id v1 = a1;
  double v2 = dispatch_get_global_queue(17, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __VUIDeferredRelease_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v1;
  dispatch_async(v2, block);
}

void __VUIDeferredRelease_block_invoke(uint64_t a1)
{
}

void VUIRequireKeyedCoder(void *a1)
{
  id v1 = a1;
  if (([v1 allowsKeyedCoding] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The coder %@ does not allow keyed coding.", v1 format];
  }
}

void VUIWaitForDebugger()
{
  uint64_t v0 = [MEMORY[0x1E4F1C9C8] distantFuture];
}

void sub_1E2A040B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_1E2A0592C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1E2A05A70(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1E2A06580(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__2(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_1E2A08550(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_1E2A08D04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E2A09760(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_1E2A098FC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1E2A0A26C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak(v16);
  objc_destroyWeak((id *)(v18 - 88));
  _Unwind_Resume(a1);
}

void sub_1E2A0DA18(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1E2A0DFF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

BOOL VUIErrorIsErrorDomainAndCode(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  v7 = [v5 domain];
  int v8 = [v7 isEqualToString:v6];

  if (v8) {
    BOOL v9 = [v5 code] == a3;
  }
  else {
    BOOL v9 = 0;
  }

  return v9;
}

BOOL VUIErrorIsErrorCode(void *a1, uint64_t a2)
{
  return VUIErrorIsErrorDomainAndCode(a1, @"VideosUICoreErrorDomain", a2);
}

BOOL VUIErrorIsCancelled(void *a1)
{
  return VUIErrorIsErrorDomainAndCode(a1, @"VideosUICoreErrorDomain", 1);
}

id VUIErrorWithDomain(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v7 = a1;
  id v8 = objc_alloc_init(v6);
  if (v5)
  {
    BOOL v9 = (void *)[v5 copy];
    [v8 setObject:v9 forKey:*MEMORY[0x1E4F28A50]];
  }
  uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:v7 code:a2 userInfo:v8];

  return v10;
}

id VUIError(uint64_t a1, void *a2)
{
  return VUIErrorWithDomain(@"VideosUICoreErrorDomain", a1, a2);
}

id VUIErrorCancelled()
{
  return VUIErrorWithDomain(@"VideosUICoreErrorDomain", 1, 0);
}

id VUIErrorCancelledWithUnderlyingError(void *a1)
{
  return VUIErrorWithDomain(@"VideosUICoreErrorDomain", 1, a1);
}

CGRect AVMakeRectWithAspectRatioInsideRect(CGSize aspectRatio, CGRect boundingRect)
{
  MEMORY[0x1F40D0EC8]((__n128)aspectRatio, *(__n128 *)&aspectRatio.height, (__n128)boundingRect.origin, *(__n128 *)&boundingRect.origin.y, (__n128)boundingRect.size, *(__n128 *)&boundingRect.size.height);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9730](data, *(void *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9770](data, *(void *)&len, md);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7978](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1F40D88A0](allocator, filePath, pathStyle, isDirectory);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

uint64_t CGContextClear()
{
  return MEMORY[0x1F40D9D30]();
}

void CGContextClip(CGContextRef c)
{
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
}

uint64_t CGContextDrawSVGDocument()
{
  return MEMORY[0x1F4114E48]();
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

CGRect CGContextGetClipBoundingBox(CGContextRef c)
{
  MEMORY[0x1F40D9F78](c);
  result.size.double height = v4;
  result.size.double width = v3;
  result.origin.double y = v2;
  result.origin.double x = v1;
  return result;
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x1F40DA778](space, colors, locations);
}

void CGGradientRelease(CGGradientRef gradient)
{
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x1F40DA890](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1F40E9758](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1F40E9760](idst);
}

CGImageAlphaInfo CGImageGetAlphaInfo(CGImageRef image)
{
  return MEMORY[0x1F40DA8D0](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1F40DA948](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1F40DA9B8](image);
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x1F40DAA98](image);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1F40E9938](isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1F40E9968](isrc, index, options);
}

CGImageRef CGImageSourceCreateThumbnailAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1F40E9988](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E9998](data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E99C8](url, options);
}

CFStringRef CGImageSourceGetType(CGImageSourceRef isrc)
{
  return (CFStringRef)MEMORY[0x1F40E9A18](isrc);
}

void CGPathAddArc(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise)
{
}

void CGPathAddArcToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x1, CGFloat y1, CGFloat x2, CGFloat y2, CGFloat radius)
{
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

CGPathRef CGPathCreateCopy(CGPathRef path)
{
  return (CGPathRef)MEMORY[0x1F40DB010](path);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1F40DB068]();
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathRelease(CGPathRef path)
{
}

CGPathRef CGPathRetain(CGPathRef path)
{
  return (CGPathRef)MEMORY[0x1F40DB178](path);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x1F40DB220](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x1F40DB268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x1F40DB270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x1F40DB298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x1F40DB2A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2B8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x1F40DB2C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.double height = v4;
  result.size.double width = v3;
  result.origin.double y = v2;
  result.origin.double x = v1;
  return result;
}

uint64_t CGSVGDocumentCreateFromData()
{
  return MEMORY[0x1F4114E50]();
}

uint64_t CGSVGDocumentGetCanvasSize()
{
  return MEMORY[0x1F4114E58]();
}

uint64_t CGSVGDocumentRelease()
{
  return MEMORY[0x1F4114E70]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x1F4102B38]();
}

BOOL UIAccessibilityIsSwitchControlRunning(void)
{
  return MEMORY[0x1F4102B48]();
}

BOOL UIAccessibilityIsVideoAutoplayEnabled(void)
{
  return MEMORY[0x1F4102B50]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x1F4102B58]();
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return MEMORY[0x1F4102BB8](lhs, rhs);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x1F4102BC0](category);
}

void UIGraphicsBeginImageContext(CGSize size)
{
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1F4102C40]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1F4102C48]();
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x1F4102C78](image, compressionQuality);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x1F4102C80](image);
}

void UIRectFill(CGRect rect)
{
}

void UIRectFillUsingBlendMode(CGRect rect, CGBlendMode blendMode)
{
}

CFStringRef UTTypeCopyPreferredTagWithClass(CFStringRef inUTI, CFStringRef inTagClass)
{
  return (CFStringRef)MEMORY[0x1F40DEE50](inUTI, inTagClass);
}

uint64_t _AXSEnhanceBackgroundContrastEnabled()
{
  return MEMORY[0x1F4178A70]();
}

uint64_t _AXSFullKeyboardAccessEnabled()
{
  return MEMORY[0x1F4178AD8]();
}

uint64_t _AXSHighContrastFocusIndicatorsEnabled()
{
  return MEMORY[0x1F4178B58]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

void free(void *a1)
{
}

int fts_close(FTS *a1)
{
  return MEMORY[0x1F40CC2F8](a1);
}

FTS *__cdecl fts_open(char *const *a1, int a2, int (__cdecl *a3)(const FTSENT **, const FTSENT **))
{
  return (FTS *)MEMORY[0x1F40CC300](a1, *(void *)&a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return (FTSENT *)MEMORY[0x1F40CC308](a1);
}

int fts_set(FTS *a1, FTSENT *a2, int a3)
{
  return MEMORY[0x1F40CC310](a1, a2, *(void *)&a3);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CC900](a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

void objc_moveWeak(id *to, id *from)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1F40CD558](log);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1F40CD648]();
}