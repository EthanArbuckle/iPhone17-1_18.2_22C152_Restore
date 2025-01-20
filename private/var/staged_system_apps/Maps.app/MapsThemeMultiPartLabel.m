@interface MapsThemeMultiPartLabel
- (id)textColorProvider;
- (void)_updateTextColor;
- (void)didMoveToWindow;
- (void)setTextColorProvider:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateTheme;
@end

@implementation MapsThemeMultiPartLabel

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MapsThemeMultiPartLabel;
  [(MapsThemeMultiPartLabel *)&v9 traitCollectionDidChange:v5];
  if (v5
    && (id v6 = [v5 userInterfaceStyle],
        [(MapsThemeMultiPartLabel *)self traitCollection],
        v3 = objc_claimAutoreleasedReturnValue(),
        v6 == [v3 userInterfaceStyle]))
  {
  }
  else
  {
    v7 = [(MapsThemeMultiPartLabel *)self traitCollection];
    id v8 = [v7 userInterfaceStyle];

    if (v5) {
    if (v8)
    }
      [(MapsThemeMultiPartLabel *)self updateTheme];
  }
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)MapsThemeMultiPartLabel;
  [(MapsThemeMultiPartLabel *)&v4 didMoveToWindow];
  v3 = [(MapsThemeMultiPartLabel *)self window];

  if (v3) {
    [(MapsThemeMultiPartLabel *)self updateTheme];
  }
}

- (void)updateTheme
{
}

- (void)setTextColorProvider:(id)a3
{
  if (self->_textColorProvider != a3)
  {
    id v4 = [a3 copy];
    id textColorProvider = self->_textColorProvider;
    self->_id textColorProvider = v4;

    [(MapsThemeMultiPartLabel *)self _updateTextColor];
  }
}

- (void)_updateTextColor
{
  uint64_t v3 = [(MapsThemeMultiPartLabel *)self textColorProvider];
  if (v3)
  {
    id v4 = (void *)v3;
    id v5 = [(MapsThemeMultiPartLabel *)self window];

    if (v5)
    {
      id v8 = [(MapsThemeMultiPartLabel *)self textColorProvider];
      id v6 = [(MapsThemeMultiPartLabel *)self theme];
      v7 = v8[2](v8, v6);
      [(MapsThemeMultiPartLabel *)self setTextColor:v7];
    }
  }
}

- (id)textColorProvider
{
  return self->_textColorProvider;
}

- (void).cxx_destruct
{
}

@end