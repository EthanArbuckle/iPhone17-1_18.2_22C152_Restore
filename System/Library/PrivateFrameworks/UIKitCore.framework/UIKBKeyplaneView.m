@interface UIKBKeyplaneView
- (BOOL)_canDrawContent;
- (BOOL)_shouldAllowKey:(id)a3;
- (BOOL)_shouldInheritScreenScaleAsContentScaleFactor;
- (BOOL)_shouldUseUnifiedKeyView:(id)a3 forState:(int)a4;
- (BOOL)cacheDeferable;
- (BOOL)displaysColorImage;
- (BOOL)isPasscodeStyle;
- (BOOL)keepNonPersistent;
- (BOOL)retestSelectedVariantIndexForKey:(id)a3 atPoint:(CGPoint)a4 phase:(int64_t)a5;
- (BOOL)shouldAnimateInKeyView:(id)a3;
- (BOOL)shouldAnimateOutKeyView:(id)a3;
- (BOOL)suppressDrawing;
- (BOOL)useDefaultKeyplaneCacheTokenForRenderFlags:(int64_t)a3;
- (BOOL)validForKeyplane:(id)a3 withVisualStyle:(int)a4;
- (CGRect)_safeFrameForKeyViewFrame:(CGRect)a3 inContainer:(id)a4 forKey:(id)a5;
- (NSString)cacheKey;
- (UIKBCacheToken)cacheToken;
- (UIKBCacheToken)defaultKeyplaneCacheToken;
- (UIKBKeyViewAnimator)keyViewAnimator;
- (UIKBKeyplaneView)initWithFrame:(CGRect)a3 keyplane:(id)a4;
- (UIKBKeyplaneViewDelegate)delegate;
- (UIKBRenderConfig)renderConfig;
- (UIKBRenderFactory)factory;
- (UIKBRenderingContext)renderingContext;
- (UIKBScreenTraits)overrideScreenTraits;
- (UIKBTree)defaultKeyplane;
- (UIKBTree)keyplane;
- (UIKeyboardEmojiKeyDisplayController)emojiKeyManager;
- (UIView)keyplaneMaskView;
- (double)cachedWidth;
- (id)activeKeyViews;
- (id)cacheIdentifierForKey:(id)a3;
- (id)cacheIdentifierForKey:(id)a3 withState:(int)a4;
- (id)cacheKeysForRenderFlags:(id)a3;
- (id)containingViewForKey:(id)a3 withState:(int)a4 wantsActiveOut:(BOOL *)a5;
- (id)existingVariantsKeyViewForKey:(id)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)viewForKey:(id)a3;
- (id)viewForKey:(id)a3 state:(int)a4;
- (int)stateForKey:(id)a3;
- (int64_t)assetIdiom;
- (int64_t)cacheDeferPriority;
- (unint64_t)cornerMaskForKey:(id)a3 recursive:(BOOL)a4;
- (void)_generateFactoryIfNeeded;
- (void)_generateRenderingContextIfNeeded;
- (void)_updateKeyplaneMaskView;
- (void)activateKeys;
- (void)addKeyToDelayedDeactivationSet:(id)a3;
- (void)cancelDelayedDeactivation;
- (void)deactivateAdaptiveKey:(id)a3;
- (void)deactivateKey:(id)a3 previousState:(int)a4;
- (void)deactivateKey:(id)a3 previousState:(int)a4 keyView:(id)a5;
- (void)deactivateKeys;
- (void)deactivateKeysWithReason:(id)a3 force:(BOOL)a4;
- (void)dealloc;
- (void)dimKeys:(id)a3;
- (void)displayLayer:(id)a3;
- (void)drawContentsOfRenderers:(id)a3;
- (void)hideKeyCaps:(BOOL)a3;
- (void)hideKeyCaps:(BOOL)a3 andControlKeysWithInteractionTypes:(id)a4;
- (void)layoutSubviews;
- (void)orientKeyCapForKey:(id)a3 orientation:(int64_t)a4;
- (void)prepareForDisplay;
- (void)purgeActiveKeyViews;
- (void)purgeFactory;
- (void)purgeKeyViews;
- (void)purgeLayerContents;
- (void)purgeSubviews;
- (void)removeFromSuperview;
- (void)removeKeyFromDelayedDeactivationSet:(id)a3;
- (void)setCacheToken:(id)a3;
- (void)setContentScaleFactor:(double)a3;
- (void)setDefaultKeyplane:(id)a3;
- (void)setDefaultKeyplaneCacheToken:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEmojiKeyManager:(id)a3;
- (void)setFactory:(id)a3;
- (void)setKeyViewAnimator:(id)a3;
- (void)setKeyplane:(id)a3;
- (void)setOverrideScreenTraits:(id)a3;
- (void)setRenderConfig:(id)a3;
- (void)setRenderingContext:(id)a3;
- (void)setState:(int)a3 forKey:(id)a4;
- (void)setState:(int)a3 forKey:(id)a4 withReason:(id)a5 force:(BOOL)a6;
- (void)setSuppressDrawing:(BOOL)a3;
- (void)updateFrameForKey:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation UIKBKeyplaneView

- (UIKBKeyplaneView)initWithFrame:(CGRect)a3 keyplane:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v22.receiver = self;
  v22.super_class = (Class)UIKBKeyplaneView;
  v11 = -[UIKBSplitImageView initWithFrame:canStretchAsFullWidth:](&v22, sel_initWithFrame_canStretchAsFullWidth_, 0, x, y, width, height);
  if (v11)
  {
    UIKeyboardGetSafeDeviceIdiom();
    v11->_shouldDrawRect = 1;
    objc_storeStrong((id *)&v11->_keyplane, a4);
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:0];
    subviewIndedouble x = v11->_subviewIndex;
    v11->_subviewIndedouble x = (NSMutableDictionary *)v12;

    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:0];
    activeViewIndedouble x = v11->_activeViewIndex;
    v11->_activeViewIndedouble x = (NSMutableDictionary *)v14;

    uint64_t v16 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:0];
    renderedKeyViews = v11->_renderedKeyViews;
    v11->_renderedKeyViews = (NSMutableDictionary *)v16;

    uint64_t v18 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:0];
    delayedDeactivationKeys = v11->_delayedDeactivationKeys;
    v11->_delayedDeactivationKeys = (NSMutableDictionary *)v18;

    [(UIView *)v11 setOpaque:0];
    [(UIView *)v11 setUserInteractionEnabled:1];
    v20 = v11;
  }

  return v11;
}

- (void)removeFromSuperview
{
  v3 = +[UIKeyboardCache sharedInstance];
  [v3 decrementExpectedRender:self];

  [(UIKBKeyplaneView *)self purgeKeyViews];
  v4.receiver = self;
  v4.super_class = (Class)UIKBKeyplaneView;
  [(UIView *)&v4 removeFromSuperview];
}

- (void)dealloc
{
  v3 = +[UIKeyboardCache sharedInstance];
  [v3 decrementExpectedRender:self];

  v4.receiver = self;
  v4.super_class = (Class)UIKBKeyplaneView;
  [(UIView *)&v4 dealloc];
}

- (BOOL)validForKeyplane:(id)a3 withVisualStyle:(int)a4
{
  BOOL v6 = [(UIKBTree *)self->_keyplane looksLike:a3];
  if (v6) {
    LOBYTE(v6) = [(UIKBTree *)self->_keyplane visualStyle] == a4;
  }
  return v6;
}

- (BOOL)isPasscodeStyle
{
  return ([(UIKBTree *)self->_keyplane visualStyling] & 0xFF00) == 32512;
}

- (void)setRenderConfig:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [(UIKBKeyplaneView *)self renderConfig];
  if (v6
    && (v7 = (void *)v6,
        [(UIKBKeyplaneView *)self renderConfig],
        v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 lightKeyboard],
        int v10 = [v5 lightKeyboard],
        v8,
        v7,
        v9 == v10))
  {
    if ([(UIKBKeyplaneView *)self isPasscodeStyle])
    {
      v24 = [(UIKBKeyplaneView *)self renderConfig];
      [v24 keycapOpacity];
      double v26 = v25;
      [v5 keycapOpacity];
      BOOL v11 = v26 == v27;
    }
    else
    {
      BOOL v11 = 1;
    }
  }
  else
  {
    BOOL v11 = 0;
  }
  p_renderConfig = &self->_renderConfig;
  objc_storeStrong((id *)&self->_renderConfig, a3);
  v13 = [(UIKBRenderFactory *)self->_factory renderingContext];

  [(UIKBKeyplaneView *)self renderConfig];
  if (v13) {
    uint64_t v14 = {;
  }
    v15 = [(UIKBRenderFactory *)self->_factory renderingContext];
    [v15 setRenderConfig:v14];
  }
  else {
    uint64_t v16 = {;
  }
    uint64_t v14 = +[UIKBRenderingContext renderingContextForRenderConfig:v16];

    objc_msgSend(v14, "setIsFloating:", -[UIKBTree isFloating](self->_keyplane, "isFloating"));
    [(UIKBRenderFactory *)self->_factory setRenderingContext:v14];
  }

  if (v5) {
    char v17 = v11;
  }
  else {
    char v17 = 1;
  }
  if ((v17 & 1) == 0) {
    [(UIView *)self setNeedsDisplay];
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v18 = [(UIView *)self subviews];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v29 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v23 setRenderConfig:*p_renderConfig];
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v20);
  }
}

- (void)setRenderingContext:(id)a3
{
  id v7 = a3;
  uint64_t v5 = [v7 handBias];
  int64_t v6 = [(UIKBRenderingContext *)self->_renderingContext handBias];
  objc_storeStrong((id *)&self->_renderingContext, a3);
  if (v5 == v6)
  {
    [(UIKBRenderFactory *)self->_factory setRenderingContext:v7];
  }
  else
  {
    [(UIKBKeyplaneView *)self purgeFactory];
    [(UIKBKeyplaneView *)self _generateFactoryIfNeeded];
  }
}

