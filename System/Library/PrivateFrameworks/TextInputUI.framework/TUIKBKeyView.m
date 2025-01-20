@interface TUIKBKeyView
- (BOOL)isDynamicKey;
- (BOOL)requiresConstraintBasedLayout;
- (BOOL)translatesAutoresizingMaskIntoConstraints;
- (NSArray)contentViewConstraints;
- (TUIKBKeyView)initWithKey:(id)a3;
- (TUIKey)backingKey;
- (TUILiveKeyView)liveContentView;
- (UIKBBackdropView)backdropView;
- (UIKBKeyView)activeKeyCap;
- (UIKBRenderFactory)splitFactory;
- (UIKBRenderFactory)unsplitFactory;
- (UIKBTree)representedKey;
- (double)fontSize;
- (double)multiplier;
- (double)multiplierForDisplayType:(int)a3;
- (id)description;
- (id)shapeWhenMergedWithKey:(id)a3 insets:(UIEdgeInsets)a4;
- (id)splitFactoryForKeyStyle:(int64_t)a3;
- (int64_t)contentMode;
- (int64_t)keyStyle;
- (int64_t)layoutShape;
- (int64_t)layoutType;
- (int64_t)rowNumber;
- (void)_startStateTransitionAnimationsFrom:(int)a3 to:(int)a4;
- (void)addActiveKeyCapView;
- (void)addContentView;
- (void)dimKeyUsingOpacities:(id)a3;
- (void)finishTransition;
- (void)prepareForTransition;
- (void)setActiveKeyCap:(id)a3;
- (void)setBackdropView:(id)a3;
- (void)setBackingKey:(id)a3;
- (void)setContentViewConstraints:(id)a3;
- (void)setFontSize:(double)a3;
- (void)setKeyStyle:(int64_t)a3;
- (void)setLayoutShape:(int64_t)a3;
- (void)setLiveContentView:(id)a3;
- (void)setMultiplier:(double)a3;
- (void)setRepresentedKey:(id)a3;
- (void)setRowNumber:(int64_t)a3;
- (void)setSplitFactory:(id)a3;
- (void)setUnsplitFactory:(id)a3;
- (void)updateConstraints;
- (void)updateLabelWeight:(int64_t)a3;
- (void)updateStateFrom:(int)a3 to:(int)a4;
- (void)updateStyle:(int64_t)a3;
@end

@implementation TUIKBKeyView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_liveContentView, 0);
  objc_storeStrong((id *)&self->_activeKeyCap, 0);
  objc_storeStrong((id *)&self->_unsplitFactory, 0);
  objc_storeStrong((id *)&self->_splitFactory, 0);
  objc_storeStrong((id *)&self->_contentViewConstraints, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_representedKey, 0);
  objc_storeStrong((id *)&self->_backingKey, 0);
}

- (void)setLiveContentView:(id)a3
{
}

- (TUILiveKeyView)liveContentView
{
  return self->_liveContentView;
}

- (void)setActiveKeyCap:(id)a3
{
}

- (UIKBKeyView)activeKeyCap
{
  return self->_activeKeyCap;
}

- (void)setUnsplitFactory:(id)a3
{
}

- (void)setSplitFactory:(id)a3
{
}

- (void)setContentViewConstraints:(id)a3
{
}

- (NSArray)contentViewConstraints
{
  return self->_contentViewConstraints;
}

- (void)setBackdropView:(id)a3
{
}

- (UIKBBackdropView)backdropView
{
  return self->_backdropView;
}

- (void)setRepresentedKey:(id)a3
{
}

- (UIKBTree)representedKey
{
  return self->_representedKey;
}

- (void)setBackingKey:(id)a3
{
}

- (TUIKey)backingKey
{
  return self->_backingKey;
}

- (void)setMultiplier:(double)a3
{
  self->_multiplier = a3;
}

