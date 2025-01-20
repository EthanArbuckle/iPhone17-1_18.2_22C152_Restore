@interface UISApplicationSupportDisplayEdgeInsetsWrapper
- (NSString)description;
- (UISApplicationSupportDisplayEdgeInsetsWrapper)initWithTop:(double)a3 left:(double)a4 bottom:(double)a5 right:(double)a6;
- (UISApplicationSupportDisplayEdgeInsetsWrapper)initWithXPCDictionary:(id)a3;
- (double)bottomInset;
- (double)leftInset;
- (double)rightInset;
- (double)topInset;
- (void)encodeWithXPCDictionary:(id)a3;
- (void)setBottomInset:(double)a3;
- (void)setLeftInset:(double)a3;
- (void)setRightInset:(double)a3;
- (void)setTopInset:(double)a3;
@end

@implementation UISApplicationSupportDisplayEdgeInsetsWrapper

- (double)topInset
{
  return self->_topInset;
}

- (double)rightInset
{
  return self->_rightInset;
}

- (double)leftInset
{
  return self->_leftInset;
}

- (double)bottomInset
{
  return self->_bottomInset;
}

- (UISApplicationSupportDisplayEdgeInsetsWrapper)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UISApplicationSupportDisplayEdgeInsetsWrapper;
  v5 = [(UISApplicationSupportDisplayEdgeInsetsWrapper *)&v7 init];
  if (v5)
  {
    v5->_topInset = MEMORY[0x192FE0A50](v4, "UISApplicationSupportDisplayEdgeInsetsWrapperTop");
    v5->_leftInset = MEMORY[0x192FE0A50](v4, "UISApplicationSupportDisplayEdgeInsetsWrapperLeft");
    v5->_bottomInset = MEMORY[0x192FE0A50](v4, "UISApplicationSupportDisplayEdgeInsetsWrapperBottom");
    v5->_rightInset = MEMORY[0x192FE0A50](v4, "UISApplicationSupportDisplayEdgeInsetsWrapperRight");
  }

  return v5;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  double topInset = self->_topInset;
  id v5 = a3;
  MEMORY[0x192FE0B00](topInset);
  MEMORY[0x192FE0B00](v5, "UISApplicationSupportDisplayEdgeInsetsWrapperLeft", self->_leftInset);
  MEMORY[0x192FE0B00](v5, "UISApplicationSupportDisplayEdgeInsetsWrapperBottom", self->_bottomInset);
  MEMORY[0x192FE0B00](v5, "UISApplicationSupportDisplayEdgeInsetsWrapperRight", self->_rightInset);
}

- (UISApplicationSupportDisplayEdgeInsetsWrapper)initWithTop:(double)a3 left:(double)a4 bottom:(double)a5 right:(double)a6
{
  v11.receiver = self;
  v11.super_class = (Class)UISApplicationSupportDisplayEdgeInsetsWrapper;
  result = [(UISApplicationSupportDisplayEdgeInsetsWrapper *)&v11 init];
  if (result)
  {
    result->_double topInset = a3;
    result->_leftInset = a4;
    result->_bottomInset = a5;
    result->_rightInset = a6;
  }
  return result;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"{%g, %g, %g, %g}", *(void *)&self->_topInset, *(void *)&self->_leftInset, *(void *)&self->_bottomInset, *(void *)&self->_rightInset];
}

- (void)setTopInset:(double)a3
{
  self->_double topInset = a3;
}

- (void)setLeftInset:(double)a3
{
  self->_leftInset = a3;
}

- (void)setBottomInset:(double)a3
{
  self->_bottomInset = a3;
}

- (void)setRightInset:(double)a3
{
  self->_rightInset = a3;
}

@end