- (void)prepareForDisplay
{
  [(UIKBKeyplaneView *)self _generateFactoryIfNeeded];
  if (self->_keyCaps)
  {
    [(UIView *)self bounds];
    -[UIView setFrame:](self->_keyCaps, "setFrame:");
  }
  else
  {
    v3 = [UIKBSplitImageView alloc];
    [(UIView *)self bounds];
    objc_super v4 = -[UIKBSplitImageView initWithFrame:canStretchAsFullWidth:](v3, "initWithFrame:canStretchAsFullWidth:", 0);
    keyCaps = self->_keyCaps;
    self->_keyCaps = v4;

    [(UIKBSplitImageView *)self->_keyCaps prepareForDisplay:((unint64_t)[(UIKBTree *)self->_keyplane visualStyling] >> 7) & 1];
    [(UIKBSplitImageView *)self insertSubviewAtBottom:self->_keyCaps];
  }
  if (self->_keyBackgrounds)
  {
    [(UIView *)self bounds];
    -[UIView setFrame:](self->_keyBackgrounds, "setFrame:");
  }
  else
  {
    int64_t v6 = [UIKBSplitImageView alloc];
    [(UIView *)self bounds];
    id v7 = -[UIKBSplitImageView initWithFrame:canStretchAsFullWidth:](v6, "initWithFrame:canStretchAsFullWidth:", 0);
    keyBackgrounds = self->_keyBackgrounds;
    self->_keyBackgrounds = v7;

    [(UIKBSplitImageView *)self->_keyBackgrounds prepareForDisplay:((unint64_t)[(UIKBTree *)self->_keyplane visualStyling] >> 7) & 1];
    [(UIKBSplitImageView *)self insertSubviewAtBottom:self->_keyBackgrounds];
  }
  if (self->_keyBorders)
  {
    [(UIView *)self bounds];
    -[UIView setFrame:](self->_keyBorders, "setFrame:");
  }
  else
  {
    int v9 = [UIKBSplitImageView alloc];
    [(UIView *)self bounds];
    int v10 = -[UIKBSplitImageView initWithFrame:canStretchAsFullWidth:](v9, "initWithFrame:canStretchAsFullWidth:", 0);
    keyBorders = self->_keyBorders;
    self->_keyBorders = v10;

    [(UIKBSplitImageView *)self->_keyBorders prepareForDisplay:((unint64_t)[(UIKBTree *)self->_keyplane visualStyling] >> 7) & 1];
    [(UIKBSplitImageView *)self insertSubviewAtBottom:self->_keyBorders];
  }
  uint64_t v12 = +[UIKeyboardCache sharedInstance];
  [v12 incrementExpectedRender:self];

  v13 = [(UIKBKeyplaneView *)self cacheKeysForRenderFlags:&unk_1ED3F00E8];
  uint64_t v14 = [(UIKBTree *)self->_keyplane layoutName];
  v15 = +[UIKeyboard activeKeyboard];
  uint64_t v16 = [v15 traitCollection];

  char v17 = dispatch_get_global_queue(25, 0);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __37__UIKBKeyplaneView_prepareForDisplay__block_invoke;
  v21[3] = &unk_1E52DD450;
  id v22 = &unk_1ED3F00E8;
  id v23 = v13;
  id v24 = v14;
  id v25 = v16;
  id v18 = v16;
  id v19 = v14;
  id v20 = v13;
  dispatch_async(v17, v21);
}

void __37__UIKBKeyplaneView_prepareForDisplay__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = objc_msgSend(*(id *)(a1 + 40), "objectForKey:", *(void *)(*((void *)&v10 + 1) + 8 * v6), (void)v10);
        v8 = +[UIKeyboardCache sharedInstance];
        int v9 = (CGImage *)[v8 cachedImageForKey:v7 fromLayout:*(void *)(a1 + 48) traitCollection:*(void *)(a1 + 56)];

        CGImageRelease(v9);
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

- (void)_generateRenderingContextIfNeeded
{
  if (!self->_renderingContext)
  {
    uint64_t v3 = [(UIKBKeyplaneView *)self renderConfig];
    uint64_t v4 = +[UIKBRenderingContext renderingContextForRenderConfig:v3];
    renderingContext = self->_renderingContext;
    self->_renderingContext = v4;

    uint64_t v6 = +[UIKeyboardImpl activeInstance];
    id v7 = [v6 textInputTraits];
    -[UIKBRenderingContext setKeyboardType:](self->_renderingContext, "setKeyboardType:", [v7 keyboardType]);

    BOOL v8 = [(UIKBTree *)self->_keyplane isFloating];
    int v9 = self->_renderingContext;
    [(UIKBRenderingContext *)v9 setIsFloating:v8];
  }
}

- (void)_generateFactoryIfNeeded
{
  if (!self->_factory)
  {
    [(UIKBKeyplaneView *)self _generateRenderingContextIfNeeded];
    uint64_t v3 = (uint64_t)[(UIKBTree *)self->_keyplane visualStyling];
    uint64_t v4 = [(UIKBKeyplaneView *)self renderingContext];
    uint64_t v5 = +[UIKBRenderFactory factoryForVisualStyle:v3 renderingContext:v4];
    factordouble y = self->_factory;
    self->_factordouble y = v5;

    [(UIView *)self contentScaleFactor];
    -[UIKBRenderFactory setScale:](self->_factory, "setScale:");
    [(UIKBScreenTraits *)self->_overrideScreenTraits stretchFactor];
    id v7 = self->_factory;
    -[UIKBRenderFactory setStretchFactor:](v7, "setStretchFactor:");
  }
}

- (UIKBRenderFactory)factory
{
  [(UIKBKeyplaneView *)self _generateFactoryIfNeeded];
  factordouble y = self->_factory;
  return factory;
}

- (void)willMoveToWindow:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UIKBKeyplaneView;
  [(UIView *)&v6 willMoveToWindow:v4];
  if (v4)
  {
    uint64_t v5 = [v4 screen];
    [v5 scale];
    -[UIKBRenderFactory setScale:](self->_factory, "setScale:");

    [(UIKBScreenTraits *)self->_overrideScreenTraits stretchFactor];
    -[UIKBRenderFactory setStretchFactor:](self->_factory, "setStretchFactor:");
  }
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)UIKBKeyplaneView;
  [(UIView *)&v16 layoutSubviews];
  keyplaneMaskView = self->_keyplaneMaskView;
  if (keyplaneMaskView)
  {
    [(UIView *)keyplaneMaskView frame];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    [(UIView *)self bounds];
    v18.origin.double x = v12;
    v18.origin.double y = v13;
    v18.size.double width = v14;
    v18.size.double height = v15;
    v17.origin.double x = v5;
    v17.origin.double y = v7;
    v17.size.double width = v9;
    v17.size.double height = v11;
    if (!CGRectEqualToRect(v17, v18))
    {
      [(UIView *)self bounds];
      -[UIView setFrame:](self->_keyplaneMaskView, "setFrame:");
      [(UIKBKeyplaneView *)self _updateKeyplaneMaskView];
    }
  }
}

- (NSString)cacheKey
{
  uint64_t v3 = [(UIKBKeyplaneView *)self cacheToken];
  BOOL v4 = [(UIKBTree *)self->_keyplane isSplit];
  CGFloat v5 = +[UIKeyboardImpl activeInstance];
  double v6 = objc_msgSend(v3, "stringForSplitState:handBias:", v4, objc_msgSend(v5, "currentHandBias"));

  return (NSString *)v6;
}

- (BOOL)useDefaultKeyplaneCacheTokenForRenderFlags:(int64_t)a3
{
  CGFloat v5 = [(UIKBKeyplaneView *)self defaultKeyplaneCacheToken];
  double v6 = [(UIKBKeyplaneView *)self cacheToken];
  LOBYTE(a3) = [v5 isUsableForCacheToken:v6 withRenderFlags:a3];

  return a3;
}

- (id)cacheKeysForRenderFlags:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v28 = [(UIKBKeyplaneView *)self cacheKey];
  if (v28)
  {
    double v27 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v24 = v4;
    id obj = v4;
    uint64_t v5 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      id v7 = 0;
      uint64_t v26 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v30 != v26) {
            objc_enumerationMutation(obj);
          }
          CGFloat v9 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          uint64_t v10 = [v9 integerValue];
          id v11 = v28;
          if ([(UIKBKeyplaneView *)self useDefaultKeyplaneCacheTokenForRenderFlags:v10])
          {
            if (v7) {
              goto LABEL_10;
            }
            CGFloat v12 = [(UIKBKeyplaneView *)self defaultKeyplaneCacheToken];
            BOOL v13 = [(UIKBTree *)self->_keyplane isSplit];
            CGFloat v14 = +[UIKeyboardImpl activeInstance];
            objc_msgSend(v12, "stringForSplitState:handBias:", v13, objc_msgSend(v14, "currentHandBias"));
            id v7 = (id)objc_claimAutoreleasedReturnValue();

            if (v7)
            {
LABEL_10:
              id v7 = v7;

              id v11 = v7;
            }
          }
          CGFloat v15 = [(UIKBKeyplaneView *)self renderConfig];
          objc_super v16 = +[UIKBRenderingContext renderingContextForRenderConfig:v15];

          CGRect v17 = +[UIKBRenderFactory cacheKeyForString:v11 withRenderFlags:v10 renderingContext:v16];
          if (v10 == 1)
          {
            CGRect v18 = [v16 renderConfig];
            int v19 = [v18 animatedBackground];

            if (v19)
            {
              uint64_t v20 = [v17 stringByAppendingString:@";1"];

              CGRect v17 = (void *)v20;
            }
          }
          [v27 setObject:v17 forKey:v9];
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v6);
    }
    else
    {
      id v7 = 0;
    }

    if ([(UIKBKeyplaneView *)self isPasscodeStyle]) {
      id v22 = 0;
    }
    else {
      id v22 = v27;
    }
    id v21 = v22;

    id v4 = v24;
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

