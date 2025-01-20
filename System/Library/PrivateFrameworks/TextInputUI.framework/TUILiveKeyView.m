@interface TUILiveKeyView
- (BOOL)isShift;
- (BOOL)isShowingHighlight;
- (BOOL)keyIsControlType:(id)a3;
- (BOOL)keyIsSpaceType:(id)a3;
- (BOOL)keyIsStringType:(id)a3;
- (BOOL)usesBlueBackground;
- (BOOL)usesImage;
- (NSLayoutConstraint)horizontalContentConstraint;
- (NSLayoutConstraint)labelBottom;
- (NSLayoutConstraint)labelLeading;
- (NSLayoutConstraint)labelTrailing;
- (NSLayoutConstraint)verticalContentConstraint;
- (NSString)imageName;
- (NSString)keyCap;
- (TUIDrawingView)backgroundMaskView;
- (TUIDrawingView)keyCapBackground;
- (TUIDrawingView)keyCapShadow;
- (TUILiveKeyView)initWithKey:(id)a3 renderTraits:(id)a4 displayContents:(id)a5;
- (UIEdgeInsets)drawingInsets;
- (UIImageView)symbolImageView;
- (UIKBRenderConfig)renderConfig;
- (UIKBRenderTraits)traits;
- (UILabel)keyLabel;
- (double)fontSize;
- (id)controlKeyColor;
- (id)controlShadowColor;
- (id)fontForLabel;
- (id)fontForSymbolStyle:(id)a3;
- (id)highlightedControlKeyColor;
- (id)highlightedKeyCapColor;
- (id)imageWithName:(id)a3;
- (id)keyCapColor;
- (id)labelForKeyCap:(id)a3;
- (id)nameFromControlType:(int)a3;
- (id)roundedRectForRect:(CGRect)a3;
- (id)shadowColor;
- (id)shadowPathForRect:(CGRect)a3;
- (id)symbolImageConfigForRenderTraits:(id)a3 traitCollection:(id)a4;
- (int64_t)keyStyle;
- (int64_t)layoutShape;
- (int64_t)layoutType;
- (void)keyWithLabel;
- (void)keyWithSymbolView;
- (void)layoutSubviews;
- (void)makeKeyBackgrounds;
- (void)setBackgroundMaskView:(id)a3;
- (void)setFontSize:(double)a3;
- (void)setHorizontalContentConstraint:(id)a3;
- (void)setImageName:(id)a3;
- (void)setIsShift:(BOOL)a3;
- (void)setIsShowingHighlight:(BOOL)a3;
- (void)setKeyCap:(id)a3;
- (void)setKeyCapBackground:(id)a3;
- (void)setKeyCapShadow:(id)a3;
- (void)setKeyLabel:(id)a3;
- (void)setKeyStyle:(int64_t)a3;
- (void)setLabelBottom:(id)a3;
- (void)setLabelLeading:(id)a3;
- (void)setLabelTrailing:(id)a3;
- (void)setLayoutShape:(int64_t)a3;
- (void)setLayoutType:(int64_t)a3;
- (void)setRenderConfig:(id)a3;
- (void)setSymbolImageView:(id)a3;
- (void)setTraits:(id)a3;
- (void)setUsesBlueBackground:(BOOL)a3;
- (void)setUsesImage:(BOOL)a3;
- (void)setVerticalContentConstraint:(id)a3;
- (void)updateFontSize:(double)a3;
- (void)updateKeyStyle:(int64_t)a3;
- (void)updateLabelInsets;
- (void)updateLabelText:(id)a3;
- (void)updateLabelWeight:(int64_t)a3;
- (void)updateRenderTraits:(id)a3 displayContents:(id)a4;
- (void)updateSymbolInsets;
@end

@implementation TUILiveKeyView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_labelTrailing, 0);
  objc_storeStrong((id *)&self->_labelLeading, 0);
  objc_storeStrong((id *)&self->_labelBottom, 0);
  objc_storeStrong((id *)&self->_verticalContentConstraint, 0);
  objc_storeStrong((id *)&self->_horizontalContentConstraint, 0);
  objc_storeStrong((id *)&self->_keyCapShadow, 0);
  objc_storeStrong((id *)&self->_keyCapBackground, 0);
  objc_storeStrong((id *)&self->_backgroundMaskView, 0);
  objc_storeStrong((id *)&self->_keyCap, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
  objc_storeStrong((id *)&self->_symbolImageView, 0);
  objc_storeStrong((id *)&self->_keyLabel, 0);
  objc_storeStrong((id *)&self->_renderConfig, 0);
}

- (void)setTraits:(id)a3
{
}

