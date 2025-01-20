@interface SXComponentStyle
+ (id)valueClassBlockForPropertyWithName:(id)a3;
- (id)fillWithValue:(id)a3 withType:(int)a4;
- (id)maskWithValue:(id)a3 withType:(int)a4;
- (unint64_t)traits;
@end

@implementation SXComponentStyle

+ (id)valueClassBlockForPropertyWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"conditional"])
  {
    v5 = &__block_literal_global_45;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SXComponentStyle;
    v5 = objc_msgSendSuper2(&v7, sel_valueClassBlockForPropertyWithName_, v4);
  }

  return v5;
}

uint64_t __55__SXComponentStyle_valueClassBlockForPropertyWithName___block_invoke()
{
  return objc_opt_class();
}

- (id)fillWithValue:(id)a3 withType:(int)a4
{
  if (a4 == 5)
  {
    id v5 = a3;
    uint64_t v6 = objc_opt_class();
    objc_super v7 = [v5 objectForKey:@"type"];
    v8 = +[SXClassFactory classForBaseClass:v6 type:v7];

    id v9 = [v8 alloc];
    v10 = [(SXJSONObject *)self specificationVersion];
    v11 = (void *)[v9 initWithJSONObject:v5 andVersion:v10];
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)maskWithValue:(id)a3 withType:(int)a4
{
  if (a4 == 5)
  {
    id v5 = a3;
    uint64_t v6 = objc_opt_class();
    objc_super v7 = [v5 objectForKey:@"type"];
    v8 = +[SXClassFactory classForBaseClass:v6 type:v7];

    id v9 = [v8 alloc];
    v10 = [(SXJSONObject *)self specificationVersion];
    v11 = (void *)[v9 initWithJSONObject:v5 andVersion:v10];
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (unint64_t)traits
{
  v3 = [(SXComponentStyle *)self fill];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    return 2;
  }
  uint64_t v6 = [(SXComponentStyle *)self fill];
  objc_opt_class();
  char v7 = objc_opt_isKindOfClass();

  if (v7) {
    return 4;
  }
  else {
    return 0;
  }
}

@end