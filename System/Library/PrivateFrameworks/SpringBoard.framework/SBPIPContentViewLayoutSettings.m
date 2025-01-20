@interface SBPIPContentViewLayoutSettings
+ (id)pipDefaults;
- (CGSize)_contentViewSizeForAspectRatio:(CGSize)a3 currentSize:(double)a4;
- (CGSize)_maximumContentViewSizeForAspectRatio:(CGSize)a3 maximumReferenceSize:(double)a4;
- (CGSize)_minimumContentViewSizeForAspectRatio:(CGSize)a3 minimumReferenceSize:(double)a4;
- (CGSize)currentContentViewSizeForAspectRatio:(CGSize)a3;
- (CGSize)defaultContentViewSizeForAspectRatio:(CGSize)a3;
- (CGSize)maximumPossibleContentViewSizeForAspectRatio:(CGSize)a3;
- (CGSize)maximumPreferredContentViewSizeForAspectRatio:(CGSize)a3;
- (CGSize)minimumPossibleContentViewSizeForAspectRatio:(CGSize)a3;
- (CGSize)minimumPreferredContentViewSizeForAspectRatio:(CGSize)a3;
- (CGSize)minimumStashedTabSize;
- (SBPIPContentViewLayoutSettings)initWithPlatformMetrics:(id)a3 contentSize:(CGSize)a4;
- (double)contentViewPadding;
- (double)contentViewPaddingWhileStashed;
- (double)defaultCornerRadius;
- (id)platformMetrics;
- (unint64_t)currentContentViewPosition;
- (void)setContentViewPosition:(unint64_t)a3;
- (void)setContentViewSize:(CGSize)a3;
- (void)setMaximumSizeSpanForPreferredSizeTuning:(double)a3;
- (void)setMinimumSizeSpanBetweenPreferredSizes:(double)a3;
- (void)updatePlatformMetrics:(id)a3;
@end

@implementation SBPIPContentViewLayoutSettings

+ (id)pipDefaults
{
  if (pipDefaults_sOnceToken != -1) {
    dispatch_once(&pipDefaults_sOnceToken, &__block_literal_global_351);
  }
  v2 = (void *)pipDefaults_sPIPDefaults;
  return v2;
}

void __45__SBPIPContentViewLayoutSettings_pipDefaults__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4FA60C8]);
  v1 = (void *)pipDefaults_sPIPDefaults;
  pipDefaults_sPIPDefaults = (uint64_t)v0;
}

- (SBPIPContentViewLayoutSettings)initWithPlatformMetrics:(id)a3 contentSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SBPIPContentViewLayoutSettings;
  v9 = [(SBPIPContentViewLayoutSettings *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_platformMetrics, a3);
    uint64_t v11 = +[SBPIPContentViewLayoutSettings pipDefaults];
    pipDefaults = v10->_pipDefaults;
    v10->_pipDefaults = (SBPIPDefaults *)v11;

    v13 = -[SBPIPContentViewLayoutContext initWithPlatformMetrics:contentSize:defaults:]([SBPIPContentViewLayoutContext alloc], "initWithPlatformMetrics:contentSize:defaults:", v8, v10->_pipDefaults, width, height);
    context = v10->_context;
    v10->_context = v13;
  }
  return v10;
}

- (id)platformMetrics
{
  return self->_platformMetrics;
}

- (void)updatePlatformMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_platformMetrics, a3);
  id v5 = a3;
  [(SBPIPContentViewLayoutContext *)self->_context updatePlatformMetrics:v5];
}

