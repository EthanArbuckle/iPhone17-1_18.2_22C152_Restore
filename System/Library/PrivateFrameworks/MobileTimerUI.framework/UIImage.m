@interface UIImage
@end

@implementation UIImage

uint64_t __39__UIImage_MTUIStyling__mtui_sleepImage__block_invoke(uint64_t a1)
{
  uint64_t v1 = objc_msgSend(*(id *)(a1 + 32), "mtui_imageWithSymbolName:pointSize:", @"zzz", 13.0);
  uint64_t v2 = mtui_sleepImage_SleepImage;
  mtui_sleepImage_SleepImage = v1;

  return MEMORY[0x270F9A758](v1, v2);
}

uint64_t __38__UIImage_MTUIStyling__mtui_wakeImage__block_invoke(uint64_t a1)
{
  uint64_t v1 = objc_msgSend(*(id *)(a1 + 32), "mtui_imageWithSymbolName:pointSize:", @"bell.fill", 13.0);
  uint64_t v2 = mtui_wakeImage_WakeImage;
  mtui_wakeImage_WakeImage = v1;

  return MEMORY[0x270F9A758](v1, v2);
}

void __46__UIImage_MTUIStyling__mtui_deleteButtonImage__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "mtui_imageWithSymbolName:pointSize:", @"minus.circle.fill", 20.0);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v3 imageWithRenderingMode:1];
  uint64_t v2 = (void *)mtui_deleteButtonImage_DeleteButtonImage;
  mtui_deleteButtonImage_DeleteButtonImage = v1;
}

@end