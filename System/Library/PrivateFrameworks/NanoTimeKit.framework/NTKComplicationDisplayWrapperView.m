@interface NTKComplicationDisplayWrapperView
- (BOOL)_displayIsTappable;
- (BOOL)_invokeTouchUpInsideHandler;
- (BOOL)editing;
- (BOOL)hasLegacyDisplay;
- (BOOL)isDimmed;
- (BOOL)paused;
- (BOOL)performTap;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)shouldCancelTouchesInScrollview;
- (BOOL)tapAnimationEnabled;
- (BOOL)tapEnabled;
- (BOOL)tapInternalInputEnabled;
- (CDComplicationDisplay)display;
- (CGAffineTransform)contentTransform;
- (CGAffineTransform)editingTransform;
- (CGAffineTransform)tritiumTransform;
- (CGSize)maxSize;
- (CGSize)preferredSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CLKComplicationTemplate)complicationTemplate;
- (CLKMonochromeFilterProvider)filterProvider;
- (NSString)complicationSlotIdentifier;
- (NTKComplicationDisplayWrapperAppLaunchDelegate)appLaunchDelegate;
- (NTKComplicationDisplayWrapperView)init;
- (NTKComplicationDisplayWrapperView)initWithCustomRichDisplay:(id)a3;
- (NTKComplicationDisplayWrapperView)initWithCustomTemplateDisplay:(id)a3 isDetachedDisplay:(BOOL)a4 family:(int64_t)a5;
- (NTKComplicationDisplayWrapperView)initWithFamily:(int64_t)a3;
- (NTKComplicationDisplayWrapperView)initWithLegacyDisplay:(id)a3;
- (NTKComplicationDisplayWrapperView)initWithLegacyDisplay:(id)a3 layoutOverride:(int64_t)a4;
- (NTKComplicationDisplayWrapperViewAnimationDelegate)animationDelegate;
- (double)alphaForDimmedState;
- (id)displayConfigurationHandler;
- (id)needsResizeHandler;
- (id)renderStatsHandler;
- (id)touchDownHandler;
- (id)touchUpInsideHandler;
- (int64_t)family;
- (int64_t)layoutOverride;
- (unint64_t)textLayoutStyle;
- (void)_didSetDisplayFromDisplay:(id)a3 withComplicationAnimation:(unint64_t)a4;
- (void)_invokeNeedsResizeHandler;
- (void)_invokeTouchDownHandler;
- (void)_prepareToSetDisplay:(id)a3 withComplicationAnimation:(unint64_t *)a4;
- (void)_replaceDisplayWithDisplayClass:(Class)a3 template:(id)a4 reason:(int64_t)a5 animation:(unint64_t)a6 animationType:(unint64_t)a7 animationFraction:(float)a8;
- (void)_resetComplicationViews;
- (void)_setComplicationTemplate:(id)a3 reason:(int64_t)a4 animation:(unint64_t)a5 animationType:(unint64_t)a6 animationFraction:(float)a7;
- (void)_setDimmed:(BOOL)a3 animated:(BOOL)a4;
- (void)_setDisplay:(id)a3 withComplicationAnimation:(unint64_t)a4 animationType:(unint64_t)a5 animationFraction:(float)a6;
- (void)_setDisplayEditing:(BOOL)a3;
- (void)_setDisplayMaxSize:(CGSize)a3;
- (void)_timelineAnimationDidFinish;
- (void)_tryToSetDisplayHighlighted:(BOOL)a3;
- (void)_updateConcatenatedTransform;
- (void)_updateVisibilityForSensitivity:(int64_t)a3;
- (void)addBackgroundObserver:(id)a3;
- (void)complicationDisplay:(id)a3 renderStatsWithTime:(double)a4 cost:(double)a5;
- (void)dealloc;
- (void)layoutSubviews;
- (void)removeBackgroundObserver:(id)a3;
- (void)sensitiveUIStateChanged;
- (void)setAlphaForDimmedState:(double)a3;
- (void)setAnimationDelegate:(id)a3;
- (void)setAppLaunchDelegate:(id)a3;
- (void)setComplicationSlotIdentifier:(id)a3;
- (void)setComplicationTemplate:(id)a3 reason:(int64_t)a4 animation:(unint64_t)a5;
- (void)setComplicationView:(id)a3 withComplicationAnimation:(unint64_t)a4 animationType:(unint64_t)a5 animationFraction:(float)a6;
- (void)setContentTransform:(CGAffineTransform *)a3;
- (void)setCustomDisplay:(id)a3;
- (void)setDimmed:(BOOL)a3;
- (void)setDimmed:(BOOL)a3 animated:(BOOL)a4;
- (void)setDisplayConfigurationHandler:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setEditingTransform:(CGAffineTransform *)a3;
- (void)setFilterProvider:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setMaxSize:(CGSize)a3;
- (void)setNeedsResizeHandler:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)setRenderStatsHandler:(id)a3;
- (void)setTapAnimationEnabled:(BOOL)a3;
- (void)setTapEnabled:(BOOL)a3;
- (void)setTapInternalInputEnabled:(BOOL)a3;
- (void)setTextLayoutStyle:(unint64_t)a3;
- (void)setTimeTravelDate:(id)a3 animated:(BOOL)a4;
- (void)setTouchDownHandler:(id)a3;
- (void)setTouchUpInsideHandler:(id)a3;
- (void)setTritiumTransform:(CGAffineTransform *)a3;
- (void)willPerformAppLaunchForComplication:(id)a3;
@end

@implementation NTKComplicationDisplayWrapperView

