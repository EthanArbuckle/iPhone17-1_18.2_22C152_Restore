@interface DBTDuxburyFormatBNode
+ (id)beginCode;
+ (id)endCode;
- (id)LaTeXRepresentation;
@end

@implementation DBTDuxburyFormatBNode

+ (id)beginCode
{
  return @"bs";
}

+ (id)endCode
{
  return @"be";
}

- (id)LaTeXRepresentation
{
  v5.receiver = self;
  v5.super_class = (Class)DBTDuxburyFormatBNode;
  v2 = [(DBTDuxburyFormatNode *)&v5 LaTeXRepresentation];
  v3 = +[NSString stringWithFormat:@"_{%@}", v2];

  return v3;
}

@end