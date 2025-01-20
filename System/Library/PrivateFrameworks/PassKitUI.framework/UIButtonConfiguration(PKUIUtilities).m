@interface UIButtonConfiguration(PKUIUtilities)
+ (id)pkui_plainConfigurationWithImage:()PKUIUtilities foregroundColor:;
+ (id)pkui_plainConfigurationWithImage:()PKUIUtilities imageConfiguration:foregroundColor:;
+ (id)pkui_plainConfigurationWithTitle:()PKUIUtilities font:;
+ (id)pkui_plainConfigurationWithTitle:()PKUIUtilities font:lineBreakMode:textAlignment:;
+ (void)pkui_createPlainButtonConfiguration;
+ (void)pkui_createPlainMinimalButtonConfiguration;
@end

@implementation UIButtonConfiguration(PKUIUtilities)

+ (void)pkui_createPlainButtonConfiguration
{
  v0 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
  v1 = [v0 background];
  [v1 setCornerRadius:0.0];

  return v0;
}

+ (void)pkui_createPlainMinimalButtonConfiguration
{
  v0 = objc_msgSend(MEMORY[0x1E4FB14D8], "pkui_createPlainButtonConfiguration");
  objc_msgSend(v0, "setContentInsets:", *MEMORY[0x1E4FB12A8], *(double *)(MEMORY[0x1E4FB12A8] + 8), *(double *)(MEMORY[0x1E4FB12A8] + 16), *(double *)(MEMORY[0x1E4FB12A8] + 24));
  return v0;
}

+ (id)pkui_plainConfigurationWithTitle:()PKUIUtilities font:
{
  v5 = (void *)MEMORY[0x1E4FB14D8];
  id v6 = a4;
  id v7 = a3;
  v8 = objc_msgSend(v5, "pkui_createPlainButtonConfiguration");
  v9 = objc_msgSend(MEMORY[0x1E4F28B18], "pkui_attriutedStringWithString:font:paragraphStyle:", v7, v6, 0);

  [v8 setAttributedTitle:v9];

  return v8;
}

+ (id)pkui_plainConfigurationWithTitle:()PKUIUtilities font:lineBreakMode:textAlignment:
{
  v9 = (void *)MEMORY[0x1E4FB14D8];
  id v10 = a4;
  id v11 = a3;
  v12 = objc_msgSend(v9, "pkui_createPlainButtonConfiguration");
  v13 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
  v14 = (void *)[v13 mutableCopy];

  [v14 setLineBreakMode:a5];
  [v14 setAlignment:a6];
  v15 = objc_msgSend(MEMORY[0x1E4F28B18], "pkui_attriutedStringWithString:font:paragraphStyle:", v11, v10, v14);

  [v12 setAttributedTitle:v15];

  return v12;
}

+ (id)pkui_plainConfigurationWithImage:()PKUIUtilities foregroundColor:
{
  v5 = (void *)MEMORY[0x1E4FB14D8];
  id v6 = a4;
  id v7 = a3;
  v8 = objc_msgSend(v5, "pkui_createPlainMinimalButtonConfiguration");
  [v8 setImage:v7];

  [v8 setBaseForegroundColor:v6];

  return v8;
}

+ (id)pkui_plainConfigurationWithImage:()PKUIUtilities imageConfiguration:foregroundColor:
{
  id v7 = (void *)MEMORY[0x1E4FB14D8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_msgSend(v7, "pkui_createPlainMinimalButtonConfiguration");
  [v11 setImage:v10];

  [v11 setPreferredSymbolConfigurationForImage:v9];
  [v11 setBaseForegroundColor:v8];

  return v11;
}

@end