- (UIKBRenderTraits)traits
{
  return self->_traits;
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

- (void)setLayoutType:(int64_t)a3
{
  self->_layoutType = a3;
}

- (int64_t)layoutType
{
  return self->_layoutType;
}

- (void)setLabelTrailing:(id)a3
{
}

- (NSLayoutConstraint)labelTrailing
{
  return self->_labelTrailing;
}

- (void)setLabelLeading:(id)a3
{
}

- (NSLayoutConstraint)labelLeading
{
  return self->_labelLeading;
}

- (void)setLabelBottom:(id)a3
{
}

- (NSLayoutConstraint)labelBottom
{
  return self->_labelBottom;
}

- (void)setVerticalContentConstraint:(id)a3
{
}

- (NSLayoutConstraint)verticalContentConstraint
{
  return self->_verticalContentConstraint;
}

- (void)setHorizontalContentConstraint:(id)a3
{
}

- (NSLayoutConstraint)horizontalContentConstraint
{
  return self->_horizontalContentConstraint;
}

- (void)setUsesBlueBackground:(BOOL)a3
{
  self->_usesBlueBackground = a3;
}

- (BOOL)usesBlueBackground
{
  return self->_usesBlueBackground;
}

- (void)setIsShowingHighlight:(BOOL)a3
{
  self->_isShowingHighlight = a3;
}

- (BOOL)isShowingHighlight
{
  return self->_isShowingHighlight;
}

- (void)setIsShift:(BOOL)a3
{
  self->_isShift = a3;
}

- (BOOL)isShift
{
  return self->_isShift;
}

- (void)setUsesImage:(BOOL)a3
{
  self->_usesImage = a3;
}

- (BOOL)usesImage
{
  return self->_usesImage;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setKeyCapShadow:(id)a3
{
}

- (TUIDrawingView)keyCapShadow
{
  return self->_keyCapShadow;
}

- (void)setKeyCapBackground:(id)a3
{
}

- (TUIDrawingView)keyCapBackground
{
  return self->_keyCapBackground;
}

- (void)setBackgroundMaskView:(id)a3
{
}

- (TUIDrawingView)backgroundMaskView
{
  return self->_backgroundMaskView;
}

- (void)setKeyCap:(id)a3
{
}

- (NSString)keyCap
{
  return self->_keyCap;
}

- (void)setImageName:(id)a3
{
}

- (NSString)imageName
{
  return self->_imageName;
}

- (void)setSymbolImageView:(id)a3
{
}

- (UIImageView)symbolImageView
{
  return self->_symbolImageView;
}

- (void)setKeyLabel:(id)a3
{
}

- (UILabel)keyLabel
{
  return self->_keyLabel;
}

- (void)setRenderConfig:(id)a3
{
}

- (UIKBRenderConfig)renderConfig
{
  return self->_renderConfig;
}

- (id)nameFromControlType:(int)a3
{
  id result = 0;
  switch(a3)
  {
    case 2:
      id result = @"command";
      break;
    case 3:
      id result = @"delete.left";
      break;
    case 4:
LABEL_5:
      id result = @"mic";
      break;
    case 5:
      id result = @"keyboard.chevron.compact.down";
      break;
    case 6:
    case 7:
    case 8:
    case 10:
    case 11:
    case 12:
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 22:
    case 24:
    case 25:
      return result;
    case 9:
      id result = @"emoji.face.grinning";
      break;
    case 13:
      id result = @"globe";
      break;
    case 14:
      id result = &stru_1EDC653C0;
      break;
    case 21:
      id result = @"return";
      break;
    case 23:
      id result = @"shift";
      break;
    case 26:
      id result = @"arrow.right.to.line";
      break;
    default:
      switch(a3)
      {
        case '-':
          id result = @"arrow.backward";
          break;
        case '.':
          id result = @"arrow.forward";
          break;
        case '/':
        case '0':
        case '1':
        case '2':
          return result;
        case '3':
          id result = @"capslock";
          break;
        case '4':
          goto LABEL_5;
        case '5':
          id result = @"scribble";
          break;
        case '6':
          id result = @"keyboard";
          break;
        default:
          if (a3 == 31) {
            id result = @"mic";
          }
          else {
            id result = 0;
          }
          break;
      }
      break;
  }
  return result;
}

- (BOOL)keyIsControlType:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 interactionType] == 4
    || [v3 interactionType] == 5
    || [v3 interactionType] == 6
    || [v3 interactionType] == 9
    || [v3 interactionType] == 10
    || [v3 interactionType] == 11
    || [v3 interactionType] == 13
    || [v3 interactionType] == 14
    || [v3 interactionType] == 37
    || [v3 interactionType] == 38
    || [v3 interactionType] == 17;

  return v4;
}

- (BOOL)keyIsSpaceType:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 interactionType] == 15 || objc_msgSend(v3, "displayType") == 25;

  return v4;
}

- (BOOL)keyIsStringType:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 interactionType] == 1
    || [v3 interactionType] == 2
    || [v3 interactionType] == 16;

  return v4;
}

- (id)shadowColor
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __29__TUILiveKeyView_shadowColor__block_invoke;
  v4[3] = &unk_1E55938B8;
  v4[4] = self;
  v2 = [MEMORY[0x1E4FB1618] colorWithDynamicProvider:v4];
  return v2;
}

id __29__TUILiveKeyView_shadowColor__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) traitCollection];
  BOOL v2 = [v1 userInterfaceStyle] == 2;
  id v3 = [MEMORY[0x1E4FB1618] colorWithRed:0.0 green:0.0 blue:0.0 alpha:dbl_18D516040[v2]];

  return v3;
}

- (id)controlShadowColor
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__TUILiveKeyView_controlShadowColor__block_invoke;
  v4[3] = &unk_1E55938B8;
  v4[4] = self;
  BOOL v2 = [MEMORY[0x1E4FB1618] colorWithDynamicProvider:v4];
  return v2;
}

id __36__TUILiveKeyView_controlShadowColor__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) traitCollection];
  BOOL v2 = [v1 userInterfaceStyle] == 2;
  id v3 = [MEMORY[0x1E4FB1618] colorWithRed:0.0 green:0.0 blue:0.0 alpha:dbl_18D516040[v2]];

  return v3;
}

- (id)highlightedControlKeyColor
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__TUILiveKeyView_highlightedControlKeyColor__block_invoke;
  v4[3] = &unk_1E55938B8;
  v4[4] = self;
  BOOL v2 = [MEMORY[0x1E4FB1618] colorWithDynamicProvider:v4];
  return v2;
}

id __44__TUILiveKeyView_highlightedControlKeyColor__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) traitCollection];
  if ([v1 userInterfaceStyle] == 2)
  {
    double v2 = 0.42;
    double v3 = 1.0;
    double v4 = 0.42;
    double v5 = 0.42;
  }
  else
  {
    double v2 = 0.49;
    double v4 = 0.51;
    double v5 = 0.54;
    double v3 = 1.0;
  }
  v6 = [MEMORY[0x1E4FB1618] colorWithRed:v2 green:v4 blue:v5 alpha:v3];

  return v6;
}

