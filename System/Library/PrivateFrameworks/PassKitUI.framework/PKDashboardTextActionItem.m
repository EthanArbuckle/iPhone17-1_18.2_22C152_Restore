@interface PKDashboardTextActionItem
+ (id)colorForSemanticColor:(int64_t)a3 hasTintColor:(BOOL *)a4;
+ (id)identifier;
+ (id)imageForPassFieldImage:(id)a3 hasTintColor:(BOOL)a4;
- (NSString)subtitle;
- (NSString)title;
- (UIColor)accessoryColor;
- (UIColor)subtitleColor;
- (UIColor)titleColor;
- (UIImage)accessoryImage;
- (UIImage)icon;
- (UIImage)subtitleImage;
- (UIImage)titleImage;
- (id)action;
- (int64_t)actionStyle;
- (int64_t)layoutStyle;
- (void)setAccessoryColor:(id)a3;
- (void)setAccessoryImage:(id)a3;
- (void)setAction:(id)a3;
- (void)setActionStyle:(int64_t)a3;
- (void)setIcon:(id)a3;
- (void)setLayoutStyle:(int64_t)a3;
- (void)setSubtitle:(id)a3;
- (void)setSubtitleColor:(id)a3;
- (void)setSubtitleImage:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleColor:(id)a3;
- (void)setTitleImage:(id)a3;
@end

@implementation PKDashboardTextActionItem

+ (id)identifier
{
  return @"textAction";
}

+ (id)colorForSemanticColor:(int64_t)a3 hasTintColor:(BOOL *)a4
{
  switch(a3)
  {
    case 1:
      v5 = [MEMORY[0x1E4FB1618] labelColor];
      goto LABEL_25;
    case 2:
      v5 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      goto LABEL_25;
    case 3:
      v5 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
      goto LABEL_25;
    case 4:
      v5 = [MEMORY[0x1E4FB1618] quaternaryLabelColor];
      goto LABEL_25;
    case 5:
      v5 = [MEMORY[0x1E4FB1618] linkColor];
      goto LABEL_25;
    case 6:
      v5 = [MEMORY[0x1E4FB1618] placeholderTextColor];
      goto LABEL_25;
    case 7:
      v5 = [MEMORY[0x1E4FB1618] systemFillColor];
      goto LABEL_25;
    case 8:
      v5 = [MEMORY[0x1E4FB1618] secondarySystemFillColor];
      goto LABEL_25;
    case 9:
      v5 = [MEMORY[0x1E4FB1618] tertiarySystemFillColor];
      goto LABEL_25;
    case 10:
      v5 = [MEMORY[0x1E4FB1618] quaternarySystemFillColor];
      goto LABEL_25;
    case 11:
      v5 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
      goto LABEL_25;
    case 12:
      v5 = [MEMORY[0x1E4FB1618] secondarySystemGroupedBackgroundColor];
      goto LABEL_25;
    case 13:
      v5 = [MEMORY[0x1E4FB1618] tertiarySystemGroupedBackgroundColor];
      goto LABEL_25;
    case 14:
      v5 = [MEMORY[0x1E4FB1618] systemBlueColor];
      goto LABEL_25;
    case 15:
      v5 = [MEMORY[0x1E4FB1618] systemGreenColor];
      goto LABEL_25;
    case 16:
      v5 = [MEMORY[0x1E4FB1618] systemIndigoColor];
      goto LABEL_25;
    case 17:
      v5 = [MEMORY[0x1E4FB1618] systemOrangeColor];
      goto LABEL_25;
    case 18:
      v5 = [MEMORY[0x1E4FB1618] systemPinkColor];
      goto LABEL_25;
    case 19:
      v5 = [MEMORY[0x1E4FB1618] systemPurpleColor];
      goto LABEL_25;
    case 20:
      v5 = [MEMORY[0x1E4FB1618] systemRedColor];
      goto LABEL_25;
    case 21:
      v5 = [MEMORY[0x1E4FB1618] systemTealColor];
      goto LABEL_25;
    case 22:
      v5 = [MEMORY[0x1E4FB1618] systemYellowColor];
      goto LABEL_25;
    case 23:
      v5 = [MEMORY[0x1E4FB1618] systemGrayColor];
LABEL_25:
      BOOL v6 = 0;
      break;
    case 24:
      v5 = 0;
      BOOL v6 = 1;
      break;
    default:
      BOOL v6 = 0;
      v5 = 0;
      break;
  }
  if (v5) {
    BOOL v6 = 1;
  }
  *a4 = v6;

  return v5;
}

+ (id)imageForPassFieldImage:(id)a3 hasTintColor:(BOOL)a4
{
  id v5 = a3;
  BOOL v6 = v5;
  if (!v5)
  {
    v8 = 0;
    goto LABEL_19;
  }
  v7 = [v5 symbolName];
  if (v7)
  {
    if ([v6 allowInternalSymbols]) {
      [MEMORY[0x1E4FB1818] _systemImageNamed:v7];
    }
    else {
    v10 = [MEMORY[0x1E4FB1818] systemImageNamed:v7];
    }
    if (v10) {
      goto LABEL_10;
    }
  }
  else
  {
    v9 = [v6 image];
    if (v9)
    {
      v10 = [MEMORY[0x1E4FB1818] imageWithPKImage:v9];
    }
    else
    {
      v10 = 0;
    }

    if (v10)
    {
LABEL_10:
      if (v7 || a4)
      {
        id v11 = [v10 imageWithRenderingMode:2];
      }
      else
      {
        id v11 = v10;
      }
      v8 = v11;
      goto LABEL_18;
    }
  }
  v8 = 0;
LABEL_18:

LABEL_19:

  return v8;
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (int64_t)actionStyle
{
  return self->_actionStyle;
}

- (void)setActionStyle:(int64_t)a3
{
  self->_actionStyle = a3;
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (void)setLayoutStyle:(int64_t)a3
{
  self->_layoutStyle = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (UIImage)titleImage
{
  return self->_titleImage;
}

- (void)setTitleImage:(id)a3
{
}

- (UIColor)titleColor
{
  return self->_titleColor;
}

- (void)setTitleColor:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (UIImage)subtitleImage
{
  return self->_subtitleImage;
}

- (void)setSubtitleImage:(id)a3
{
}

- (UIColor)subtitleColor
{
  return self->_subtitleColor;
}

- (void)setSubtitleColor:(id)a3
{
}

- (UIImage)accessoryImage
{
  return self->_accessoryImage;
}

- (void)setAccessoryImage:(id)a3
{
}

- (UIColor)accessoryColor
{
  return self->_accessoryColor;
}

- (void)setAccessoryColor:(id)a3
{
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_accessoryColor, 0);
  objc_storeStrong((id *)&self->_accessoryImage, 0);
  objc_storeStrong((id *)&self->_subtitleColor, 0);
  objc_storeStrong((id *)&self->_subtitleImage, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong((id *)&self->_titleImage, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_icon, 0);
}

@end