- (void)displayLayer:(id)a3
{
  id v33 = a3;
  if (self->_shouldDrawRect)
  {
    id v4 = [(UIView *)self superview];
    if (v4)
    {
      if (self->_keyCaps || self->_keyBackgrounds)
      {

LABEL_6:
        uint64_t v5 = [(UIView *)self layer];
        [v5 setContents:0];

        uint64_t v6 = [(UIKBKeyplaneView *)self factory];
        id v7 = [v6 backgroundTraitsForKeyplane:self->_keyplane];

        if (self->_keyplaneMaskView || [(UIKBKeyplaneView *)self isPasscodeStyle])
        {
          double v8 = &unk_1ED3F0100;
        }
        else
        {
          double v8 = &unk_1ED3F0100;
          if ([v7 blendForm] != 2 && objc_msgSend(v7, "blendForm") != 8) {
            double v8 = &unk_1ED3F0118;
          }
        }
        CGFloat v9 = +[UIKeyboardCache sharedInstance];
        uint64_t v10 = [(UIKBTree *)self->_keyplane layoutName];
        id v11 = [v9 displayImagesForView:self fromLayout:v10 imageFlags:v8];

        [(UIKBKeyplaneView *)self cachedWidth];
        double v13 = v12;
        CGFloat v14 = [v11 objectForKey:&unk_1ED3F4950];
        CGFloat v15 = v14;
        if (v14)
        {
          id v16 = v14;
        }
        else
        {
          id v16 = [v11 objectForKey:&unk_1ED3F4968];
        }
        CGRect v17 = v16;

        [(UIKBSplitImageView *)self->_keyCaps setImage:v17 cachedWidth:self->_keyplane keyplane:v13];
        CGRect v18 = [v11 objectForKey:&unk_1ED3F4938];
        [(UIKBSplitImageView *)self->_keyBackgrounds setImage:v18 cachedWidth:self->_keyplane keyplane:v13];
        int v19 = [v11 objectForKey:&unk_1ED3F4920];
        [(UIKBSplitImageView *)self->_keyBorders setImage:v19 cachedWidth:self->_keyplane keyplane:v13];
        uint64_t v20 = +[UIKeyboardImpl activeInstance];
        char v21 = [v20 isTrackpadMode];

        if ((v21 & 1) == 0)
        {
          [(UIView *)self->_keyCaps setAlpha:1.0];
          [(UIView *)self->_keyBackgrounds setAlpha:1.0];
          [(UIView *)self->_keyBorders setAlpha:1.0];
        }
        [(UIView *)self->_keyBackgrounds setHidden:v18 == 0];
        [(UIView *)self->_keyBorders setHidden:v19 == 0];
        id v22 = [(UIKBKeyplaneView *)self renderConfig];
        int v23 = [v22 lightKeyboard];

        uint64_t v24 = [v7 blendForm];
        if (v23)
        {
          if (v24 == 1 || [v7 blendForm] == 2 || objc_msgSend(v7, "blendForm") == 7)
          {
            id v25 = [(UIKBKeyplaneView *)self renderConfig];
            [v25 lightKeycapOpacity];
LABEL_21:
            -[UIView setAlpha:](self->_keyBackgrounds, "setAlpha:");

LABEL_22:
            if ([v7 blendForm] == 3)
            {
              id v26 = (id)*MEMORY[0x1E4F3A2E8];
              id v27 = (id)*MEMORY[0x1E4F3A018];
            }
            else
            {
              if ([v7 blendForm] == 2)
              {
                id v27 = (id)*MEMORY[0x1E4F3A008];
              }
              else
              {
                if ([v7 blendForm] != 8)
                {
                  id v26 = 0;
                  id v27 = 0;
                  goto LABEL_36;
                }
                id v27 = (id)*MEMORY[0x1E4F3A2E0];
                long long v28 = [(UIKBKeyplaneView *)self renderConfig];
                objc_msgSend(v7, "setUsesDarkAppearance:", objc_msgSend(v28, "lightKeyboard") ^ 1);

                [v7 setControlOpacities:0];
                keyBackgrounds = self->_keyBackgrounds;
                long long v30 = [v7 extraFiltersForType:*MEMORY[0x1E4F3A350]];
                [(UIKBSplitImageView *)keyBackgrounds addExtraFilters:v30];
              }
              id v26 = 0;
            }
LABEL_36:
            [(UIKBSplitImageView *)self->_keyBackgrounds setFilterType:v26];
            [(UIKBSplitImageView *)self->_keyBorders setFilterType:v27];

            goto LABEL_37;
          }
        }
        else if (v24 != 8)
        {
          goto LABEL_22;
        }
        id v25 = [(UIKBKeyplaneView *)self renderConfig];
        [v25 keycapOpacity];
        goto LABEL_21;
      }
      keyBorders = self->_keyBorders;

      if (keyBorders) {
        goto LABEL_6;
      }
    }
  }
LABEL_37:
  long long v32 = +[UIKeyboardCache sharedInstance];
  [v32 decrementExpectedRender:self];
}

- (BOOL)cacheDeferable
{
  return ![(UIKBKeyplaneView *)self isPasscodeStyle];
}

- (int64_t)cacheDeferPriority
{
  if ([(UIKBKeyplaneView *)self isPasscodeStyle]) {
    return 0;
  }
  else {
    return 2;
  }
}

- (double)cachedWidth
{
  if (+[UIKeyboardCache enabled]
    && [(UIKBTree *)self->_keyplane isSplit])
  {
    [(UIKBTree *)self->_keyplane frameForKeylayoutName:@"split-left"];
    double v4 = v3;
    [(UIKBTree *)self->_keyplane frameForKeylayoutName:@"split-right"];
    return v4 + v5 + 3.0;
  }
  else
  {
    [(UIView *)self size];
  }
  return result;
}

- (BOOL)keepNonPersistent
{
  return 0;
}

- (BOOL)displaysColorImage
{
  return 0;
}

- (int64_t)assetIdiom
{
  id v2 = [(UIView *)self traitCollection];
  int64_t v3 = [v2 userInterfaceIdiom];

  return v3;
}

- (void)drawContentsOfRenderers:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v38 = a3;
  uint64_t v4 = 472;
  double v5 = 0.0;
  if (+[UIKeyboardCache enabled]
    && [(UIKBTree *)self->_keyplane isSplit])
  {
    [(UIKBTree *)self->_keyplane frameForKeylayoutName:@"split-right"];
    double v7 = v6;
    [(UIKBTree *)self->_keyplane frameForKeylayoutName:@"split-left"];
    double v5 = v7 - v8 + -3.0;
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  CGFloat v9 = [(UIKBTree *)self->_keyplane keys];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v46;
    double v13 = &off_1E52D3000;
    uint64_t v36 = *(void *)v46;
    v37 = v9;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v46 != v12) {
          objc_enumerationMutation(v9);
        }
        CGFloat v15 = *(void **)(*((void *)&v45 + 1) + 8 * v14);
        if ([v15 visible])
        {
          id v16 = [(UIKBKeyplaneView *)self defaultKeyplane];
          if (![v15 renderKeyInKeyplane:v16]
            || [(UIKBKeyplaneView *)self cornerMaskForKey:v15 recursive:0])
          {
            goto LABEL_12;
          }
          [v15 frame];
          IsEmptdouble y = CGRectIsEmpty(v52);

          if (!IsEmpty)
          {
            CGRect v18 = v13[407];
            int v19 = [v15 displayString];
            LOBYTE(v18) = [v18 couldUseGlyphSelectorForDisplayString:v19];

            if ((v18 & 1) == 0)
            {
              uint64_t v39 = v14;
              uint64_t v40 = v11;
              uint64_t v20 = [v15 state];
              [v15 setState:2];
              char v21 = [(UIKBKeyplaneView *)self factory];
              uint64_t v22 = v4;
              id v16 = [v21 traitsForKey:v15 onKeyplane:*(Class *)((char *)&self->super.super.super.super.isa + v4)];

              int v23 = self;
              uint64_t v24 = [(UIKBKeyplaneView *)self factory];
              id v25 = [v24 displayContentsForKey:v15];

              [v15 setState:v20];
              long long v43 = 0u;
              long long v44 = 0u;
              long long v41 = 0u;
              long long v42 = 0u;
              id v26 = v38;
              uint64_t v27 = [v26 countByEnumeratingWithState:&v41 objects:v49 count:16];
              if (v27)
              {
                uint64_t v28 = v27;
                uint64_t v29 = *(void *)v42;
                do
                {
                  for (uint64_t i = 0; i != v28; ++i)
                  {
                    if (*(void *)v42 != v29) {
                      objc_enumerationMutation(v26);
                    }
                    long long v31 = *(void **)(*((void *)&v41 + 1) + 8 * i);
                    if ([v31 context])
                    {
                      CGContextSaveGState((CGContextRef)[v31 context]);
                      if (v5 != 0.0)
                      {
                        [v15 frame];
                        double v33 = v32;
                        [*(id *)((char *)&v23->super.super.super.super.isa + v22) frame];
                        if (v33 > v34 * 0.5) {
                          CGContextTranslateCTM((CGContextRef)[v31 context], -v5, 0.0);
                        }
                      }
                    }
                    [v31 renderKeyContents:v25 withTraits:v16];
                    if ([v31 context]) {
                      CGContextRestoreGState((CGContextRef)[v31 context]);
                    }
                  }
                  uint64_t v28 = [v26 countByEnumeratingWithState:&v41 objects:v49 count:16];
                }
                while (v28);
              }

              uint64_t v4 = v22;
              self = v23;
              uint64_t v12 = v36;
              CGFloat v9 = v37;
              double v13 = &off_1E52D3000;
              uint64_t v14 = v39;
              uint64_t v11 = v40;
LABEL_12:
            }
          }
        }
        ++v14;
      }
      while (v14 != v11);
      uint64_t v35 = [v9 countByEnumeratingWithState:&v45 objects:v50 count:16];
      uint64_t v11 = v35;
    }
    while (v35);
  }
}

- (void)setContentScaleFactor:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UIKBKeyplaneView;
  -[UIView setContentScaleFactor:](&v7, sel_setContentScaleFactor_);
  factordouble y = self->_factory;
  if (factory)
  {
    [(UIKBRenderFactory *)factory scale];
    if (v6 != a3)
    {
      [(UIKBRenderFactory *)self->_factory setScale:a3];
      [(UIView *)self setNeedsDisplay];
    }
  }
}

- (BOOL)_shouldInheritScreenScaleAsContentScaleFactor
{
  return 1;
}

- (BOOL)_canDrawContent
{
  return ![(UIKBKeyplaneView *)self suppressDrawing];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)UIKBKeyplaneView;
  -[UIView hitTest:withEvent:](&v7, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  double v5 = (UIKBKeyplaneView *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
  {

    double v5 = 0;
  }
  return v5;
}

- (void)cancelDelayedDeactivation
{
}

- (void)addKeyToDelayedDeactivationSet:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    double v5 = [(UIKBKeyplaneView *)self keyViewAnimator];
    if (v5)
    {
      double v6 = [(UIKBKeyplaneView *)self keyViewAnimator];
      objc_super v7 = [(UIKBKeyplaneView *)self viewForKey:v4];
      [v6 delayedDeactivationTimeForKeyView:v7];
      int64_t v9 = (uint64_t)(v8 * 1000000000.0);
    }
    else
    {
      int64_t v9 = 59000000;
    }

    delayedDeactivationKeys = self->_delayedDeactivationKeys;
    uint64_t v11 = [v4 name];
    [(NSMutableDictionary *)delayedDeactivationKeys setObject:v4 forKey:v11];

    dispatch_time_t v12 = dispatch_time(0, v9);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __51__UIKBKeyplaneView_addKeyToDelayedDeactivationSet___block_invoke;
    v13[3] = &unk_1E52D9F98;
    v13[4] = self;
    id v14 = v4;
    dispatch_after(v12, MEMORY[0x1E4F14428], v13);
  }
}

void __51__UIKBKeyplaneView_addKeyToDelayedDeactivationSet___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 552);
  int64_t v3 = [*(id *)(a1 + 40) name];
  id v5 = [v2 objectForKey:v3];

  id v4 = v5;
  if (v5)
  {
    [*(id *)(a1 + 32) setState:2 forKey:v5];
    id v4 = v5;
  }
}

- (void)removeKeyFromDelayedDeactivationSet:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    double v8 = v4;
    uint64_t v5 = [(NSMutableDictionary *)self->_delayedDeactivationKeys count];
    id v4 = v8;
    if (v5)
    {
      delayedDeactivationKeys = self->_delayedDeactivationKeys;
      objc_super v7 = [v8 name];
      [(NSMutableDictionary *)delayedDeactivationKeys removeObjectForKey:v7];

      id v4 = v8;
    }
  }
}

- (id)cacheIdentifierForKey:(id)a3
{
  id v3 = a3;
  id v4 = [v3 variantDisplayString];
  [v3 paddedFrame];
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  double v13 = NSString;
  id v14 = [v3 name];
  uint64_t v15 = [v3 displayType];
  uint64_t v16 = [v3 displayTypeHint];
  CGRect v17 = [v3 overrideDisplayString];

  CGRect v18 = [v13 stringWithFormat:@"%@%@%d%d%@%.0f%.0f%.0f%.0f", v14, v4, v15, v16, v17, v6, v8, v10, v12];

  return v18;
}