- (id)controlKeyColor
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __33__TUILiveKeyView_controlKeyColor__block_invoke;
  v4[3] = &unk_1E55938B8;
  v4[4] = self;
  double v2 = [MEMORY[0x1E4FB1618] colorWithDynamicProvider:v4];
  return v2;
}

id __33__TUILiveKeyView_controlKeyColor__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) traitCollection];
  if ([v1 userInterfaceStyle] == 2)
  {
    double v2 = 0.580392157;
    double v3 = 0.26;
    double v4 = 0.580392157;
    double v5 = 0.580392157;
  }
  else
  {
    double v2 = 0.28627451;
    double v4 = 0.368627451;
    double v5 = 0.498039216;
    double v3 = 0.23;
  }
  v6 = [MEMORY[0x1E4FB1618] colorWithRed:v2 green:v4 blue:v5 alpha:v3];

  return v6;
}

- (id)highlightedKeyCapColor
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__TUILiveKeyView_highlightedKeyCapColor__block_invoke;
  v4[3] = &unk_1E55938B8;
  v4[4] = self;
  double v2 = [MEMORY[0x1E4FB1618] colorWithDynamicProvider:v4];
  return v2;
}

id __40__TUILiveKeyView_highlightedKeyCapColor__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) traitCollection];
  if ([v1 userInterfaceStyle] == 2)
  {
    double v2 = 0.42;
    double v3 = 1.0;
    double v4 = 0.42;
    double v5 = 0.42;
  }
  else
  {
    double v2 = 0.49;
    double v4 = 0.51;
    double v5 = 0.54;
    double v3 = 1.0;
  }
  v6 = [MEMORY[0x1E4FB1618] colorWithRed:v2 green:v4 blue:v5 alpha:v3];

  return v6;
}

- (id)keyCapColor
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __29__TUILiveKeyView_keyCapColor__block_invoke;
  v4[3] = &unk_1E55938B8;
  v4[4] = self;
  double v2 = [MEMORY[0x1E4FB1618] colorWithDynamicProvider:v4];
  return v2;
}

id __29__TUILiveKeyView_keyCapColor__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) traitCollection];
  BOOL v2 = [v1 userInterfaceStyle] == 2;
  double v3 = [MEMORY[0x1E4FB1618] whiteColor];
  double v4 = [v3 colorWithAlphaComponent:dbl_18D516050[v2]];

  return v4;
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)TUILiveKeyView;
  [(TUILiveKeyView *)&v15 layoutSubviews];
  [(TUILiveKeyView *)self drawingInsets];
  [(TUILiveKeyView *)self bounds];
  UIRectInset();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = -[TUILiveKeyView roundedRectForRect:](self, "roundedRectForRect:");
  v12 = [(TUILiveKeyView *)self keyCapBackground];
  [v12 setPath:v11];

  v13 = -[TUILiveKeyView shadowPathForRect:](self, "shadowPathForRect:", v4, v6, v8, v10);
  v14 = [(TUILiveKeyView *)self keyCapShadow];
  [v14 setPath:v13];
}

- (id)shadowPathForRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = [MEMORY[0x1E4FB14C0] bezierPath];
  double v9 = [(TUILiveKeyView *)self traits];
  double v10 = [v9 geometry];
  [v10 roundRectRadius];
  double v12 = v11;

  v18.origin.double x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  CGFloat v13 = CGRectGetMaxY(v18) - v12;
  objc_msgSend(v8, "moveToPoint:", x, v13);
  objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0);
  v19.origin.double x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  CGFloat v14 = CGRectGetMaxX(v19) - v12;
  v20.origin.double x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  objc_msgSend(v8, "addLineToPoint:", v14, CGRectGetMaxY(v20));
  v21.origin.double x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, CGRectGetMaxX(v21) - v12, v13, v12, 1.57079633, 0.0);
  v22.origin.double x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  CGFloat v15 = v13 + 1.0;
  objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, CGRectGetMaxX(v22) - v12, v15, v12, 0.0, 1.57079633);
  v23.origin.double x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  objc_msgSend(v8, "addLineToPoint:", x + v12, CGRectGetMaxY(v23) + 1.0);
  objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, x + v12, v15, v12, 1.57079633, 3.14159265);
  [v8 closePath];
  return v8;
}

- (id)roundedRectForRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v7 = (void *)MEMORY[0x1E4FB14C0];
  double v8 = [(TUILiveKeyView *)self traits];
  double v9 = [v8 geometry];
  [v9 roundRectRadius];
  double v11 = objc_msgSend(v7, "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, v10);

  [v11 fillWithBlendMode:7 alpha:0.5];
  return v11;
}

- (UIEdgeInsets)drawingInsets
{
  if ([(TUILiveKeyView *)self keyStyle] == 2)
  {
    double v3 = 3.0;
    double v4 = 11.0;
    double v5 = 9.0;
  }
  else
  {
    int64_t v6 = [(TUILiveKeyView *)self keyStyle];
    if (v6 == 3) {
      double v3 = 2.0;
    }
    else {
      double v3 = 3.0;
    }
    double v5 = 7.0;
    if (v6 == 3) {
      double v4 = 7.0;
    }
    else {
      double v4 = 8.0;
    }
  }
  double v7 = 1.0;
  result.right = v3;
  result.bottom = v4;
  result.left = v5;
  result.top = v7;
  return result;
}

