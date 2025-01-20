@interface FCTopicalLeafNode
- (double)initWithNode:(double)a3 score:;
@end

@implementation FCTopicalLeafNode

- (double)initWithNode:(double)a3 score:
{
  id v6 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)FCTopicalLeafNode;
    id v7 = objc_msgSendSuper2(&v9, sel_init);
    a1 = (double *)v7;
    if (v7)
    {
      objc_storeStrong((id *)v7 + 1, a2);
      a1[2] = a3;
    }
  }

  return a1;
}

- (void).cxx_destruct
{
}

@end