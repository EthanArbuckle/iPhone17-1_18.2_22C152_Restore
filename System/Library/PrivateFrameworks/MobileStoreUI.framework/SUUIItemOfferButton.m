@interface SUUIItemOfferButton
+ (BOOL)_sizeMattersForTitleStyle:(int64_t)a3;
+ (BOOL)canOpenItemForItemState:(id)a3 clientContext:(id)a4;
+ (CGSize)_titleSizeThatFitsForSize:(CGSize)a3 titleStyle:(int64_t)a4 mutableAttributedString:(id)a5;
+ (SUUIItemOfferButton)itemOfferButtonWithAppearance:(id)a3;
+ (UIEdgeInsets)_imageInsetsForProgressType:(int64_t)a3;
+ (id)_basicAnimationWithKeyPath:(id)a3;
+ (id)_cachedImageForAttributedTitle:(id)a3 titleStyle:(int64_t)a4 size:(CGSize)a5 fillStyle:(int64_t)a6 universal:(BOOL)a7 tintColor:(id)a8 interfaceStyle:(int64_t)a9;
+ (id)_defaultTitleAttributes;
+ (id)_imageForAttributedTitle:(id)a3 titleStyle:(int64_t)a4 size:(CGSize)a5 fillStyle:(int64_t)a6 universal:(BOOL)a7 tintColor:(id)a8;
+ (id)_imageForProgressType:(int64_t)a3;
+ (id)_universalPlusImageWithTintColor:(id)a3;
+ (id)cloudImageWithTintColor:(id)a3 arrowTintColor:(id)a4;
+ (id)cloudTintColorForBackgroundColor:(id)a3;
+ (id)localizedTitleForItemState:(id)a3 clientContext:(id)a4;
+ (id)playHighlightImageWithTintColor:(id)a3;
+ (id)playImageWithTintColor:(id)a3;
+ (id)playTintColorForBackgroundColor:(id)a3;
- (BOOL)_touchInBounds:(id)a3;
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)hasBorderedImage;
- (BOOL)hasNonBorderedImage;
- (BOOL)isDisabledButSelectable;
- (BOOL)isShowingConfirmation;
- (BOOL)isUniversal;
- (BOOL)restores;
- (BOOL)setTitle:(id)a3 confirmationTitle:(id)a4 itemState:(id)a5 clientContext:(id)a6 animated:(BOOL)a7;
- (BOOL)setValuesUsingBuyButtonDescriptor:(id)a3 itemState:(id)a4 clientContext:(id)a5 animated:(BOOL)a6;
- (BOOL)setValuesUsingItemOffer:(id)a3 itemState:(id)a4 clientContext:(id)a5 animated:(BOOL)a6;
- (BOOL)showsConfirmationState;
- (BOOL)supportsPlayButton;
- (CGRect)_borderedImageViewFrame;
- (CGSize)layoutSizeThatFits:(CGSize)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)buyType;
- (NSString)confirmationTitle;
- (NSString)offerButtonStateDescription;
- (NSString)title;
- (SUUIButtonViewElement)element;
- (SUUIBuyButtonDescriptor)buttonDescriptor;
- (SUUIItemOfferButton)initWithFrame:(CGRect)a3;
- (SUUIItemOfferButtonDelegate)delegate;
- (UIColor)cloudTintColor;
- (UIImage)borderedImage;
- (UIImage)image;
- (double)_horizontalInsetForTitleStyle:(int64_t)a3;
- (double)borderColorAlphaMultiplier;
- (double)progress;
- (id)_buttonPropertiesForState:(id)a3;
- (id)_imageForProgressType:(int64_t)a3;
- (id)centerImageProvider;
- (int64_t)confirmationTitleStyle;
- (int64_t)fillStyle;
- (int64_t)progressType;
- (int64_t)titleStyle;
- (void)_adjustViewOrderingForProperties:(id)a3;
- (void)_cancelGestureAction:(id)a3;
- (void)_insertBorderView;
- (void)_insertBorderedImageView;
- (void)_insertCancelGestureRecognizer;
- (void)_insertImageView;
- (void)_insertLabel;
- (void)_insertProgressIndicator;
- (void)_insertUniversalView;
- (void)_reloadForCurrentState:(BOOL)a3;
- (void)_removeCancelGestureRecognizer;
- (void)_sendDidAnimate;
- (void)_sendWillAnimate;
- (void)_transitionFromBorderedImage:(id)a3 toTitle:(id)a4 withDuration:(double)a5 completion:(id)a6;
- (void)_transitionFromImage:(id)a3 toImage:(id)a4 withDuration:(double)a5 completion:(id)a6;
- (void)_transitionFromProgress:(id)a3 toProgress:(id)a4 withDuration:(double)a5 completion:(id)a6;
- (void)_transitionFromProgress:(id)a3 toTitleOrImage:(id)a4 withDuration:(double)a5 completion:(id)a6;
- (void)_transitionFromTitle:(id)a3 toTitle:(id)a4 withDuration:(double)a5 completion:(id)a6;
- (void)_transitionFromTitleOrImage:(id)a3 toProgress:(id)a4 withDuration:(double)a5 completion:(id)a6;
- (void)_updateForChangedConfirmationTitleProperty;
- (void)_updateForChangedTitleProperty;
- (void)cancelTrackingWithEvent:(id)a3;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)drawRect:(CGRect)a3;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)removeButtonStateAnimations;
- (void)setBackgroundColor:(id)a3;
- (void)setBorderColorAlphaMultiplier:(double)a3;
- (void)setBorderedImage:(id)a3;
- (void)setButtonDescriptor:(id)a3;
- (void)setBuyType:(id)a3;
- (void)setCenterImageProvider:(id)a3;
- (void)setCloudTintColor:(id)a3;
- (void)setColoringWithAppearance:(id)a3;
- (void)setConfirmationTitle:(id)a3;
- (void)setConfirmationTitleStyle:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDisabledButSelectable:(BOOL)a3;
- (void)setElement:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFillStyle:(int64_t)a3;
- (void)setFrame:(CGRect)a3;
- (void)setImage:(id)a3;
- (void)setProgress:(double)a3;
- (void)setProgress:(double)a3 animated:(BOOL)a4;
- (void)setProgressType:(int64_t)a3;
- (void)setProgressType:(int64_t)a3 animated:(BOOL)a4;
- (void)setShowingConfirmation:(BOOL)a3 animated:(BOOL)a4;
- (void)setShowsConfirmationState:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setTitleStyle:(int64_t)a3;
- (void)setUniversal:(BOOL)a3;
- (void)showCloudImage;
- (void)tintColorDidChange;
@end

@implementation SUUIItemOfferButton

- (SUUIItemOfferButton)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SUUIItemOfferButton;
  v3 = -[SUUIItemOfferButton initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.5];
    cloudTintColor = v3->_cloudTintColor;
    v3->_cloudTintColor = (UIColor *)v4;

    uint64_t v6 = [MEMORY[0x263F825C8] colorWithRed:0.0980392157 green:0.670588235 blue:0.125490196 alpha:1.0];
    confirmationColor = v3->_confirmationColor;
    v3->_confirmationColor = (UIColor *)v6;

    v3->_fillStyle = 0;
    v3->_borderColorAlphaMultiplier = 1.0;
    offerButtonStateDescription = v3->_offerButtonStateDescription;
    v3->_offerButtonStateDescription = (NSString *)&stru_2704F8130;
  }
  return v3;
}

- (void)dealloc
{
  [(SUUIFocusedTouchGestureRecognizer *)self->_cancelGestureRecognizer removeTarget:self action:0];
  v3.receiver = self;
  v3.super_class = (Class)SUUIItemOfferButton;
  [(SUUIItemOfferButton *)&v3 dealloc];
}

- (NSString)confirmationTitle
{
  return (NSString *)[(NSMutableAttributedString *)self->_confirmationTitleAttributedString string];
}

- (CGSize)layoutSizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if ([(SUUIItemOfferButton *)self isShowingConfirmation])
  {
    uint64_t v6 = (void *)[(NSMutableAttributedString *)self->_titleAttributedString mutableCopy];
    [(SUUIItemOfferButton *)self _horizontalInsetForTitleStyle:self->_titleStyle];
    double v8 = v7;
    if ([(id)objc_opt_class() _sizeMattersForTitleStyle:self->_titleStyle]) {
      objc_msgSend((id)objc_opt_class(), "_titleSizeThatFitsForSize:titleStyle:mutableAttributedString:", self->_titleStyle, v6, width + v8 * -2.0, height);
    }
    else {
      double v9 = self->_titleFitSize.width;
    }
    double v13 = ceil(v9 + v8 * 2.0);
    double v14 = fmax(v13, 59.0);
    if (v14 > 109.0) {
      double v14 = 109.0;
    }
    if (self->_titleStyle == 2) {
      double v12 = v14;
    }
    else {
      double v12 = v13;
    }

    double v10 = 26.0;
  }
  else
  {
    -[SUUIItemOfferButton sizeThatFits:](self, "sizeThatFits:", width, height);
    double v12 = v11;
  }
  double v15 = v12;
  result.double height = v10;
  result.double width = v15;
  return result;
}

- (UIImage)image
{
  image = self->_image;
  if (!image) {
    image = self->_cloudImage;
  }
  return image;
}

- (NSString)offerButtonStateDescription
{
  if ([(SUUIItemOfferButton *)self showsConfirmationState]
    && ![(SUUIItemOfferButton *)self isShowingConfirmation])
  {
    objc_super v3 = @"buyInitiate";
  }
  else
  {
    objc_super v3 = self->_offerButtonStateDescription;
  }
  return (NSString *)v3;
}

- (BOOL)isShowingConfirmation
{
  v2 = [(SUUIItemOfferButton *)self buttonDescriptor];
  char v3 = [v2 showingConfirmation];

  return v3;
}

- (int64_t)progressType
{
  v2 = [(SUUIItemOfferButton *)self buttonDescriptor];
  int64_t v3 = [v2 progressType];

  return v3;
}

- (void)removeButtonStateAnimations
{
  int64_t v3 = [(UIView *)self->_borderView layer];
  uint64_t v4 = [v3 animationKeys];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    [(SUUIItemOfferButton *)self _sendWillAnimate];
    [(SUUIItemOfferButton *)self _reloadForCurrentState:0];
    [(SUUIItemOfferButton *)self _sendDidAnimate];
  }
}

- (void)setBorderColorAlphaMultiplier:(double)a3
{
  if (vabdd_f64(self->_borderColorAlphaMultiplier, a3) > 0.00000011920929)
  {
    self->_borderColorAlphaMultiplier = a3;
    [(SUUIItemOfferButton *)self _reloadForCurrentState:0];
  }
}

- (void)setConfirmationTitle:(id)a3
{
  id v9 = a3;
  id v5 = [(SUUIItemOfferButton *)self confirmationTitle];
  uint64_t v6 = v5;
  if (v5 != v9 && ([v5 isEqualToString:v9] & 1) == 0)
  {
    if (v9)
    {
      id v7 = objc_alloc(MEMORY[0x263F089B8]);
      int64_t v3 = [(id)objc_opt_class() _defaultTitleAttributes];
      double v8 = (void *)[v7 initWithString:v9 attributes:v3];
    }
    else
    {
      double v8 = 0;
    }
    objc_storeStrong((id *)&self->_confirmationTitleAttributedString, v8);
    if (v9)
    {
    }
    [(SUUIItemOfferButton *)self _updateForChangedConfirmationTitleProperty];
  }
}

- (void)setConfirmationTitleStyle:(int64_t)a3
{
  if (self->_confirmationTitleStyle != a3)
  {
    self->_confirmationTitleStyle = a3;
    [(SUUIItemOfferButton *)self _updateForChangedConfirmationTitleProperty];
  }
}

- (void)setFillStyle:(int64_t)a3
{
  if (self->_fillStyle != a3)
  {
    self->_fillStyle = a3;
    [(SUUIItemOfferButton *)self _reloadForCurrentState:0];
  }
}

- (void)setImage:(id)a3
{
  id v5 = (UIImage *)a3;
  image = self->_image;
  if (!image) {
    image = self->_cloudImage;
  }
  if (image != v5)
  {
    cloudImage = self->_cloudImage;
    self->_cloudImage = 0;
    id v9 = v5;

    borderedImage = self->_borderedImage;
    self->_borderedImage = 0;

    objc_storeStrong((id *)&self->_image, a3);
    [(SUUIItemOfferButton *)self _reloadForCurrentState:0];
    id v5 = v9;
  }
}

- (void)setBorderedImage:(id)a3
{
  id v5 = (UIImage *)a3;
  if (self->_borderedImage != v5)
  {
    cloudImage = self->_cloudImage;
    self->_cloudImage = 0;
    double v8 = v5;

    image = self->_image;
    self->_image = 0;

    objc_storeStrong((id *)&self->_borderedImage, a3);
    [(SUUIItemOfferButton *)self _reloadForCurrentState:0];
    id v5 = v8;
  }
}

- (void)setProgress:(double)a3
{
}

- (void)setProgress:(double)a3 animated:(BOOL)a4
{
  self->_progress = a3;
  -[SUUICircleProgressIndicator setProgress:animated:](self->_progressIndicator, "setProgress:animated:", a4);
}

- (void)setProgressType:(int64_t)a3
{
}

- (void)setProgressType:(int64_t)a3 animated:(BOOL)a4
{
  id v7 = [(SUUIItemOfferButton *)self buttonDescriptor];
  uint64_t v8 = [v7 progressType];

  if (v8 != a3)
  {
    if (a4)
    {
      [(SUUIItemOfferButton *)self _reloadForCurrentState:1];
      id v9 = [(SUUIItemOfferButton *)self buttonDescriptor];
      uint64_t v10 = [v9 progressType];

      double v11 = [(SUUIItemOfferButton *)self buttonDescriptor];
      double v12 = [(SUUIItemOfferButton *)self _buttonPropertiesForState:v11];

      double v13 = [(SUUIItemOfferButton *)self buttonDescriptor];
      [v13 setProgressType:a3];

      double v14 = [(SUUIItemOfferButton *)self buttonDescriptor];
      [v14 setHighlighted:0];

      double v15 = [(SUUIItemOfferButton *)self buttonDescriptor];
      [v15 setShowingConfirmation:0];

      v16 = [(SUUIItemOfferButton *)self buttonDescriptor];
      v17 = [(SUUIItemOfferButton *)self _buttonPropertiesForState:v16];

      if (v10)
      {
        v18 = [(SUUIItemOfferButton *)self buttonDescriptor];
        uint64_t v19 = [v18 progressType];

        if (v19)
        {
          v25[0] = MEMORY[0x263EF8330];
          v25[1] = 3221225472;
          v25[2] = __48__SUUIItemOfferButton_setProgressType_animated___block_invoke;
          v25[3] = &unk_265400AC8;
          v25[4] = self;
          [(SUUIItemOfferButton *)self _transitionFromProgress:v12 toProgress:v17 withDuration:v25 completion:0.4];
        }
        v23[0] = MEMORY[0x263EF8330];
        v23[1] = 3221225472;
        v23[2] = __48__SUUIItemOfferButton_setProgressType_animated___block_invoke_3;
        v23[3] = &unk_265400AC8;
        v23[4] = self;
        [(SUUIItemOfferButton *)self _transitionFromProgress:v12 toTitleOrImage:v17 withDuration:v23 completion:0.4];
      }
      else
      {
        v24[0] = MEMORY[0x263EF8330];
        v24[1] = 3221225472;
        v24[2] = __48__SUUIItemOfferButton_setProgressType_animated___block_invoke_2;
        v24[3] = &unk_265400AC8;
        v24[4] = self;
        [(SUUIItemOfferButton *)self _transitionFromTitleOrImage:v12 toProgress:v17 withDuration:v24 completion:0.4];
      }
    }
    else
    {
      v20 = [(SUUIItemOfferButton *)self buttonDescriptor];
      [v20 setProgressType:a3];

      v21 = [(SUUIItemOfferButton *)self buttonDescriptor];
      [v21 setHighlighted:0];

      v22 = [(SUUIItemOfferButton *)self buttonDescriptor];
      [v22 setShowingConfirmation:0];

      [(SUUIItemOfferButton *)self _sendWillAnimate];
      [(SUUIItemOfferButton *)self _reloadForCurrentState:0];
      [(SUUIItemOfferButton *)self _sendDidAnimate];
    }
  }
}

uint64_t __48__SUUIItemOfferButton_setProgressType_animated___block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _reloadForCurrentState:0];
  }
  return result;
}

uint64_t __48__SUUIItemOfferButton_setProgressType_animated___block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _reloadForCurrentState:0];
  }
  return result;
}

uint64_t __48__SUUIItemOfferButton_setProgressType_animated___block_invoke_3(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _reloadForCurrentState:0];
  }
  return result;
}