- (id)cacheIdentifierForKey:(id)a3 withState:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v7 = [v6 overrideDisplayString];

  if (v7)
  {
    uint64_t v8 = [v6 name];
    uint64_t v9 = [v6 overrideDisplayString];
    uint64_t v10 = [v8 stringByAppendingFormat:@"_%@_%d", v9, v4];

LABEL_5:
    uint64_t v8 = (void *)v10;
    goto LABEL_6;
  }
  uint64_t v11 = [(UIKBKeyplaneView *)self _shouldUseUnifiedKeyView:v6 forState:v4];
  uint64_t v12 = [v6 name];
  uint64_t v8 = v12;
  if ((v11 & 1) == 0)
  {
    uint64_t v10 = objc_msgSend(v12, "stringByAppendingFormat:", @"_%d", v4);
    goto LABEL_5;
  }
LABEL_6:
  if ([v6 displayType] == 7)
  {
    double v13 = +[UIKeyboardImpl activeInstance];
    int v14 = [v13 isShiftLocked];

    if (v14)
    {
      uint64_t v15 = [v8 stringByAppendingString:@"_caps"];

      uint64_t v8 = (void *)v15;
    }
  }

  return v8;
}

- (unint64_t)cornerMaskForKey:(id)a3 recursive:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(UIKBTree *)self->_keyplane isSplit]
    && ([v6 displayType] == 36 || objc_msgSend(v6, "displayType") == 37))
  {
    if (v4) {
      unint64_t v7 = [(UIView *)self _clipCornersOfView:self];
    }
    else {
      unint64_t v7 = -1;
    }
    unint64_t v11 = [v6 clipCorners] & v7;
    goto LABEL_40;
  }
  if ([v6 interactionType] != 16
    && [v6 displayType] != 35
    && [v6 displayType] != 31
    && [v6 displayType] != 32
    && [v6 displayType] != 1
    && [v6 displayType] != 25
    && ([v6 name],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 isEqualToString:@"Chinese-Facemark"],
        v8,
        !v9)
    || [(UIKBScreenTraits *)self->_overrideScreenTraits idiom] != 1
    && [(UIKBScreenTraits *)self->_overrideScreenTraits idiom] != 24
    && [(UIKBScreenTraits *)self->_overrideScreenTraits idiom] != 25
    && [(UIKBScreenTraits *)self->_overrideScreenTraits idiom] != 26
    && [(UIKBScreenTraits *)self->_overrideScreenTraits idiom] != 23
    || ![(UIKBTree *)self->_keyplane isSplit])
  {
LABEL_21:
    unint64_t v11 = 0;
    goto LABEL_40;
  }
  if (v4)
  {
    unint64_t v10 = [(UIView *)self _clipCornersOfView:self];
    if (!v10) {
      goto LABEL_21;
    }
  }
  else
  {
    unint64_t v10 = -1;
  }
  [v6 paddedFrame];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v53 = v18;
  [(UIKBTree *)self->_keyplane frameForKeylayoutName:@"split-left"];
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v54 = v26;
  [(UIKBTree *)self->_keyplane frameForKeylayoutName:@"split-right"];
  CGFloat v58 = v28;
  CGFloat v59 = v27;
  CGFloat v56 = v30;
  CGFloat v57 = v29;
  v61.origin.double x = v13;
  CGFloat v55 = v13;
  v61.origin.double y = v15;
  v61.size.double width = v17;
  v61.size.double height = v19;
  double MaxX = CGRectGetMaxX(v61);
  v62.origin.double x = v21;
  CGFloat v60 = v21;
  v62.origin.double y = v23;
  v62.size.double width = v25;
  v62.size.double height = v54;
  double v32 = CGRectGetMaxX(v62);
  BOOL v33 = MaxX == v32;
  if (MaxX != v32) {
    v10 &= 5u;
  }
  uint64_t v34 = 16 * (MaxX == v32);
  v63.origin.double x = v13;
  v63.origin.double y = v15;
  v63.size.double width = v17;
  v63.size.double height = v53;
  double MinX = CGRectGetMinX(v63);
  v64.origin.double y = v58;
  v64.origin.double x = v59;
  v64.size.double height = v56;
  v64.size.double width = v57;
  double v36 = CGRectGetMinX(v64);
  if (MinX == v36) {
    unint64_t v37 = v10;
  }
  else {
    unint64_t v37 = v10 & 0xA;
  }
  if (MinX == v36) {
    uint64_t v34 = (16 * v33) | 0x20;
  }
  v65.origin.double x = v21;
  v65.origin.double y = v23;
  v65.size.double width = v25;
  v65.size.double height = v54;
  double MaxY = CGRectGetMaxY(v65);
  v66.origin.double x = v55;
  v66.origin.double y = v15;
  v66.size.double width = v17;
  v66.size.double height = v53;
  double v39 = MaxY - CGRectGetMaxY(v66);
  uint64_t v40 = +[UIKeyboardPreferencesController sharedPreferencesController];
  long long v41 = [v40 preferencesActions];
  [v41 rivenSizeFactor:1.0];
  double v43 = v42;

  if (v39 > v43) {
    v37 &= 3u;
  }
  v67.origin.double x = v55;
  v67.origin.double y = v15;
  v67.size.double width = v17;
  v67.size.double height = v53;
  double MinY = CGRectGetMinY(v67);
  v68.origin.double x = v60;
  v68.origin.double y = v23;
  v68.size.double width = v25;
  v68.size.double height = v54;
  double v45 = MinY - CGRectGetMinY(v68);
  long long v46 = +[UIKeyboardPreferencesController sharedPreferencesController];
  long long v47 = [v46 preferencesActions];
  [v47 rivenSizeFactor:1.0];
  double v49 = v48;

  unint64_t v50 = v37 & 0xC;
  if (v45 <= v49) {
    unint64_t v50 = v37;
  }
  if (v4) {
    uint64_t v51 = 0;
  }
  else {
    uint64_t v51 = v34;
  }
  unint64_t v11 = v50 | v51;
LABEL_40:

  return v11;
}

- (id)containingViewForKey:(id)a3 withState:(int)a4 wantsActiveOut:(BOOL *)a5
{
  id v8 = a3;
  if ([v8 displayType])
  {
    BOOL v9 = 0;
  }
  else
  {
    unint64_t v10 = [v8 parentKey];
    BOOL v9 = v10 != 0;
  }
  if ([v8 displayType] == 57)
  {
    unint64_t v11 = [v8 parentKey];
    HIDWORD(v42) = v11 != 0;
  }
  else
  {
    HIDWORD(v42) = 0;
  }
  double v12 = [(UIKBKeyplaneView *)self defaultKeyplane];
  int v13 = [v8 renderKeyInKeyplane:v12] | v9;

  double v14 = [v8 displayString];
  LODWORD(v42) = +[UIKBRenderFactory couldUseGlyphSelectorForDisplayString:v14];

  unsigned int v15 = [v8 displayType];
  BOOL v16 = v15 == 20 && (a4 & 0x10) == 0;
  BOOL v46 = v16;
  int v45 = objc_msgSend(v8, "interactionType", v42);
  unint64_t v17 = [(UIKBKeyplaneView *)self cornerMaskForKey:v8 recursive:0];
  BOOL v18 = 0;
  candidateGapView = self->_candidateGapView;
  if (a4 == 8) {
    int v20 = v13;
  }
  else {
    int v20 = 0;
  }
  int v21 = v20 | ((a4 & 0x10) >> 4);
  if (v20 == 1) {
    BOOL v18 = [v8 rendering] == 1
  }
       || [v8 rendering] == 33
       || [v8 rendering] == 34
       || [v8 rendering] == 11;
  int v22 = (a4 == 4) | v21;
  if (a5) {
    *a5 = v22;
  }
  if (a4 == 4)
  {
    BOOL v23 = 0;
    if (v15 <= 0x29 && ((1 << v15) & 0x38000000010) != 0) {
      goto LABEL_31;
    }
  }
  else
  {
    BOOL v23 = a4 == 16;
    if (a4 == 16 && v15 == 37)
    {
      overrideScreenTraits = self->_overrideScreenTraits;
      if (overrideScreenTraits && overrideScreenTraits->_isFirstPartyStickers) {
        goto LABEL_31;
      }
      BOOL v23 = 1;
    }
  }
  if (!((v22 ^ 1) & 1 | (v46 || v45 == 10) | (v17 != 0) & ~v22 | v18 | (candidateGapView != 0)))
  {
    double v26 = [(UIView *)self window];
    double v27 = [v26 rootViewController];
    double v28 = [v27 view];

    double v29 = self->_overrideScreenTraits;
    if (v29 && v29->_isFirstPartyStickers)
    {
      double v30 = [(UIView *)self window];
LABEL_49:
      CGFloat v25 = v30;
LABEL_50:

      goto LABEL_51;
    }
    if ([v26 _isTextEffectsWindow])
    {
      if (![v28 containsView:self])
      {
        uint64_t v31 = [(UIKBKeyplaneView *)self delegate];
        if (v31)
        {
          double v32 = (void *)v31;
          BOOL v33 = [(UIKBKeyplaneView *)self delegate];
          char v34 = objc_opt_respondsToSelector();

          if (v34)
          {
            uint64_t v35 = [(UIKBKeyplaneView *)self delegate];
            CGFloat v25 = [v35 keyplaneView:self containingViewForActiveKey:v8];

            if (v25) {
              goto LABEL_50;
            }
          }
        }
        goto LABEL_48;
      }
    }
    else
    {
      if (!v23
        || ([(UIKBKeyplaneView *)self factory],
            double v36 = objc_claimAutoreleasedReturnValue(),
            int v37 = [v36 popupKeyUsesCustomKeyContentView:v8],
            v36,
            !v37))
      {
LABEL_48:
        double v30 = self;
        goto LABEL_49;
      }
      id v38 = [v26 rootViewController];
      double v39 = [v38 presentedViewController];

      if (v39)
      {
        uint64_t v40 = [v28 window];

        double v28 = (void *)v40;
      }
    }
    double v30 = v28;
    double v28 = v30;
    goto LABEL_49;
  }
  if ((v17 != 0 || ((v13 | v44) & 1) == 0) | v43 & 1 | v18 | (candidateGapView != 0))
  {
LABEL_31:
    CGFloat v25 = self;
    goto LABEL_51;
  }
  CGFloat v25 = 0;
LABEL_51:

  return v25;
}

- (BOOL)_shouldAllowKey:(id)a3
{
  id v4 = a3;
  if (![v4 visible]) {
    goto LABEL_6;
  }
  uint64_t v5 = [(UIKBTree *)self->_keyplane keys];
  if (![v5 containsObject:v4])
  {
    id v6 = [v4 parentKey];

    if (v6) {
      goto LABEL_5;
    }
LABEL_6:
    BOOL v7 = 0;
    goto LABEL_7;
  }

LABEL_5:
  BOOL v7 = 1;
LABEL_7:

  return v7;
}

- (void)setState:(int)a3 forKey:(id)a4
{
}