- (void)updateLabelWeight:(int64_t)a3
{
  v65[2] = *MEMORY[0x1E4F143B8];
  if ([(TUILiveKeyView *)self keyStyle] == 1) {
    return;
  }
  double v5 = [(TUILiveKeyView *)self symbolImageView];

  if (v5) {
    return;
  }
  switch(a3)
  {
    case 2:
      CGFloat v13 = [(TUILiveKeyView *)self keyLabel];
      [v13 setTextAlignment:2];

      CGFloat v14 = [(TUILiveKeyView *)self verticalContentConstraint];
      if ([v14 isActive])
      {
        CGFloat v15 = [(TUILiveKeyView *)self symbolImageView];

        if (v15)
        {
          v16 = (void *)MEMORY[0x1E4F28DC8];
          v17 = [(TUILiveKeyView *)self horizontalContentConstraint];
          v61[0] = v17;
          CGRect v18 = [(TUILiveKeyView *)self verticalContentConstraint];
          v61[1] = v18;
          CGRect v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:2];
          [v16 deactivateConstraints:v19];
        }
      }
      else
      {
      }
      v27 = [(TUILiveKeyView *)self symbolImageView];

      if (!v27) {
        return;
      }
      v28 = [(TUILiveKeyView *)self symbolImageView];
      v29 = [v28 trailingAnchor];
      v30 = [(TUILiveKeyView *)self trailingAnchor];
      v31 = [v29 constraintEqualToAnchor:v30 constant:-10.0];
      [(TUILiveKeyView *)self setHorizontalContentConstraint:v31];

      v32 = [(TUILiveKeyView *)self bottomAnchor];
      v33 = [(TUILiveKeyView *)self symbolImageView];
      v34 = [v33 bottomAnchor];
      v35 = [v32 constraintEqualToAnchor:v34 constant:8.0];
      [(TUILiveKeyView *)self setVerticalContentConstraint:v35];

      v36 = (void *)MEMORY[0x1E4F28DC8];
      v37 = [(TUILiveKeyView *)self horizontalContentConstraint];
      v60[0] = v37;
      v38 = [(TUILiveKeyView *)self verticalContentConstraint];
      v60[1] = v38;
      v39 = (void *)MEMORY[0x1E4F1C978];
      v40 = v60;
LABEL_24:
      v59 = [v39 arrayWithObjects:v40 count:2];
      [v36 activateConstraints:v59];

      [(TUILiveKeyView *)self layoutIfNeeded];
      return;
    case 1:
      CGRect v20 = [(TUILiveKeyView *)self keyLabel];
      [v20 setTextAlignment:0];

      CGRect v21 = [(TUILiveKeyView *)self horizontalContentConstraint];
      if ([v21 isActive])
      {
        CGRect v22 = [(TUILiveKeyView *)self symbolImageView];

        if (v22)
        {
          CGRect v23 = (void *)MEMORY[0x1E4F28DC8];
          v24 = [(TUILiveKeyView *)self horizontalContentConstraint];
          v63[0] = v24;
          v25 = [(TUILiveKeyView *)self verticalContentConstraint];
          v63[1] = v25;
          v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:2];
          [v23 deactivateConstraints:v26];
        }
      }
      else
      {
      }
      v41 = [(TUILiveKeyView *)self symbolImageView];

      if (!v41) {
        return;
      }
      v42 = [(TUILiveKeyView *)self symbolImageView];
      v43 = [v42 leadingAnchor];
      v44 = [(TUILiveKeyView *)self leadingAnchor];
      v45 = [v43 constraintEqualToAnchor:v44 constant:10.0];
      [(TUILiveKeyView *)self setHorizontalContentConstraint:v45];

      v46 = [(TUILiveKeyView *)self bottomAnchor];
      v47 = [(TUILiveKeyView *)self symbolImageView];
      v48 = [v47 bottomAnchor];
      v49 = [v46 constraintEqualToAnchor:v48 constant:8.0];
      [(TUILiveKeyView *)self setVerticalContentConstraint:v49];

      v36 = (void *)MEMORY[0x1E4F28DC8];
      v37 = [(TUILiveKeyView *)self horizontalContentConstraint];
      v62[0] = v37;
      v38 = [(TUILiveKeyView *)self verticalContentConstraint];
      v62[1] = v38;
      v39 = (void *)MEMORY[0x1E4F1C978];
      v40 = v62;
      goto LABEL_24;
    case 0:
      int64_t v6 = [(TUILiveKeyView *)self keyLabel];
      [v6 setTextAlignment:1];

      double v7 = [(TUILiveKeyView *)self horizontalContentConstraint];
      if ([v7 isActive])
      {
        double v8 = [(TUILiveKeyView *)self symbolImageView];

        if (v8)
        {
          double v9 = (void *)MEMORY[0x1E4F28DC8];
          double v10 = [(TUILiveKeyView *)self horizontalContentConstraint];
          v65[0] = v10;
          double v11 = [(TUILiveKeyView *)self verticalContentConstraint];
          v65[1] = v11;
          double v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:2];
          [v9 deactivateConstraints:v12];
        }
      }
      else
      {
      }
      v50 = [(TUILiveKeyView *)self symbolImageView];

      if (v50)
      {
        v51 = [(TUILiveKeyView *)self symbolImageView];
        v52 = [v51 centerXAnchor];
        v53 = [(TUILiveKeyView *)self leadingAnchor];
        v54 = [v52 constraintEqualToAnchor:v53];
        [(TUILiveKeyView *)self setHorizontalContentConstraint:v54];

        v55 = [(TUILiveKeyView *)self symbolImageView];
        v56 = [v55 centerYAnchor];
        v57 = [(TUILiveKeyView *)self centerYAnchor];
        v58 = [v56 constraintEqualToAnchor:v57];
        [(TUILiveKeyView *)self setVerticalContentConstraint:v58];

        v36 = (void *)MEMORY[0x1E4F28DC8];
        v37 = [(TUILiveKeyView *)self horizontalContentConstraint];
        v64[0] = v37;
        v38 = [(TUILiveKeyView *)self verticalContentConstraint];
        v64[1] = v38;
        v39 = (void *)MEMORY[0x1E4F1C978];
        v40 = v64;
        goto LABEL_24;
      }
      break;
  }
}