- (void)setShowingConfirmation:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v5 = a3;
  if ([(SUUIItemOfferButton *)self isShowingConfirmation] != a3)
  {
    if (a4)
    {
      [(SUUIItemOfferButton *)self _reloadForCurrentState:1];
      id v7 = [(SUUIItemOfferButton *)self buttonDescriptor];
      uint64_t v8 = [(SUUIItemOfferButton *)self _buttonPropertiesForState:v7];

      id v9 = [(SUUIItemOfferButton *)self buttonDescriptor];
      [v9 setShowingConfirmation:v5];

      uint64_t v10 = [(SUUIItemOfferButton *)self buttonDescriptor];
      [v10 setHighlighted:0];

      double v11 = [(SUUIItemOfferButton *)self buttonDescriptor];
      double v12 = [(SUUIItemOfferButton *)self _buttonPropertiesForState:v11];

      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __55__SUUIItemOfferButton_setShowingConfirmation_animated___block_invoke;
      v15[3] = &unk_265400AC8;
      v15[4] = self;
      [(SUUIItemOfferButton *)self _transitionFromTitle:v8 toTitle:v12 withDuration:v15 completion:0.26];
    }
    else
    {
      double v13 = [(SUUIItemOfferButton *)self buttonDescriptor];
      [v13 setShowingConfirmation:v5];

      double v14 = [(SUUIItemOfferButton *)self buttonDescriptor];
      [v14 setHighlighted:0];

      [(SUUIItemOfferButton *)self _reloadForCurrentState:0];
    }
  }
}

uint64_t __55__SUUIItemOfferButton_setShowingConfirmation_animated___block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _reloadForCurrentState:0];
  }
  return result;
}

- (void)setTitle:(id)a3
{
  id v9 = a3;
  id v5 = [(SUUIItemOfferButton *)self title];
  uint64_t v6 = v5;
  if (v5 != v9 && ([v5 isEqualToString:v9] & 1) == 0)
  {
    if (v9)
    {
      id v7 = objc_alloc(MEMORY[0x263F089B8]);
      int64_t v3 = [(id)objc_opt_class() _defaultTitleAttributes];
      uint64_t v8 = (void *)[v7 initWithString:v9 attributes:v3];
    }
    else
    {
      uint64_t v8 = 0;
    }
    objc_storeStrong((id *)&self->_titleAttributedString, v8);
    if (v9)
    {
    }
    [(SUUIItemOfferButton *)self _updateForChangedTitleProperty];
  }
}

- (void)setTitleStyle:(int64_t)a3
{
  if (self->_titleStyle != a3)
  {
    self->_titleStyle = a3;
    [(SUUIItemOfferButton *)self _updateForChangedTitleProperty];
  }
}

- (void)setUniversal:(BOOL)a3
{
  if (self->_universal != a3)
  {
    self->_universal = a3;
    [(SUUIItemOfferButton *)self _reloadForCurrentState:0];
  }
}

- (void)showCloudImage
{
  if (!self->_cloudImage)
  {
    int64_t v3 = objc_opt_class();
    cloudTintColor = self->_cloudTintColor;
    id v5 = [(SUUIItemOfferButton *)self tintColor];
    uint64_t v6 = [v3 cloudImageWithTintColor:cloudTintColor arrowTintColor:v5];
    cloudImage = self->_cloudImage;
    self->_cloudImage = v6;

    image = self->_image;
    self->_image = 0;

    [(SUUIItemOfferButton *)self _reloadForCurrentState:0];
  }
}

- (NSString)title
{
  return (NSString *)[(NSMutableAttributedString *)self->_titleAttributedString string];
}

- (SUUIBuyButtonDescriptor)buttonDescriptor
{
  buttonDescriptor = self->_buttonDescriptor;
  if (!buttonDescriptor)
  {
    uint64_t v4 = objc_alloc_init(SUUIBuyButtonDescriptor);
    id v5 = self->_buttonDescriptor;
    self->_buttonDescriptor = v4;

    buttonDescriptor = self->_buttonDescriptor;
  }
  return buttonDescriptor;
}

- (NSString)buyType
{
  v2 = [(SUUIItemOfferButton *)self element];
  int64_t v3 = [v2 attributes];
  uint64_t v4 = [v3 objectForKey:@"data-type"];
  id v5 = (void *)[v4 copy];

  return (NSString *)v5;
}

+ (id)cloudImageWithTintColor:(id)a3 arrowTintColor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!cloudImageWithTintColor_arrowTintColor__sCloudArrowImage)
  {
    uint64_t v8 = (void *)MEMORY[0x263F827E8];
    id v9 = SUUIBundle();
    uint64_t v10 = [v8 imageNamed:@"CloudloadButtonArrow" inBundle:v9];
    double v11 = (void *)cloudImageWithTintColor_arrowTintColor__sCloudArrowImage;
    cloudImageWithTintColor_arrowTintColor__sCloudArrowImage = v10;
  }
  if (!cloudImageWithTintColor_arrowTintColor__sCloudButtonImage)
  {
    double v12 = (void *)MEMORY[0x263F827E8];
    double v13 = SUUIBundle();
    uint64_t v14 = [v12 imageNamed:@"CloudloadButtonCloud" inBundle:v13];
    double v15 = (void *)cloudImageWithTintColor_arrowTintColor__sCloudButtonImage;
    cloudImageWithTintColor_arrowTintColor__sCloudButtonImage = v14;
  }
  v16 = (void *)cloudImageWithTintColor_arrowTintColor__sTintedImage;
  if (cloudImageWithTintColor_arrowTintColor__sTintedImage) {
    BOOL v17 = cloudImageWithTintColor_arrowTintColor__sLastArrowColor == (void)v7;
  }
  else {
    BOOL v17 = 0;
  }
  if (v17 && cloudImageWithTintColor_arrowTintColor__sLastCloudColor == (void)v6) {
    goto LABEL_18;
  }
  uint64_t v19 = [(id)cloudImageWithTintColor_arrowTintColor__sCloudArrowImage _flatImageWithColor:v7];
  v20 = [(id)cloudImageWithTintColor_arrowTintColor__sCloudButtonImage _flatImageWithColor:v6];
  [v20 size];
  double v22 = v21;
  [v19 size];
  if (v22 < v23) {
    double v22 = v23;
  }
  [v20 size];
  double v25 = v24;
  [v19 size];
  if (v25 < v26) {
    double v25 = v26;
  }
  [v19 scale];
  CGFloat v28 = v27;
  v36.double width = v22;
  v36.double height = v25;
  UIGraphicsBeginImageContextWithOptions(v36, 0, v28);
  if (UIGraphicsGetCurrentContext())
  {
    double v29 = *MEMORY[0x263F00148];
    double v30 = *(double *)(MEMORY[0x263F00148] + 8);
    objc_msgSend(v20, "drawAtPoint:", *MEMORY[0x263F00148], v30);
    objc_msgSend(v19, "drawAtPoint:", v29, v30);
    uint64_t v31 = UIGraphicsGetImageFromCurrentImageContext();
    v32 = (void *)cloudImageWithTintColor_arrowTintColor__sTintedImage;
    cloudImageWithTintColor_arrowTintColor__sTintedImage = v31;

    UIGraphicsEndImageContext();
    objc_storeStrong((id *)&cloudImageWithTintColor_arrowTintColor__sLastArrowColor, a4);
    objc_storeStrong((id *)&cloudImageWithTintColor_arrowTintColor__sLastCloudColor, a3);

    v16 = (void *)cloudImageWithTintColor_arrowTintColor__sTintedImage;
LABEL_18:
    id v33 = v16;
    goto LABEL_20;
  }

  id v33 = 0;
LABEL_20:

  return v33;
}

+ (id)cloudTintColorForBackgroundColor:(id)a3
{
  id v3 = a3;
  if (!cloudTintColorForBackgroundColor__sDarkBackgroundCloudColor)
  {
    uint64_t v4 = [MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:0.5];
    id v5 = (void *)cloudTintColorForBackgroundColor__sDarkBackgroundCloudColor;
    cloudTintColorForBackgroundColor__sDarkBackgroundCloudColor = v4;
  }
  id v6 = &unk_269F6B000;
  if (!cloudTintColorForBackgroundColor__sLightBackgroundCloudColor)
  {
    uint64_t v7 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.5];
    uint64_t v8 = (void *)cloudTintColorForBackgroundColor__sLightBackgroundCloudColor;
    cloudTintColorForBackgroundColor__sLightBackgroundCloudColor = v7;
  }
  unint64_t v9 = SUUIColorSchemeStyleForColor(v3);
  if (v9 <= 3) {
    id v6 = (id)*off_2654057B0[v9];
  }

  return v6;
}

- (BOOL)hasNonBorderedImage
{
  return self->_image || self->_cloudImage != 0;
}

- (BOOL)hasBorderedImage
{
  return self->_borderedImage != 0;
}

+ (SUUIItemOfferButton)itemOfferButtonWithAppearance:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  [v5 setColoringWithAppearance:v4];

  return (SUUIItemOfferButton *)v5;
}

+ (id)localizedTitleForItemState:(id)a3 clientContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [v6 state];
  if ((v8 & 3) != 0) {
    goto LABEL_2;
  }
  char v10 = v8;
  if (v8 & 0x20 | [v6 libraryContentFlags] & 2)
  {
    if (v7)
    {
      double v11 = @"ITEM_OFFER_BUTTON_UPDATE";
      goto LABEL_31;
    }
    double v12 = @"ITEM_OFFER_BUTTON_UPDATE";
  }
  else if ((v10 & 4) != 0)
  {
    if ([a1 canOpenItemForItemState:v6 clientContext:v7])
    {
      if (v7)
      {
        double v11 = @"ITEM_OFFER_BUTTON_OPEN";
        goto LABEL_31;
      }
      double v12 = @"ITEM_OFFER_BUTTON_OPEN";
    }
    else
    {
      if (v7)
      {
        double v11 = @"ITEM_OFFER_BUTTON_INSTALLED";
        goto LABEL_31;
      }
      double v12 = @"ITEM_OFFER_BUTTON_INSTALLED";
    }
  }
  else if ((v10 & 0x40) != 0)
  {
    if ([v6 mediaCategory] == 3)
    {
      if (v7)
      {
        double v11 = @"ITEM_OFFER_BUTTON_READ";
        goto LABEL_31;
      }
      double v12 = @"ITEM_OFFER_BUTTON_READ";
    }
    else if ([v6 mediaCategory] == 5)
    {
      if (v7)
      {
        double v11 = @"ITEM_OFFER_BUTTON_UNSUBSCRIBE";
        goto LABEL_31;
      }
      double v12 = @"ITEM_OFFER_BUTTON_UNSUBSCRIBE";
    }
    else
    {
      if (v7)
      {
        double v11 = @"ITEM_OFFER_BUTTON_PLAY";
        goto LABEL_31;
      }
      double v12 = @"ITEM_OFFER_BUTTON_PLAY";
    }
  }
  else if ((v10 & 0x10) != 0)
  {
    if (v7)
    {
      double v11 = @"ITEM_OFFER_BUTTON_GRATIS";
      goto LABEL_31;
    }
    double v12 = @"ITEM_OFFER_BUTTON_GRATIS";
  }
  else
  {
    if ((v10 & 8) == 0)
    {
LABEL_2:
      unint64_t v9 = 0;
      goto LABEL_33;
    }
    if (v7)
    {
      double v11 = @"ITEM_OFFER_BUTTON_PURCHASED";
LABEL_31:
      uint64_t v13 = [v7 localizedStringForKey:v11];
      goto LABEL_32;
    }
    double v12 = @"ITEM_OFFER_BUTTON_PURCHASED";
  }
  uint64_t v13 = +[SUUIClientContext localizedStringForKey:v12 inBundles:0];
LABEL_32:
  unint64_t v9 = (void *)v13;
LABEL_33:

  return v9;
}

- (BOOL)restores
{
  return self->_downloadRestores;
}

- (void)setCloudTintColor:(id)a3
{
  id v4 = (UIColor *)a3;
  if (self->_cloudTintColor != v4)
  {
    double v12 = v4;
    id v5 = (UIColor *)[(UIColor *)v4 copy];
    cloudTintColor = self->_cloudTintColor;
    self->_cloudTintColor = v5;

    id v4 = v12;
    if (self->_cloudImage)
    {
      id v7 = objc_opt_class();
      char v8 = self->_cloudTintColor;
      unint64_t v9 = [(SUUIItemOfferButton *)self tintColor];
      char v10 = [v7 cloudImageWithTintColor:v8 arrowTintColor:v9];
      cloudImage = self->_cloudImage;
      self->_cloudImage = v10;

      [(SUUIItemOfferButton *)self setNeedsDisplay];
      id v4 = v12;
    }
  }
}

- (void)setColoringWithAppearance:(id)a3
{
  id v9 = a3;
  if (v9)
  {
    id v4 = [(id)objc_opt_class() cloudTintColorForBackgroundColor:self->_backgroundColor];
    cloudTintColor = self->_cloudTintColor;
    self->_cloudTintColor = v4;

    id v6 = [v9 confirmationColor];
    confirmationColor = self->_confirmationColor;
    self->_confirmationColor = v6;

    char v8 = [v9 buttonColor];
    [(SUUIItemOfferButton *)self setTintColor:v8];
  }
  else
  {
    char v8 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.5];
    [(SUUIItemOfferButton *)self setCloudTintColor:v8];
  }
}

- (void)setDisabledButSelectable:(BOOL)a3
{
  self->_disabledButSelectable = a3;
  [(SUUIItemOfferButton *)self setNeedsLayout];
}

