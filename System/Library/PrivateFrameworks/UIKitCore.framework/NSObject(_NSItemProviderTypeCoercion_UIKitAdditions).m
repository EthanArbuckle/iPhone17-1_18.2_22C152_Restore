@interface NSObject(_NSItemProviderTypeCoercion_UIKitAdditions)
- (UIImage)_NSItemProviderTypeCoercion_coercedUIImageValueFromNSDataValue:()_NSItemProviderTypeCoercion_UIKitAdditions error:;
- (void)_NSItemProviderTypeCoercion_coercedUIImageValueFromNSURLValue:()_NSItemProviderTypeCoercion_UIKitAdditions error:;
@end

@implementation NSObject(_NSItemProviderTypeCoercion_UIKitAdditions)

- (void)_NSItemProviderTypeCoercion_coercedUIImageValueFromNSURLValue:()_NSItemProviderTypeCoercion_UIKitAdditions error:
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 isFileURL])
  {
    v6 = [v5 path];
    a4 = +[UIImage imageWithContentsOfFile:v6];
  }
  else if (a4)
  {
    v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v8 = *MEMORY[0x1E4F284A0];
    uint64_t v11 = *MEMORY[0x1E4F1D170];
    v12[0] = @"Unknown error.";
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    *a4 = [v7 errorWithDomain:v8 code:-1 userInfo:v9];

    a4 = 0;
  }

  return a4;
}

- (UIImage)_NSItemProviderTypeCoercion_coercedUIImageValueFromNSDataValue:()_NSItemProviderTypeCoercion_UIKitAdditions error:
{
  return +[UIImage imageWithData:scale:](UIImage, "imageWithData:scale:", 1.0);
}

@end