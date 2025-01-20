@interface UIImage(MTUIStyling)
+ (id)mtui_deleteButtonImage;
+ (id)mtui_imageWithSymbolName:()MTUIStyling font:andTintColor:;
+ (id)mtui_imageWithSymbolName:()MTUIStyling pointSize:;
+ (id)mtui_imageWithSymbolName:()MTUIStyling pointSize:color:;
+ (id)mtui_imageWithSymbolName:()MTUIStyling scale:textStyle:andTintColor:;
+ (id)mtui_imageWithSymbolName:()MTUIStyling style:;
+ (id)mtui_sleepImage;
+ (id)mtui_wakeImage;
- (uint64_t)mtui_imageWithTintColor:()MTUIStyling;
@end

@implementation UIImage(MTUIStyling)

+ (id)mtui_imageWithSymbolName:()MTUIStyling scale:textStyle:andTintColor:
{
  v9 = (void *)MEMORY[0x263F1C6B0];
  id v10 = a6;
  id v11 = a5;
  v12 = [v9 systemImageNamed:a3];
  v13 = [MEMORY[0x263F1C6C8] configurationWithTextStyle:v11 scale:a4];

  v14 = [v12 imageWithSymbolConfiguration:v13];
  v15 = objc_msgSend(v14, "mtui_imageWithTintColor:", v10);

  return v15;
}

- (uint64_t)mtui_imageWithTintColor:()MTUIStyling
{
  return [a1 imageWithTintColor:a3 renderingMode:1];
}

+ (id)mtui_imageWithSymbolName:()MTUIStyling pointSize:
{
  v5 = (void *)MEMORY[0x263F1C658];
  double v6 = *MEMORY[0x263F1D338];
  id v7 = a4;
  v8 = [v5 systemFontOfSize:@"NSCTFontUIFontDesignCompactRounded" weight:a1 design:v6];
  v9 = [MEMORY[0x263F1C6B0] systemImageNamed:v7];

  id v10 = [MEMORY[0x263F1C6C8] configurationWithFont:v8];
  id v11 = [v9 imageWithSymbolConfiguration:v10];

  return v11;
}

+ (id)mtui_imageWithSymbolName:()MTUIStyling font:andTintColor:
{
  id v7 = (void *)MEMORY[0x263F1C6B0];
  id v8 = a5;
  id v9 = a4;
  id v10 = [v7 systemImageNamed:a3];
  id v11 = [MEMORY[0x263F1C6C8] configurationWithFont:v9];

  v12 = [v10 imageWithSymbolConfiguration:v11];
  v13 = objc_msgSend(v12, "mtui_imageWithTintColor:", v8);

  return v13;
}

+ (id)mtui_sleepImage
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__UIImage_MTUIStyling__mtui_sleepImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (mtui_sleepImage_onceToken != -1) {
    dispatch_once(&mtui_sleepImage_onceToken, block);
  }
  v1 = (void *)mtui_sleepImage_SleepImage;

  return v1;
}

+ (id)mtui_wakeImage
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__UIImage_MTUIStyling__mtui_wakeImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (mtui_wakeImage_onceToken != -1) {
    dispatch_once(&mtui_wakeImage_onceToken, block);
  }
  v1 = (void *)mtui_wakeImage_WakeImage;

  return v1;
}

+ (id)mtui_deleteButtonImage
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__UIImage_MTUIStyling__mtui_deleteButtonImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (mtui_deleteButtonImage_onceToken != -1) {
    dispatch_once(&mtui_deleteButtonImage_onceToken, block);
  }
  v1 = (void *)mtui_deleteButtonImage_DeleteButtonImage;

  return v1;
}

+ (id)mtui_imageWithSymbolName:()MTUIStyling style:
{
  v5 = (void *)MEMORY[0x263F1C6B0];
  id v6 = a4;
  id v7 = [v5 systemImageNamed:a3];
  id v8 = [MEMORY[0x263F1C6C8] configurationWithTextStyle:v6];

  id v9 = [v7 imageWithSymbolConfiguration:v8];

  return v9;
}

+ (id)mtui_imageWithSymbolName:()MTUIStyling pointSize:color:
{
  id v7 = (void *)MEMORY[0x263F1C6B0];
  id v8 = a5;
  id v9 = objc_msgSend(v7, "mtui_imageWithSymbolName:pointSize:", a4, a1);
  id v10 = objc_msgSend(v9, "mtui_imageWithTintColor:", v8);

  return v10;
}

@end