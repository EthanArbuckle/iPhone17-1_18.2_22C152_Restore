@interface SBFCARendererImpl
+ (id)_actuallyRenderImage:(CGImage *)a3 requiresBGRA:(BOOL)a4 downsampleFactor:(double)a5 layerCustomizer:(id)a6;
+ (id)luminanceTreatmentFilters;
+ (id)renderMaterialImage:(CGImage *)a3 recipeName:(id)a4 containingBundle:(id)a5 weighting:(double)a6 downsampleFactor:(double)a7;
+ (id)renderMaterialImage:(CGImage *)a3 recipeName:(id)a4 containingBundle:(id)a5 weighting:(double)a6 downsampleFactor:(double)a7 scaleAdjustment:(id)a8;
+ (id)renderTreatedWallpaperImage:(CGImage *)a3 needsLuminanceTreatment:(BOOL)a4 needsDimmingTreatment:(BOOL)a5 downsampleFactor:(double)a6 averageColor:(id)a7;
+ (void)luminanceTreatmentFilters;
@end

@implementation SBFCARendererImpl

+ (id)renderTreatedWallpaperImage:(CGImage *)a3 needsLuminanceTreatment:(BOOL)a4 needsDimmingTreatment:(BOOL)a5 downsampleFactor:(double)a6 averageColor:(id)a7
{
  id v12 = a7;
  if (*MEMORY[0x1E4F43630] && [(id)*MEMORY[0x1E4F43630] isFrontBoard]) {
    +[SBFCARendererImpl renderTreatedWallpaperImage:needsLuminanceTreatment:needsDimmingTreatment:downsampleFactor:averageColor:]();
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __125__SBFCARendererImpl_renderTreatedWallpaperImage_needsLuminanceTreatment_needsDimmingTreatment_downsampleFactor_averageColor___block_invoke;
  v17[3] = &unk_1E548D7B0;
  BOOL v20 = a4;
  BOOL v21 = a5;
  id v18 = v12;
  id v19 = a1;
  id v13 = v12;
  v14 = (void *)MEMORY[0x18C133210](v17);
  v15 = [a1 _actuallyRenderImage:a3 requiresBGRA:0 downsampleFactor:v14 layerCustomizer:a6];

  return v15;
}

void __125__SBFCARendererImpl_renderTreatedWallpaperImage_needsLuminanceTreatment_needsDimmingTreatment_downsampleFactor_averageColor___block_invoke(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  components[2] = *(CGFloat *)MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = v11;
  if (*(unsigned char *)(a1 + 48) || *(unsigned char *)(a1 + 49))
  {
    [v11 setAllowsGroupBlending:0];
    id v13 = (void *)MEMORY[0x1E4F3A078];
    if (*(unsigned char *)(a1 + 49))
    {
      id v14 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
      SRGB = CGColorCreateSRGB(0.0, 0.0, 0.0, 0.1);
      [v14 setBackgroundColor:SRGB];
      CGColorRelease(SRGB);
      [v14 setCompositingFilter:*v13];
      [v12 addSublayer:v14];
    }
    if (*(unsigned char *)(a1 + 48))
    {
      v16 = [MEMORY[0x1E4F39B40] layer];
      objc_msgSend(v16, "setFrame:", a3, a4, a5, a6);
      v17 = [*(id *)(a1 + 40) luminanceTreatmentFilters];
      [v16 setFilters:v17];

      [v12 addSublayer:v16];
    }
    if (*(unsigned char *)(a1 + 49))
    {
      id v18 = [MEMORY[0x1E4F39BE8] layer];
      double v31 = 0.0;
      components[0] = 0.0;
      double v29 = 0.0;
      double v30 = 0.0;
      [*(id *)(a1 + 32) getRed:components green:&v31 blue:&v30 alpha:&v29];
      id v19 = [MEMORY[0x1E4F428B8] colorWithRed:v31 * -0.589999974 + components[0] * -0.300000012 + v30 * -0.109999999 + v29 * 0.0 + 1.0 green:v31 * -0.589999974 + components[0] * -0.300000012 + v30 * -0.109999999 + v29 * 0.0 + 1.0 blue:v31 * -0.589999974 + components[0] * -0.300000012 + v30 * -0.109999999 + v29 * 0.0 + 1.0 alpha:v31 * 0.0 + components[0] * 0.0 + v30 * 0.0 + v29 * 0.5 + 0.0];
      uint64_t v20 = [v19 CGColor];

      [v18 setBackgroundColor:v20];
      objc_msgSend(v18, "setFrame:", a3, a4, a5, a6);
      [v18 setCompositingFilter:*MEMORY[0x1E4F3A2A0]];
      [v12 addSublayer:v18];
    }
    if (*(unsigned char *)(a1 + 48))
    {
      BOOL v21 = [MEMORY[0x1E4F39BD0] layer];
      CFIndex v22 = [&unk_1ED89EAB8 count];
      Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v22, MEMORY[0x1E4F1D510]);
      v24 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC00]);
      if (v22)
      {
        v25 = (CGFloat *)&qword_18B5E4318;
        do
        {
          components[0] = 0.0;
          components[1] = *v25;
          CGColorRef v26 = CGColorCreate(v24, components);
          if (v26)
          {
            CGColorRef v27 = v26;
            CFArrayAppendValue(Mutable, v26);
            CFRelease(v27);
          }
          ++v25;
          --v22;
        }
        while (v22);
      }
      [v21 setColors:Mutable];
      CFRelease(Mutable);
      CGColorSpaceRelease(v24);
      [v21 setLocations:&unk_1ED89EAB8];
      objc_msgSend(v21, "setStartPoint:", 0.5, 0.0);
      objc_msgSend(v21, "setEndPoint:", 0.5, 1.0);
      v28 = [MEMORY[0x1E4F39BC0] filterWithType:*v13];
      [v21 setCompositingFilter:v28];
      objc_msgSend(v21, "setFrame:", a3, a4, a5, a6);
      [v12 addSublayer:v21];
    }
    [v12 setShouldRasterize:*(unsigned __int8 *)(a1 + 49)];
  }
}

