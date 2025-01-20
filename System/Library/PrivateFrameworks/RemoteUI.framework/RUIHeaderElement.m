@interface RUIHeaderElement
- (int64_t)labelAlignment;
- (void)configureView:(id)a3;
@end

@implementation RUIHeaderElement

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
    v5 = [(RUIElement *)self style];
    int64_t v7 = [v5 headerLabelAlignment];
  }

  return v7;
}

- (void)configureView:(id)a3
{
  v30[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    v5 = [(RUIElement *)self body];
    v6 = [(RUIElement *)self attributes];
    [v4 setText:v5 attributes:v6];
  }
  if (objc_opt_respondsToSelector())
  {
    int64_t v7 = (void *)MEMORY[0x263F825C8];
    v8 = [(RUIElement *)self attributes];
    v9 = [v8 objectForKeyedSubscript:@"color"];
    v10 = objc_msgSend(v7, "_remoteUI_colorWithString:defaultColor:", v9, 0);
    v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      v13 = [(RUIElement *)self style];
      id v12 = [v13 headerLabelTextColor];
    }
    v14 = [v4 headerLabel];
    [v14 setTextColor:v12];

    v15 = [v4 headerLabel];
    objc_msgSend(v15, "setTextAlignment:", -[RUIHeaderElement labelAlignment](self, "labelAlignment"));

    v16 = [(RUIElement *)self attributes];
    v17 = [v16 objectForKeyedSubscript:@"legacyLabel"];
    int v18 = [v17 BOOLValue];

    if (v18)
    {
      v19 = [MEMORY[0x263F81658] defaultParagraphStyle];
      v20 = (void *)[v19 mutableCopy];

      [v20 setLineBreakMode:0];
      if (+[RUIPlatform isAppleTV]) {
        RemoteUIHeaderFont();
      }
      else {
      v21 = [MEMORY[0x263F81708] boldSystemFontOfSize:14.0];
      }
      uint64_t v22 = *MEMORY[0x263F81540];
      v29[0] = *MEMORY[0x263F814F0];
      v29[1] = v22;
      v30[0] = v21;
      v30[1] = v20;
      v23 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
      v24 = [v4 headerLabel];
      id v25 = objc_alloc(MEMORY[0x263F086A0]);
      v26 = [(RUIElement *)self body];
      v27 = (void *)[v25 initWithString:v26 attributes:v23];
      [v24 setAttributedText:v27];

      v28 = [v4 headerLabel];
      [v28 setTextAlignment:1];
    }
  }
}

@end