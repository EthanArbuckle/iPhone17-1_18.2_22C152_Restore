@interface DBTDuxburyFormatPNode
+ (id)beginCode;
+ (id)endCode;
- (id)LaTeXRepresentation;
@end

@implementation DBTDuxburyFormatPNode

+ (id)beginCode
{
  return @"ps";
}

+ (id)endCode
{
  return @"pe";
}

- (id)LaTeXRepresentation
{
  v5.receiver = self;
  v5.super_class = (Class)DBTDuxburyFormatPNode;
  v2 = [(DBTDuxburyFormatNode *)&v5 LaTeXRepresentation];
  v3 = +[NSString stringWithFormat:@"^{%@}", v2];

  return v3;
}

@end