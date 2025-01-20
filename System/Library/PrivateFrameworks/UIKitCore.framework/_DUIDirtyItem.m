@interface _DUIDirtyItem
+ (BOOL)supportsSecureCoding;
- (_DUIDirtyItem)initWithCoder:(id)a3;
- (id)description;
- (unint64_t)index;
- (void)encodeWithCoder:(id)a3;
- (void)setIndex:(unint64_t)a3;
@end

@implementation _DUIDirtyItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_DUIDirtyItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_DUIDirtyItem;
  v5 = [(_DUIDirtyItem *)&v7 init];
  if (v5) {
    v5->_index = [v4 decodeIntegerForKey:@"index"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ %p: index=%lu>", objc_opt_class(), self, self->_index];
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

@end