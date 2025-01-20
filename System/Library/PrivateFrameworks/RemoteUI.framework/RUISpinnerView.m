@interface RUISpinnerView
- (RUIFooterElement)footer;
- (RUIHeaderElement)header;
- (RUIObjectModel)objectModel;
- (UIColor)spinnerColor;
- (id)spinnerView;
- (void)setFooter:(id)a3;
- (void)setHeader:(id)a3;
- (void)setObjectModel:(id)a3;
- (void)setSpinnerColor:(id)a3;
- (void)viewDidLayout;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation RUISpinnerView

- (void)setSpinnerColor:(id)a3
{
  v5 = (UIColor *)a3;
  if (self->_spinnerColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_spinnerColor, a3);
    [(UIActivityIndicatorView *)self->_spinner setColor:self->_spinnerColor];
    v5 = v6;
  }
}

- (id)spinnerView
{
  view = self->_view;
  if (!view)
  {
    id v4 = objc_alloc(MEMORY[0x263F82E00]);
    v5 = (UIView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    v6 = self->_view;
    self->_view = v5;

    v7 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:10];
    spinner = self->_spinner;
    self->_spinner = v7;

    v9 = self->_spinner;
    v10 = [(RUISpinnerView *)self spinnerColor];
    if (v10)
    {
      [(UIActivityIndicatorView *)v9 setColor:v10];
    }
    else
    {
      v11 = [MEMORY[0x263F825C8] _labelColor];
      [(UIActivityIndicatorView *)v9 setColor:v11];
    }
    [(UIView *)self->_view addSubview:self->_spinner];
    view = self->_view;
  }
  return view;
}

- (void)viewWillAppear:(BOOL)a3
{
}

- (void)viewWillDisappear:(BOOL)a3
{
}

