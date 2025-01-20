@interface SFShareSheetRendering
+ (BOOL)isAXFromConfig:(id)a3;
+ (CGImage)createCGImageForRenderingCommand:(id)a3;
+ (CGSize)nameLabelSizeFromConfig:(id)a3;
+ (double)_nearbyBadgeNumberStringTopInsetForIdiom:(int64_t)a3;
+ (double)_normalCellWidthForIdiom:(int64_t)a3;
+ (double)morePlatterMaxWidthFromConfig:(id)a3 activityCategory:(int64_t)a4;
+ (double)platterMaxWidthFromConfig:(id)a3;
+ (id)_nearbyBadgeFontForIdiom:(int64_t)a3;
+ (id)badgeNumberFormatterFromConfig:(id)a3;
+ (id)cappedOrthoLabelFontFromConfig:(id)a3;
+ (id)drawingCommandsForActionPlatterWithTitle:(id)a3 tintColor:(id)a4 hostConfig:(id)a5;
+ (id)drawingCommandsForMoreListEntryTitle:(id)a3 labelColor:(id)a4 hostConfig:(id)a5 activityCategory:(int64_t)a6;
+ (id)drawingCommandsForNameLabelWithString:(id)a3 textColor:(id)a4 maxNumberOfLines:(unint64_t)a5 isAirDrop:(BOOL)a6 ignoreNameWrapping:(BOOL)a7 hostConfig:(id)a8;
+ (id)drawingCommandsForNearbyBadgeWithCount:(int64_t)a3 hostConfig:(id)a4;
+ (id)drawingCommandsForUIActivityTitle:(id)a3 foregroundColor:(id)a4 hostConfig:(id)a5;
+ (int64_t)_hostIdiomFromConfig:(id)a3;
+ (int64_t)hostNaturalTextAlignmentFromConfig:(id)a3;
@end

@implementation SFShareSheetRendering

+ (CGImage)createCGImageForRenderingCommand:(id)a3
{
  id v3 = a3;
  v4 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F002D8]);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__SFShareSheetRendering_createCGImageForRenderingCommand___block_invoke;
  aBlock[3] = &__block_descriptor_40_e5_v8__0l;
  aBlock[4] = v4;
  v5 = (void (**)(void))_Block_copy(aBlock);
  [v3 contextSize];
  double v7 = v6;
  [v3 contextSize];
  v9 = CGBitmapContextCreate(0, (unint64_t)v7, (unint64_t)v8, 8uLL, 0, v4, 1u);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __58__SFShareSheetRendering_createCGImageForRenderingCommand___block_invoke_2;
  v15[3] = &__block_descriptor_40_e5_v8__0l;
  v15[4] = v9;
  v10 = (void (**)(void))_Block_copy(v15);
  CGContextScaleCTM(v9, 1.0, -1.0);
  [v3 contextSize];
  CGContextTranslateCTM(v9, 0.0, -v11);
  UIGraphicsPushContext(v9);
  v12 = [v3 commandBlock];
  v12[2]();

  UIGraphicsPopContext();
  Image = CGBitmapContextCreateImage(v9);
  v10[2](v10);

  v5[2](v5);
  return Image;
}

void __58__SFShareSheetRendering_createCGImageForRenderingCommand___block_invoke(uint64_t a1)
{
}

void __58__SFShareSheetRendering_createCGImageForRenderingCommand___block_invoke_2(uint64_t a1)
{
}

+ (id)badgeNumberFormatterFromConfig:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F08A30]);
    v5 = [v3 hostLocale];
    [v4 setLocale:v5];

    [v4 setNumberStyle:1];
  }
  else
  {
    double v6 = sharingXPCHelperLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      +[SFShareSheetRendering badgeNumberFormatterFromConfig:]();
    }

    id v4 = objc_alloc_init(MEMORY[0x263F08A30]);
  }

  return v4;
}

