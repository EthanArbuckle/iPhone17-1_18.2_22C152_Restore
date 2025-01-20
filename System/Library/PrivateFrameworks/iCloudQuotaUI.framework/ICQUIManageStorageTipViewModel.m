@interface ICQUIManageStorageTipViewModel
- (AMSUIMessageRequest)request;
- (ICQUIManageStorageTipViewModel)initWithSectionAttributes:(id)a3 rows:(id)a4;
- (ICQUIManageStorageTipViewModel)initWithTipInfo:(id)a3;
@end

@implementation ICQUIManageStorageTipViewModel

- (ICQUIManageStorageTipViewModel)initWithTipInfo:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F88900]);
  v27.receiver = self;
  v27.super_class = (Class)ICQUIManageStorageTipViewModel;
  v6 = [(ICQUIInlineTipViewModel *)&v27 initWithInlineTip:v5];

  if (!v6) {
    goto LABEL_11;
  }
  uint64_t v7 = [v4 title];
  title = v6->_title;
  v6->_title = (NSString *)v7;

  uint64_t v9 = [v4 subtitle];
  subTitle = v6->_subTitle;
  v6->_subTitle = (NSString *)v9;

  v11 = [v4 icon];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  v13 = [v4 icon];
  v14 = v13;
  if (isKindOfClass)
  {
    uint64_t v15 = [v13 path];
    systemIconName = v6->_systemIconName;
    v6->_systemIconName = (NSString *)v15;

    uint64_t v17 = [v14 systemColorName];
    uint64_t v18 = 48;
  }
  else
  {
    objc_opt_class();
    char v19 = objc_opt_isKindOfClass();

    if ((v19 & 1) == 0) {
      goto LABEL_7;
    }
    v14 = [v4 icon];
    uint64_t v17 = [v14 imageURL];
    uint64_t v18 = 56;
  }
  v20 = *(Class *)((char *)&v6->super.super.isa + v18);
  *(Class *)((char *)&v6->super.super.isa + v18) = (Class)v17;

LABEL_7:
  v21 = [v4 actions];
  uint64_t v22 = +[ICQUIManageStorageTipAction actionsFromActionInfos:v21];
  actions = v6->_actions;
  v6->_actions = (NSArray *)v22;

  if (!v6->_systemColor)
  {
    v24 = _ICQGetLogSystem();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[ICQUIManageStorageTipViewModel initWithTipInfo:]();
    }

    systemColor = v6->_systemColor;
    v6->_systemColor = (NSString *)@"labelColor";
  }
LABEL_11:

  return v6;
}

- (ICQUIManageStorageTipViewModel)initWithSectionAttributes:(id)a3 rows:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263F88900]);
  v29.receiver = self;
  v29.super_class = (Class)ICQUIManageStorageTipViewModel;
  uint64_t v9 = [(ICQUIInlineTipViewModel *)&v29 initWithInlineTip:v8];

  if (v9)
  {
    uint64_t v10 = [v6 objectForKeyedSubscript:@"title"];
    title = v9->_title;
    v9->_title = (NSString *)v10;

    uint64_t v12 = [v6 objectForKeyedSubscript:@"subTitle"];
    subTitle = v9->_subTitle;
    v9->_subTitle = (NSString *)v12;

    uint64_t v14 = [v6 objectForKeyedSubscript:@"systemIcon"];
    systemIconName = v9->_systemIconName;
    v9->_systemIconName = (NSString *)v14;

    uint64_t v16 = [v6 objectForKeyedSubscript:@"id"];
    sectionID = v9->_sectionID;
    v9->_sectionID = (NSString *)v16;

    uint64_t v18 = [v6 objectForKeyedSubscript:@"systemColor"];
    systemColor = v9->_systemColor;
    v9->_systemColor = (NSString *)v18;

    v20 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v7, "count"));
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __65__ICQUIManageStorageTipViewModel_initWithSectionAttributes_rows___block_invoke;
    v27[3] = &unk_264922A68;
    id v21 = v20;
    id v28 = v21;
    [v7 enumerateObjectsUsingBlock:v27];
    uint64_t v22 = [v21 copy];
    actions = v9->_actions;
    v9->_actions = (NSArray *)v22;

    if (!v9->_systemColor)
    {
      v24 = _ICQGetLogSystem();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[ICQUIManageStorageTipViewModel initWithSectionAttributes:rows:]();
      }

      v25 = v9->_systemColor;
      v9->_systemColor = (NSString *)@"labelColor";
    }
  }

  return v9;
}

