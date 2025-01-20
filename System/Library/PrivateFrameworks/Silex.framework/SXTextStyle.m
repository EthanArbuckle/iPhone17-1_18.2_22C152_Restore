@interface SXTextStyle
+ (Class)classForProtocolProperty:(id)a3 withValue:(id)a4;
+ (id)valueClassBlockForPropertyWithName:(id)a3;
- (int)verticalAlignmentWithValue:(id)a3 withType:(int)a4;
- (int64_t)fontSizeWithValue:(id)a3 withType:(int)a4;
- (int64_t)textTransformWithValue:(id)a3 withType:(int)a4;
@end

@implementation SXTextStyle

+ (Class)classForProtocolProperty:(id)a3 withValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"fontAttributes"])
  {
    uint64_t v8 = objc_opt_class();
  }
  else
  {
    v11.receiver = a1;
    v11.super_class = (Class)&OBJC_METACLASS___SXTextStyle;
    uint64_t v8 = objc_msgSendSuper2(&v11, sel_classForProtocolProperty_withValue_, v6, v7);
  }
  v9 = (void *)v8;

  return (Class)v9;
}

+ (id)valueClassBlockForPropertyWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"listStyle"])
  {
    v5 = &__block_literal_global_83;
  }
  else if ([v4 isEqualToString:@"conditional"])
  {
    v5 = &__block_literal_global_10_0;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SXTextStyle;
    v5 = objc_msgSendSuper2(&v7, sel_valueClassBlockForPropertyWithName_, v4);
  }

  return v5;
}

uint64_t __50__SXTextStyle_valueClassBlockForPropertyWithName___block_invoke()
{
  return objc_opt_class();
}

uint64_t __50__SXTextStyle_valueClassBlockForPropertyWithName___block_invoke_2()
{
  return objc_opt_class();
}

- (int64_t)textTransformWithValue:(id)a3 withType:(int)a4
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    if ([v4 isEqualToString:@"uppercase"])
    {
      int64_t v6 = 1;
    }
    else if ([v5 isEqualToString:@"lowercase"])
    {
      int64_t v6 = 2;
    }
    else if ([v5 isEqualToString:@"capitalize"])
    {
      int64_t v6 = 3;
    }
    else if ([v5 isEqualToString:@"smallcaps"])
    {
      int64_t v6 = 4;
    }
    else
    {
      int64_t v6 = 0;
    }
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (int)verticalAlignmentWithValue:(id)a3 withType:(int)a4
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    if ([v4 isEqualToString:@"baseline"])
    {
      int v6 = 1;
    }
    else if ([v5 isEqualToString:@"superscript"])
    {
      int v6 = 2;
    }
    else if ([v5 isEqualToString:@"subscript"])
    {
      int v6 = 3;
    }
    else
    {
      int v6 = 0;
    }
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

- (int64_t)fontSizeWithValue:(id)a3 withType:(int)a4
{
  if (a3) {
    return [a3 integerValue];
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

@end