@interface LoadingToken
- (LoadingToken)initWithInvalidationBlock:(id)a3;
- (void)dealloc;
- (void)end;
@end

@implementation LoadingToken

- (void)end
{
  invalidate = (void (**)(id, SEL))self->_invalidate;
  if (invalidate)
  {
    invalidate[2](invalidate, a2);
    invalidate = (void (**)(id, SEL))self->_invalidate;
  }
  self->_invalidate = 0;
}

- (void)dealloc
{
  [(LoadingToken *)self end];
  v3.receiver = self;
  v3.super_class = (Class)LoadingToken;
  [(LoadingToken *)&v3 dealloc];
}

- (LoadingToken)initWithInvalidationBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LoadingToken;
  v5 = [(LoadingToken *)&v9 init];
  if (v5)
  {
    id v6 = [v4 copy];
    id invalidate = v5->_invalidate;
    v5->_id invalidate = v6;
  }
  return v5;
}

- (void).cxx_destruct
{
}

@end