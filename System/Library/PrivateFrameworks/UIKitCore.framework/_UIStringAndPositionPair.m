@interface _UIStringAndPositionPair
- (BOOL)isEqualToPair:(void *)a3 inputDelegate:;
- (id)initWithString:(void *)a3 position:;
@end

@implementation _UIStringAndPositionPair

- (id)initWithString:(void *)a3 position:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)_UIStringAndPositionPair;
    a1 = (id *)objc_msgSendSuper2(&v10, sel_init);
    if (a1)
    {
      uint64_t v7 = [v5 copy];
      id v8 = a1[1];
      a1[1] = (id)v7;

      objc_storeStrong(a1 + 2, a3);
    }
  }

  return a1;
}

- (BOOL)isEqualToPair:(void *)a3 inputDelegate:
{
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = 0;
  if (a1 && v5)
  {
    if ([*(id *)(a1 + 8) isEqualToString:v5[1]]) {
      BOOL v7 = [v6 comparePosition:*(void *)(a1 + 16) toPosition:v5[2]] == 0;
    }
    else {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_position, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end