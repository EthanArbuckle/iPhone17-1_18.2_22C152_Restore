@interface DBTDuxburyFormatIXRTNode
+ (id)beginCode;
+ (id)endCode;
+ (id)innerCodes;
- (BOOL)foundInnerCode:(id)a3;
- (id)LaTeXRepresentation;
- (void)foundEndCode:(id)a3;
@end

@implementation DBTDuxburyFormatIXRTNode

+ (id)beginCode
{
  return @"ixrts";
}

+ (id)endCode
{
  return @"ixrte";
}

+ (id)innerCodes
{
  return +[NSSet setWithObject:@"ixrtd"];
}

- (id)LaTeXRepresentation
{
  v3 = [(DBTDuxburyFormatNode *)self children];
  v4 = [v3 firstObject];

  v5 = [(DBTDuxburyFormatNode *)self children];
  v6 = [v5 lastObject];

  v7 = [v4 LaTeXRepresentation];
  v8 = [v6 LaTeXRepresentation];
  v9 = +[NSString stringWithFormat:@"\\sqrt[%@]{%@}", v7, v8];

  return v9;
}

- (BOOL)foundInnerCode:(id)a3
{
  if ([a3 isEqualToString:@"ixrtd"])
  {
    v4 = [(DBTDuxburyFormatNode *)self children];
    v5 = [v4 firstObject];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();

    if (v6 != v7)
    {
      v8 = objc_alloc_init(DBTDuxburyFormatIXRTRootNode);
      v9 = [(DBTDuxburyFormatNode *)self children];
      [(DBTDuxburyFormatNode *)v8 addChildren:v9];

      [(DBTDuxburyFormatNode *)self removeAllChildren];
      [(DBTDuxburyFormatNode *)self addChild:v8];
    }
  }
  return 1;
}

- (void)foundEndCode:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)DBTDuxburyFormatIXRTNode;
  id v4 = a3;
  [(DBTDuxburyFormatNode *)&v13 foundEndCode:v4];
  v5 = objc_msgSend((id)objc_opt_class(), "endCode", v13.receiver, v13.super_class);
  unsigned int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    uint64_t v7 = [(DBTDuxburyFormatNode *)self children];
    v8 = [v7 firstObject];

    v9 = objc_alloc_init(DBTDuxburyFormatIXRTRadicandNode);
    v10 = [(DBTDuxburyFormatNode *)self children];
    v11 = [(DBTDuxburyFormatNode *)self children];
    v12 = objc_msgSend(v10, "subarrayWithRange:", 1, (char *)objc_msgSend(v11, "count") - 1);

    [(DBTDuxburyFormatNode *)v9 addChildren:v12];
    [(DBTDuxburyFormatNode *)self removeAllChildren];
    [(DBTDuxburyFormatNode *)self addChild:v8];
    [(DBTDuxburyFormatNode *)self addChild:v9];
  }
}

@end