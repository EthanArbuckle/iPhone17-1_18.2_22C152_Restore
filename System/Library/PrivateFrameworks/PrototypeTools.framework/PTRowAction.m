@interface PTRowAction
+ (BOOL)supportsSecureCoding;
+ (PTRowAction)actionWithHandler:(id)a3;
- (BOOL)deselectsRowOnSuccess;
- (BOOL)isEncodable;
- (BOOL)isEqual:(id)a3;
- (id)defaultHandler;
- (id)handler;
- (unint64_t)hash;
- (void)setIsEncodable:(BOOL)a3;
@end

@implementation PTRowAction

+ (PTRowAction)actionWithHandler:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v5 = [v3 copy];

  v6 = (void *)v4[1];
  v4[1] = v5;

  return (PTRowAction *)v4;
}

- (id)handler
{
  id handler = self->_handler;
  if (handler)
  {
    v4 = (void *)MEMORY[0x1C1899990](handler, a2);
  }
  else
  {
    uint64_t v5 = [(PTRowAction *)self defaultHandler];
    v4 = (void *)MEMORY[0x1C1899990]();
  }
  return v4;
}

- (BOOL)deselectsRowOnSuccess
{
  return 1;
}

- (id)defaultHandler
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  id v3 = a3;
  char v4 = [v3 isMemberOfClass:objc_opt_class()];

  return v4;
}

- (unint64_t)hash
{
  v2 = [MEMORY[0x1E4F4F758] builder];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEncodable
{
  return self->_handler == 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setIsEncodable:(BOOL)a3
{
  self->_isEncodable = a3;
}

- (void).cxx_destruct
{
}

@end