- (NTKComplicationDisplayWrapperView)init
{
  v12.receiver = self;
  v12.super_class = (Class)NTKComplicationDisplayWrapperView;
  v2 = [(NTKComplicationDisplayWrapperView *)&v12 init];
  v3 = v2;
  if (v2)
  {
    *(int64x2_t *)(v2 + 664) = vdupq_n_s64(0x47EFFFFFE0000000uLL);
    *((void *)v2 + 69) = -1;
    v2[550] = 1;
    *((void *)v2 + 78) = 0;
    v2[548] = 1;
    v2[545] = 1;
    [v2 setUserInteractionEnabled:v2[548]];
    uint64_t v4 = MEMORY[0x1E4F1DAB8];
    long long v5 = *MEMORY[0x1E4F1DAB8];
    long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)(v3 + 680) = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)(v3 + 696) = v6;
    long long v7 = *(_OWORD *)(v4 + 32);
    *(_OWORD *)(v3 + 712) = v7;
    *(_OWORD *)(v3 + 776) = v5;
    *(_OWORD *)(v3 + 792) = v6;
    *(_OWORD *)(v3 + 808) = v7;
    *(_OWORD *)(v3 + 728) = v5;
    *(_OWORD *)(v3 + 744) = v6;
    *(_OWORD *)(v3 + 760) = v7;
    [v3 addTarget:v3 action:sel__invokeTouchUpInsideHandler forControlEvents:64];
    [v3 addTarget:v3 action:sel__invokeTouchDownHandler forControlEvents:1];
    v8 = [MEMORY[0x1E4F19A98] sharedMonitor];
    [v8 addSensitiveUIObserver:v3];

    uint64_t v9 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    v10 = (void *)*((void *)v3 + 67);
    *((void *)v3 + 67) = v9;
  }
  return (NTKComplicationDisplayWrapperView *)v3;
}

- (NTKComplicationDisplayWrapperView)initWithFamily:(int64_t)a3
{
  result = [(NTKComplicationDisplayWrapperView *)self init];
  if (result) {
    result->_family = a3;
  }
  return result;
}

- (NTKComplicationDisplayWrapperView)initWithLegacyDisplay:(id)a3 layoutOverride:(int64_t)a4
{
  long long v6 = -[NTKComplicationDisplayWrapperView initWithLegacyDisplay:](self, "initWithLegacyDisplay:");
  v8 = v6;
  if (v6)
  {
    v6->_layoutOverride = a4;
    if (!a3)
    {
      if (NTKInternalBuild(v6, v7))
      {
        uint64_t v9 = _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          -[NTKComplicationDisplayWrapperView initWithLegacyDisplay:layoutOverride:](v9);
        }

        v10 = [MEMORY[0x1E4FB1618] magentaColor];
        [(NTKComplicationDisplayWrapperView *)v8 setBackgroundColor:v10];
      }
    }
  }
  return v8;
}

- (NTKComplicationDisplayWrapperView)initWithLegacyDisplay:(id)a3
{
  id v4 = a3;
  long long v5 = [(NTKComplicationDisplayWrapperView *)self init];
  uint64_t v7 = v5;
  if (v5)
  {
    v5->_hasLegacyDisplay = 1;
    LODWORD(v6) = -1.0;
    [(NTKComplicationDisplayWrapperView *)v5 _setDisplay:v4 withComplicationAnimation:0 animationType:0 animationFraction:v6];
  }

  return v7;
}

- (NTKComplicationDisplayWrapperView)initWithCustomRichDisplay:(id)a3
{
  id v4 = a3;
  long long v5 = [(NTKComplicationDisplayWrapperView *)self init];
  uint64_t v7 = v5;
  if (v5)
  {
    LODWORD(v6) = -1.0;
    [(NTKComplicationDisplayWrapperView *)v5 _setDisplay:v4 withComplicationAnimation:0 animationType:0 animationFraction:v6];
  }

  return v7;
}

- (NTKComplicationDisplayWrapperView)initWithCustomTemplateDisplay:(id)a3 isDetachedDisplay:(BOOL)a4 family:(int64_t)a5
{
  id v8 = a3;
  uint64_t v9 = [(NTKComplicationDisplayWrapperView *)self init];
  v10 = v9;
  if (v9)
  {
    v9->_family = a5;
    v9->_isDetachedDisplay = a4;
    [(NTKComplicationDisplayWrapperView *)v9 setCustomDisplay:v8];
  }

  return v10;
}

- (void)setCustomDisplay:(id)a3
{
  LODWORD(v3) = -1.0;
  [(NTKComplicationDisplayWrapperView *)self _setDisplay:a3 withComplicationAnimation:0 animationType:0 animationFraction:v3];
}

- (void)dealloc
{
  double v3 = [MEMORY[0x1E4F19A98] sharedMonitor];
  [v3 removeSensitiveUIObserver:self];

  [(CLKComplicationTemplate *)self->_template endUpdatesForClient:self];
  v4.receiver = self;
  v4.super_class = (Class)NTKComplicationDisplayWrapperView;
  [(NTKComplicationDisplayWrapperView *)&v4 dealloc];
}

