@interface MCDSiriActionCell
- (UIImageView)siriImageView;
- (void)_updateSiriImageViewTintColor;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setSiriImageView:(id)a3;
@end

@implementation MCDSiriActionCell

- (void)layoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)MCDSiriActionCell;
  [(MCDSiriActionCell *)&v17 layoutSubviews];
  v3 = sub_1000B5B74();
  v4 = [v3 localizedStringForKey:@"SIRI_ACTION_CELL_TITLE" value:&stru_101023248 table:@"MusicCarDisplayUI"];
  v5 = [(MCDSiriActionCell *)self textLabel];
  [v5 setText:v4];

  v6 = +[UIColor _carSystemFocusColor];
  v7 = [(MCDSiriActionCell *)self textLabel];
  [v7 setTextColor:v6];

  v8 = +[UIColor _carSystemFocusLabelColor];
  v9 = [(MCDSiriActionCell *)self textLabel];
  [v9 setHighlightedTextColor:v8];

  v10 = [(MCDSiriActionCell *)self textLabel];
  [v10 setAdjustsFontSizeToFitWidth:1];

  v11 = [(MCDSiriActionCell *)self siriImageView];

  if (!v11)
  {
    id v12 = objc_alloc((Class)UIImageView);
    v13 = +[UIImage _systemImageNamed:@"siri"];
    id v14 = [v12 initWithImage:v13];

    v15 = +[UIImageSymbolConfiguration configurationWithTextStyle:UIFontTextStyleBody];
    [v14 setPreferredSymbolConfiguration:v15];

    [v14 setContentMode:4];
    [(MCDSiriActionCell *)self setSiriImageView:v14];
  }
  v16 = [(MCDSiriActionCell *)self siriImageView];
  [(MCDSiriActionCell *)self setAccessoryView:v16];
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MCDSiriActionCell;
  [(_MCDReusableCell *)&v5 setHighlighted:a3 animated:a4];
  [(MCDSiriActionCell *)self _updateSiriImageViewTintColor];
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MCDSiriActionCell;
  [(_MCDReusableCell *)&v5 setSelected:a3 animated:a4];
  [(MCDSiriActionCell *)self _updateSiriImageViewTintColor];
}

- (void)_updateSiriImageViewTintColor
{
  id v5 = [(MCDSiriActionCell *)self siriImageView];
  if (([(MCDSiriActionCell *)self isHighlighted] & 1) != 0
    || ([(MCDSiriActionCell *)self isSelected] & 1) != 0)
  {
    uint64_t v3 = +[UIColor _carSystemFocusLabelColor];
  }
  else
  {
    uint64_t v3 = +[UIColor _carSystemFocusColor];
  }
  v4 = (void *)v3;
  [v5 setTintColor:v3];
}

- (UIImageView)siriImageView
{
  return self->_siriImageView;
}

- (void)setSiriImageView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end