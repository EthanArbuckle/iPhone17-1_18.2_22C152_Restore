@interface OAVReadClient
+ (BOOL)sourceDrawableIsTopLevel:(_xmlNode *)a3;
@end

@implementation OAVReadClient

+ (BOOL)sourceDrawableIsTopLevel:(_xmlNode *)a3
{
  return xmlStrEqual(a3->parent->name, (const xmlChar *)"group") == 0;
}

@end