- (void)setState:(int)a3 forKey:(id)a4 withReason:(id)a5 force:(BOOL)a6
{
  v204[2] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  if (![(UIKBKeyplaneView *)self _shouldAllowKey:v10]) {
    goto LABEL_116;
  }
  if (a3 <= 0x14 && ((1 << a3) & 0x110010) != 0)
  {
    if (a6)
    {
LABEL_5:
      BOOL v12 = 1;
      int v13 = a3;
      goto LABEL_12;
    }
  }
  else
  {
    [(UIKBKeyplaneView *)self removeKeyFromDelayedDeactivationSet:v10];
    if (a6) {
      goto LABEL_5;
    }
  }
  if ([v10 state] == 16)
  {
    int v14 = [v10 displayType];
    BOOL v12 = v14 != 37;
    if (v14 == 37) {
      a3 = 16;
    }
  }
  else
  {
    BOOL v12 = 1;
  }
  int v13 = 4;
LABEL_12:
  overrideScreenTraits = self->_overrideScreenTraits;
  if (overrideScreenTraits)
  {
    if (overrideScreenTraits->_isStickerPickerServiceCollectionView)
    {
      int v16 = [v10 displayType];
      if (a3 == 2 && v16 == 36 && [(UIKBKeyplaneView *)self stateForKey:v10] == 2) {
        goto LABEL_116;
      }
    }
  }
  BOOL v17 = +[UIKeyboard isRemoteEmojiCollectionViewEnabled];
  BOOL v18 = +[UIKeyboardImpl activeInstance];
  int v19 = [v18 isEmojiPopoverPresented];

  uint64_t v20 = (v17 & v19 & ([v10 displayType] == 36)) != 0 ? v13 : a3;
  int v21 = (void *)[v10 state];
  [v10 setState:v20];
  if ([v10 ghost]) {
    goto LABEL_116;
  }
  int v22 = self->_overrideScreenTraits;
  if (!v22 || v20 != 4 || !v22->_isFirstPartyStickers)
  {
    id v23 = 0;
    BOOL v24 = v20 == 16;
    if (v21 == 16 && v20 == 16)
    {
      CGFloat v25 = [(UIKBKeyplaneView *)self factory];
      int v26 = [v25 popupKeyUsesCustomKeyContentView:v10];

      id v23 = [(UIKBKeyplaneView *)self existingVariantsKeyViewForKey:v10];
      if (v26)
      {
        if ([v10 variantType] != 12
          && [v10 variantType] != 13)
        {
          goto LABEL_34;
        }
        double v27 = [v10 selectedVariantIndices];
        if (![v27 count])
        {

          goto LABEL_41;
        }
        double v28 = [v10 selectedVariantIndices];
        [v28 firstObject];
        int v21 = v29 = (int)v21;
        id v30 = v23;
        uint64_t v31 = [v21 integerValue];

        LODWORD(v21) = v29;
        BOOL v32 = v31 == 0x7FFFFFFFFFFFFFFFLL;
        id v23 = v30;
        if (!v32) {
LABEL_34:
        }
          [v23 updateForKeyplane:self->_keyplane key:v10];
LABEL_41:
        id v23 = v23;

        BOOL v24 = 1;
        goto LABEL_42;
      }
      if ([v10 displayType] != 37)
      {
        BOOL v24 = 1;
        if ([v10 selectedVariantIndex] == 0x7FFFFFFFFFFFFFFFLL)
        {
LABEL_42:
          char v202 = 0;
          BOOL v33 = [(UIKBKeyplaneView *)self containingViewForKey:v10 withState:v20 wantsActiveOut:&v202];
          if (!v33)
          {
            self->_shouldDrawRect = 1;
LABEL_115:

            goto LABEL_116;
          }
          uint64_t v34 = [(UIKBKeyplaneView *)self cacheIdentifierForKey:v10 withState:v20];
          id v200 = v23;
          v201 = (void *)v34;
          unsigned int v199 = v21;
          if (v23)
          {
            id v35 = v23;
          }
          else
          {
            id v35 = [(NSMutableDictionary *)self->_renderedKeyViews objectForKey:v34];

            if (!v35)
            {
              v87 = self->_overrideScreenTraits;
              if (v87
                && v87->_isFirstPartyStickers
                && ([v10 variantType] == 12
                 || [v10 variantType] == 13))
              {
                [v10 setPopupDirection:3];
              }
              v88 = [(UIKBKeyplaneView *)self factory];
              v89 = [v88 traitsForKey:v10 onKeyplane:self->_keyplane];

              v192 = v89;
              v90 = [(NSMutableDictionary *)v89 geometry];
              [v90 displayFrame];
              double v92 = v91;
              double v94 = v93;
              double v96 = v95;
              double v98 = v97;

              if (v33 == self)
              {
                double v106 = v98;
                double v104 = v96;
                double v102 = v94;
                double v100 = v92;
              }
              else
              {
                -[UIView convertRect:toView:](self, "convertRect:toView:", v33, v92, v94, v96, v98);
                double v100 = v99;
                double v102 = v101;
                double v104 = v103;
                double v106 = v105;
                if ([v10 popupDirection] == 1)
                {
                  v107 = [(UIView *)v33 window];
                  v108 = [v107 screen];

                  if (v108)
                  {
                    double v195 = v92;
                    v109 = [(UIView *)v33 coordinateSpace];
                    v110 = [(UIView *)v33 window];
                    v111 = [v110 screen];
                    v112 = [v111 coordinateSpace];
                    objc_msgSend(v109, "convertRect:toCoordinateSpace:", v112, v100, v102, v104, v106);
                    double v114 = v113;

                    if (v114 >= 0.0)
                    {
                      double v92 = v195;
                    }
                    else
                    {
                      v115 = self->_overrideScreenTraits;
                      double v92 = v195;
                      if (!v115 || !v115->_isFirstPartyStickers)
                      {
                        [v10 setPopupDirection:2];
                        v116 = [(UIKBKeyplaneView *)self factory];
                        v117 = [v116 traitsForKey:v10 onKeyplane:self->_keyplane];

                        v118 = [(NSMutableDictionary *)v117 geometry];
                        [v118 displayFrame];
                        double v92 = v119;
                        double v94 = v120;
                        double v96 = v121;
                        double v98 = v122;

                        -[UIView convertRect:toView:](self, "convertRect:toView:", v33, v92, v94, v96, v98);
                        double v100 = v123;
                        double v102 = v124;
                        double v104 = v125;
                        double v106 = v126;
                        v192 = v117;
                      }
                    }
                  }
                }
              }
              if (!UIRectIsDiscrete(v100, v102, v104, v106))
              {
                double v36 = 0;
                CGFloat v56 = 0;
                CGFloat v58 = v192;
LABEL_113:

                goto LABEL_114;
              }
              if (v24
                && ([(UIKBKeyplaneView *)self factory],
                    v136 = objc_claimAutoreleasedReturnValue(),
                    int v137 = [v136 popupKeyUsesCustomKeyContentView:v10],
                    v136,
                    v137))
              {
                v138 = [(UIKBKeyplaneView *)self factory];
                v139 = (objc_class *)[v138 contentViewClassForPopupKey:v10];

                id v140 = [v139 alloc];
                v196 = objc_msgSend(v140, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
                v141 = [UIKBViewBackedKeyView alloc];
                keyplane = self->_keyplane;
                v143 = [(UIKBKeyplaneView *)self overrideScreenTraits];
                v144 = -[UIKBKeyView initWithFrame:keyplane:key:screenTraits:](v141, "initWithFrame:keyplane:key:screenTraits:", keyplane, v10, v143, v100, v102, v104, v106);

                v145 = [(UIView *)self superview];
                [v196 setTouchForwardingView:v145];

                [(UIKBViewBackedKeyView *)v144 setContentView:v196];
                CGFloat v56 = v144;
              }
              else
              {
                v146 = [(UIKBKeyplaneView *)self keyViewAnimator];
                v147 = [(UIKBKeyplaneView *)self overrideScreenTraits];
                v148 = (objc_class *)[v146 keyViewClassForKey:v10 renderTraits:v192 screenTraits:v147];

                uint64_t v149 = [(UIKBKeyplaneView *)self overrideScreenTraits];
                if (v149
                  && (v150 = (void *)v149,
                      int v151 = [(objc_class *)v148 wantsScreenTraits],
                      v150,
                      v151))
                {
                  id v152 = [v148 alloc];
                  v153 = self->_keyplane;
                  v154 = [(UIKBKeyplaneView *)self overrideScreenTraits];
                  CGFloat v56 = (UIKBViewBackedKeyView *)objc_msgSend(v152, "initWithFrame:keyplane:key:screenTraits:", v153, v10, v154, v100, v102, v104, v106);
                }
                else
                {
                  CGFloat v56 = (UIKBViewBackedKeyView *)objc_msgSend([v148 alloc], "initWithFrame:keyplane:key:", self->_keyplane, v10, v100, v102, v104, v106);
                }
              }
              -[UIKBViewBackedKeyView setDrawFrame:](v56, "setDrawFrame:", v92, v94, v96, v98);
              objc_msgSend(v10, "setClipCorners:", -[UIKBKeyplaneView cornerMaskForKey:recursive:](self, "cornerMaskForKey:recursive:", v10, 1));
              [(UIKBViewBackedKeyView *)v56 updateForKeyplane:self->_keyplane key:v10];
              if (!v24)
              {
                v155 = [v10 parentKey];

                if (!v155) {
                  [(NSMutableDictionary *)self->_renderedKeyViews setObject:v56 forKey:v201];
                }
              }

              double v36 = 0;
LABEL_51:
              uint64_t v57 = 3;
              if (v33 == self) {
                uint64_t v57 = 2;
              }
              CGFloat v58 = (NSMutableDictionary *)objc_retain(*(id *)((char *)&self->super.super.super.super.isa
                                                             + OBJC_IVAR___UIKBKeyplaneView__shouldDrawRect[v57]));
              if (v33 == self)
              {
                [(UIView *)self bounds];
                CGFloat v60 = v59;
                CGFloat v62 = v61;
                CGFloat v64 = v63;
                CGFloat v66 = v65;
                [(UIView *)v56 frame];
                v206.origin.double x = v67;
                v206.origin.double y = v68;
                v206.size.double width = v69;
                v206.size.double height = v70;
                v205.origin.double x = v60;
                v205.origin.double y = v62;
                v205.size.double width = v64;
                v205.size.double height = v66;
                if (!CGRectContainsRect(v205, v206))
                {
                  v71 = [(UIKBKeyplaneView *)self emojiKeyManager];

                  if (v71)
                  {
                    v72 = self->_activeViewIndex;

                    CGFloat v58 = v72;
                  }
                }
              }
              if (!v56) {
                goto LABEL_113;
              }
              if ([(UIKBKeyplaneView *)self shouldAnimateInKeyView:v56])
              {
                id v198 = [(UIKBKeyplaneView *)self keyViewAnimator];
              }
              else
              {
                id v198 = 0;
              }
              v73 = [(UIKBKeyplaneView *)self emojiKeyManager];

              if (v73)
              {
                v74 = [(UIKBKeyplaneView *)self emojiKeyManager];
                [v74 updateEmojiKeyManagerWithKey:v10 withKeyView:v56];
              }
              int v197 = objc_msgSend(v198, "shouldTransitionKeyView:fromState:toState:", v56, v199, objc_msgSend(v10, "state"));
              v75 = [v10 name];
              v76 = [(NSMutableDictionary *)v58 objectForKey:v75];

              v194 = v76;
              if (v76 != (UIKBKeyView *)v56)
              {
                if ((v197 & 1) == 0) {
                  [(UIKBKeyView *)v76 removeFromSuperview];
                }
                v77 = [v10 name];
                [(NSMutableDictionary *)v58 setObject:v56 forKey:v77];
              }
              v190 = v33;
              [(UIView *)v56 setAlpha:1.0];
              uint64_t v78 = v199;
              if (os_variant_has_internal_diagnostics())
              {
                v156 = [v10 name];
                int v157 = [v156 isEqualToString:@"EmojiPopupKey"];

                uint64_t v78 = v199;
                if (v157)
                {
                  v158 = [v10 displayString];
                  BOOL v159 = +[UIKeyboardEmojiCollectionInputView shouldHighlightEmoji:v158];

                  uint64_t v78 = v199;
                  if (v159)
                  {
                    v188 = v36;
                    v193 = v58;
                    v160 = [UILabel alloc];
                    [v10 paddedFrame];
                    double v162 = v161;
                    [v10 paddedFrame];
                    v163 = -[UILabel initWithFrame:](v160, "initWithFrame:", 0.0, 0.0, v162);
                    [(UILabel *)v163 setText:@"PRERELEASE"];
                    v164 = +[UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0];
                    [(UILabel *)v163 setTextColor:v164];

                    BOOL v165 = [(UIKBTree *)self->_keyplane isSplit];
                    double v166 = 8.0;
                    if (v165)
                    {
                      int v167 = objc_msgSend(v10, "variantType", 8.0);
                      double v166 = 5.0;
                      if (v167 == 10) {
                        double v166 = 8.0;
                      }
                    }
                    v168 = [off_1E52D39B8 systemFontOfSize:v166 weight:*(double *)off_1E52D6BD8];
                    [(UILabel *)v163 setFont:v168];

                    [(UILabel *)v163 setAdjustsFontSizeToFitWidth:1];
                    [(UILabel *)v163 setMinimumScaleFactor:0.5];
                    [(UIView *)v56 addSubview:v163];
                    [(UIView *)v163 setTranslatesAutoresizingMaskIntoConstraints:0];
                    if ([v10 variantType] == 10)
                    {
                      double v169 = -15.0;
                      if (![(UIKBTree *)self->_keyplane isSplit])
                      {
                        if ([(UIKBScreenTraits *)self->_overrideScreenTraits idiom] == 1
                          || [(UIKBScreenTraits *)self->_overrideScreenTraits idiom] == 24
                          || [(UIKBScreenTraits *)self->_overrideScreenTraits idiom] == 25
                          || [(UIKBScreenTraits *)self->_overrideScreenTraits idiom] == 26
                          || (double v169 = 8.0, [(UIKBScreenTraits *)self->_overrideScreenTraits idiom] == 23))
                        {
                          double v169 = -2.0;
                        }
                      }
                      v170 = [(UIView *)v56 centerXAnchor];
                      [(UIView *)v163 centerXAnchor];
                      v187 = v189 = v170;
                      v186 = objc_msgSend(v170, "constraintEqualToAnchor:");
                      v204[0] = v186;
                      uint64_t v171 = [(UIView *)v56 centerYAnchor];
                      uint64_t v172 = [(UIView *)v163 centerYAnchor];
                      v185 = (void *)v171;
                      v173 = (void *)v171;
                      v174 = (void *)v172;
                      v175 = objc_msgSend(v173, "constraintEqualToAnchor:constant:", v169);
                      v204[1] = v175;
                      v176 = (void *)MEMORY[0x1E4F1C978];
                      v177 = v204;
                    }
                    else
                    {
                      if ([v10 variantType] == 10) {
                        double v178 = -3.0;
                      }
                      else {
                        double v178 = -5.0;
                      }
                      v179 = [(UIView *)v56 centerXAnchor];
                      [(UIView *)v163 centerXAnchor];
                      v187 = v189 = v179;
                      v186 = objc_msgSend(v179, "constraintEqualToAnchor:");
                      v203[0] = v186;
                      uint64_t v180 = [(UIView *)v56 topAnchor];
                      uint64_t v181 = [(UIView *)v163 topAnchor];
                      v185 = (void *)v180;
                      v182 = (void *)v180;
                      v174 = (void *)v181;
                      v175 = objc_msgSend(v182, "constraintEqualToAnchor:constant:", v178);
                      v203[1] = v175;
                      v176 = (void *)MEMORY[0x1E4F1C978];
                      v177 = v203;
                    }
                    v183 = [v176 arrayWithObjects:v177 count:2];
                    objc_msgSend(v184, "activateConstraints:");

                    uint64_t v78 = v199;
                    CGFloat v58 = v193;
                    double v36 = v188;
                  }
                }
              }
              if (v202)
              {
                +[UIKeyboardImpl activeInstance];
                v79 = v36;
                v81 = uint64_t v80 = v78;
                [v81 textInputTraits];
                v82 = v191 = v58;
                if ([v82 isSecureTextEntry]) {
                  uint64_t v83 = 18;
                }
                else {
                  uint64_t v83 = 0;
                }

                uint64_t v78 = v80;
                double v36 = v79;
                v84 = [(UIView *)v56 layer];
                [v84 setDisableUpdateMask:v83];

                CGFloat v58 = v191;
              }
              BOOL v85 = [(UIKBKeyplaneView *)self _shouldUseUnifiedKeyView:v10 forState:v20];
              if (v56 == v36)
              {
                int v86 = 0;
                BOOL v33 = v190;
              }
              else
              {
                BOOL v33 = v190;
                int v86 = ![(UIView *)v190 containsView:v56];
              }
              if (v85 && !v86) {
                goto LABEL_103;
              }
              if (v33 == self && (candidateGapView = self->_candidateGapView) != 0)
              {
                v129 = self;
                v130 = v56;
              }
              else
              {
                if (v194) {
                  int v127 = v197;
                }
                else {
                  int v127 = 0;
                }
                if (v127 != 1 || ([v198 shouldAssertCurrentKeyState:v10] & 1) != 0)
                {
                  [(UIView *)v33 addSubview:v56];
LABEL_103:
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    v131 = v56;
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0
                      || ([(UIKBKeyplaneView *)v33 _isTextEffectsWindow] & 1) != 0
                      || (v132 = self->_overrideScreenTraits) != 0 && v132->_isFirstPartyStickers)
                    {
                      [(UIKBViewBackedKeyView *)v131 setTouchForwardingView:0];
                    }
                    else
                    {
                      v135 = [(UIView *)self superview];
                      [(UIKBViewBackedKeyView *)v131 setTouchForwardingView:v135];
                    }
                  }
                  v133 = [(UIKBKeyplaneView *)self factory];
                  [(UIKBKeyView *)v56 setFactory:v133];

                  v134 = [(UIKBKeyplaneView *)self renderConfig];
                  [(UIKBViewBackedKeyView *)v56 setRenderConfig:v134];

                  [(UIView *)v56 setNeedsDisplay];
                  [(UIKBKeyView *)v56 prepareForDisplay];
                  [(UIKBKeyView *)v56 updateKeycapLayerOrientation];
                  if (v197) {
                    objc_msgSend(v198, "transitionKeyView:fromState:toState:completion:", v56, v78, objc_msgSend(v10, "state"), 0);
                  }

                  goto LABEL_113;
                }
                v129 = v33;
                v130 = v56;
                candidateGapView = v194;
              }
              [(UIView *)v129 insertSubview:v130 belowSubview:candidateGapView];
              goto LABEL_103;
            }
          }
          double v36 = (UIKBViewBackedKeyView *)v35;
          int v37 = [(UIKBKeyplaneView *)self factory];
          id v38 = [v37 traitsForKey:v10 onKeyplane:self->_keyplane];

          double v39 = [v38 geometry];
          [v39 displayFrame];
          double v41 = v40;
          double v43 = v42;
          double v45 = v44;
          double v47 = v46;

          double v48 = v47;
          double v49 = v45;
          double v50 = v43;
          double v51 = v41;
          if (v33 != self)
          {
            -[UIView convertRect:toView:](self, "convertRect:toView:", v33, v41, v43, v45, v47);
            double v51 = v52;
            double v50 = v53;
            double v49 = v54;
            double v48 = v55;
          }
          if (!UIRectIsDiscrete(v51, v50, v49, v48))
          {
            CGFloat v56 = v36;
LABEL_114:

            id v23 = v200;
            goto LABEL_115;
          }
          -[UIView setFrame:](v36, "setFrame:", v51, v50, v49, v48);
          -[UIKBViewBackedKeyView setDrawFrame:](v36, "setDrawFrame:", v41, v43, v45, v47);
          CGFloat v56 = v36;
          goto LABEL_51;
        }
LABEL_37:
        [(UIKBKeyplaneView *)self deactivateKey:v10 previousState:v21];
        goto LABEL_42;
      }
    }
    if (!v12) {
      goto LABEL_42;
    }
    goto LABEL_37;
  }
  if ([v10 variantType])
  {
    id v23 = 0;
    BOOL v24 = 0;
    if (!v12) {
      goto LABEL_42;
    }
    goto LABEL_37;
  }
