@interface PBFHomeScreenPreviewImageBuilder
- (id)_imageForView:(id)a3;
- (void)homeScreenImageForConfiguration:(id)a3 unlockedPosterSnapshot:(id)a4 displayContext:(id)a5 imageScaleRelativeToScreen:(double)a6 options:(unint64_t)a7 completion:(id)a8;
@end

@implementation PBFHomeScreenPreviewImageBuilder

- (void)homeScreenImageForConfiguration:(id)a3 unlockedPosterSnapshot:(id)a4 displayContext:(id)a5 imageScaleRelativeToScreen:(double)a6 options:(unint64_t)a7 completion:(id)a8
{
  id v14 = a8;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  objc_msgSend(v15, "pbf_frame");
  objc_msgSend(v15, "pbf_scale");
  BSFloatRoundForScale();
  double v19 = v18;
  objc_msgSend(v15, "pbf_frame");
  objc_msgSend(v15, "pbf_scale");
  BSFloatRoundForScale();
  double v21 = v20;
  unint64_t v22 = a7 & 1;
  unint64_t v23 = (a7 >> 1) & 1;
  v24 = objc_alloc_init(PBFHomeScreenPreviewViewBuilder);
  [(PBFHomeScreenPreviewViewBuilder *)v24 setDisplayContext:v15];
  [(PBFHomeScreenPreviewViewBuilder *)v24 setHomeScreenConfiguration:v17];

  [(PBFHomeScreenPreviewViewBuilder *)v24 setUnlockedPosterSnapshot:v16];
  [(PBFHomeScreenPreviewViewBuilder *)v24 setExcludesSilhouette:v22];
  [(PBFHomeScreenPreviewViewBuilder *)v24 setExcludesHomeScreenDock:v23];
  [(PBFHomeScreenPreviewViewBuilder *)v24 setViewScreenSizeScale:a6];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __152__PBFHomeScreenPreviewImageBuilder_homeScreenImageForConfiguration_unlockedPosterSnapshot_displayContext_imageScaleRelativeToScreen_options_completion___block_invoke;
  v32[3] = &unk_1E6983B38;
  v32[4] = self;
  id v33 = v14;
  id v25 = v14;
  [(PBFHomeScreenPreviewViewBuilder *)v24 setRenderingCompletionHandler:v32];
  v26 = [(PBFHomeScreenPreviewViewBuilder *)v24 buildView];
  v27 = [v26 layer];

  objc_msgSend(v15, "pbf_scale");
  double v29 = v28;

  [v27 setContentsScale:v29];
  memset(&v31, 0, sizeof(v31));
  CGAffineTransformMakeScale(&v31, v29, v29);
  CGAffineTransform v30 = v31;
  [v27 setAffineTransform:&v30];
  objc_msgSend(v27, "setFrame:", 0.0, 0.0, v19 * v29, v21 * v29);
}

void __152__PBFHomeScreenPreviewImageBuilder_homeScreenImageForConfiguration_unlockedPosterSnapshot_displayContext_imageScaleRelativeToScreen_options_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) _imageForView:a2];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (id)_imageForView:(id)a3
{
  v36[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 layer];
  [v4 bounds];
  double v6 = v5;
  v7 = [v3 layer];
  [v7 contentsScale];
  double v9 = v6 * v8;

  v10 = [v3 layer];
  [v10 bounds];
  double v12 = v11;
  v13 = [v3 layer];
  [v13 contentsScale];
  double v15 = v12 * v14;

  id v16 = MTLCreateSystemDefaultDevice();
  uint64_t v34 = 1;
  id v17 = objc_msgSend(MEMORY[0x1E4F2EF78], "bs_IOSurfaceWithWidth:height:options:", (uint64_t)v9, (uint64_t)v15, &v34);
  double v18 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:80 width:(unint64_t)v9 height:(unint64_t)v15 mipmapped:0];
  [v18 setUsage:4];
  uint64_t v19 = [v16 newTextureWithDescriptor:v18 iosurface:v17 plane:0];
  id v33 = (void *)v19;
  int v20 = MGGetBoolAnswer();
  double v21 = (CFStringRef *)MEMORY[0x1E4F1DBE8];
  if (!v20) {
    double v21 = (CFStringRef *)MEMORY[0x1E4F1DC98];
  }
  CGColorSpaceRef v22 = CGColorSpaceCreateWithName(*v21);
  unint64_t v23 = (void *)[v16 newCommandQueue];
  [v23 setBackgroundGPUPriority:2];
  uint64_t v24 = *MEMORY[0x1E4F3A4D8];
  v35[0] = *MEMORY[0x1E4F3A4D0];
  v35[1] = v24;
  v36[0] = v22;
  v36[1] = v23;
  v35[2] = @"kCARendererFlags";
  v36[2] = &unk_1F2AAED08;
  id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:3];
  v26 = [MEMORY[0x1E4F39C60] rendererWithMTLTexture:v19 options:v25];
  v27 = [v3 layer];

  [v26 setLayer:v27];
  objc_msgSend(v26, "setBounds:", 0.0, 0.0, v9, v15);
  [MEMORY[0x1E4F39CF8] flush];
  [v26 beginFrameAtTime:0 timeStamp:0.0];
  [v26 render];
  [v26 endFrame];
  double v28 = [v23 commandBuffer];
  [v28 enqueue];
  [v28 commit];
  [v28 waitUntilCompleted];
  double v29 = [v17 CGImageBuilder];
  id v30 = (id)[v29 setOpaque:1];
  CGAffineTransform v31 = objc_msgSend(MEMORY[0x1E4FB1818], "imageWithCGImage:", CFAutorelease((CFTypeRef)objc_msgSend(v29, "buildCGImage")));

  return v31;
}

@end