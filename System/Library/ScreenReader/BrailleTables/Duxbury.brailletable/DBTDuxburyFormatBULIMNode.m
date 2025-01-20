@interface DBTDuxburyFormatBULIMNode
+ (id)beginCode;
- (id)LaTeXRepresentation;
@end

@implementation DBTDuxburyFormatBULIMNode

+ (id)beginCode
{
  return @"bulim";
}

- (id)LaTeXRepresentation
{
  return +[NSString stringWithFormat:@"\\lim\\limits_"];
}

@end