@interface SUViewControllerScriptProperties
+ (BOOL)supportsSecureCoding;
- (BOOL)alwaysDispatchesScrollEvents;
- (BOOL)flashesScrollIndicators;
- (BOOL)inputViewObeysDOMFocus;
- (BOOL)isDoubleTapEnabled;
- (BOOL)isEmbedded;
- (BOOL)isScrollingDisabled;
- (BOOL)shouldLoadProgressively;
- (BOOL)shouldShowFormAccessory;
- (BOOL)showsBackgroundShadow;
- (BOOL)showsHorizontalScrollIndicator;
- (BOOL)showsVerticalScrollIndicator;
- (BOOL)usesBlurredBackground;
- (NSDictionary)contextDictionary;
- (SUGradient)placeholderBackgroundGradient;
- (SUViewControllerScriptProperties)initWithCoder:(id)a3;
- (UIColor)backgroundColor;
- (UIColor)loadingTextColor;
- (UIColor)loadingTextShadowColor;
- (UIColor)topExtensionColor;
- (UIEdgeInsets)scrollContentInsets;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)loadingIndicatorStyle;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAlwaysDispatchesScrollEvents:(BOOL)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setContextDictionary:(id)a3;
- (void)setDoubleTapEnabled:(BOOL)a3;
- (void)setEmbedded:(BOOL)a3;
- (void)setFlashesScrollIndicators:(BOOL)a3;
- (void)setInputViewObeysDOMFocus:(BOOL)a3;
- (void)setLoadingIndicatorStyle:(int64_t)a3;
- (void)setLoadingTextColor:(id)a3;
- (void)setLoadingTextShadowColor:(id)a3;
- (void)setPlaceholderBackgroundGradient:(id)a3;
- (void)setScrollContentInsets:(UIEdgeInsets)a3;
- (void)setScrollingDisabled:(BOOL)a3;
- (void)setShouldLoadProgressively:(BOOL)a3;
- (void)setShouldShowFormAccessory:(BOOL)a3;
- (void)setShowsBackgroundShadow:(BOOL)a3;
- (void)setShowsHorizontalScrollIndicator:(BOOL)a3;
- (void)setShowsVerticalScrollIndicator:(BOOL)a3;
- (void)setTopExtensionColor:(id)a3;
- (void)setUsesBlurredBackground:(BOOL)a3;
@end

@implementation SUViewControllerScriptProperties

