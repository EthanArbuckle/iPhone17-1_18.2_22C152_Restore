@interface OAVCommon
+ (void)initialize;
@end

@implementation OAVCommon

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = [[CXNamespace alloc] initWithUri:"urn:schemas-microsoft-com:office:office"];
    v3 = (void *)OAVOfficeDrawingNamespace;
    OAVOfficeDrawingNamespace = (uint64_t)v2;

    v4 = [[CXNamespace alloc] initWithUri:"urn:schemas-microsoft-com:vml"];
    v5 = (void *)OAVOfficeMainNamespace;
    OAVOfficeMainNamespace = (uint64_t)v4;

    v6 = [[CXNamespace alloc] initWithUri:"http://macVmlSchemaUri"];
    v7 = (void *)OAVMacVmlNamespace;
    OAVMacVmlNamespace = (uint64_t)v6;
  }
}

@end