@interface UIKBKeyView
+ (BOOL)wantsScreenTraits;
- (BOOL)_canDrawContent;
- (BOOL)_isActivePopupKey;
- (BOOL)_shouldUpdateLayers;
- (BOOL)_viewShouldBeOpaque;
- (BOOL)allowBackgroundCachingForRenderFlags:(int64_t)a3;
- (BOOL)cacheDeferable;
- (BOOL)cachedControlKeyRenderingPreference;
- (BOOL)containedInDynamicKey;
- (BOOL)displaysColorImage;
- (BOOL)hasRendered;
- (BOOL)isDynamicKey;
- (BOOL)keepNonPersistent;
- (BOOL)renderAsMask;
- (BOOL)requiresSublayers;
- (CGRect)drawFrame;
- (CGRect)variantFrame;
- (NSString)cacheKey;
- (NSString)cachedTraitsHashString;
- (UIEdgeInsets)displayInsets;
- (UIKBKeyView)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5;
- (UIKBKeyView)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5 screenTraits:(id)a6;
- (UIKBRenderConfig)renderConfig;
- (UIKBRenderFactory)factory;
- (UIKBScreenTraits)screenTraits;
- (UIKBTree)key;
- (UIKBTree)keyplane;
- (UIKeyboardMenuView)popupMenu;
- (double)endingTransitionDuration;
- (id)_generateBackdropAndBorderMaskImage;
- (id)cacheKeysForRenderFlags:(id)a3;
- (id)layerForRenderFlags:(int64_t)a3;
- (id)renderFlagsForTraits:(id)a3;
- (id)subTreeHitTest:(CGPoint)a3;
- (int)textEffectsVisibilityLevel;
- (int64_t)assetIdiom;
- (int64_t)cachedRenderFlags;
- (int64_t)cachedSelector;
- (int64_t)didInputSubTree:(id)a3;
- (int64_t)imageOrientationForLayer:(id)a3;
- (unint64_t)cachedAnchorCorner;
- (unint64_t)cachedShiftState;
- (unint64_t)focusableVariantCount;
- (void)_populateLayer:(id)a3 withContents:(id)a4;
- (void)changeBackgroundToActiveIfNecessary;
- (void)changeBackgroundToEnabled;
- (void)configureBackdropView:(id)a3 forRenderConfig:(id)a4;
- (void)dealloc;
- (void)dimKeys:(id)a3;
- (void)displayLayer:(id)a3;
- (void)drawContentsOfRenderers:(id)a3;
- (void)hideKeyCap:(BOOL)a3;
- (void)orientKeyCap:(int64_t)a3;
- (void)prepareForDisplay;
- (void)removeFromSuperview;
- (void)resetRenderedKeyState;
- (void)setCachedAnchorCorner:(unint64_t)a3;
- (void)setCachedControlKeyRenderingPreference:(BOOL)a3;
- (void)setCachedSelector:(int64_t)a3;
- (void)setCachedShiftState:(unint64_t)a3;
- (void)setCachedTraitsHashString:(id)a3;
- (void)setContainedInDynamicKey:(BOOL)a3;
- (void)setDrawFrame:(CGRect)a3;
- (void)setEndingTransitionDuration:(double)a3;
- (void)setFactory:(id)a3;
- (void)setPopupMenu:(id)a3;
- (void)setRenderAsMask:(BOOL)a3;
- (void)setRenderConfig:(id)a3;
- (void)setScreenTraits:(id)a3;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)updateForKeyplane:(id)a3 key:(id)a4;
- (void)updateKeySelectedVariantIndex:(int64_t)a3;
- (void)updateKeySubtrees:(id)a3;
- (void)willDisplayModalActionView:(id)a3 withSubTreeKeyView:(id)a4 completion:(id)a5;
@end

@implementation UIKBKeyView

+ (BOOL)wantsScreenTraits
{
  return 0;
}

- (UIKBKeyView)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v12 = a4;
  id v13 = a5;
  v21.receiver = self;
  v21.super_class = (Class)UIKBKeyView;
  v14 = -[UIView initWithFrame:](&v21, sel_initWithFrame_, x, y, width, height);
  v15 = v14;
  if (v14)
  {
    [(UIView *)v14 setEnabled:0];
    v15->_cachedBackgroundOpacitdouble y = 1.0;
    objc_storeStrong((id *)&v15->m_keyplane, a4);
    objc_storeStrong((id *)&v15->m_key, a5);
    [(UIView *)v15 setOpaque:[(UIKBKeyView *)v15 _viewShouldBeOpaque]];
    v15->_containedInDynamicKedouble y = 0;
    if ([v13 interactionType] == 6)
    {
      v16 = [v13 name];
      if ([v16 rangeOfString:@"HWR"] == 0x7FFFFFFFFFFFFFFFLL)
      {
        int v17 = [v13 displayTypeHint];

        if (v17 != 11)
        {
          if (+[UIKeyboardImpl rivenTranslationPreference]) {
            uint64_t v18 = 9;
          }
          else {
            uint64_t v18 = 0;
          }
          [(UIKBTree *)v15->m_key setDisplayTypeHint:v18];
        }
      }
      else
      {
      }
    }
    v19 = v15;
  }

  return v15;
}

- (UIKBKeyView)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5 screenTraits:(id)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v14 = a6;
  v15 = -[UIKBKeyView initWithFrame:keyplane:key:](self, "initWithFrame:keyplane:key:", a4, a5, x, y, width, height);
  v16 = v15;
  if (v15) {
    objc_storeStrong((id *)&v15->_screenTraits, a6);
  }

  return v16;
}

- (void)updateForKeyplane:(id)a3 key:(id)a4
{
  id v8 = a3;
  id v7 = a4;
  if (v7) {
    objc_storeStrong((id *)&self->m_key, a4);
  }
  if (v8) {
    objc_storeStrong((id *)&self->m_keyplane, a3);
  }
  [(UIView *)self setOpaque:[(UIKBKeyView *)self _viewShouldBeOpaque]];
}

- (void)updateKeySelectedVariantIndex:(int64_t)a3
{
}

- (void)updateKeySubtrees:(id)a3
{
}

- (void)dealloc
{
  v3 = +[UIKeyboardCache sharedInstance];
  [v3 decrementExpectedRender:self];

  activeBackgroundColor = self->_activeBackgroundColor;
  if (activeBackgroundColor)
  {
    CGColorRelease(activeBackgroundColor);
    self->_activeBackgroundColor = 0;
  }
  id activeCompositingFilter = self->_activeCompositingFilter;
  if (activeCompositingFilter)
  {
    CFRelease(activeCompositingFilter);
    id v6 = self->_activeCompositingFilter;
    self->_id activeCompositingFilter = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)UIKBKeyView;
  [(UIView *)&v7 dealloc];
}

- (int)textEffectsVisibilityLevel
{
  v2 = +[UIKeyboardImpl activeInstance];
  int v3 = [v2 isDictationPopoverPresented];

  if (v3) {
    return 301;
  }
  else {
    return 200;
  }
}

