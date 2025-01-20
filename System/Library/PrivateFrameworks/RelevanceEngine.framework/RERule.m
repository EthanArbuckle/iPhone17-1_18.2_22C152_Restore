@interface RERule
- (BOOL)isEqual:(id)a3;
- (RERule)init;
- (float)priority;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setPriority:(float)a3;
@end

@implementation RERule

- (unint64_t)hash
{
  return (unint64_t)self->_priority;
}

- (float)priority
{
  return self->_priority;
}

- (RERule)init
{
  v3.receiver = self;
  v3.super_class = (Class)RERule;
  result = [(RERule *)&v3 init];
  if (result) {
    result->_priority = 1000.0;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (RERule *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_priority == v4->_priority;
  }

  return v5;
}

- (void)setPriority:(float)a3
{
  self->_priority = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 2) = LODWORD(self->_priority);
  return result;
}

@end