- (void)_updateConcatenatedTransform
{
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v11.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v11.c = v3;
  *(_OWORD *)&v11.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  *(_OWORD *)&t1.a = *(_OWORD *)&v11.a;
  *(_OWORD *)&t1.c = v3;
  *(_OWORD *)&t1.tx = *(_OWORD *)&v11.tx;
  long long v4 = *(_OWORD *)&self->_editingTransform.c;
  *(_OWORD *)&t2.a = *(_OWORD *)&self->_editingTransform.a;
  *(_OWORD *)&t2.c = v4;
  *(_OWORD *)&t2.tx = *(_OWORD *)&self->_editingTransform.tx;
  CGAffineTransformConcat(&v11, &t1, &t2);
  CGAffineTransform t2 = v11;
  long long v5 = *(_OWORD *)&self->_contentTransform.c;
  *(_OWORD *)&v8.a = *(_OWORD *)&self->_contentTransform.a;
  *(_OWORD *)&v8.c = v5;
  *(_OWORD *)&v8.tx = *(_OWORD *)&self->_contentTransform.tx;
  CGAffineTransformConcat(&t1, &t2, &v8);
  CGAffineTransform v11 = t1;
  CGAffineTransform t2 = t1;
  long long v6 = *(_OWORD *)&self->_tritiumTransform.c;
  *(_OWORD *)&v8.a = *(_OWORD *)&self->_tritiumTransform.a;
  *(_OWORD *)&v8.c = v6;
  *(_OWORD *)&v8.tx = *(_OWORD *)&self->_tritiumTransform.tx;
  CGAffineTransformConcat(&t1, &t2, &v8);
  CGAffineTransform v11 = t1;
  v7.receiver = self;
  v7.super_class = (Class)NTKComplicationDisplayWrapperView;
  [(NTKComplicationDisplayWrapperView *)&v7 setTransform:&t1];
}

- (void)setEditingTransform:(CGAffineTransform *)a3
{
  long long v4 = *(_OWORD *)&a3->c;
  long long v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_editingTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_editingTransform.c = v4;
  *(_OWORD *)&self->_editingTransform.tx = v3;
  [(NTKComplicationDisplayWrapperView *)self _updateConcatenatedTransform];
}

- (void)setTritiumTransform:(CGAffineTransform *)a3
{
  long long v4 = *(_OWORD *)&a3->c;
  long long v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_tritiumTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_tritiumTransform.c = v4;
  *(_OWORD *)&self->_tritiumTransform.tx = v3;
  [(NTKComplicationDisplayWrapperView *)self _updateConcatenatedTransform];
}

- (void)setContentTransform:(CGAffineTransform *)a3
{
  long long v4 = *(_OWORD *)&a3->c;
  long long v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_contentTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_contentTransform.c = v4;
  *(_OWORD *)&self->_contentTransform.tx = v3;
  [(NTKComplicationDisplayWrapperView *)self _updateConcatenatedTransform];
}

- (void)setComplicationTemplate:(id)a3 reason:(int64_t)a4 animation:(unint64_t)a5
{
  LODWORD(v5) = -1.0;
  [(NTKComplicationDisplayWrapperView *)self _setComplicationTemplate:a3 reason:a4 animation:a5 animationType:0 animationFraction:v5];
}

- (void)_setComplicationTemplate:(id)a3 reason:(int64_t)a4 animation:(unint64_t)a5 animationType:(unint64_t)a6 animationFraction:(float)a7
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v13 = (CLKComplicationTemplate *)a3;
  p_template = &self->_template;
  if (self->_template != v13)
  {
    [(CLKComplicationTemplate *)self->_prevTemplate endUpdatesForClient:self];
    objc_storeStrong((id *)&self->_prevTemplate, *p_template);
    objc_storeStrong((id *)&self->_template, a3);
    if (!self->_paused) {
      [(CLKComplicationTemplate *)*p_template beginUpdatesForClient:self];
    }
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v15 = self->_backgroundObservers;
    uint64_t v16 = [(NSHashTable *)v15 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v35 != v18) {
            objc_enumerationMutation(v15);
          }
          [*(id *)(*((void *)&v34 + 1) + 8 * i) displayWrapperTemplateBackgroundChanged];
        }
        uint64_t v17 = [(NSHashTable *)v15 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v17);
    }

    display = self->_display;
    if (!self->_isDetachedDisplay)
    {
      uint64_t v21 = objc_opt_class();
      uint64_t v22 = (uint64_t)NTKComplicationDisplayClassForTemplateAndFamily(v13, self->_family);
      if (!v22)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v22 = objc_opt_class();
        }
        else {
          uint64_t v22 = 0;
        }
      }
      v23 = [(NTKComplicationDisplayWrapperView *)self display];
      int v24 = [v23 conformsToProtocol:&unk_1FCD69600];

      if (v24)
      {
        v26 = [(NTKComplicationDisplayWrapperView *)self display];
        v27 = [v26 complicationTemplate];
        unint64_t v33 = a5;
        int64_t v28 = a4;
        uint64_t v29 = v21;
        unint64_t v30 = a6;
        int v31 = [(CLKComplicationTemplate *)v13 isEqual:v27];

        BOOL v32 = v31 == 0;
        a6 = v30;
        uint64_t v21 = v29;
        a4 = v28;
        a5 = v33;
        if (!v32) {
          a5 = 0;
        }
      }
      if (!v21 || v21 != v22 || a5)
      {
        *(float *)&double v25 = a7;
        [(NTKComplicationDisplayWrapperView *)self _replaceDisplayWithDisplayClass:v22 template:v13 reason:a4 animation:a5 animationType:a6 animationFraction:v25];
        goto LABEL_27;
      }
      if (![(CDComplicationDisplay *)self->_display conformsToProtocol:&unk_1FCD69600])
      {
LABEL_27:
        [(NTKComplicationDisplayWrapperView *)self _updateVisibilityForSensitivity:[(CLKComplicationTemplate *)v13 uiSensitivity]];
        goto LABEL_28;
      }
      display = self->_display;
    }
    [(CDComplicationDisplay *)display setComplicationTemplate:v13 reason:a4];
    goto LABEL_27;
  }