- (CGRect)variantFrame
{
  int v3 = [(UIKBKeyView *)self key];
  uint64_t v4 = [v3 popupDirection];

  [(UIKBKeyView *)self drawFrame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  if (v4 != 3)
  {
    id v13 = [(UIKBKeyView *)self key];
    [v13 frame];
    double v6 = v6 + 0.0;
    double v8 = v8 + 0.0;
    double v12 = v12 - (v14 + 0.0);
  }
  double v15 = v6;
  double v16 = v8;
  double v17 = v10;
  double v18 = v12;
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.double y = v16;
  result.origin.double x = v15;
  return result;
}

- (BOOL)_viewShouldBeOpaque
{
  return 0;
}

- (BOOL)isDynamicKey
{
  return 0;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = +[UIInputSwitcherView sharedInstance];
  double v5 = [v6 superview];

  if (v5 == self) {
    [v6 hide];
  }
}

- (unint64_t)focusableVariantCount
{
  v2 = [(UIKBKeyView *)self key];
  int v3 = [v2 subtrees];
  unint64_t v4 = [v3 count];

  return v4;
}

- (id)subTreeHitTest:(CGPoint)a3
{
  return 0;
}

- (int64_t)didInputSubTree:(id)a3
{
  return 0;
}

- (void)willDisplayModalActionView:(id)a3 withSubTreeKeyView:(id)a4 completion:(id)a5
{
  if (a5) {
    (*((void (**)(id))a5 + 2))(a5);
  }
}

- (void)dimKeys:(id)a3
{
  id v4 = a3;
  keyLayers = self->_keyLayers;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __23__UIKBKeyView_dimKeys___block_invoke;
  v7[3] = &unk_1E52F9DB0;
  id v8 = v4;
  double v9 = self;
  id v6 = v4;
  [(NSMutableDictionary *)keyLayers enumerateKeysAndObjectsUsingBlock:v7];
}

void __23__UIKBKeyView_dimKeys___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 integerValue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __23__UIKBKeyView_dimKeys___block_invoke_2;
  v9[3] = &unk_1E52F9D88;
  id v10 = v5;
  uint64_t v11 = v6;
  double v7 = *(void **)(a1 + 32);
  v9[4] = *(void *)(a1 + 40);
  id v8 = v5;
  [v7 enumerateKeysAndObjectsUsingBlock:v9];
}

void __23__UIKBKeyView_dimKeys___block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v10 = a3;
  BOOL v7 = (*(void *)(a1 + 48) & [a2 integerValue]) == 0;
  id v8 = v10;
  if (!v7)
  {
    [v10 floatValue];
    if (*(unsigned char *)(a1 + 48)) {
      *(double *)(*(void *)(a1 + 32) + 528) = v9;
    }
    objc_msgSend(*(id *)(a1 + 40), "setOpacity:");
    *a4 = 1;
    id v8 = v10;
  }
}

- (void)hideKeyCap:(BOOL)a3
{
  keyLayers = self->_keyLayers;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __26__UIKBKeyView_hideKeyCap___block_invoke;
  v4[3] = &__block_descriptor_33_e34_v32__0__NSNumber_8__CALayer_16_B24l;
  BOOL v5 = a3;
  [(NSMutableDictionary *)keyLayers enumerateKeysAndObjectsUsingBlock:v4];
}

void __26__UIKBKeyView_hideKeyCap___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a3;
  if (([a2 integerValue] & 0x34) != 0)
  {
    [v7 setHidden:*(unsigned __int8 *)(a1 + 32)];
    *a4 = 1;
  }
}

- (void)orientKeyCap:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  keyLayers = self->_keyLayers;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __28__UIKBKeyView_orientKeyCap___block_invoke;
  v16[3] = &__block_descriptor_40_e34_v32__0__NSNumber_8__CALayer_16_B24l;
  v16[4] = a3;
  [(NSMutableDictionary *)keyLayers enumerateKeysAndObjectsUsingBlock:v16];
  [(UIKBKeyView *)self updateKeycapLayerOrientation];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [(UIView *)self subviews];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v11 orientKeyCap:a3];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v8);
  }
}

void __28__UIKBKeyView_orientKeyCap___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ([v6 integerValue] & 0x34) != 0) {
    [v5 setImageOrientation:*(void *)(a1 + 32)];
  }
}

- (UIEdgeInsets)displayInsets
{
  [(UIKBKeyView *)self drawFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(UIKBTree *)self->m_key paddedFrame];
  double v12 = v6 - v11;
  double v14 = v11 + v13 - (v6 + v10);
  double v16 = v4 - v15;
  double v18 = v15 + v17 - (v4 + v8);
  double v19 = v12;
  double v20 = v14;
  result.right = v18;
  result.bottom = v20;
  result.left = v16;
  result.top = v19;
  return result;
}

- (NSString)cacheKey
{
  if (([(UIKBKeyView *)self cachedRenderFlags] & 4) != 0)
  {
    double v4 = +[UIKBCacheToken tokenForKey:self->m_key style:[(UIKBTree *)self->m_keyplane visualStyling]];
    double v3 = [v4 string];
  }
  else
  {
    double v3 = 0;
  }
  return (NSString *)v3;
}

