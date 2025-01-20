@interface UIColor(SafariSharedExtras)
+ (id)safari_colorWithRGBColorComponents:()SafariSharedExtras;
+ (id)safari_colorWithSerializedColorData:()SafariSharedExtras;
+ (id)safari_colorWithWBSNamedColorOption:()SafariSharedExtras;
- (BOOL)safari_isOffWhite;
- (BOOL)safari_meetsThresholdForDarkAppearance;
- (double)safari_contrastRatioWithColor:()SafariSharedExtras;
- (double)safari_grayscaleComponent;
- (double)safari_luminance;
- (double)safari_saturation;
- (id)safari_colorByModifyingBrightnessByMultiplier:()SafariSharedExtras;
- (id)safari_colorDataForSerialization;
- (id)safari_rgbColorComponents;
@end

@implementation UIColor(SafariSharedExtras)

- (BOOL)safari_meetsThresholdForDarkAppearance
{
  objc_msgSend(a1, "safari_grayscaleComponent");
  return v1 <= 0.6;
}

- (double)safari_grayscaleComponent
{
  v2 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DBB8]);
  CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v2, kCGRenderingIntentDefault, (CGColorRef)[a1 CGColor], 0);
  double v4 = *CGColorGetComponents(CopyByMatchingToColorSpace);
  CFRelease(v2);
  CFRelease(CopyByMatchingToColorSpace);
  return v4;
}

+ (id)safari_colorWithRGBColorComponents:()SafariSharedExtras
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || [v3 count] != 3) {
    goto LABEL_7;
  }
  double v7 = 0.0;
  double v8 = 0.0;
  double v6 = 0.0;
  double v4 = 0;
  if (!getValidColorComponentAtIndexInArray(v3, 0, &v8)) {
    goto LABEL_8;
  }
  if (getValidColorComponentAtIndexInArray(v3, 1, &v7)
    && getValidColorComponentAtIndexInArray(v3, 2, &v6))
  {
    double v4 = [MEMORY[0x1E4F428B8] colorWithRed:v8 green:v7 blue:v6 alpha:1.0];
  }
  else
  {
LABEL_7:
    double v4 = 0;
  }
LABEL_8:

  return v4;
}

- (id)safari_rgbColorComponents
{
  v9[3] = *MEMORY[0x1E4F143B8];
  double v7 = 0.0;
  double v8 = 0.0;
  double v6 = 0.0;
  [a1 getRed:&v8 green:&v7 blue:&v6 alpha:0];
  double v1 = [NSNumber numberWithDouble:v8];
  v9[0] = v1;
  v2 = [NSNumber numberWithDouble:v7];
  v9[1] = v2;
  id v3 = [NSNumber numberWithDouble:v6];
  v9[2] = v3;
  double v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:3];

  return v4;
}

+ (id)safari_colorWithWBSNamedColorOption:()SafariSharedExtras
{
  id v3 = a3;
  int v4 = [v3 isClearColor];
  v5 = (void *)MEMORY[0x1E4F428B8];
  if (v4)
  {
    [MEMORY[0x1E4F428B8] clearColor];
  }
  else
  {
    [v3 redComponent];
    double v7 = v6;
    [v3 greenComponent];
    double v9 = v8;
    [v3 blueComponent];
    double v11 = v10;
    [v3 alphaComponent];
    [v5 colorWithRed:v7 green:v9 blue:v11 alpha:v12];
  v13 = };

  return v13;
}

+ (id)safari_colorWithSerializedColorData:()SafariSharedExtras
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v10 = 0;
    int v4 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v3 error:&v10];
    id v5 = v10;
    if (v5)
    {
      double v6 = (id)WBS_LOG_CHANNEL_PREFIXKeyedArchiver();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        double v7 = objc_msgSend(v5, "safari_privacyPreservingDescription");
        +[UIColor(SafariSharedExtras) safari_colorWithSerializedColorData:v6];
      }
    }
    double v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F284E8]];
    [v4 finishDecoding];
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

- (id)safari_colorDataForSerialization
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [v2 encodeObject:a1 forKey:*MEMORY[0x1E4F284E8]];
  id v3 = [v2 encodedData];

  return v3;
}

- (double)safari_luminance
{
  v2 = objc_getAssociatedObject(a1, sel_safari_luminance);
  id v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v6 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC18]);
    id v7 = a1;
    CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v6, kCGRenderingIntentDefault, (CGColorRef)[v7 CGColor], 0);
    Components = CGColorGetComponents(CopyByMatchingToColorSpace);
    double v5 = WBSComputeLuminance(*Components, Components[1], Components[2]);
    CFRelease(v6);
    CFRelease(CopyByMatchingToColorSpace);
    id v10 = [NSNumber numberWithDouble:v5];
    objc_setAssociatedObject(v7, sel_safari_luminance, v10, (void *)1);
  }
  return v5;
}

- (double)safari_saturation
{
  double v3 = 0.0;
  double v1 = objc_msgSend(a1, "safari_sRGBColor");
  [v1 getHue:0 saturation:&v3 brightness:0 alpha:0];

  return v3;
}

- (BOOL)safari_isOffWhite
{
  objc_msgSend(a1, "safari_saturation");
  if (v2 >= 0.05) {
    return 0;
  }
  objc_msgSend(a1, "safari_luminance");
  return v3 > 0.8;
}

- (double)safari_contrastRatioWithColor:()SafariSharedExtras
{
  objc_msgSend(a3, "safari_luminance");
  double v5 = v4;
  objc_msgSend(a1, "safari_luminance");
  if (v5 <= v6) {
    double v7 = v6;
  }
  else {
    double v7 = v5;
  }
  if (v5 < v6) {
    double v6 = v5;
  }
  return (v7 + 0.05) / (v6 + 0.05);
}

- (id)safari_colorByModifyingBrightnessByMultiplier:()SafariSharedExtras
{
  double v7 = 0.0;
  double v8 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  [a1 getHue:&v8 saturation:&v7 brightness:&v6 alpha:&v5];
  double v3 = [MEMORY[0x1E4F428B8] colorWithHue:v8 saturation:v7 brightness:v6 * a2 alpha:v5];
  return v3;
}

+ (void)safari_colorWithSerializedColorData:()SafariSharedExtras .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1ABB70000, log, OS_LOG_TYPE_ERROR, "Failed to read from color data: %{public}@", buf, 0xCu);
}

@end