- (BOOL)setTitle:(id)a3 confirmationTitle:(id)a4 itemState:(id)a5 clientContext:(id)a6 animated:(BOOL)a7
{
  BOOL v64 = a7;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  offerButtonStateDescription = self->_offerButtonStateDescription;
  self->_offerButtonStateDescription = (NSString *)&stru_2704F8130;

  unint64_t v16 = [v13 state];
  uint64_t v17 = [(SUUIItemOfferButton *)self supportsPlayButton];
  v18 = [(SUUIItemOfferButton *)self buttonDescriptor];
  [v18 setShouldSuppressEnabled:0];

  uint64_t v19 = [(SUUIItemOfferButton *)self buttonDescriptor];
  [v19 setShowsUniversal:1];

  [(SUUIItemOfferButton *)self setEnabled:1];
  id v61 = v12;
  id v62 = v11;
  id v59 = v14;
  id v60 = v13;
  unsigned __int8 v57 = v17;
  if (v16)
  {
    uint64_t v23 = 0;
    int v58 = 0;
    unsigned int v56 = 0;
    uint64_t v17 = 0;
    id v21 = 0;
    id v20 = 0;
    uint64_t v55 = (v16 >> 3) & 1;
    uint64_t v24 = 1;
    goto LABEL_15;
  }
  if ((v16 & 2) != 0)
  {
    [v13 downloadProgress];
    [(SUUIItemOfferButton *)self setProgress:v25];
    uint64_t v23 = 0;
    int v58 = 0;
    unsigned int v56 = 0;
    uint64_t v17 = 0;
    id v21 = 0;
    id v20 = 0;
    uint64_t v24 = 2;
    uint64_t v55 = (v16 >> 3) & 1;
    goto LABEL_15;
  }
  if ((v16 & 0x20) != 0)
  {
    id v20 = [(id)objc_opt_class() localizedTitleForItemState:v13 clientContext:v14];
    double v26 = self->_offerButtonStateDescription;
    double v27 = @"update";
LABEL_12:
    self->_offerButtonStateDescription = &v27->isa;

    uint64_t v23 = 0;
    LODWORD(v55) = 0;
    uint64_t v24 = 0;
    unsigned int v56 = 0;
    uint64_t v17 = 0;
LABEL_13:
    id v21 = 0;
    goto LABEL_14;
  }
  if ((v16 & 4) != 0)
  {
    id v20 = [(id)objc_opt_class() localizedTitleForItemState:v13 clientContext:v14];
    int v41 = [(id)objc_opt_class() canOpenItemForItemState:v13 clientContext:v14];
    double v26 = self->_offerButtonStateDescription;
    if (!v41)
    {
      self->_offerButtonStateDescription = (NSString *)@"installed";

      v47 = [(SUUIItemOfferButton *)self buttonDescriptor];
      int v58 = 1;
      [v47 setShouldSuppressEnabled:1];

      v48 = [(SUUIItemOfferButton *)self buttonDescriptor];
      [v48 setShowsUniversal:0];

      [(SUUIItemOfferButton *)self setEnabled:0];
LABEL_44:
      LODWORD(v55) = 0;
      uint64_t v24 = 0;
      unsigned int v56 = 0;
      uint64_t v17 = 0;
      id v21 = 0;
      uint64_t v23 = 2;
      goto LABEL_15;
    }
    double v27 = @"open";
    goto LABEL_12;
  }
  if ((v16 & 0x40) != 0)
  {
    v43 = objc_opt_class();
    v44 = v43;
    if (v17)
    {
      v45 = [(id)objc_opt_class() playTintColorForBackgroundColor:self->_backgroundColor];
      v46 = [v44 playImageWithTintColor:v45];
      [(SUUIItemOfferButton *)self setImage:v46];

      uint64_t v23 = 0;
      LODWORD(v55) = 0;
      uint64_t v24 = 0;
      unsigned int v56 = 0;
      uint64_t v17 = 0;
      id v21 = 0;
      id v20 = 0;
      goto LABEL_14;
    }
    id v20 = [v43 localizedTitleForItemState:v13 clientContext:v14];
    uint64_t v23 = 0;
    LODWORD(v55) = 0;
    uint64_t v24 = 0;
    unsigned int v56 = 0;
    goto LABEL_13;
  }
  if ((v16 & 8) != 0)
  {
    v49 = [(SUUIItemOfferButton *)self buttonDescriptor];
    uint64_t v17 = [v49 shouldSuppressCloudRestore];

    if (!v17)
    {
      v53 = self->_offerButtonStateDescription;
      self->_offerButtonStateDescription = (NSString *)@"download";

      uint64_t v24 = 0;
      unsigned int v56 = 0;
      id v21 = 0;
      id v20 = 0;
      LODWORD(v55) = 1;
      uint64_t v23 = 2;
      goto LABEL_14;
    }
    id v20 = [(id)objc_opt_class() localizedTitleForItemState:v13 clientContext:v14];
    v50 = [(SUUIItemOfferButton *)self buttonDescriptor];
    int v58 = 1;
    [v50 setShouldSuppressEnabled:1];

    v51 = [(SUUIItemOfferButton *)self buttonDescriptor];
    [v51 setShowsUniversal:0];

    [(SUUIItemOfferButton *)self setEnabled:0];
    v52 = self->_offerButtonStateDescription;
    self->_offerButtonStateDescription = (NSString *)@"purchased";

    goto LABEL_44;
  }
  if ((v16 & 0x10) == 0)
  {
    id v20 = v11;
    id v21 = v12;
    unsigned int v56 = [(SUUIItemOfferButton *)self isShowingConfirmation];
    uint64_t v17 = [v21 length] != 0;
    double v22 = self->_offerButtonStateDescription;
    self->_offerButtonStateDescription = (NSString *)@"buy";

    uint64_t v23 = 0;
    LODWORD(v55) = 0;
    uint64_t v24 = 0;
LABEL_14:
    int v58 = 1;
    goto LABEL_15;
  }
  id v20 = [(id)objc_opt_class() localizedTitleForItemState:v13 clientContext:v14];
  if (v14) {
    [v14 localizedStringForKey:@"ITEM_OFFER_BUTTON_INSTALL_APP"];
  }
  else {
  id v21 = +[SUUIClientContext localizedStringForKey:@"ITEM_OFFER_BUTTON_INSTALL_APP" inBundles:0];
  }
  v54 = self->_offerButtonStateDescription;
  self->_offerButtonStateDescription = (NSString *)@"download";

  uint64_t v23 = 0;
  LODWORD(v55) = 0;
  uint64_t v24 = 0;
  unsigned int v56 = 0;
  int v58 = 1;
  uint64_t v17 = 1;
LABEL_15:
  self->_downloadRestores = (v16 & 0x400) != 0;
  [(SUUIItemOfferButton *)self setFillStyle:v23];
  [(SUUIItemOfferButton *)self setShowsConfirmationState:v17];
  int v28 = [(SUUIItemOfferButton *)self isShowingConfirmation];
  int64_t v29 = [(SUUIItemOfferButton *)self progressType];
  double v30 = &OBJC_IVAR___SUUIItemOfferButton__titleAttributedString;
  if (v28) {
    double v30 = &OBJC_IVAR___SUUIItemOfferButton__confirmationTitleAttributedString;
  }
  id v31 = *(id *)((char *)&self->super.super.super.super.isa + *v30);
  v32 = [(UIImageView *)self->_imageView image];
  v63 = v21;
  [(SUUIItemOfferButton *)self setConfirmationTitle:v21];
  id v33 = v20;
  [(SUUIItemOfferButton *)self setTitle:v20];
  if (v58 && (v57 & ((v16 & 0x40) != 0)) == 0)
  {
    if (v55) {
      [(SUUIItemOfferButton *)self showCloudImage];
    }
    else {
      [(SUUIItemOfferButton *)self setImage:0];
    }
  }
  if (v24 == v29)
  {
    [(SUUIItemOfferButton *)self setShowingConfirmation:v56 animated:v64];
    if (v56 == v28)
    {
      v39 = [(UIImageView *)self->_imageView image];

      if (v39 == v32)
      {
        v40 = &OBJC_IVAR___SUUIItemOfferButton__titleAttributedString;
        if (v56) {
          v40 = &OBJC_IVAR___SUUIItemOfferButton__confirmationTitleAttributedString;
        }
        if (v31 == *(id *)((char *)&self->super.super.super.super.isa + *v40)) {
          LOBYTE(v34) = 0;
        }
        else {
          int v34 = objc_msgSend(v31, "isEqualToAttributedString:") ^ 1;
        }
      }
      else
      {
        LOBYTE(v34) = 1;
      }
    }
    else
    {
      LOBYTE(v34) = !v64;
    }
    CGSize v36 = v61;
    v35 = v62;
    v38 = v59;
    v37 = v60;
  }
  else
  {
    [(SUUIItemOfferButton *)self setProgressType:v24 animated:v64];
    CGSize v36 = v61;
    v35 = v62;
    v38 = v59;
    v37 = v60;
    if (v64)
    {
      LOBYTE(v34) = 0;
    }
    else if (v29)
    {
      LOBYTE(v34) = v58;
    }
    else
    {
      LOBYTE(v34) = 1;
    }
  }

  return v34;
}

- (BOOL)setValuesUsingItemOffer:(id)a3 itemState:(id)a4 clientContext:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [v10 buttonText];
  id v14 = [v10 confirmationText];
  if (!v14)
  {
    [v10 price];
    if (v15 == 0.0)
    {
      if (v12) {
        [v12 localizedStringForKey:@"ITEM_OFFER_BUTTON_INSTALL_APP"];
      }
      else {
      id v14 = +[SUUIClientContext localizedStringForKey:@"ITEM_OFFER_BUTTON_INSTALL_APP" inBundles:0];
      }
    }
    else
    {
      id v14 = 0;
    }
  }
  BOOL v16 = [(SUUIItemOfferButton *)self setTitle:v13 confirmationTitle:v14 itemState:v11 clientContext:v12 animated:v6];

  return v16;
}

- (BOOL)setValuesUsingBuyButtonDescriptor:(id)a3 itemState:(id)a4 clientContext:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = (SUUIItemState *)a4;
  id v12 = a5;
  [(SUUIItemOfferButton *)self setButtonDescriptor:v10];
  uint64_t v13 = [v10 buttonType];
  if (v13 == 1)
  {
    if (v11)
    {
      [(SUUIItemState *)v11 setState:[(SUUIItemState *)v11 state] | 8];
    }
    else
    {
      id v20 = objc_msgSend(objc_alloc(NSNumber), "initWithLongLong:", objc_msgSend(v10, "itemIdentifier"));
      id v11 = objc_alloc_init(SUUIItemState);
      [(SUUIItemState *)v11 setItemIdentifier:v20];
      id v21 = [[SUUIStoreIdentifier alloc] initWithNumber:v20];
      [(SUUIItemState *)v11 setStoreIdentifier:v21];

      [(SUUIItemState *)v11 setState:8];
    }
    goto LABEL_15;
  }
  if (!v11)
  {
LABEL_15:
    uint64_t v17 = 0;
    goto LABEL_16;
  }
  uint64_t v14 = v13;
  uint64_t v15 = [(SUUIItemState *)v11 state];
  uint64_t v16 = v15;
  uint64_t v17 = 0;
  if (v14 == 2 && v15) {
    uint64_t v17 = [(SUUIItemState *)v11 activeStateIsPreview] ^ 1;
  }
  BOOL v18 = v14 == 2;
  if (v18 == (([(SUUIItemState *)v11 libraryContentFlags] & 1) == 0)) {
    v16 &= ~0x40uLL;
  }
  if (v18 == (([(SUUIItemState *)v11 downloadContentFlags] & 1) == 0)) {
    v16 &= 0xFFFFFFFFFFFFFFFCLL;
  }
  if ([(SUUIItemState *)v11 state] != v16)
  {
    uint64_t v19 = (SUUIItemState *)[(SUUIItemState *)v11 copy];
    [(SUUIItemState *)v19 setState:v16];

    id v11 = v19;
  }
LABEL_16:
  [(SUUIItemOfferButton *)self setHidden:v17];
  double v22 = [v10 buttonText];
  uint64_t v23 = [v10 confirmationText];
  BOOL v24 = [(SUUIItemOfferButton *)self setTitle:v22 confirmationTitle:v23 itemState:v11 clientContext:v12 animated:v6];

  [(SUUIItemOfferButton *)self _reloadForCurrentState:0];
  return v24;
}

- (BOOL)supportsPlayButton
{
  v2 = [(SUUIItemOfferButton *)self element];
  id v3 = [v2 parent];
  id v4 = [v3 attributes];
  id v5 = [v4 objectForKey:@"supportsPlayButton"];
  char v6 = [v5 BOOLValue];

  return v6;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  if (![(SUUIItemOfferButton *)self isDisabledButSelectable])
  {
    [(SUUIItemOfferButton *)self _reloadForCurrentState:1];
    id v5 = [(SUUIItemOfferButton *)self buttonDescriptor];
    char v6 = [(SUUIItemOfferButton *)self _buttonPropertiesForState:v5];

    id v7 = [(SUUIItemOfferButton *)self buttonDescriptor];
    [v7 setHighlighted:1];

    char v8 = [(SUUIItemOfferButton *)self buttonDescriptor];
    id v9 = [(SUUIItemOfferButton *)self _buttonPropertiesForState:v8];

    id v10 = [(SUUIItemOfferButton *)self buttonDescriptor];
    uint64_t v11 = [v10 progressType];

    if (v11)
    {
      [(SUUIItemOfferButton *)self _transitionFromProgress:v6 toProgress:v9 withDuration:0 completion:0.15];
    }
    else if ([(SUUIItemOfferButton *)self hasNonBorderedImage])
    {
      [(SUUIItemOfferButton *)self _transitionFromImage:v6 toImage:v9 withDuration:0 completion:0.15];
    }
    else if ([(SUUIItemOfferButton *)self hasBorderedImage])
    {
      [(SUUIItemOfferButton *)self _transitionFromBorderedImage:v6 toTitle:v9 withDuration:0 completion:0.15];
    }
    else
    {
      [(SUUIItemOfferButton *)self _transitionFromTitle:v6 toTitle:v9 withDuration:0 completion:0.15];
    }
  }
  return 1;
}

- (void)cancelTrackingWithEvent:(id)a3
{
  if (![(SUUIItemOfferButton *)self isDisabledButSelectable])
  {
    id v4 = [(SUUIItemOfferButton *)self buttonDescriptor];
    id v5 = [(SUUIItemOfferButton *)self _buttonPropertiesForState:v4];

    char v6 = [(SUUIItemOfferButton *)self buttonDescriptor];
    [v6 setHighlighted:0];

    id v7 = [(SUUIItemOfferButton *)self buttonDescriptor];
    char v8 = [(SUUIItemOfferButton *)self _buttonPropertiesForState:v7];

    id v9 = [(SUUIItemOfferButton *)self buttonDescriptor];
    uint64_t v10 = [v9 progressType];

    if (v10)
    {
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __47__SUUIItemOfferButton_cancelTrackingWithEvent___block_invoke;
      v14[3] = &unk_265400AC8;
      v14[4] = self;
      [(SUUIItemOfferButton *)self _transitionFromProgress:v5 toProgress:v8 withDuration:v14 completion:0.15];
    }
    else if ([(SUUIItemOfferButton *)self hasNonBorderedImage])
    {
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __47__SUUIItemOfferButton_cancelTrackingWithEvent___block_invoke_2;
      v13[3] = &unk_265400AC8;
      v13[4] = self;
      [(SUUIItemOfferButton *)self _transitionFromImage:v5 toImage:v8 withDuration:v13 completion:0.15];
    }
    else if ([(SUUIItemOfferButton *)self hasBorderedImage])
    {
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __47__SUUIItemOfferButton_cancelTrackingWithEvent___block_invoke_3;
      v12[3] = &unk_265400AC8;
      v12[4] = self;
      [(SUUIItemOfferButton *)self _transitionFromBorderedImage:v5 toTitle:v8 withDuration:v12 completion:0.15];
    }
    else
    {
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __47__SUUIItemOfferButton_cancelTrackingWithEvent___block_invoke_4;
      v11[3] = &unk_265400AC8;
      v11[4] = self;
      [(SUUIItemOfferButton *)self _transitionFromTitle:v5 toTitle:v8 withDuration:v11 completion:0.15];
    }
  }
}

uint64_t __47__SUUIItemOfferButton_cancelTrackingWithEvent___block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _reloadForCurrentState:0];
  }
  return result;
}

uint64_t __47__SUUIItemOfferButton_cancelTrackingWithEvent___block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _reloadForCurrentState:0];
  }
  return result;
}

uint64_t __47__SUUIItemOfferButton_cancelTrackingWithEvent___block_invoke_3(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _reloadForCurrentState:0];
  }
  return result;
}

uint64_t __47__SUUIItemOfferButton_cancelTrackingWithEvent___block_invoke_4(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _reloadForCurrentState:0];
  }
  return result;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  if (![(SUUIItemOfferButton *)self isDisabledButSelectable])
  {
    BOOL v6 = [(SUUIItemOfferButton *)self _touchInBounds:v5];
    id v7 = [(SUUIItemOfferButton *)self buttonDescriptor];
    int v8 = [v7 highlighted];

    if (v6 != v8)
    {
      id v9 = [(SUUIItemOfferButton *)self buttonDescriptor];
      uint64_t v10 = [(SUUIItemOfferButton *)self _buttonPropertiesForState:v9];

      uint64_t v11 = [(SUUIItemOfferButton *)self buttonDescriptor];
      [v11 setHighlighted:v6];

      id v12 = [(SUUIItemOfferButton *)self buttonDescriptor];
      uint64_t v13 = [(SUUIItemOfferButton *)self _buttonPropertiesForState:v12];

      uint64_t v14 = [(SUUIItemOfferButton *)self buttonDescriptor];
      uint64_t v15 = [v14 progressType];

      if (v15)
      {
        [(SUUIItemOfferButton *)self _transitionFromProgress:v10 toProgress:v13 withDuration:0 completion:0.5];
      }
      else if ([(SUUIItemOfferButton *)self hasNonBorderedImage])
      {
        [(SUUIItemOfferButton *)self _transitionFromImage:v10 toImage:v13 withDuration:0 completion:0.5];
      }
      else if ([(SUUIItemOfferButton *)self hasBorderedImage])
      {
        [(SUUIItemOfferButton *)self _transitionFromBorderedImage:v10 toTitle:v13 withDuration:0 completion:0.5];
      }
      else
      {
        [(SUUIItemOfferButton *)self _transitionFromTitle:v10 toTitle:v13 withDuration:0 completion:0.5];
      }
    }
  }

  return 1;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  BOOL v6 = [(SUUIItemOfferButton *)self buttonDescriptor];
  id v7 = [(SUUIItemOfferButton *)self _buttonPropertiesForState:v6];

  int v8 = [(SUUIItemOfferButton *)self buttonDescriptor];
  [v8 setHighlighted:0];

  id v9 = [(SUUIItemOfferButton *)self buttonDescriptor];
  uint64_t v10 = [(SUUIItemOfferButton *)self _buttonPropertiesForState:v9];

  uint64_t v11 = [(SUUIItemOfferButton *)self buttonDescriptor];
  uint64_t v12 = [v11 progressType];

  if (!v12
    && ![(SUUIItemOfferButton *)self hasNonBorderedImage]
    && ![(SUUIItemOfferButton *)self hasBorderedImage]
    && ![(SUUIItemOfferButton *)self isDisabledButSelectable])
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __54__SUUIItemOfferButton_endTrackingWithTouch_withEvent___block_invoke;
    v17[3] = &unk_265400AC8;
    v17[4] = self;
    [(SUUIItemOfferButton *)self _transitionFromTitle:v7 toTitle:v10 withDuration:v17 completion:0.25];
  }
  if ([(SUUIItemOfferButton *)self _touchInBounds:v5])
  {
    if ([(SUUIItemOfferButton *)self isDisabledButSelectable])
    {
      uint64_t v13 = [(SUUIItemOfferButton *)self element];

      if (v13)
      {
        uint64_t v14 = [(SUUIItemOfferButton *)self element];
        [v14 dispatchEvent:0x270509DB0 eventAttribute:0x270509DD0 canBubble:1 isCancelable:0 extraInfo:0 completionBlock:0];
      }
    }
    else
    {
      if ([(SUUIItemOfferButton *)self progressType]
        || [(SUUIItemOfferButton *)self hasNonBorderedImage]
        || [(SUUIItemOfferButton *)self hasBorderedImage]
        || [(SUUIItemOfferButton *)self isShowingConfirmation]
        || ![(SUUIItemOfferButton *)self showsConfirmationState])
      {
        uint64_t v15 = self;
        uint64_t v16 = 0x20000;
      }
      else
      {
        uint64_t v15 = self;
        uint64_t v16 = 0x40000;
      }
      [(SUUIItemOfferButton *)v15 sendActionsForControlEvents:v16];
    }
  }
}

