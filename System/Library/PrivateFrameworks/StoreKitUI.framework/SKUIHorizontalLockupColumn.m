@interface SKUIHorizontalLockupColumn
- (CGSize)size;
- (NSArray)childViewElements;
- (SKUIHorizontalLockupColumn)init;
- (id)description;
- (int64_t)identifier;
- (void)_addChildViewElement:(id)a3;
- (void)setIdentifier:(int64_t)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation SKUIHorizontalLockupColumn

- (SKUIHorizontalLockupColumn)init
{
  v6.receiver = self;
  v6.super_class = (Class)SKUIHorizontalLockupColumn;
  v2 = [(SKUIHorizontalLockupColumn *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    childViewElements = v2->_childViewElements;
    v2->_childViewElements = v3;
  }
  return v2;
}

- (void)_addChildViewElement:(id)a3
{
}

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)SKUIHorizontalLockupColumn;
  v4 = [(SKUIHorizontalLockupColumn *)&v9 description];
  int64_t identifier = self->_identifier;
  objc_super v6 = NSStringFromCGSize(self->_size);
  v7 = [v3 stringWithFormat:@"%@: [%ld, %@, %@]", v4, identifier, v6, self->_childViewElements];

  return v7;
}

- (NSArray)childViewElements
{
  return &self->_childViewElements->super;
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(int64_t)a3
{
  self->_int64_t identifier = a3;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (void).cxx_destruct
{
}

@end