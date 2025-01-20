@interface UIImagePickerController(Swift)
+ (uint64_t)ic_originalImageDataFromInfo:()Swift;
- (uint64_t)ic_setSavingOptionsCreateOriginalImageData;
- (uint64_t)ic_writeImageDataToSavedPhotosAlbum:()Swift;
@end

@implementation UIImagePickerController(Swift)

- (uint64_t)ic_setSavingOptionsCreateOriginalImageData
{
  return [a1 _setImagePickerSavingOptions:4];
}

- (uint64_t)ic_writeImageDataToSavedPhotosAlbum:()Swift
{
  return UIImageDataWriteToSavedPhotosAlbum();
}

+ (uint64_t)ic_originalImageDataFromInfo:()Swift
{
  return [a3 objectForKeyedSubscript:*MEMORY[0x263F83D50]];
}

@end