LABEL_28:
}

- (void)_replaceDisplayWithDisplayClass:(Class)a3 template:(id)a4 reason:(int64_t)a5 animation:(unint64_t)a6 animationType:(unint64_t)a7 animationFraction:(float)a8
{
  unint64_t v18 = a6;
  id v13 = a4;
  v14 = [(NTKComplicationDisplayWrapperView *)self display];
  id v15 = objc_alloc_init(a3);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v16 = v15;
    objc_msgSend(v16, "setPaused:", -[NTKComplicationDisplayWrapperView paused](self, "paused"));
  }
  objc_msgSend(v15, "setTextLayoutStyle:", -[NTKComplicationDisplayWrapperView textLayoutStyle](self, "textLayoutStyle"));
  [(NTKComplicationDisplayWrapperView *)self _prepareToSetDisplay:v15 withComplicationAnimation:&v18];
  [v15 setComplicationTemplate:v13 reason:a5];

  *(float *)&double v17 = a8;
  [(NTKComplicationDisplayWrapperView *)self _setDisplay:v15 withComplicationAnimation:v18 animationType:a7 animationFraction:v17];
  [(NTKComplicationDisplayWrapperView *)self _didSetDisplayFromDisplay:v14 withComplicationAnimation:v18];
  if (objc_opt_respondsToSelector()) {
    [(CDComplicationDisplay *)self->_display setTimeTravelDate:self->_timeTravelDate animated:v18 != 0];
  }
}

- (void)_prepareToSetDisplay:(id)a3 withComplicationAnimation:(unint64_t *)a4
{
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_respondsToSelector()) {
    int64_t v6 = [(id)objc_opt_class() layoutOverride];
  }
  else {
    int64_t v6 = 0;
  }
  int64_t layoutOverride = self->_layoutOverride;
  self->_didChangeLayoutOverride = v6 != layoutOverride;
  if (v6 != layoutOverride)
  {
    self->_int64_t layoutOverride = v6;
    *a4 = 0;
  }
}

- (void)_didSetDisplayFromDisplay:(id)a3 withComplicationAnimation:(unint64_t)a4
{
  if (self->_didChangeLayoutOverride)
  {
    self->_didChangeLayoutOverride = 0;
    [(NTKComplicationDisplayWrapperView *)self _invokeNeedsResizeHandler];
  }
}

- (void)setPaused:(BOOL)a3
{
  if (self->_paused != a3)
  {
    BOOL v3 = a3;
    self->_paused = a3;
    double v5 = self->_template;
    if (a3) {
      [(CLKComplicationTemplate *)v5 endUpdatesForClient:self];
    }
    else {
      [(CLKComplicationTemplate *)v5 beginUpdatesForClient:self];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      display = self->_display;
      [(CDComplicationDisplay *)display setPaused:v3];
    }
  }
}

- (void)setEditing:(BOOL)a3
{
  if (self->_editing != a3)
  {
    self->_editing = a3;
    -[NTKComplicationDisplayWrapperView _setDisplayEditing:](self, "_setDisplayEditing:");
  }
}

- (void)setMaxSize:(CGSize)a3
{
  if (a3.width != self->_maxSize.width || a3.height != self->_maxSize.height)
  {
    self->_maxSize = a3;
    -[NTKComplicationDisplayWrapperView _setDisplayMaxSize:](self, "_setDisplayMaxSize:");
  }
}

- (void)setDimmed:(BOOL)a3
{
}

- (void)setDimmed:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_dimmed != a3)
  {
    self->_dimmed = a3;
    -[NTKComplicationDisplayWrapperView _setDimmed:animated:](self, "_setDimmed:animated:");
  }
}

- (void)_setDimmed:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__NTKComplicationDisplayWrapperView__setDimmed_animated___block_invoke;
  v7[3] = &unk_1E62C1BF0;
  v7[4] = self;
  BOOL v8 = a3;
  double v5 = _Block_copy(v7);
  int64_t v6 = v5;
  if (v4) {
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v5 animations:0.2];
  }
  else {
    (*((void (**)(void *))v5 + 2))(v5);
  }
}

uint64_t __57__NTKComplicationDisplayWrapperView__setDimmed_animated___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 40)) {
    [*(id *)(a1 + 32) alphaForDimmedState];
  }
  else {
    double v2 = 1.0;
  }
  return [v1 setAlpha:v2];
}

- (void)setTapEnabled:(BOOL)a3
{
  if (self->_tapEnabled != a3)
  {
    self->_tapEnabled = a3;
    [(NTKComplicationDisplayWrapperView *)self _tryToSetDisplayHighlighted:0];
    BOOL v4 = self->_tapEnabled && self->_tapInternalInputEnabled;
    [(NTKComplicationDisplayWrapperView *)self setUserInteractionEnabled:v4];
  }
}

- (void)setTapAnimationEnabled:(BOOL)a3
{
  if (self->_tapAnimationEnabled != a3)
  {
    self->_tapAnimationEnabled = a3;
    [(NTKComplicationDisplayWrapperView *)self _tryToSetDisplayHighlighted:0];
  }
}

- (void)setTapInternalInputEnabled:(BOOL)a3
{
  if (self->_tapInternalInputEnabled != a3)
  {
    self->_tapInternalInputEnabled = a3;
    [(NTKComplicationDisplayWrapperView *)self _tryToSetDisplayHighlighted:0];
    BOOL v4 = self->_tapEnabled && self->_tapInternalInputEnabled;
    [(NTKComplicationDisplayWrapperView *)self setUserInteractionEnabled:v4];
  }
}

