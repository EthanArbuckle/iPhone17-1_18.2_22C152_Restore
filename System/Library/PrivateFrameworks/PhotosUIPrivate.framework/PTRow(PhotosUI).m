@interface PTRow(PhotosUI)
+ (id)pu_rowWithTitle:()PhotosUI action:;
+ (id)pu_rowWithTitle:()PhotosUI asynchronousOutputProducer:;
+ (id)pu_rowWithTitle:()PhotosUI output:;
+ (id)pu_rowWithTitle:()PhotosUI settings:;
+ (id)pu_rowWithTitle:()PhotosUI settings:condition:;
+ (id)pu_rowWithTitle:()PhotosUI settingsProvider:isTransient:;
+ (uint64_t)pu_rowWithTitle:()PhotosUI settingsProvider:;
@end

@implementation PTRow(PhotosUI)

+ (id)pu_rowWithTitle:()PhotosUI settings:condition:
{
  id v8 = a5;
  v9 = objc_msgSend(a1, "pu_rowWithTitle:settings:", a3, a4);
  [v9 setCondition:v8];

  return v9;
}

+ (id)pu_rowWithTitle:()PhotosUI settingsProvider:isTransient:
{
  id v8 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__PTRow_PhotosUI__pu_rowWithTitle_settingsProvider_isTransient___block_invoke;
  v12[3] = &unk_1E5F2E778;
  id v13 = v8;
  char v14 = a5;
  id v9 = v8;
  v10 = objc_msgSend(a1, "px_rowWithTitle:action:", a3, v12);

  return v10;
}

+ (uint64_t)pu_rowWithTitle:()PhotosUI settingsProvider:
{
  return objc_msgSend(a1, "pu_rowWithTitle:settingsProvider:isTransient:", a3, a4, 0);
}

+ (id)pu_rowWithTitle:()PhotosUI settings:
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44__PTRow_PhotosUI__pu_rowWithTitle_settings___block_invoke;
  v10[3] = &unk_1E5F2E750;
  id v11 = v6;
  id v7 = v6;
  id v8 = objc_msgSend(a1, "pu_rowWithTitle:settingsProvider:", a3, v10);

  return v8;
}

+ (id)pu_rowWithTitle:()PhotosUI action:
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 row];
  [v8 setStaticTitle:v7];

  id v9 = (void *)MEMORY[0x1E4F94190];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __42__PTRow_PhotosUI__pu_rowWithTitle_action___block_invoke;
  v13[3] = &unk_1E5F2E728;
  id v14 = v6;
  id v10 = v6;
  id v11 = [v9 actionWithHandler:v13];
  [v8 setAction:v11];

  return v8;
}

+ (id)pu_rowWithTitle:()PhotosUI asynchronousOutputProducer:
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__PTRow_PhotosUI__pu_rowWithTitle_asynchronousOutputProducer___block_invoke;
  v10[3] = &unk_1E5F2E700;
  id v11 = v6;
  id v7 = v6;
  id v8 = objc_msgSend(a1, "px_rowWithTitle:action:", a3, v10);

  return v8;
}

+ (id)pu_rowWithTitle:()PhotosUI output:
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42__PTRow_PhotosUI__pu_rowWithTitle_output___block_invoke;
  v10[3] = &unk_1E5F2E6D8;
  id v11 = v6;
  id v7 = v6;
  id v8 = objc_msgSend(a1, "pu_rowWithTitle:asynchronousOutputProducer:", a3, v10);

  return v8;
}

@end