- (SUViewControllerScriptProperties)initWithCoder:(id)a3
{
  v17[5] = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)SUViewControllerScriptProperties;
  v4 = [(SUViewControllerScriptProperties *)&v16 init];
  if (v4)
  {
    if ([a3 containsValueForKey:@"alwaysDispatchesScroll"])
    {
      char v5 = [a3 decodeBoolForKey:@"alwaysDispatchesScroll"];
    }
    else
    {
      v6 = (void *)[MEMORY[0x263F89540] sharedCache];
      v7 = objc_msgSend((id)objc_msgSend(v6, "URLBagForContext:", objc_msgSend(MEMORY[0x263F7B358], "contextWithBagType:", 0)), "valueForKey:", @"p2-client-options");
      objc_opt_class();
      v8 = 0;
      if (objc_opt_isKindOfClass()) {
        v8 = (void *)[v7 objectForKey:@"always-dispatch-scroll-events"];
      }
      if (objc_opt_respondsToSelector()) {
        char v5 = [v8 BOOLValue];
      }
      else {
        char v5 = (objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) != 1;
      }
    }
    v4->_alwaysDispatchesScrollEvents = v5;
    v9 = (void *)MEMORY[0x263EFFA08];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    v17[2] = objc_opt_class();
    v17[3] = objc_opt_class();
    v17[4] = objc_opt_class();
    uint64_t v10 = objc_msgSend(v9, "setWithArray:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v17, 5));
    v4->_backgroundColor = (UIColor *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"bgcolor"];
    v4->_contextDictionary = (NSDictionary *)(id)[a3 decodeObjectOfClasses:v10 forKey:@"ctxdict"];
    v4->_doubleTapEnabled = [a3 decodeBoolForKey:@"doubletap"];
    v4->_embedded = [a3 decodeBoolForKey:@"embedded"];
    v4->_flashesScrollIndicators = [a3 decodeBoolForKey:@"flashscrollers"];
    v4->_inputViewObeysDOMFocus = [a3 decodeBoolForKey:@"inputViewObeysDOMFocus"];
    v4->_loadingIndicatorStyle = [a3 decodeIntegerForKey:@"activitystyle"];
    v4->_loadingTextColor = (UIColor *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"loadtextcolor"];
    v4->_loadingTextShadowColor = (UIColor *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"loadtextscolor"];
    v4->_placeholderBackgroundGradient = (SUGradient *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"placeholdergradient"];
    [a3 decodeUIEdgeInsetsForKey:@"scrollinsets"];
    v4->_scrollContentInsets.top = v11;
    v4->_scrollContentInsets.left = v12;
    v4->_scrollContentInsets.bottom = v13;
    v4->_scrollContentInsets.right = v14;
    v4->_scrollingDisabled = [a3 decodeBoolForKey:@"scrollingdisabled"];
    v4->_shouldLoadProgressively = [a3 decodeBoolForKey:@"loadprogressively"];
    v4->_shouldShowFormAccessory = [a3 decodeBoolForKey:@"formaccessory"];
    v4->_showsBackgroundShadow = [a3 decodeBoolForKey:@"bgshadow"];
    v4->_showsHorizontalScrollIndicator = [a3 decodeBoolForKey:@"hscroller"];
    v4->_showsVerticalScrollIndicator = [a3 decodeBoolForKey:@"vscroller"];
    v4->_topExtensionColor = (UIColor *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"topcolor"];
    v4->_usesBlurredBackground = [a3 decodeBoolForKey:@"blurredbg"];
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUViewControllerScriptProperties;
  [(SUViewControllerScriptProperties *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(unsigned char *)(v5 + 8) = self->_alwaysDispatchesScrollEvents;
  *(void *)(v5 + 16) = self->_backgroundColor;
  *(void *)(v5 + 24) = [(NSDictionary *)self->_contextDictionary copyWithZone:a3];
  *(unsigned char *)(v5 + 32) = self->_doubleTapEnabled;
  *(unsigned char *)(v5 + 33) = self->_embedded;
  *(unsigned char *)(v5 + 34) = self->_flashesScrollIndicators;
  *(unsigned char *)(v5 + 35) = self->_inputViewObeysDOMFocus;
  *(void *)(v5 + 40) = self->_loadingIndicatorStyle;
  *(void *)(v5 + 48) = self->_loadingTextColor;
  *(void *)(v5 + 56) = self->_loadingTextShadowColor;
  *(void *)(v5 + 64) = [(SUGradient *)self->_placeholderBackgroundGradient copyWithZone:a3];
  long long v6 = *(_OWORD *)&self->_scrollContentInsets.bottom;
  *(_OWORD *)(v5 + 72) = *(_OWORD *)&self->_scrollContentInsets.top;
  *(_OWORD *)(v5 + 88) = v6;
  *(unsigned char *)(v5 + 104) = self->_scrollingDisabled;
  *(unsigned char *)(v5 + 105) = self->_shouldLoadProgressively;
  *(unsigned char *)(v5 + 106) = self->_shouldShowFormAccessory;
  *(unsigned char *)(v5 + 109) = self->_showsBackgroundShadow;
  *(unsigned char *)(v5 + 107) = self->_showsHorizontalScrollIndicator;
  *(unsigned char *)(v5 + 108) = self->_showsVerticalScrollIndicator;
  *(void *)(v5 + 112) = self->_topExtensionColor;
  *(unsigned char *)(v5 + 120) = self->_usesBlurredBackground;
  return (id)v5;
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SUViewControllerScriptProperties.m", 159, 0);
  }
  [a3 encodeBool:self->_alwaysDispatchesScrollEvents forKey:@"alwaysDispatchesScroll"];
  [a3 safeEncodeUIColor:self->_backgroundColor forKey:@"bgcolor"];
  [a3 encodeObject:self->_contextDictionary forKey:@"ctxdict"];
  [a3 encodeBool:self->_doubleTapEnabled forKey:@"doubletap"];
  [a3 encodeBool:self->_embedded forKey:@"embedded"];
  [a3 encodeBool:self->_flashesScrollIndicators forKey:@"flashscrollers"];
  [a3 encodeBool:self->_inputViewObeysDOMFocus forKey:@"inputViewObeysDOMFocus"];
  [a3 encodeInteger:self->_loadingIndicatorStyle forKey:@"activitystyle"];
  [a3 safeEncodeUIColor:self->_loadingTextColor forKey:@"loadtextcolor"];
  [a3 safeEncodeUIColor:self->_loadingTextShadowColor forKey:@"loadtextscolor"];
  [a3 encodeObject:self->_placeholderBackgroundGradient forKey:@"placeholdergradient"];
  objc_msgSend(a3, "encodeUIEdgeInsets:forKey:", @"scrollinsets", self->_scrollContentInsets.top, self->_scrollContentInsets.left, self->_scrollContentInsets.bottom, self->_scrollContentInsets.right);
  [a3 encodeBool:self->_scrollingDisabled forKey:@"scrollingdisabled"];
  [a3 encodeBool:self->_shouldLoadProgressively forKey:@"loadprogressively"];
  [a3 encodeBool:self->_shouldShowFormAccessory forKey:@"formaccessory"];
  [a3 encodeBool:self->_showsBackgroundShadow forKey:@"bgshadow"];
  [a3 encodeBool:self->_showsHorizontalScrollIndicator forKey:@"hscroller"];
  [a3 encodeBool:self->_showsVerticalScrollIndicator forKey:@"vscroller"];
  [a3 safeEncodeUIColor:self->_topExtensionColor forKey:@"topcolor"];
  BOOL usesBlurredBackground = self->_usesBlurredBackground;

  [a3 encodeBool:usesBlurredBackground forKey:@"blurredbg"];
}

- (BOOL)alwaysDispatchesScrollEvents
{
  return self->_alwaysDispatchesScrollEvents;
}

- (void)setAlwaysDispatchesScrollEvents:(BOOL)a3
{
  self->_alwaysDispatchesScrollEvents = a3;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (NSDictionary)contextDictionary
{
  return self->_contextDictionary;
}

- (void)setContextDictionary:(id)a3
{
}

- (BOOL)isDoubleTapEnabled
{
  return self->_doubleTapEnabled;
}

- (void)setDoubleTapEnabled:(BOOL)a3
{
  self->_doubleTapEnabled = a3;
}

- (BOOL)isEmbedded
{
  return self->_embedded;
}

- (void)setEmbedded:(BOOL)a3
{
  self->_embedded = a3;
}

- (BOOL)flashesScrollIndicators
{
  return self->_flashesScrollIndicators;
}

- (void)setFlashesScrollIndicators:(BOOL)a3
{
  self->_flashesScrollIndicators = a3;
}

- (BOOL)inputViewObeysDOMFocus
{
  return self->_inputViewObeysDOMFocus;
}

- (void)setInputViewObeysDOMFocus:(BOOL)a3
{
  self->_inputViewObeysDOMFocus = a3;
}

- (int64_t)loadingIndicatorStyle
{
  return self->_loadingIndicatorStyle;
}

- (void)setLoadingIndicatorStyle:(int64_t)a3
{
  self->_loadingIndicatorStyle = a3;
}

- (UIColor)loadingTextColor
{
  return self->_loadingTextColor;
}

- (void)setLoadingTextColor:(id)a3
{
}

- (UIColor)loadingTextShadowColor
{
  return self->_loadingTextShadowColor;
}

- (void)setLoadingTextShadowColor:(id)a3
{
}

- (SUGradient)placeholderBackgroundGradient
{
  return self->_placeholderBackgroundGradient;
}

- (void)setPlaceholderBackgroundGradient:(id)a3
{
}

- (UIEdgeInsets)scrollContentInsets
{
  double top = self->_scrollContentInsets.top;
  double left = self->_scrollContentInsets.left;
  double bottom = self->_scrollContentInsets.bottom;
  double right = self->_scrollContentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setScrollContentInsets:(UIEdgeInsets)a3
{
  self->_scrollContentInsets = a3;
}

- (BOOL)isScrollingDisabled
{
  return self->_scrollingDisabled;
}

- (void)setScrollingDisabled:(BOOL)a3
{
  self->_scrollingDisabled = a3;
}

- (BOOL)shouldLoadProgressively
{
  return self->_shouldLoadProgressively;
}

- (void)setShouldLoadProgressively:(BOOL)a3
{
  self->_shouldLoadProgressively = a3;
}

- (BOOL)shouldShowFormAccessory
{
  return self->_shouldShowFormAccessory;
}

- (void)setShouldShowFormAccessory:(BOOL)a3
{
  self->_shouldShowFormAccessory = a3;
}

- (BOOL)showsHorizontalScrollIndicator
{
  return self->_showsHorizontalScrollIndicator;
}

- (void)setShowsHorizontalScrollIndicator:(BOOL)a3
{
  self->_showsHorizontalScrollIndicator = a3;
}

- (BOOL)showsVerticalScrollIndicator
{
  return self->_showsVerticalScrollIndicator;
}

- (void)setShowsVerticalScrollIndicator:(BOOL)a3
{
  self->_showsVerticalScrollIndicator = a3;
}

- (BOOL)showsBackgroundShadow
{
  return self->_showsBackgroundShadow;
}

- (void)setShowsBackgroundShadow:(BOOL)a3
{
  self->_showsBackgroundShadow = a3;
}

- (UIColor)topExtensionColor
{
  return self->_topExtensionColor;
}

- (void)setTopExtensionColor:(id)a3
{
}

- (BOOL)usesBlurredBackground
{
  return self->_usesBlurredBackground;
}

- (void)setUsesBlurredBackground:(BOOL)a3
{
  self->_BOOL usesBlurredBackground = a3;
}

@end