+ (id)cappedOrthoLabelFontFromConfig:(id)a3
{
  id v3 = a3;
  id v4 = +[SFUIShareSheetActivityCellSpec titleLabelFontTextStyleForIdiom:](SFUIShareSheetActivityCellSpec, "titleLabelFontTextStyleForIdiom:", +[SFShareSheetRendering _hostIdiomFromConfig:v3]);
  v5 = [v3 hostTraitCollection];

  if (v5)
  {
    double v6 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:v4 compatibleWithTraitCollection:v5];
    double v7 = [MEMORY[0x263F81708] fontWithDescriptor:v6 size:0.0];
  }
  else
  {
    double v8 = sharingXPCHelperLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      +[SFShareSheetRendering cappedOrthoLabelFontFromConfig:]();
    }

    double v7 = [MEMORY[0x263F81708] preferredFontForTextStyle:v4];
  }

  return v7;
}

+ (int64_t)hostNaturalTextAlignmentFromConfig:(id)a3
{
  if (a3)
  {
    id v3 = [a3 hostTraitCollection];
    uint64_t v4 = [v3 layoutDirection];

    int64_t v5 = 4;
    if (v4 == 1) {
      int64_t v5 = 2;
    }
    if (v4) {
      return v5;
    }
    else {
      return 0;
    }
  }
  else
  {
    double v7 = sharingXPCHelperLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      +[SFShareSheetRendering hostNaturalTextAlignmentFromConfig:]();
    }

    return 4;
  }
}

+ (BOOL)isAXFromConfig:(id)a3
{
  if (a3)
  {
    id v3 = [a3 hostTraitCollection];
    uint64_t v4 = [v3 preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

    return IsAccessibilityCategory;
  }
  else
  {
    double v7 = sharingXPCHelperLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      +[SFShareSheetRendering isAXFromConfig:]();
    }

    return 0;
  }
}

+ (double)morePlatterMaxWidthFromConfig:(id)a3 activityCategory:(int64_t)a4
{
  id v5 = a3;
  if (+[SFShareSheetRendering _hostIdiomFromConfig:v5] == 6)
  {
    [v5 hostLayoutMargins];
    double v7 = v6;
    [v5 hostLayoutMargins];
    double v9 = v7 + v8 + v7 + v8;
    if (a4 == 1) {
      double v10 = 45.0;
    }
    else {
      double v10 = 0.0;
    }
    [v5 preferredWidth];
    double v12 = v11 - v9 + -26.0 - v10 + -42.0;
    double v13 = -30.0;
  }
  else
  {
    +[SFShareSheetRendering platterMaxWidthFromConfig:v5];
    double v13 = -100.0;
  }
  double v14 = v12 + v13;

  return v14;
}

+ (double)_normalCellWidthForIdiom:(int64_t)a3
{
  double result = 78.0;
  if (a3 == 6) {
    return 80.0;
  }
  return result;
}

+ (int64_t)_hostIdiomFromConfig:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector()) {
    int64_t v4 = [v3 hostIdiom];
  }
  else {
    int64_t v4 = -1;
  }

  return v4;
}

+ (CGSize)nameLabelSizeFromConfig:(id)a3
{
  id v3 = a3;
  +[SFShareSheetRendering _normalCellWidthForIdiom:](SFShareSheetRendering, "_normalCellWidthForIdiom:", +[SFShareSheetRendering _hostIdiomFromConfig:v3]);
  double v5 = v4;
  id v6 = v3;
  if (v6)
  {
    if (+[SFShareSheetRendering isAXFromConfig:v6])
    {
      double v7 = [MEMORY[0x263F82670] currentDevice];
      uint64_t v8 = [v7 userInterfaceIdiom];

      if ((v8 & 0xFFFFFFFFFFFFFFFBLL) != 0)
      {
        [v6 preferredWidth];
        double v10 = v9;
      }
      else
      {
        double v12 = [MEMORY[0x263F82B60] mainScreen];
        [v12 _referenceBounds];
        double v10 = v13;
      }
      if (v10 >= 414.0)
      {
        v15 = [MEMORY[0x263F82670] currentDevice];
        uint64_t v16 = [v15 userInterfaceIdiom];

        double v14 = 62.0;
        if ((v16 & 0xFFFFFFFFFFFFFFFBLL) == 0) {
          double v14 = 66.0;
        }
      }
      else
      {
        double v14 = 62.0;
      }
      double v5 = v10 * 0.666666667 + -20.0 - v14 + -13.0;
    }
  }
  else
  {
    double v11 = sharingXPCHelperLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      +[SFShareSheetRendering nameLabelSizeFromConfig:]();
    }
  }
  double v17 = 1.79769313e308;
  double v18 = v5;
  result.height = v17;
  result.width = v18;
  return result;
}

