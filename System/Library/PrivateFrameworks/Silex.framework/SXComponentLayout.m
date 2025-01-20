@interface SXComponentLayout
+ (Class)classForProtocolProperty:(id)a3 withValue:(id)a4;
+ (id)valueClassBlockForPropertyWithName:(id)a3;
- (id)paddingWithValue:(id)a3 withType:(int)a4;
- (uint64_t)sideForValue:(int)a3 withType:;
- (unint64_t)horizontalContentAlignmentWithValue:(id)a3 withType:(int)a4;
- (unint64_t)ignoreDocumentGutterWithValue:(id)a3 withType:(int)a4;
- (unint64_t)ignoreDocumentMarginWithValue:(id)a3 withType:(int)a4;
- (unint64_t)ignoreViewportPaddingWithValue:(id)a3 withType:(int)a4;
@end

@implementation SXComponentLayout

- (uint64_t)sideForValue:(int)a3 withType:
{
  id v5 = a2;
  v6 = v5;
  if (!a1) {
    goto LABEL_5;
  }
  if (a3 == 3)
  {
    if ([v5 isEqualToString:@"left"])
    {
      uint64_t v8 = 1;
      goto LABEL_14;
    }
    if ([v6 isEqualToString:@"right"])
    {
      uint64_t v8 = 2;
      goto LABEL_14;
    }
    int v7 = [v6 isEqualToString:@"both"];
    goto LABEL_11;
  }
  if (a3 != 2)
  {
LABEL_5:
    uint64_t v8 = 0;
    goto LABEL_14;
  }
  int v7 = [v5 BOOLValue];
LABEL_11:
  if (v7) {
    uint64_t v8 = 3;
  }
  else {
    uint64_t v8 = 0;
  }
LABEL_14:

  return v8;
}

- (unint64_t)ignoreViewportPaddingWithValue:(id)a3 withType:(int)a4
{
  return -[SXComponentLayout sideForValue:withType:]((uint64_t)self, a3, a4);
}

- (unint64_t)ignoreDocumentMarginWithValue:(id)a3 withType:(int)a4
{
  return -[SXComponentLayout sideForValue:withType:]((uint64_t)self, a3, a4);
}

- (unint64_t)ignoreDocumentGutterWithValue:(id)a3 withType:(int)a4
{
  return -[SXComponentLayout sideForValue:withType:]((uint64_t)self, a3, a4);
}

+ (id)valueClassBlockForPropertyWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"conditional"])
  {
    id v5 = &__block_literal_global_37;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SXComponentLayout;
    id v5 = objc_msgSendSuper2(&v7, sel_valueClassBlockForPropertyWithName_, v4);
  }

  return v5;
}

uint64_t __56__SXComponentLayout_valueClassBlockForPropertyWithName___block_invoke()
{
  return objc_opt_class();
}

+ (Class)classForProtocolProperty:(id)a3 withValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"margin"]
    || [v6 isEqualToString:@"padding"])
  {
    uint64_t v8 = objc_opt_class();
  }
  else
  {
    v11.receiver = a1;
    v11.super_class = (Class)&OBJC_METACLASS___SXComponentLayout;
    uint64_t v8 = objc_msgSendSuper2(&v11, sel_classForProtocolProperty_withValue_, v6, v7);
  }
  v9 = (void *)v8;

  return (Class)v9;
}

- (unint64_t)horizontalContentAlignmentWithValue:(id)a3 withType:(int)a4
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

- (id)paddingWithValue:(id)a3 withType:(int)a4
{
  v16[4] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (v6 && a4 == 5)
  {
    unint64_t v7 = [SXPadding alloc];
    uint64_t v8 = [(SXJSONObject *)self specificationVersion];
    v9 = [(SXJSONObject *)v7 initWithJSONObject:v6 andVersion:v8];

    v10 = v6;
  }
  else
  {
    v10 = [(SXJSONObject *)self valueForLookupKey:@"padding"];

    if (v10
      && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
       || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
    {
      objc_super v11 = [SXPadding alloc];
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

@end