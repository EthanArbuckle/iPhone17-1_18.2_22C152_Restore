@interface UIImage(PBFUtilities)
+ (id)pbf_galleryHeroSnapshotForExtension:()PBFUtilities descriptorIdentifier:displayContext:;
+ (id)pbf_galleryPosterWithColor:()PBFUtilities scale:;
- (id)pbf_alphaOnlyImage;
- (id)pbf_colorOfImage;
@end

@implementation UIImage(PBFUtilities)

+ (id)pbf_galleryPosterWithColor:()PBFUtilities scale:
{
  id v5 = a4;
  if (!v5)
  {
    id v5 = [MEMORY[0x1E4FB1618] magentaColor];
  }
  if (a1 == 0.0)
  {
    v6 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v6 scale];
  }
  v7 = +[PBFPosterGalleryViewSpec specForScreen:0];
  [v7 posterContentSize];
  double v9 = v8;
  double v11 = v10;

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__UIImage_PBFUtilities__pbf_galleryPosterWithColor_scale___block_invoke;
  block[3] = &__block_descriptor_48_e5_v8__0l;
  *(double *)&block[4] = v9;
  *(double *)&block[5] = v11;
  if (pbf_galleryPosterWithColor_scale__onceToken != -1) {
    dispatch_once(&pbf_galleryPosterWithColor_scale__onceToken, block);
  }
  v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:", v9, v11);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __58__UIImage_PBFUtilities__pbf_galleryPosterWithColor_scale___block_invoke_2;
  v16[3] = &unk_1E6983800;
  id v17 = v5;
  id v13 = v5;
  v14 = [v12 imageWithActions:v16];

  return v14;
}

- (id)pbf_colorOfImage
{
  id v1 = a1;
  v2 = (CGImage *)[v1 CGImage];
  if (v2) {
    goto LABEL_2;
  }
  double v9 = (void *)[v1 ioSurface];
  if (!v9) {
    goto LABEL_7;
  }
  double v10 = objc_msgSend((id)objc_msgSend(v1, "ioSurface"), "CGImageBuilder");
  v2 = (CGImage *)CFAutorelease((CFTypeRef)[v10 buildCGImage]);

  if (v2)
  {
LABEL_2:
    int data = 0;
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v4 = CGBitmapContextCreate(&data, 1uLL, 1uLL, 8uLL, 0x20uLL, DeviceRGB, 1u);
    CGColorSpaceRelease(DeviceRGB);
    if (v4)
    {
      v14.origin.x = 0.0;
      v14.origin.y = 0.0;
      v14.size.width = 1.0;
      v14.size.height = 1.0;
      CGContextDrawImage(v4, v14, v2);
      CGContextRelease(v4);
      LOBYTE(v6) = BYTE1(data);
      LOBYTE(v5) = data;
      LOBYTE(v8) = HIBYTE(data);
      LOBYTE(v7) = BYTE2(data);
      double v9 = [MEMORY[0x1E4FB1618] colorWithRed:(double)v5 / 255.0 green:(double)v6 / 255.0 blue:(double)v7 / 255.0 alpha:(double)v8 / 255.0];
      goto LABEL_7;
    }
  }
  double v9 = 0;
LABEL_7:
  return v9;
}

- (id)pbf_alphaOnlyImage
{
  [a1 scale];
  double v3 = v2;
  double v4 = *MEMORY[0x1E4F1DAD8];
  double v5 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [a1 size];
  double v7 = v6;
  double v9 = v8;
  v19.origin.x = v4;
  v19.origin.y = v5;
  v19.size.width = v7;
  v19.size.height = v9;
  size_t v10 = (unint64_t)(v3 * CGRectGetWidth(v19));
  v20.origin.x = v4;
  v20.origin.y = v5;
  v20.size.width = v7;
  v20.size.height = v9;
  size_t v11 = (unint64_t)(v3 * CGRectGetHeight(v20));
  size_t NumberOfComponents = CGColorSpaceGetNumberOfComponents(0);
  id v13 = CGBitmapContextCreate(0, v10, v11, 8uLL, v10 + v10 * NumberOfComponents, 0, 7u);
  if (v13)
  {
    CGRect v14 = v13;
    CGContextTranslateCTM(v13, 0.0, (double)v11);
    CGContextScaleCTM(v14, v3, -v3);
    UIGraphicsPushContext(v14);
    objc_msgSend(a1, "drawInRect:", v4, v5, v7, v9);
    UIGraphicsPopContext();
    Image = CGBitmapContextCreateImage(v14);
    CGContextRelease(v14);
    v16 = objc_msgSend(MEMORY[0x1E4FB1818], "imageWithCGImage:scale:orientation:", Image, objc_msgSend(a1, "imageOrientation"), v3);
    CGImageRelease(Image);
  }
  else
  {
    v16 = 0;
  }
  return v16;
}

+ (id)pbf_galleryHeroSnapshotForExtension:()PBFUtilities descriptorIdentifier:displayContext:
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v7)
  {
    v27 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"extension"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[UIImage(PBFUtilities) pbf_galleryHeroSnapshotForExtension:descriptorIdentifier:displayContext:]();
    }
    [v27 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D326DB6CLL);
  }
  size_t v10 = v9;
  id v11 = v8;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v11)
  {
    v28 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[UIImage(PBFUtilities) pbf_galleryHeroSnapshotForExtension:descriptorIdentifier:displayContext:]();
    }
    [v28 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D326DBD0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v29 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[UIImage(PBFUtilities) pbf_galleryHeroSnapshotForExtension:descriptorIdentifier:displayContext:]();
    }
    [v29 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D326DC34);
  }

  v12 = [v7 posterExtensionBundleIdentifier];
  if (PFIsPhotosPosterProviderBundleId())
  {
    id v13 = [v11 componentsSeparatedByString:@"|"];
    CGRect v14 = [v13 firstObject];

    if (v14)
    {
      id v15 = v14;

      id v11 = v15;
    }
  }
  if (pbf_galleryHeroSnapshotForExtension_descriptorIdentifier_displayContext__onceToken != -1) {
    dispatch_once(&pbf_galleryHeroSnapshotForExtension_descriptorIdentifier_displayContext__onceToken, &__block_literal_global_24);
  }
  v16 = NSString;
  id v17 = objc_msgSend(v10, "pbf_displayContextPersistenceIdentifier");
  v18 = [v7 persistentIdentifier];
  CGRect v19 = objc_msgSend(v18, "pbf_sha256Hash");
  CGRect v20 = [v16 stringWithFormat:@"[%@]-[%@]-[%@]-[%@].png", v12, v11, v17, v19];

  v21 = (void *)pbf_galleryHeroSnapshotForExtension_descriptorIdentifier_displayContext__heroCache;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __97__UIImage_PBFUtilities__pbf_galleryHeroSnapshotForExtension_descriptorIdentifier_displayContext___block_invoke_2;
  v30[3] = &unk_1E6983828;
  id v31 = v12;
  id v32 = v11;
  id v33 = v10;
  id v22 = v10;
  id v23 = v11;
  id v24 = v12;
  v25 = [v21 imageForKey:v20 generatingIfNecessaryWithBlock:v30];

  return v25;
}

+ (void)pbf_galleryHeroSnapshotForExtension:()PBFUtilities descriptorIdentifier:displayContext:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  double v2 = (objc_class *)OUTLINED_FUNCTION_4();
  double v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)pbf_galleryHeroSnapshotForExtension:()PBFUtilities descriptorIdentifier:displayContext:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  double v2 = (objc_class *)OUTLINED_FUNCTION_4();
  double v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end