- (void)updateLabelInsets
{
  if ([(TUILiveKeyView *)self keyStyle] == 2) {
    double v3 = 5.0;
  }
  else {
    double v3 = 4.0;
  }
  if ([(TUILiveKeyView *)self layoutType] == 3)
  {
    if ([(TUILiveKeyView *)self keyStyle] == 2) {
      double v3 = 10.0;
    }
    else {
      double v3 = 4.0;
    }
  }
  double v4 = [(TUILiveKeyView *)self labelBottom];
  [v4 setConstant:v3];

  int64_t v5 = [(TUILiveKeyView *)self keyStyle];
  int64_t v6 = [(TUILiveKeyView *)self layoutType];
  if (v5 == 2 || v6 == 3) {
    double v8 = 6.0;
  }
  else {
    double v8 = 3.0;
  }
  id v9 = [(TUILiveKeyView *)self labelTrailing];
  [v9 setConstant:v8];
}

- (void)updateLabelText:(id)a3
{
  id v7 = a3;
  -[TUILiveKeyView setKeyCap:](self, "setKeyCap:");
  double v4 = [(TUILiveKeyView *)self keyLabel];

  if (v4)
  {
    if ([(TUILiveKeyView *)self layoutType] == 2
      || [(TUILiveKeyView *)self layoutType] == 3
      && ([(TUILiveKeyView *)self imageName],
          int64_t v6 = objc_claimAutoreleasedReturnValue(),
          v6,
          !v6))
    {
      int64_t v5 = [(TUILiveKeyView *)self keyLabel];
      [v5 setText:v7];
    }
  }
}

- (void)updateFontSize:(double)a3
{
  [(TUILiveKeyView *)self fontSize];
  if (v5 == 0.0)
  {
    int64_t v6 = [(TUILiveKeyView *)self fontForLabel];
    id v7 = [(TUILiveKeyView *)self keyLabel];
    [v7 setFont:v6];
  }
  else
  {
    [(TUILiveKeyView *)self fontSize];
    if (vabdd_f64(a3, v8) < 1.0) {
      return;
    }
    int64_t v6 = [(TUILiveKeyView *)self keyLabel];
    id v7 = [v6 font];
    id v9 = [v7 fontWithSize:a3];
    double v10 = [(TUILiveKeyView *)self keyLabel];
    [v10 setFont:v9];
  }
  [(TUILiveKeyView *)self setFontSize:a3];
}

- (id)fontForSymbolStyle:(id)a3
{
  id v3 = a3;
  double v4 = [v3 fontName];
  [v3 fontWeight];
  double v6 = v5;
  [v3 fontSize];
  double v8 = v7;

  int v9 = [v4 isEqualToString:*MEMORY[0x1E4FB2AC0]];
  double v10 = 22.0;
  if (v8 > 0.0) {
    double v10 = v8;
  }
  if (v9) {
    [MEMORY[0x1E4FB08E0] systemFontOfSize:v10 weight:v6];
  }
  else {
  double v11 = [MEMORY[0x1E4FB08E0] fontWithName:v4 size:4096 traits:v10];
  }

  return v11;
}

- (id)fontForLabel
{
  id v3 = [(TUILiveKeyView *)self traits];
  double v4 = [v3 symbolStyle];
  double v5 = [(TUILiveKeyView *)self fontForSymbolStyle:v4];

  return v5;
}

- (id)labelForKeyCap:(id)a3
{
  v30[2] = *MEMORY[0x1E4F143B8];
  double v4 = (objc_class *)MEMORY[0x1E4FB1930];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v6 setTextAlignment:1];
  [v6 setText:v5];

  if ([(TUILiveKeyView *)self usesBlueBackground])
  {
    double v7 = (void *)MEMORY[0x1E4FB1618];
    double v8 = [(TUILiveKeyView *)self traits];
    int v9 = [v8 symbolStyle];
    double v10 = [v9 textColor];
    double v11 = [v7 colorWithCGColor:UIKBGetNamedColor()];
    [v6 setTextColor:v11];
  }
  [(TUILiveKeyView *)self addSubview:v6];
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  CGFloat v13 = [v6 topAnchor];
  CGFloat v14 = [(TUILiveKeyView *)self topAnchor];
  CGFloat v15 = [v13 constraintEqualToAnchor:v14];

  v16 = [(TUILiveKeyView *)self bottomAnchor];
  v17 = [v6 bottomAnchor];
  CGRect v18 = [v16 constraintEqualToAnchor:v17];

  v30[0] = v15;
  v30[1] = v18;
  CGRect v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
  [v12 addObjectsFromArray:v19];

  CGRect v20 = [v6 leadingAnchor];
  CGRect v21 = [(TUILiveKeyView *)self leadingAnchor];
  CGRect v22 = [v20 constraintEqualToAnchor:v21 constant:0.0];

  CGRect v23 = [(TUILiveKeyView *)self trailingAnchor];
  v24 = [v6 trailingAnchor];
  v25 = [v23 constraintEqualToAnchor:v24 constant:0.0];

  v29[0] = v22;
  v29[1] = v25;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
  [v12 addObjectsFromArray:v26];

  [MEMORY[0x1E4F28DC8] activateConstraints:v12];
  v27 = [(TUILiveKeyView *)self labelBottom];

  if (!v27)
  {
    [(TUILiveKeyView *)self setLabelBottom:v18];
    [(TUILiveKeyView *)self setLabelLeading:v22];
    [(TUILiveKeyView *)self setLabelTrailing:v25];
  }
  [(TUILiveKeyView *)self updateLabelInsets];

  return v6;
}