+ (double)platterMaxWidthFromConfig:(id)a3
{
  id v3 = a3;
  double v4 = v3;
  if (v3)
  {
    [v3 hostLayoutMargins];
    double v6 = v5;
    [v4 hostLayoutMargins];
    double v8 = v7;
    double v9 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v10 = [v9 userInterfaceIdiom];

    if ((v10 & 0xFFFFFFFFFFFFFFFBLL) != 0)
    {
      [v4 preferredWidth];
      double v12 = v11;
    }
    else
    {
      v15 = [MEMORY[0x263F82B60] mainScreen];
      [v15 _referenceBounds];
      double v12 = v16;
    }
    double v17 = v6 + v8;
    double v18 = (void *)MEMORY[0x263F81708];
    uint64_t v19 = *MEMORY[0x263F83570];
    v20 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F83570] addingSymbolicTraits:0x8000 options:0];
    v21 = [v18 fontWithDescriptor:v20 size:0.0];

    v22 = [v4 hostTraitCollection];
    v23 = [v22 preferredContentSizeCategory];

    [MEMORY[0x263F6BC80] imageWidthForContentSizeCategory:v23];
    double v25 = v24;
    if (UIContentSizeCategoryIsAccessibilityCategory(v23))
    {
      v26 = (void *)MEMORY[0x263F81720];
      v27 = [MEMORY[0x263F82DA0] traitCollectionWithPreferredContentSizeCategory:*MEMORY[0x263F83420]];
      v28 = [v26 preferredFontDescriptorWithTextStyle:v19 compatibleWithTraitCollection:v27];

      v29 = [v28 fontDescriptorWithSymbolicTraits:0x8000];

      uint64_t v30 = [MEMORY[0x263F81708] fontWithDescriptor:v29 size:0.0];

      v21 = (void *)v30;
    }
    [v21 lineHeight];
    double v14 = v12 + v17 * -2.0 - v31 - v25;
  }
  else
  {
    double v13 = sharingXPCHelperLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      +[SFShareSheetRendering hostNaturalTextAlignmentFromConfig:]();
    }

    double v14 = 4.0;
  }

  return v14;
}

+ (id)drawingCommandsForActionPlatterWithTitle:(id)a3 tintColor:(id)a4 hostConfig:(id)a5
{
  v44[3] = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  double v9 = (__CFString *)a3;
  +[SFShareSheetRendering platterMaxWidthFromConfig:v8];
  double v11 = v10;
  double v12 = (void *)MEMORY[0x263F81708];
  double v13 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F83570] addingSymbolicTraits:0x8000 options:0];
  double v14 = [v12 fontWithDescriptor:v13 size:0.0];

  if (v7)
  {
    id v15 = v7;
  }
  else
  {
    id v15 = [MEMORY[0x263F825C8] labelColor];
  }
  double v16 = v15;
  id v17 = objc_alloc_init(MEMORY[0x263F81650]);
  [v17 setLineBreakStrategy:0xFFFFLL];
  int64_t v18 = +[SFShareSheetRendering hostNaturalTextAlignmentFromConfig:v8];

  [v17 setAlignment:v18];
  uint64_t v19 = *MEMORY[0x263F814F0];
  v43[0] = *MEMORY[0x263F81500];
  v43[1] = v19;
  v44[0] = v16;
  v44[1] = v14;
  v43[2] = *MEMORY[0x263F81540];
  v20 = (void *)[v17 copy];
  v44[2] = v20;
  v21 = [NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:3];

  v22 = &stru_26CE72980;
  if (v9) {
    v22 = v9;
  }
  v23 = (objc_class *)MEMORY[0x263F086A0];
  double v24 = v22;
  double v25 = (void *)[[v23 alloc] initWithString:v24 attributes:v21];

  id v26 = objc_alloc_init(MEMORY[0x263F81668]);
  [v26 setWantsBaselineOffset:1];
  objc_msgSend(v25, "boundingRectWithSize:options:context:", 35, v26, v11, 1.79769313e308);
  double v28 = fmax(v27, 250.0);
  double v30 = fmax(v29, 22.0);
  double v31 = objc_opt_new();
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __87__SFShareSheetRendering_drawingCommandsForActionPlatterWithTitle_tintColor_hostConfig___block_invoke;
  v35[3] = &unk_2644723C8;
  uint64_t v38 = 0;
  uint64_t v39 = 0;
  double v40 = v28;
  double v41 = v30;
  uint64_t v42 = 35;
  id v36 = v25;
  id v37 = v26;
  id v32 = v26;
  id v33 = v25;
  [v31 setCommandBlock:v35];
  objc_msgSend(v31, "setContextSize:", v28, v30);

  return v31;
}

