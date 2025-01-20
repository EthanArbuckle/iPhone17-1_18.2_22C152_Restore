@interface UIAccessibilityElement
- (BOOL)canBecomeFocused;
- (BOOL)isAccessibilityElement;
- (BOOL)isTransparentFocusItem;
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (CGRect)accessibilityFrame;
- (CGRect)accessibilityFrameInContainerSpace;
- (CGRect)frame;
- (NSArray)preferredFocusEnvironments;
- (NSString)accessibilityHint;
- (NSString)accessibilityLabel;
- (NSString)accessibilityValue;
- (UIAccessibilityElement)initWithAccessibilityContainer:(id)container;
- (UIAccessibilityTraits)accessibilityTraits;
- (UIFocusEnvironment)parentFocusEnvironment;
- (id)_firstViewAncestor;
- (id)_preferredFocusRegionCoordinateSpace;
- (id)focusItemsInRect:(CGRect)a3;
- (id)nextResponder;
- (void)_destroyFocusLayer;
- (void)_searchForFocusRegionsInContext:(id)a3;
- (void)_updateFocusLayerFrame;
- (void)dealloc;
- (void)setAccessibilityFrame:(CGRect)accessibilityFrame;
- (void)setAccessibilityFrameInContainerSpace:(CGRect)accessibilityFrameInContainerSpace;
- (void)setAccessibilityHint:(NSString *)accessibilityHint;
- (void)setAccessibilityLabel:(NSString *)accessibilityLabel;
- (void)setAccessibilityTraits:(UIAccessibilityTraits)accessibilityTraits;
- (void)setAccessibilityValue:(NSString *)accessibilityValue;
- (void)setIsAccessibilityElement:(BOOL)isAccessibilityElement;
- (void)setNeedsFocusUpdate;
- (void)updateFocusIfNeeded;
@end

@implementation UIAccessibilityElement

- (void)setAccessibilityLabel:(NSString *)accessibilityLabel
{
  v3.receiver = self;
  v3.super_class = (Class)UIAccessibilityElement;
  [&v3 setAccessibilityLabel:accessibilityLabel];
}

- (UIAccessibilityElement)initWithAccessibilityContainer:(id)container
{
  v8.receiver = self;
  v8.super_class = (Class)UIAccessibilityElement;
  v4 = [(UIAccessibilityElement *)&v8 init];
  v5 = v4;
  if (v4)
  {
    [v4 setAccessibilityContainer:container];
    [(UIAccessibilityElement *)v5 setIsAccessibilityElement:1];
    CGSize v6 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    v5->_accessibilityFrameInContainerSpace.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    v5->_accessibilityFrameInContainerSpace.size = v6;
  }
  return v5;
}

- (void)setIsAccessibilityElement:(BOOL)isAccessibilityElement
{
  v3.receiver = self;
  v3.super_class = (Class)UIAccessibilityElement;
  [&v3 setIsAccessibilityElement:isAccessibilityElement];
}

- (void)dealloc
{
  [(UIAccessibilityElement *)self _destroyFocusLayer];
  v3.receiver = self;
  v3.super_class = (Class)UIAccessibilityElement;
  [(UIResponder *)&v3 dealloc];
}

- (BOOL)isAccessibilityElement
{
  v3.receiver = self;
  v3.super_class = (Class)UIAccessibilityElement;
  return [&v3 isAccessibilityElement];
}

- (NSString)accessibilityLabel
{
  v3.receiver = self;
  v3.super_class = (Class)UIAccessibilityElement;
  return [&v3 accessibilityLabel];
}

- (NSString)accessibilityHint
{
  v3.receiver = self;
  v3.super_class = (Class)UIAccessibilityElement;
  return [&v3 accessibilityHint];
}

- (void)setAccessibilityHint:(NSString *)accessibilityHint
{
  v3.receiver = self;
  v3.super_class = (Class)UIAccessibilityElement;
  [&v3 setAccessibilityHint:accessibilityHint];
}

- (NSString)accessibilityValue
{
  v3.receiver = self;
  v3.super_class = (Class)UIAccessibilityElement;
  return [&v3 accessibilityValue];
}

- (void)setAccessibilityValue:(NSString *)accessibilityValue
{
  v3.receiver = self;
  v3.super_class = (Class)UIAccessibilityElement;
  [&v3 setAccessibilityValue:accessibilityValue];
}

- (CGRect)accessibilityFrame
{
  v6.receiver = self;
  v6.super_class = (Class)UIAccessibilityElement;
  [&v6 accessibilityFrame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setAccessibilityFrame:(CGRect)accessibilityFrame
{
  CGSize v4 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  self->_accessibilityFrameInContainerSpace.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  self->_accessibilityFrameInContainerSpace.size = v4;
  v5.receiver = self;
  v5.super_class = (Class)UIAccessibilityElement;
  -[NSObject setAccessibilityFrame:](&v5, sel_setAccessibilityFrame_, accessibilityFrame.origin.x, accessibilityFrame.origin.y, accessibilityFrame.size.width, accessibilityFrame.size.height);
  [(UIAccessibilityElement *)self _updateFocusLayerFrame];
}

- (UIAccessibilityTraits)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)UIAccessibilityElement;
  return [&v3 accessibilityTraits];
}