LABEL_116:
}

- (CGRect)_safeFrameForKeyViewFrame:(CGRect)a3 inContainer:(id)a4 forKey:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  id v11 = a5;
  BOOL v12 = [v10 coordinateSpace];
  int v13 = [v10 window];
  int v14 = [v13 screen];
  unsigned int v15 = [v14 coordinateSpace];
  objc_msgSend(v12, "convertRect:toCoordinateSpace:", v15, x, y, width, height);
  double v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;

  if ([v10 _shouldReverseLayoutDirection])
  {
    v50.origin.double x = v17;
    CGFloat rect = v19;
    v50.origin.double y = v19;
    v50.size.double width = v21;
    v50.size.double height = v23;
    double v49 = x;
    double MaxX = CGRectGetMaxX(v50);
    CGFloat v25 = [v10 window];
    int v26 = [v25 safeAreaLayoutGuide];
    [v26 layoutFrame];
    double v27 = y;
    double v28 = width;
    double v29 = height;
    double v30 = CGRectGetMaxX(v51);

    BOOL v31 = MaxX <= v30;
    double x = v49;
    double height = v29;
    double width = v28;
    double y = v27;
    if (!v31)
    {
      v52.origin.double x = v17;
      v52.origin.double y = rect;
      v52.size.double width = v21;
      v52.size.double height = v23;
      double v32 = CGRectGetMaxX(v52);
      BOOL v33 = [v10 window];
      uint64_t v34 = [v33 safeAreaLayoutGuide];
      [v34 layoutFrame];
      long double v35 = v32 - CGRectGetMaxX(v53);

      [v11 frame];
      double x = v49 - (v35 - fmod(v35, v36));
    }
  }
  else
  {
    int v37 = [v10 window];
    [v37 safeAreaInsets];
    double v39 = v38;

    if (v17 < v39)
    {
      double v40 = [v10 window];
      [v40 safeAreaInsets];
      long double v42 = v41 - v17;

      [v11 frame];
      double x = x + v42 - fmod(v42, v43);
    }
  }

  double v44 = x;
  double v45 = y;
  double v46 = width;
  double v47 = height;
  result.size.double height = v47;
  result.size.double width = v46;
  result.origin.double y = v45;
  result.origin.double x = v44;
  return result;
}

