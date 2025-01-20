@interface UIDocumentPickerViewController(SFManagedSourceSupport)
+ (id)sf_documentPickerViewControllerWithURL:()SFManagedSourceSupport inMode:sourceURL:;
@end

@implementation UIDocumentPickerViewController(SFManagedSourceSupport)

+ (id)sf_documentPickerViewControllerWithURL:()SFManagedSourceSupport inMode:sourceURL:
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  id v9 = objc_alloc(MEMORY[0x1E4FB16F0]);
  v15[0] = v7;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  v11 = (void *)[v9 initWithURLs:v10 inMode:a4];

  if (v11)
  {
    v12 = [MEMORY[0x1E4F74230] sharedConnection];
    objc_msgSend(v11, "_setIsContentManaged:", objc_msgSend(v12, "isURLManaged:", v8));

    id v13 = v11;
  }

  return v11;
}

@end