uint64_t __54__SUUIItemOfferButton_endTrackingWithTouch_withEvent___block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _reloadForCurrentState:0];
  }
  return result;
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SUUIItemOfferButton *)self buttonDescriptor];
  int v6 = [v5 shouldSuppressEnabled];

  v7.receiver = self;
  v7.super_class = (Class)SUUIItemOfferButton;
  [(SUUIItemOfferButton *)&v7 setEnabled:v3 & ~v6];
  [(SUUIItemOfferButton *)self setNeedsLayout];
}

- (BOOL)_touchInBounds:(id)a3
{
  id v4 = (void *)MEMORY[0x263F82670];
  id v5 = a3;
  int v6 = [v4 currentDevice];
  uint64_t v7 = [v6 userInterfaceIdiom];

  [(SUUIItemOfferButton *)self bounds];
  double v12 = -70.0;
  if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v12 = -25.0;
  }
  double v13 = v12 + v8;
  double v14 = v12 + v9;
  double v15 = -140.0;
  if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v15 = -50.0;
  }
  double v16 = v10 - v15;
  double v17 = v11 - v15;
  [v5 locationInView:self];
  uint64_t v19 = v18;
  uint64_t v21 = v20;

  double v22 = v13;
  double v23 = v14;
  double v24 = v16;
  double v25 = v17;
  uint64_t v26 = v19;
  uint64_t v27 = v21;
  return CGRectContainsPoint(*(CGRect *)&v22, *(CGPoint *)&v26);
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (self->_usesDrawRectPath)
  {
    [(SUUIItemOfferButton *)self frame];
    double v9 = v8;
    double v11 = v10;
    v13.receiver = self;
    v13.super_class = (Class)SUUIItemOfferButton;
    -[SUUIItemOfferButton setFrame:](&v13, sel_setFrame_, x, y, width, height);
    if (v9 != width || v11 != height) {
      [(SUUIItemOfferButton *)self setNeedsDisplay];
    }
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SUUIItemOfferButton;
    -[SUUIItemOfferButton setFrame:](&v13, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  }
}

- (void)drawRect:(CGRect)a3
{
  if (!self->_usesDrawRectPath) {
    return;
  }
  [(SUUIItemOfferButton *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  if ([(SUUIItemOfferButton *)self hasNonBorderedImage])
  {
    cloudImage = self->_cloudImage;
    if (!cloudImage) {
      cloudImage = self->_image;
    }
    v43 = cloudImage;
    [(UIImage *)v43 size];
    *(float *)&double v14 = (v10 - v14) * 0.5;
    double v15 = ceilf(*(float *)&v14);
    *(float *)&double v16 = (v12 - v16) * 0.5;
    double v17 = ceilf(*(float *)&v16);
    uint64_t v18 = v43;
  }
  else
  {
    if ([(SUUIItemOfferButton *)self hasBorderedImage])
    {
      [(UIImage *)self->_borderedImage size];
      if (v20 >= v12 + -16.0) {
        double v21 = v12 + -16.0;
      }
      else {
        double v21 = v20;
      }
      float v22 = v19 * (v21 / v20);
      CGFloat v23 = ceilf(v22);
      double v24 = [(UIImage *)self->_borderedImage imageWithRenderingMode:2];
      double v25 = [MEMORY[0x263F82B60] mainScreen];
      [v25 scale];
      CGFloat v27 = v26;
      v45.double width = v23;
      v45.double height = v21;
      UIGraphicsBeginImageContextWithOptions(v45, 0, v27);

      int v28 = [(SUUIItemOfferButton *)self tintColor];
      [v28 set];

      objc_msgSend(v24, "drawInRect:", 0.0, 0.0, v23, v21);
      int64_t v29 = UIGraphicsGetImageFromCurrentImageContext();

      UIGraphicsEndImageContext();
      objc_msgSend(v29, "drawAtPoint:", (v10 - v23) * 0.5, (v12 - v21) * 0.5);
      double v30 = objc_opt_class();
      int64_t titleStyle = self->_titleStyle;
      int64_t fillStyle = self->_fillStyle;
      if ([(SUUIItemOfferButton *)self isEnabled]) {
        [(SUUIItemOfferButton *)self tintColor];
      }
      else {
      v39 = [MEMORY[0x263F825C8] labelColor];
      }
      v40 = [(SUUIItemOfferButton *)self traitCollection];
      objc_msgSend(v30, "_cachedImageForAttributedTitle:titleStyle:size:fillStyle:universal:tintColor:interfaceStyle:", 0, titleStyle, fillStyle, 0, v39, objc_msgSend(v40, "userInterfaceStyle"), v10, v12);
      v43 = (UIImage *)objc_claimAutoreleasedReturnValue();

      -[UIImage drawAtPoint:](v43, "drawAtPoint:", v6, v8);
      goto LABEL_25;
    }
    id v33 = objc_opt_class();
    titleAttributedString = self->_titleAttributedString;
    int64_t v35 = self->_titleStyle;
    int64_t v36 = self->_fillStyle;
    BOOL universal = self->_universal;
    if (self->_universal)
    {
      BOOL v3 = [(SUUIItemOfferButton *)self buttonDescriptor];
      uint64_t v38 = [v3 showsUniversal];
    }
    else
    {
      uint64_t v38 = 0;
    }
    if ([(SUUIItemOfferButton *)self isEnabled]) {
      [(SUUIItemOfferButton *)self tintColor];
    }
    else {
    int v41 = [MEMORY[0x263F825C8] labelColor];
    }
    v42 = [(SUUIItemOfferButton *)self traitCollection];
    objc_msgSend(v33, "_cachedImageForAttributedTitle:titleStyle:size:fillStyle:universal:tintColor:interfaceStyle:", titleAttributedString, v35, v36, v38, v41, objc_msgSend(v42, "userInterfaceStyle"), v10, v12);
    v43 = (UIImage *)objc_claimAutoreleasedReturnValue();

    if (universal) {
    uint64_t v18 = v43;
    }
    double v15 = v6;
    double v17 = v8;
  }
  -[UIImage drawAtPoint:](v18, "drawAtPoint:", v15, v17);
LABEL_25:
}

- (void)didMoveToWindow
{
  BOOL v3 = [(SUUIItemOfferButton *)self window];

  if (v3) {
    [(SUUIItemOfferButton *)self _reloadForCurrentState:0];
  }
  v4.receiver = self;
  v4.super_class = (Class)SUUIItemOfferButton;
  [(SUUIItemOfferButton *)&v4 didMoveToWindow];
}

- (void)layoutSubviews
{
  [(SUUIItemOfferButton *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if ([(SUUIItemOfferButton *)self isEnabled])
  {
    BOOL v11 = [(SUUIItemOfferButton *)self isDisabledButSelectable];
    double v12 = 0.4;
    if (!v11) {
      double v12 = 1.0;
    }
  }
  else
  {
    double v12 = 0.4;
  }
  [(SUUIItemOfferButton *)self setAlpha:v12];
  imageView = self->_imageView;
  if (imageView)
  {
    [(UIImageView *)imageView setContentMode:4];
    -[UIImageView setFrame:](self->_imageView, "setFrame:", v4, v6, v8, v10);
  }
  borderedImageView = self->_borderedImageView;
  if (borderedImageView)
  {
    [(UIImageView *)borderedImageView setContentMode:1];
    double v15 = self->_borderedImageView;
    [(SUUIItemOfferButton *)self _borderedImageViewFrame];
    -[UIImageView setFrame:](v15, "setFrame:");
  }
  universalImageView = self->_universalImageView;
  if (universalImageView)
  {
    [(UIImageView *)universalImageView frame];
    -[UIImageView setFrame:](self->_universalImageView, "setFrame:", 3.0, 3.0);
  }
  BOOL v17 = [(SUUIItemOfferButton *)self isShowingConfirmation];
  uint64_t v18 = &OBJC_IVAR___SUUIItemOfferButton__titleStyle;
  if (v17) {
    uint64_t v18 = &OBJC_IVAR___SUUIItemOfferButton__confirmationTitleStyle;
  }
  uint64_t v19 = *(uint64_t *)((char *)&self->super.super.super.super.isa + *v18);
  if (v19 == 2) {
    double v20 = 7.0;
  }
  else {
    double v20 = 10.0;
  }
  titleLabel = self->_titleLabel;
  v29.origin.double x = v4;
  v29.origin.double y = v6;
  v29.size.double width = v8;
  v29.size.double height = v10;
  CGRect v30 = CGRectInset(v29, v20, 0.0);
  -[UILabel setFrame:](titleLabel, "setFrame:", v30.origin.x, v30.origin.y, v30.size.width, v30.size.height);
  if ([(id)objc_opt_class() _sizeMattersForTitleStyle:v19])
  {
    float v22 = &OBJC_IVAR___SUUIItemOfferButton__titleAttributedString;
    if (v17) {
      float v22 = &OBJC_IVAR___SUUIItemOfferButton__confirmationTitleAttributedString;
    }
    id v23 = *(id *)((char *)&self->super.super.super.super.isa + *v22);
    id v24 = (id)[v23 copy];
    objc_msgSend((id)objc_opt_class(), "_titleSizeThatFitsForSize:titleStyle:mutableAttributedString:", v19, v23, v8 + v20 * -2.0, v10);
    if (v24 != v23 && ([v24 isEqualToAttributedString:v23] & 1) == 0) {
      [(SUUIItemOfferButton *)self _reloadForCurrentState:0];
    }
  }
  if (self->_borderCornerRadiusMatchesHalfBoundingDimension)
  {
    v31.origin.double x = v4;
    v31.origin.double y = v6;
    v31.size.double width = v8;
    v31.size.double height = v10;
    CGRectGetWidth(v31);
    v32.origin.double x = v4;
    v32.origin.double y = v6;
    v32.size.double width = v8;
    v32.size.double height = v10;
    CGRectGetHeight(v32);
    UIFloorToViewScale();
    double v26 = v25;
    id v27 = [(UIView *)self->_borderView layer];
    [v27 setCornerRadius:v26];
  }
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
  id v5 = a3;
  double v6 = [MEMORY[0x263F825C8] clearColor];
  v7.receiver = self;
  v7.super_class = (Class)SUUIItemOfferButton;
  [(SUUIItemOfferButton *)&v7 setBackgroundColor:v6];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  p_int64_t titleStyle = &self->_titleStyle;
  if (self->_titleStyle == 1) {
    double v6 = 20.0;
  }
  else {
    double v6 = 26.0;
  }
  objc_super v7 = [(SUUIItemOfferButton *)self buttonDescriptor];
  uint64_t v8 = [v7 progressType];

  double v9 = v6;
  if (!v8)
  {
    if ([(SUUIItemOfferButton *)self hasNonBorderedImage])
    {
      image = self->_image;
      if (image)
      {
LABEL_11:
        [(UIImage *)image size];
        double v9 = fmax(v12, 26.0);
        goto LABEL_33;
      }
      uint64_t v11 = 488;
LABEL_10:
      image = *(UIImage **)((char *)&self->super.super.super.super.isa + v11);
      goto LABEL_11;
    }
    if ([(SUUIItemOfferButton *)self hasBorderedImage])
    {
      uint64_t v11 = 688;
      goto LABEL_10;
    }
    objc_super v13 = (void *)[(NSMutableAttributedString *)self->_titleAttributedString mutableCopy];
    BOOL v14 = [(SUUIItemOfferButton *)self isShowingConfirmation];
    p_confirmationTitleStyle = p_titleStyle;
    if (v14) {
      p_confirmationTitleStyle = &self->_confirmationTitleStyle;
    }
    int64_t v16 = *p_confirmationTitleStyle;
    [(SUUIItemOfferButton *)self _horizontalInsetForTitleStyle:*p_confirmationTitleStyle];
    double v18 = v17;
    if ([(id)objc_opt_class() _sizeMattersForTitleStyle:*p_titleStyle])
    {
      objc_msgSend((id)objc_opt_class(), "_titleSizeThatFitsForSize:titleStyle:mutableAttributedString:", *p_titleStyle, v13, width, v6);
      double v20 = v19;
    }
    else
    {
      double v20 = self->_titleFitSize.width;
    }
    if ([(SUUIItemOfferButton *)self isShowingConfirmation])
    {
      double v21 = (void *)[(NSMutableAttributedString *)self->_confirmationTitleAttributedString mutableCopy];
      if ([(id)objc_opt_class() _sizeMattersForTitleStyle:self->_confirmationTitleStyle]) {
        objc_msgSend((id)objc_opt_class(), "_titleSizeThatFitsForSize:titleStyle:mutableAttributedString:", self->_confirmationTitleStyle, v21, width, v6);
      }
      else {
        double v22 = self->_confirmationTitleFitSize.width;
      }
      if (v20 - v22 >= 10.0 || v22 >= v20) {
        double v20 = v22;
      }
    }
    double v24 = ceil(v20 + v18 * 2.0);
    double v25 = fmax(v24, 59.0);
    if (v25 > 109.0) {
      double v25 = 109.0;
    }
    if (v16 == 2) {
      double v9 = v25;
    }
    else {
      double v9 = v24;
    }
  }
LABEL_33:
  double v26 = v9;
  double v27 = v6;
  result.double height = v27;
  result.double width = v26;
  return result;
}

- (void)tintColorDidChange
{
  v7.receiver = self;
  v7.super_class = (Class)SUUIItemOfferButton;
  [(SUUIItemOfferButton *)&v7 tintColorDidChange];
  double v3 = [(SUUIItemOfferButton *)self tintColor];
  if (self->_cloudImage)
  {
    double v4 = [(id)objc_opt_class() cloudImageWithTintColor:self->_cloudTintColor arrowTintColor:v3];
    cloudImage = self->_cloudImage;
    self->_cloudImage = v4;
  }
  if (self->_universalImageView)
  {
    double v6 = [(id)objc_opt_class() _universalPlusImageWithTintColor:v3];
    [(UIImageView *)self->_universalImageView setImage:v6];
  }
  [(SUUIItemOfferButton *)self _reloadForCurrentState:0];
  [(SUUIItemOfferButton *)self setNeedsDisplay];
}

- (void)_cancelGestureAction:(id)a3
{
  if ([(SUUIItemOfferButton *)self isShowingConfirmation]) {
    [(SUUIItemOfferButton *)self sendActionsForControlEvents:0x10000];
  }
  [(SUUIItemOfferButton *)self _removeCancelGestureRecognizer];
}

+ (id)_cachedImageForAttributedTitle:(id)a3 titleStyle:(int64_t)a4 size:(CGSize)a5 fillStyle:(int64_t)a6 universal:(BOOL)a7 tintColor:(id)a8 interfaceStyle:(int64_t)a9
{
  BOOL v11 = a7;
  double height = a5.height;
  double width = a5.width;
  id v16 = a3;
  id v17 = a8;
  if (!_cachedImageForAttributedTitle_titleStyle_size_fillStyle_universal_tintColor_interfaceStyle__cache)
  {
    id v18 = objc_alloc_init(MEMORY[0x263EFF8E0]);
    double v19 = (void *)_cachedImageForAttributedTitle_titleStyle_size_fillStyle_universal_tintColor_interfaceStyle__cache;
    _cachedImageForAttributedTitle_titleStyle_size_fillStyle_universal_tintColor_interfaceStyle__cache = (uint64_t)v18;

    [(id)_cachedImageForAttributedTitle_titleStyle_size_fillStyle_universal_tintColor_interfaceStyle__cache setCountLimit:200];
  }
  uint64_t v20 = [v16 hash];
  uint64_t v21 = [v17 hash];
  uint64_t v22 = 1000;
  if (!v11) {
    uint64_t v22 = 0;
  }
  unint64_t v23 = (unint64_t)height + 100000 * a4 + (unint64_t)width + 10000 * a6 + v22 + 1000000 * a9 + v20 + v21;
  double v24 = (void *)_cachedImageForAttributedTitle_titleStyle_size_fillStyle_universal_tintColor_interfaceStyle__cache;
  double v25 = [NSNumber numberWithUnsignedInteger:v23];
  double v26 = [v24 objectForKey:v25];

  if (!v26)
  {
    double v26 = objc_msgSend((id)objc_opt_class(), "_imageForAttributedTitle:titleStyle:size:fillStyle:universal:tintColor:", v16, a4, a6, v11, v17, width, height);
    if (v26)
    {
      double v27 = (void *)_cachedImageForAttributedTitle_titleStyle_size_fillStyle_universal_tintColor_interfaceStyle__cache;
      int v28 = [NSNumber numberWithUnsignedInteger:v23];
      [v27 setObject:v26 forKey:v28];
    }
  }

  return v26;
}

+ (BOOL)canOpenItemForItemState:(id)a3 clientContext:(id)a4
{
  if (([a3 state] & 0x1000) != 0)
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    double v4 = [MEMORY[0x263F086E0] mainBundle];
    id v5 = [v4 bundleIdentifier];

    int v6 = [v5 isEqualToString:@"com.apple.MobileSMS"] ^ 1;
  }
  return v6;
}

+ (id)_defaultTitleAttributes
{
  if (_defaultTitleAttributes_sOnceToken != -1) {
    dispatch_once(&_defaultTitleAttributes_sOnceToken, &__block_literal_global_26);
  }
  v2 = (void *)_defaultTitleAttributes_sDefaultAttributes;
  return v2;
}

void __46__SUUIItemOfferButton__defaultTitleAttributes__block_invoke()
{
  v5[1] = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263F81658] defaultParagraphStyle];
  v1 = (void *)[v0 mutableCopy];

  [v1 setAlignment:1];
  [v1 setLineBreakMode:5];
  uint64_t v4 = *MEMORY[0x263F81540];
  v5[0] = v1;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];
  double v3 = (void *)_defaultTitleAttributes_sDefaultAttributes;
  _defaultTitleAttributes_sDefaultAttributes = v2;
}

