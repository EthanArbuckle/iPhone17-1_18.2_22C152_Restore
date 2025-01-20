@interface EXCommon
+ (void)initialize;
@end

@implementation EXCommon

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = [[CXNamespace alloc] initWithUri:"urn:schemas-microsoft-com:office:excel"];
    v3 = (void *)EXVmlNamespace;
    EXVmlNamespace = (uint64_t)v2;

    v4 = [[CXNamespace alloc] initWithUri:"http://schemas.microsoft.com/office/excel/2006/main"];
    v5 = (void *)EXMainNamespace;
    EXMainNamespace = (uint64_t)v4;

    v6 = [[CXNamespace alloc] initWithUri:"http://schemas.microsoft.com/office/spreadsheetml/2009/9/main"];
    v7 = (void *)EXXL2010Namespace;
    EXXL2010Namespace = (uint64_t)v6;
  }
}

@end