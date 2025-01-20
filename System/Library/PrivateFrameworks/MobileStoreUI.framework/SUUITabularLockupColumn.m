@interface SUUITabularLockupColumn
- (CGSize)size;
- (NSArray)childViewElements;
- (SUUITabularLockupColumn)initWithColumnIdentifier:(int64_t)a3;
- (id)description;
- (int64_t)identifier;
- (void)_addChildViewElement:(id)a3;
- (void)setIdentifier:(int64_t)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation SUUITabularLockupColumn

- (SUUITabularLockupColumn)initWithColumnIdentifier:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SUUITabularLockupColumn;
  v4 = [(SUUITabularLockupColumn *)&v8 init];
  if (v4)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    childViewElements = v4->_childViewElements;
    v4->_childViewElements = v5;

    v4->_identifier = a3;
  }
  return v4;
}

- (void)_addChildViewElement:(id)a3
{
}

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)SUUITabularLockupColumn;
  v4 = [(SUUITabularLockupColumn *)&v9 description];
  int64_t identifier = self->_identifier;
  v6 = NSStringFromCGSize(self->_size);
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