+ (id)_imageForAttributedTitle:(id)a3 titleStyle:(int64_t)a4 size:(CGSize)a5 fillStyle:(int64_t)a6 universal:(BOOL)a7 tintColor:(id)a8
{
  BOOL v9 = a7;
  double height = a5.height;
  double width = a5.width;
  id v14 = a3;
  id v15 = a8;
  id v16 = [MEMORY[0x263F82B60] mainScreen];
  [v16 scale];
  CGFloat v18 = v17;
  v57.double width = width;
  v57.double height = height;
  UIGraphicsBeginImageContextWithOptions(v57, 0, v18);

  [v15 set];
  if (a6)
  {
    if (!v9) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v64.origin.double x = 0.0;
  v64.origin.double y = 0.0;
  v64.size.double width = width;
  v64.size.double height = height;
  CGRect v65 = CGRectInset(v64, 0.5, 0.5);
  v48 = objc_msgSend(MEMORY[0x263F824C0], "_bezierPathWithArcRoundedRect:cornerRadius:", v65.origin.x, v65.origin.y, v65.size.width, v65.size.height, 3.0);
  [v48 setLineWidth:1.0];
  [v48 stroke];

  if (v9)
  {
LABEL_3:
    double v19 = (void *)MEMORY[0x263F827E8];
    uint64_t v20 = SUUIBundle();
    uint64_t v21 = [v19 imageNamed:@"BuyButtonUniversalIndicator" inBundle:v20];

    [v21 size];
    double v23 = v22;
    [v21 size];
    double v25 = v24;
    v58.origin.double x = 3.0;
    v58.origin.double y = 3.0;
    v58.size.double width = v23;
    v58.size.double height = v25;
    UIRectFill(v58);
    objc_msgSend(v21, "drawInRect:blendMode:alpha:", 22, 3.0, 3.0, v23, v25, 1.0);
  }
LABEL_4:
  double v26 = [MEMORY[0x263F82B60] mainScreen];
  [v26 scale];
  double v28 = v27;

  if (v14)
  {
    CGRect v29 = (void *)[v14 mutableCopy];
    objc_msgSend(v29, "addAttribute:value:range:", *MEMORY[0x263F81500], v15, 0, objc_msgSend(v29, "length"));
    if (a4 == 2)
    {
      id v30 = objc_alloc_init(MEMORY[0x263F81668]);
      [v30 setCachesLayout:1];
      [v30 setMaximumNumberOfLines:2];
      [v30 setWrapsForTruncationMode:1];
      [v30 setWantsBaselineOffset:1];
      CGFloat v31 = width + -14.0;
      objc_msgSend(v29, "boundingRectWithSize:options:context:", 1, v30, width + -14.0, height);
      CGFloat v33 = v32;
      CGFloat v35 = v34;
      CGFloat v37 = v36;
      CGFloat v39 = v38;
      v59.origin.double x = 7.0;
      v59.origin.double y = 0.0;
      v59.size.double width = width + -14.0;
      v59.size.double height = height;
      double v54 = width;
      double MinY = CGRectGetMinY(v59);
      v60.origin.double x = 7.0;
      v60.origin.double y = 0.0;
      v60.size.double width = v31;
      v60.size.double height = height;
      double v55 = height;
      double v41 = CGRectGetHeight(v60);
      v61.origin.double x = v33;
      v61.origin.double y = v35;
      v61.size.double width = v37;
      v61.size.double height = v39;
      CGFloat v42 = round(MinY + (v41 - CGRectGetHeight(v61)) * 0.5);
      v62.origin.double x = v33;
      v62.origin.double y = v35;
      v62.size.double width = v37;
      v62.size.double height = v39;
      CGFloat v43 = CGRectGetHeight(v62);
      [v30 baselineOffset];
      double v45 = v44;
      v63.origin.double x = 7.0;
      v63.origin.double y = v42;
      double height = v55;
      v63.size.double width = v31;
      v63.size.double height = v43;
      CGFloat v46 = CGRectGetMinY(v63);
      double v47 = v43;
      double width = v54;
      objc_msgSend(v29, "drawWithRect:options:context:", 1, v30, 7.0, round(v28 * (v45 + v46)) / v28 - v45, v31, v47);
    }
    else
    {
      [v29 size];
      float v50 = v28 * ((height - v49) * 0.5);
      objc_msgSend(v29, "drawInRect:", 0.0, roundf(v50) / v28, width, v49);
    }
  }
  if (a6 == 1)
  {
    v51 = objc_msgSend(MEMORY[0x263F824C0], "_bezierPathWithArcRoundedRect:cornerRadius:", 0.0, 0.0, width, height, 3.0);
    [v51 setLineWidth:0.0];
    [v51 fillWithBlendMode:25 alpha:1.0];
  }
  v52 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v52;
}

+ (BOOL)_sizeMattersForTitleStyle:(int64_t)a3
{
  return a3 == 2;
}

+ (CGSize)_titleSizeThatFitsForSize:(CGSize)a3 titleStyle:(int64_t)a4 mutableAttributedString:(id)a5
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v40[1] = *MEMORY[0x263EF8340];
  id v9 = a5;
  if (!_titleSizeThatFitsForSize_titleStyle_mutableAttributedString__cache)
  {
    id v10 = objc_alloc_init(MEMORY[0x263EFF8E0]);
    BOOL v11 = (void *)_titleSizeThatFitsForSize_titleStyle_mutableAttributedString__cache;
    _titleSizeThatFitsForSize_titleStyle_mutableAttributedString__cache = (uint64_t)v10;

    [(id)_titleSizeThatFitsForSize_titleStyle_mutableAttributedString__cache setCountLimit:200];
  }
  int v12 = [a1 _sizeMattersForTitleStyle:a4];
  objc_super v13 = NSString;
  if (v12)
  {
    v41.CGFloat width = width;
    v41.CGFloat height = height;
    NSStringFromCGSize(v41);
    id v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v14 = &stru_2704F8130;
  }
  id v15 = [v9 string];
  id v16 = [v13 stringWithFormat:@"%@:%td%@", v14, a4, v15];

  if (v12) {
  if (a4 == 2)
  }
  {
    double v17 = [MEMORY[0x263F81708] boldSystemFontOfSize:13.0];
    CGFloat v18 = [MEMORY[0x263F81708] systemFontOfSize:11.0 weight:*MEMORY[0x263F81828]];
    uint64_t v19 = [v9 length];
    uint64_t v20 = *MEMORY[0x263F814F0];
    uint64_t v39 = *MEMORY[0x263F814F0];
    v40[0] = v17;
    uint64_t v21 = [NSDictionary dictionaryWithObjects:v40 forKeys:&v39 count:1];
    objc_msgSend(v9, "addAttributes:range:", v21, 0, v19);

    id v22 = objc_alloc_init(MEMORY[0x263F81668]);
    [v22 setCachesLayout:1];
    [v22 setMaximumNumberOfLines:1];
    [v22 setWrapsForTruncationMode:0];
    objc_msgSend(v9, "boundingRectWithSize:options:context:", 1, v22, 1.79769313e308, 1.79769313e308);
    if (v23 > 70.0)
    {
      [v22 setMaximumNumberOfLines:0];
      [v22 setWrapsForTruncationMode:1];
      uint64_t v37 = v20;
      double v38 = v18;
      double v25 = [NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
      objc_msgSend(v9, "addAttributes:range:", v25, 0, v19);

      objc_msgSend(v9, "boundingRectWithSize:options:context:", 1, v22, 45.0, 1.79769313e308);
      double v27 = v26;
      double v29 = v28;
      if ((unint64_t)[v22 numberOfLineFragments] < 3)
      {
LABEL_13:

        goto LABEL_17;
      }
      [v22 setMaximumNumberOfLines:2];
      objc_msgSend(v9, "boundingRectWithSize:options:context:", 1, v22, 95.0, 1.79769313e308);
    }
    double v27 = v23;
    double v29 = v24;
    goto LABEL_13;
  }
  id v30 = [(id)_titleSizeThatFitsForSize_titleStyle_mutableAttributedString__cache objectForKey:v16];
  if (v30)
  {
    double v17 = v30;
    [v30 CGSizeValue];
    double v27 = v31;
    double v29 = v32;
  }
  else
  {
    [v9 size];
    double v27 = v33;
    double v29 = v34;
    double v17 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:");
    [(id)_titleSizeThatFitsForSize_titleStyle_mutableAttributedString__cache setObject:v17 forKey:v16];
  }
LABEL_17:

  double v35 = v27;
  double v36 = v29;
  result.CGFloat height = v36;
  result.CGFloat width = v35;
  return result;
}

+ (id)_universalPlusImageWithTintColor:(id)a3
{
  id v4 = a3;
  id v5 = (void *)_universalPlusImageWithTintColor__sImage;
  if (_universalPlusImageWithTintColor__sImage) {
    BOOL v6 = _universalPlusImageWithTintColor__sLastTintColor == (void)v4;
  }
  else {
    BOOL v6 = 0;
  }
  if (!v6)
  {
    objc_super v7 = (void *)MEMORY[0x263F827E8];
    uint64_t v8 = SUUIBundle();
    uint64_t v9 = [v7 imageNamed:@"BuyButtonUniversalIndicator" inBundle:v8];
    id v10 = (void *)_universalPlusImageWithTintColor__sImage;
    _universalPlusImageWithTintColor__sImage = v9;

    uint64_t v11 = [(id)_universalPlusImageWithTintColor__sImage _flatImageWithColor:v4];
    int v12 = (void *)_universalPlusImageWithTintColor__sImage;
    _universalPlusImageWithTintColor__sImage = v11;

    objc_storeStrong((id *)&_universalPlusImageWithTintColor__sLastTintColor, a3);
    id v5 = (void *)_universalPlusImageWithTintColor__sImage;
  }
  id v13 = v5;

  return v13;
}

+ (id)playTintColorForBackgroundColor:(id)a3
{
  id v3 = a3;
  if (!playTintColorForBackgroundColor__sDarkBackgroundCloudColor)
  {
    uint64_t v4 = [MEMORY[0x263F825C8] labelColor];
    id v5 = (void *)playTintColorForBackgroundColor__sDarkBackgroundCloudColor;
    playTintColorForBackgroundColor__sDarkBackgroundCloudColor = v4;
  }
  id v6 = &unk_269F6B000;
  if (!playTintColorForBackgroundColor__sLightBackgroundCloudColor)
  {
    uint64_t v7 = [MEMORY[0x263F825C8] labelColor];
    uint64_t v8 = (void *)playTintColorForBackgroundColor__sLightBackgroundCloudColor;
    playTintColorForBackgroundColor__sLightBackgroundCloudColor = v7;
  }
  unint64_t v9 = SUUIColorSchemeStyleForColor(v3);
  if (v9 <= 3) {
    id v6 = (id)*off_2654057D0[v9];
  }

  return v6;
}

+ (id)playImageWithTintColor:(id)a3
{
  id v4 = a3;
  id v5 = (void *)playImageWithTintColor__sUniversalPlayImage;
  if (playImageWithTintColor__sUniversalPlayImage) {
    BOOL v6 = playImageWithTintColor__sLastPlayTintColor == (void)v4;
  }
  else {
    BOOL v6 = 0;
  }
  if (!v6)
  {
    uint64_t v7 = (void *)MEMORY[0x263F827E8];
    uint64_t v8 = SUUIBundle();
    uint64_t v9 = [v7 imageNamed:@"PlayProduct" inBundle:v8];
    id v10 = (void *)playImageWithTintColor__sUniversalPlayImage;
    playImageWithTintColor__sUniversalPlayImage = v9;

    uint64_t v11 = [(id)playImageWithTintColor__sUniversalPlayImage _flatImageWithColor:v4];
    int v12 = (void *)playImageWithTintColor__sUniversalPlayImage;
    playImageWithTintColor__sUniversalPlayImage = v11;

    objc_storeStrong((id *)&playImageWithTintColor__sLastPlayTintColor, a3);
    id v5 = (void *)playImageWithTintColor__sUniversalPlayImage;
  }
  id v13 = v5;

  return v13;
}

+ (id)playHighlightImageWithTintColor:(id)a3
{
  id v4 = a3;
  id v5 = (void *)playHighlightImageWithTintColor__sUniversalPlayHighlightImage;
  if (playHighlightImageWithTintColor__sUniversalPlayHighlightImage) {
    BOOL v6 = playHighlightImageWithTintColor__sLastPlayHighlightTintColor == (void)v4;
  }
  else {
    BOOL v6 = 0;
  }
  if (!v6)
  {
    uint64_t v7 = (void *)MEMORY[0x263F827E8];
    uint64_t v8 = SUUIBundle();
    uint64_t v9 = [v7 imageNamed:@"PlayProduct" inBundle:v8];
    id v10 = (void *)playHighlightImageWithTintColor__sUniversalPlayHighlightImage;
    playHighlightImageWithTintColor__sUniversalPlayHighlightImage = v9;

    uint64_t v11 = (void *)playHighlightImageWithTintColor__sUniversalPlayHighlightImage;
    int v12 = [v4 colorWithAlphaComponent:0.2];
    uint64_t v13 = [v11 _flatImageWithColor:v12];
    id v14 = (void *)playHighlightImageWithTintColor__sUniversalPlayHighlightImage;
    playHighlightImageWithTintColor__sUniversalPlayHighlightImage = v13;

    objc_storeStrong((id *)&playHighlightImageWithTintColor__sLastPlayHighlightTintColor, a3);
    id v5 = (void *)playHighlightImageWithTintColor__sUniversalPlayHighlightImage;
  }
  id v15 = v5;

  return v15;
}

+ (id)_imageForProgressType:(int64_t)a3
{
  switch(a3)
  {
    case 2:
      id v4 = (void *)_imageForProgressType__sConnectingImage;
      if (_imageForProgressType__sConnectingImage) {
        goto LABEL_14;
      }
      id v5 = (void *)MEMORY[0x263F827E8];
      BOOL v6 = SUUIBundle();
      uint64_t v7 = [v5 imageNamed:@"DownloadProgressButtonConnecting" inBundle:v6];
      uint64_t v8 = &_imageForProgressType__sConnectingImage;
      break;
    case 3:
      id v4 = (void *)_imageForProgressType__sDownloadingImage;
      if (_imageForProgressType__sDownloadingImage) {
        goto LABEL_14;
      }
      uint64_t v11 = (void *)MEMORY[0x263F827E8];
      BOOL v6 = SUUIBundle();
      uint64_t v7 = [v11 imageNamed:@"DownloadProgressButtonDownloading" inBundle:v6];
      uint64_t v8 = &_imageForProgressType__sDownloadingImage;
      break;
    case 4:
      id v4 = (void *)_imageForProgressType__sPausedImage;
      if (_imageForProgressType__sPausedImage) {
        goto LABEL_14;
      }
      int v12 = (void *)MEMORY[0x263F827E8];
      BOOL v6 = SUUIBundle();
      uint64_t v7 = [v12 imageNamed:@"DownloadProgressButtonPaused" inBundle:v6];
      uint64_t v8 = &_imageForProgressType__sPausedImage;
      break;
    case 5:
      id v4 = (void *)_imageForProgressType__sPlayImage;
      if (_imageForProgressType__sPlayImage) {
        goto LABEL_14;
      }
      uint64_t v13 = (void *)MEMORY[0x263F827E8];
      BOOL v6 = SUUIBundle();
      uint64_t v7 = [v13 imageNamed:@"DownloadProgressButtonPlay" inBundle:v6];
      uint64_t v8 = &_imageForProgressType__sPlayImage;
      break;
    default:
      id v9 = 0;
      return v9;
  }
  id v14 = (void *)*v8;
  *uint64_t v8 = v7;

  id v4 = (void *)*v8;
LABEL_14:
  id v9 = v4;
  return v9;
}

+ (UIEdgeInsets)_imageInsetsForProgressType:(int64_t)a3
{
  if ((unint64_t)a3 >= 5)
  {
    if (a3 == 5)
    {
      id v9 = [MEMORY[0x263F82B60] mainScreen];
      [v9 scale];
      double v4 = 1.0;
      double v3 = 1.0 / v10;

      double v5 = 0.0;
      double v6 = 0.0;
      goto LABEL_3;
    }
    if (a3 != 6) {
      goto LABEL_3;
    }
  }
  double v3 = *MEMORY[0x263F834E8];
  double v4 = *(double *)(MEMORY[0x263F834E8] + 8);
  double v5 = *(double *)(MEMORY[0x263F834E8] + 16);
  double v6 = *(double *)(MEMORY[0x263F834E8] + 24);
LABEL_3:
  double v7 = v3;
  double v8 = v4;
  result.right = v6;
  result.bottom = v5;
  result.left = v8;
  result.top = v7;
  return result;
}

+ (id)_basicAnimationWithKeyPath:(id)a3
{
  double v3 = [MEMORY[0x263F15760] animationWithKeyPath:a3];
  [v3 setFillMode:*MEMORY[0x263F15AB0]];
  [v3 setRemovedOnCompletion:0];
  UIAnimationDragCoefficient();
  *(float *)&double v5 = 1.0 / v4;
  [v3 setSpeed:v5];
  return v3;
}

- (id)_buttonPropertiesForState:(id)a3
{
  id v4 = a3;
  if ([(SUUIItemOfferButton *)self isEnabled]) {
    double v5 = 1.0;
  }
  else {
    double v5 = 0.4;
  }
  [(SUUIItemOfferButton *)self bounds];
  CGFloat x = v56.origin.x;
  CGFloat y = v56.origin.y;
  CGFloat width = v56.size.width;
  CGFloat height = v56.size.height;
  CGRectGetWidth(v56);
  v57.origin.CGFloat x = x;
  v57.origin.CGFloat y = y;
  v57.size.CGFloat width = width;
  v57.size.CGFloat height = height;
  CGRectGetHeight(v57);
  double v10 = [MEMORY[0x263F825C8] clearColor];
  uint64_t v11 = [(SUUIItemOfferButton *)self tintColor];
  [v11 alphaComponent];
  uint64_t v13 = [v11 colorWithAlphaComponent:v12 * self->_borderColorAlphaMultiplier];
  uint64_t v14 = [v4 progressType];
  uint64_t v15 = v14;
  double v54 = v11;
  if (v14)
  {
    id v16 = v13;
    uint64_t v17 = v14;
    CGFloat v18 = [(SUUIItemOfferButton *)self buttonDescriptor];
    uint64_t v19 = [v18 progressType];

    if (v19 == 1)
    {
      uint64_t v20 = v10;
      UIFloorToViewScale();
      double v22 = v21;
      uint64_t v48 = 0;
      unsigned int v52 = 0;
      uint64_t v23 = 0;
      v53 = 0;
      int64_t titleStyle = 0;
      int64_t confirmationTitleStyle = 0;
      double v24 = 0;
      double v25 = 0;
      double v26 = 1.0;
      uint64_t v49 = 0x100000000;
    }
    else
    {
      double v28 = [(SUUIItemOfferButton *)self buttonDescriptor];
      uint64_t v29 = [v28 progressType];

      double v26 = 1.0;
      uint64_t v20 = v10;
      if (v29 == 6)
      {
        uint64_t v48 = 0;
        uint64_t v49 = 0;
        unsigned int v52 = 0;
        uint64_t v23 = 0;
        uint64_t v19 = 0;
        v53 = 0;
        int64_t titleStyle = 0;
        int64_t confirmationTitleStyle = 0;
        double v24 = 0;
        double v25 = 0;
        double v22 = 3.0;
      }
      else
      {
        UIFloorToViewScale();
        double v22 = v30;
        unsigned int v52 = 0;
        uint64_t v23 = 0;
        uint64_t v49 = 0;
        int64_t titleStyle = 0;
        v53 = 0;
        int64_t confirmationTitleStyle = 0;
        double v24 = 0;
        double v25 = 0;
        uint64_t v48 = 1;
        uint64_t v19 = 1;
      }
    }
    uint64_t v15 = v17;
    uint64_t v13 = v16;
    goto LABEL_17;
  }
  if ([(SUUIItemOfferButton *)self hasNonBorderedImage])
  {
    uint64_t v20 = v10;
    image = self->_image;
    if (!image) {
      image = self->_cloudImage;
    }
    double v24 = image;
    uint64_t v48 = 0;
    uint64_t v49 = 0;
    unsigned int v52 = 0;
    uint64_t v23 = 0;
    uint64_t v19 = 0;
    v53 = 0;
    int64_t titleStyle = 0;
    int64_t confirmationTitleStyle = 0;
    double v25 = 0;
    double v22 = 3.0;
    double v26 = 1.0;
  }
  else
  {
    if ([(SUUIItemOfferButton *)self hasBorderedImage])
    {
      uint64_t v20 = v10;
      double v25 = self->_borderedImage;
      unsigned int v52 = 0;
      uint64_t v23 = 0;
      uint64_t v19 = 0;
      uint64_t v49 = 0;
      int64_t titleStyle = 0;
      v53 = 0;
      int64_t confirmationTitleStyle = 0;
      double v24 = 0;
      double v22 = 3.0;
      double v26 = 1.0;
      uint64_t v48 = 1;
      goto LABEL_17;
    }
    int v36 = [v4 showingConfirmation];
    uint64_t v37 = &OBJC_IVAR___SUUIItemOfferButton__titleAttributedString;
    if (v36) {
      uint64_t v37 = &OBJC_IVAR___SUUIItemOfferButton__confirmationTitleAttributedString;
    }
    id v38 = *(id *)((char *)&self->super.super.super.super.isa + *v37);
    int v39 = [v4 showingConfirmation];
    confirmationColor = v13;
    if (v39) {
      confirmationColor = self->_confirmationColor;
    }
    CGSize v41 = confirmationColor;
    CGFloat v42 = v13;

    uint64_t v13 = v41;
    HIDWORD(v48) = ([v4 showingConfirmation] & 1) == 0
                && [v4 showsUniversal]
                && self->_universal;
    uint64_t v15 = 0;
    unsigned int v46 = [v4 showingConfirmation];
    int64_t fillStyle = self->_fillStyle;
    double v22 = 3.0;
    v53 = v38;
    unsigned int v52 = v46;
    int64_t titleStyle = self->_titleStyle;
    int64_t confirmationTitleStyle = self->_confirmationTitleStyle;
    if (fillStyle == 1)
    {
      LODWORD(v48) = [v38 length] != 0;
      uint64_t v13 = v13;

      uint64_t v23 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15DC0]];
      uint64_t v19 = 0;
      double v24 = 0;
      double v25 = 0;
      uint64_t v49 = 1;
      double v26 = 0.0;
      uint64_t v20 = v13;
    }
    else
    {
      double v26 = 1.0;
      if (fillStyle)
      {
        uint64_t v20 = v10;
        LODWORD(v48) = 0;
      }
      else
      {
        LODWORD(v48) = [v38 length] != 0;
        if ([v4 showingConfirmation])
        {
          uint64_t v20 = self->_backgroundColor;

          uint64_t v23 = 0;
          uint64_t v19 = 0;
          double v24 = 0;
          double v25 = 0;
          uint64_t v49 = 1;
          uint64_t v15 = 0;
          goto LABEL_17;
        }
        uint64_t v20 = v10;
      }
      uint64_t v23 = 0;
      uint64_t v19 = 0;
      double v24 = 0;
      double v25 = 0;
      uint64_t v49 = 1;
    }
  }
