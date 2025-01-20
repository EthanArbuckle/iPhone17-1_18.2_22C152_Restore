@interface _UIContextMenuStyle
+ (id)defaultStyle;
- ($9638EFF0CCCAFE90921E224CC361F7AC)_preferredAnchor;
- (BOOL)_allowsImmediateSelection;
- (BOOL)_layoutAllowsMenu;
- (BOOL)_layoutAllowsPreview;
- (BOOL)_orderMenuBasedOnPriority;
- (BOOL)_shouldAvoidInputViews;
- (BOOL)hasInteractivePreview;
- (BOOL)ignoresContainerSizeChange;
- (BOOL)ignoresDefaultSizingRules;
- (BOOL)keepsInputViewsVisible;
- (BOOL)prefersCenteredPreviewWhenActionsAreAbsent;
- (BOOL)prefersStackedHierarchy;
- (BOOL)preventPreviewRasterization;
- (BOOL)previewOverlapsMenu;
- (CGPoint)_preferredMenuAttachmentPoint;
- (NSArray)preferredBackgroundEffects;
- (UIColor)preferredBackgroundColor;
- (UIEdgeInsets)preferredBackgroundInsets;
- (UIEdgeInsets)preferredEdgeInsets;
- (UITraitCollection)preferredTraitCollection;
- (UIView)containerView;
- (_UITraitEnvironmentInternal)_parentTraitEnvironmentForUserInterfaceStyle;
- (double)_preferredMenuWidth;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_backgroundInteractionStyle;
- (unint64_t)preferredAttachmentEdge;
- (unint64_t)preferredLayout;
- (void)setAllowsBackgroundInteractionAcrossProccesses:(BOOL)a3;
- (void)setContainerView:(id)a3;
- (void)setHasInteractivePreview:(BOOL)a3;
- (void)setIgnoresContainerSizeChange:(BOOL)a3;
- (void)setIgnoresDefaultSizingRules:(BOOL)a3;
- (void)setKeepsInputViewsVisible:(BOOL)a3;
- (void)setPreferredAttachmentEdge:(unint64_t)a3;
- (void)setPreferredBackgroundColor:(id)a3;
- (void)setPreferredBackgroundEffects:(id)a3;
- (void)setPreferredBackgroundInsets:(UIEdgeInsets)a3;
- (void)setPreferredEdgeInsets:(UIEdgeInsets)a3;
- (void)setPreferredLayout:(unint64_t)a3;
- (void)setPreferredTraitCollection:(id)a3;
- (void)setPrefersCenteredPreviewWhenActionsAreAbsent:(BOOL)a3;
- (void)setPrefersStackedHierarchy:(BOOL)a3;
- (void)setPreventPreviewRasterization:(BOOL)a3;
- (void)setPreviewOverlapsMenu:(BOOL)a3;
- (void)set_allowsImmediateSelection:(BOOL)a3;
- (void)set_backgroundInteractionStyle:(int64_t)a3;
- (void)set_orderMenuBasedOnPriority:(BOOL)a3;
- (void)set_parentTraitEnvironmentForUserInterfaceStyle:(id)a3;
- (void)set_preferredAnchor:(id *)a3;
- (void)set_preferredMenuAttachmentPoint:(CGPoint)a3;
- (void)set_preferredMenuWidth:(double)a3;
- (void)set_shouldAvoidInputViews:(BOOL)a3;
@end

@implementation _UIContextMenuStyle

+ (id)defaultStyle
{
  v2 = objc_opt_new();
  [v2 setPreferredLayout:100];
  uint64_t v12 = 0;
  v11[0] = _UIContextMenuNullAnchor;
  v11[1] = unk_186B92520;
  objc_msgSend(v2, "set_preferredAnchor:", v11);
  objc_msgSend(v2, "set_preferredMenuAttachmentPoint:", 1.79769313e308, 1.79769313e308);
  v2[11] = 0x7FFFFFFFFFFFFFFFLL;
  v3 = +[UIDevice currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4)
  {
    v5 = +[UIScreen mainScreen];
    [v5 bounds];
    double v7 = v6;
    double v9 = v8;

    objc_msgSend(v2, "setPreferredBackgroundInsets:", -v9, -v7, -v9, -v7);
  }
  return v2;
}

