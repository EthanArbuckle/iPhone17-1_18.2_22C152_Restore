@interface MTSettingsGroup
+ (MTSettingsGroup)groupWithTitle:(id)a3 footerText:(id)a4 settings:(id)a5;
+ (MTSettingsGroup)groupWithTitle:(id)a3 footerText:(id)a4 settingsHandler:(id)a5;
+ (id)footerAttributedString:(id)a3;
+ (id)footerAttributedString:(id)a3 additionalAttributeName:(id)a4 additionalAttributeValue:(id)a5 additionalAttributeRange:(_NSRange)a6;
- (MTSettingHeaderAction)headerAction;
- (NSArray)groupSettings;
- (NSAttributedString)groupFooter;
- (NSString)groupTitle;
- (double)customHeaderHeight;
- (id)settingsHandler;
- (void)setCustomHeaderHeight:(double)a3;
- (void)setGroupFooter:(id)a3;
- (void)setGroupSettings:(id)a3;
- (void)setGroupTitle:(id)a3;
- (void)setHeaderAction:(id)a3;
- (void)setSettingsHandler:(id)a3;
@end

@implementation MTSettingsGroup

+ (MTSettingsGroup)groupWithTitle:(id)a3 footerText:(id)a4 settings:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = objc_alloc_init(MTSettingsGroup);
  [(MTSettingsGroup *)v10 setGroupTitle:v7];
  [(MTSettingsGroup *)v10 setGroupFooter:v8];
  [(MTSettingsGroup *)v10 setGroupSettings:v9];
  [(MTSettingsGroup *)v10 setCustomHeaderHeight:0.0];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v11 = v9;
  id v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * i) setGroup:v10 v17];
      }
      id v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v13);
  }

  return v10;
}

+ (MTSettingsGroup)groupWithTitle:(id)a3 footerText:(id)a4 settingsHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_alloc_init(MTSettingsGroup);
  [(MTSettingsGroup *)v10 setGroupTitle:v9];

  [(MTSettingsGroup *)v10 setGroupFooter:v8];
  [(MTSettingsGroup *)v10 setSettingsHandler:v7];

  [(MTSettingsGroup *)v10 setCustomHeaderHeight:0.0];

  return v10;
}

+ (id)footerAttributedString:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSMutableAttributedString) initWithString:v3 attributes:0];

  v5 = +[UIListContentConfiguration groupedFooterConfiguration];
  v6 = [v5 textProperties];
  id v7 = [v6 resolvedColor];
  [v4 addAttribute:NSForegroundColorAttributeName value:v7 range:0, [v4 length]];

  id v8 = +[UIFont sectionFooterFont];
  [v4 addAttribute:NSFontAttributeName value:v8 range:0, [v4 length]];

  return v4;
}

+ (id)footerAttributedString:(id)a3 additionalAttributeName:(id)a4 additionalAttributeValue:(id)a5 additionalAttributeRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = objc_alloc((Class)NSMutableAttributedString);
  uint64_t v14 = +[MTSettingsGroup footerAttributedString:v12];

  id v15 = [v13 initWithAttributedString:v14];
  [v15 addAttribute:v11 value:v10 range:location, length];

  return v15;
}

- (NSArray)groupSettings
{
  groupSettings = (void (**)(void *, SEL))self->_groupSettings;
  if (!groupSettings)
  {
    groupSettings = (void (**)(void *, SEL))self->_settingsHandler;
    if (groupSettings)
    {
      groupSettings[2](groupSettings, a2);
      id v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v5 = self->_groupSettings;
      self->_groupSettings = v4;

      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      v6 = self->_groupSettings;
      id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v13;
        do
        {
          id v10 = 0;
          do
          {
            if (*(void *)v13 != v9) {
              objc_enumerationMutation(v6);
            }
            [*(id *)(*((void *)&v12 + 1) + 8 * (void)v10) setGroup:self v12];
            id v10 = (char *)v10 + 1;
          }
          while (v8 != v10);
          id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v8);
      }

      groupSettings = (void (**)(void *, SEL))self->_groupSettings;
    }
  }

  return (NSArray *)groupSettings;
}

- (NSString)groupTitle
{
  return self->_groupTitle;
}

- (void)setGroupTitle:(id)a3
{
}

- (NSAttributedString)groupFooter
{
  return self->_groupFooter;
}

- (void)setGroupFooter:(id)a3
{
}

- (void)setGroupSettings:(id)a3
{
}

- (id)settingsHandler
{
  return self->_settingsHandler;
}

- (void)setSettingsHandler:(id)a3
{
}

- (MTSettingHeaderAction)headerAction
{
  return self->_headerAction;
}

- (void)setHeaderAction:(id)a3
{
}

- (double)customHeaderHeight
{
  return self->_customHeaderHeight;
}

- (void)setCustomHeaderHeight:(double)a3
{
  self->_customHeaderHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerAction, 0);
  objc_storeStrong(&self->_settingsHandler, 0);
  objc_storeStrong((id *)&self->_groupSettings, 0);
  objc_storeStrong((id *)&self->_groupFooter, 0);

  objc_storeStrong((id *)&self->_groupTitle, 0);
}

@end