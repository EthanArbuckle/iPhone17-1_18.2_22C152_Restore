@interface _UIFocusItemDummy
- (BOOL)canBecomeFocused;
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (CGRect)frame;
- (NSArray)preferredFocusEnvironments;
- (UIFocusEnvironment)parentFocusEnvironment;
- (UIFocusItemContainer)focusItemContainer;
- (void)setFrame:(CGRect)a3;
- (void)setParentFocusEnvironment:(id)a3;
@end

@implementation _UIFocusItemDummy

- (BOOL)canBecomeFocused
{
  return 0;
}

- (NSArray)preferredFocusEnvironments
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = self;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return (NSArray *)v2;
}

- (UIFocusItemContainer)focusItemContainer
{
  return 0;
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  return 1;
}

- (CGRect)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (UIFocusEnvironment)parentFocusEnvironment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentFocusEnvironment);
  return (UIFocusEnvironment *)WeakRetained;
}

- (void)setParentFocusEnvironment:(id)a3
{
}

- (void).cxx_destruct
{
}

@end