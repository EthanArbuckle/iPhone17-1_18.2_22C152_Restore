@interface MapsThemeLabel
- (id)attributedTextProvider;
- (id)textColorProvider;
- (void)_updateAttributedText;
- (void)_updateTextColor;
- (void)didMoveToWindow;
- (void)setAttributedTextProvider:(id)a3;
- (void)setTextColorProvider:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateTheme;
@end

@implementation MapsThemeLabel

- (void)_updateTextColor
{
  v3 = [(MapsThemeLabel *)self textColorProvider];

  if (v3)
  {
    v6 = [(MapsThemeLabel *)self textColorProvider];
    v4 = +[MapsTheme sharedTheme];
    v5 = v6[2](v6, v4);
    [(MapsThemeLabel *)self setTextColor:v5];
  }
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)MapsThemeLabel;
  [(MapsThemeLabel *)&v4 didMoveToWindow];
  v3 = [(MapsThemeLabel *)self window];

  if (v3) {
    [(MapsThemeLabel *)self updateTheme];
  }
}

- (void)_updateAttributedText
{
  v3 = [(MapsThemeLabel *)self attributedTextProvider];

  if (v3)
  {
    v6 = [(MapsThemeLabel *)self attributedTextProvider];
    objc_super v4 = +[MapsTheme sharedTheme];
    v5 = v6[2](v6, v4);
    [(MapsThemeLabel *)self setAttributedText:v5];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MapsThemeLabel;
  [(MapsThemeLabel *)&v9 traitCollectionDidChange:v5];
  if (v5
    && (id v6 = [v5 userInterfaceStyle],
        [(MapsThemeLabel *)self traitCollection],
        v3 = objc_claimAutoreleasedReturnValue(),
        v6 == [v3 userInterfaceStyle]))
  {
  }
  else
  {
    v7 = [(MapsThemeLabel *)self traitCollection];
    id v8 = [v7 userInterfaceStyle];

    if (v5) {
    if (v8)
    }
      [(MapsThemeLabel *)self updateTheme];
  }
}

- (void)updateTheme
{
  [(MapsThemeLabel *)self _updateAttributedText];

  [(MapsThemeLabel *)self _updateTextColor];
}

- (id)textColorProvider
{
  return self->_textColorProvider;
}

- (id)attributedTextProvider
{
  return self->_attributedTextProvider;
}

- (void)setAttributedTextProvider:(id)a3
{
  if (self->_attributedTextProvider != a3)
  {
    id v4 = objc_retainBlock(a3);
    id attributedTextProvider = self->_attributedTextProvider;
    self->_id attributedTextProvider = v4;

    [(MapsThemeLabel *)self _updateAttributedText];
  }
}

- (void)setTextColorProvider:(id)a3
{
  if (self->_textColorProvider != a3)
  {
    id v4 = objc_retainBlock(a3);
    id textColorProvider = self->_textColorProvider;
    self->_id textColorProvider = v4;

    [(MapsThemeLabel *)self _updateTextColor];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_textColorProvider, 0);

  objc_storeStrong(&self->_attributedTextProvider, 0);
}

@end