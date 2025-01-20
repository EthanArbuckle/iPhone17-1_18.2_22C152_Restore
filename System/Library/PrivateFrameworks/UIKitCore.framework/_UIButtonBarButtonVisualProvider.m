@interface _UIButtonBarButtonVisualProvider
+ (id)visualProviderForIdiom:(int64_t)a3;
+ (void)registerPlatformVisualProviderClass:(Class)a3 forIdiom:(int64_t)a4;
- (BOOL)backButtonConstraintsActive;
- (BOOL)backButtonMaskEnabled;
- (BOOL)buttonEnabledState:(id)a3 forRequestedState:(BOOL)a4;
- (BOOL)buttonHeldState:(id)a3 forRequestedState:(BOOL)a4;
- (BOOL)buttonHighlitedState:(id)a3 forRequestedState:(BOOL)a4;
- (BOOL)buttonSelectionState:(id)a3 forRequestedState:(BOOL)a4;
- (BOOL)canUpdateMenuInPlace;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldLift;
- (BOOL)shouldSuppressPointerSpecularFilter;
- (BOOL)supportsBackButtons;
- (CGPoint)menuAnchorPoint;
- (CGPoint)pointerPreviewCenter;
- (CGSize)buttonBackgroundSize:(id)a3;
- (CGSize)buttonImageViewSize:(id)a3;
- (CGSize)buttonIntrinsicContentSize:(id)a3;
- (Class)buttonBarButtonClass;
- (Class)buttonControlClass;
- (UIColor)tintColor;
- (UIEdgeInsets)buttonAlignmentRectInsets:(id)a3;
- (UIView)alignmentViewForStaticNavBarButtonLeading;
- (UIView)alignmentViewForStaticNavBarButtonTrailing;
- (UIView)backIndicatorView;
- (UIView)contentView;
- (_UIButtonBarButton)button;
- (id)buttonContextMenuInteractionConfiguration;
- (id)buttonContextMenuStyleFromDefaultStyle:(id)a3;
- (id)buttonContextMenuTargetedPreview;
- (id)buttonSpringLoadedInteractionBehavior;
- (id)buttonSpringLoadedInteractionEffect;
- (id)copyWithZone:(_NSZone *)a3;
- (id)focusEffect;
- (id)matchingPointerShapeForView:(id)a3 rect:(CGRect)a4 inContainer:(id)a5;
- (id)pointerPreviewParameters;
- (id)pointerShapeInContainer:(id)a3;
- (id)symbolImageView;
- (unint64_t)hash;
- (void)buttonLayoutSubviews:(id)a3 baseImplementation:(id)a4;
- (void)configureButton:(id)a3 withAppearanceDelegate:(id)a4 fromBarItem:(id)a5;
- (void)setTintColor:(id)a3;
@end

@implementation _UIButtonBarButtonVisualProvider

- (UIEdgeInsets)buttonAlignmentRectInsets:(id)a3
{
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (CGSize)buttonIntrinsicContentSize:(id)a3
{
  double v3 = -1.0;
  double v4 = -1.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (BOOL)buttonEnabledState:(id)a3 forRequestedState:(BOOL)a4
{
  return a4;
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();

  return v4 == v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = (objc_class *)objc_opt_class();
  return objc_alloc_init(v3);
}

- (Class)buttonBarButtonClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_destroyWeak((id *)&self->_barButtonItem);
}

- (id)buttonSpringLoadedInteractionBehavior
{
  return 0;
}

+ (id)visualProviderForIdiom:(int64_t)a3
{
  id v3 = (void *)_MergedGlobals_21_0;
  uint64_t v4 = [NSNumber numberWithInteger:a3];
  [v3 objectForKeyedSubscript:v4];
  uint64_t v5 = objc_opt_new();
  double v6 = v5;
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = (id)objc_opt_new();
  }
  v8 = v7;

  return v8;
}

+ (void)registerPlatformVisualProviderClass:(Class)a3 forIdiom:(int64_t)a4
{
  if (qword_1EB25E7C0 != -1) {
    dispatch_once(&qword_1EB25E7C0, &__block_literal_global_47);
  }
  double v6 = (void *)_MergedGlobals_21_0;
  id v7 = [NSNumber numberWithInteger:a4];
  [v6 setObject:a3 forKeyedSubscript:v7];
}

