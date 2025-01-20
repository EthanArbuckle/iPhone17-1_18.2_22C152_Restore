@interface DBTDuxburyFormatFNode
+ (id)beginCode;
+ (id)endCode;
+ (id)innerCodes;
- (BOOL)foundInnerCode:(id)a3;
- (BOOL)isSlanted;
- (id)LaTeXRepresentation;
- (void)foundEndCode:(id)a3;
@end

@implementation DBTDuxburyFormatFNode

+ (id)beginCode
{
  return @"fs";
}

+ (id)endCode
{
  return @"fe";
}

+ (id)innerCodes
{
  return +[NSSet setWithObjects:@"fl", @"fls", 0];
}

- (id)LaTeXRepresentation
{
  v3 = [(DBTDuxburyFormatNode *)self children];
  v4 = [v3 firstObject];

  v5 = [(DBTDuxburyFormatNode *)self children];
  v6 = [v5 lastObject];

  BOOL slanted = self->_slanted;
  v8 = [v4 LaTeXRepresentation];
  uint64_t v9 = [v6 LaTeXRepresentation];
  v10 = (void *)v9;
  if (slanted) {
    CFStringRef v11 = @"^{%@}/_{%@}";
  }
  else {
    CFStringRef v11 = @"\\frac{%@}{%@}";
  }
  v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v8, v9);

  return v12;
}

- (BOOL)foundInnerCode:(id)a3
{
  self->_BOOL slanted = [a3 isEqualToString:@"fls"];
  v4 = [(DBTDuxburyFormatNode *)self children];
  v5 = [v4 firstObject];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();

  if (v6 != v7)
  {
    v8 = objc_alloc_init(DBTDuxburyFormatFNumeratorNode);
    uint64_t v9 = [(DBTDuxburyFormatNode *)self children];
    [(DBTDuxburyFormatNode *)v8 addChildren:v9];

    [(DBTDuxburyFormatNode *)self removeAllChildren];
    [(DBTDuxburyFormatNode *)self addChild:v8];
  }
  return 1;
}

- (void)foundEndCode:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)DBTDuxburyFormatFNode;
  id v4 = a3;
  [(DBTDuxburyFormatNode *)&v13 foundEndCode:v4];
  v5 = objc_msgSend((id)objc_opt_class(), "endCode", v13.receiver, v13.super_class);
  unsigned int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    uint64_t v7 = [(DBTDuxburyFormatNode *)self children];
    v8 = [v7 firstObject];

    uint64_t v9 = objc_alloc_init(DBTDuxburyFormatFDenominatorNode);
    v10 = [(DBTDuxburyFormatNode *)self children];
    CFStringRef v11 = [(DBTDuxburyFormatNode *)self children];
    v12 = objc_msgSend(v10, "subarrayWithRange:", 1, (char *)objc_msgSend(v11, "count") - 1);

    [(DBTDuxburyFormatNode *)v9 addChildren:v12];
    [(DBTDuxburyFormatNode *)self removeAllChildren];
    [(DBTDuxburyFormatNode *)self addChild:v8];
    [(DBTDuxburyFormatNode *)self addChild:v9];
  }
}

- (BOOL)isSlanted
{
  return self->_slanted;
}

@end