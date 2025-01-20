@interface CRRegisterLeast
- (int64_t)compare:(id)a3 with:(id)a4;
@end

@implementation CRRegisterLeast

- (int64_t)compare:(id)a3 with:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v5 == v6)
  {
    int64_t v8 = 0;
  }
  else if (v5)
  {
    if (v6) {
      int64_t v8 = [v6 compare:v5];
    }
    else {
      int64_t v8 = -1;
    }
  }
  else
  {
    int64_t v8 = 1;
  }

  return v8;
}

@end