LABEL_17:
  if ([v4 highlighted])
  {
    if (v15 || v24 || (int64_t v31 = self->_fillStyle, v31 == 2))
    {
      double v32 = (void *)v23;
      double v34 = v13;
      double v5 = 0.200000003;
    }
    else
    {
      if (v31 == 1)
      {
        double v32 = (void *)v23;
        double v33 = SUUIColorByAdjustingBrightness(v20, -0.2);

        double v34 = v33;
        double v35 = v13;
      }
      else
      {
        CGFloat v43 = v13;

        double v32 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15DC0]];
        double v35 = (void *)v23;
        double v34 = v43;
      }

      uint64_t v20 = v34;
    }
  }
  else
  {
    double v32 = (void *)v23;
    double v34 = v13;
  }
  double v44 = objc_alloc_init(SUUIItemOfferButtonProperties);
  [(SUUIItemOfferButtonProperties *)v44 setHasBorderView:v48];
  [(SUUIItemOfferButtonProperties *)v44 setBorderBackgroundColor:v20];
  [(SUUIItemOfferButtonProperties *)v44 setBorderColor:v34];
  [(SUUIItemOfferButtonProperties *)v44 setBorderCompositingFilter:v32];
  [(SUUIItemOfferButtonProperties *)v44 setBorderWidth:v26];
  [(SUUIItemOfferButtonProperties *)v44 setBorderCornerRadius:v22];
  [(SUUIItemOfferButtonProperties *)v44 setBorderCornerRadiusMatchesHalfBoundingDimension:v19];
  [(SUUIItemOfferButtonProperties *)v44 setHasTitleLabel:v49];
  [(SUUIItemOfferButtonProperties *)v44 setAttributedText:v53];
  [(SUUIItemOfferButtonProperties *)v44 setTextColor:v13];
  [(SUUIItemOfferButtonProperties *)v44 setUniversal:HIDWORD(v48)];
  [(SUUIItemOfferButtonProperties *)v44 setTitleStyle:titleStyle];
  [(SUUIItemOfferButtonProperties *)v44 setConfirmationTitleStyle:confirmationTitleStyle];
  [(SUUIItemOfferButtonProperties *)v44 setImage:v24];
  [(SUUIItemOfferButtonProperties *)v44 setBorderedImage:v25];
  -[SUUIItemOfferButtonProperties setProgressType:](v44, "setProgressType:", [v4 progressType]);
  [(SUUIItemOfferButtonProperties *)v44 setProgressIndeterminate:HIDWORD(v49)];
  [(SUUIItemOfferButtonProperties *)v44 setProgress:self->_progress];
  [(SUUIItemOfferButtonProperties *)v44 setAlpha:v5];
  [(SUUIItemOfferButtonProperties *)v44 setCancelRecognizer:v52];
  [(SUUIItemOfferButtonProperties *)v44 setRestores:self->_downloadRestores];

  return v44;
}

- (id)_imageForProgressType:(int64_t)a3
{
  centerImageProvider = (void (**)(id, SUUIItemOfferButton *, int64_t))self->_centerImageProvider;
  if (!centerImageProvider
    || (centerImageProvider[2](centerImageProvider, self, a3), (double v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    double v6 = [(id)objc_opt_class() _imageForProgressType:a3];
  }
  return v6;
}

- (double)_horizontalInsetForTitleStyle:(int64_t)a3
{
  double result = 10.0;
  if (a3 == 2) {
    return 7.0;
  }
  return result;
}

- (void)_transitionFromBorderedImage:(id)a3 toTitle:(id)a4 withDuration:(double)a5 completion:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  uint64_t v11 = [(UIView *)self->_borderView layer];
  double v12 = [v9 borderCompositingFilter];
  [v11 setCompositingFilter:v12];

  [(SUUIItemOfferButton *)self _adjustViewOrderingForProperties:v9];
  if ([v9 universal])
  {
    [(SUUIItemOfferButton *)self _insertUniversalView];
  }
  else
  {
    [(UIImageView *)self->_universalImageView removeFromSuperview];
    universalImageView = self->_universalImageView;
    self->_universalImageView = 0;
  }
  uint64_t v14 = (void *)MEMORY[0x263F82E00];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __84__SUUIItemOfferButton__transitionFromBorderedImage_toTitle_withDuration_completion___block_invoke;
  v26[3] = &unk_265400890;
  v26[4] = self;
  id v27 = v9;
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 3221225472;
  double v22 = __84__SUUIItemOfferButton__transitionFromBorderedImage_toTitle_withDuration_completion___block_invoke_2;
  uint64_t v23 = &unk_265401FB0;
  double v24 = self;
  id v25 = v10;
  id v15 = v10;
  id v16 = v9;
  [v14 animateWithDuration:7 delay:v26 options:&v20 animations:a5 completion:0.0];
  uint64_t v17 = objc_msgSend((id)objc_opt_class(), "_basicAnimationWithKeyPath:", @"borderColor", v20, v21, v22, v23, v24);
  [v17 setDuration:a5];
  id v18 = [v16 borderColor];
  objc_msgSend(v17, "setToValue:", objc_msgSend(v18, "CGColor"));

  uint64_t v19 = [(UIView *)self->_borderView layer];
  [v19 addAnimation:v17 forKey:@"borderColor"];
}

uint64_t __84__SUUIItemOfferButton__transitionFromBorderedImage_toTitle_withDuration_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 472);
  double v3 = [*(id *)(a1 + 40) borderBackgroundColor];
  [v2 setBackgroundColor:v3];

  uint64_t v4 = *(void *)(a1 + 32);
  double v5 = *(void **)(v4 + 576);
  double v6 = [*(id *)(v4 + 688) imageWithRenderingMode:2];
  [v5 setImage:v6];

  double v7 = *(void **)(*(void *)(a1 + 32) + 576);
  double v8 = [*(id *)(a1 + 40) borderColor];
  [v7 setTintColor:v8];

  id v9 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) alpha];
  objc_msgSend(v9, "setAlpha:");
  id v10 = *(void **)(a1 + 32);
  return [v10 _sendWillAnimate];
}

uint64_t __84__SUUIItemOfferButton__transitionFromBorderedImage_toTitle_withDuration_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  double v3 = *(void **)(a1 + 32);
  return [v3 _sendDidAnimate];
}

- (void)_transitionFromTitle:(id)a3 toTitle:(id)a4 withDuration:(double)a5 completion:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  titleLabel = self->_titleLabel;
  double v12 = [v9 attributedText];
  [(UILabel *)titleLabel setAttributedText:v12];

  uint64_t v13 = [(UIView *)self->_borderView layer];
  uint64_t v14 = [v9 borderCompositingFilter];
  [v13 setCompositingFilter:v14];

  [(SUUIItemOfferButton *)self _adjustViewOrderingForProperties:v9];
  if ([v9 universal])
  {
    [(SUUIItemOfferButton *)self _insertUniversalView];
  }
  else
  {
    [(UIImageView *)self->_universalImageView removeFromSuperview];
    universalImageView = self->_universalImageView;
    self->_universalImageView = 0;
  }
  id v16 = (void *)MEMORY[0x263F82E00];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __76__SUUIItemOfferButton__transitionFromTitle_toTitle_withDuration_completion___block_invoke;
  v28[3] = &unk_265400890;
  v28[4] = self;
  id v29 = v9;
  uint64_t v22 = MEMORY[0x263EF8330];
  uint64_t v23 = 3221225472;
  double v24 = __76__SUUIItemOfferButton__transitionFromTitle_toTitle_withDuration_completion___block_invoke_2;
  id v25 = &unk_265401FB0;
  double v26 = self;
  id v27 = v10;
  id v17 = v10;
  id v18 = v9;
  [v16 animateWithDuration:7 delay:v28 options:&v22 animations:a5 completion:0.0];
  uint64_t v19 = objc_msgSend((id)objc_opt_class(), "_basicAnimationWithKeyPath:", @"borderColor", v22, v23, v24, v25, v26);
  [v19 setDuration:a5];
  id v20 = [v18 borderColor];
  objc_msgSend(v19, "setToValue:", objc_msgSend(v20, "CGColor"));

  uint64_t v21 = [(UIView *)self->_borderView layer];
  [v21 addAnimation:v19 forKey:@"borderColor"];
}

uint64_t __76__SUUIItemOfferButton__transitionFromTitle_toTitle_withDuration_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 472);
  double v3 = [*(id *)(a1 + 40) borderBackgroundColor];
  [v2 setBackgroundColor:v3];

  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 632);
  double v5 = [*(id *)(a1 + 40) textColor];
  [v4 setTextColor:v5];

  double v6 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) alpha];
  objc_msgSend(v6, "setAlpha:");
  double v7 = *(void **)(a1 + 32);
  return [v7 _sendWillAnimate];
}

uint64_t __76__SUUIItemOfferButton__transitionFromTitle_toTitle_withDuration_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  double v3 = *(void **)(a1 + 32);
  return [v3 _sendDidAnimate];
}

- (void)_transitionFromImage:(id)a3 toImage:(id)a4 withDuration:(double)a5 completion:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  imageView = self->_imageView;
  double v12 = [v9 image];
  [(UIImageView *)imageView setImage:v12];

  uint64_t v13 = (void *)MEMORY[0x263F82E00];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __76__SUUIItemOfferButton__transitionFromImage_toImage_withDuration_completion___block_invoke;
  v18[3] = &unk_265400890;
  v18[4] = self;
  id v19 = v9;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __76__SUUIItemOfferButton__transitionFromImage_toImage_withDuration_completion___block_invoke_2;
  v16[3] = &unk_265401FB0;
  v16[4] = self;
  id v17 = v10;
  id v14 = v10;
  id v15 = v9;
  [v13 animateWithDuration:7 delay:v18 options:v16 animations:a5 completion:0.0];
}