uint64_t __87__SFShareSheetRendering_drawingCommandsForActionPlatterWithTitle_tintColor_hostConfig___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawWithRect:options:context:", *(void *)(a1 + 80), *(void *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

+ (id)drawingCommandsForMoreListEntryTitle:(id)a3 labelColor:(id)a4 hostConfig:(id)a5 activityCategory:(int64_t)a6
{
  v42[3] = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  id v11 = a3;
  int64_t v12 = +[SFShareSheetRendering _hostIdiomFromConfig:v10];
  +[SFShareSheetRendering morePlatterMaxWidthFromConfig:v10 activityCategory:a6];
  double v14 = v13;
  id v15 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
  id v16 = objc_alloc_init(MEMORY[0x263F81650]);
  [v16 setLineBreakStrategy:0xFFFFLL];
  int64_t v17 = +[SFShareSheetRendering hostNaturalTextAlignmentFromConfig:v10];

  [v16 setAlignment:v17];
  if (v12 == 6)
  {
    [v16 setLineBreakMode:4];
    double v18 = 70.0;
  }
  else
  {
    double v18 = 100.0;
  }
  uint64_t v19 = *MEMORY[0x263F814F0];
  v41[0] = *MEMORY[0x263F81500];
  v41[1] = v19;
  v42[0] = v9;
  v42[1] = v15;
  v41[2] = *MEMORY[0x263F81540];
  v20 = (void *)[v16 copy];
  v42[2] = v20;
  v21 = [NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:3];

  v22 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v11 attributes:v21];
  id v23 = objc_alloc_init(MEMORY[0x263F81668]);
  [v23 setWantsBaselineOffset:1];
  objc_msgSend(v22, "boundingRectWithSize:options:context:", 35, v23, v14, 1.79769313e308);
  CGRect v45 = CGRectIntegral(v44);
  if (v18 >= v45.size.width) {
    double width = v18;
  }
  else {
    double width = v45.size.width;
  }
  double v25 = fmax(v45.size.height, 22.0);
  id v26 = objc_opt_new();
  uint64_t v30 = MEMORY[0x263EF8330];
  uint64_t v31 = 3221225472;
  id v32 = __101__SFShareSheetRendering_drawingCommandsForMoreListEntryTitle_labelColor_hostConfig_activityCategory___block_invoke;
  id v33 = &unk_2644723C8;
  uint64_t v36 = 0;
  uint64_t v37 = 0;
  double v38 = width;
  double v39 = v25;
  uint64_t v40 = 35;
  id v34 = v22;
  id v35 = v23;
  id v27 = v23;
  id v28 = v22;
  [v26 setCommandBlock:&v30];
  objc_msgSend(v26, "setContextSize:", width, v25, v30, v31, v32, v33);

  return v26;
}

uint64_t __101__SFShareSheetRendering_drawingCommandsForMoreListEntryTitle_labelColor_hostConfig_activityCategory___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawWithRect:options:context:", *(void *)(a1 + 80), *(void *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

