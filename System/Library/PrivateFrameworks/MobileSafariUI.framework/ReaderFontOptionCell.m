@interface ReaderFontOptionCell
- (BOOL)isEnabled;
- (UIView)accessoryView;
- (id)_listContentConfiguration;
- (id)attributedText;
- (void)_updateAccessories;
- (void)setAccessoryView:(id)a3;
- (void)setAttributedText:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)updateConfigurationUsingState:(id)a3;
@end

@implementation ReaderFontOptionCell

- (void)updateConfigurationUsingState:(id)a3
{
  id v4 = a3;
  [(ReaderFontOptionCell *)self setAutomaticallyUpdatesBackgroundConfiguration:0];
  id v7 = (id)[v4 copy];

  [v7 setHighlighted:0];
  [v7 setSelected:0];
  v5 = [MEMORY[0x1E4FB1498] listGroupedCellConfiguration];
  v6 = [v5 updatedConfigurationForState:v7];

  [(ReaderFontOptionCell *)self setBackgroundConfiguration:v6];
}

- (void)setAttributedText:(id)a3
{
  id v4 = a3;
  v5 = [(ReaderFontOptionCell *)self _listContentConfiguration];
  id v6 = (id)[v5 copy];

  [v6 setAttributedText:v4];
  [(ReaderFontOptionCell *)self setContentConfiguration:v6];
}

- (id)attributedText
{
  v2 = [(ReaderFontOptionCell *)self _listContentConfiguration];
  v3 = [v2 attributedText];

  return v3;
}

- (id)_listContentConfiguration
{
  v2 = [(ReaderFontOptionCell *)self contentConfiguration];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (void)setAccessoryView:(id)a3
{
  v5 = (UIView *)a3;
  if (self->_accessoryView != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_accessoryView, a3);
    [(ReaderFontOptionCell *)self _updateAccessories];
    v5 = v6;
  }
}

- (void)setSelected:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ReaderFontOptionCell;
  [(ReaderFontOptionCell *)&v4 setSelected:a3];
  [(ReaderFontOptionCell *)self _updateAccessories];
}

- (void)_updateAccessories
{
  id v7 = [MEMORY[0x1E4F1CA48] array];
  if ([(ReaderFontOptionCell *)self isSelected])
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4FB14F8]);
    objc_super v4 = [MEMORY[0x1E4FB1618] labelColor];
    [v3 setTintColor:v4];

    [v7 addObject:v3];
  }
  accessoryView = self->_accessoryView;
  if (accessoryView)
  {
    [(UIView *)accessoryView setTranslatesAutoresizingMaskIntoConstraints:1];
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1500]) initWithCustomView:self->_accessoryView placement:1];
    [v7 addObject:v6];
  }
  [(ReaderFontOptionCell *)self setAccessories:v7];
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (void).cxx_destruct
{
}

@end