uint64_t __76__SUUIItemOfferButton__transitionFromImage_toImage_withDuration_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) alpha];
  objc_msgSend(v2, "setAlpha:");
  double v3 = *(void **)(a1 + 32);
  return [v3 _sendWillAnimate];
}

uint64_t __76__SUUIItemOfferButton__transitionFromImage_toImage_withDuration_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  double v3 = *(void **)(a1 + 32);
  return [v3 _sendDidAnimate];
}

- (void)_transitionFromProgress:(id)a3 toProgress:(id)a4 withDuration:(double)a5 completion:(id)a6
{
  id v9 = a4;
  progressIndicator = self->_progressIndicator;
  id v11 = a6;
  [v9 progress];
  -[SUUICircleProgressIndicator setProgress:](progressIndicator, "setProgress:");
  -[SUUICircleProgressIndicator setIndeterminate:](self->_progressIndicator, "setIndeterminate:", [v9 progressIndeterminate]);
  double v12 = self->_progressIndicator;
  uint64_t v13 = -[SUUIItemOfferButton _imageForProgressType:](self, "_imageForProgressType:", [v9 progressType]);
  [(SUUICircleProgressIndicator *)v12 setImage:v13];

  id v14 = self->_progressIndicator;
  objc_msgSend((id)objc_opt_class(), "_imageInsetsForProgressType:", objc_msgSend(v9, "progressType"));
  -[SUUICircleProgressIndicator setImageInsets:](v14, "setImageInsets:");
  id v15 = (void *)MEMORY[0x263F82E00];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __82__SUUIItemOfferButton__transitionFromProgress_toProgress_withDuration_completion___block_invoke;
  v17[3] = &unk_265400890;
  v17[4] = self;
  id v18 = v9;
  id v16 = v9;
  [v15 animateWithDuration:7 delay:v17 options:v11 animations:a5 completion:0.0];
}

uint64_t __82__SUUIItemOfferButton__transitionFromProgress_toProgress_withDuration_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) alpha];
  objc_msgSend(v2, "setAlpha:");
  double v3 = *(void **)(a1 + 32);
  return [v3 _sendWillAnimate];
}

- (void)_transitionFromTitleOrImage:(id)a3 toProgress:(id)a4 withDuration:(double)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (!self->_borderView)
  {
    [(SUUIItemOfferButton *)self _insertBorderView];
    uint64_t v13 = [(UIView *)self->_borderView layer];
    [v11 borderCornerRadius];
    objc_msgSend(v13, "setCornerRadius:");

    id v14 = [(UIView *)self->_borderView layer];
    id v15 = [v11 borderColor];
    objc_msgSend(v14, "setBorderColor:", objc_msgSend(v15, "CGColor"));

    borderView = self->_borderView;
    id v17 = [v11 borderBackgroundColor];
    [(UIView *)borderView setBackgroundColor:v17];

    self->_borderCornerRadiusMatchesHalfBoundingDimension = [v11 borderCornerRadiusMatchesHalfBoundingDimension];
  }
  if (([v10 hasBorderView] & 1) == 0)
  {
    id v18 = self->_borderView;
    CGAffineTransformMakeScale(&v46, 0.0, 0.0);
    [(UIView *)v18 setTransform:&v46];
  }
  [(SUUIItemOfferButton *)self _insertProgressIndicator];
  progressIndicator = self->_progressIndicator;
  [v11 progress];
  -[SUUICircleProgressIndicator setProgress:](progressIndicator, "setProgress:");
  -[SUUICircleProgressIndicator setIndeterminate:](self->_progressIndicator, "setIndeterminate:", [v11 progressIndeterminate]);
  id v20 = self->_progressIndicator;
  uint64_t v21 = [(SUUIItemOfferButton *)self buttonDescriptor];
  uint64_t v22 = -[SUUIItemOfferButton _imageForProgressType:](self, "_imageForProgressType:", [v21 progressType]);
  [(SUUICircleProgressIndicator *)v20 setImage:v22];

  uint64_t v23 = self->_progressIndicator;
  double v24 = objc_opt_class();
  id v25 = [(SUUIItemOfferButton *)self buttonDescriptor];
  objc_msgSend(v24, "_imageInsetsForProgressType:", objc_msgSend(v25, "progressType"));
  -[SUUICircleProgressIndicator setImageInsets:](v23, "setImageInsets:");

  [(SUUICircleProgressIndicator *)self->_progressIndicator setHidden:1];
  [(UIImageView *)self->_universalImageView removeFromSuperview];
  universalImageView = self->_universalImageView;
  self->_universalImageView = 0;

  [(UILabel *)self->_titleLabel removeFromSuperview];
  titleLabel = self->_titleLabel;
  self->_titleLabel = 0;

  double v28 = [(UIView *)self->_borderView layer];
  [v11 borderWidth];
  objc_msgSend(v28, "setBorderWidth:");

  id v29 = [(UIView *)self->_borderView layer];
  double v30 = [v11 borderCompositingFilter];
  [v29 setCompositingFilter:v30];

  [(SUUIItemOfferButton *)self _adjustViewOrderingForProperties:v11];
  int64_t v31 = (void *)MEMORY[0x263F82E00];
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __86__SUUIItemOfferButton__transitionFromTitleOrImage_toProgress_withDuration_completion___block_invoke;
  v44[3] = &unk_265400890;
  v44[4] = self;
  id v45 = v11;
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __86__SUUIItemOfferButton__transitionFromTitleOrImage_toProgress_withDuration_completion___block_invoke_2;
  v41[3] = &unk_265405790;
  v41[4] = self;
  id v42 = v45;
  id v43 = v12;
  id v32 = v12;
  id v33 = v45;
  [v31 animateWithDuration:v44 animations:v41 completion:a5];
  double v34 = [(id)objc_opt_class() _basicAnimationWithKeyPath:@"borderColor"];
  [v34 setDuration:a5];
  id v35 = [v33 borderColor];
  objc_msgSend(v34, "setToValue:", objc_msgSend(v35, "CGColor"));

  int v36 = [(UIView *)self->_borderView layer];
  [v36 addAnimation:v34 forKey:@"borderColor"];

  uint64_t v37 = [(id)objc_opt_class() _basicAnimationWithKeyPath:@"cornerRadius"];
  [v37 setDuration:a5];
  id v38 = NSNumber;
  [v33 borderCornerRadius];
  int v39 = objc_msgSend(v38, "numberWithDouble:");
  [v37 setToValue:v39];

  v40 = [(UIView *)self->_borderView layer];
  [v40 addAnimation:v37 forKey:@"cornerRadius"];
}

uint64_t __86__SUUIItemOfferButton__transitionFromTitleOrImage_toProgress_withDuration_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 472);
  double v3 = [*(id *)(a1 + 40) borderBackgroundColor];
  [v2 setBackgroundColor:v3];

  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 472);
  long long v5 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v8[0] = *MEMORY[0x263F000D0];
  v8[1] = v5;
  v8[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v4 setTransform:v8];
  [*(id *)(*(void *)(a1 + 32) + 568) setAlpha:0.0];
  double v6 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) alpha];
  objc_msgSend(v6, "setAlpha:");
  return [*(id *)(a1 + 32) _sendWillAnimate];
}

uint64_t __86__SUUIItemOfferButton__transitionFromTitleOrImage_toProgress_withDuration_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    [*(id *)(*(void *)(a1 + 32) + 592) setHidden:0];
    if (([*(id *)(a1 + 40) hasBorderView] & 1) == 0)
    {
      [*(id *)(*(void *)(a1 + 32) + 472) removeFromSuperview];
      uint64_t v4 = *(void *)(a1 + 32);
      long long v5 = *(void **)(v4 + 472);
      *(void *)(v4 + 472) = 0;
    }
  }
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, a2);
  }
  double v7 = *(void **)(a1 + 32);
  return [v7 _sendDidAnimate];
}

- (void)_transitionFromProgress:(id)a3 toTitleOrImage:(id)a4 withDuration:(double)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  borderView = self->_borderView;
  if (!borderView)
  {
    [(SUUIItemOfferButton *)self _insertBorderView];
    id v14 = [(UIView *)self->_borderView layer];
    [v10 borderCornerRadius];
    objc_msgSend(v14, "setCornerRadius:");

    id v15 = [(UIView *)self->_borderView layer];
    id v16 = [v10 borderColor];
    objc_msgSend(v15, "setBorderColor:", objc_msgSend(v16, "CGColor"));

    self->_borderCornerRadiusMatchesHalfBoundingDimension = [v10 borderCornerRadiusMatchesHalfBoundingDimension];
    borderView = self->_borderView;
  }
  long long v17 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v46[0] = *MEMORY[0x263F000D0];
  v46[1] = v17;
  v46[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [(UIView *)borderView setTransform:v46];
  id v18 = [v11 image];

  if (v18)
  {
    [(SUUIItemOfferButton *)self _insertImageView];
    p_imageView = (id *)&self->_imageView;
    imageView = self->_imageView;
    uint64_t v21 = [v11 image];
    [(UIImageView *)imageView setImage:v21];
  }
  else
  {
    [(SUUIItemOfferButton *)self _insertLabel];
    p_imageView = (id *)&self->_titleLabel;
    titleLabel = self->_titleLabel;
    uint64_t v23 = [v11 attributedText];
    [(UILabel *)titleLabel setAttributedText:v23];

    double v24 = self->_titleLabel;
    uint64_t v21 = [v11 textColor];
    [(UILabel *)v24 setTextColor:v21];
  }

  [*p_imageView setAlpha:0.0];
  id v25 = [(UIView *)self->_borderView layer];
  [v11 borderWidth];
  objc_msgSend(v25, "setBorderWidth:");

  double v26 = [(UIView *)self->_borderView layer];
  id v27 = [v11 borderCompositingFilter];
  [v26 setCompositingFilter:v27];

  [(SUUICircleProgressIndicator *)self->_progressIndicator removeFromSuperview];
  progressIndicator = self->_progressIndicator;
  self->_progressIndicator = 0;

  [(SUUIItemOfferButton *)self _adjustViewOrderingForProperties:v11];
  id v29 = (void *)MEMORY[0x263F82E00];
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = __86__SUUIItemOfferButton__transitionFromProgress_toTitleOrImage_withDuration_completion___block_invoke;
  v43[3] = &unk_265400890;
  id v44 = v11;
  id v45 = self;
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __86__SUUIItemOfferButton__transitionFromProgress_toTitleOrImage_withDuration_completion___block_invoke_2;
  v39[3] = &unk_265405790;
  id v40 = v44;
  CGSize v41 = self;
  id v42 = v12;
  id v30 = v12;
  id v31 = v44;
  [v29 animateWithDuration:v43 animations:v39 completion:a5];
  id v32 = [(id)objc_opt_class() _basicAnimationWithKeyPath:@"borderColor"];
  [v32 setDuration:a5];
  id v33 = [v31 borderColor];
  objc_msgSend(v32, "setToValue:", objc_msgSend(v33, "CGColor"));

  double v34 = [(UIView *)self->_borderView layer];
  [v34 addAnimation:v32 forKey:@"borderColor"];

  id v35 = [(id)objc_opt_class() _basicAnimationWithKeyPath:@"cornerRadius"];
  [v35 setDuration:a5];
  int v36 = NSNumber;
  [v31 borderCornerRadius];
  uint64_t v37 = objc_msgSend(v36, "numberWithDouble:");
  [v35 setToValue:v37];

  id v38 = [(UIView *)self->_borderView layer];
  [v38 addAnimation:v35 forKey:@"cornerRadius"];
}

uint64_t __86__SUUIItemOfferButton__transitionFromProgress_toTitleOrImage_withDuration_completion___block_invoke(uint64_t a1)
{
  if (![*(id *)(a1 + 32) hasBorderView])
  {
    uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 472);
    CGAffineTransformMakeScale(&v7, 0.0, 0.0);
    [v2 setTransform:&v7];
  }
  double v3 = *(void **)(*(void *)(a1 + 40) + 472);
  uint64_t v4 = [*(id *)(a1 + 32) borderBackgroundColor];
  [v3 setBackgroundColor:v4];

  [*(id *)(*(void *)(a1 + 40) + 568) setAlpha:1.0];
  [*(id *)(*(void *)(a1 + 40) + 632) setAlpha:1.0];
  long long v5 = *(void **)(a1 + 40);
  [*(id *)(a1 + 32) alpha];
  objc_msgSend(v5, "setAlpha:");
  return [*(id *)(a1 + 40) _sendWillAnimate];
}

uint64_t __86__SUUIItemOfferButton__transitionFromProgress_toTitleOrImage_withDuration_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    if (([*(id *)(a1 + 32) hasBorderView] & 1) == 0)
    {
      [*(id *)(*(void *)(a1 + 40) + 472) removeFromSuperview];
      uint64_t v4 = *(void *)(a1 + 40);
      long long v5 = *(void **)(v4 + 472);
      *(void *)(v4 + 472) = 0;
    }
    if (([*(id *)(a1 + 32) universal] & 1) == 0) {
      [*(id *)(a1 + 40) _insertUniversalView];
    }
  }
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, a2);
  }
  CGAffineTransform v7 = *(void **)(a1 + 40);
  return [v7 _sendDidAnimate];
}

- (void)_adjustViewOrderingForProperties:(id)a3
{
  id v4 = a3;
  if (self->_borderView)
  {
    if (self->_titleLabel)
    {
      id v9 = v4;
      long long v5 = [v4 borderCompositingFilter];

      if (v5) {
        p_titleLabel = &self->_titleLabel;
      }
      else {
        p_titleLabel = &self->_borderView;
      }
      if (v5) {
        p_borderView = &self->_borderView;
      }
      else {
        p_borderView = &self->_titleLabel;
      }
    }
    else
    {
      if (!self->_borderedImage) {
        goto LABEL_16;
      }
      id v9 = v4;
      double v8 = [v4 borderCompositingFilter];

      p_borderView = &self->_borderedImageView;
      if (v8) {
        p_titleLabel = &self->_borderedImageView;
      }
      else {
        p_titleLabel = &self->_borderView;
      }
      if (v8) {
        p_borderView = &self->_borderView;
      }
    }
    [(SUUIItemOfferButton *)self insertSubview:*p_borderView aboveSubview:*p_titleLabel];
    id v4 = v9;
  }
LABEL_16:
}

- (void)_insertProgressIndicator
{
  if (!self->_progressIndicator)
  {
    double v3 = [SUUICircleProgressIndicator alloc];
    [(SUUIItemOfferButton *)self bounds];
    id v4 = -[SUUICircleProgressIndicator initWithFrame:](v3, "initWithFrame:");
    progressIndicator = self->_progressIndicator;
    self->_progressIndicator = v4;

    [(SUUICircleProgressIndicator *)self->_progressIndicator setAutoresizingMask:18];
    uint64_t v6 = self->_progressIndicator;
    CGAffineTransform v7 = [MEMORY[0x263F825C8] clearColor];
    [(SUUICircleProgressIndicator *)v6 setBackgroundColor:v7];

    [(SUUICircleProgressIndicator *)self->_progressIndicator _setHidesBorderView:1];
    [(SUUICircleProgressIndicator *)self->_progressIndicator setUserInteractionEnabled:0];
    double v8 = self->_progressIndicator;
    [(SUUIItemOfferButton *)self addSubview:v8];
  }
}

- (void)_insertBorderView
{
  if (!self->_borderView)
  {
    double v3 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    borderView = self->_borderView;
    self->_borderView = v3;

    [(UIView *)self->_borderView setAutoresizingMask:18];
    long long v5 = self->_borderView;
    [(SUUIItemOfferButton *)self bounds];
    -[UIView setFrame:](v5, "setFrame:");
    [(UIView *)self->_borderView setUserInteractionEnabled:0];
    uint64_t v6 = self->_borderView;
    [(SUUIItemOfferButton *)self addSubview:v6];
  }
}

- (void)_insertLabel
{
  if (!self->_titleLabel)
  {
    double v3 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    titleLabel = self->_titleLabel;
    self->_titleLabel = v3;

    [(UILabel *)self->_titleLabel setNumberOfLines:2];
    [(SUUIItemOfferButton *)self addSubview:self->_titleLabel];
    [(SUUIItemOfferButton *)self layoutSubviews];
  }
}

- (void)_insertImageView
{
  if (!self->_imageView)
  {
    id v3 = objc_alloc(MEMORY[0x263F82828]);
    [(SUUIItemOfferButton *)self bounds];
    id v4 = (UIImageView *)objc_msgSend(v3, "initWithFrame:");
    imageView = self->_imageView;
    self->_imageView = v4;

    uint64_t v6 = self->_imageView;
    [(SUUIItemOfferButton *)self addSubview:v6];
  }
}

- (void)_insertBorderedImageView
{
  if (!self->_borderedImageView)
  {
    id v3 = objc_alloc(MEMORY[0x263F82828]);
    [(SUUIItemOfferButton *)self _borderedImageViewFrame];
    id v4 = (UIImageView *)objc_msgSend(v3, "initWithFrame:");
    borderedImageView = self->_borderedImageView;
    self->_borderedImageView = v4;

    uint64_t v6 = self->_borderedImageView;
    [(SUUIItemOfferButton *)self addSubview:v6];
  }
}