+ (id)drawingCommandsForNameLabelWithString:(id)a3 textColor:(id)a4 maxNumberOfLines:(unint64_t)a5 isAirDrop:(BOOL)a6 ignoreNameWrapping:(BOOL)a7 hostConfig:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  v85[3] = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v63 = a4;
  id v14 = a8;
  +[SFShareSheetRendering nameLabelSizeFromConfig:v14];
  double v16 = v15;
  double v18 = v17;
  uint64_t v77 = 0;
  v78 = &v77;
  uint64_t v79 = 0x2020000000;
  char v80 = 0;
  uint64_t v19 = [v13 length];
  v76[0] = MEMORY[0x263EF8330];
  v76[1] = 3221225472;
  v76[2] = __130__SFShareSheetRendering_drawingCommandsForNameLabelWithString_textColor_maxNumberOfLines_isAirDrop_ignoreNameWrapping_hostConfig___block_invoke;
  v76[3] = &unk_264472A80;
  v76[5] = 0;
  v76[6] = v19;
  v76[4] = &v77;
  objc_msgSend(v13, "enumerateSubstringsInRange:options:usingBlock:", 0, v19, 3, v76);
  int v20 = (a5 == 1) & ~v10 & v9;
  if (*((unsigned char *)v78 + 24)) {
    int v21 = 1;
  }
  else {
    int v21 = (a5 == 1) & ~v10 & v9;
  }
  v66 = +[SFShareSheetRendering cappedOrthoLabelFontFromConfig:v14];
  id v22 = objc_alloc_init(MEMORY[0x263F81650]);
  id v23 = v22;
  if (v21) {
    uint64_t v24 = 4;
  }
  else {
    uint64_t v24 = 0;
  }
  [v22 setLineBreakMode:v24];
  [v23 setHyphenationFactor:0.0];
  [v23 setLineBreakStrategy:0xFFFFLL];
  if (+[SFShareSheetRendering isAXFromConfig:v14]) {
    int64_t v25 = +[SFShareSheetRendering hostNaturalTextAlignmentFromConfig:v14];
  }
  else {
    int64_t v25 = 1;
  }
  [v23 setAlignment:v25];
  uint64_t v26 = *MEMORY[0x263F814F0];
  v84[0] = *MEMORY[0x263F81500];
  v84[1] = v26;
  uint64_t v62 = v26;
  v85[0] = v63;
  v85[1] = v66;
  v84[2] = *MEMORY[0x263F81540];
  v85[2] = v23;
  v67 = [NSDictionary dictionaryWithObjects:v85 forKeys:v84 count:3];
  id v27 = sharingXPCHelperLog();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    *(void *)&buf[4] = a5;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v9;
    _os_log_impl(&dword_21DB23000, v27, OS_LOG_TYPE_DEFAULT, "maxLines %lu ignoreNameWrapping %lu", buf, 0x16u);
  }

  id v28 = objc_alloc_init(MEMORY[0x263F81668]);
  if (v21)
  {
    uint64_t v29 = 1;
  }
  else if (+[SFShareSheetRendering isAXFromConfig:v14])
  {
    uint64_t v29 = 3;
  }
  else
  {
    uint64_t v29 = 2;
  }
  [v28 setMaximumNumberOfLines:v29];
  uint64_t v30 = 35;
  if (v10) {
    uint64_t v30 = 3;
  }
  uint64_t v65 = v30;
  if (v20) {
    [v28 setMinimumScaleFactor:0.8];
  }
  uint64_t v31 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  v64 = [v13 componentsSeparatedByCharactersInSet:v31];

  if ([v64 count] == 2
    && !+[SFShareSheetRendering isAXFromConfig:v14]
    && !v9)
  {
    id v32 = [v64 firstObject];
    id v33 = [v64 lastObject];
    if ([v32 length])
    {
      if ([v33 length])
      {
        uint64_t v34 = [v32 length];
        if ((unint64_t)([v33 length] + v34) >= 8)
        {
          id v35 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v32 attributes:v67];
          objc_msgSend(v35, "boundingRectWithSize:options:context:", v65, v28, v16, v18);
          CGRect v88 = CGRectIntegral(v87);
          double height = v88.size.height;
          objc_msgSend(v66, "lineHeight", v88.origin.x, v88.origin.y, v88.size.width);
          *(float *)&double v37 = v37;
          int v38 = llroundf(*(float *)&v37);
          *(float *)&double v37 = height;
          if ((int)llroundf(*(float *)&v37) / v38 == 1)
          {
            uint64_t v39 = [NSString stringWithFormat:@"%@\n%@", v32, v33];

            id v13 = (id)v39;
          }
        }
      }
    }

    goto LABEL_32;
  }
  if (!+[SFShareSheetRendering isAXFromConfig:v14])
  {
    SFNonBreakingStringFromDeviceName();
    id v32 = v13;
    id v13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_32:
  }
  uint64_t v40 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v13 attributes:v67];
  objc_msgSend(v40, "boundingRectWithSize:options:context:", v65, v28, v16, v18);
  CGRect v90 = CGRectIntegral(v89);
  double width = v90.size.width;
  double v42 = v90.size.height;
  if (v20)
  {
    objc_msgSend(v28, "actualScaleFactor", v90.origin.x, v90.origin.y);
    if (v43 < 1.0)
    {
      uint64_t v81 = v62;
      CGRect v44 = (void *)MEMORY[0x263F81708];
      CGRect v45 = [v66 fontDescriptor];
      [v66 pointSize];
      double v47 = v46;
      [v28 actualScaleFactor];
      v49 = [v44 fontWithDescriptor:v45 size:v47 * v48];
      v82 = v49;
      v50 = [NSDictionary dictionaryWithObjects:&v82 forKeys:&v81 count:1];
      objc_msgSend(v40, "addAttributes:range:", v50, 0, objc_msgSend(v40, "length"));

      objc_msgSend(v40, "boundingRectWithSize:options:context:", v65, v28, v16, v18);
      CGRect v92 = CGRectIntegral(v91);
      double width = v92.size.width;
      double v42 = v92.size.height;
    }
  }
  if (v10)
  {
    v51 = (void *)[objc_alloc(MEMORY[0x263F816E8]) initWithString:v13 attributes:v67];
    id v52 = objc_alloc_init(MEMORY[0x263F81648]);
    [v52 setUsesFontLeading:1];
    id v53 = objc_alloc_init(MEMORY[0x263F81680]);
    [v53 setMaximumNumberOfLines:2];
    objc_msgSend(v53, "setSize:", v16, v42);
    [v52 addTextContainer:v53];
    [v51 addLayoutManager:v52];
    *(void *)buf = 0;
    *(void *)&buf[8] = 0;
    [v52 lineFragmentUsedRectForGlyphAtIndex:0 effectiveRange:buf];
    unint64_t v54 = [v13 length];
    if (v54 >= *(void *)&buf[8]) {
      unint64_t v55 = *(void *)&buf[8];
    }
    else {
      unint64_t v55 = v54;
    }
    v56 = objc_msgSend(v13, "substringWithRange:", 0, v55);

    [v23 setLineBreakMode:4];
    [v28 setMaximumNumberOfLines:1];
    v57 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v56 attributes:v67];

    objc_msgSend(v57, "boundingRectWithSize:options:context:", 3, v28, v16, v18);
    CGRect v94 = CGRectIntegral(v93);
    double width = v94.size.width;
    double v42 = v94.size.height;
  }
  else
  {
    v57 = v40;
    v56 = v13;
  }
  v58 = objc_opt_new();
  v68[0] = MEMORY[0x263EF8330];
  v68[1] = 3221225472;
  v68[2] = __130__SFShareSheetRendering_drawingCommandsForNameLabelWithString_textColor_maxNumberOfLines_isAirDrop_ignoreNameWrapping_hostConfig___block_invoke_171;
  v68[3] = &unk_2644723C8;
  id v59 = v57;
  uint64_t v71 = 0;
  uint64_t v72 = 0;
  id v69 = v59;
  double v73 = width;
  double v74 = v42;
  uint64_t v75 = v65;
  id v60 = v28;
  id v70 = v60;
  [v58 setCommandBlock:v68];
  objc_msgSend(v58, "setContextSize:", width, v42);

  _Block_object_dispose(&v77, 8);
  return v58;
}