- (id)cacheKeysForRenderFlags:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = [(UIKBKeyView *)self cachedRenderFlags];
  BOOL v6 = [(UIKBTree *)self->m_key interactionType] == 2 && [(UIKBTree *)self->m_key state] == 16;
  BOOL v54 = v6;
  if (![(UIKBKeyView *)self renderAsMask] || v6)
  {
    if (!v5)
    {
LABEL_57:
      id v56 = 0;
      goto LABEL_58;
    }
    if (v5 == 255)
    {
      +[UIKBCacheToken tokenForKey:self->m_key style:[(UIKBTree *)self->m_keyplane visualStyling]];
    }
    else
    {
      m_kedouble y = self->m_key;
      uint64_t v11 = (uint64_t)[(UIKBTree *)self->m_keyplane visualStyling];
      [(UIKBKeyView *)self displayInsets];
      +[UIKBCacheToken tokenForKey:style:displayInsets:](UIKBCacheToken, "tokenForKey:style:displayInsets:", m_key, v11);
    uint64_t v9 = };
  }
  else
  {
    double v7 = self->m_key;
    uint64_t v8 = (uint64_t)[(UIKBTree *)self->m_keyplane visualStyling];
    [(UIKBKeyView *)self displayInsets];
    uint64_t v9 = +[UIKBCacheToken tokenForKeyMask:style:displayInsets:](UIKBCacheToken, "tokenForKeyMask:style:displayInsets:", v7, v8);
  }
  v55 = (void *)v9;
  if (!v9) {
    goto LABEL_57;
  }
  if ([(UIKBTree *)self->m_key isRightToLeftSensitive])
  {
    double v12 = +[UIKeyboardInputModeController sharedInputModeController];
    double v13 = [v12 currentLinguisticInputMode];
    objc_msgSend(v55, "annotateWithBool:", objc_msgSend(v13, "isDefaultRightToLeft"));
  }
  if (([v55 styling] & 0x3F) == 3) {
    [v55 annotateWithBool:UIKeyboardCarPlayIsRightHandDrive()];
  }
  if ([(UIKBKeyView *)self cachedSelector]) {
    objc_msgSend(v55, "annotateWithInt:", -[UIKBKeyView cachedSelector](self, "cachedSelector"));
  }
  if (([v55 styling] & 0x3F) == 0x17 || (objc_msgSend(v55, "styling") & 0x3F) == 0x18)
  {
    if ([(UIKBKeyView *)self cachedAnchorCorner]) {
      objc_msgSend(v55, "annotateWithInt:", -[UIKBKeyView cachedAnchorCorner](self, "cachedAnchorCorner"));
    }
    if ([(UIKBKeyView *)self cachedShiftState] <= 4) {
      objc_msgSend(v55, "annotateWithInt:", -[UIKBKeyView cachedShiftState](self, "cachedShiftState"));
    }
    if ([(UIKBKeyView *)self cachedControlKeyRenderingPreference]) {
      objc_msgSend(v55, "annotateWithBool:", -[UIKBKeyView cachedControlKeyRenderingPreference](self, "cachedControlKeyRenderingPreference"));
    }
  }
  if ([(UIKBTree *)self->m_key displayType] == 7)
  {
    double v14 = +[UIKeyboardPreferencesController sharedPreferencesController];
    double v15 = [v14 preferencesActions];
    int v16 = [v15 BOOLForPreferenceKey:@"GesturesEnabled"];

    if (v16) {
      objc_msgSend(v55, "annotateWithBool:", -[UIKBTree isShiftKeyplane](self->m_keyplane, "isShiftKeyplane"));
    }
  }
  double v17 = v55;
  if ((([(UIKBTree *)self->m_keyplane visualStyling] & 0x3F) == 1
     || ([(UIKBTree *)self->m_keyplane visualStyling] & 0x3F) == 0x17
     || ([(UIKBTree *)self->m_keyplane visualStyling] & 0x3F) == 0x18
     || ([(UIKBTree *)self->m_keyplane visualStyling] & 0x3F) == 0x19
     || ([(UIKBTree *)self->m_keyplane visualStyling] & 0x3F) == 0x1A)
    && ([(UIKBTree *)self->m_keyplane visualStyling] & 0xFF0000) == 0xB0000)
  {
    [(UIKBTree *)self->m_key frame];
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    [(UIKBTree *)self->m_key paddedFrame];
    v66.origin.double x = v26;
    v66.origin.double y = v27;
    v66.size.double width = v28;
    v66.size.double height = v29;
    v65.origin.double x = v19;
    v65.origin.double y = v21;
    v65.size.double width = v23;
    v65.size.double height = v25;
    objc_msgSend(v55, "annotateWithBool:", CGRectEqualToRect(v65, v66));
  }
  v30 = [(UIKBKeyView *)self renderConfig];
  v31 = [v30 controlKeyBackgroundName];

  if (v31)
  {
    v32 = [(UIKBKeyView *)self renderConfig];
    v33 = [v32 controlKeyBackgroundName];
    objc_msgSend(v55, "annotateWithInt:", objc_msgSend(v33, "hash"));
  }
  objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  id v56 = (id)objc_claimAutoreleasedReturnValue();
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v53 = v4;
  id obj = v4;
  uint64_t v34 = [obj countByEnumeratingWithState:&v58 objects:v62 count:16];
  BOOL v35 = v54;
  if (v34)
  {
    uint64_t v36 = v34;
    uint64_t v37 = *(void *)v59;
    do
    {
      uint64_t v38 = 0;
      do
      {
        if (*(void *)v59 != v37) {
          objc_enumerationMutation(obj);
        }
        v39 = *(void **)(*((void *)&v58 + 1) + 8 * v38);
        uint64_t v40 = [v39 integerValue];
        if ([(UIKBKeyView *)self renderAsMask] && !v35)
        {
          v46 = [v17 string];
          if (!v46) {
            goto LABEL_51;
          }
LABEL_50:
          [v56 setObject:v46 forKey:v39];

          goto LABEL_51;
        }
        uint64_t v41 = v40 & v5;
        if (!v41) {
          goto LABEL_51;
        }
        if ([(UIKBKeyView *)self allowBackgroundCachingForRenderFlags:v41])
        {
          int64_t v42 = v5;
          v43 = [(UIKBKeyView *)self renderConfig];
          v44 = +[UIKBRenderingContext renderingContextForRenderConfig:v43];

          v45 = [(UIKBKeyView *)self cachedTraitsHashString];
          v46 = +[UIKBRenderFactory cacheKeyForString:v45 withRenderFlags:v41 renderingContext:v44];

          int64_t v5 = v42;
          BOOL v35 = v54;
          double v17 = v55;
          if (v46) {
            goto LABEL_50;
          }
        }
        else
        {
          uint64_t v47 = [v39 integerValue];
          v48 = [(UIKBKeyView *)self renderConfig];
          uint64_t v49 = [v48 lightKeyboard];
          uint64_t v50 = v47;
          double v17 = v55;
          v46 = [v55 stringForRenderFlags:v50 lightKeyboard:v49];

          if (v46) {
            goto LABEL_50;
          }
        }
LABEL_51:
        ++v38;
      }
      while (v36 != v38);
      uint64_t v51 = [obj countByEnumeratingWithState:&v58 objects:v62 count:16];
      uint64_t v36 = v51;
    }
    while (v51);
  }

  id v4 = v53;
LABEL_58:

  return v56;
}

- (BOOL)allowBackgroundCachingForRenderFlags:(int64_t)a3
{
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1
    || [(UIKBKeyView *)self containedInDynamicKey]
    && [(UIKBKeyView *)self _isActivePopupKey])
  {
    return 0;
  }
  BOOL v6 = [(UIKBKeyView *)self cachedTraitsHashString];
  BOOL v5 = (unint64_t)a3 < 4 && v6 != 0;

  return v5;
}