- (void)setAccessibilityTraits:(UIAccessibilityTraits)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)UIAccessibilityElement;
  [&v3 setAccessibilityTraits:accessibilityTraits];
}

- (void)setAccessibilityFrameInContainerSpace:(CGRect)accessibilityFrameInContainerSpace
{
  CGFloat height = accessibilityFrameInContainerSpace.size.height;
  CGFloat width = accessibilityFrameInContainerSpace.size.width;
  CGFloat y = accessibilityFrameInContainerSpace.origin.y;
  CGFloat x = accessibilityFrameInContainerSpace.origin.x;
  p_accessibilityFrameInContainerSpace = &self->_accessibilityFrameInContainerSpace;
  if (!CGRectEqualToRect(self->_accessibilityFrameInContainerSpace, accessibilityFrameInContainerSpace))
  {
    p_accessibilityFrameInContainerSpace->origin.CGFloat x = x;
    p_accessibilityFrameInContainerSpace->origin.CGFloat y = y;
    p_accessibilityFrameInContainerSpace->size.CGFloat width = width;
    p_accessibilityFrameInContainerSpace->size.CGFloat height = height;
    [(UIAccessibilityElement *)self _updateFocusLayerFrame];
  }
}

- (NSArray)preferredFocusEnvironments
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (UIFocusEnvironment)parentFocusEnvironment
{
  while (1)
  {
    double v2 = [self accessibilityContainer];
    objc_super v3 = v2;
    if (!v2 || _UIFocusEnvironmentSafeCast(v2)) {
      break;
    }
    self = v3;
  }
  return (UIFocusEnvironment *)v3;
}

- (void)setNeedsFocusUpdate
{
  [+[UIFocusSystem focusSystemForEnvironment:self] requestFocusUpdateToEnvironment:self];
  [(UIAccessibilityElement *)self _updateFocusLayerFrame];
}

- (void)updateFocusIfNeeded
{
  [+[UIFocusSystem focusSystemForEnvironment:self] updateFocusIfNeeded];
  [(UIAccessibilityElement *)self _updateFocusLayerFrame];
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  return 1;
}

- (void)_destroyFocusLayer
{
}

- (void)_updateFocusLayerFrame
{
}

- (BOOL)canBecomeFocused
{
  BOOL v3 = [(UIAccessibilityElement *)self isAccessibilityElement];
  if (v3)
  {
    LOBYTE(v3) = [self accessibilityRespondsToUserInteraction];
  }
  return v3;
}

- (CGRect)frame
{
  id v3 = [(UIAccessibilityElement *)self _firstViewAncestor];
  CGSize v4 = (void *)[v3 window];
  [(UIAccessibilityElement *)self accessibilityFrame];
  objc_msgSend(v4, "convertRect:toView:", v3);
  result.size.CGFloat height = v8;
  result.size.CGFloat width = v7;
  result.origin.CGFloat y = v6;
  result.origin.CGFloat x = v5;
  return result;
}

- (BOOL)isTransparentFocusItem
{
  return 1;
}

- (void)_searchForFocusRegionsInContext:(id)a3
{
}

- (id)_preferredFocusRegionCoordinateSpace
{
  double v2 = objc_msgSend(-[UIAccessibilityElement _firstViewAncestor](self, "_firstViewAncestor"), "_screen");
  return (id)[v2 coordinateSpace];
}

- (id)focusItemsInRect:(CGRect)a3
{
  id v3 = [self accessibilityElements];
  uint64_t v4 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1];
  return [(NSArray *)v3 filteredArrayUsingPredicate:v4];
}

id __43__UIAccessibilityElement_focusItemsInRect___block_invoke(uint64_t a1, void *a2)
{
  id result = _UIFocusItemSafeCast(a2);
  if (result) {
    return (id)(_IsKindOfUIView((uint64_t)a2) ^ 1);
  }
  return result;
}

- (id)_firstViewAncestor
{
  id v2 = [self accessibilityContainer];
  objc_opt_class();
  while ((objc_opt_isKindOfClass() & 1) == 0 && v2)
  {
    id v2 = (id)[v2 accessibilityContainer];
    objc_opt_class();
  }
  return v2;
}

- (id)nextResponder
{
  id v2 = [self accessibilityContainer];
  char v3 = objc_msgSend(v2, "__isKindOfUIResponder");
  if (v2 && (v3 & 1) == 0)
  {
    do
    {
      id v2 = (id)[v2 accessibilityContainer];
      int v4 = objc_msgSend(v2, "__isKindOfUIResponder");
    }
    while (v2 && !v4);
  }
  return v2;
}

- (CGRect)accessibilityFrameInContainerSpace
{
  double x = self->_accessibilityFrameInContainerSpace.origin.x;
  double y = self->_accessibilityFrameInContainerSpace.origin.y;
  double width = self->_accessibilityFrameInContainerSpace.size.width;
  double height = self->_accessibilityFrameInContainerSpace.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

@end