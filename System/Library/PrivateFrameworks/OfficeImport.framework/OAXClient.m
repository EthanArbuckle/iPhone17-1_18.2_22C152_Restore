@interface OAXClient
+ (BOOL)sourceDrawableIsTopLevel:(_xmlNode *)a3;
- (_xmlNode)genericNonVisualPropertiesNodeForDrawableNode:(_xmlNode *)a3 inNamespace:(id)a4 state:(id)a5;
- (id)readClientDrawableFromXmlNode:(_xmlNode *)a3 state:(id)a4;
- (id)readClientTextField:(_xmlNode *)a3 identity:(id)a4 paragraph:(id)a5 state:(id)a6;
- (id)readGraphicData:(_xmlNode *)a3 state:(id)a4;
- (id)readOle:(_xmlNode *)a3 state:(id)a4;
@end

@implementation OAXClient

- (id)readClientDrawableFromXmlNode:(_xmlNode *)a3 state:(id)a4
{
  return 0;
}

- (_xmlNode)genericNonVisualPropertiesNodeForDrawableNode:(_xmlNode *)a3 inNamespace:(id)a4 state:(id)a5
{
  return 0;
}

- (id)readClientTextField:(_xmlNode *)a3 identity:(id)a4 paragraph:(id)a5 state:(id)a6
{
  return 0;
}

- (id)readOle:(_xmlNode *)a3 state:(id)a4
{
  return 0;
}

- (id)readGraphicData:(_xmlNode *)a3 state:(id)a4
{
  return 0;
}

+ (BOOL)sourceDrawableIsTopLevel:(_xmlNode *)a3
{
  return xmlStrEqual(a3->parent->name, (const xmlChar *)"grpSp") == 0;
}

@end