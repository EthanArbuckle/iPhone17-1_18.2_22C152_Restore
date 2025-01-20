@interface LSDocumentProxy(MobileSafariFrameworkExtras)
+ (id)sf_documentProxyForName:()MobileSafariFrameworkExtras type:MIMEType:sourceURL:;
@end

@implementation LSDocumentProxy(MobileSafariFrameworkExtras)

+ (id)sf_documentProxyForName:()MobileSafariFrameworkExtras type:MIMEType:sourceURL:
{
  v9 = (void *)MEMORY[0x1E4F22430];
  v10 = (void *)MEMORY[0x1E4F74230];
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v15 = [v10 sharedConnection];
  uint64_t v16 = [v15 isURLManaged:v11];

  v17 = [v9 documentProxyForName:v14 type:v13 MIMEType:v12 sourceIsManaged:v16];

  return v17;
}

@end