- (BOOL)performTap
{
  touchDownHandler = (void (**)(id, void *))self->_touchDownHandler;
  if (touchDownHandler)
  {
    BOOL v4 = [(NTKComplicationDisplayWrapperView *)self display];
    touchDownHandler[2](touchDownHandler, v4);

    touchUpInsideHandler = (void (**)(id, void *))self->_touchUpInsideHandler;
    if (!touchUpInsideHandler) {
      return 1;
    }
    goto LABEL_5;
  }
  touchUpInsideHandler = (void (**)(id, void *))self->_touchUpInsideHandler;
  if (touchUpInsideHandler)
  {
LABEL_5:
    int64_t v6 = [(NTKComplicationDisplayWrapperView *)self display];
    touchUpInsideHandler[2](touchUpInsideHandler, v6);

    return 1;
  }
  return 0;
}

- (BOOL)_displayIsTappable
{
  BOOL v3 = [(NTKComplicationDisplayWrapperView *)self display];
  BOOL v4 = v3;
  if (self->_tapEnabled && ([v3 alpha], v5 > 0.0)) {
    int v6 = [v4 isHidden] ^ 1;
  }
  else {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)_invokeTouchUpInsideHandler
{
  if (!self->_touchUpInsideHandler) {
    goto LABEL_5;
  }
  BOOL v3 = [(NTKComplicationDisplayWrapperView *)self _displayIsTappable];
  if (v3)
  {
    if (self->_tapInternalInputEnabled)
    {
      touchUpInsideHandler = (void (**)(id, void *))self->_touchUpInsideHandler;
      double v5 = [(NTKComplicationDisplayWrapperView *)self display];
      touchUpInsideHandler[2](touchUpInsideHandler, v5);

      LOBYTE(v3) = 1;
      return v3;
    }
LABEL_5:
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)_invokeTouchDownHandler
{
  if (self->_touchDownHandler
    && [(NTKComplicationDisplayWrapperView *)self _displayIsTappable]
    && self->_tapInternalInputEnabled)
  {
    touchDownHandler = (void (**)(id, id))self->_touchDownHandler;
    id v4 = [(NTKComplicationDisplayWrapperView *)self display];
    touchDownHandler[2](touchDownHandler, v4);
  }
}

- (void)sensitiveUIStateChanged
{
  id v3 = [(NTKComplicationDisplayWrapperView *)self complicationTemplate];
  -[NTKComplicationDisplayWrapperView _updateVisibilityForSensitivity:](self, "_updateVisibilityForSensitivity:", [v3 uiSensitivity]);
}

- (void)_invokeNeedsResizeHandler
{
  needsResizeHandler = (void (**)(void))self->_needsResizeHandler;
  if (needsResizeHandler) {
    needsResizeHandler[2]();
  }
}

- (void)_tryToSetDisplayHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    display = self->_display;
    [(CDComplicationDisplay *)display setHighlighted:v3];
  }
}

- (void)_setDisplayMaxSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (objc_opt_respondsToSelector())
  {
    display = self->_display;
    -[CDComplicationDisplay setMaxSize:](display, "setMaxSize:", width, height);
  }
}

- (void)_setDisplayEditing:(BOOL)a3
{
  BOOL v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    display = self->_display;
    [(CDComplicationDisplay *)display setEditing:v3];
  }
}

- (void)_setDisplay:(id)a3 withComplicationAnimation:(unint64_t)a4 animationType:(unint64_t)a5 animationFraction:(float)a6
{
  CGAffineTransform v11 = (CDComplicationDisplay *)a3;
  p_display = &self->_display;
  display = self->_display;
  if (display != v11)
  {
    v19 = v11;
    if (display)
    {
      if (([(CDComplicationDisplay *)v11 conformsToProtocol:&unk_1FCD69600] & 1) == 0)
      {
        v14 = self->_template;
        self->_template = 0;
      }
      [(CDComplicationDisplay *)*p_display setDisplayObserver:0];
      [(NTKComplicationDisplayWrapperView *)self _removeDisplay:*p_display];
    }
    objc_storeStrong((id *)&self->_display, a3);
    if (*p_display)
    {
      if (objc_opt_respondsToSelector())
      {
        id v15 = *p_display;
        id v16 = [(NTKComplicationDisplayWrapperView *)self filterProvider];
        [(CDComplicationDisplay *)v15 setFilterProvider:v16];
      }
      [(CDComplicationDisplay *)*p_display setDisplayObserver:self];
      [(NTKComplicationDisplayWrapperView *)self _setDisplayEditing:self->_editing];
      -[NTKComplicationDisplayWrapperView _setDisplayMaxSize:](self, "_setDisplayMaxSize:", self->_maxSize.width, self->_maxSize.height);
      displayConfigurationHandler = (void (**)(id, void))self->_displayConfigurationHandler;
      if (displayConfigurationHandler) {
        ((void (**)(id, CDComplicationDisplay *))displayConfigurationHandler)[2](displayConfigurationHandler, v19);
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        *(float *)&double v18 = a6;
        [(NTKComplicationDisplayWrapperView *)self setComplicationView:v19 withComplicationAnimation:a4 animationType:a5 animationFraction:v18];
      }
    }
  }
  MEMORY[0x1F4181820]();
}

- (void)setFilterProvider:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_filterProvider);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_filterProvider, obj);
    if (objc_opt_respondsToSelector()) {
      [(CDComplicationDisplay *)self->_display setFilterProvider:obj];
    }
  }
  MEMORY[0x1F4181820]();
}

