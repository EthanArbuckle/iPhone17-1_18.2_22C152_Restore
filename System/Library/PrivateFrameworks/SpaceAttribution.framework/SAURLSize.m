@interface SAURLSize
+ (BOOL)supportsSecureCoding;
+ (id)newWithSize:(unint64_t)a3;
+ (id)newWithSize:(unint64_t)a3 mayBePartOfCloneChain:(BOOL)a4;
- (BOOL)mayBePartOfCloneChain;
- (SAURLSize)initWithCoder:(id)a3;
- (SAURLSize)initWithSize:(unint64_t)a3 mayBePartOfCloneChain:(BOOL)a4;
- (unint64_t)size;
- (void)encodeWithCoder:(id)a3;
- (void)setMayBePartOfCloneChain:(BOOL)a3;
- (void)setSize:(unint64_t)a3;
@end

@implementation SAURLSize

- (SAURLSize)initWithSize:(unint64_t)a3 mayBePartOfCloneChain:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SAURLSize;
  result = [(SAURLSize *)&v7 init];
  if (result)
  {
    result->_size = a3;
    result->_mayBePartOfCloneChain = a4;
  }
  return result;
}

+ (id)newWithSize:(unint64_t)a3
{
  id v4 = objc_alloc((Class)a1);
  return (id)[v4 initWithSize:a3 mayBePartOfCloneChain:0];
}

+ (id)newWithSize:(unint64_t)a3 mayBePartOfCloneChain:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = objc_alloc((Class)a1);
  return (id)[v6 initWithSize:a3 mayBePartOfCloneChain:v4];
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t size = self->_size;
  id v5 = a3;
  [v5 encodeInt64:size forKey:@"urlSize"];
  [v5 encodeBool:self->_mayBePartOfCloneChain forKey:@"cloneChain"];
}

- (SAURLSize)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SAURLSize;
  id v5 = [(SAURLSize *)&v7 init];
  if (v5)
  {
    v5->_unint64_t size = [v4 decodeInt64ForKey:@"urlSize"];
    v5->_mayBePartOfCloneChain = [v4 decodeBoolForKey:@"cloneChain"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_unint64_t size = a3;
}

- (BOOL)mayBePartOfCloneChain
{
  return self->_mayBePartOfCloneChain;
}

- (void)setMayBePartOfCloneChain:(BOOL)a3
{
  self->_mayBePartOfCloneChain = a3;
}

@end