@interface PTRow(PhotosUICoreProtoSoftLinking)
+ (id)px_rowWithTitle:()PhotosUICoreProtoSoftLinking protoViewControllerFactoryClassName:options:;
+ (uint64_t)px_rowWithTitle:()PhotosUICoreProtoSoftLinking protoViewControllerFactoryClassName:;
@end

@implementation PTRow(PhotosUICoreProtoSoftLinking)

+ (id)px_rowWithTitle:()PhotosUICoreProtoSoftLinking protoViewControllerFactoryClassName:options:
{
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)MEMORY[0x1E4F39228];
  id v11 = a3;
  v12 = objc_msgSend(v10, "px_deprecated_appPhotoLibrary");
  v13 = [a1 row];
  [v13 setStaticTitle:v11];

  v14 = (void *)MEMORY[0x1E4F94190];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __99__PTRow_PhotosUICoreProtoSoftLinking__px_rowWithTitle_protoViewControllerFactoryClassName_options___block_invoke;
  v20[3] = &unk_1E5DBD6C8;
  id v21 = v8;
  id v22 = v12;
  id v23 = v9;
  id v15 = v9;
  id v16 = v12;
  id v17 = v8;
  v18 = [v14 actionWithHandler:v20];
  [v13 setAction:v18];

  return v13;
}

+ (uint64_t)px_rowWithTitle:()PhotosUICoreProtoSoftLinking protoViewControllerFactoryClassName:
{
  return objc_msgSend(a1, "px_rowWithTitle:protoViewControllerFactoryClassName:options:", a3, a4, 0);
}

@end