- (void)keyWithLabel
{
  id v3 = [(TUILiveKeyView *)self keyLabel];

  if (!v3)
  {
    double v4 = [(TUILiveKeyView *)self keyCap];
    id v5 = [(TUILiveKeyView *)self labelForKeyCap:v4];
    [(TUILiveKeyView *)self setKeyLabel:v5];
  }
  id v6 = [(TUILiveKeyView *)self keyCap];
  [(TUILiveKeyView *)self updateLabelText:v6];
}

- (id)symbolImageConfigForRenderTraits:(id)a3 traitCollection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = [v5 symbolStyle];
  uint64_t v8 = MEMORY[0x192FA06B0]([v7 fontWeightForSymbolImage]);

  if (!v8)
  {
    int v9 = [v5 symbolStyle];
    uint64_t v10 = MEMORY[0x192FA06B0]([v9 fontWeight]);

    if (v10) {
      uint64_t v8 = v10;
    }
    else {
      uint64_t v8 = 4;
    }
  }
  double v11 = [v5 symbolStyle];
  [v11 fontSizeForSymbolImage];
  double v13 = v12;

  if (v13 == 0.0)
  {
    CGFloat v14 = [v5 symbolStyle];
    [v14 fontSize];
    double v13 = v15;
  }
  v16 = (void *)MEMORY[0x1E4FB1830];
  v17 = [v5 symbolStyle];
  CGRect v18 = objc_msgSend(v16, "configurationWithPointSize:weight:scale:", v8, objc_msgSend(v17, "symbolScale"), v13);

  CGRect v19 = [v18 configurationWithTraitCollection:v6];

  return v19;
}

- (id)imageWithName:(id)a3
{
  id v4 = a3;
  id v5 = [(TUILiveKeyView *)self traits];
  id v6 = [(TUILiveKeyView *)self traitCollection];
  double v7 = [(TUILiveKeyView *)self symbolImageConfigForRenderTraits:v5 traitCollection:v6];

  uint64_t v8 = [MEMORY[0x1E4FB1818] systemImageNamed:v4 withConfiguration:v7];

  return v8;
}

- (void)updateSymbolInsets
{
  int64_t v3 = [(TUILiveKeyView *)self keyStyle];
  id v4 = [(TUILiveKeyView *)self symbolImageView];
  id v5 = [v4 image];
  [v5 baselineOffsetFromBottom];
  double v7 = v6;

  uint64_t v8 = [(TUILiveKeyView *)self traits];
  int v9 = [v8 symbolStyle];
  [v9 textOffset];
  if (v3 == 1) {
    double v11 = -v10;
  }
  else {
    double v11 = v10;
  }
  if (v3 == 1) {
    double v12 = -2.0;
  }
  else {
    double v12 = -3.0;
  }

  double v13 = [(TUILiveKeyView *)self traits];
  CGFloat v14 = [v13 symbolStyle];
  [v14 textOffset];
  double v16 = v15;

  v17 = [(TUILiveKeyView *)self horizontalContentConstraint];
  [v17 setConstant:v11 + v12];

  id v18 = [(TUILiveKeyView *)self verticalContentConstraint];
  [v18 setConstant:v16 + v7 * -0.5];
}

- (void)keyWithSymbolView
{
  v36[2] = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(TUILiveKeyView *)self symbolImageView];

  if (v3)
  {
    if ([(TUILiveKeyView *)self usesImage])
    {
      id v4 = [(TUILiveKeyView *)self imageName];

      if (v4)
      {
        id v5 = [(TUILiveKeyView *)self imageName];
        double v6 = [(TUILiveKeyView *)self imageWithName:v5];

        double v7 = [(TUILiveKeyView *)self symbolImageView];
        [v7 setImage:v6];
      }
    }
  }
  else
  {
    uint64_t v8 = [(TUILiveKeyView *)self imageName];

    if (v8)
    {
      int v9 = [(TUILiveKeyView *)self imageName];
      double v10 = [(TUILiveKeyView *)self imageWithName:v9];

      double v11 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v10];
      [(TUILiveKeyView *)self setSymbolImageView:v11];

      double v12 = [(TUILiveKeyView *)self symbolImageView];
      [v12 setTranslatesAutoresizingMaskIntoConstraints:0];

      double v13 = [(TUILiveKeyView *)self symbolImageView];
      [v13 setContentMode:1];

      CGFloat v14 = [MEMORY[0x1E4FB1618] labelColor];
      double v15 = [(TUILiveKeyView *)self symbolImageView];
      [v15 setTintColor:v14];

      double v16 = [(TUILiveKeyView *)self symbolImageView];
      [(TUILiveKeyView *)self addSubview:v16];

      v17 = [(TUILiveKeyView *)self symbolImageView];
      id v18 = [v17 centerXAnchor];
      CGRect v19 = [(TUILiveKeyView *)self centerXAnchor];
      CGRect v20 = [v18 constraintEqualToAnchor:v19];
      [(TUILiveKeyView *)self setHorizontalContentConstraint:v20];

      [(TUILiveKeyView *)self keyStyle];
      CGRect v21 = [(TUILiveKeyView *)self symbolImageView];
      CGRect v22 = [v21 centerYAnchor];
      CGRect v23 = [(TUILiveKeyView *)self centerYAnchor];
      v24 = [v22 constraintEqualToAnchor:v23];
      [(TUILiveKeyView *)self setVerticalContentConstraint:v24];

      v25 = (void *)MEMORY[0x1E4F28DC8];
      v26 = [(TUILiveKeyView *)self horizontalContentConstraint];
      v36[0] = v26;
      v27 = [(TUILiveKeyView *)self verticalContentConstraint];
      v36[1] = v27;
      v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
      [v25 activateConstraints:v28];
    }
  }
  v29 = [(TUILiveKeyView *)self symbolImageView];

  if (v29)
  {
    v30 = (void *)MEMORY[0x1E4FB1618];
    v31 = [(TUILiveKeyView *)self traits];
    v32 = [v31 symbolStyle];
    v33 = [v32 textColor];
    v34 = [v30 colorWithCGColor:UIKBGetNamedColor()];
    v35 = [(TUILiveKeyView *)self symbolImageView];
    [v35 setTintColor:v34];
  }
  [(TUILiveKeyView *)self updateSymbolInsets];
}

