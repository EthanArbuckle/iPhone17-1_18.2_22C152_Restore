@interface SKUITabularLockupColumn
- (CGSize)size;
- (NSArray)childViewElements;
- (SKUITabularLockupColumn)initWithColumnIdentifier:(int64_t)a3;
- (id)description;
- (int64_t)identifier;
- (void)_addChildViewElement:(id)a3;
- (void)setIdentifier:(int64_t)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation SKUITabularLockupColumn

- (SKUITabularLockupColumn)initWithColumnIdentifier:(int64_t)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUITabularLockupColumn initWithColumnIdentifier:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)SKUITabularLockupColumn;
  v13 = [(SKUITabularLockupColumn *)&v17 init];
  if (v13)
  {
    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    childViewElements = v13->_childViewElements;
    v13->_childViewElements = v14;

    v13->_identifier = a3;
  }
  return v13;
}

- (void)_addChildViewElement:(id)a3
{
}

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)SKUITabularLockupColumn;
  v4 = [(SKUITabularLockupColumn *)&v9 description];
  int64_t identifier = self->_identifier;
  uint64_t v6 = NSStringFromCGSize(self->_size);
  uint64_t v7 = [v3 stringWithFormat:@"%@: [%ld, %@, %@]", v4, identifier, v6, self->_childViewElements];

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

- (void)initWithColumnIdentifier:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end