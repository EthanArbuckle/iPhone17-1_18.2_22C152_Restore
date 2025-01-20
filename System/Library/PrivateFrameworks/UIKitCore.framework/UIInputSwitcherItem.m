@interface UIInputSwitcherItem
+ (id)switcherItemWithIdentifier:(id)a3;
- (BOOL)isSegmentedItem;
- (BOOL)usesDeviceLanguage;
- (NSArray)segmentImages;
- (NSArray)segmentTitles;
- (NSString)identifier;
- (NSString)localizedSubtitle;
- (NSString)localizedTitle;
- (UIFont)subtitleFont;
- (UIFont)titleFont;
- (UIInputSwitcherItem)initWithIdentifier:(id)a3;
- (UISwitch)switchControl;
- (id)persistentSelectedIndex;
- (id)switchIsOnBlock;
- (id)switchToggleBlock;
- (int64_t)selectedSegmentIndex;
- (void)dealloc;
- (void)setIdentifier:(id)a3;
- (void)setLocalizedSubtitle:(id)a3;
- (void)setLocalizedTitle:(id)a3;
- (void)setPersistentSelectedIndex:(id)a3;
- (void)setSegmentImages:(id)a3;
- (void)setSegmentTitles:(id)a3;
- (void)setSelectedSegmentIndex:(int64_t)a3;
- (void)setSubtitleFont:(id)a3;
- (void)setSwitchControl:(id)a3;
- (void)setSwitchIsOnBlock:(id)a3;
- (void)setSwitchToggleBlock:(id)a3;
- (void)setTitleFont:(id)a3;
- (void)setUsesDeviceLanguage:(BOOL)a3;
@end

@implementation UIInputSwitcherItem

+ (id)switcherItemWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithIdentifier:v4];

  return v5;
}

- (void)dealloc
{
  [(UIInputSwitcherItem *)self setPersistentSelectedIndex:0];
  [(UIInputSwitcherItem *)self setSwitchIsOnBlock:0];
  [(UIInputSwitcherItem *)self setSwitchToggleBlock:0];
  v3.receiver = self;
  v3.super_class = (Class)UIInputSwitcherItem;
  [(UIInputSwitcherItem *)&v3 dealloc];
}

- (UIInputSwitcherItem)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UIInputSwitcherItem;
  v5 = [(UIInputSwitcherItem *)&v8 init];
  v6 = v5;
  if (v5) {
    [(UIInputSwitcherItem *)v5 setIdentifier:v4];
  }

  return v6;
}

- (BOOL)isSegmentedItem
{
  objc_super v3 = [(UIInputSwitcherItem *)self segmentImages];
  if ([v3 count])
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [(UIInputSwitcherItem *)self segmentTitles];
    BOOL v4 = [v5 count] != 0;
  }
  return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
}

- (NSString)localizedSubtitle
{
  return self->_localizedSubtitle;
}

- (void)setLocalizedSubtitle:(id)a3
{
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (void)setTitleFont:(id)a3
{
}

- (UIFont)subtitleFont
{
  return self->_subtitleFont;
}

- (void)setSubtitleFont:(id)a3
{
}

- (BOOL)usesDeviceLanguage
{
  return self->_usesDeviceLanguage;
}

- (void)setUsesDeviceLanguage:(BOOL)a3
{
  self->_usesDeviceLanguage = a3;
}

- (UISwitch)switchControl
{
  return self->_switchControl;
}

- (void)setSwitchControl:(id)a3
{
}

- (id)switchIsOnBlock
{
  return self->_switchIsOnBlock;
}

- (void)setSwitchIsOnBlock:(id)a3
{
}

- (id)switchToggleBlock
{
  return self->_switchToggleBlock;
}

- (void)setSwitchToggleBlock:(id)a3
{
}

- (int64_t)selectedSegmentIndex
{
  return self->_selectedSegmentIndex;
}

- (void)setSelectedSegmentIndex:(int64_t)a3
{
  self->_selectedSegmentIndex = a3;
}

- (NSArray)segmentTitles
{
  return self->_segmentTitles;
}

- (void)setSegmentTitles:(id)a3
{
}

- (NSArray)segmentImages
{
  return self->_segmentImages;
}

- (void)setSegmentImages:(id)a3
{
}

- (id)persistentSelectedIndex
{
  return self->_persistentSelectedIndex;
}

- (void)setPersistentSelectedIndex:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_persistentSelectedIndex, 0);
  objc_storeStrong((id *)&self->_segmentImages, 0);
  objc_storeStrong((id *)&self->_segmentTitles, 0);
  objc_storeStrong(&self->_switchToggleBlock, 0);
  objc_storeStrong(&self->_switchIsOnBlock, 0);
  objc_storeStrong((id *)&self->_switchControl, 0);
  objc_storeStrong((id *)&self->_subtitleFont, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_localizedSubtitle, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end