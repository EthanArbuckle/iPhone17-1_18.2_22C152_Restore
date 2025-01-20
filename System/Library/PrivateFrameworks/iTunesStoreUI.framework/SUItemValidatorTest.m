@interface SUItemValidatorTest
+ (id)defaultTest;
- (BOOL)isEqual:(id)a3;
- (BOOL)validateItem:(id)a3 offer:(id)a4 error:(id *)a5;
- (BOOL)validateItems:(id)a3 offers:(id)a4 error:(id *)a5;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation SUItemValidatorTest

+ (id)defaultTest
{
  id v2 = objc_alloc_init((Class)objc_opt_class());

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = (void *)[(id)objc_opt_class() allocWithZone:a3];

  return (id)[v3 init];
}

- (BOOL)validateItem:(id)a3 offer:(id)a4 error:(id *)a5
{
  if (a5) {
    *a5 = 0;
  }
  return 1;
}

- (BOOL)validateItems:(id)a3 offers:(id)a4 error:(id *)a5
{
  uint64_t v9 = [a3 count];
  uint64_t v10 = [a4 count];
  if (v9 < 1)
  {
    return 1;
  }
  else
  {
    uint64_t v11 = v10;
    BOOL v12 = 0;
    for (i = 0; i != v9; BOOL v12 = i >= v9)
    {
      uint64_t v14 = [a3 objectAtIndex:i];
      if (i >= v11) {
        uint64_t v15 = 0;
      }
      else {
        uint64_t v15 = [a4 objectAtIndex:i];
      }
      if (![(SUItemValidatorTest *)self validateItem:v14 offer:v15 error:a5]) {
        break;
      }
      ++i;
    }
  }
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3 = objc_opt_class();
  return v3 == objc_opt_class();
}

@end