- (int64_t)cachedRenderFlags
{
  m_allowsCaching = self->m_allowsCaching;
  if (!m_allowsCaching)
  {
    unsigned int v4 = [(UIKBTree *)self->m_key displayType];
    BOOL v5 = v4 > 0x37 || ((1 << v4) & 0x80003000001000) == 0;
    if (!v5
      || ((unsigned int v14 = v4, v15 = [(UIKBTree *)self->m_keyplane visualStyling] & 0xFF00, v14 != 56)
        ? (BOOL v16 = v15 == 32512)
        : (BOOL v16 = 1),
          v16
       || v14 == 4
       && ([(UIKBKeyView *)self renderConfig],
           double v17 = objc_claimAutoreleasedReturnValue(),
           int v18 = [v17 animatedBackground],
           v17,
           v18)))
    {
      BOOL v6 = (__CFBoolean **)MEMORY[0x1E4F1CFC8];
    }
    else
    {
      BOOL v6 = (__CFBoolean **)MEMORY[0x1E4F1CFD0];
    }
    m_allowsCaching = *v6;
    self->m_allowsCaching = m_allowsCaching;
  }
  if (m_allowsCaching == (__CFBoolean *)*MEMORY[0x1E4F1CFC8]) {
    return 0;
  }
  int v7 = [(UIKBTree *)self->m_key state];
  int64_t result = 255;
  if (v7 > 15)
  {
    if (v7 > 31)
    {
      if (v7 == 32 || v7 == 64) {
        return result;
      }
    }
    else if (v7 == 16 || v7 == 20)
    {
LABEL_22:
      if ([(UIKBKeyView *)self containedInDynamicKey]) {
        return 3;
      }
      else {
        return 0;
      }
    }
    return 0;
  }
  switch(v7)
  {
    case 1:
    case 8:
      return result;
    case 2:
      uint64_t v9 = [(UIKBTree *)self->m_key name];
      char v10 = [v9 isEqualToString:@"LanguageIndicator"];

      if (v10) {
        return 0;
      }
      if ([(UIKBTree *)self->m_key displayType] != 13) {
        return 255;
      }
      uint64_t v11 = [(UIKBTree *)self->m_key overrideDisplayString];
      int v12 = [v11 isEqualToString:@"emoji"];

      if (v12) {
        return 3;
      }
      else {
        return 255;
      }
    case 4:
      if ([(UIKBTree *)self->m_key displayType] == 14
        || [(UIKBTree *)self->m_key displayType] == 11
        || [(UIKBTree *)self->m_key displayType] == 47
        || [(UIKBTree *)self->m_key displayType] == 48
        || [(UIKBTree *)self->m_key interactionType] == 16)
      {
        return 255;
      }
      if ([(UIKBTree *)self->m_key interactionType] != 2
        || (UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
      {
        goto LABEL_22;
      }
      int64_t result = 3;
      break;
    default:
      return 0;
  }
  return result;
}

- (UIKBRenderFactory)factory
{
  m_factordouble y = self->m_factory;
  if (!m_factory)
  {
    unsigned int v4 = [(UIKBKeyView *)self renderConfig];
    BOOL v5 = +[UIKBRenderingContext renderingContextForRenderConfig:v4];

    BOOL v6 = +[UIKeyboardImpl activeInstance];
    int v7 = [v6 textInputTraits];
    objc_msgSend(v5, "setKeyboardType:", objc_msgSend(v7, "keyboardType"));

    objc_msgSend(v5, "setIsFloating:", -[UIKBTree isFloating](self->m_keyplane, "isFloating"));
    uint64_t v8 = +[UIKBRenderFactory factoryForVisualStyle:[(UIKBTree *)self->m_keyplane visualStyling] renderingContext:v5];
    uint64_t v9 = self->m_factory;
    self->m_factordouble y = v8;

    [(UIView *)self contentScaleFactor];
    -[UIKBRenderFactory setScale:](self->m_factory, "setScale:");
    screenTraits = self->_screenTraits;
    if (screenTraits)
    {
      [(UIKBScreenTraits *)screenTraits stretchFactor];
      double v13 = self->m_factory;
    }
    else
    {
      double v13 = self->m_factory;
      double v11 = 1.0;
      double v12 = 1.0;
    }
    -[UIKBRenderFactory setStretchFactor:](v13, "setStretchFactor:", v11, v12);

    m_factordouble y = self->m_factory;
  }
  return m_factory;
}

- (BOOL)hasRendered
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v3 = [(UIView *)self layer];
  unsigned int v4 = [v3 sublayers];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = [*(id *)(*((void *)&v11 + 1) + 8 * i) contents];

        if (!v8)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  int renderedKeyState = self->_renderedKeyState;
  if (renderedKeyState == [(UIKBTree *)self->m_key state]) {
    return v5;
  }
  else {
    return 0;
  }
}

- (BOOL)_shouldUpdateLayers
{
  if ([(UIKBKeyView *)self containedInDynamicKey]) {
    return ![(UIKBKeyView *)self _isActivePopupKey];
  }
  int renderedKeyState = self->_renderedKeyState;
  return renderedKeyState != [(UIKBTree *)self->m_key state]
      || ([(UIKBTree *)self->m_key state] & 0x10) != 0
      || [(UIKBTree *)self->m_key dynamicDisplayTypeHint]
      || self->_singleRerender
      || [(UIKBTree *)self->m_key rendering] == 38
      || [(UIKBTree *)self->m_key rendering] == 9;
}

- (BOOL)requiresSublayers
{
  return 1;
}

- (void)prepareForDisplay
{
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  char v27 = 0;
  double v3 = [(UIKBKeyView *)self factory];
  unsigned int v4 = [v3 traitsForKey:self->m_key onKeyplane:self->m_keyplane];

  uint64_t v5 = [(UIKBKeyView *)self renderFlagsForTraits:v4];
  keyLayers = self->_keyLayers;
  if (!keyLayers) {
    goto LABEL_5;
  }
  int v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = [(NSMutableDictionary *)keyLayers allKeys];
  uint64_t v9 = [v7 setWithArray:v8];
  char v10 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
  int v11 = [v9 isEqualToSet:v10];

  if (!v11
    || [(UIKBKeyView *)self requiresSublayers]
    && (int renderedKeyState = self->_renderedKeyState, renderedKeyState != [(UIKBTree *)self->m_key state]))
  {
LABEL_5:
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v14 = [MEMORY[0x1E4F1CA48] array];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __32__UIKBKeyView_prepareForDisplay__block_invoke;
    v22[3] = &unk_1E52F9E18;
    v22[4] = self;
    CGFloat v25 = v26;
    id v15 = v13;
    id v23 = v15;
    id v16 = v14;
    id v24 = v16;
    [v5 enumerateObjectsWithOptions:2 usingBlock:v22];
    double v17 = self->_keyLayers;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __32__UIKBKeyView_prepareForDisplay__block_invoke_2;
    v20[3] = &unk_1E52F9E40;
    id v18 = v16;
    id v21 = v18;
    [(NSMutableDictionary *)v17 enumerateKeysAndObjectsUsingBlock:v20];
    objc_storeStrong((id *)&self->_keyLayers, v13);
    if (!self->_renderedKeyState)
    {
      CGFloat v19 = +[UIKeyboardCache sharedInstance];
      [v19 incrementExpectedRender:self];
    }
  }

  _Block_object_dispose(v26, 8);
}

void __32__UIKBKeyView_prepareForDisplay__block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  uint64_t v3 = [v8 unsignedIntegerValue];
  unsigned int v4 = *(void **)(*(void *)(a1 + 32) + 480);
  uint64_t v5 = [NSNumber numberWithInteger:v3];
  uint64_t v6 = [v4 objectForKey:v5];

  if (!v6)
  {
    uint64_t v6 = +[_UIKBKeyViewLayer layer];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  [*(id *)(a1 + 40) setObject:v6 forKey:v8];
  int v7 = [*(id *)(a1 + 32) layer];
  [v7 insertSublayer:v6 atIndex:0];

  [*(id *)(a1 + 48) addObject:v6];
}

void __32__UIKBKeyView_prepareForDisplay__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0) {
    [v4 removeFromSuperlayer];
  }
}

- (void)removeFromSuperview
{
  uint64_t v3 = +[UIKeyboardCache sharedInstance];
  [v3 decrementExpectedRender:self];

  v4.receiver = self;
  v4.super_class = (Class)UIKBKeyView;
  [(UIView *)&v4 removeFromSuperview];
}

- (id)layerForRenderFlags:(int64_t)a3
{
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__123;
  id v16 = __Block_byref_object_dispose__123;
  keyLayers = self->_keyLayers;
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:");
  id v17 = [(NSMutableDictionary *)keyLayers objectForKey:v6];

  int v7 = (void *)v13[5];
  if (!v7)
  {
    id v8 = self->_keyLayers;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __35__UIKBKeyView_layerForRenderFlags___block_invoke;
    v11[3] = &unk_1E52F9E68;
    v11[4] = &v12;
    v11[5] = a3;
    [(NSMutableDictionary *)v8 enumerateKeysAndObjectsUsingBlock:v11];
    int v7 = (void *)v13[5];
  }
  id v9 = v7;
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __35__UIKBKeyView_layerForRenderFlags___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a3;
  if ((*(void *)(a1 + 40) & ~[a2 unsignedIntegerValue]) == 0)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    *a4 = 1;
  }
}

- (BOOL)_isActivePopupKey
{
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1
    || [(UIKBTree *)self->m_key state] != 4
    || [(UIKBTree *)self->m_key interactionType] != 2)
  {
    return 0;
  }
  uint64_t v3 = [(UIKBKeyView *)self factory];
  char v4 = [v3 allowsPaddleForKey:self->m_key];

  return v4;
}