- (CGSize)preferredSize
{
  [(NTKComplicationDisplayWrapperView *)self bounds];
  -[NTKComplicationDisplayWrapperView sizeThatFits:](self, "sizeThatFits:", v3, v4);
  result.double height = v6;
  result.double width = v5;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  -[CDComplicationDisplay sizeThatFits:](self->_currentComplicationView, "sizeThatFits:");
  double v7 = v6;
  double v9 = v8;
  nextComplicationView = self->_nextComplicationView;
  if (nextComplicationView)
  {
    -[CDComplicationDisplay sizeThatFits:](nextComplicationView, "sizeThatFits:", width, height);
    if (v11 > v7) {
      double v7 = v11;
    }
    if (v12 > v9) {
      double v9 = v12;
    }
  }
  double v13 = v7;
  double v14 = v9;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  return -[CDComplicationDisplay pointInside:withEvent:](self->_currentComplicationView, "pointInside:withEvent:", a4, a3.x, a3.y);
}

- (void)layoutSubviews
{
  v29.receiver = self;
  v29.super_class = (Class)NTKComplicationDisplayWrapperView;
  [(NTKComplicationDisplayWrapperView *)&v29 layoutSubviews];
  [(NTKComplicationDisplayWrapperView *)self bounds];
  double v7 = v3;
  double v8 = v4;
  double v9 = v5;
  double v10 = v6;
  if (self->_isAnimating)
  {
    CGRect v30 = CGRectInset(*(CGRect *)&v3, 0.0, -2.0);
    -[UIView setFrame:](self->_clipView, "setFrame:", v30.origin.x, v30.origin.y, v30.size.width, v30.size.height);
    earlierContainerView = self->_earlierContainerView;
    [(UIView *)self->_clipView bounds];
    -[UIView ntk_setBoundsAndPositionFromFrame:](earlierContainerView, "ntk_setBoundsAndPositionFromFrame:");
    laterContainerView = self->_laterContainerView;
    [(UIView *)self->_clipView bounds];
    -[UIView ntk_setBoundsAndPositionFromFrame:](laterContainerView, "ntk_setBoundsAndPositionFromFrame:");
    double v8 = v8 + 2.0;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  currentComplicationView = self->_currentComplicationView;
  if (currentComplicationView)
  {
    [(CDComplicationDisplay *)currentComplicationView transform];
    currentComplicationView = self->_currentComplicationView;
  }
  long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  long long v23 = *MEMORY[0x1E4F1DAB8];
  long long v19 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  long long v24 = v14;
  long long v25 = v19;
  -[CDComplicationDisplay setTransform:](currentComplicationView, "setTransform:", &v23, v19, v14, v23);
  -[CDComplicationDisplay setFrame:](self->_currentComplicationView, "setFrame:", v7, v8, v9, v10);
  id v15 = self->_currentComplicationView;
  long long v23 = v26;
  long long v24 = v27;
  long long v25 = v28;
  [(CDComplicationDisplay *)v15 setTransform:&v23];
  nextComplicationView = self->_nextComplicationView;
  if (nextComplicationView)
  {
    [(CDComplicationDisplay *)nextComplicationView transform];
    long long v26 = v23;
    long long v27 = v24;
    long long v28 = v25;
    double v17 = self->_nextComplicationView;
    long long v23 = v22;
    long long v24 = v21;
    long long v25 = v20;
    [(CDComplicationDisplay *)v17 setTransform:&v23];
    -[CDComplicationDisplay setFrame:](self->_nextComplicationView, "setFrame:", v7, v8, v9, v10);
    double v18 = self->_nextComplicationView;
    long long v23 = v26;
    long long v24 = v27;
    long long v25 = v28;
    [(CDComplicationDisplay *)v18 setTransform:&v23];
  }
}

- (void)willPerformAppLaunchForComplication:(id)a3
{
  p_appLaunchDelegate = &self->_appLaunchDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appLaunchDelegate);

  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)p_appLaunchDelegate);
    [v6 willLaunchAppForComplicationDisplayWrapper:self];
  }
}

- (void)_updateVisibilityForSensitivity:(int64_t)a3
{
  double v5 = [MEMORY[0x1E4F19A98] sharedMonitor];
  uint64_t v6 = [v5 shouldHideForSensitivity:a3];

  if ((objc_opt_respondsToSelector() & 1) != 0
    && v6 != [(CDComplicationDisplay *)self->_display isHidden]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    display = self->_display;
    [(CDComplicationDisplay *)display setHidden:v6];
  }
}

- (void)complicationDisplay:(id)a3 renderStatsWithTime:(double)a4 cost:(double)a5
{
  renderStatsHandler = (void (**)(id, NTKComplicationDisplayWrapperView *, double, double))self->_renderStatsHandler;
  if (renderStatsHandler) {
    renderStatsHandler[2](renderStatsHandler, self, a4, a5);
  }
}

- (void)setTimeTravelDate:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  p_timeTravelDate = &self->_timeTravelDate;
  id v8 = a3;
  if (([v8 isEqual:*p_timeTravelDate] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_timeTravelDate, a3);
    if (objc_opt_respondsToSelector()) {
      [(CDComplicationDisplay *)self->_display setTimeTravelDate:*p_timeTravelDate animated:v4];
    }
  }
}