- (void)makeKeyBackgrounds
{
  v65[8] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(TUILiveKeyView *)self keyCapBackground];
  if (!v3
    || (id v4 = (void *)v3,
        [(TUILiveKeyView *)self keyCapShadow],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        !v5))
  {
    double v6 = [TUIDrawingView alloc];
    double v7 = *MEMORY[0x1E4F1DB28];
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    double v11 = -[TUIDrawingView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], v8, v9, v10);
    [(TUILiveKeyView *)self setKeyCapShadow:v11];

    double v12 = [(TUILiveKeyView *)self keyCapShadow];
    [v12 setTranslatesAutoresizingMaskIntoConstraints:0];

    double v13 = [(TUILiveKeyView *)self keyCapShadow];
    [(TUILiveKeyView *)self addSubview:v13];

    CGFloat v14 = -[TUIDrawingView initWithFrame:]([TUIDrawingView alloc], "initWithFrame:", v7, v8, v9, v10);
    [(TUILiveKeyView *)self setKeyCapBackground:v14];

    double v15 = [(TUILiveKeyView *)self keyCapBackground];
    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

    double v16 = [(TUILiveKeyView *)self keyCapBackground];
    [(TUILiveKeyView *)self addSubview:v16];

    v48 = (void *)MEMORY[0x1E4F28DC8];
    v64 = [(TUILiveKeyView *)self keyCapShadow];
    v62 = [v64 topAnchor];
    v63 = [(TUILiveKeyView *)self keyCapBackground];
    v61 = [v63 topAnchor];
    v60 = [v62 constraintEqualToAnchor:v61];
    v65[0] = v60;
    v59 = [(TUILiveKeyView *)self keyCapShadow];
    v57 = [v59 leadingAnchor];
    v58 = [(TUILiveKeyView *)self keyCapBackground];
    v56 = [v58 leadingAnchor];
    v55 = [v57 constraintEqualToAnchor:v56];
    v65[1] = v55;
    v54 = [(TUILiveKeyView *)self keyCapBackground];
    v52 = [v54 bottomAnchor];
    v53 = [(TUILiveKeyView *)self keyCapShadow];
    v51 = [v53 bottomAnchor];
    v50 = [v52 constraintEqualToAnchor:v51];
    v65[2] = v50;
    v49 = [(TUILiveKeyView *)self keyCapBackground];
    v46 = [v49 trailingAnchor];
    v47 = [(TUILiveKeyView *)self keyCapShadow];
    v45 = [v47 trailingAnchor];
    v44 = [v46 constraintEqualToAnchor:v45];
    void v65[3] = v44;
    v43 = [(TUILiveKeyView *)self keyCapBackground];
    v42 = [v43 topAnchor];
    v41 = [(TUILiveKeyView *)self topAnchor];
    v40 = [v42 constraintEqualToAnchor:v41];
    v65[4] = v40;
    v39 = [(TUILiveKeyView *)self keyCapBackground];
    v38 = [v39 leadingAnchor];
    v37 = [(TUILiveKeyView *)self leadingAnchor];
    v36 = [v38 constraintEqualToAnchor:v37];
    v65[5] = v36;
    v17 = [(TUILiveKeyView *)self bottomAnchor];
    id v18 = [(TUILiveKeyView *)self keyCapBackground];
    CGRect v19 = [v18 bottomAnchor];
    CGRect v20 = [v17 constraintEqualToAnchor:v19];
    v65[6] = v20;
    CGRect v21 = [(TUILiveKeyView *)self trailingAnchor];
    CGRect v22 = [(TUILiveKeyView *)self keyCapBackground];
    CGRect v23 = [v22 trailingAnchor];
    v24 = [v21 constraintEqualToAnchor:v23];
    v65[7] = v24;
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:8];
    [v48 activateConstraints:v25];
  }
  id v26 = [(TUILiveKeyView *)self shadowColor];
  uint64_t v27 = [v26 CGColor];
  v28 = [(TUILiveKeyView *)self keyCapShadow];
  v29 = [v28 shapeLayer];
  [v29 setFillColor:v27];

  if ([(TUILiveKeyView *)self layoutType] == 2 || [(TUILiveKeyView *)self layoutType] == 4)
  {
    uint64_t v30 = [(TUILiveKeyView *)self keyCapColor];
  }
  else
  {
    uint64_t v30 = [(TUILiveKeyView *)self controlKeyColor];
  }
  v31 = (void *)v30;
  if ([(TUILiveKeyView *)self usesBlueBackground]) {
    uint64_t v32 = UIKBGetNamedColor();
  }
  else {
    uint64_t v32 = [v31 CGColor];
  }
  uint64_t v33 = v32;
  v34 = [(TUILiveKeyView *)self keyCapBackground];
  v35 = [v34 shapeLayer];
  [v35 setFillColor:v33];
}

