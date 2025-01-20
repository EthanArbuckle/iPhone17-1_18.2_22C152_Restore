@interface RUIDetailHeaderElement
- (void)configureView:(id)a3;
- (void)setBody:(id)a3;
- (void)setEnabled:(BOOL)a3;
@end

@implementation RUIDetailHeaderElement

- (void)configureView:(id)a3
{
  v45[10] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    v5 = [(RUIElement *)self body];
    v6 = [(RUIElement *)self attributes];
    [v4 setDetailText:v5 attributes:v6];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    p_headerView = &self->_headerView;
    objc_storeWeak((id *)&self->_headerView, v4);
    v8 = (void *)MEMORY[0x263F825C8];
    v9 = [(RUIElement *)self attributes];
    v10 = [v9 objectForKeyedSubscript:@"color"];
    v11 = objc_msgSend(v8, "_remoteUI_colorWithString:defaultColor:", v10, 0);
    v12 = v11;
    if (v11)
    {
      id v13 = v11;
    }
    else
    {
      v14 = [(RUIElement *)self style];
      id v13 = [v14 detailHeaderLabelTextColor];
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_headerView);
    [WeakRetained setDetailHeaderColor:v13];

    v16 = [(RUIElement *)self attributes];
    v17 = [v16 objectForKeyedSubscript:@"url"];
    if (v17)
    {
    }
    else
    {
      v18 = [(RUIElement *)self attributes];
      v19 = [v18 objectForKeyedSubscript:@"activationFunction"];

      if (!v19) {
        goto LABEL_11;
      }
    }
    objc_initWeak(location, self);
    id v20 = objc_loadWeakRetained((id *)&self->_headerView);
    v21 = [v20 detailHeaderLabel];
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __40__RUIDetailHeaderElement_configureView___block_invoke;
    v41[3] = &unk_264211570;
    objc_copyWeak(&v42, location);
    [v21 setAction:v41];

    objc_destroyWeak(&v42);
    objc_destroyWeak(location);
LABEL_11:
    uint64_t v22 = *MEMORY[0x263F83610];
    v44[0] = @"title1";
    v44[1] = @"title2";
    uint64_t v23 = *MEMORY[0x263F83618];
    v45[0] = v22;
    v45[1] = v23;
    uint64_t v24 = *MEMORY[0x263F83628];
    v44[2] = @"title3";
    v44[3] = @"headline";
    uint64_t v25 = *MEMORY[0x263F835D0];
    v45[2] = v24;
    v45[3] = v25;
    uint64_t v26 = *MEMORY[0x263F835F0];
    v44[4] = @"subheadline";
    v44[5] = @"body";
    uint64_t v27 = *MEMORY[0x263F83570];
    v45[4] = v26;
    v45[5] = v27;
    uint64_t v28 = *MEMORY[0x263F83580];
    v44[6] = @"callout";
    v44[7] = @"footnote";
    uint64_t v29 = *MEMORY[0x263F835B8];
    v45[6] = v28;
    v45[7] = v29;
    v44[8] = @"caption1";
    v44[9] = @"caption2";
    uint64_t v30 = *MEMORY[0x263F83590];
    v45[8] = *MEMORY[0x263F83588];
    v45[9] = v30;
    v31 = [NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:10];
    v32 = [(RUIElement *)self attributes];
    v33 = [v32 objectForKeyedSubscript:@"textStyle"];

    v34 = [v31 objectForKeyedSubscript:v33];

    if (v34)
    {
      v35 = objc_loadWeakRetained((id *)p_headerView);
      v36 = [v35 detailHeaderLabel];
      v37 = (void *)MEMORY[0x263F81708];
      v38 = [v31 objectForKeyedSubscript:v33];
      v39 = [v4 traitCollection];
      v40 = [v37 preferredFontForTextStyle:v38 compatibleWithTraitCollection:v39];
      [v36 setFont:v40];
    }
    else
    {
      if (!v33 || !_isInternalInstall()) {
        goto LABEL_14;
      }
      v35 = _RUILoggingFacility();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(location[0]) = 138412290;
        *(id *)((char *)location + 4) = v33;
        _os_log_impl(&dword_2144F2000, v35, OS_LOG_TYPE_DEFAULT, "'%@' is not a supported text style", (uint8_t *)location, 0xCu);
      }
    }

LABEL_14:
  }
}

void __40__RUIDetailHeaderElement_configureView___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained performAction:2 completion:0];
}

- (void)setBody:(id)a3
{
  id v4 = a3;
  id v5 = [(RUIElement *)self body];

  if (v5 != v4)
  {
    v9.receiver = self;
    v9.super_class = (Class)RUIDetailHeaderElement;
    [(RUIElement *)&v9 setBody:v4];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_headerView);
    v7 = [(RUIElement *)self body];
    v8 = [(RUIElement *)self attributes];
    [WeakRetained setDetailText:v7 attributes:v8];
  }
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)RUIDetailHeaderElement;
  -[RUIElement setEnabled:](&v7, sel_setEnabled_);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_headerView);
  v6 = [WeakRetained detailHeaderLabel];
  [v6 setEnabled:v3];
}

- (void).cxx_destruct
{
}

@end