- (int64_t)imageOrientationForLayer:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v4 = [v3 imageOrientation];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (void)_populateLayer:(id)a3 withContents:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    memset(&v33, 0, sizeof(v33));
    [v6 affineTransform];
    CGFloat v8 = *MEMORY[0x1E4F1DAD8];
    CGFloat v9 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    char v10 = [(UIView *)self layer];
    [v10 frame];
    CGFloat v12 = v11;
    CGFloat v14 = v13;

    CGAffineTransform v32 = v33;
    v34.origin.double x = v8;
    v34.origin.double y = v9;
    v34.size.double width = v12;
    v34.size.double height = v14;
    CGRect v35 = CGRectApplyAffineTransform(v34, &v32);
    double width = v35.size.width;
    double height = v35.size.height;
    id v17 = [(UIView *)self layer];
    [v17 frame];
    double v19 = (v18 - width) * 0.5;

    double v20 = [(UIView *)self layer];
    [v20 frame];
    double v22 = (v21 - height) * 0.5;

    objc_msgSend(v6, "setFrame:", v19, v22, width, height);
    if (v7)
    {
      id v23 = v7;
      objc_msgSend(v6, "setContents:", objc_msgSend(v23, "CGImage"));
      [(UIView *)self contentScaleFactor];
      objc_msgSend(v6, "setContentsScale:");
      [(UIView *)self contentScaleFactor];
      objc_msgSend(v6, "setRasterizationScale:");
      id v7 = [v23 _imageThatSuppressesAccessibilityHairlineThickening];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(v6, "setImageOrientation:", objc_msgSend(v7, "imageOrientation"));
      }
      if ([v7 imageOrientation] == 1)
      {
        if (v33.d < 0.0) {
          goto LABEL_11;
        }
        CGAffineTransformMakeScale(&v31, 1.0, -1.0);
        CGAffineTransform v30 = v31;
        id v24 = &v30;
      }
      else
      {
        if (v33.d > 0.0) {
          goto LABEL_11;
        }
        long long v25 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
        long long v27 = *MEMORY[0x1E4F1DAB8];
        long long v28 = v25;
        long long v29 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
        id v24 = (CGAffineTransform *)&v27;
      }
      objc_msgSend(v6, "setAffineTransform:", v24, v27, v28, v29, *(_OWORD *)&v30.a, *(_OWORD *)&v30.c, *(_OWORD *)&v30.tx);
LABEL_11:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v26 = [v7 formatColor];
        objc_msgSend(v6, "setContentsMultiplyColor:", objc_msgSend(v26, "CGColor"));
      }
      else
      {
        [v6 setContentsMultiplyColor:UIKBGetNamedColor(@"UIKBColorWhite")];
      }
    }
  }
}

- (id)renderFlagsForTraits:(id)a3
{
  id v4 = a3;
  if ([v4 blendForm] == 1)
  {
    int v5 = [(UIKBTree *)self->m_key state];
    if ([(UIKBTree *)self->m_key displayType] == 3)
    {
      id v6 = &unk_1ED3EFF38;
      id v7 = &unk_1ED3EFF50;
      BOOL v8 = (v5 & 3) == 0;
LABEL_4:
      if (v8) {
        CGFloat v9 = v7;
      }
      else {
        CGFloat v9 = v6;
      }
      goto LABEL_35;
    }
    if ([(UIKBTree *)self->m_key displayType] == 23)
    {
      if (v5 == 8)
      {
        CGFloat v9 = &unk_1ED3EFF68;
        goto LABEL_35;
      }
      id v6 = &unk_1ED3EFF80;
      id v7 = &unk_1ED3EFF98;
      BOOL v8 = (v5 & 0x64) == 0;
      goto LABEL_4;
    }
    if ([v4 renderSecondarySymbolsSeparately])
    {
      id v16 = [v4 secondarySymbolStyles];
      uint64_t v17 = [v16 count];

      if (v17 == 1)
      {
        id v15 = &unk_1ED3EFFB0;
        goto LABEL_23;
      }
      id v24 = [v4 secondarySymbolStyles];
      uint64_t v25 = [v24 count];

      if (v25 != 2)
      {
        CGFloat v9 = &unk_1ED3EFFB0;
        goto LABEL_35;
      }
      double v22 = &unk_1ED3EFFB0;
      id v23 = &unk_1ED3EFFC8;
      goto LABEL_33;
    }
    int v10 = [v4 controlOpacities];
    double v11 = &unk_1ED3EFFF8;
    CGFloat v12 = &unk_1ED3EFFE0;
  }
  else
  {
    if ([v4 blendForm] != 2)
    {
      if ((-[UIKBKeyView cachedRenderFlags](self, "cachedRenderFlags") & 4) != 0 && [v4 blendForm] != 3)
      {
        double v19 = [v4 renderFlags];

        if (v19)
        {
          uint64_t v18 = [v4 renderFlags];
          goto LABEL_34;
        }
        if (![v4 renderSecondarySymbolsSeparately])
        {
          CGFloat v9 = &unk_1ED3F00A0;
          goto LABEL_35;
        }
        long long v27 = [v4 secondarySymbolStyles];
        uint64_t v28 = [v27 count];

        if (v28 == 1)
        {
          id v15 = &unk_1ED3F0070;
          goto LABEL_23;
        }
        long long v29 = [v4 secondarySymbolStyles];
        uint64_t v30 = [v29 count];

        if (v30 != 2)
        {
          CGFloat v9 = &unk_1ED3F0070;
          goto LABEL_35;
        }
        double v22 = &unk_1ED3F0070;
        id v23 = &unk_1ED3F0088;
      }
      else
      {
        if (![v4 renderSecondarySymbolsSeparately]) {
          goto LABEL_30;
        }
        double v13 = [v4 secondarySymbolStyles];
        uint64_t v14 = [v13 count];

        if (v14 == 1)
        {
          id v15 = &unk_1ED3F0040;
LABEL_23:
          uint64_t v18 = [v15 arrayByAddingObject:&unk_1ED3F48A8];
LABEL_34:
          CGFloat v9 = (void *)v18;
          goto LABEL_35;
        }
        double v20 = [v4 secondarySymbolStyles];
        uint64_t v21 = [v20 count];

        if (v21 != 2)
        {
LABEL_30:
          CGFloat v9 = &unk_1ED3F0040;
          goto LABEL_35;
        }
        double v22 = &unk_1ED3F0040;
        id v23 = &unk_1ED3F0058;
      }
LABEL_33:
      uint64_t v18 = [v22 arrayByAddingObjectsFromArray:v23];
      goto LABEL_34;
    }
    int v10 = [v4 controlOpacities];
    double v11 = &unk_1ED3F0028;
    CGFloat v12 = &unk_1ED3F0010;
  }
  if (v10) {
    CGFloat v9 = v12;
  }
  else {
    CGFloat v9 = v11;
  }
LABEL_35:

  return v9;
}

