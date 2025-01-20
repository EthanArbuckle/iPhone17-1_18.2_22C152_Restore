@interface SXComponentInsertionResult
- (id)initWithInsert:(void *)a3 marker:;
@end

@implementation SXComponentInsertionResult

- (id)initWithInsert:(void *)a3 marker:
{
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)SXComponentInsertionResult;
    v8 = (id *)objc_msgSendSuper2(&v10, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
    }
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_marker, 0);
  objc_storeStrong((id *)&self->_insert, 0);
}

@end