@interface DBTDuxburyFormatBOLIMNode
+ (id)beginCode;
- (id)LaTeXRepresentation;
@end

@implementation DBTDuxburyFormatBOLIMNode

+ (id)beginCode
{
  return @"bolim";
}

- (id)LaTeXRepresentation
{
  return +[NSString stringWithFormat:@"\\lim\\limits^"];
}

@end