+ (id)renderMaterialImage:(CGImage *)a3 recipeName:(id)a4 containingBundle:(id)a5 weighting:(double)a6 downsampleFactor:(double)a7 scaleAdjustment:(id)a8
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a8;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __112__SBFCARendererImpl_renderMaterialImage_recipeName_containingBundle_weighting_downsampleFactor_scaleAdjustment___block_invoke;
  v22[3] = &unk_1E548D7D8;
  id v23 = v13;
  id v24 = v14;
  id v25 = v15;
  id v16 = v15;
  id v17 = v14;
  id v18 = v13;
  id v19 = (void *)MEMORY[0x18C133210](v22);
  uint64_t v20 = [a1 _actuallyRenderImage:a3 requiresBGRA:0 downsampleFactor:v19 layerCustomizer:a7];

  return v20;
}

void __112__SBFCARendererImpl_renderMaterialImage_recipeName_containingBundle_weighting_downsampleFactor_scaleAdjustment___block_invoke(void *a1, void *a2, double a3, double a4, double a5, double a6)
{
  id v11 = a2;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2050000000;
  id v12 = (void *)getMTMaterialLayerClass_softClass;
  uint64_t v19 = getMTMaterialLayerClass_softClass;
  if (!getMTMaterialLayerClass_softClass)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __getMTMaterialLayerClass_block_invoke;
    v15[3] = &unk_1E548C938;
    v15[4] = &v16;
    __getMTMaterialLayerClass_block_invoke((uint64_t)v15);
    id v12 = (void *)v17[3];
  }
  id v13 = v12;
  _Block_object_dispose(&v16, 8);
  id v14 = objc_alloc_init(v13);
  [v14 setRecipeName:a1[4] fromBundle:a1[5]];
  [v14 setWeighting:1.0];
  [v14 setBackdropScaleAdjustment:a1[6]];
  objc_msgSend(v14, "setFrame:", a3, a4, a5, a6);
  [v11 addSublayer:v14];
  if (!v14) {
    __112__SBFCARendererImpl_renderMaterialImage_recipeName_containingBundle_weighting_downsampleFactor_scaleAdjustment___block_invoke_cold_1();
  }
}