- (void)updateRenderTraits:(id)a3 displayContents:(id)a4
{
  v29 = (UIKBRenderTraits *)a3;
  id v8 = a4;
  if (self->_traits == v29) {
    goto LABEL_21;
  }
  objc_storeStrong((id *)&self->_traits, a3);
  if ([(TUILiveKeyView *)self layoutType] == 3)
  {
    double v9 = [(TUILiveKeyView *)self renderConfig];
    double v10 = [v9 controlKeyBackgroundName];
    if (v10)
    {

      goto LABEL_6;
    }
    uint64_t v4 = [(TUILiveKeyView *)self usesBlueBackground];

    if (v4)
    {
LABEL_6:
      BOOL v11 = [(TUILiveKeyView *)self usesBlueBackground];
      BOOL v12 = v11;
      if (v11)
      {
        double v13 = (void *)*MEMORY[0x1E4FB2AB8];
      }
      else
      {
        uint64_t v4 = [(TUILiveKeyView *)self renderConfig];
        double v13 = [(id)v4 controlKeyBackgroundName];
      }
      uint64_t v14 = UIKBGetNamedColor();
      double v15 = [(TUILiveKeyView *)self keyCapBackground];
      double v16 = [v15 shapeLayer];
      [v16 setFillColor:v14];

      if (!v12)
      {
      }
    }
  }
  if ([(TUILiveKeyView *)self usesImage])
  {
    v17 = [v8 displayStringImage];
    [(TUILiveKeyView *)self setImageName:v17];

    [(TUILiveKeyView *)self keyWithSymbolView];
  }
  else
  {
    id v18 = [v8 displayString];
    CGRect v19 = v18;
    if (v18)
    {
      id v20 = v18;
    }
    else
    {
      CGRect v21 = [v8 fallbackContents];
      id v20 = [v21 displayString];
    }
    if ([v20 length])
    {
      CGRect v22 = [(TUILiveKeyView *)self keyCap];
      [(TUILiveKeyView *)self updateLabelText:v22];
    }
    CGRect v23 = [(UIKBRenderTraits *)v29 symbolStyle];
    [v23 fontSize];
    double v25 = v24;
    [(TUILiveKeyView *)self fontSize];
    double v27 = v26;

    if (v25 != v27)
    {
      v28 = [(UIKBRenderTraits *)v29 symbolStyle];
      [v28 fontSize];
      -[TUILiveKeyView updateFontSize:](self, "updateFontSize:");
    }
  }
LABEL_21:
}

- (void)updateKeyStyle:(int64_t)a3
{
  if (self->_keyStyle != a3)
  {
    self->_keyStyle = a3;
    uint64_t v4 = [(TUILiveKeyView *)self keyLabel];

    if (v4) {
      [(TUILiveKeyView *)self updateLabelInsets];
    }
    id v5 = [(TUILiveKeyView *)self symbolImageView];

    if (v5)
    {
      [(TUILiveKeyView *)self updateSymbolInsets];
    }
  }
}

- (TUILiveKeyView)initWithKey:(id)a3 renderTraits:(id)a4 displayContents:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v29.receiver = self;
  v29.super_class = (Class)TUILiveKeyView;
  BOOL v12 = -[TUILiveKeyView initWithFrame:](&v29, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (!v12) {
    goto LABEL_33;
  }
  double v13 = [v11 displayString];
  uint64_t v14 = v13;
  if (!v13)
  {
    id v5 = [v11 fallbackContents];
    uint64_t v14 = [v5 displayString];
  }
  objc_storeStrong((id *)&v12->_keyCap, v14);
  if (!v13)
  {
  }
  v12->_keyStyle = [v9 style];
  v12->_isShowingHighlight = 0;
  v12->_fontSize = 0.0;
  if ([v9 style] == -1) {
    v12->_keyStyle = 2;
  }
  objc_storeStrong((id *)&v12->_traits, a4);
  imageName = [v10 symbolStyle];
  if ([imageName usesSymbolImage]
    && (![v11 stringKeycapOverImage] || objc_msgSend(v11, "forceImageKeycap")))
  {
    double v16 = [v11 displayStringImage];

    if (!v16)
    {
      int v18 = 0;
      goto LABEL_15;
    }
    uint64_t v17 = [v11 displayStringImage];
    imageName = v12->_imageName;
    v12->_imageName = (NSString *)v17;
    int v18 = 1;
  }
  else
  {
    int v18 = 0;
  }

LABEL_15:
  CGRect v19 = [v9 backingTree];
  int v20 = [v19 displayType];

  if (v20 == 23) {
    v12->_isShift = 1;
  }
  v12->_usesBlueBackground = 0;
  if ([v9 layoutType] == 3)
  {
    CGRect v21 = [v10 backgroundGradient];
    CGRect v22 = [v21 flatColorName];
    int v23 = [v22 containsString:@"Blue"];

    if (v23) {
      v12->_usesBlueBackground = 1;
    }
    v12->_layoutType = 3;
    v12->_layoutShape = 0;
  }
  else if ([v9 layoutType] == 4)
  {
    v12->_layoutType = 4;
    v12->_layoutShape = 0;
    double v24 = [v9 backingTree];
    double v25 = [v24 name];
    [(TUILiveKeyView *)v12 setAccessibilityIdentifier:v25];
  }
  else
  {
    if ([v9 layoutShape] == -1) {
      uint64_t v26 = 0;
    }
    else {
      uint64_t v26 = [v9 layoutShape];
    }
    v12->_layoutShape = v26;
    if ([v9 layoutType] == -1) {
      v12->_layoutType = 2;
    }
    else {
      v12->_layoutType = [v9 layoutType];
    }
  }
  v12->_usesImage = v18;
  double v27 = [MEMORY[0x1E4FB1618] clearColor];
  [(TUILiveKeyView *)v12 setBackgroundColor:v27];

  [(TUILiveKeyView *)v12 makeKeyBackgrounds];
  if (v18) {
    [(TUILiveKeyView *)v12 keyWithSymbolView];
  }
  else {
    [(TUILiveKeyView *)v12 keyWithLabel];
  }
LABEL_33:

  return v12;
}

@end