- (void)setPrefersCenteredPreviewWhenActionsAreAbsent:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = 0;
  long long v8 = 0u;
  long long v9 = 0u;
  [(_UIContextMenuStyle *)self _preferredAnchor];
  uint64_t v5 = 1;
  if (v3) {
    uint64_t v5 = 2;
  }
  uint64_t v10 = v5;
  uint64_t v7 = v5;
  v6[0] = v8;
  v6[1] = v9;
  [(_UIContextMenuStyle *)self set_preferredAnchor:v6];
}

- (BOOL)prefersCenteredPreviewWhenActionsAreAbsent
{
  [(_UIContextMenuStyle *)self _preferredAnchor];
  return v3 != 1;
}

- (void)setPrefersStackedHierarchy:(BOOL)a3
{
  BOOL v3 = a3;
  if ((_UIApplicationProcessIsSpringBoard() & 1) == 0)
  {
    double v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"_UIContextMenuStyle.m" lineNumber:68 description:@"This may only be used by SpringBoard."];
  }
  if (self->_prefersStackedHierarchy != v3) {
    self->_prefersStackedHierarchy = v3;
  }
}

- (void)setPreferredAttachmentEdge:(unint64_t)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50___UIContextMenuStyle_setPreferredAttachmentEdge___block_invoke;
  v5[3] = &unk_1E52D9CD0;
  v5[4] = self;
  v5[5] = a2;
  if (setPreferredAttachmentEdge__onceToken != -1) {
    dispatch_once(&setPreferredAttachmentEdge__onceToken, v5);
  }
  if (self->_preferredAttachmentEdge != a3) {
    self->_preferredAttachmentEdge = a3;
  }
}

- (void)setAllowsBackgroundInteractionAcrossProccesses:(BOOL)a3
{
  BOOL v3 = a3;
  if (!+[UIKeyboard isInputUIProcess])
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"_UIContextMenuStyle.m" lineNumber:95 description:@"This may only be used by InputUI"];
  }
  if (((([(_UIContextMenuStyle *)self _backgroundInteractionStyle] != 2) ^ v3) & 1) == 0)
  {
    if (v3) {
      uint64_t v6 = 2;
    }
    else {
      uint64_t v6 = 0;
    }
    [(_UIContextMenuStyle *)self set_backgroundInteractionStyle:v6];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [(id)objc_opt_class() allocWithZone:a3];
  uint64_t v5 = [(_UIContextMenuStyle *)self containerView];
  [(id)v4 setContainerView:v5];

  objc_msgSend((id)v4, "setPreferredLayout:", -[_UIContextMenuStyle preferredLayout](self, "preferredLayout"));
  objc_msgSend((id)v4, "setHasInteractivePreview:", -[_UIContextMenuStyle hasInteractivePreview](self, "hasInteractivePreview"));
  objc_msgSend((id)v4, "setPreventPreviewRasterization:", -[_UIContextMenuStyle preventPreviewRasterization](self, "preventPreviewRasterization"));
  objc_msgSend((id)v4, "setPreviewOverlapsMenu:", -[_UIContextMenuStyle previewOverlapsMenu](self, "previewOverlapsMenu"));
  objc_msgSend((id)v4, "setIgnoresContainerSizeChange:", -[_UIContextMenuStyle ignoresContainerSizeChange](self, "ignoresContainerSizeChange"));
  [(_UIContextMenuStyle *)self preferredEdgeInsets];
  objc_msgSend((id)v4, "setPreferredEdgeInsets:");
  uint64_t v6 = [(_UIContextMenuStyle *)self preferredBackgroundEffects];
  uint64_t v7 = (void *)[v6 copy];
  [(id)v4 setPreferredBackgroundEffects:v7];

  long long v8 = [(_UIContextMenuStyle *)self preferredBackgroundColor];
  long long v9 = (void *)[v8 copy];
  [(id)v4 setPreferredBackgroundColor:v9];

  [(_UIContextMenuStyle *)self preferredBackgroundInsets];
  objc_msgSend((id)v4, "setPreferredBackgroundInsets:");
  objc_msgSend((id)v4, "setKeepsInputViewsVisible:", -[_UIContextMenuStyle keepsInputViewsVisible](self, "keepsInputViewsVisible"));
  objc_msgSend((id)v4, "setIgnoresDefaultSizingRules:", -[_UIContextMenuStyle ignoresDefaultSizingRules](self, "ignoresDefaultSizingRules"));
  [(_UIContextMenuStyle *)self _preferredAnchor];
  v12[0] = v14;
  v12[1] = v15;
  uint64_t v13 = v16;
  objc_msgSend((id)v4, "set_preferredAnchor:", v12);
  [(_UIContextMenuStyle *)self _preferredMenuAttachmentPoint];
  objc_msgSend((id)v4, "set_preferredMenuAttachmentPoint:");
  objc_msgSend((id)v4, "set_allowsImmediateSelection:", -[_UIContextMenuStyle _allowsImmediateSelection](self, "_allowsImmediateSelection"));
  objc_msgSend((id)v4, "set_shouldAvoidInputViews:", -[_UIContextMenuStyle _shouldAvoidInputViews](self, "_shouldAvoidInputViews"));
  objc_msgSend((id)v4, "set_orderMenuBasedOnPriority:", -[_UIContextMenuStyle _orderMenuBasedOnPriority](self, "_orderMenuBasedOnPriority"));
  objc_msgSend((id)v4, "set_backgroundInteractionStyle:", -[_UIContextMenuStyle _backgroundInteractionStyle](self, "_backgroundInteractionStyle"));
  uint64_t v10 = [(_UIContextMenuStyle *)self _parentTraitEnvironmentForUserInterfaceStyle];
  objc_msgSend((id)v4, "set_parentTraitEnvironmentForUserInterfaceStyle:", v10);

  [(_UIContextMenuStyle *)self _preferredMenuWidth];
  objc_msgSend((id)v4, "set_preferredMenuWidth:");
  *(unsigned char *)(v4 + 17) = [(_UIContextMenuStyle *)self prefersStackedHierarchy];
  *(void *)(v4 + 88) = [(_UIContextMenuStyle *)self preferredAttachmentEdge];
  return (id)v4;
}