void *__130__SFShareSheetRendering_drawingCommandsForNameLabelWithString_textColor_maxNumberOfLines_isAirDrop_ignoreNameWrapping_hostConfig___block_invoke(void *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  if (result[5] == a3 && result[6] == a4) {
    *(unsigned char *)(*(void *)(result[4] + 8) + 24) = 1;
  }
  *a7 = 1;
  return result;
}

uint64_t __130__SFShareSheetRendering_drawingCommandsForNameLabelWithString_textColor_maxNumberOfLines_isAirDrop_ignoreNameWrapping_hostConfig___block_invoke_171(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawWithRect:options:context:", *(void *)(a1 + 80), *(void *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

+ (id)_nearbyBadgeFontForIdiom:(int64_t)a3
{
  if (a3 == 6)
  {
    id v3 = [MEMORY[0x263F81708] systemFontOfSize:11.0 weight:*MEMORY[0x263F81840]];
  }
  else
  {
    double v4 = [MEMORY[0x263F81720] defaultFontDescriptorWithTextStyle:*MEMORY[0x263F83580] addingSymbolicTraits:0 options:1];
    id v3 = [MEMORY[0x263F81708] fontWithDescriptor:v4 size:0.0];
  }
  return v3;
}

+ (double)_nearbyBadgeNumberStringTopInsetForIdiom:(int64_t)a3
{
  double result = 17.0;
  if (a3 == 6) {
    return 13.0;
  }
  return result;
}

+ (id)drawingCommandsForNearbyBadgeWithCount:(int64_t)a3 hostConfig:(id)a4
{
  v36[3] = *MEMORY[0x263EF8340];
  id v6 = a4;
  int64_t v7 = +[SFShareSheetRendering _hostIdiomFromConfig:v6];
  +[SFUIShareSheetActivityCellSpec nearbyAirDropBadgeSizeForIdiom:v7];
  double v9 = v8;
  id v10 = objc_alloc_init(MEMORY[0x263F81650]);
  [v10 setAlignment:1];
  [v10 setLineBreakStrategy:0xFFFFLL];
  v35[0] = *MEMORY[0x263F81500];
  id v11 = [MEMORY[0x263F825C8] whiteColor];
  v36[0] = v11;
  v35[1] = *MEMORY[0x263F814F0];
  int64_t v12 = [a1 _nearbyBadgeFontForIdiom:v7];
  v36[1] = v12;
  v35[2] = *MEMORY[0x263F81540];
  id v13 = (void *)[v10 copy];
  v36[2] = v13;
  id v14 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:3];

  id v15 = objc_alloc(MEMORY[0x263F086A0]);
  double v16 = +[SFShareSheetRendering badgeNumberFormatterFromConfig:v6];

  double v17 = [NSNumber numberWithInteger:a3];
  double v18 = [v16 stringFromNumber:v17];
  uint64_t v19 = (void *)[v15 initWithString:v18 attributes:v14];

  id v20 = objc_alloc_init(MEMORY[0x263F81668]);
  [v20 setMaximumNumberOfLines:1];
  int v21 = objc_opt_new();
  uint64_t v25 = MEMORY[0x263EF8330];
  uint64_t v26 = 3221225472;
  id v27 = __75__SFShareSheetRendering_drawingCommandsForNearbyBadgeWithCount_hostConfig___block_invoke;
  id v28 = &unk_264472AA8;
  id v31 = a1;
  int64_t v32 = v7;
  double v33 = v9;
  uint64_t v34 = 35;
  id v29 = v19;
  id v30 = v20;
  id v22 = v20;
  id v23 = v19;
  [v21 setCommandBlock:&v25];
  objc_msgSend(v21, "setContextSize:", v9, v9, v25, v26, v27, v28);

  return v21;
}

