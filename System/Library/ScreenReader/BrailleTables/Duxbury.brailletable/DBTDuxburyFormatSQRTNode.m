@interface DBTDuxburyFormatSQRTNode
+ (id)beginCode;
+ (id)endCode;
- (id)LaTeXRepresentation;
@end

@implementation DBTDuxburyFormatSQRTNode

+ (id)beginCode
{
  return @"sqrts";
}

+ (id)endCode
{
  return @"sqrte";
}

- (id)LaTeXRepresentation
{
  v5.receiver = self;
  v5.super_class = (Class)DBTDuxburyFormatSQRTNode;
  v2 = [(DBTDuxburyFormatNode *)&v5 LaTeXRepresentation];
  v3 = +[NSString stringWithFormat:@"\\sqrt{%@}", v2];

  return v3;
}

@end