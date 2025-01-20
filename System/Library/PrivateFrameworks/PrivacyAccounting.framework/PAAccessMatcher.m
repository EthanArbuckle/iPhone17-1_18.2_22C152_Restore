@interface PAAccessMatcher
+ (id)coalescingMatcherForAccess:(id)a3;
- (BOOL)isEqual:(id)a3;
- (PAAccess)access;
- (PAAccessMatcher)initWithAccess:(id)a3 options:(unint64_t)a4;
- (unint64_t)hash;
- (unint64_t)options;
@end

@implementation PAAccessMatcher

- (void).cxx_destruct
{
}

- (unint64_t)hash
{
  unint64_t v3 = [(PAAccess *)self->_access hashWithOptions:self->_options];
  return self->_options - v3 + 32 * v3;
}

+ (id)coalescingMatcherForAccess:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithAccess:v4 options:63];

  return v5;
}

- (PAAccessMatcher)initWithAccess:(id)a3 options:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PAAccessMatcher;
  v8 = [(PAAccessMatcher *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_access, a3);
    v9->_options = a4;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PAAccessMatcher *)a3;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else if ([(PAAccessMatcher *)v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = v4;
    unint64_t options = self->_options;
    if (options == [(PAAccessMatcher *)v5 options])
    {
      access = self->_access;
      v8 = [(PAAccessMatcher *)v5 access];
      char v9 = [(PAAccess *)access isEqualToAccess:v8 withOptions:self->_options];
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)options
{
  return self->_options;
}

- (PAAccess)access
{
  return self->_access;
}

@end