+ (id)renderMaterialImage:(CGImage *)a3 recipeName:(id)a4 containingBundle:(id)a5 weighting:(double)a6 downsampleFactor:(double)a7
{
  return (id)[a1 renderMaterialImage:a3 recipeName:a4 containingBundle:a5 weighting:&__block_literal_global_18 downsampleFactor:a6 scaleAdjustment:a7];
}

double __96__SBFCARendererImpl_renderMaterialImage_recipeName_containingBundle_weighting_downsampleFactor___block_invoke()
{
  return 0.7;
}

+ (id)_actuallyRenderImage:(CGImage *)a3 requiresBGRA:(BOOL)a4 downsampleFactor:(double)a5 layerCustomizer:(id)a6
{
  v41[2] = *MEMORY[0x1E4F143B8];
  v8 = (void (**)(id, NSObject *, double, double, double, double))a6;
  if (*MEMORY[0x1E4F43630] && [(id)*MEMORY[0x1E4F43630] isFrontBoard]) {
    +[SBFCARendererImpl _actuallyRenderImage:requiresBGRA:downsampleFactor:layerCustomizer:]();
  }
  if (!a3) {
    +[SBFCARendererImpl _actuallyRenderImage:requiresBGRA:downsampleFactor:layerCustomizer:]();
  }
  double Width = (double)CGImageGetWidth(a3);
  double Height = (double)CGImageGetHeight(a3);
  double v11 = Height / a5;
  if ((unint64_t)(Width / a5)) {
    BOOL v12 = (unint64_t)(Height / a5) == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    id v14 = SBLogWallpaper();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[SBFCARendererImpl _actuallyRenderImage:requiresBGRA:downsampleFactor:layerCustomizer:](v14, Width / a5, v11);
    }
    id v13 = 0;
  }
  else
  {
    id v14 = [MEMORY[0x1E4F39BE8] layer];
    id v15 = [MEMORY[0x1E4F39BE8] layer];
    [v14 setContents:a3];
    [v15 addSublayer:v14];
    v37 = v15;
    objc_msgSend(v15, "setFrame:", 0.0, 0.0, Width / a5, v11);
    -[NSObject setFrame:](v14, "setFrame:", 0.0, 0.0, Width, Height);
    memset(&v39, 0, sizeof(v39));
    CGAffineTransformMakeScale(&v39, 1.0 / a5, -1.0 / a5);
    CGAffineTransform v38 = v39;
    [v14 setAffineTransform:&v38];
    -[NSObject setPosition:](v14, "setPosition:", Width / a5 * 0.5, v11 * 0.5);
    if (v8) {
      v8[2](v8, v14, 0.0, 0.0, Width, Height);
    }
    id v16 = MTLCreateSystemDefaultDevice();
    *(void *)&v38.a = 1;
    id v13 = (__IOSurface *)objc_msgSend(MEMORY[0x1E4F2EF78], "bs_IOSurfaceWithWidth:height:options:", (unint64_t)(Width / a5), (unint64_t)v11, &v38);
    id v17 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:80 width:(unint64_t)(Width / a5) height:(unint64_t)v11 mipmapped:0];
    [v17 setUsage:4];
    v36 = (void *)[v16 newTextureWithDescriptor:v17 iosurface:v13 plane:0];
    int v18 = MGGetBoolAnswer();
    uint64_t v19 = (CFStringRef *)MEMORY[0x1E4F1DBE8];
    if (!v18) {
      uint64_t v19 = (CFStringRef *)MEMORY[0x1E4F1DC98];
    }
    uint64_t v20 = CGColorSpaceCreateWithName(*v19);
    v35 = v16;
    BOOL v21 = (void *)[v16 newCommandQueue];
    if (objc_opt_respondsToSelector())
    {
      CFIndex v22 = [MEMORY[0x1E4F4F730] serial];
      id v23 = [v22 serviceClass:33];
      id v24 = (void *)BSDispatchQueueCreate();

      [v21 setSubmissionQueue:v24];
    }
    if (objc_opt_respondsToSelector())
    {
      id v25 = [MEMORY[0x1E4F4F730] serial];
      CGColorRef v26 = [v25 serviceClass:33];
      CGColorRef v27 = (void *)BSDispatchQueueCreate();

      [v21 setCompletionQueue:v27];
    }
    uint64_t v28 = *MEMORY[0x1E4F3A4D8];
    v40[0] = *MEMORY[0x1E4F3A4D0];
    v40[1] = v28;
    v41[0] = v20;
    v41[1] = v21;
    double v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:2];
    double v30 = [MEMORY[0x1E4F39C60] rendererWithMTLTexture:v36 options:v29];
    [v30 setLayer:v37];
    objc_msgSend(v30, "setBounds:", 0.0, 0.0, Width / a5, v11);
    [MEMORY[0x1E4F39CF8] flush];
    [v30 beginFrameAtTime:0 timeStamp:0.0];
    [v30 render];
    [v30 endFrame];
    double v31 = [v21 commandBuffer];
    [v31 enqueue];
    [v31 commit];
    [v31 waitUntilCompleted];
    CFPropertyListRef v32 = CGColorSpaceCopyPropertyList(v20);
    if (v32)
    {
      v33 = v32;
      IOSurfaceSetValue(v13, (CFStringRef)*MEMORY[0x1E4F2F068], v32);
      CFRelease(v33);
    }
    CGColorSpaceRelease(v20);
  }
  return v13;
}

