@interface UIImage(TVRemoteUI)
+ (id)tvrui_symbolImageWithName:()TVRemoteUI font:fontSize:weight:scale:maxPointSize:;
+ (id)tvrui_symbolImageWithName:()TVRemoteUI font:scale:;
+ (id)tvrui_symbolImageWithName:()TVRemoteUI fontSize:weight:scale:;
+ (id)tvrui_symbolImageWithName:()TVRemoteUI textStyle:weight:scale:maxPointSize:;
@end

@implementation UIImage(TVRemoteUI)

+ (id)tvrui_symbolImageWithName:()TVRemoteUI textStyle:weight:scale:maxPointSize:
{
  v10 = (void *)MEMORY[0x263F81708];
  id v11 = a3;
  v12 = [v10 preferredFontForTextStyle:a4];
  [v12 pointSize];
  v13 = objc_msgSend(a1, "tvrui_symbolImageWithName:font:fontSize:weight:scale:maxPointSize:", v11, v12, a5, a6);

  return v13;
}

+ (id)tvrui_symbolImageWithName:()TVRemoteUI fontSize:weight:scale:
{
  v9 = (void *)MEMORY[0x263F82818];
  id v10 = a4;
  id v11 = [v9 configurationWithPointSize:a5 weight:a6 scale:a1];
  v12 = [MEMORY[0x263F827E8] systemImageNamed:v10 withConfiguration:v11];

  return v12;
}

+ (id)tvrui_symbolImageWithName:()TVRemoteUI font:fontSize:weight:scale:maxPointSize:
{
  id v10 = (void *)MEMORY[0x263F82818];
  if (a1 >= a2) {
    double v11 = a2;
  }
  else {
    double v11 = a1;
  }
  id v12 = a5;
  v13 = [v10 configurationWithPointSize:a7 weight:a8 scale:v11];
  v14 = [MEMORY[0x263F827E8] systemImageNamed:v12 withConfiguration:v13];

  return v14;
}

+ (id)tvrui_symbolImageWithName:()TVRemoteUI font:scale:
{
  v7 = (void *)MEMORY[0x263F82818];
  id v8 = a3;
  v9 = [v7 configurationWithFont:a4 scale:a5];
  id v10 = [MEMORY[0x263F827E8] systemImageNamed:v8 withConfiguration:v9];

  return v10;
}

@end