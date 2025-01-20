@interface SBSApplicationShortcutSystemIcon(ShortcutUIKit)
- (__CFString)_scui_iconImageName;
- (id)_scui_iconImageWithAssetProvider:()ShortcutUIKit;
@end

@implementation SBSApplicationShortcutSystemIcon(ShortcutUIKit)

- (id)_scui_iconImageWithAssetProvider:()ShortcutUIKit
{
  v2 = [a1 systemImageName];
  if (!v2) {
    goto LABEL_3;
  }
  v3 = (void *)MEMORY[0x263F1C6C8];
  v4 = [MEMORY[0x263F1C658] defaultFontForTextStyle:*MEMORY[0x263F1D260]];
  [v4 pointSize];
  v5 = objc_msgSend(v3, "configurationWithPointSize:weight:scale:", 4, 3);

  v6 = [MEMORY[0x263F1C6B0] systemImageNamed:v2 withConfiguration:v5];

  if (!v6)
  {
LABEL_3:
    v7 = objc_msgSend(a1, "_scui_iconImageName");
    if (v7)
    {
      v8 = (void *)MEMORY[0x263F1C6B0];
      v9 = ShortcutUIKitBundle();
      v10 = [v8 imageNamed:v7 inBundle:v9 compatibleWithTraitCollection:0];

      v6 = [v10 imageWithRenderingMode:2];
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (__CFString)_scui_iconImageName
{
  unint64_t v1 = [a1 type];
  if (v1 > 0x1C) {
    return @"UnreadDot";
  }
  else {
    return off_264589130[v1];
  }
}

@end