- (void)setComplicationView:(id)a3 withComplicationAnimation:(unint64_t)a4 animationType:(unint64_t)a5 animationFraction:(float)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  double v9 = (CDComplicationDisplay *)a3;
  p_currentComplicationView = &self->_currentComplicationView;
  currentComplicationView = self->_currentComplicationView;
  if (currentComplicationView != v9)
  {
    if (self->_isAnimating)
    {
      objc_storeStrong((id *)&self->_deferredComplicationView, a3);
      double v12 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        complicationSlotIdentifier = self->_complicationSlotIdentifier;
        int v31 = 138412290;
        BOOL v32 = complicationSlotIdentifier;
        _os_log_impl(&dword_1BC5A9000, v12, OS_LOG_TYPE_DEFAULT, "NTKComplicationDisplayWrapper: deferring animation (%@)", (uint8_t *)&v31, 0xCu);
      }
    }
    else if (a4 && currentComplicationView)
    {
      objc_storeStrong((id *)&self->_nextComplicationView, a3);
      [(CDComplicationDisplay *)*p_currentComplicationView removeFromSuperview];
      if (a4 == 1) {
        p_nextComplicationView = &self->_currentComplicationView;
      }
      else {
        p_nextComplicationView = &self->_nextComplicationView;
      }
      id v15 = *p_nextComplicationView;
      if (a4 == 1) {
        id v16 = &self->_nextComplicationView;
      }
      else {
        id v16 = &self->_currentComplicationView;
      }
      double v17 = (objc_class *)MEMORY[0x1E4FB1EB0];
      double v18 = *v16;
      long long v19 = v15;
      long long v20 = (UIView *)objc_alloc_init(v17);
      clipView = self->_clipView;
      self->_clipView = v20;

      [(UIView *)self->_clipView setClipsToBounds:1];
      [(NTKComplicationDisplayWrapperView *)self addSubview:self->_clipView];
      long long v22 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      earlierContainerView = self->_earlierContainerView;
      self->_earlierContainerView = v22;

      long long v24 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      laterContainerView = self->_laterContainerView;
      self->_laterContainerView = v24;

      [(UIView *)self->_clipView addSubview:self->_laterContainerView];
      [(UIView *)self->_clipView addSubview:self->_earlierContainerView];
      [(UIView *)self->_earlierContainerView addSubview:v19];
      [(UIView *)self->_laterContainerView addSubview:v18];
      self->_isAnimating = 1;
      [(NTKComplicationDisplayWrapperView *)self setNeedsLayout];
      [(NTKComplicationDisplayWrapperView *)self layoutIfNeeded];
      [(NTKComplicationDisplayWrapperView *)self _timelineAnimationDidFinish];
    }
    else
    {
      long long v26 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        long long v27 = self->_complicationSlotIdentifier;
        int v31 = 138412290;
        BOOL v32 = v27;
        _os_log_impl(&dword_1BC5A9000, v26, OS_LOG_TYPE_DEFAULT, "NTKComplicationDisplayWrapper: Replace display non-animated (%@)", (uint8_t *)&v31, 0xCu);
      }

      [(CDComplicationDisplay *)*p_currentComplicationView removeFromSuperview];
      objc_storeStrong((id *)&self->_currentComplicationView, a3);
      [(NTKComplicationDisplayWrapperView *)self _resetComplicationViews];
      [(CDComplicationDisplay *)self->_nextComplicationView removeFromSuperview];
      nextComplicationView = self->_nextComplicationView;
      self->_nextComplicationView = 0;

      deferredComplicationView = self->_deferredComplicationView;
      self->_deferredComplicationView = 0;

      [(CDComplicationDisplay *)*p_currentComplicationView setUserInteractionEnabled:0];
      [(CLKComplicationTemplate *)self->_prevTemplate endUpdatesForClient:self];
      prevTemplate = self->_prevTemplate;
      self->_prevTemplate = 0;
    }
  }
}

- (void)_timelineAnimationDidFinish
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  double v3 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    complicationSlotIdentifier = self->_complicationSlotIdentifier;
    int v14 = 138412290;
    id v15 = complicationSlotIdentifier;
    _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "NTKComplicationDisplayWrapper: Complication animation did finish (%@)", (uint8_t *)&v14, 0xCu);
  }

  [(CDComplicationDisplay *)self->_nextComplicationView removeFromSuperview];
  [(CDComplicationDisplay *)self->_currentComplicationView removeFromSuperview];
  deferredComplicationView = self->_deferredComplicationView;
  if (!deferredComplicationView) {
    deferredComplicationView = self->_nextComplicationView;
  }
  uint64_t v6 = deferredComplicationView;
  currentComplicationView = self->_currentComplicationView;
  self->_currentComplicationView = v6;

  id v8 = self->_deferredComplicationView;
  self->_deferredComplicationView = 0;

  nextComplicationView = self->_nextComplicationView;
  self->_nextComplicationView = 0;

  self->_isAnimating = 0;
  [(NTKComplicationDisplayWrapperView *)self _resetComplicationViews];
  [(CDComplicationDisplay *)self->_currentComplicationView setUserInteractionEnabled:0];
  [(NTKComplicationDisplayWrapperView *)self _invokeNeedsResizeHandler];
  earlierContainerView = self->_earlierContainerView;
  self->_earlierContainerView = 0;

  laterContainerView = self->_laterContainerView;
  self->_laterContainerView = 0;

  [(UIView *)self->_clipView removeFromSuperview];
  clipView = self->_clipView;
  self->_clipView = 0;

  [(CLKComplicationTemplate *)self->_prevTemplate endUpdatesForClient:self];
  prevTemplate = self->_prevTemplate;
  self->_prevTemplate = 0;
}