- (double)multiplier
{
  return self->_multiplier;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setKeyStyle:(int64_t)a3
{
  self->_keyStyle = a3;
}

- (int64_t)keyStyle
{
  return self->_keyStyle;
}

- (void)setLayoutShape:(int64_t)a3
{
  self->_layoutShape = a3;
}

- (int64_t)layoutShape
{
  return self->_layoutShape;
}

- (int64_t)layoutType
{
  return self->_layoutType;
}

- (void)setRowNumber:(int64_t)a3
{
  self->_rowNumber = a3;
}

- (int64_t)rowNumber
{
  return self->_rowNumber;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(TUIKBKeyView *)self key];
  v6 = [v5 name];
  [(TUIKBKeyView *)self frame];
  uint64_t v8 = v7;
  [(TUIKBKeyView *)self frame];
  uint64_t v10 = v9;
  [(TUIKBKeyView *)self frame];
  uint64_t v12 = v11;
  [(TUIKBKeyView *)self frame];
  uint64_t v14 = v13;
  int64_t v15 = [(TUIKBKeyView *)self keyStyle];
  v16 = @"NO";
  if (v15 == 1) {
    v16 = @"YES";
  }
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; name = %@; frame = (%0.f %0.f; %0.f %0.f); usesSmallKeys = %@>",
    v4,
    self,
    v6,
    v8,
    v10,
    v12,
    v14,
  v17 = v16);

  return v17;
}

- (double)multiplierForDisplayType:(int)a3
{
  if (a3 <= 17)
  {
    double result = 1.25;
    switch(a3)
    {
      case 0:
        double result = 1.5;
        break;
      case 3:
LABEL_10:
        double result = dbl_18D516030[[(TUIKBKeyView *)self keyStyle] == 1];
        break;
      case 4:
        goto LABEL_11;
      case 5:
        return result;
      case 13:
      case 14:
LABEL_6:
        BOOL v6 = [(TUIKBKeyView *)self keyStyle] == 1;
        double result = 1.2;
        goto LABEL_12;
      default:
        return 1.0;
    }
  }
  else
  {
    if (a3 <= 50)
    {
      switch(a3)
      {
        case 18:
          goto LABEL_6;
        case 21:
          BOOL v4 = [(TUIKBKeyView *)self keyStyle] == 1;
          double result = 1.75;
          double v5 = 2.0;
          goto LABEL_18;
        case 23:
          BOOL v4 = [(TUIKBKeyView *)self keyStyle] == 1;
          double result = 1.25;
          double v5 = 1.5;
          goto LABEL_18;
        case 26:
          goto LABEL_10;
        default:
          return 1.0;
      }
    }
    if (a3 == 51)
    {
      BOOL v4 = [(TUIKBKeyView *)self keyStyle] == 1;
      double result = 1.7;
      double v5 = 1.0;
LABEL_18:
      if (v4) {
        return v5;
      }
    }
    else if (a3 == 52)
    {
LABEL_11:
      BOOL v6 = [(TUIKBKeyView *)self keyStyle] == 1;
      double result = 1.1;
LABEL_12:
      if (!v6) {
        return 1.0;
      }
    }
    else
    {
      return 1.0;
    }
  }
  return result;
}

- (void)finishTransition
{
  v3 = [(UIKBContainerKeyView *)self contentsKeyView];
  [v3 setHidden:0];

  BOOL v4 = [(UIKBContainerKeyView *)self contentsKeyView];
  [v4 setAlpha:1.0];

  double v5 = [(TUIKBKeyView *)self liveContentView];
  [v5 setHidden:1];

  BOOL v6 = [(TUIKBKeyView *)self liveContentView];
  [v6 removeFromSuperview];

  [(TUIKBKeyView *)self setLiveContentView:0];
}