- (void)displayLayer:(id)a3
{
  v67[2] = *MEMORY[0x1E4F143B8];
  id v4 = [(UIView *)self window];

  if (v4)
  {
    if (!self->m_key || ![(UIKBKeyView *)self _shouldUpdateLayers]) {
      goto LABEL_24;
    }
    int v5 = [(UIView *)self layer];
    [v5 setContents:0];

    id v6 = [(UIKBKeyView *)self factory];
    id v7 = [v6 traitsForKey:self->m_key onKeyplane:self->m_keyplane];

    BOOL v8 = [v7 hashString];
    [(UIKBKeyView *)self setCachedTraitsHashString:v8];

    CGFloat v9 = [v7 symbolStyle];
    -[UIKBKeyView setCachedAnchorCorner:](self, "setCachedAnchorCorner:", [v9 anchorCorner]);

    int v10 = [(UIKBKeyView *)self factory];
    double v11 = [v10 renderingContext];
    -[UIKBKeyView setCachedShiftState:](self, "setCachedShiftState:", [v11 shiftState]);

    CGFloat v12 = [v7 symbolStyle];
    -[UIKBKeyView setCachedSelector:](self, "setCachedSelector:", [v12 selector]);

    double v13 = [(UIKBKeyView *)self factory];
    -[UIKBKeyView setCachedControlKeyRenderingPreference:](self, "setCachedControlKeyRenderingPreference:", [v13 preferStringKeycapOverImage]);

    uint64_t v14 = [(UIKBKeyView *)self renderFlagsForTraits:v7];
    id v15 = +[UIKeyboardCache sharedInstance];
    id v16 = [(UIKBTree *)self->m_keyplane layoutName];
    uint64_t v17 = [v15 displayImagesForView:self fromLayout:v16 imageFlags:v14];

    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setFrameStallSkipRequest:1];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __28__UIKBKeyView_displayLayer___block_invoke;
    v49[3] = &unk_1E52F9E90;
    id v18 = v17;
    id v50 = v18;
    uint64_t v51 = self;
    [v14 enumerateObjectsUsingBlock:v49];
    double v19 = [(UIView *)self layer];
    [v19 setAllowsGroupBlending:0];

    double v20 = [(UIKBKeyView *)self layerForRenderFlags:1];
    cachedBackgroundOpacitdouble y = self->_cachedBackgroundOpacity;
    double v22 = [(UIKBKeyView *)self renderConfig];
    if ([v22 lightKeyboard])
    {
      if ([v7 blendForm] == 1 || objc_msgSend(v7, "blendForm") == 2)
      {

LABEL_8:
        id v23 = [(UIKBKeyView *)self renderConfig];
        [v23 lightKeycapOpacity];
        goto LABEL_14;
      }
      uint64_t v38 = [v7 blendForm];

      if (v38 == 7) {
        goto LABEL_8;
      }
    }
    else
    {
    }
    id v23 = [(UIKBKeyView *)self renderConfig];
    [v23 keycapOpacity];
LABEL_14:
    double v25 = v24;

    double v26 = cachedBackgroundOpacity * v25;
    *(float *)&double v26 = cachedBackgroundOpacity * v25;
    [v20 setOpacity:v26];
    if ([v7 blendForm] == 3)
    {
      uint64_t v27 = *MEMORY[0x1E4F3A2E8];
      v66[0] = &unk_1ED3F4860;
      v66[1] = &unk_1ED3F4878;
      uint64_t v28 = *MEMORY[0x1E4F3A018];
      v67[0] = v27;
      v67[1] = v28;
      long long v29 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v30 = v67;
      CGAffineTransform v31 = (void **)v66;
LABEL_16:
      uint64_t v32 = 2;
LABEL_22:
      CGAffineTransform v33 = [v29 dictionaryWithObjects:v30 forKeys:v31 count:v32];
      goto LABEL_23;
    }
    if ([v7 blendForm] == 4)
    {
      v64 = &unk_1ED3F4890;
      uint64_t v65 = *MEMORY[0x1E4F3A098];
      CGAffineTransform v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v65 forKeys:&v64 count:1];
      CGRect v34 = [(UIView *)self layer];
      [v34 setAllowsGroupBlending:1];

LABEL_23:
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __28__UIKBKeyView_displayLayer___block_invoke_2;
      v46[3] = &unk_1E52F9EB8;
      v46[4] = self;
      id v47 = v33;
      id v48 = v7;
      id v35 = v7;
      id v36 = v33;
      [v14 enumerateObjectsUsingBlock:v46];
      [MEMORY[0x1E4F39CF8] commit];
      self->_int renderedKeyState = [(UIKBTree *)self->m_key state];
      [(UIKBKeyView *)self setCachedTraitsHashString:0];

LABEL_24:
      uint64_t v37 = +[UIKeyboardCache sharedInstance];
      [v37 decrementExpectedRender:self];

      return;
    }
    if ([v7 blendForm] == 5)
    {
      v62 = &unk_1ED3F4890;
      uint64_t v63 = *MEMORY[0x1E4F3A2E8];
      long long v29 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v30 = &v63;
      CGAffineTransform v31 = &v62;
LABEL_21:
      uint64_t v32 = 1;
      goto LABEL_22;
    }
    if ([v7 blendForm] == 9)
    {
      uint64_t v39 = *MEMORY[0x1E4F3A2E8];
      v60[0] = &unk_1ED3F4860;
      v60[1] = &unk_1ED3F4878;
      uint64_t v40 = *MEMORY[0x1E4F3A2E0];
      v61[0] = v39;
      v61[1] = v40;
      long long v29 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v30 = v61;
      CGAffineTransform v31 = (void **)v60;
      goto LABEL_16;
    }
    if ([v7 blendForm] == 8)
    {
      uint64_t v41 = [(UIKBKeyView *)self factory];
      char v42 = [v41 useBlueThemingForKey:self->m_key];

      if ((v42 & 1) == 0)
      {
        uint64_t v43 = *MEMORY[0x1E4F3A350];
        v58[0] = &unk_1ED3F4860;
        v58[1] = &unk_1ED3F4878;
        uint64_t v44 = *MEMORY[0x1E4F3A2E0];
        v59[0] = v43;
        v59[1] = v44;
        long long v29 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v30 = v59;
        CGAffineTransform v31 = (void **)v58;
        goto LABEL_16;
      }
    }
    else
    {
      if ([v7 blendForm] == 6)
      {
        id v56 = &unk_1ED3F4860;
        uint64_t v57 = *MEMORY[0x1E4F3A018];
        long long v29 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v30 = &v57;
        CGAffineTransform v31 = &v56;
        goto LABEL_21;
      }
      if ([v7 controlOpacities]
        && ([v7 blendForm] == 1 || objc_msgSend(v7, "blendForm") == 7))
      {
        BOOL v54 = &unk_1ED3F4860;
        uint64_t v55 = *MEMORY[0x1E4F3A008];
        long long v29 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v30 = &v55;
        CGAffineTransform v31 = &v54;
        goto LABEL_21;
      }
      if (([v7 controlOpacities] & 1) == 0 && objc_msgSend(v7, "blendForm") == 2)
      {
        v52 = &unk_1ED3F4878;
        uint64_t v53 = *MEMORY[0x1E4F3A008];
        long long v29 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v30 = &v53;
        CGAffineTransform v31 = &v52;
        goto LABEL_21;
      }
    }
    CGAffineTransform v33 = 0;
    goto LABEL_23;
  }
  id v45 = +[UIKeyboardCache sharedInstance];
  [v45 decrementExpectedRender:self];
}

