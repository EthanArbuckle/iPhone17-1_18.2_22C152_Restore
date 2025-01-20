@interface RUISubHeaderElement
- (void)configureView:(id)a3;
@end

@implementation RUISubHeaderElement

- (void)configureView:(id)a3
{
  id v31 = a3;
  if (objc_opt_respondsToSelector())
  {
    v4 = [(RUIElement *)self body];
    v5 = [(RUIElement *)self attributes];
    [v31 setSubHeaderText:v4 attributes:v5];
  }
  if (objc_opt_respondsToSelector())
  {
    v6 = [v31 subHeaderLabel];
    v7 = (void *)MEMORY[0x263F825C8];
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
      id v12 = [v13 subHeaderLabelTextColor];
    }
    [v6 setTextColor:v12];
    v14 = [(RUIElement *)self attributes];
    v15 = [v14 objectForKeyedSubscript:@"subHeaderBold"];
    int v16 = [v15 isEqual:@"true"];

    if (v16)
    {
      v17 = (void *)MEMORY[0x263F81708];
      v18 = [v6 font];
      [v18 pointSize];
      v19 = objc_msgSend(v17, "boldSystemFontOfSize:");
      [v6 setFont:v19];
    }
    v20 = [(RUIElement *)self attributes];
    v21 = [v20 objectForKeyedSubscript:@"align"];
    if (v21)
    {
      v22 = [(RUIElement *)self attributes];
      v23 = [v22 objectForKeyedSubscript:@"align"];
      uint64_t v24 = +[RUIParser textAlignmentForString:v23];
    }
    else
    {
      v22 = [(RUIElement *)self style];
      uint64_t v24 = [v22 subHeaderLabelAlignment];
    }

    [v6 setTextAlignment:v24];
    v25 = [(RUIElement *)self attributes];
    v26 = [v25 objectForKeyedSubscript:@"textStyle"];

    if (v26)
    {
      v27 = [(RUIElement *)self attributes];
      v28 = [v27 objectForKeyedSubscript:@"textStyle"];
      v29 = +[RUIParser textStyleForString:v28];

      v30 = [MEMORY[0x263F81708] preferredFontForTextStyle:v29];
      [v6 setFont:v30];

      [v6 setAdjustsFontForContentSizeCategory:1];
    }
  }
}

@end