uint64_t __75__SFShareSheetRendering_drawingCommandsForNearbyBadgeWithCount_hostConfig___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  [*(id *)(a1 + 48) _nearbyBadgeNumberStringTopInsetForIdiom:*(void *)(a1 + 56)];
  double v4 = *(double *)(a1 + 64);
  uint64_t v5 = *(void *)(a1 + 72);
  uint64_t v6 = *(void *)(a1 + 40);
  return objc_msgSend(v2, "drawWithRect:options:context:", v5, v6, 0.0, v3, v4, v4);
}

+ (id)drawingCommandsForUIActivityTitle:(id)a3 foregroundColor:(id)a4 hostConfig:(id)a5
{
  v48[3] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  +[SFShareSheetRendering nameLabelSizeFromConfig:v9];
  double v11 = v10;
  double v13 = v12;
  uint64_t v43 = 0;
  CGRect v44 = &v43;
  uint64_t v45 = 0x2020000000;
  char v46 = 0;
  id v14 = v7;
  uint64_t v15 = [v14 length];
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __86__SFShareSheetRendering_drawingCommandsForUIActivityTitle_foregroundColor_hostConfig___block_invoke;
  v42[3] = &unk_264472A80;
  v42[5] = 0;
  v42[6] = v15;
  void v42[4] = &v43;
  objc_msgSend(v14, "enumerateSubstringsInRange:options:usingBlock:", 0, v15, 3, v42);
  double v16 = +[SFShareSheetRendering cappedOrthoLabelFontFromConfig:v9];
  id v17 = objc_alloc_init(MEMORY[0x263F81650]);
  [v17 setLineBreakMode:4 * *((unsigned __int8 *)v44 + 24)];
  [v17 setHyphenationFactor:0.0];
  [v17 setLineBreakStrategy:0xFFFFLL];
  if (+[SFShareSheetRendering isAXFromConfig:v9]) {
    int64_t v18 = +[SFShareSheetRendering hostNaturalTextAlignmentFromConfig:v9];
  }
  else {
    int64_t v18 = 1;
  }
  [v17 setAlignment:v18];
  uint64_t v19 = *MEMORY[0x263F814F0];
  v47[0] = *MEMORY[0x263F81500];
  v47[1] = v19;
  v48[0] = v8;
  v48[1] = v16;
  v47[2] = *MEMORY[0x263F81540];
  id v20 = (void *)[v17 copy];
  v48[2] = v20;
  int v21 = [NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:3];

  id v22 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v14 attributes:v21];
  id v23 = objc_alloc_init(MEMORY[0x263F81668]);
  if (*((unsigned char *)v44 + 24))
  {
    uint64_t v24 = 1;
  }
  else if (+[SFShareSheetRendering isAXFromConfig:v9])
  {
    uint64_t v24 = 3;
  }
  else
  {
    uint64_t v24 = 2;
  }
  [v23 setMaximumNumberOfLines:v24];
  objc_msgSend(v22, "boundingRectWithSize:options:context:", 35, v23, v11, v13);
  CGRect v51 = CGRectIntegral(v50);
  double width = v51.size.width;
  double height = v51.size.height;
  id v27 = objc_opt_new();
  uint64_t v31 = MEMORY[0x263EF8330];
  uint64_t v32 = 3221225472;
  double v33 = __86__SFShareSheetRendering_drawingCommandsForUIActivityTitle_foregroundColor_hostConfig___block_invoke_2;
  uint64_t v34 = &unk_2644723C8;
  id v28 = v22;
  uint64_t v37 = 0;
  uint64_t v38 = 0;
  id v35 = v28;
  double v39 = width;
  double v40 = height;
  uint64_t v41 = 35;
  id v29 = v23;
  id v36 = v29;
  [v27 setCommandBlock:&v31];
  objc_msgSend(v27, "setContextSize:", width, height, v31, v32, v33, v34);

  _Block_object_dispose(&v43, 8);
  return v27;
}