- (Class)buttonControlClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)hash
{
  v2 = objc_opt_class();
  return [v2 hash];
}

- (_UIButtonBarButton)button
{
  return self->_button;
}

- (BOOL)supportsBackButtons
{
  return 0;
}

- (UIView)backIndicatorView
{
  return 0;
}

- (UIView)contentView
{
  return 0;
}

- (BOOL)backButtonConstraintsActive
{
  return 0;
}

- (BOOL)backButtonMaskEnabled
{
  return 0;
}

- (BOOL)buttonSelectionState:(id)a3 forRequestedState:(BOOL)a4
{
  return a4;
}

- (BOOL)buttonHighlitedState:(id)a3 forRequestedState:(BOOL)a4
{
  return a4;
}

- (BOOL)buttonHeldState:(id)a3 forRequestedState:(BOOL)a4
{
  return a4;
}

- (void)configureButton:(id)a3 withAppearanceDelegate:(id)a4 fromBarItem:(id)a5
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 handleFailureInMethod:a2, self, @"_UIButtonBarButton.m", 167, @"Failure attempting to configure a view for a UIBarButtonItem from visual style %@", self object file lineNumber description];
}

- (void)buttonLayoutSubviews:(id)a3 baseImplementation:(id)a4
{
}

- (CGSize)buttonBackgroundSize:(id)a3
{
  [a3 bounds];
  double v4 = v3;
  double v6 = v5;
  result.height = v6;
  result.width = v4;
  return result;
}

- (CGSize)buttonImageViewSize:(id)a3
{
  double v3 = *MEMORY[0x1E4F1DB30];
  double v4 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v4;
  result.width = v3;
  return result;
}

- (UIView)alignmentViewForStaticNavBarButtonLeading
{
  return 0;
}

- (UIView)alignmentViewForStaticNavBarButtonTrailing
{
  return 0;
}

- (id)pointerPreviewParameters
{
  v2 = objc_opt_new();
  return v2;
}

- (CGPoint)pointerPreviewCenter
{
  [(UIView *)self->_button bounds];
  CGFloat x = v10.origin.x;
  CGFloat y = v10.origin.y;
  CGFloat width = v10.size.width;
  CGFloat height = v10.size.height;
  CGFloat MidX = CGRectGetMidX(v10);
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v11);
  double v8 = MidX;
  result.CGFloat y = MidY;
  result.CGFloat x = v8;
  return result;
}

- (BOOL)shouldSuppressPointerSpecularFilter
{
  return 0;
}

- (id)pointerShapeInContainer:(id)a3
{
  button = self->_button;
  id v4 = a3;
  [(UIView *)button bounds];
  -[UIView convertRect:toView:](button, "convertRect:toView:", v4);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  return +[UIPointerShape shapeWithRoundedRect:](UIPointerShape, "shapeWithRoundedRect:", v6, v8, v10, v12);
}

- (id)matchingPointerShapeForView:(id)a3 rect:(CGRect)a4 inContainer:(id)a5
{
  objc_msgSend(a3, "convertRect:toView:", a5, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  return +[UIPointerShape shapeWithRoundedRect:](UIPointerShape, "shapeWithRoundedRect:");
}

- (BOOL)shouldLift
{
  return 0;
}

- (id)focusEffect
{
  v2 = [(_UIButtonBarButtonVisualProvider *)self pointerShapeInContainer:self->_button];
  [v2 rect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [v2 cornerRadius];
  double v12 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v4, v6, v8, v10, v11);
  v13 = +[UIFocusHaloEffect effectWithPath:v12];

  return v13;
}

- (id)buttonContextMenuInteractionConfiguration
{
  return 0;
}

- (id)buttonContextMenuTargetedPreview
{
  return 0;
}

- (id)buttonContextMenuStyleFromDefaultStyle:(id)a3
{
  id v3 = a3;
  return v3;
}

- (CGPoint)menuAnchorPoint
{
  [(UIView *)self->_button bounds];
  double v4 = v3 + v2 * 0.5;
  double v7 = v6 + v5 * 0.5;
  result.CGFloat y = v7;
  result.CGFloat x = v4;
  return result;
}

- (BOOL)canUpdateMenuInPlace
{
  return 0;
}

- (id)buttonSpringLoadedInteractionEffect
{
  return 0;
}

- (id)symbolImageView
{
  return 0;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
}

@end