- (BOOL)_layoutAllowsPreview
{
  return [(_UIContextMenuStyle *)self preferredLayout] < 2;
}

- (BOOL)_layoutAllowsMenu
{
  unint64_t v2 = [(_UIContextMenuStyle *)self preferredLayout];
  return v2 < 2 || v2 == 3;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (unint64_t)preferredLayout
{
  return self->_preferredLayout;
}

- (void)setPreferredLayout:(unint64_t)a3
{
  self->_preferredLayout = a3;
}

- (UIEdgeInsets)preferredEdgeInsets
{
  double top = self->_preferredEdgeInsets.top;
  double left = self->_preferredEdgeInsets.left;
  double bottom = self->_preferredEdgeInsets.bottom;
  double right = self->_preferredEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setPreferredEdgeInsets:(UIEdgeInsets)a3
{
  self->_preferredEdgeInsets = a3;
}

- (BOOL)hasInteractivePreview
{
  return self->_hasInteractivePreview;
}

- (void)setHasInteractivePreview:(BOOL)a3
{
  self->_hasInteractivePreview = a3;
}

- (BOOL)preventPreviewRasterization
{
  return self->_preventPreviewRasterization;
}

- (void)setPreventPreviewRasterization:(BOOL)a3
{
  self->_preventPreviewRasterization = a3;
}

- (BOOL)previewOverlapsMenu
{
  return self->_previewOverlapsMenu;
}

- (void)setPreviewOverlapsMenu:(BOOL)a3
{
  self->_previewOverlapsMenu = a3;
}

- (BOOL)ignoresContainerSizeChange
{
  return self->_ignoresContainerSizeChange;
}

- (void)setIgnoresContainerSizeChange:(BOOL)a3
{
  self->_ignoresContainerSizeChange = a3;
}

- (BOOL)keepsInputViewsVisible
{
  return self->_keepsInputViewsVisible;
}

- (void)setKeepsInputViewsVisible:(BOOL)a3
{
  self->_keepsInputViewsVisible = a3;
}

- (BOOL)ignoresDefaultSizingRules
{
  return self->_ignoresDefaultSizingRules;
}

- (void)setIgnoresDefaultSizingRules:(BOOL)a3
{
  self->_ignoresDefaultSizingRules = a3;
}

- (UITraitCollection)preferredTraitCollection
{
  return self->_preferredTraitCollection;
}

- (void)setPreferredTraitCollection:(id)a3
{
}

- (NSArray)preferredBackgroundEffects
{
  return self->_preferredBackgroundEffects;
}

- (void)setPreferredBackgroundEffects:(id)a3
{
}

- (UIColor)preferredBackgroundColor
{
  return self->_preferredBackgroundColor;
}

- (void)setPreferredBackgroundColor:(id)a3
{
}

- (UIEdgeInsets)preferredBackgroundInsets
{
  double top = self->_preferredBackgroundInsets.top;
  double left = self->_preferredBackgroundInsets.left;
  double bottom = self->_preferredBackgroundInsets.bottom;
  double right = self->_preferredBackgroundInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setPreferredBackgroundInsets:(UIEdgeInsets)a3
{
  self->_preferredBackgroundInsets = a3;
}

- ($9638EFF0CCCAFE90921E224CC361F7AC)_preferredAnchor
{
  long long v3 = *(_OWORD *)&self[4].var4;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[4].var2;
  *(_OWORD *)&retstr->var2 = v3;
  retstr->var4 = self[5].var1;
  return self;
}

- (void)set_preferredAnchor:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  long long v4 = *(_OWORD *)&a3->var2;
  self->gravity = a3->var4;
  *(_OWORD *)&self->attachment = v3;
  *(_OWORD *)&self->attachmentOffset = v4;
}

- (CGPoint)_preferredMenuAttachmentPoint
{
  double x = self->__preferredMenuAttachmentPoint.x;
  double y = self->__preferredMenuAttachmentPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)set_preferredMenuAttachmentPoint:(CGPoint)a3
{
  self->__preferredMenuAttachmentPoint = a3;
}

- (BOOL)_allowsImmediateSelection
{
  return self->__allowsImmediateSelection;
}

- (void)set_allowsImmediateSelection:(BOOL)a3
{
  self->__allowsImmediateSelection = a3;
}

- (BOOL)_shouldAvoidInputViews
{
  return self->__shouldAvoidInputViews;
}

- (void)set_shouldAvoidInputViews:(BOOL)a3
{
  self->__shouldAvoidInputViews = a3;
}

- (BOOL)_orderMenuBasedOnPriority
{
  return self->__orderMenuBasedOnPriority;
}

- (void)set_orderMenuBasedOnPriority:(BOOL)a3
{
  self->__orderMenuBasedOnPrioritdouble y = a3;
}

- (int64_t)_backgroundInteractionStyle
{
  return self->__backgroundInteractionStyle;
}

- (void)set_backgroundInteractionStyle:(int64_t)a3
{
  self->__backgroundInteractionStyle = a3;
}

- (_UITraitEnvironmentInternal)_parentTraitEnvironmentForUserInterfaceStyle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__parentTraitEnvironmentForUserInterfaceStyle);
  return (_UITraitEnvironmentInternal *)WeakRetained;
}

- (void)set_parentTraitEnvironmentForUserInterfaceStyle:(id)a3
{
}

- (double)_preferredMenuWidth
{
  return self->__preferredMenuWidth;
}

- (void)set_preferredMenuWidth:(double)a3
{
  self->__preferredMenuWidth = a3;
}

- (BOOL)prefersStackedHierarchy
{
  return self->_prefersStackedHierarchy;
}

- (unint64_t)preferredAttachmentEdge
{
  return self->_preferredAttachmentEdge;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__parentTraitEnvironmentForUserInterfaceStyle);
  objc_storeStrong((id *)&self->_preferredBackgroundColor, 0);
  objc_storeStrong((id *)&self->_preferredBackgroundEffects, 0);
  objc_storeStrong((id *)&self->_preferredTraitCollection, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

@end