- (void)prepareForTransition
{
  v39[4] = *MEMORY[0x1E4F143B8];
  v3 = [(UIKBContainerKeyView *)self contentsKeyView];
  [v3 setHidden:1];

  unsplitFactory = self->_unsplitFactory;
  self->_unsplitFactory = 0;

  double v5 = [(TUIKBKeyView *)self splitFactoryForKeyStyle:[(TUIKBKeyView *)self keyStyle]];
  BOOL v6 = [(TUIKBKeyView *)self representedKey];
  uint64_t v7 = [(TUIKBKeyView *)self backingKey];
  uint64_t v8 = [v7 keyplane];
  uint64_t v9 = [v5 traitsForKey:v6 onKeyplane:v8];

  uint64_t v10 = [(TUIKBKeyView *)self representedKey];
  uint64_t v11 = [v5 displayContentsForKey:v10];

  uint64_t v12 = [(TUIKBKeyView *)self liveContentView];

  if (v12)
  {
    uint64_t v13 = [(TUIKBKeyView *)self liveContentView];
    [v13 updateRenderTraits:v9 displayContents:v11];
  }
  else
  {
    uint64_t v14 = [TUILiveKeyView alloc];
    int64_t v15 = [(TUIKBKeyView *)self backingKey];
    v16 = [(TUILiveKeyView *)v14 initWithKey:v15 renderTraits:v9 displayContents:v11];
    [(TUIKBKeyView *)self setLiveContentView:v16];

    v17 = [(TUIKBKeyView *)self liveContentView];
    [v17 setTranslatesAutoresizingMaskIntoConstraints:0];

    v18 = [(TUIKBKeyView *)self liveContentView];
    [(TUIKBKeyView *)self addSubview:v18];

    v31 = (void *)MEMORY[0x1E4F28DC8];
    v38 = [(TUIKBKeyView *)self liveContentView];
    v37 = [v38 topAnchor];
    v36 = [(TUIKBKeyView *)self topAnchor];
    v35 = [v37 constraintEqualToAnchor:v36];
    v39[0] = v35;
    v34 = [(TUIKBKeyView *)self liveContentView];
    v33 = [v34 leadingAnchor];
    v32 = [(TUIKBKeyView *)self leadingAnchor];
    v30 = [v33 constraintEqualToAnchor:v32];
    v39[1] = v30;
    v28 = [(TUIKBKeyView *)self bottomAnchor];
    v29 = [(TUIKBKeyView *)self liveContentView];
    v27 = [v29 bottomAnchor];
    v19 = [v28 constraintEqualToAnchor:v27];
    v39[2] = v19;
    v20 = [(TUIKBKeyView *)self trailingAnchor];
    v21 = [(TUIKBKeyView *)self liveContentView];
    v22 = [v21 trailingAnchor];
    [v20 constraintEqualToAnchor:v22];
    v24 = v23 = v11;
    v39[3] = v24;
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:4];
    [v31 activateConstraints:v25];

    uint64_t v11 = v23;
  }
  v26 = [(TUIKBKeyView *)self liveContentView];
  [v26 setHidden:0];
}

- (id)splitFactoryForKeyStyle:(int64_t)a3
{
  if (a3 == 2)
  {
    v3 = [(TUIKBKeyView *)self unsplitFactory];
  }
  else
  {
    if (a3 == 1) {
      [(TUIKBKeyView *)self splitFactory];
    }
    else {
    v3 = [(UIKBContainerKeyView *)self factory];
    }
  }
  return v3;
}

- (UIKBRenderFactory)unsplitFactory
{
  unsplitFactory = self->_unsplitFactory;
  if (!unsplitFactory)
  {
    BOOL v4 = [(UIKBContainerKeyView *)self keyplane];
    uint64_t v5 = [v4 visualStyling];

    BOOL v6 = (void *)MEMORY[0x1E4FB18A0];
    uint64_t v7 = [(UIKBContainerKeyView *)self factory];
    uint64_t v8 = [v7 renderingContext];
    uint64_t v9 = [v6 factoryForVisualStyle:v5 & 0xFFFFFFFFFFFFFF3FLL | 0x40 renderingContext:v8];
    uint64_t v10 = self->_unsplitFactory;
    self->_unsplitFactory = v9;

    uint64_t v11 = [(UIKBContainerKeyView *)self factory];
    [v11 scale];
    -[UIKBRenderFactory setScale:](self->_unsplitFactory, "setScale:");

    uint64_t v12 = [(UIKBContainerKeyView *)self factory];
    [v12 stretchFactor];
    -[UIKBRenderFactory setStretchFactor:](self->_unsplitFactory, "setStretchFactor:");

    uint64_t v13 = [(UIKBContainerKeyView *)self factory];
    -[UIKBRenderFactory setDynamicFactory:](self->_unsplitFactory, "setDynamicFactory:", [v13 dynamicFactory]);

    unsplitFactory = self->_unsplitFactory;
  }
  return unsplitFactory;
}