- (CGRect)_borderedImageViewFrame
{
  [(SUUIItemOfferButton *)self bounds];
  double v4 = v3 + -16.0;
  double v5 = 0.0;
  double v6 = 8.0;
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v2;
  result.origin.CGFloat y = v6;
  result.origin.CGFloat x = v5;
  return result;
}

- (void)_insertUniversalView
{
  if (!self->_universalImageView)
  {
    double v3 = objc_opt_class();
    double v4 = [(SUUIItemOfferButton *)self tintColor];
    id v7 = [v3 _universalPlusImageWithTintColor:v4];

    double v5 = (UIImageView *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v7];
    universalImageView = self->_universalImageView;
    self->_universalImageView = v5;

    [(SUUIItemOfferButton *)self insertSubview:self->_universalImageView atIndex:0];
    [(UIImageView *)self->_universalImageView frame];
    -[UIImageView setFrame:](self->_universalImageView, "setFrame:", 3.0, 3.0);
  }
}

- (void)_insertCancelGestureRecognizer
{
  if (!self->_cancelGestureRecognizer)
  {
    double v3 = -[SUUIFocusedTouchGestureRecognizer initWithFocusedView:touchAllowance:]([SUUIFocusedTouchGestureRecognizer alloc], "initWithFocusedView:touchAllowance:", self, -10.0, -10.0, -10.0, -10.0);
    cancelGestureRecognizer = self->_cancelGestureRecognizer;
    self->_cancelGestureRecognizer = v3;

    [(SUUIFocusedTouchGestureRecognizer *)self->_cancelGestureRecognizer addTarget:self action:sel__cancelGestureAction_];
  }
  id v5 = [(SUUIItemOfferButton *)self window];
  [v5 addGestureRecognizer:self->_cancelGestureRecognizer];
}

- (void)_removeCancelGestureRecognizer
{
  cancelGestureRecognizer = self->_cancelGestureRecognizer;
  if (cancelGestureRecognizer)
  {
    double v4 = [(SUUIFocusedTouchGestureRecognizer *)cancelGestureRecognizer view];
    [v4 removeGestureRecognizer:self->_cancelGestureRecognizer];

    [(SUUIFocusedTouchGestureRecognizer *)self->_cancelGestureRecognizer removeTarget:self action:0];
    id v5 = self->_cancelGestureRecognizer;
    self->_cancelGestureRecognizer = 0;
  }
}

- (void)_reloadForCurrentState:(BOOL)a3
{
  if (a3)
  {
LABEL_5:
    [(SUUIItemOfferButton *)self setClipsToBounds:1];
    self->_usesDrawRectPath = 0;
    [(SUUIItemOfferButton *)self setNeedsDisplay];
    id v7 = [(SUUIItemOfferButton *)self buttonDescriptor];
    double v8 = [(SUUIItemOfferButton *)self _buttonPropertiesForState:v7];

    int v9 = [v8 hasBorderView];
    id v10 = (long long *)MEMORY[0x263F000D0];
    if (v9)
    {
      [(SUUIItemOfferButton *)self _insertBorderView];
      id v11 = [(UIView *)self->_borderView layer];
      [v11 removeAllAnimations];

      borderView = self->_borderView;
      uint64_t v13 = [v8 borderBackgroundColor];
      [(UIView *)borderView setBackgroundColor:v13];

      id v14 = [(UIView *)self->_borderView layer];
      id v15 = [v8 borderColor];
      objc_msgSend(v14, "setBorderColor:", objc_msgSend(v15, "CGColor"));

      id v16 = [(UIView *)self->_borderView layer];
      long long v17 = [v8 borderCompositingFilter];
      [v16 setCompositingFilter:v17];

      id v18 = [(UIView *)self->_borderView layer];
      [v8 borderWidth];
      objc_msgSend(v18, "setBorderWidth:");

      id v19 = [(UIView *)self->_borderView layer];
      [v8 borderCornerRadius];
      objc_msgSend(v19, "setCornerRadius:");

      id v20 = self->_borderView;
      long long v21 = v10[1];
      long long v52 = *v10;
      long long v53 = v21;
      long long v54 = v10[2];
      [(UIView *)v20 setTransform:&v52];
      self->_borderCornerRadiusMatchesHalfBoundingDimension = [v8 borderCornerRadiusMatchesHalfBoundingDimension];
    }
    else
    {
      [(UIView *)self->_borderView removeFromSuperview];
      uint64_t v22 = self->_borderView;
      self->_borderView = 0;
    }
    if ([v8 hasTitleLabel])
    {
      [(SUUIItemOfferButton *)self _insertLabel];
      uint64_t v23 = [(UILabel *)self->_titleLabel layer];
      [v23 removeAllAnimations];

      titleLabel = self->_titleLabel;
      id v25 = [v8 textColor];
      [(UILabel *)titleLabel setTextColor:v25];

      double v26 = self->_titleLabel;
      id v27 = [v8 attributedText];
      [(UILabel *)v26 setAttributedText:v27];
    }
    else
    {
      [(UILabel *)self->_titleLabel removeFromSuperview];
      id v27 = self->_titleLabel;
      self->_titleLabel = 0;
    }

    [(SUUIItemOfferButton *)self _adjustViewOrderingForProperties:v8];
    if ([v8 universal])
    {
      [(SUUIItemOfferButton *)self _insertUniversalView];
    }
    else
    {
      [(UIImageView *)self->_universalImageView removeFromSuperview];
      universalImageView = self->_universalImageView;
      self->_universalImageView = 0;
    }
    id v29 = [v8 image];

    if (v29)
    {
      [(SUUIItemOfferButton *)self _insertImageView];
      id v30 = [(UIImageView *)self->_imageView layer];
      [v30 removeAllAnimations];

      image = self->_image;
      if (!image) {
        image = self->_cloudImage;
      }
      [(UIImageView *)self->_imageView setImage:image];
    }
    else
    {
      [(UIImageView *)self->_imageView removeFromSuperview];
      imageView = self->_imageView;
      self->_imageView = 0;
    }
    id v33 = [v8 borderedImage];

    if (v33)
    {
      [(SUUIItemOfferButton *)self _insertBorderedImageView];
      [(UIImageView *)self->_borderedImageView setImage:self->_borderedImage];
      borderedImageView = self->_borderedImageView;
      id v35 = [(SUUIItemOfferButton *)self tintColor];
      [(UIImageView *)borderedImageView setTintColor:v35];

      [(UIImageView *)self->_borderedImageView setContentMode:1];
      [(UIImageView *)self->_borderedImageView setClipsToBounds:1];
    }
    else
    {
      [(UIImageView *)self->_borderedImageView removeFromSuperview];
      int v36 = self->_borderedImageView;
      self->_borderedImageView = 0;
    }
    if ([v8 progressType])
    {
      [(SUUIItemOfferButton *)self _insertProgressIndicator];
      uint64_t v37 = [(SUUICircleProgressIndicator *)self->_progressIndicator layer];
      [v37 removeAllAnimations];

      progressIndicator = self->_progressIndicator;
      [v8 progress];
      -[SUUICircleProgressIndicator setProgress:](progressIndicator, "setProgress:");
      -[SUUICircleProgressIndicator setIndeterminate:](self->_progressIndicator, "setIndeterminate:", [v8 progressIndeterminate]);
      int v39 = self->_progressIndicator;
      id v40 = -[SUUIItemOfferButton _imageForProgressType:](self, "_imageForProgressType:", [v8 progressType]);
      [(SUUICircleProgressIndicator *)v39 setImage:v40];

      CGSize v41 = self->_progressIndicator;
      objc_msgSend((id)objc_opt_class(), "_imageInsetsForProgressType:", objc_msgSend(v8, "progressType"));
      -[SUUICircleProgressIndicator setImageInsets:](v41, "setImageInsets:");
    }
    else
    {
      [(SUUICircleProgressIndicator *)self->_progressIndicator removeFromSuperview];
      id v42 = self->_progressIndicator;
      self->_progressIndicator = 0;
    }
    [(UIImageView *)self->_universalImageView setAlpha:1.0];
    id v43 = self->_borderView;
    long long v44 = v10[1];
    long long v52 = *v10;
    long long v53 = v44;
    long long v54 = v10[2];
    [(UIView *)v43 setTransform:&v52];
    if ([v8 cancelRecognizer]) {
      [(SUUIItemOfferButton *)self _insertCancelGestureRecognizer];
    }
    else {
      [(SUUIItemOfferButton *)self _removeCancelGestureRecognizer];
    }
    id v45 = [(SUUIItemOfferButton *)self layer];
    [v45 removeAllAnimations];

    [v8 alpha];
    -[SUUIItemOfferButton setAlpha:](self, "setAlpha:");

    return;
  }
  double v4 = [(SUUIItemOfferButton *)self buttonDescriptor];
  if ([v4 progressType])
  {

    goto LABEL_5;
  }
  id v5 = [(SUUIItemOfferButton *)self buttonDescriptor];
  char v6 = [v5 showingConfirmation];

  if (v6) {
    goto LABEL_5;
  }
  [(SUUIItemOfferButton *)self setClipsToBounds:0];
  [(UIView *)self->_borderView removeFromSuperview];
  CGAffineTransform v46 = self->_borderView;
  self->_borderView = 0;

  [(UILabel *)self->_titleLabel removeFromSuperview];
  double v47 = self->_titleLabel;
  self->_titleLabel = 0;

  [(UIImageView *)self->_universalImageView removeFromSuperview];
  uint64_t v48 = self->_universalImageView;
  self->_universalImageView = 0;

  [(UIImageView *)self->_imageView removeFromSuperview];
  uint64_t v49 = self->_imageView;
  self->_imageView = 0;

  [(UIImageView *)self->_borderedImageView removeFromSuperview];
  float v50 = self->_borderedImageView;
  self->_borderedImageView = 0;

  [(SUUICircleProgressIndicator *)self->_progressIndicator removeFromSuperview];
  v51 = self->_progressIndicator;
  self->_progressIndicator = 0;

  [(SUUIItemOfferButton *)self _removeCancelGestureRecognizer];
  self->_usesDrawRectPath = 1;
  [(SUUIItemOfferButton *)self setNeedsDisplay];
}

- (void)_sendDidAnimate
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 itemOfferButtonDidAnimateTransition:self];
  }
}

- (void)_sendWillAnimate
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 itemOfferButtonWillAnimateTransition:self];
  }
}

- (void)_updateForChangedConfirmationTitleProperty
{
  v18[1] = *MEMORY[0x263EF8340];
  int64_t confirmationTitleStyle = self->_confirmationTitleStyle;
  if (confirmationTitleStyle == 1)
  {
    uint64_t v15 = *MEMORY[0x263F814F0];
    double v4 = [MEMORY[0x263F81708] systemFontOfSize:11.0 weight:*MEMORY[0x263F81828]];
    id v16 = v4;
    char v5 = NSDictionary;
    id v6 = &v16;
    id v7 = &v15;
  }
  else
  {
    if (confirmationTitleStyle) {
      goto LABEL_7;
    }
    uint64_t v17 = *MEMORY[0x263F814F0];
    double v4 = [MEMORY[0x263F81708] boldSystemFontOfSize:13.0];
    v18[0] = v4;
    char v5 = NSDictionary;
    id v6 = (void **)v18;
    id v7 = &v17;
  }
  double v8 = [v5 dictionaryWithObjects:v6 forKeys:v7 count:1];

  if (v8)
  {
    -[NSMutableAttributedString addAttributes:range:](self->_confirmationTitleAttributedString, "addAttributes:range:", v8, 0, [(NSMutableAttributedString *)self->_confirmationTitleAttributedString length]);
  }
LABEL_7:
  if ([(id)objc_opt_class() _sizeMattersForTitleStyle:self->_confirmationTitleStyle])
  {
    [(SUUIItemOfferButton *)self setNeedsLayout];
  }
  else
  {
    p_confirmationTitleFitSize = &self->_confirmationTitleFitSize;
    if (self->_confirmationTitleAttributedString)
    {
      id v10 = objc_opt_class();
      int64_t v11 = self->_confirmationTitleStyle;
      id v12 = (void *)[(NSMutableAttributedString *)self->_confirmationTitleAttributedString mutableCopy];
      objc_msgSend(v10, "_titleSizeThatFitsForSize:titleStyle:mutableAttributedString:", v11, v12, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
      p_confirmationTitleFitSize->CGFloat width = v13;
      self->_confirmationTitleFitSize.CGFloat height = v14;
    }
    else
    {
      CGSize *p_confirmationTitleFitSize = *(CGSize *)MEMORY[0x263F001B0];
    }
  }
  [(SUUIItemOfferButton *)self _reloadForCurrentState:0];
}

- (void)_updateForChangedTitleProperty
{
  v18[1] = *MEMORY[0x263EF8340];
  int64_t titleStyle = self->_titleStyle;
  if (titleStyle == 1)
  {
    uint64_t v15 = *MEMORY[0x263F814F0];
    double v4 = [MEMORY[0x263F81708] systemFontOfSize:11.0 weight:*MEMORY[0x263F81828]];
    id v16 = v4;
    char v5 = NSDictionary;
    id v6 = &v16;
    id v7 = &v15;
  }
  else
  {
    if (titleStyle) {
      goto LABEL_7;
    }
    uint64_t v17 = *MEMORY[0x263F814F0];
    double v4 = [MEMORY[0x263F81708] boldSystemFontOfSize:13.0];
    v18[0] = v4;
    char v5 = NSDictionary;
    id v6 = (void **)v18;
    id v7 = &v17;
  }
  double v8 = [v5 dictionaryWithObjects:v6 forKeys:v7 count:1];

  if (v8)
  {
    -[NSMutableAttributedString addAttributes:range:](self->_titleAttributedString, "addAttributes:range:", v8, 0, [(NSMutableAttributedString *)self->_titleAttributedString length]);
  }
LABEL_7:
  if (self->_usesDrawRectPath) {
    [(SUUIItemOfferButton *)self setNeedsDisplay];
  }
  if ([(id)objc_opt_class() _sizeMattersForTitleStyle:self->_titleStyle])
  {
    [(SUUIItemOfferButton *)self setNeedsLayout];
  }
  else
  {
    p_titleFitSize = &self->_titleFitSize;
    if (self->_titleAttributedString)
    {
      id v10 = objc_opt_class();
      int64_t v11 = self->_titleStyle;
      id v12 = (void *)[(NSMutableAttributedString *)self->_titleAttributedString mutableCopy];
      objc_msgSend(v10, "_titleSizeThatFitsForSize:titleStyle:mutableAttributedString:", v11, v12, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
      p_titleFitSize->CGFloat width = v13;
      self->_titleFitSize.CGFloat height = v14;
    }
    else
    {
      CGSize *p_titleFitSize = *(CGSize *)MEMORY[0x263F001B0];
    }
  }
  [(SUUIItemOfferButton *)self _reloadForCurrentState:0];
}

- (UIColor)cloudTintColor
{
  return self->_cloudTintColor;
}

- (int64_t)confirmationTitleStyle
{
  return self->_confirmationTitleStyle;
}

- (SUUIItemOfferButtonDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUUIItemOfferButtonDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)fillStyle
{
  return self->_fillStyle;
}

- (BOOL)showsConfirmationState
{
  return self->_showsConfirmationState;
}

- (void)setShowsConfirmationState:(BOOL)a3
{
  self->_showsConfirmationState = a3;
}

- (int64_t)titleStyle
{
  return self->_titleStyle;
}

- (BOOL)isUniversal
{
  return self->_universal;
}

- (UIImage)borderedImage
{
  return self->_borderedImage;
}

- (id)centerImageProvider
{
  return self->_centerImageProvider;
}

- (void)setCenterImageProvider:(id)a3
{
}

- (double)borderColorAlphaMultiplier
{
  return self->_borderColorAlphaMultiplier;
}

- (double)progress
{
  return self->_progress;
}

- (void)setButtonDescriptor:(id)a3
{
}

- (void)setBuyType:(id)a3
{
}

- (BOOL)isDisabledButSelectable
{
  return self->_disabledButSelectable;
}

- (SUUIButtonViewElement)element
{
  return self->_element;
}

- (void)setElement:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_element, 0);
  objc_storeStrong((id *)&self->_buyType, 0);
  objc_storeStrong((id *)&self->_buttonDescriptor, 0);
  objc_storeStrong(&self->_centerImageProvider, 0);
  objc_storeStrong((id *)&self->_borderedImage, 0);
  objc_storeStrong((id *)&self->_offerButtonStateDescription, 0);
  objc_storeStrong((id *)&self->_universalImageView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_titleAttributedString, 0);
  objc_storeStrong((id *)&self->_progressIndicator, 0);
  objc_storeStrong((id *)&self->_borderedImageView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_confirmationTitleAttributedString, 0);
  objc_storeStrong((id *)&self->_confirmationColor, 0);
  objc_storeStrong((id *)&self->_cloudTintColor, 0);
  objc_storeStrong((id *)&self->_cloudImage, 0);
  objc_storeStrong((id *)&self->_cancelGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_borderView, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end