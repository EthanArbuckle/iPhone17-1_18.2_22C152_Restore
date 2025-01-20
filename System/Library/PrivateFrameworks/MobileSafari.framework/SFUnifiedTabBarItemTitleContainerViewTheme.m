@interface SFUnifiedTabBarItemTitleContainerViewTheme
- (SFUnifiedTabBarItemTitleContainerViewTheme)init;
- (SFUnifiedTabBarItemTitleContainerViewTheme)initWithPrimaryTextColor:(id)a3 secondaryTextColor:(id)a4 placeholderTextColor:(id)a5;
- (SFUnifiedTabBarItemTitleContainerViewTheme)initWithPrimaryTextColor:(id)a3 secondaryTextColor:(id)a4 placeholderTextColor:(id)a5 overrideTintColor:(id)a6 themeColor:(id)a7;
- (UIColor)overrideTintColor;
- (UIColor)placeholderTextColor;
- (UIColor)primaryTextColor;
- (UIColor)secondaryTextColor;
- (UIColor)themeColor;
@end

@implementation SFUnifiedTabBarItemTitleContainerViewTheme

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_themeColor, 0);
  objc_storeStrong((id *)&self->_overrideTintColor, 0);
  objc_storeStrong((id *)&self->_placeholderTextColor, 0);
  objc_storeStrong((id *)&self->_secondaryTextColor, 0);

  objc_storeStrong((id *)&self->_primaryTextColor, 0);
}

- (UIColor)placeholderTextColor
{
  return self->_placeholderTextColor;
}

- (UIColor)secondaryTextColor
{
  return self->_secondaryTextColor;
}

- (UIColor)primaryTextColor
{
  return self->_primaryTextColor;
}

- (SFUnifiedTabBarItemTitleContainerViewTheme)initWithPrimaryTextColor:(id)a3 secondaryTextColor:(id)a4 placeholderTextColor:(id)a5 overrideTintColor:(id)a6 themeColor:(id)a7
{
  id v21 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)SFUnifiedTabBarItemTitleContainerViewTheme;
  v17 = [(SFUnifiedTabBarItemTitleContainerViewTheme *)&v22 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_primaryTextColor, a3);
    objc_storeStrong((id *)&v18->_secondaryTextColor, a4);
    objc_storeStrong((id *)&v18->_placeholderTextColor, a5);
    objc_storeStrong((id *)&v18->_overrideTintColor, a6);
    objc_storeStrong((id *)&v18->_themeColor, a7);
    v19 = v18;
  }

  return v18;
}

- (UIColor)themeColor
{
  return self->_themeColor;
}

- (UIColor)overrideTintColor
{
  return self->_overrideTintColor;
}

- (SFUnifiedTabBarItemTitleContainerViewTheme)init
{
  v3 = [MEMORY[0x1E4FB1618] labelColor];
  v4 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  v5 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  v6 = [(SFUnifiedTabBarItemTitleContainerViewTheme *)self initWithPrimaryTextColor:v3 secondaryTextColor:v4 placeholderTextColor:v5];

  return v6;
}

- (SFUnifiedTabBarItemTitleContainerViewTheme)initWithPrimaryTextColor:(id)a3 secondaryTextColor:(id)a4 placeholderTextColor:(id)a5
{
  return [(SFUnifiedTabBarItemTitleContainerViewTheme *)self initWithPrimaryTextColor:a3 secondaryTextColor:a4 placeholderTextColor:a5 overrideTintColor:0 themeColor:0];
}

@end