- (void)_resetComplicationViews
{
  if (self->_currentComplicationView)
  {
    -[NTKComplicationDisplayWrapperView addSubview:](self, "addSubview:");
    currentComplicationView = self->_currentComplicationView;
    [(CDComplicationDisplay *)currentComplicationView setAlpha:1.0];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_tapAnimationEnabled)
  {
    BOOL v3 = a3;
    v5.receiver = self;
    v5.super_class = (Class)NTKComplicationDisplayWrapperView;
    -[NTKComplicationDisplayWrapperView setHighlighted:](&v5, sel_setHighlighted_);
    [(NTKComplicationDisplayWrapperView *)self _tryToSetDisplayHighlighted:v3];
  }
}

- (BOOL)shouldCancelTouchesInScrollview
{
  return 1;
}

- (void)addBackgroundObserver:(id)a3
{
}

- (void)removeBackgroundObserver:(id)a3
{
}

- (CLKComplicationTemplate)complicationTemplate
{
  return self->_template;
}

- (int64_t)family
{
  return self->_family;
}

- (NSString)complicationSlotIdentifier
{
  return self->_complicationSlotIdentifier;
}

- (void)setComplicationSlotIdentifier:(id)a3
{
}

- (unint64_t)textLayoutStyle
{
  return self->_textLayoutStyle;
}

- (void)setTextLayoutStyle:(unint64_t)a3
{
  self->_textLayoutStyle = a3;
}

- (CDComplicationDisplay)display
{
  return self->_display;
}

- (id)displayConfigurationHandler
{
  return self->_displayConfigurationHandler;
}

- (void)setDisplayConfigurationHandler:(id)a3
{
}

- (BOOL)editing
{
  return self->_editing;
}

- (BOOL)tapEnabled
{
  return self->_tapEnabled;
}

- (CGAffineTransform)editingTransform
{
  long long v3 = *(_OWORD *)&self[14].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[14].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[14].ty;
  return self;
}

- (CGAffineTransform)tritiumTransform
{
  long long v3 = *(_OWORD *)&self[15].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[15].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[15].ty;
  return self;
}

- (CGAffineTransform)contentTransform
{
  long long v3 = *(_OWORD *)&self[16].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[16].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[16].ty;
  return self;
}

- (NTKComplicationDisplayWrapperViewAnimationDelegate)animationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_animationDelegate);
  return (NTKComplicationDisplayWrapperViewAnimationDelegate *)WeakRetained;
}

- (void)setAnimationDelegate:(id)a3
{
}

- (NTKComplicationDisplayWrapperAppLaunchDelegate)appLaunchDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appLaunchDelegate);
  return (NTKComplicationDisplayWrapperAppLaunchDelegate *)WeakRetained;
}

- (void)setAppLaunchDelegate:(id)a3
{
}

- (CGSize)maxSize
{
  double width = self->_maxSize.width;
  double height = self->_maxSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (id)needsResizeHandler
{
  return self->_needsResizeHandler;
}

- (void)setNeedsResizeHandler:(id)a3
{
}

- (BOOL)isDimmed
{
  return self->_dimmed;
}

- (double)alphaForDimmedState
{
  return self->_alphaForDimmedState;
}

- (void)setAlphaForDimmedState:(double)a3
{
  self->_alphaForDimmedState = a3;
}

- (BOOL)hasLegacyDisplay
{
  return self->_hasLegacyDisplay;
}

- (int64_t)layoutOverride
{
  return self->_layoutOverride;
}

- (CLKMonochromeFilterProvider)filterProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_filterProvider);
  return (CLKMonochromeFilterProvider *)WeakRetained;
}

- (id)renderStatsHandler
{
  return self->_renderStatsHandler;
}

- (void)setRenderStatsHandler:(id)a3
{
}

- (BOOL)tapInternalInputEnabled
{
  return self->_tapInternalInputEnabled;
}

- (BOOL)tapAnimationEnabled
{
  return self->_tapAnimationEnabled;
}

- (id)touchDownHandler
{
  return self->_touchDownHandler;
}

- (void)setTouchDownHandler:(id)a3
{
}

- (id)touchUpInsideHandler
{
  return self->_touchUpInsideHandler;
}

- (void)setTouchUpInsideHandler:(id)a3
{
}

- (BOOL)paused
{
  return self->_paused;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_touchUpInsideHandler, 0);
  objc_storeStrong(&self->_touchDownHandler, 0);
  objc_storeStrong(&self->_renderStatsHandler, 0);
  objc_destroyWeak((id *)&self->_filterProvider);
  objc_storeStrong(&self->_needsResizeHandler, 0);
  objc_destroyWeak((id *)&self->_appLaunchDelegate);
  objc_destroyWeak((id *)&self->_animationDelegate);
  objc_storeStrong(&self->_displayConfigurationHandler, 0);
  objc_storeStrong((id *)&self->_display, 0);
  objc_storeStrong((id *)&self->_complicationSlotIdentifier, 0);
  objc_storeStrong((id *)&self->_backgroundObservers, 0);
  objc_storeStrong((id *)&self->_timeTravelDate, 0);
  objc_storeStrong((id *)&self->_template, 0);
  objc_storeStrong((id *)&self->_prevTemplate, 0);
  objc_storeStrong((id *)&self->_laterContainerView, 0);
  objc_storeStrong((id *)&self->_earlierContainerView, 0);
  objc_storeStrong((id *)&self->_clipView, 0);
  objc_storeStrong((id *)&self->_deferredComplicationView, 0);
  objc_storeStrong((id *)&self->_nextComplicationView, 0);
  objc_storeStrong((id *)&self->_currentComplicationView, 0);
}

- (void)initWithLegacyDisplay:(os_log_t)log layoutOverride:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_ERROR, "NTKComplicationDisplayWrapperView missing legacy complication display", v1, 2u);
}

@end