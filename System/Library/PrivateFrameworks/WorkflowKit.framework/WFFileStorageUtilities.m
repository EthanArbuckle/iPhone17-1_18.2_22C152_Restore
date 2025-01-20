@interface WFFileStorageUtilities
+ (id)containerIdentifier;
+ (id)documentsDirectoryWithError:(id *)a3;
+ (void)createDocumentsDirectoryIfNecessary;
@end

@implementation WFFileStorageUtilities

void __61__WFFileStorageUtilities_createDocumentsDirectoryIfNecessary__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F28CB8];
  id v3 = a2;
  id v5 = [v2 defaultManager];
  v4 = [v3 path];

  [v5 createFileAtPath:v4 contents:0 attributes:0];
}

+ (id)documentsDirectoryWithError:(id *)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  v6 = [a1 containerIdentifier];
  v7 = [v5 URLForUbiquityContainerIdentifier:v6];
  v8 = [v7 URLByAppendingPathComponent:@"Documents" isDirectory:1];

  if (v8)
  {
    v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    v10 = [v8 path];
    char v11 = [v9 fileExistsAtPath:v10];

    if ((v11 & 1) != 0
      || ([MEMORY[0x1E4F28CB8] defaultManager],
          v12 = objc_claimAutoreleasedReturnValue(),
          int v13 = [v12 createDirectoryAtURL:v8 withIntermediateDirectories:1 attributes:0 error:a3], v12, a3 = 0, v13))
    {
      a3 = v8;
    }
  }
  else if (a3)
  {
    v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F281F8];
    uint64_t v19 = *MEMORY[0x1E4F28568];
    v16 = WFLocalizedString(@"The iCloud Container could not be found.");
    v20[0] = v16;
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    *a3 = [v14 errorWithDomain:v15 code:4 userInfo:v17];

    a3 = 0;
  }

  return a3;
}

+ (id)containerIdentifier
{
  return (id)*MEMORY[0x1E4F5AC18];
}

uint64_t __61__WFFileStorageUtilities_createDocumentsDirectoryIfNecessary__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = [a2 checkPromisedItemIsReachableAndReturnError:0];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __61__WFFileStorageUtilities_createDocumentsDirectoryIfNecessary__block_invoke()
{
  v0 = +[WFFileStorageUtilities documentsDirectoryWithError:0];
  v1 = [v0 URLByAppendingPathComponent:@".WorkflowHiddenFile" isDirectory:0];
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  v2 = objc_opt_new();
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __61__WFFileStorageUtilities_createDocumentsDirectoryIfNecessary__block_invoke_2;
  v3[3] = &unk_1E6551F10;
  v3[4] = &v4;
  [v2 coordinateReadingItemAtURL:v1 options:4 error:0 byAccessor:v3];
  if (!*((unsigned char *)v5 + 24)) {
    [v2 coordinateWritingItemAtURL:v1 options:0 error:0 byAccessor:&__block_literal_global_177_35320];
  }

  _Block_object_dispose(&v4, 8);
}

+ (void)createDocumentsDirectoryIfNecessary
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v2, QOS_CLASS_BACKGROUND, 0);

  id v3 = dispatch_queue_create("com.apple.shortcuts.WFFileStorageUtilities", attr);
  dispatch_async(v3, &__block_literal_global_35316);
}

@end