- (UIKBRenderFactory)splitFactory
{
  splitFactory = self->_splitFactory;
  if (!splitFactory)
  {
    BOOL v4 = [(UIKBContainerKeyView *)self keyplane];
    uint64_t v5 = [v4 visualStyling];

    BOOL v6 = (void *)MEMORY[0x1E4FB18A0];
    uint64_t v7 = [(UIKBContainerKeyView *)self factory];
    uint64_t v8 = [v7 renderingContext];
    uint64_t v9 = [v6 factoryForVisualStyle:v5 | 0x80 renderingContext:v8];
    uint64_t v10 = self->_splitFactory;
    self->_splitFactory = v9;

    uint64_t v11 = [(UIKBContainerKeyView *)self factory];
    [v11 scale];
    -[UIKBRenderFactory setScale:](self->_splitFactory, "setScale:");

    uint64_t v12 = [(UIKBContainerKeyView *)self factory];
    [v12 stretchFactor];
    -[UIKBRenderFactory setStretchFactor:](self->_splitFactory, "setStretchFactor:");

    splitFactory = self->_splitFactory;
  }
  return splitFactory;
}

- (void)addActiveKeyCapView
{
  v3 = [(TUIKBKeyView *)self activeKeyCap];

  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1888]);
    [(TUIKBKeyView *)self bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    uint64_t v13 = [(UIKBContainerKeyView *)self keyplane];
    uint64_t v14 = [(TUIKBKeyView *)self key];
    int64_t v15 = objc_msgSend(v4, "initWithFrame:keyplane:key:", v13, v14, v6, v8, v10, v12);
    [(TUIKBKeyView *)self setActiveKeyCap:v15];

    v16 = [(TUIKBKeyView *)self activeKeyCap];
    [(TUIKBKeyView *)self addSubview:v16];

    v17 = [(TUIKBKeyView *)self activeKeyCap];
    v18 = [(UIKBContainerKeyView *)self factory];
    [v17 setFactory:v18];

    v19 = [(TUIKBKeyView *)self activeKeyCap];
    v20 = [(UIKBContainerKeyView *)self renderConfig];
    [v19 setRenderConfig:v20];

    v21 = [(TUIKBKeyView *)self activeKeyCap];
    [(UIKBContainerKeyView *)self drawFrame];
    objc_msgSend(v21, "setDrawFrame:");

    v22 = [(TUIKBKeyView *)self activeKeyCap];
    [v22 changeBackgroundToActiveIfNecessary];

    v23 = [(TUIKBKeyView *)self activeKeyCap];
    [v23 setNeedsDisplay];

    id v24 = [(TUIKBKeyView *)self activeKeyCap];
    [v24 prepareForDisplay];
  }
}

- (void)_startStateTransitionAnimationsFrom:(int)a3 to:(int)a4
{
  char v4 = a4;
  double v6 = [(UIKBContainerKeyView *)self renderConfig];
  int v7 = [v6 animatedBackground];

  if (v7)
  {
    double v8 = [(TUIKBKeyView *)self activeKeyCap];
    double v9 = v8;
    if ((v4 & 4) != 0)
    {

      if (!v9)
      {
        [(TUIKBKeyView *)self addActiveKeyCapView];
      }
    }
    else
    {
      [v8 removeFromSuperview];

      [(TUIKBKeyView *)self setActiveKeyCap:0];
    }
  }
}

