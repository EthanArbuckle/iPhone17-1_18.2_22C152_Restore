@interface TRIPeekEnumerator
- (TRIPeekEnumerator)initWithEnumerator:(id)a3;
- (id)nextObject;
- (id)peekNextObject;
@end

@implementation TRIPeekEnumerator

- (TRIPeekEnumerator)initWithEnumerator:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIPeekEnumerator;
  v6 = [(TRIPeekEnumerator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_underlyingEnum, a3);
  }

  return v7;
}

- (id)peekNextObject
{
  id peek = self->_peek;
  if (!peek)
  {
    v4 = [(NSEnumerator *)self->_underlyingEnum nextObject];
    id v5 = self->_peek;
    self->_id peek = v4;

    id peek = self->_peek;
  }
  id v6 = peek;
  return v6;
}

- (id)nextObject
{
  id peek = self->_peek;
  if (peek)
  {
    id v4 = peek;
    id v5 = self->_peek;
    self->_id peek = 0;
  }
  else
  {
    id v4 = [(NSEnumerator *)self->_underlyingEnum nextObject];
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_peek, 0);
  objc_storeStrong((id *)&self->_underlyingEnum, 0);
}

@end