@interface SXTextResizer
- (double)preferredFontSizeForUsage:(void *)a3 contentSizeCategoryName:(uint64_t)a4 fontSize:;
- (id)initWithColumnLayout:(void *)a3 defaultTextStyle:(char)a4 fontScalingEnabled:;
- (uint64_t)resizeDropCapNumberOfLines:(uint64_t)result;
- (uint64_t)resizeTextSize:(void *)a3 fontResizingThreshold:(void *)a4 fontSizeConstant:(double)a5 contentSizeCategory:(double)a6 fontTextStyle:;
@end

@implementation SXTextResizer

- (id)initWithColumnLayout:(void *)a3 defaultTextStyle:(char)a4 fontScalingEnabled:
{
  id v8 = a2;
  id v9 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)SXTextResizer;
    v10 = (id *)objc_msgSendSuper2(&v12, sel_init);
    a1 = v10;
    if (v10)
    {
      objc_storeStrong(v10 + 2, a2);
      objc_storeStrong(a1 + 3, a3);
      *((unsigned char *)a1 + 8) = a4;
    }
  }

  return a1;
}

- (uint64_t)resizeTextSize:(void *)a3 fontResizingThreshold:(void *)a4 fontSizeConstant:(double)a5 contentSizeCategory:(double)a6 fontTextStyle:
{
  id v11 = a3;
  id v12 = a4;
  if (a1)
  {
    id v13 = *(id *)(a1 + 24);
    if (v13)
    {
      id v14 = *(id *)(a1 + 24);
      if ([v14 fontSize] == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v15 = 18;
      }
      else {
        uint64_t v15 = [*(id *)(a1 + 24) fontSize];
      }
    }
    else
    {
      uint64_t v15 = 18;
    }

    v16 = +[SXComponentClassification classificationForComponentWithRole:3];
    if (*(unsigned char *)(a1 + 8))
    {
      double v17 = (double)a2;
      if ((double)v15 * a5 < (double)a2)
      {
        id v18 = *(id *)(a1 + 16);
        [v18 constrainedViewportSize];
        double v20 = v19 / (double)[*(id *)(a1 + 16) layoutWidth];

        float v21 = (a6 + v20 * (1.0 - a6)) * v17;
        uint64_t v22 = llroundf(v21);
        double v23 = 0.0;
        if (a5 > 1.0)
        {
          v24 = [v16 textRules];
          [v24 fontResizingTresholdFactor];
          double v26 = v25;
          v27 = [v16 textRules];
          [v27 fontSizeConstant];
          double v29 = v28;
          v30 = [v16 textRules];
          v31 = [v30 fontTextStyle];
          double v23 = (double)-[SXTextResizer resizeTextSize:fontResizingThreshold:fontSizeConstant:contentSizeCategory:fontTextStyle:](a1, v15, v11, v31, v26, v29);
        }
        double v32 = v23 * a5;
        if (v23 * a5 <= (double)v22) {
          double v32 = (double)v22;
        }
        a2 = (uint64_t)v32;
      }
    }
    double v33 = -[SXTextResizer preferredFontSizeForUsage:contentSizeCategoryName:fontSize:](a1, v12, v11, a2);
    if (a5 > 1.0 && *(unsigned char *)(a1 + 8))
    {
      v34 = [v16 textRules];
      [v34 fontResizingTresholdFactor];
      double v36 = v35;
      v37 = [v16 textRules];
      [v37 fontSizeConstant];
      double v39 = v38;
      v40 = [v16 textRules];
      v41 = [v40 fontTextStyle];
      double v42 = (double)-[SXTextResizer resizeTextSize:fontResizingThreshold:fontSizeConstant:contentSizeCategory:fontTextStyle:](a1, v15, v11, v41, v36, v39);

      if (v42 * a5 >= v33) {
        double v43 = v33;
      }
      else {
        double v43 = v42 * a5;
      }
      uint64_t v44 = (uint64_t)v43;
      if (v42 * a5 <= (double)a2) {
        uint64_t v44 = a2;
      }
    }
    else
    {
      uint64_t v44 = (uint64_t)v33;
    }
    double v45 = (double)v44;
    [*(id *)(a1 + 16) contentScaleFactor];
    a1 = (uint64_t)(v46 * v45);
  }
  return a1;
}

- (double)preferredFontSizeForUsage:(void *)a3 contentSizeCategoryName:(uint64_t)a4 fontSize:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = v8;
  if (a1)
  {
    double v10 = (double)a4;
    if (UIContentSizeCategoryCompareToCategory(v8, (UIContentSizeCategory)*MEMORY[0x263F1D180]))
    {
      double v17 = (double)a4;
      CTFontDescriptorGetTextStyleSize();
      if (preferredFontSizeForUsage_contentSizeCategoryName_fontSize__onceToken != -1) {
        dispatch_once(&preferredFontSizeForUsage_contentSizeCategoryName_fontSize__onceToken, &__block_literal_global_48);
      }
      id v11 = [(id)preferredFontSizeForUsage_contentSizeCategoryName_fontSize____textStyleBodyLeadingCache objectForKey:v7];
      id v12 = v11;
      if (v11)
      {
        [v11 doubleValue];
      }
      else
      {
        CTFontDescriptorGetTextStyleSize();
        id v14 = (void *)preferredFontSizeForUsage_contentSizeCategoryName_fontSize____textStyleBodyLeadingCache;
        uint64_t v15 = [NSNumber numberWithDouble:0.0];
        [v14 setObject:v15 forKey:v7];

        double v13 = 0.0;
      }
      if (v13 > 0.0) {
        double v10 = v17 / v13 * v10;
      }
    }
  }
  else
  {
    double v10 = 0.0;
  }

  return v10;
}

uint64_t __76__SXTextResizer_preferredFontSizeForUsage_contentSizeCategoryName_fontSize___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F1CC20]);
  uint64_t v1 = preferredFontSizeForUsage_contentSizeCategoryName_fontSize____textStyleBodyLeadingCache;
  preferredFontSizeForUsage_contentSizeCategoryName_fontSize____textStyleBodyLeadingCache = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (uint64_t)resizeDropCapNumberOfLines:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    id v4 = *(id *)(result + 16);
    [v4 constrainedViewportSize];
    double v6 = v5 / (double)[*(id *)(v3 + 16) layoutWidth];

    uint64_t v7 = llround((v6 * 0.581 + 0.419) * (double)a2);
    if (v7 >= 10) {
      uint64_t v7 = 10;
    }
    if (v7 <= 2) {
      return 2;
    }
    else {
      return v7;
    }
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultTextStyle, 0);
  objc_storeStrong((id *)&self->_columnLayout, 0);
}

@end