- (void)updateLabelWeight:(int64_t)a3
{
  double v5 = [(TUIKBKeyView *)self liveContentView];

  if (v5)
  {
    id v6 = [(TUIKBKeyView *)self liveContentView];
    [v6 updateLabelWeight:a3];
  }
}

- (void)updateStateFrom:(int)a3 to:(int)a4
{
  [(TUIKBKeyView *)self _startStateTransitionAnimationsFrom:*(void *)&a3 to:*(void *)&a4];
  [(UIKBContainerKeyView *)self setNeedsDisplay];
  [(UIKBContainerKeyView *)self prepareForDisplay];
}

- (void)dimKeyUsingOpacities:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    v5.receiver = self;
    v5.super_class = (Class)TUIKBKeyView;
    [(UIKBContainerKeyView *)&v5 dimContentKeyView:v4];
  }
}

- (void)updateStyle:(int64_t)a3
{
  if (self->_keyStyle != a3)
  {
    self->_keyStyle = a3;
    objc_super v5 = [(TUIKBKeyView *)self liveContentView];

    if (v5)
    {
      id v6 = [(TUIKBKeyView *)self splitFactoryForKeyStyle:a3];
      int v7 = [(TUIKBKeyView *)self representedKey];
      double v8 = [(TUIKBKeyView *)self backingKey];
      double v9 = [v8 keyplane];
      id v15 = [v6 traitsForKey:v7 onKeyplane:v9];

      double v10 = [(TUIKBKeyView *)self splitFactoryForKeyStyle:a3];
      double v11 = [(TUIKBKeyView *)self representedKey];
      double v12 = [v10 displayContentsForKey:v11];

      uint64_t v13 = [(TUIKBKeyView *)self liveContentView];
      [v13 updateKeyStyle:a3];

      uint64_t v14 = [(TUIKBKeyView *)self liveContentView];
      [v14 updateRenderTraits:v15 displayContents:v12];
    }
    else
    {
      [(UIKBContainerKeyView *)self setNeedsDisplay];
    }
  }
}

- (BOOL)isDynamicKey
{
  return 1;
}

- (void)addContentView
{
  v25[4] = *MEMORY[0x1E4F143B8];
  v3 = [(UIKBContainerKeyView *)self contentsKeyView];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v4 = [(TUIKBKeyView *)self subviews];
  char v5 = [v4 containsObject:v3];

  if ((v5 & 1) == 0) {
    [(TUIKBKeyView *)self addSubview:v3];
  }
  id v6 = [(TUIKBKeyView *)self contentViewConstraints];

  if (!v6)
  {
    id v24 = [v3 topAnchor];
    v23 = [(TUIKBKeyView *)self topAnchor];
    v22 = [v24 constraintEqualToAnchor:v23];
    v25[0] = v22;
    v21 = [v3 leadingAnchor];
    v20 = [(TUIKBKeyView *)self leadingAnchor];
    int v7 = [v21 constraintEqualToAnchor:v20];
    v25[1] = v7;
    double v8 = [(TUIKBKeyView *)self bottomAnchor];
    double v9 = [v3 bottomAnchor];
    double v10 = [v8 constraintEqualToAnchor:v9];
    v25[2] = v10;
    double v11 = [(TUIKBKeyView *)self trailingAnchor];
    double v12 = [v3 trailingAnchor];
    uint64_t v13 = [v11 constraintEqualToAnchor:v12];
    v25[3] = v13;
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:4];
    [(TUIKBKeyView *)self setContentViewConstraints:v14];
  }
  id v15 = [(TUIKBKeyView *)self contentViewConstraints];
  v16 = [v15 firstObject];
  char v17 = [v16 isActive];

  if ((v17 & 1) == 0)
  {
    v18 = (void *)MEMORY[0x1E4F28DC8];
    v19 = [(TUIKBKeyView *)self contentViewConstraints];
    [v18 activateConstraints:v19];
  }
}