void *__86__SFShareSheetRendering_drawingCommandsForUIActivityTitle_foregroundColor_hostConfig___block_invoke(void *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  if (result[5] == a3 && result[6] == a4) {
    *(unsigned char *)(*(void *)(result[4] + 8) + 24) = 1;
  }
  *a7 = 1;
  return result;
}

uint64_t __86__SFShareSheetRendering_drawingCommandsForUIActivityTitle_foregroundColor_hostConfig___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawWithRect:options:context:", *(void *)(a1 + 80), *(void *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

+ (void)badgeNumberFormatterFromConfig:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_21DB23000, v0, v1, "No _uiConfig for badgeNumberFormatter", v2, v3, v4, v5, v6);
}

+ (void)cappedOrthoLabelFontFromConfig:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_21DB23000, v0, v1, "No _uiConfig for cappedOrthoLabelFont", v2, v3, v4, v5, v6);
}

+ (void)hostNaturalTextAlignmentFromConfig:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_21DB23000, v0, v1, "No _uiConfig for hostNaturalTextAlignment", v2, v3, v4, v5, v6);
}

+ (void)isAXFromConfig:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_21DB23000, v0, v1, "No _uiConfig for actionsAX", v2, v3, v4, v5, v6);
}

+ (void)nameLabelSizeFromConfig:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_21DB23000, v0, v1, "No _uiConfig for nameLabelSize", v2, v3, v4, v5, v6);
}

@end