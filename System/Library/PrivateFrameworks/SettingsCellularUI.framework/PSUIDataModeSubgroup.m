@interface PSUIDataModeSubgroup
- (BOOL)shouldShowLinkCell;
- (PSUIDataModeSubgroup)initWithHostController:(id)a3 parentSpecifier:(id)a4 dataCache:(id)a5 context:(id)a6 ctClient:(id)a7;
- (PSUIDataModeSubgroup)initWithListController:(id)a3 groupSpecifier:(id)a4;
- (id)specifiers;
@end

@implementation PSUIDataModeSubgroup

- (PSUIDataModeSubgroup)initWithHostController:(id)a3 parentSpecifier:(id)a4 dataCache:(id)a5 context:(id)a6 ctClient:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v25.receiver = self;
  v25.super_class = (Class)PSUIDataModeSubgroup;
  v17 = [(PSUIDataModeSubgroup *)&v25 init];
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_hostController, v12);
    objc_storeWeak((id *)&v18->_parentSpecifier, v13);
    objc_storeWeak((id *)&v18->_dataCache, v14);
    objc_storeWeak((id *)&v18->_context, v15);
    v19 = [PSUIDataModeSpecifier alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&v18->_hostController);
    id v21 = objc_loadWeakRetained((id *)&v18->_parentSpecifier);
    uint64_t v22 = [(PSUIDataModeSpecifier *)v19 initWithCTClient:v16 hostController:WeakRetained parentSpecifier:v21];
    dataModeSpecifier = v18->_dataModeSpecifier;
    v18->_dataModeSpecifier = (PSUIDataModeSpecifier *)v22;

    [(PSUIDataModeSpecifier *)v18->_dataModeSpecifier setIdentifier:@"DATA_MODE"];
  }

  return v18;
}

- (id)specifiers
{
  v18[3] = *MEMORY[0x263EF8340];
  v3 = [PSUIPrivacyProxySpecifier alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataCache);
  id v5 = objc_loadWeakRetained((id *)&self->_context);
  v6 = [(PSUIPrivacyProxySpecifier *)v3 initWithDataCache:WeakRetained context:v5];

  if ([(PSUIDataModeSpecifier *)self->_dataModeSpecifier showDataMode] == 2)
  {
    v18[0] = self->_dataModeSpecifier;
    v7 = [(PSUIPrivacyProxySpecifier *)v6 groupSpecifier];
    v18[1] = v7;
    v18[2] = v6;
    v8 = (void *)MEMORY[0x263EFF8C0];
    v9 = (void **)v18;
    uint64_t v10 = 3;
  }
  else
  {
    if ([(PSUIDataModeSpecifier *)self->_dataModeSpecifier showDataMode] == 1)
    {
      v7 = [(PSUIDataModeSpecifier *)self->_dataModeSpecifier lowDataModeGroupSpecifier];
      dataModeSpecifier = self->_dataModeSpecifier;
      v17[0] = v7;
      v17[1] = dataModeSpecifier;
      id v12 = [(PSUIPrivacyProxySpecifier *)v6 groupSpecifier];
      v17[2] = v12;
      v17[3] = v6;
      id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:4];

      goto LABEL_7;
    }
    v7 = [(PSUIPrivacyProxySpecifier *)v6 groupSpecifier];
    id v15 = v7;
    id v16 = v6;
    v8 = (void *)MEMORY[0x263EFF8C0];
    v9 = &v15;
    uint64_t v10 = 2;
  }
  id v13 = objc_msgSend(v8, "arrayWithObjects:count:", v9, v10, v15, v16);
LABEL_7:

  return v13;
}

- (BOOL)shouldShowLinkCell
{
  return [(PSUIDataModeSpecifier *)self->_dataModeSpecifier showDataMode] == 2;
}

- (PSUIDataModeSubgroup)initWithListController:(id)a3 groupSpecifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_exception_throw((id)[objc_alloc(MEMORY[0x263EFF940]) initWithName:@"Unsupported initializer called" reason:@"Unsupported initializer called" userInfo:0]);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataModeSpecifier, 0);
  objc_destroyWeak((id *)&self->_context);
  objc_destroyWeak((id *)&self->_dataCache);
  objc_destroyWeak((id *)&self->_parentSpecifier);
  objc_destroyWeak((id *)&self->_hostController);
}

@end