@interface SXDataTableCellStyle
+ (id)valueClassBlockForPropertyWithName:(id)a3;
- (id)paddingWithValue:(id)a3 withType:(int)a4;
- (id)textStylesWithValue:(id)a3 withType:(int)a4;
- (unint64_t)horizontalAlignmentWithValue:(id)a3 withType:(int)a4;
- (unint64_t)verticalAlignmentWithValue:(id)a3 withType:(int)a4;
@end

@implementation SXDataTableCellStyle

- (id)paddingWithValue:(id)a3 withType:(int)a4
{
  v16[4] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (v6 && a4 == 5)
  {
    v7 = [SXPadding alloc];
    v8 = [(SXJSONObject *)self specificationVersion];
    v9 = [(SXJSONObject *)v7 initWithJSONObject:v6 andVersion:v8];

    v10 = v6;
  }
  else
  {
    v10 = [(SXDataTableElementStyle *)self valueForLookupKey:@"padding"];

    if (v10
      && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
       || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
    {
      v11 = [SXPadding alloc];
      v15[0] = @"left";
      v15[1] = @"top";
      v16[0] = v10;
      v16[1] = v10;
      v15[2] = @"right";
      v15[3] = @"bottom";
      v16[2] = v10;
      v16[3] = v10;
      v12 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:4];
      v13 = [(SXJSONObject *)self specificationVersion];
      v9 = [(SXJSONObject *)v11 initWithJSONObject:v12 andVersion:v13];
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

+ (id)valueClassBlockForPropertyWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"conditional"])
  {
    v5 = &__block_literal_global_36;
  }
  else if ([v4 isEqualToString:@"selectors"])
  {
    v5 = &__block_literal_global_25;
  }
  else if ([v4 isEqualToString:@"textStyles"])
  {
    v5 = &__block_literal_global_31;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SXDataTableCellStyle;
    v5 = objc_msgSendSuper2(&v7, sel_valueClassBlockForPropertyWithName_, v4);
  }

  return v5;
}

uint64_t __59__SXDataTableCellStyle_valueClassBlockForPropertyWithName___block_invoke()
{
  return objc_opt_class();
}

uint64_t __59__SXDataTableCellStyle_valueClassBlockForPropertyWithName___block_invoke_2()
{
  return objc_opt_class();
}

uint64_t __59__SXDataTableCellStyle_valueClassBlockForPropertyWithName___block_invoke_3()
{
  return objc_opt_class();
}

- (unint64_t)verticalAlignmentWithValue:(id)a3 withType:(int)a4
{
  id v5 = a3;
  id v6 = v5;
  if (a4 == 3)
  {
    if ([v5 isEqualToString:@"top"])
    {
      unint64_t v7 = 1;
    }
    else if ([v6 isEqualToString:@"center"])
    {
      unint64_t v7 = 2;
    }
    else if ([v6 isEqualToString:@"bottom"])
    {
      unint64_t v7 = 3;
    }
    else
    {
      unint64_t v7 = 0;
    }
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (unint64_t)horizontalAlignmentWithValue:(id)a3 withType:(int)a4
{
  id v5 = a3;
  id v6 = v5;
  if (a4 == 3)
  {
    if ([v5 isEqualToString:@"left"])
    {
      unint64_t v7 = 1;
    }
    else if ([v6 isEqualToString:@"center"])
    {
      unint64_t v7 = 2;
    }
    else if ([v6 isEqualToString:@"right"])
    {
      unint64_t v7 = 3;
    }
    else
    {
      unint64_t v7 = 0;
    }
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (id)textStylesWithValue:(id)a3 withType:(int)a4
{
  id v6 = a3;
  unint64_t v7 = [MEMORY[0x263EFF980] array];
  v8 = v7;
  if (a4 == 4) {
    [v7 addObjectsFromArray:v6];
  }
  v9 = [(SXDataTableCellStyle *)self textStyle];

  if (v9)
  {
    v10 = [(SXDataTableCellStyle *)self textStyle];
    [v8 addObject:v10];
  }
  return v8;
}

@end