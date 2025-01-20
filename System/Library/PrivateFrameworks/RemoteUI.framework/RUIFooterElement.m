@interface RUIFooterElement
- (id)linkURL;
- (int64_t)labelAlignment;
- (void)configureView:(id)a3;
- (void)setEnabled:(BOOL)a3;
@end

@implementation RUIFooterElement

- (int64_t)labelAlignment
{
  v3 = [(RUIElement *)self attributes];
  v4 = [v3 objectForKeyedSubscript:@"align"];

  if (v4)
  {
    v5 = [(RUIElement *)self attributes];
    v6 = [v5 objectForKeyedSubscript:@"align"];
    int64_t v7 = +[RUIParser textAlignmentForString:v6];
  }
  else
  {
    v8 = [(RUIFooterElement *)self linkURL];

    v9 = [(RUIElement *)self style];
    v5 = v9;
    if (v8) {
      uint64_t v10 = [v9 footerLinkAlignment];
    }
    else {
      uint64_t v10 = [v9 footerLabelAlignment];
    }
    int64_t v7 = v10;
  }

  return v7;
}

- (id)linkURL
{
  v2 = NSURL;
  v3 = [(RUIElement *)self attributes];
  v4 = [v3 objectForKeyedSubscript:@"url"];
  v5 = [v2 URLWithString:v4];

  return v5;
}

- (void)configureView:(id)a3
{
  id v5 = a3;
  if (objc_opt_respondsToSelector())
  {
    v6 = [(RUIElement *)self body];
    int64_t v7 = [(RUIElement *)self attributes];
    [v5 setText:v6 attributes:v7];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    p_footerView = &self->_footerView;
    objc_storeStrong((id *)&self->_footerView, a3);
    v9 = (void *)MEMORY[0x263F825C8];
    uint64_t v10 = [(RUIElement *)self attributes];
    v11 = [v10 objectForKeyedSubscript:@"color"];
    v12 = objc_msgSend(v9, "_remoteUI_colorWithString:defaultColor:", v11, 0);
    v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      v15 = [(RUIElement *)self style];
      id v14 = [v15 footerLabelTextColor];
    }
    [(RemoteUISectionFooter *)*p_footerView setTextColor:v14];
    [(RemoteUISectionFooter *)*p_footerView setTextAlignment:[(RUIFooterElement *)self labelAlignment]];
    v16 = [(RUIElement *)self style];

    if (v16)
    {
      v17 = *p_footerView;
      v18 = [(RUIElement *)self style];
      [v18 footerTopMargin];
      -[RemoteUISectionFooter setTopMargin:](v17, "setTopMargin:");

      v19 = *p_footerView;
      v20 = [(RUIElement *)self style];
      v21 = [v20 footerFont];
      [(RemoteUISectionFooter *)v19 setFont:v21];
    }
    v22 = [(RUIElement *)self attributes];
    v23 = [v22 objectForKeyedSubscript:@"activationFunction"];

    if (v23)
    {
      objc_initWeak(&location, self);
      v24 = *p_footerView;
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __34__RUIFooterElement_configureView___block_invoke;
      v30[3] = &unk_264211570;
      objc_copyWeak(&v31, &location);
      [(RemoteUISectionFooter *)v24 setLinkAction:v30];
      objc_destroyWeak(&v31);
      objc_destroyWeak(&location);
    }
    else
    {
      v25 = [(RUIFooterElement *)self linkURL];

      if (v25)
      {
        v26 = *p_footerView;
        v27 = [(RUIFooterElement *)self linkURL];
        [(RemoteUISectionFooter *)v26 setLinkURL:v27];
      }
    }
  }
  if (objc_opt_respondsToSelector())
  {
    v28 = [(RUIElement *)self pageElement];
    v29 = [v28 page];
    [v5 configureInPage:v29];
  }
}

void __34__RUIFooterElement_configureView___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained performAction:2 completion:0];
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)RUIFooterElement;
  -[RUIElement setEnabled:](&v6, sel_setEnabled_);
  id v5 = [(RemoteUISectionFooter *)self->_footerView linkLabel];
  [v5 setEnabled:v3];
}

- (void).cxx_destruct
{
}

@end