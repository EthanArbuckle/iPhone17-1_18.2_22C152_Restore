@interface RUIModernHeaderView
- (NSString)detailText;
- (NSString)subHeaderText;
- (RUIModernHeaderView)initWithAttributes:(id)a3;
- (RUIModernHeaderView)initWithTitle:(id)a3;
- (RUIModernHeaderView)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5;
- (double)bottomPadding;
- (double)headerHeightForWidth:(double)a3 inView:(id)a4;
- (double)iconHeight;
- (double)iconToHeaderLabelPadding;
- (double)topPadding;
- (void)setDetailText:(id)a3;
- (void)setDetailText:(id)a3 attributes:(id)a4;
- (void)setIconHeight:(double)a3;
- (void)setIconImage:(id)a3;
- (void)setImageSize:(CGSize)a3;
- (void)setSubHeaderText:(id)a3;
- (void)setSubHeaderText:(id)a3 attributes:(id)a4;
- (void)setText:(id)a3 attributes:(id)a4;
- (void)updateDetailText;
@end

@implementation RUIModernHeaderView

- (RUIModernHeaderView)initWithTitle:(id)a3
{
  return [(RUIModernHeaderView *)self initWithTitle:a3 detailText:0 icon:0];
}

- (RUIModernHeaderView)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)RUIModernHeaderView;
  v10 = [(RUIModernHeaderView *)&v15 initWithTitle:a3 detailText:v9 icon:a5];
  v11 = v10;
  if (v10)
  {
    v12 = [(RUIModernHeaderView *)v10 headerLabel];
    [v12 _setHyphenationFactor:0.0];

    objc_storeStrong((id *)&v11->_detailText, a4);
    v11->_iconHeight = 60.0;
    v14.receiver = v11;
    v14.super_class = (Class)RUIModernHeaderView;
    [(RUIModernHeaderView *)&v14 setAllowFullWidthIcon:1];
  }

  return v11;
}

- (void)setImageSize:(CGSize)a3
{
}

- (double)topPadding
{
  return 10.0;
}

- (double)iconToHeaderLabelPadding
{
  return 10.0;
}

- (double)bottomPadding
{
  return 0.0;
}

- (RUIModernHeaderView)initWithAttributes:(id)a3
{
  return [(RUIModernHeaderView *)self initWithTitle:&stru_26C545B50];
}

- (double)headerHeightForWidth:(double)a3 inView:(id)a4
{
  -[RUIModernHeaderView systemLayoutSizeFittingSize:](self, "systemLayoutSizeFittingSize:", a4, *MEMORY[0x263F83810], *(double *)(MEMORY[0x263F83810] + 8));
  return v4;
}

- (void)setText:(id)a3 attributes:(id)a4
{
  objc_storeStrong((id *)&self->_detailText, a3);
  [(RUIModernHeaderView *)self updateDetailText];
}

- (void)setDetailText:(id)a3 attributes:(id)a4
{
  if (_isInternalInstall())
  {
    double v4 = _RUILoggingFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_2144F2000, v4, OS_LOG_TYPE_DEFAULT, "Detail text is not supported with setupAssistant-style title headers", v5, 2u);
    }
  }
}

- (void)setSubHeaderText:(id)a3 attributes:(id)a4
{
  objc_storeStrong((id *)&self->_subHeaderText, a3);
  [(RUIModernHeaderView *)self updateDetailText];
}

- (void)setIconImage:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RUIModernHeaderView;
  [(RUIModernHeaderView *)&v3 setIcon:a3 accessibilityLabel:0];
}

- (void)updateDetailText
{
  uint64_t v3 = 536;
  if ([(NSString *)self->_detailText length] && [(NSString *)self->_subHeaderText length])
  {
    id v4 = [NSString stringWithFormat:@"%@\n\n%@", self->_detailText, self->_subHeaderText];
  }
  else
  {
    if (![(NSString *)self->_detailText length])
    {
      uint64_t v3 = 544;
      if (![(NSString *)self->_subHeaderText length])
      {
        v5 = 0;
        goto LABEL_8;
      }
    }
    id v4 = *(id *)((char *)&self->super.super.super.super.isa + v3);
  }
  v5 = v4;
LABEL_8:
  v6.receiver = self;
  v6.super_class = (Class)RUIModernHeaderView;
  [(RUIModernHeaderView *)&v6 setDetailText:v5];
}

- (NSString)detailText
{
  return self->_detailText;
}

- (void)setDetailText:(id)a3
{
}

- (NSString)subHeaderText
{
  return self->_subHeaderText;
}

- (void)setSubHeaderText:(id)a3
{
}

- (double)iconHeight
{
  return self->_iconHeight;
}

- (void)setIconHeight:(double)a3
{
  self->_iconHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subHeaderText, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
}

@end