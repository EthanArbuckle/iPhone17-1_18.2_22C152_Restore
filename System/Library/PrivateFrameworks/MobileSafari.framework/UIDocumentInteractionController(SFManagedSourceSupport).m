@interface UIDocumentInteractionController(SFManagedSourceSupport)
+ (id)sf_interactionControllerWithDocumentURL:()SFManagedSourceSupport sourceURL:;
@end

@implementation UIDocumentInteractionController(SFManagedSourceSupport)

+ (id)sf_interactionControllerWithDocumentURL:()SFManagedSourceSupport sourceURL:
{
  id v5 = a4;
  v6 = [MEMORY[0x1E4F42980] interactionControllerWithURL:a3];
  if (v6)
  {
    v7 = [MEMORY[0x1E4F74230] sharedConnection];
    objc_msgSend(v6, "setSourceIsManaged:", objc_msgSend(v7, "isURLManaged:", v5));

    id v8 = v6;
  }

  return v6;
}

@end