- (void)viewDidLayout
{
  v69[2] = *MEMORY[0x263EF8340];
  v3 = [(UIView *)self->_view superview];
  [(UIView *)self->_view frame];
  if (v3)
  {
    double v8 = v4;
    double v9 = v5;
    [v3 bounds];
    double v11 = v10;
    double v13 = v12;
    -[UIView setFrame:](self->_view, "setFrame:", v8, v9);
  }
  else
  {
    double v11 = v6;
    double v13 = v7;
  }
  [(UIView *)self->_view center];
  -[UIActivityIndicatorView setCenter:](self->_spinner, "setCenter:");
  v14 = [(RUIElement *)self attributes];
  v15 = [v14 objectForKeyedSubscript:@"label"];

  if ([v15 length])
  {
    if (!self->_label)
    {
      id v16 = objc_alloc(MEMORY[0x263F828E0]);
      v17 = (UILabel *)objc_msgSend(v16, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
      label = self->_label;
      self->_label = v17;

      [(UILabel *)self->_label setNumberOfLines:0];
      [(UILabel *)self->_label setTextAlignment:1];
      [(UIView *)self->_view addSubview:self->_label];
    }
    v19 = [MEMORY[0x263F81658] defaultParagraphStyle];
    v20 = (void *)[v19 mutableCopy];

    [v20 setLineBreakMode:0];
    v68[0] = *MEMORY[0x263F814F0];
    v21 = [MEMORY[0x263F81708] systemFontOfSize:15.0];
    v68[1] = *MEMORY[0x263F81540];
    v69[0] = v21;
    v69[1] = v20;
    v22 = [NSDictionary dictionaryWithObjects:v69 forKeys:v68 count:2];

    objc_msgSend(v15, "boundingRectWithSize:options:attributes:context:", 1, v22, 0, v11, v13);
    double v24 = v23;
    double v26 = v25;
    v27 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v15 attributes:v22];
    [(UILabel *)self->_label setAttributedText:v27];
    [(UIActivityIndicatorView *)self->_spinner frame];
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;
    [(UILabel *)self->_label frame];
    double v34 = round((v13 - (v26 + v33)) * 0.5);
    [(UIView *)self->_view center];
    double v36 = v35 - round(v24 * 0.5);
    -[UIActivityIndicatorView setFrame:](self->_spinner, "setFrame:", v29, v34, v31, v33);
    -[UILabel setFrame:](self->_label, "setFrame:", v36, v33 + v34, v24, v26);

    goto LABEL_25;
  }
  footer = self->_footer;
  header = self->_header;
  v39 = &OBJC_IVAR___RUIPage__elementProviders;
  v40 = &OBJC_IVAR___RUIPage__elementProviders;
  if (!footer)
  {
    if (!header) {
      goto LABEL_25;
    }
LABEL_12:
    if (!self->_headerView)
    {
      v41 = [RUIHeaderView alloc];
      v42 = [(RUIElement *)self->_header attributes];
      v43 = [(RUIHeaderView *)v41 initWithAttributes:v42];
      headerView = self->_headerView;
      self->_headerView = v43;

      [(RUIHeaderElement *)self->_header configureView:self->_headerView];
      [(UIView *)self->_view addSubview:self->_headerView];
      v40 = &OBJC_IVAR___RUIPage__elementProviders;
      footer = self->_footer;
    }
    v39 = &OBJC_IVAR___RUIPage__elementProviders;
    if (!footer) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }
  if (header) {
    goto LABEL_12;
  }
LABEL_15:
  uint64_t v45 = v39[184];
  if (!*(Class *)((char *)&self->super.super.isa + v45))
  {
    v46 = [RemoteUISectionFooter alloc];
    v47 = [(RUIElement *)self->_footer attributes];
    v48 = [(RemoteUISectionFooter *)v46 initWithAttributes:v47];
    v49 = *(Class *)((char *)&self->super.super.isa + v45);
    *(Class *)((char *)&self->super.super.isa + v45) = v48;

    [(RUIFooterElement *)self->_footer configureView:*(Class *)((char *)&self->super.super.isa + v45)];
    [(UIView *)self->_view addSubview:*(Class *)((char *)&self->super.super.isa + v45)];
    v40 = &OBJC_IVAR___RUIPage__elementProviders;
  }
LABEL_17:
  uint64_t v50 = v40[183];
  v51 = *(Class *)((char *)&self->super.super.isa + v50);
  if (v51)
  {
    [v51 frame];
    double v53 = v52;
    double v55 = v54;
    v56 = *(Class *)((char *)&self->super.super.isa + v50);
    [v3 bounds];
    [v56 headerHeightForWidth:v3 inView:v57];
    [v3 bounds];
    objc_msgSend(*(id *)((char *)&self->super.super.isa + v50), "setFrame:", v53, v55);
  }
  uint64_t v58 = v39[184];
  v59 = *(Class *)((char *)&self->super.super.isa + v58);
  if (v59)
  {
    [v59 frame];
    double v61 = v60;
    double v63 = v62;
    v64 = *(Class *)((char *)&self->super.super.isa + v58);
    [v3 bounds];
    [v64 footerHeightForWidth:v3 inView:v65];
    [v3 bounds];
    objc_msgSend(*(id *)((char *)&self->super.super.isa + v58), "setFrame:", v61, v63);
  }
  [(UIActivityIndicatorView *)self->_spinner frame];
  -[UIActivityIndicatorView setFrame:](self->_spinner, "setFrame:");
  v66 = *(Class *)((char *)&self->super.super.isa + v50);
  if (v66)
  {
    [v66 frame];
    objc_msgSend(*(id *)((char *)&self->super.super.isa + v50), "setFrame:");
  }
  v67 = *(Class *)((char *)&self->super.super.isa + v58);
  if (v67)
  {
    [v67 frame];
    objc_msgSend(*(id *)((char *)&self->super.super.isa + v58), "setFrame:");
  }
LABEL_25:
}

- (RUIObjectModel)objectModel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);
  return (RUIObjectModel *)WeakRetained;
}

- (void)setObjectModel:(id)a3
{
}

- (UIColor)spinnerColor
{
  return self->_spinnerColor;
}

- (RUIHeaderElement)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
}

- (RUIFooterElement)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_spinnerColor, 0);
  objc_destroyWeak((id *)&self->_objectModel);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

@end