- (void)setContentViewSize:(CGSize)a3
{
  double height = a3.height;
  if (a3.width >= a3.height) {
    double width = a3.width;
  }
  else {
    double width = a3.height;
  }
  if (a3.width == 0.0) {
    double v6 = 1.0;
  }
  else {
    double v6 = a3.width;
  }
  [(SBPIPContentViewLayoutContext *)self->_context currentSize];
  if (v7 != width)
  {
    double v8 = height / v6;
    v9 = [(SBPIPContentViewLayoutMetrics *)self->_platformMetrics sizePolicy];
    id v40 = [v9 sizePreferencesForAspectRatio:v8];

    [v40 longSideDefaultSize];
    double v39 = v10;
    [v40 longSideMinimumSize];
    double v12 = v11;
    [v40 longSideMaximumSize];
    double v14 = v13;
    double v15 = v13 - v12;
    [(SBPIPContentViewLayoutContext *)self->_context minimumSizeSpanBetweenPreferredSizes];
    double v17 = v16;
    [(SBPIPContentViewLayoutContext *)self->_context maximumSizeSpanForPreferredSizeTuning];
    double v19 = v18;
    [(SBPIPContentViewLayoutContext *)self->_context currentSize];
    double v21 = v20;
    [(SBPIPContentViewLayoutContext *)self->_context maximumSizePreference];
    double v23 = v22;
    [(SBPIPContentViewLayoutContext *)self->_context minimumSizePreference];
    double v25 = (width - v24) / v15;
    BOOL v26 = v25 < v19;
    if (v25 >= v19) {
      double v27 = width;
    }
    else {
      double v27 = v23;
    }
    if (v26) {
      double v28 = width;
    }
    else {
      double v28 = v24;
    }
    double v29 = (v23 - width) / v15;
    BOOL v30 = v29 < v19;
    if (v29 >= v19) {
      double v31 = v23;
    }
    else {
      double v31 = width;
    }
    if (v30) {
      double v32 = v24;
    }
    else {
      double v32 = width;
    }
    if (width < v21)
    {
      double v27 = v31;
      double v28 = v32;
    }
    if (v27 > v28 && vabdd_f64(v27, v28) / v15 >= v17)
    {
      double v23 = v27;
      double v27 = v28;
    }
    if (v27 >= v23 || vabdd_f64(v23, v27) / v15 < v17)
    {
      double v23 = v27;
      double v27 = v24;
    }
    [(SBPIPContentViewLayoutContext *)self->_context setMinimumSizePreference:v27];
    [(SBPIPContentViewLayoutContext *)self->_context setMaximumSizePreference:v23];
    [(SBPIPContentViewLayoutContext *)self->_context maximumSizePreference];
    double v34 = v33;
    [(SBPIPContentViewLayoutContext *)self->_context minimumSizePreference];
    if (vabdd_f64(v34, v35) / v15 < v17) {
      [(SBPIPContentViewLayoutContext *)self->_context setMaximumSizePreference:v14];
    }
    [(SBPIPContentViewLayoutContext *)self->_context maximumSizePreference];
    double v37 = v36;
    [(SBPIPContentViewLayoutContext *)self->_context minimumSizePreference];
    if (vabdd_f64(v37, v38) / v15 < v17) {
      [(SBPIPContentViewLayoutContext *)self->_context setMinimumSizePreference:v39];
    }
    [(SBPIPContentViewLayoutContext *)self->_context setCurrentSize:width forAspectRatio:v8];
  }
}

- (void)setMinimumSizeSpanBetweenPreferredSizes:(double)a3
{
}

- (void)setMaximumSizeSpanForPreferredSizeTuning:(double)a3
{
}

- (CGSize)defaultContentViewSizeForAspectRatio:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = +[SBPIPSettingsDomain rootSettings];
  double v7 = [v6 interactionSettings];
  int v8 = [v7 alwaysStartAtSmallestSize];

  if (v8)
  {
    -[SBPIPContentViewLayoutSettings minimumPossibleContentViewSizeForAspectRatio:](self, "minimumPossibleContentViewSizeForAspectRatio:", width, height);
  }
  else
  {
    int v11 = [(SBPIPDefaults *)self->_pipDefaults initiallyUsesMinimumPreferredContentSize];
    context = self->_context;
    if (v11) {
      [(SBPIPContentViewLayoutContext *)context minimumSizePreference];
    }
    else {
      [(SBPIPContentViewLayoutContext *)context currentSize];
    }
    -[SBPIPContentViewLayoutSettings _contentViewSizeForAspectRatio:currentSize:](self, "_contentViewSizeForAspectRatio:currentSize:", width, height, v13);
  }
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (CGSize)_contentViewSizeForAspectRatio:(CGSize)a3 currentSize:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  -[SBPIPContentViewLayoutSettings minimumPossibleContentViewSizeForAspectRatio:](self, "minimumPossibleContentViewSizeForAspectRatio:");
  double v9 = v8;
  double v11 = v10;
  -[SBPIPContentViewLayoutSettings maximumPossibleContentViewSizeForAspectRatio:](self, "maximumPossibleContentViewSizeForAspectRatio:", width, height);
  if (width == 0.0 || height == 0.0)
  {
    double v22 = a4;
  }
  else
  {
    double v14 = v12;
    double v15 = v13;
    UIRoundToScale();
    double v17 = v16;
    UIRoundToScale();
    BOOL v19 = v18 < v11;
    if (v17 < v9) {
      BOOL v19 = 1;
    }
    if (v19)
    {
      double v18 = v11;
      double v20 = v9;
    }
    else
    {
      double v20 = v17;
    }
    BOOL v21 = v18 > v15;
    if (v20 > v14) {
      BOOL v21 = 1;
    }
    if (v21) {
      double v22 = v15;
    }
    else {
      double v22 = v18;
    }
    if (v21) {
      a4 = v14;
    }
    else {
      a4 = v20;
    }
  }
  double v23 = a4;
  result.double height = v22;
  result.double width = v23;
  return result;
}

