@interface OCXCommon
+ (void)initialize;
@end

@implementation OCXCommon

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = [[CXNamespace alloc] initWithUri:"http://schemas.openxmlformats.org/markup-compatibility/2006"];
    v3 = (void *)OCXMarkupCompatibilityNamespace;
    OCXMarkupCompatibilityNamespace = (uint64_t)v2;

    v4 = [[CXNamespace alloc] initWithUri:"http://schemas.openxmlformats.org/drawingml/2006/main"];
    v5 = (void *)OCXDrawingNamespace;
    OCXDrawingNamespace = (uint64_t)v4;
  }
}

@end