+ (id)luminanceTreatmentFilters
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v2 = SBFBundle();
  if (!v2) {
    +[SBFCARendererImpl luminanceTreatmentFilters]();
  }
  v3 = v2;
  CFURLRef v4 = [v2 URLForResource:@"WallpaperLuminanceMap" withExtension:@"png"];
  if (!v4) {
    +[SBFCARendererImpl luminanceTreatmentFilters]();
  }
  CFURLRef v5 = v4;
  v6 = CGImageSourceCreateWithURL(v4, 0);
  if (!v6) {
LABEL_12:
  }
    +[SBFCARendererImpl luminanceTreatmentFilters]();
  v7 = v6;
  if (!CGImageSourceGetCount(v6))
  {
    CFRelease(v7);
    goto LABEL_12;
  }
  CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(v7, 0, 0);
  CFRelease(v7);
  if (!ImageAtIndex) {
    goto LABEL_12;
  }
  v9 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A268]];
  [v9 setValue:ImageAtIndex forKey:@"inputColorMap"];

  v10 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A048]];
  [v10 setValue:&unk_1ED89F0C8 forKey:@"inputAmount"];
  v13[0] = v10;
  v13[1] = v9;
  double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];

  return v11;
}

+ (void)renderTreatedWallpaperImage:needsLuminanceTreatment:needsDimmingTreatment:downsampleFactor:averageColor:.cold.1()
{
}

void __112__SBFCARendererImpl_renderMaterialImage_recipeName_containingBundle_weighting_downsampleFactor_scaleAdjustment___block_invoke_cold_1()
{
}

+ (void)_actuallyRenderImage:requiresBGRA:downsampleFactor:layerCustomizer:.cold.1()
{
}

+ (void)_actuallyRenderImage:(double)a3 requiresBGRA:downsampleFactor:layerCustomizer:.cold.2(NSObject *a1, double a2, double a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  CFURLRef v4 = NSStringFromCGSize(*(CGSize *)&a2);
  int v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_18B52E000, a1, OS_LOG_TYPE_ERROR, "Image output size (%@) is invalid. Not rendering image", (uint8_t *)&v5, 0xCu);
}

+ (void)_actuallyRenderImage:requiresBGRA:downsampleFactor:layerCustomizer:.cold.3()
{
}

+ (void)luminanceTreatmentFilters
{
}

@end