- (void)updateConstraints
{
  v3 = [(TUIKBKeyView *)self contentViewConstraints];

  if (!v3) {
    [(TUIKBKeyView *)self addContentView];
  }
  v4.receiver = self;
  v4.super_class = (Class)TUIKBKeyView;
  [(TUIKBKeyView *)&v4 updateConstraints];
}

- (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (int64_t)contentMode
{
  return 3;
}

- (BOOL)translatesAutoresizingMaskIntoConstraints
{
  return 0;
}

- (id)shapeWhenMergedWithKey:(id)a3 insets:(UIEdgeInsets)a4
{
  double top = a4.top;
  id v5 = a3;
  [v5 frame];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  [(TUIKBKeyView *)self frame];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  v48.origin.double x = v7;
  v48.origin.double y = v9;
  v48.size.double width = v11;
  v48.size.double height = v13;
  if (CGRectIsEmpty(v48)) {
    goto LABEL_4;
  }
  v49.origin.double x = v15;
  v49.origin.double y = v17;
  v49.size.double width = v19;
  v49.size.double height = v21;
  if (CGRectIsEmpty(v49)) {
    goto LABEL_4;
  }
  v50.origin.double x = v7;
  v50.origin.double y = v9;
  v50.size.double width = v11;
  v50.size.double height = v13;
  v58.origin.double x = v15;
  v58.origin.double y = v17;
  v58.size.double width = v19;
  v58.size.double height = v21;
  CGRect v51 = CGRectUnion(v50, v58);
  double y = v51.origin.y;
  double x = v51.origin.x;
  double height = v51.size.height;
  double width = v51.size.width;
  UIRectInset();
  double v44 = v52.origin.x;
  double v45 = v52.origin.y;
  double v43 = v52.size.width;
  double v38 = v52.size.height;
  v59.origin.double x = v15;
  v59.origin.double y = v17;
  v59.size.double width = v19;
  v59.size.double height = v21;
  if (CGRectEqualToRect(v52, v59))
  {
LABEL_4:
    v22 = [MEMORY[0x1E4FB18B8] shape];
    goto LABEL_5;
  }
  v53.origin.double x = v7;
  v53.origin.double y = v9;
  v53.size.double width = v11;
  v53.size.double height = v13;
  double MinX = CGRectGetMinX(v53);
  v54.origin.double x = v7;
  v54.origin.double y = v9;
  v54.size.double width = v11;
  v54.size.double height = v13;
  double MaxX = CGRectGetMaxX(v54);
  v55.origin.double x = v15;
  v55.origin.double y = v17;
  v55.size.double width = v19;
  v55.size.double height = v21;
  double v36 = CGRectGetMinX(v55);
  v56.origin.double x = v15;
  double rect2 = v17;
  v56.origin.double y = v17;
  v56.size.double width = v19;
  v56.size.double height = v21;
  double v34 = CGRectGetMaxX(v56);
  id v24 = [MEMORY[0x1E4FB18B8] shape];
  objc_msgSend(v24, "setFrame:", x, y, width, height);
  objc_msgSend(v24, "setPaddedFrame:", v44, v45, v43, v38);
  if (vabdd_f64(v36, MinX) >= 5.0 || vabdd_f64(v34, MaxX) >= 5.0)
  {
    uint64_t v25 = objc_msgSend(v5, "rowNumber", *(void *)&v17);
    if (v25 < [(TUIKBKeyView *)self rowNumber])
    {
      double v26 = v36 - MinX;
      if (v36 - MinX <= 5.0)
      {
        uint64_t v29 = 8;
        double v30 = 0.0;
        uint64_t v31 = 2;
        if (v34 - MaxX < -5.0) {
          double v30 = -(v34 - MaxX);
        }
        else {
          uint64_t v31 = 0;
        }
        if (v34 - MaxX > 5.0)
        {
          double v32 = v34 - MaxX;
        }
        else
        {
          uint64_t v29 = v31;
          double v32 = v30;
        }
        if (v26 < -5.0) {
          uint64_t v27 = 1;
        }
        else {
          uint64_t v27 = v29;
        }
        if (v26 < -5.0) {
          double v26 = -v26;
        }
        else {
          double v26 = v32;
        }
      }
      else
      {
        uint64_t v27 = 4;
      }
      [v24 setConcaveCorner:v27];
      objc_msgSend(v24, "setConcaveCornerOffset:", v26, top + rect2 - v45);
      goto LABEL_29;
    }
  }
  else
  {
    v57.origin.double x = v7;
    v57.origin.double y = v9;
    v57.size.double width = v11;
    v57.size.double height = v13;
    v60.origin.double x = v15;
    v60.origin.double y = v17;
    v60.size.double width = v19;
    v60.size.double height = v21;
    if (!CGRectEqualToRect(v57, v60))
    {
LABEL_29:
      id v28 = v24;
      goto LABEL_30;
    }
  }
  objc_msgSend(MEMORY[0x1E4FB18B8], "shape", *(void *)&rect2);
  id v28 = (id)objc_claimAutoreleasedReturnValue();
LABEL_30:
  v22 = v28;

LABEL_5:
  return v22;
}

- (TUIKBKeyView)initWithKey:(id)a3
{
  id v5 = a3;
  double v6 = [v5 keyplane];
  CGFloat v7 = [v5 backingTree];
  v27.receiver = self;
  v27.super_class = (Class)TUIKBKeyView;
  double v8 = -[UIKBContainerKeyView initWithFrame:keyplane:key:](&v27, sel_initWithFrame_keyplane_key_, v6, v7, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

  if (v8)
  {
    v8->_keyStyle = [v5 style];
    objc_storeStrong((id *)&v8->_backingKey, a3);
    if ([v5 style] == -1) {
      v8->_keyStyle = 2;
    }
    uint64_t v9 = [v5 backingTree];
    representedKedouble y = v8->_representedKey;
    v8->_representedKedouble y = (UIKBTree *)v9;

    CGFloat v11 = NSString;
    double v12 = [v5 backingTree];
    CGFloat v13 = [v12 displayString];
    double v14 = [v11 stringWithFormat:@"%@_key", v13];
    [(TUIKBKeyView *)v8 setAccessibilityIdentifier:v14];

    if ([v5 layoutType] == 3)
    {
      v8->_layoutType = 3;
      if ([v5 layoutShape] == 2) {
        uint64_t v15 = [v5 layoutShape];
      }
      else {
        uint64_t v15 = 0;
      }
      v8->_layoutShape = v15;
      [v5 multiplier];
      if (v21 > 0.0)
      {
LABEL_23:
        [v5 multiplier];
        v8->_multiplier = v25;
        goto LABEL_24;
      }
      goto LABEL_22;
    }
    if ([v5 layoutType] != 4)
    {
      if ([v5 layoutShape] == -1) {
        uint64_t v22 = 0;
      }
      else {
        uint64_t v22 = [v5 layoutShape];
      }
      v8->_layoutShape = v22;
      if ([v5 layoutType] == -1) {
        uint64_t v23 = 2;
      }
      else {
        uint64_t v23 = [v5 layoutType];
      }
      v8->_layoutType = v23;
      [v5 multiplier];
      if (v24 > 0.0 || ![v5 layoutType]) {
        goto LABEL_23;
      }
LABEL_22:
      v8->_multiplier = 1.0;
      goto LABEL_24;
    }
    v8->_layoutType = 4;
    [v5 multiplier];
    double v17 = v16;
    double v18 = 1.0;
    if (v17 > 0.0) {
      objc_msgSend(v5, "multiplier", 1.0);
    }
    v8->_multiplier = v18;
    v8->_layoutShape = 0;
    CGFloat v19 = [v5 backingTree];
    double v20 = [v19 name];
    [(TUIKBKeyView *)v8 setAccessibilityIdentifier:v20];
  }
LABEL_24:

  return v8;
}

@end