- (CGSize)currentContentViewSizeForAspectRatio:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(SBPIPContentViewLayoutContext *)self->_context currentSize];
  -[SBPIPContentViewLayoutSettings _contentViewSizeForAspectRatio:currentSize:](self, "_contentViewSizeForAspectRatio:currentSize:", width, height, v6);
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (CGSize)minimumPossibleContentViewSizeForAspectRatio:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = [(SBPIPContentViewLayoutMetrics *)self->_platformMetrics sizePolicy];
  double v7 = v6;
  double v8 = 1.0;
  if (width != 0.0) {
    double v8 = width;
  }
  double v9 = [v6 sizePreferencesForAspectRatio:height / v8];

  [v9 longSideMinimumSize];
  -[SBPIPContentViewLayoutSettings _minimumContentViewSizeForAspectRatio:minimumReferenceSize:](self, "_minimumContentViewSizeForAspectRatio:minimumReferenceSize:", width, height, v10);
  double v12 = v11;
  double v14 = v13;

  double v15 = v12;
  double v16 = v14;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (CGSize)maximumPossibleContentViewSizeForAspectRatio:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = [(SBPIPContentViewLayoutMetrics *)self->_platformMetrics sizePolicy];
  double v7 = v6;
  double v8 = 1.0;
  if (width != 0.0) {
    double v8 = width;
  }
  double v9 = [v6 sizePreferencesForAspectRatio:height / v8];

  [v9 longSideMaximumSize];
  -[SBPIPContentViewLayoutSettings _maximumContentViewSizeForAspectRatio:maximumReferenceSize:](self, "_maximumContentViewSizeForAspectRatio:maximumReferenceSize:", width, height, v10);
  double v12 = v11;
  double v14 = v13;

  double v15 = v12;
  double v16 = v14;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (CGSize)minimumPreferredContentViewSizeForAspectRatio:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(SBPIPContentViewLayoutContext *)self->_context minimumSizePreference];
  -[SBPIPContentViewLayoutSettings _minimumContentViewSizeForAspectRatio:minimumReferenceSize:](self, "_minimumContentViewSizeForAspectRatio:minimumReferenceSize:", width, height, v6);
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (CGSize)maximumPreferredContentViewSizeForAspectRatio:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(SBPIPContentViewLayoutContext *)self->_context maximumSizePreference];
  -[SBPIPContentViewLayoutSettings _maximumContentViewSizeForAspectRatio:maximumReferenceSize:](self, "_maximumContentViewSizeForAspectRatio:maximumReferenceSize:", width, height, v6);
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (CGSize)_minimumContentViewSizeForAspectRatio:(CGSize)a3 minimumReferenceSize:(double)a4
{
  double v4 = a4;
  if (a3.width == 0.0 || (double height = a3.height, a3.height == 0.0))
  {
    double v10 = a4;
  }
  else
  {
    double width = a3.width;
    UIRoundToScale();
    double v4 = v8;
    UIRoundToScale();
    double v10 = v9;
    double v11 = [(SBPIPContentViewLayoutMetrics *)self->_platformMetrics sizePolicy];
    double v12 = [v11 sizePreferencesForAspectRatio:height / width];

    [v12 shortSideMinimumSize];
    double v14 = v13;
    if (v4 >= v10)
    {
      if (v10 < v13)
      {
        UIRoundToScale();
        double v4 = v16;
        double v10 = v14;
      }
    }
    else if (v4 < v13)
    {
      UIRoundToScale();
      double v10 = v15;
      double v4 = v14;
    }
  }
  double v17 = v4;
  double v18 = v10;
  result.double height = v18;
  result.double width = v17;
  return result;
}

- (CGSize)_maximumContentViewSizeForAspectRatio:(CGSize)a3 maximumReferenceSize:(double)a4
{
  double v4 = a4;
  if (a3.width == 0.0 || a3.height == 0.0)
  {
    double v7 = a4;
  }
  else
  {
    UIRoundToScale();
    double v4 = v5;
    UIRoundToScale();
    double v7 = v6;
  }
  double v8 = v4;
  result.double height = v7;
  result.double width = v8;
  return result;
}

- (CGSize)minimumStashedTabSize
{
  [(SBPIPContentViewLayoutMetrics *)self->_platformMetrics minimumStashedTabSize];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)setContentViewPosition:(unint64_t)a3
{
  pipDefaults = self->_pipDefaults;
  id v5 = [(SBPIPContentViewLayoutMetrics *)self->_platformMetrics contentTypeIdentifier];
  [(SBPIPDefaults *)pipDefaults setLastKnownCornerPosition:a3 contentType:v5];
}

- (unint64_t)currentContentViewPosition
{
  pipDefaults = self->_pipDefaults;
  double v4 = [(SBPIPContentViewLayoutMetrics *)self->_platformMetrics contentTypeIdentifier];
  unint64_t v5 = [(SBPIPDefaults *)pipDefaults lastKnownCornerPositionForContentType:v4];

  if (![(SBPIPContentViewLayoutMetrics *)self->_platformMetrics prefersDefaultPosition]) {
    return v5;
  }
  platformMetrics = self->_platformMetrics;
  return [(SBPIPContentViewLayoutMetrics *)platformMetrics defaultPosition];
}

- (double)contentViewPadding
{
  [(SBPIPContentViewLayoutMetrics *)self->_platformMetrics padding];
  return result;
}

- (double)contentViewPaddingWhileStashed
{
  [(SBPIPContentViewLayoutMetrics *)self->_platformMetrics paddingWhileStashed];
  return result;
}

- (double)defaultCornerRadius
{
  [(SBPIPContentViewLayoutMetrics *)self->_platformMetrics defaultCornerRadius];
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipDefaults, 0);
  objc_storeStrong((id *)&self->_platformMetrics, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end