void __65__ICQUIManageStorageTipViewModel_initWithSectionAttributes_rows___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [[ICQUIManageStorageTipAction alloc] initFromRUITableViewRow:v3];

  [v2 addObject:v4];
}

- (AMSUIMessageRequest)request
{
  v18[3] = *MEMORY[0x263EF8340];
  v17[0] = @"background";
  v17[1] = @"imageStyle";
  v18[0] = &unk_26E01F208;
  v18[1] = &unk_26E01ED68;
  v17[2] = @"imageTintColor";
  v15[0] = @"type";
  v15[1] = @"name";
  systemColor = self->_systemColor;
  v16[0] = @"named";
  v16[1] = systemColor;
  id v4 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
  v18[2] = v4;
  id v5 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];

  id v6 = (void *)[objc_alloc(MEMORY[0x263F28008]) initWithTitle:self->_title message:self->_subTitle appearanceInfo:v5];
  if (self->_systemIconName)
  {
    id v7 = objc_msgSend(MEMORY[0x263F827E8], "systemImageNamed:");
    [v6 setIconImage:v7];
LABEL_5:

    goto LABEL_6;
  }
  if (self->_iconURL)
  {
    id v7 = +[_ICQUIHelperFunctions scaledImageURL:](_ICQUIHelperFunctions, "scaledImageURL:");
    [v6 setIconURL:v7];
    goto LABEL_5;
  }
LABEL_6:
  actions = self->_actions;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __41__ICQUIManageStorageTipViewModel_request__block_invoke;
  v13[3] = &unk_264922A90;
  v13[4] = self;
  id v9 = v6;
  id v14 = v9;
  [(NSArray *)actions enumerateObjectsUsingBlock:v13];
  uint64_t v10 = v14;
  id v11 = v9;

  return (AMSUIMessageRequest *)v11;
}

void __41__ICQUIManageStorageTipViewModel_request__block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263F27C08];
  id v4 = a2;
  id v5 = [v4 actionButtonText];
  id v6 = [MEMORY[0x263F08C38] UUID];
  id v7 = [v6 UUIDString];
  id v14 = [v3 actionWithTitle:v5 identifier:v7];

  id v8 = [v4 actionURL];
  [v14 setDeepLink:v8];

  id v9 = [v4 actionName];

  uint64_t v10 = [v14 userInfo];
  [v10 setObject:v9 forKeyedSubscript:@"actionName"];

  uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 40);
  uint64_t v12 = [v14 userInfo];
  [v12 setObject:v11 forKeyedSubscript:@"id"];

  v13 = [v14 userInfo];
  [v13 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"isManageStorageTip"];

  [*(id *)(a1 + 40) addButtonAction:v14];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_iconURL, 0);
  objc_storeStrong((id *)&self->_systemColor, 0);
  objc_storeStrong((id *)&self->_sectionID, 0);
  objc_storeStrong((id *)&self->_systemIconName, 0);
  objc_storeStrong((id *)&self->_subTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)initWithTipInfo:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_3();
  _os_log_error_impl(&dword_22C821000, v0, OS_LOG_TYPE_ERROR, "%s no image system color provided in tipInfo %@, using UIColor labelColor.", (uint8_t *)v1, 0x16u);
}

- (void)initWithSectionAttributes:rows:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_3();
  _os_log_error_impl(&dword_22C821000, v0, OS_LOG_TYPE_ERROR, "%s no image system color provided in attributes %@, using UIColor labelColor.", (uint8_t *)v1, 0x16u);
}

@end