- (int)stateForKey:(id)a3
{
  return [a3 state];
}

- (id)activeKeyViews
{
  return (id)[(NSMutableDictionary *)self->_activeViewIndex allValues];
}

- (void)updateFrameForKey:(id)a3
{
  id v25 = a3;
  id v4 = -[UIKBKeyplaneView viewForKey:](self, "viewForKey:");
  if (v4)
  {
    -[UIKBKeyplaneView containingViewForKey:withState:wantsActiveOut:](self, "containingViewForKey:withState:wantsActiveOut:", v25, [v25 state], 0);
    uint64_t v5 = (UIKBKeyplaneView *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      id v6 = [(UIKBKeyplaneView *)self factory];
      BOOL v7 = [v6 traitsForKey:v25 onKeyplane:self->_keyplane];

      id v8 = [v7 geometry];
      [v8 displayFrame];
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;

      double v17 = v16;
      double v18 = v14;
      double v19 = v12;
      double v20 = v10;
      if (v5 != self)
      {
        -[UIView convertRect:toView:](self, "convertRect:toView:", v5, v10, v12, v14, v16);
        double v20 = v21;
        double v19 = v22;
        double v18 = v23;
        double v17 = v24;
      }
      if (UIRectIsDiscrete(v20, v19, v18, v17))
      {
        objc_msgSend(v4, "setFrame:", v20, v19, v18, v17);
        objc_msgSend(v4, "setDrawFrame:", v10, v12, v14, v16);
      }
    }
  }
}

- (id)viewForKey:(id)a3
{
  id v4 = a3;
  activeViewIndedouble x = self->_activeViewIndex;
  id v6 = [v4 name];
  BOOL v7 = [(NSMutableDictionary *)activeViewIndex objectForKey:v6];

  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    subviewIndedouble x = self->_subviewIndex;
    double v10 = [v4 name];
    id v8 = [(NSMutableDictionary *)subviewIndex objectForKey:v10];
  }
  return v8;
}

- (id)viewForKey:(id)a3 state:(int)a4
{
  renderedKeyViews = self->_renderedKeyViews;
  uint64_t v5 = [(UIKBKeyplaneView *)self cacheIdentifierForKey:a3 withState:*(void *)&a4];
  id v6 = [(NSMutableDictionary *)renderedKeyViews objectForKey:v5];

  return v6;
}

- (BOOL)shouldAnimateInKeyView:(id)a3
{
  id v4 = [a3 key];
  BOOL v5 = ([v4 state] != 2 || objc_msgSend(v4, "interactionType") != 9)
    && a3 != 0;

  return v5;
}

- (BOOL)shouldAnimateOutKeyView:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [(UIView *)self window];
    if (v5)
    {
      if ([(id)UIApp applicationState] == 2)
      {
        id v6 = [v4 window];
        char v7 = [v6 _isHostedInAnotherProcess];
      }
      else
      {
        char v7 = 1;
      }
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)deactivateAdaptiveKey:(id)a3
{
  id v4 = a3;
  [v4 setState:2];
  [(UIKBKeyplaneView *)self removeKeyFromDelayedDeactivationSet:v4];
  -[UIKBKeyplaneView deactivateKey:previousState:](self, "deactivateKey:previousState:", v4, [v4 state]);
}

- (void)dimKeys:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __28__UIKBKeyplaneView_dimKeys___block_invoke;
  v14[3] = &unk_1E52E6590;
  v14[4] = self;
  [v4 enumerateKeysAndObjectsUsingBlock:v14];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  BOOL v5 = [(NSMutableDictionary *)self->_renderedKeyViews allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) dimKeys:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

void __28__UIKBKeyplaneView_dimKeys___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  char v5 = [a2 integerValue];
  char v6 = v5;
  if (v5)
  {
    [v7 doubleValue];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 600), "setAlpha:");
    if ((v6 & 4) == 0)
    {
LABEL_3:
      if ((v6 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_3;
  }
  [v7 doubleValue];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 608), "setAlpha:");
  if ((v6 & 2) != 0)
  {
LABEL_4:
    [v7 doubleValue];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 592), "setAlpha:");
  }
LABEL_5:
}

- (void)hideKeyCaps:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  -[UIView setHidden:](self->_keyCaps, "setHidden:");
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  char v5 = [(NSMutableDictionary *)self->_renderedKeyViews allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) hideKeyCap:v3];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)hideKeyCaps:(BOOL)a3 andControlKeysWithInteractionTypes:(id)a4
{
  BOOL v4 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  [(UIView *)self->_keyCaps setHidden:v4];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [(NSMutableDictionary *)self->_renderedKeyViews allValues];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        long long v13 = NSNumber;
        double v14 = [v12 key];
        uint64_t v15 = objc_msgSend(v13, "numberWithUnsignedInt:", objc_msgSend(v14, "interactionType"));

        if ([v6 containsObject:v15]) {
          [v12 hideKeyCap:v4];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
}

- (void)orientKeyCapForKey:(id)a3 orientation:(int64_t)a4
{
  activeViewIndedouble x = self->_activeViewIndex;
  id v7 = a3;
  uint64_t v8 = [v7 name];
  uint64_t v9 = [(NSMutableDictionary *)activeViewIndex objectForKey:v8];
  [v9 orientKeyCap:a4];

  subviewIndedouble x = self->_subviewIndex;
  long long v11 = [v7 name];
  long long v12 = [(NSMutableDictionary *)subviewIndex objectForKey:v11];
  [v12 orientKeyCap:a4];

  long long v13 = [(UIKBKeyplaneView *)self cacheIdentifierForKey:v7 withState:2];
  double v14 = [(NSMutableDictionary *)self->_renderedKeyViews objectForKey:v13];
  [v14 orientKeyCap:a4];
  uint64_t v15 = [(UIKBKeyplaneView *)self cacheIdentifierForKey:v7 withState:4];

  long long v16 = [(NSMutableDictionary *)self->_renderedKeyViews objectForKey:v15];

  [v16 orientKeyCap:a4];
  id v18 = [(UIKBKeyplaneView *)self cacheIdentifierForKey:v7 withState:8];

  long long v17 = [(NSMutableDictionary *)self->_renderedKeyViews objectForKey:v18];

  [v17 orientKeyCap:a4];
}

- (id)existingVariantsKeyViewForKey:(id)a3
{
  id v4 = a3;
  activeViewIndedouble x = self->_activeViewIndex;
  id v6 = [v4 name];
  id v7 = [(NSMutableDictionary *)activeViewIndex objectForKey:v6];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    subviewIndedouble x = self->_subviewIndex;
    long long v11 = [v4 name];
    id v9 = [(NSMutableDictionary *)subviewIndex objectForKey:v11];
  }
  return v9;
}

- (BOOL)retestSelectedVariantIndexForKey:(id)a3 atPoint:(CGPoint)a4 phase:(int64_t)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a3;
  if ([(UIKBRenderFactory *)self->_factory popupKeyUsesCustomKeyContentView:v9])
  {
    uint64_t v10 = [(UIKBKeyplaneView *)self existingVariantsKeyViewForKey:v9];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      -[UIView convertPoint:toView:](self, "convertPoint:toView:", v10, x, y);
      char v11 = objc_msgSend(v10, "retestSelectedVariantIndexForKey:atPoint:phase:", v9, a5);
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (void)deactivateKey:(id)a3 previousState:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = [(UIKBKeyplaneView *)self viewForKey:v6];
  [(UIKBKeyplaneView *)self deactivateKey:v6 previousState:v4 keyView:v7];
}

- (void)deactivateKey:(id)a3 previousState:(int)a4 keyView:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  if (![(UIKBKeyplaneView *)self shouldAnimateOutKeyView:v9])
  {
    id v11 = 0;
LABEL_7:
    [v9 removeFromSuperview];
    activeViewIndedouble x = self->_activeViewIndex;
    double v14 = [v8 name];
    [(NSMutableDictionary *)activeViewIndex removeObjectForKey:v14];

    subviewIndedouble x = self->_subviewIndex;
    long long v16 = [v8 name];
    [(NSMutableDictionary *)subviewIndex removeObjectForKey:v16];

    goto LABEL_8;
  }
  uint64_t v10 = [(UIKBKeyplaneView *)self keyViewAnimator];
  id v11 = v10;
  if (!v10 || ([v10 disabled] & 1) != 0) {
    goto LABEL_7;
  }
  if (objc_msgSend(v11, "shouldTransitionKeyView:fromState:toState:", v9, v6, objc_msgSend(v8, "state")))
  {
    uint64_t v12 = [v8 state];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __56__UIKBKeyplaneView_deactivateKey_previousState_keyView___block_invoke;
    v17[3] = &unk_1E52DAF90;
    id v18 = v9;
    long long v19 = self;
    id v20 = v8;
    id v11 = v11;
    id v21 = v11;
    [v11 transitionOutKeyView:v18 fromState:v6 toState:v12 completion:v17];
  }
LABEL_8:
}

uint64_t __56__UIKBKeyplaneView_deactivateKey_previousState_keyView___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  id v2 = *(void **)(*(void *)(a1 + 40) + 536);
  BOOL v3 = [*(id *)(a1 + 48) name];
  uint64_t v4 = [v2 objectForKey:v3];
  char v5 = *(void **)(a1 + 32);

  if (v4 == v5)
  {
    uint64_t v6 = *(void **)(*(void *)(a1 + 40) + 536);
    id v7 = [*(id *)(a1 + 48) name];
    [v6 removeObjectForKey:v7];
  }
  id v8 = *(void **)(*(void *)(a1 + 40) + 528);
  id v9 = [*(id *)(a1 + 48) name];
  uint64_t v10 = [v8 objectForKey:v9];
  id v11 = *(void **)(a1 + 32);

  if (v10 == v11)
  {
    uint64_t v12 = *(void **)(*(void *)(a1 + 40) + 528);
    long long v13 = [*(id *)(a1 + 48) name];
    [v12 removeObjectForKey:v13];
  }
  uint64_t result = [*(id *)(a1 + 56) disabled];
  if ((result & 1) == 0)
  {
    uint64_t result = [*(id *)(a1 + 56) shouldAssertCurrentKeyState:*(void *)(a1 + 48)];
    if (result)
    {
      uint64_t v15 = *(void **)(a1 + 40);
      uint64_t v16 = [*(id *)(a1 + 48) state];
      uint64_t v17 = *(void *)(a1 + 48);
      return [v15 setState:v16 forKey:v17];
    }
  }
  return result;
}

- (void)deactivateKeys
{
}