void __28__UIKBKeyView_displayLayer___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v11 = [v3 objectForKey:v4];
  uint64_t v5 = [v4 unsignedIntegerValue];

  id v6 = [*(id *)(a1 + 40) layerForRenderFlags:v5];
  id v7 = v6;
  if (*(unsigned char *)(*(void *)(a1 + 40) + 538))
  {
    uint64_t v8 = [v6 meshTransform];
    if (v8)
    {
      CGFloat v9 = (void *)v8;
      int v10 = [*(id *)(*(void *)(a1 + 40) + 416) state];

      if (v10 != 4) {
        [v7 setMeshTransform:0];
      }
    }
  }
  [*(id *)(a1 + 40) _populateLayer:v7 withContents:v11];
}

void __28__UIKBKeyView_displayLayer___block_invoke_2(id *a1, void *a2)
{
  id v10 = a2;
  id v3 = objc_msgSend(a1[4], "layerForRenderFlags:", objc_msgSend(v10, "unsignedIntegerValue"));
  if (v3)
  {
    id v4 = [a1[5] objectForKey:v10];
    uint64_t v5 = [v3 compositingFilter];
    id v6 = v5;
    if (v4)
    {
      id v7 = [v5 type];

      if (v4 == v7)
      {
LABEL_9:

        goto LABEL_10;
      }
      if (v4 == (void *)*MEMORY[0x1E4F3A350])
      {
        [v3 setCompositingFilter:0];
        CGFloat v9 = [a1[6] extraFiltersForType:v4];
        [v3 setFilters:v9];

        goto LABEL_9;
      }
      uint64_t v8 = [MEMORY[0x1E4F39BC0] filterWithType:v4];
      [v3 setCompositingFilter:v8];
    }
    else
    {
      [v3 setCompositingFilter:0];
    }
    [v3 setFilters:0];
    goto LABEL_9;
  }
LABEL_10:
}

- (BOOL)cacheDeferable
{
  return 0;
}

- (BOOL)keepNonPersistent
{
  return 0;
}

- (BOOL)displaysColorImage
{
  return [(UIKBTree *)self->m_key displayType] == 57;
}

- (int64_t)assetIdiom
{
  id v3 = [(UIKBKeyView *)self renderConfig];
  char v4 = [v3 isFloating];

  if (v4) {
    return 0;
  }
  id v6 = [(UIKBKeyView *)self factory];
  int64_t v7 = [v6 assetIdiom];

  return v7;
}

- (void)setRenderConfig:(id)a3
{
  id v21 = a3;
  uint64_t v5 = [(UIKBKeyView *)self renderConfig];
  if (v5)
  {
    id v6 = [(UIKBKeyView *)self renderConfig];
    int v7 = [v6 lightKeyboard];
    int v8 = v7 ^ [v21 lightKeyboard];
  }
  else
  {
    int v8 = 1;
  }

  __int16 v9 = (__int16)[(UIKBTree *)self->m_keyplane visualStyling];
  if ((v8 & 1) == 0 && (v9 & 0xFF00) == 0x7F00)
  {
    id v10 = [(UIKBKeyView *)self renderConfig];
    [v10 keycapOpacity];
    double v12 = v11;
    [v21 keycapOpacity];
    int v8 = v12 != v13;
  }
  objc_storeStrong((id *)&self->m_renderConfig, a3);
  uint64_t v14 = v21;
  if (v21)
  {
    id v15 = [(UIKBKeyView *)self popupMenu];
    id v16 = [(UIKBKeyView *)self renderConfig];
    [v15 setRenderConfig:v16];

    uint64_t v17 = [(UIKBRenderFactory *)self->m_factory renderingContext];

    [(UIKBKeyView *)self renderConfig];
    if (v17) {
      id v18 = {;
    }
      double v19 = [(UIKBRenderFactory *)self->m_factory renderingContext];
      [v19 setRenderConfig:v18];
    }
    else {
      double v20 = {;
    }
      id v18 = +[UIKBRenderingContext renderingContextForRenderConfig:v20];

      objc_msgSend(v18, "setIsFloating:", -[UIKBTree isFloating](self->m_keyplane, "isFloating"));
      [(UIKBRenderFactory *)self->m_factory setRenderingContext:v18];
    }

    uint64_t v14 = v21;
    if (v8)
    {
      self->_int renderedKeyState = 0;
      [(UIView *)self setNeedsDisplay];
      uint64_t v14 = v21;
    }
  }
}

- (void)drawContentsOfRenderers:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(UIKBKeyView *)self factory];
  id v6 = [v5 traitsForKey:self->m_key onKeyplane:self->m_keyplane];

  if ([(UIKBKeyView *)self renderAsMask]) {
    [v6 modifyForMasking];
  }
  int v7 = [(UIKBKeyView *)self factory];
  id v18 = [v7 displayContentsForKey:self->m_key];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    LOBYTE(v11) = 0;
    uint64_t v12 = *(void *)v21;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void **)(*((void *)&v20 + 1) + 8 * v13);
        if (v11) {
          int v11 = 1;
        }
        else {
          int v11 = !-[UIKBKeyView allowBackgroundCachingForRenderFlags:](self, "allowBackgroundCachingForRenderFlags:", [*(id *)(*((void *)&v20 + 1) + 8 * v13) renderFlags]);
        }
        id v15 = [v6 hashString];
        char v16 = [v14 loadCachedImageForHashString:v15];

        if ((v16 & 1) == 0)
        {
          if (v11) {
            [v14 setDisableInternalCaching:1];
          }
          if ([v14 context])
          {
            CGContextSaveGState((CGContextRef)[v14 context]);
            uint64_t v17 = (CGContext *)[v14 context];
            CGAffineTransformMakeTranslation(&transform, -self->m_drawFrame.origin.x, -self->m_drawFrame.origin.y);
            CGContextConcatCTM(v17, &transform);
          }
          [v14 renderKeyContents:v18 withTraits:v6];
          if ([v14 context]) {
            CGContextRestoreGState((CGContextRef)[v14 context]);
          }
        }
        ++v13;
      }
      while (v10 != v13);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }
}

- (BOOL)_canDrawContent
{
  return 1;
}

