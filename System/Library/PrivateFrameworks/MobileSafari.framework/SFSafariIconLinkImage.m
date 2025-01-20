@interface SFSafariIconLinkImage
@end

@implementation SFSafariIconLinkImage

void ___SFSafariIconLinkImage_block_invoke()
{
  v13.width = 66.0;
  v13.height = 66.0;
  UIGraphicsBeginImageContextWithOptions(v13, 0, 0.0);
  objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, 66.0, 66.0, 3.0);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  v0 = [MEMORY[0x1E4FB1618] colorWithRed:0.874509804 green:0.874509804 blue:0.874509804 alpha:1.0];
  [v0 setFill];

  [v11 fill];
  v1 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB2988] scale:2];
  v2 = [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:*MEMORY[0x1E4FB27D0]];
  v3 = [v1 configurationWithTraitCollection:v2];

  v4 = [MEMORY[0x1E4FB1818] systemImageNamed:@"safari" withConfiguration:v3];
  v5 = [MEMORY[0x1E4FB1618] colorWithRed:0.152941176 green:0.450980392 blue:0.858823529 alpha:1.0];
  v6 = [v4 imageWithTintColor:v5];

  [v6 size];
  objc_msgSend(v6, "drawAtPoint:", (66.0 - v7) * 0.5, (66.0 - v8) * 0.5);
  uint64_t v9 = UIGraphicsGetImageFromCurrentImageContext();
  v10 = (void *)_SFSafariIconLinkImage::image;
  _SFSafariIconLinkImage::image = v9;

  UIGraphicsEndImageContext();
}

@end