- (void)deactivateKeysWithReason:(id)a3 force:(BOOL)a4
{
  BOOL v5 = a4;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = +[UIKeyboardImpl activeInstance];
  [v8 clearLongPressTimer];

  [(UIKBKeyplaneView *)self cancelDelayedDeactivation];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v9 = [(NSMutableDictionary *)self->_delayedDeactivationKeys allValues];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v4 = *(void **)v39;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void **)v39 != v4) {
          objc_enumerationMutation(v9);
        }
        [(UIKBKeyplaneView *)self setState:2 forKey:*(void *)(*((void *)&v38 + 1) + 8 * i) withReason:v7 force:v5];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v38 objects:v44 count:16];
    }
    while (v11);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v13 = [(NSMutableDictionary *)self->_activeViewIndex allValues];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v34 objects:v43 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v35 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v4 = [*(id *)(*((void *)&v34 + 1) + 8 * j) key];
        [(UIKBKeyplaneView *)self setState:2 forKey:v4 withReason:v7 force:v5];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v34 objects:v43 count:16];
    }
    while (v15);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = [(UIView *)self subviews];
  uint64_t v18 = [obj countByEnumeratingWithState:&v30 objects:v42 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v31;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v31 != v20) {
          objc_enumerationMutation(obj);
        }
        double v22 = *(void **)(*((void *)&v30 + 1) + 8 * k);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          double v23 = [v22 key];
          int v24 = [v23 state];

          if (v24 == 16 || v24 == 4)
          {
            uint64_t v4 = [v22 key];
            int v26 = [v4 avoidAutoDeactivation] ^ 1;
          }
          else
          {
            int v26 = 0;
          }
          if (v24 == 16 || v24 == 4) {

          }
          if (v26)
          {
            double v28 = [v22 key];
            [(UIKBKeyplaneView *)self setState:2 forKey:v28 withReason:v7 force:v5];
          }
        }
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v30 objects:v42 count:16];
    }
    while (v19);
  }
}

- (void)activateKeys
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v3 = [(NSMutableDictionary *)self->_activeViewIndex allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * v7);
        id v9 = [(UIView *)self window];
        uint64_t v10 = [v9 rootViewController];
        uint64_t v11 = [v10 view];

        [v11 addSubview:v8];
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

- (void)purgeActiveKeyViews
{
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  renderedKeyViews = self->_renderedKeyViews;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__UIKBKeyplaneView_purgeActiveKeyViews__block_invoke;
  v6[3] = &unk_1E52F9F58;
  id v7 = v3;
  id v5 = v3;
  [(NSMutableDictionary *)renderedKeyViews enumerateKeysAndObjectsUsingBlock:v6];
  [(NSMutableDictionary *)self->_renderedKeyViews removeObjectsForKeys:v5];
}

void __39__UIKBKeyplaneView_purgeActiveKeyViews__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"_%d", 4);
  int v7 = [v8 hasSuffix:v6];

  if (v7)
  {
    [v5 removeFromSuperview];
    [*(id *)(a1 + 32) addObject:v8];
  }
}

- (void)purgeKeyViews
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  BOOL v3 = [(NSMutableDictionary *)self->_activeViewIndex allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v49 objects:v56 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v50 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        id v9 = [v8 key];
        if ([v9 interactionType] == 2)
        {
        }
        else
        {
          uint64_t v10 = [v8 key];
          int v11 = [v10 interactionType];

          if (v11 != 15) {
            continue;
          }
        }
        [v8 removeFromSuperview];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v49 objects:v56 count:16];
    }
    while (v5);
  }

  [(UIKBKeyplaneView *)self deactivateKeysWithReason:@"purgeKeyViews" force:1];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v12 = self;
  long long v13 = [(NSMutableDictionary *)self->_subviewIndex allValues];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v45 objects:v55 count:16];
  if (!v14) {
    goto LABEL_23;
  }
  uint64_t v15 = v14;
  uint64_t v16 = *(void *)v46;
  do
  {
    for (uint64_t j = 0; j != v15; ++j)
    {
      if (*(void *)v46 != v16) {
        objc_enumerationMutation(v13);
      }
      uint64_t v18 = *(void **)(*((void *)&v45 + 1) + 8 * j);
      uint64_t v19 = [v18 key];
      if ([v19 isHashed])
      {
      }
      else
      {
        uint64_t v20 = [(UIKBTree *)v12->_keyplane keys];
        id v21 = [v18 key];
        char v22 = [v20 containsObject:v21];

        if (v22) {
          continue;
        }
      }
      [v18 removeFromSuperview];
    }
    uint64_t v15 = [v13 countByEnumeratingWithState:&v45 objects:v55 count:16];
  }
  while (v15);
LABEL_23:

  double v23 = [(UIKBKeyplaneView *)v12 keyViewAnimator];
  int v24 = [v23 shouldPurgeKeyViews];

  if (v24)
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v25 = [(UIView *)v12 subviews];
    uint64_t v26 = [v25 countByEnumeratingWithState:&v41 objects:v54 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v42;
      do
      {
        for (uint64_t k = 0; k != v27; ++k)
        {
          if (*(void *)v42 != v28) {
            objc_enumerationMutation(v25);
          }
          long long v30 = *(void **)(*((void *)&v41 + 1) + 8 * k);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v30 removeFromSuperview];
          }
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v41 objects:v54 count:16];
      }
      while (v27);
    }
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v31 = [(NSMutableDictionary *)v12->_renderedKeyViews allValues];
  uint64_t v32 = [v31 countByEnumeratingWithState:&v37 objects:v53 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v38;
    do
    {
      for (uint64_t m = 0; m != v33; ++m)
      {
        if (*(void *)v38 != v34) {
          objc_enumerationMutation(v31);
        }
        long long v36 = *(void **)(*((void *)&v37 + 1) + 8 * m);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v36 removeFromSuperview];
        }
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v37 objects:v53 count:16];
    }
    while (v33);
  }

  [(NSMutableDictionary *)v12->_renderedKeyViews removeAllObjects];
}

- (void)purgeSubviews
{
  BOOL v3 = [(NSMutableDictionary *)self->_subviewIndex allValues];
  [v3 makeObjectsPerformSelector:sel_removeFromSuperview];

  subviewIndedouble x = self->_subviewIndex;
  [(NSMutableDictionary *)subviewIndex removeAllObjects];
}

- (void)purgeLayerContents
{
  [(UIKBSplitImageView *)self->_keyCaps clearImages];
  [(UIKBSplitImageView *)self->_keyBackgrounds clearImages];
  keyBorders = self->_keyBorders;
  [(UIKBSplitImageView *)keyBorders clearImages];
}

- (void)purgeFactory
{
  factordouble y = self->_factory;
  self->_factordouble y = 0;
}

- (void)_updateKeyplaneMaskView
{
  BOOL v3 = +[UIKeyboardCache sharedInstance];
  uint64_t v4 = [(UIKBTree *)self->_keyplane layoutName];
  id v7 = [v3 displayImagesForView:self fromLayout:v4 imageFlags:&unk_1ED3F0130];

  uint64_t v5 = [v7 objectForKey:&unk_1ED3F4938];
  uint64_t v6 = [[UIImageView alloc] initWithImage:v5];
  [(UIView *)self->_keyplaneMaskView setMaskView:v6];
}

- (UIView)keyplaneMaskView
{
  keyplaneMaskView = self->_keyplaneMaskView;
  if (!keyplaneMaskView)
  {
    uint64_t v4 = [UIImageView alloc];
    [(UIView *)self bounds];
    uint64_t v5 = -[UIImageView initWithFrame:](v4, "initWithFrame:");
    uint64_t v6 = self->_keyplaneMaskView;
    self->_keyplaneMaskView = v5;

    [(UIView *)self->_keyplaneMaskView setUserInteractionEnabled:0];
    [(UIView *)self->_keyplaneMaskView setClipsToBounds:1];
    [(UIView *)self insertSubview:self->_keyplaneMaskView above:self->_keyBackgrounds];
    [(UIKBKeyplaneView *)self _updateKeyplaneMaskView];
    keyplaneMaskView = self->_keyplaneMaskView;
  }
  return keyplaneMaskView;
}

- (BOOL)_shouldUseUnifiedKeyView:(id)a3 forState:(int)a4
{
  return 0;
}

- (UIKBTree)keyplane
{
  return self->_keyplane;
}

- (void)setKeyplane:(id)a3
{
}

- (UIKBTree)defaultKeyplane
{
  return self->_defaultKeyplane;
}

- (void)setDefaultKeyplane:(id)a3
{
}

- (UIKBCacheToken)cacheToken
{
  return self->_cacheToken;
}

- (void)setCacheToken:(id)a3
{
}

- (UIKBCacheToken)defaultKeyplaneCacheToken
{
  return self->_defaultKeyplaneCacheToken;
}

- (void)setDefaultKeyplaneCacheToken:(id)a3
{
}

- (UIKBRenderConfig)renderConfig
{
  return self->_renderConfig;
}

- (UIKBRenderingContext)renderingContext
{
  return self->_renderingContext;
}

- (void)setFactory:(id)a3
{
}

- (UIKBKeyViewAnimator)keyViewAnimator
{
  return self->_keyViewAnimator;
}

- (void)setKeyViewAnimator:(id)a3
{
}

- (UIKeyboardEmojiKeyDisplayController)emojiKeyManager
{
  return self->_emojiKeyManager;
}

- (void)setEmojiKeyManager:(id)a3
{
}

- (UIKBScreenTraits)overrideScreenTraits
{
  return self->_overrideScreenTraits;
}

- (void)setOverrideScreenTraits:(id)a3
{
}

- (UIKBKeyplaneViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UIKBKeyplaneViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)suppressDrawing
{
  return self->_suppressDrawing;
}

- (void)setSuppressDrawing:(BOOL)a3
{
  self->_suppressDrawing = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_overrideScreenTraits, 0);
  objc_storeStrong((id *)&self->_keyplaneMaskView, 0);
  objc_storeStrong((id *)&self->_keyCaps, 0);
  objc_storeStrong((id *)&self->_keyBackgrounds, 0);
  objc_storeStrong((id *)&self->_keyBorders, 0);
  objc_storeStrong((id *)&self->_factory, 0);
  objc_storeStrong((id *)&self->_renderingContext, 0);
  objc_storeStrong((id *)&self->_renderConfig, 0);
  objc_storeStrong((id *)&self->_delayedDeactivationKeys, 0);
  objc_storeStrong((id *)&self->_renderedKeyViews, 0);
  objc_storeStrong((id *)&self->_activeViewIndex, 0);
  objc_storeStrong((id *)&self->_subviewIndex, 0);
  objc_storeStrong((id *)&self->_candidateGapView, 0);
  objc_storeStrong((id *)&self->_emojiKeyManager, 0);
  objc_storeStrong((id *)&self->_keyViewAnimator, 0);
  objc_storeStrong((id *)&self->_defaultKeyplaneCacheToken, 0);
  objc_storeStrong((id *)&self->_cacheToken, 0);
  objc_storeStrong((id *)&self->_defaultKeyplane, 0);
  objc_storeStrong((id *)&self->_keyplane, 0);
}

@end