- (id)_generateBackdropAndBorderMaskImage
{
  [(UIKBKeyView *)self setRenderAsMask:1];
  id v3 = +[UIKeyboardCache sharedInstance];
  id v4 = [(UIKBTree *)self->m_keyplane layoutName];
  uint64_t v5 = [v3 displayImagesForView:self fromLayout:v4 imageFlags:&unk_1ED3F00B8];

  [(UIKBKeyView *)self setRenderAsMask:0];
  if ([v5 count])
  {
    id v6 = [v5 objectForKey:&unk_1ED3F48D8];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)configureBackdropView:(id)a3 forRenderConfig:(id)a4
{
  id v35 = a3;
  id v6 = a4;
  int v7 = [(UIKBKeyView *)self contentsKeyView];
  id v8 = [(UIKBKeyView *)self keyplane];
  CGRect v34 = v6;
  if (([v8 visualStyling] & 0xFF00) == 0x7F00)
  {
    int v9 = 1;
  }
  else
  {
    uint64_t v10 = [(UIKBKeyView *)self keyplane];
    if [v10 visualStyle] == 5 || (objc_msgSend(v6, "emptyBackground")) {
      int v9 = 1;
    }
    else {
      int v9 = [v6 animatedBackground];
    }
  }
  int v11 = [(UIKBKeyView *)self key];
  int v12 = [v11 interactionType];

  uint64_t v13 = [(UIKBKeyView *)self key];
  char v33 = [v13 state];

  uint64_t v14 = [(UIKBKeyView *)self key];
  char v15 = [v14 state];

  char v16 = [(UIKBKeyView *)self key];
  unsigned int v17 = [v16 state];

  id v18 = [(UIKBKeyView *)self key];
  int v32 = [v18 displayTypeHint];

  double v19 = [(UIKBKeyView *)self key];
  if ([v19 interactionType] == 9)
  {
    BOOL v20 = 1;
  }
  else
  {
    long long v21 = [(UIKBKeyView *)self key];
    if ([v21 interactionType] == 5)
    {
      BOOL v20 = 1;
    }
    else
    {
      long long v22 = [(UIKBKeyView *)self key];
      BOOL v20 = [v22 interactionType] == 6;
    }
  }

  if (v12 == 16)
  {
    long long v23 = [v7 key];
    BOOL v24 = [v23 state] == 20;
  }
  else
  {
    BOOL v24 = 0;
  }
  int v25 = v9 & (v17 >> 4) & v20 | v24;
  if (v25 == 1)
  {
    [(UIView *)self bounds];
    objc_msgSend(v35, "setFrame:");
    [(UIView *)self bounds];
    objc_msgSend(v7, "setFrame:");
  }
  double v26 = v35;
  if ((v17 & 0x10) == 0) {
    goto LABEL_39;
  }
  int v27 = [v34 lightKeyboard] ^ 1;
  double v26 = v35;
  if (v12 == 16) {
    int v27 = 1;
  }
  if (((v27 | v20) & 1) == 0)
  {
LABEL_39:
    if (v33 & 4 | v15 & 8)
    {
      if (v32 != 10)
      {
        int v28 = [v34 lightKeyboard] ^ 1;
        double v26 = v35;
        if (((v28 | v9) & 1) == 0) {
          goto LABEL_26;
        }
      }
    }
    else if ((v9 & 1) == 0)
    {
LABEL_26:
      long long v29 = [v26 imageForCorners];
      int v30 = 0;
      goto LABEL_29;
    }
  }
  long long v29 = [v26 _maskImage];
  int v30 = 1;
LABEL_29:
  if (((v29 != 0) & ~v25) != 0)
  {
    CGAffineTransform v31 = v29;
  }
  else
  {
    CGAffineTransform v31 = [v7 _generateBackdropAndBorderMaskImage];

    if (v30) {
      [v35 _setMaskImage:v31];
    }
    else {
      [v35 setImageForCorners:v31];
    }
  }
}

- (void)changeBackgroundToEnabled
{
  if (!self->_singleRerender)
  {
    id v11 = [(UIKBKeyView *)self layerForRenderFlags:1];
    id v3 = (CGColor *)[v11 contentsMultiplyColor];
    id v4 = [v11 compositingFilter];
    if (v3)
    {
      activeBackgroundColor = self->_activeBackgroundColor;
      if (activeBackgroundColor) {
        CGColorRelease(activeBackgroundColor);
      }
      self->_activeBackgroundColor = CGColorRetain(v3);
    }
    if (v4)
    {
      id activeCompositingFilter = self->_activeCompositingFilter;
      if (activeCompositingFilter) {
        CFRelease(activeCompositingFilter);
      }
      int v7 = CFRetain(v4);
      id v8 = self->_activeCompositingFilter;
      self->_id activeCompositingFilter = v7;
    }
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    int v9 = [(UIKBKeyView *)self factory];
    uint64_t v10 = [v9 defaultKeyBackgroundColorName];
    [v11 setContentsMultiplyColor:UIKBGetNamedColor(v10)];

    [v11 setCompositingFilter:0];
    [MEMORY[0x1E4F39CF8] commit];
    self->_singleRerender = 1;
  }
}

- (void)changeBackgroundToActiveIfNecessary
{
  if (self->_singleRerender)
  {
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    id v3 = [(UIKBKeyView *)self layerForRenderFlags:1];
    id v5 = v3;
    if (self->_activeBackgroundColor)
    {
      objc_msgSend(v3, "setContentsMultiplyColor:");
      CGColorRelease(self->_activeBackgroundColor);
      self->_activeBackgroundColor = 0;
    }
    if (self->_activeCompositingFilter)
    {
      objc_msgSend(v5, "setCompositingFilter:");
      CFRelease(self->_activeCompositingFilter);
      id activeCompositingFilter = self->_activeCompositingFilter;
      self->_id activeCompositingFilter = 0;
    }
    [MEMORY[0x1E4F39CF8] commit];
    self->_singleRerender = 0;
  }
}

- (void)resetRenderedKeyState
{
  self->_int renderedKeyState = 0;
}

- (UIKBTree)keyplane
{
  return self->m_keyplane;
}

- (UIKBTree)key
{
  return self->m_key;
}

- (CGRect)drawFrame
{
  double x = self->m_drawFrame.origin.x;
  double y = self->m_drawFrame.origin.y;
  double width = self->m_drawFrame.size.width;
  double height = self->m_drawFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setDrawFrame:(CGRect)a3
{
  self->m_drawFrame = a3;
}

- (UIKBRenderConfig)renderConfig
{
  return self->m_renderConfig;
}

- (void)setFactory:(id)a3
{
}

- (NSString)cachedTraitsHashString
{
  return self->_cachedTraitsHashString;
}

- (void)setCachedTraitsHashString:(id)a3
{
}

- (unint64_t)cachedAnchorCorner
{
  return self->_cachedAnchorCorner;
}

- (void)setCachedAnchorCorner:(unint64_t)a3
{
  self->_cachedAnchorCorner = a3;
}

- (unint64_t)cachedShiftState
{
  return self->_cachedShiftState;
}

- (void)setCachedShiftState:(unint64_t)a3
{
  self->_cachedShiftState = a3;
}

- (int64_t)cachedSelector
{
  return self->_cachedSelector;
}

- (void)setCachedSelector:(int64_t)a3
{
  self->_cachedSelector = a3;
}

- (BOOL)cachedControlKeyRenderingPreference
{
  return self->_cachedControlKeyRenderingPreference;
}

- (void)setCachedControlKeyRenderingPreference:(BOOL)a3
{
  self->_cachedControlKeyRenderingPreference = a3;
}

- (UIKeyboardMenuView)popupMenu
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_popupMenu);
  return (UIKeyboardMenuView *)WeakRetained;
}

- (void)setPopupMenu:(id)a3
{
}

- (double)endingTransitionDuration
{
  return self->_endingTransitionDuration;
}

- (void)setEndingTransitionDuration:(double)a3
{
  self->_endingTransitionDuration = a3;
}

- (UIKBScreenTraits)screenTraits
{
  return self->_screenTraits;
}

- (void)setScreenTraits:(id)a3
{
}

- (BOOL)renderAsMask
{
  return self->_renderAsMask;
}

- (void)setRenderAsMask:(BOOL)a3
{
  self->_renderAsMask = a3;
}

- (BOOL)containedInDynamicKey
{
  return self->_containedInDynamicKey;
}

- (void)setContainedInDynamicKey:(BOOL)a3
{
  self->_containedInDynamicKedouble y = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenTraits, 0);
  objc_destroyWeak((id *)&self->_popupMenu);
  objc_storeStrong(&self->_activeCompositingFilter, 0);
  objc_storeStrong((id *)&self->_cachedTraitsHashString, 0);
  objc_storeStrong((id *)&self->_keyLayers, 0);
  objc_storeStrong((id *)&self->m_factory, 0);
  objc_storeStrong((id *)&self->m_renderConfig, 0);
  objc_storeStrong((id *)&self->m_key, 0);
  objc_storeStrong((id *)&self->m_keyplane, 0);
}

@end