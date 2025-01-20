@interface PREditingFontPickerItem
- (BOOL)isSystemItem;
- (PREditingFontPickerItem)initWithFontConfiguration:(id)a3 systemItem:(BOOL)a4;
- (PRTimeFontConfiguration)fontConfiguration;
- (void)setFontConfiguration:(id)a3;
- (void)setSystemItem:(BOOL)a3;
@end

@implementation PREditingFontPickerItem

- (PREditingFontPickerItem)initWithFontConfiguration:(id)a3 systemItem:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PREditingFontPickerItem;
  v8 = [(PREditingFontPickerItem *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_fontConfiguration, a3);
    v9->_systemItem = a4;
  }

  return v9;
}

- (PRTimeFontConfiguration)fontConfiguration
{
  return self->_fontConfiguration;
}

- (void)setFontConfiguration:(id)a3
{
}

- (BOOL)isSystemItem
{
  return self->_systemItem;
}

- (void)setSystemItem:(BOOL)a3
{
  self->_systemItem = a3;
}

- (void).cxx_destruct
{
}

@end