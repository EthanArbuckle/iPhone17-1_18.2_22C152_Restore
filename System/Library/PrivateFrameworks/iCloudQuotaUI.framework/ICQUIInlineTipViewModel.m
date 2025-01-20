@interface ICQUIInlineTipViewModel
- (AMSUIBubbleTipInlineAnchorInfo)tipArrow;
- (AMSUIMessageRequest)request;
- (ICQInlineTip)tip;
- (ICQUIInlineTipViewModel)initWithInlineTip:(id)a3;
- (id)_tipTintColorName;
@end

@implementation ICQUIInlineTipViewModel

- (ICQUIInlineTipViewModel)initWithInlineTip:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICQUIInlineTipViewModel;
  v6 = [(ICQUIInlineTipViewModel *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_tip, a3);
  }

  return v7;
}

- (AMSUIMessageRequest)request
{
  v31[3] = *MEMORY[0x263EF8340];
  v30[0] = @"background";
  v30[1] = @"imageStyle";
  v31[0] = &unk_26E01F258;
  v31[1] = &unk_26E01ED80;
  v30[2] = @"imageTintColor";
  v28[0] = @"type";
  v28[1] = @"name";
  v29[0] = @"named";
  v3 = [(ICQUIInlineTipViewModel *)self _tipTintColorName];
  v29[1] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];
  v31[2] = v4;
  id v5 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:3];

  id v6 = objc_alloc(MEMORY[0x263F28008]);
  v7 = [(ICQInlineTip *)self->_tip title];
  v8 = [(ICQInlineTip *)self->_tip subTitle];
  objc_super v9 = (void *)[v6 initWithTitle:v7 message:v8 appearanceInfo:v5];

  v10 = [MEMORY[0x263F27C08] actionWithTitle:0 style:2];
  uint64_t v11 = *MEMORY[0x263F27838];
  [v10 setIdentifier:*MEMORY[0x263F27838]];
  uint64_t v12 = [v10 userInfo];
  [(id)v12 setObject:v11 forKeyedSubscript:@"actionName"];

  [v9 addButtonAction:v10];
  v13 = [(ICQInlineTip *)self->_tip icon];
  objc_opt_class();
  LOBYTE(v12) = objc_opt_isKindOfClass();

  v14 = [(ICQInlineTip *)self->_tip icon];
  v15 = v14;
  if (v12)
  {
    v16 = (void *)MEMORY[0x263F827E8];
    v17 = [v14 path];
    v18 = [v16 systemImageNamed:v17];

    [v9 setIconImage:v18];
LABEL_5:

    goto LABEL_6;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v15 = [(ICQInlineTip *)self->_tip icon];
    v18 = [v15 imageURL];
    v20 = +[_ICQUIHelperFunctions scaledImageURL:v18];
    [v9 setIconURL:v20];

    goto LABEL_5;
  }
LABEL_6:
  v21 = [(ICQInlineTip *)self->_tip actions];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __34__ICQUIInlineTipViewModel_request__block_invoke;
  v26[3] = &unk_264922AE0;
  v26[4] = self;
  id v22 = v9;
  id v27 = v22;
  [v21 enumerateObjectsUsingBlock:v26];

  v23 = v27;
  id v24 = v22;

  return (AMSUIMessageRequest *)v24;
}

void __34__ICQUIInlineTipViewModel_request__block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x263F27C08];
  id v4 = a2;
  id v5 = [v4 buttonTitle];
  id v6 = [MEMORY[0x263F08C38] UUID];
  v7 = [v6 UUIDString];
  id v20 = [v3 actionWithTitle:v5 identifier:v7];

  v8 = [v4 actionURL];
  [v20 setDeepLink:v8];

  objc_super v9 = [*(id *)(*(void *)(a1 + 32) + 8) criteria];
  v10 = [v9 excludeApps];
  uint64_t v11 = [v20 userInfo];
  [v11 setObject:v10 forKeyedSubscript:@"excludeApps"];

  uint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 8) criteria];
  BOOL v13 = v12 != 0;

  v14 = [v4 actionName];

  v15 = [v20 userInfo];
  [v15 setObject:v14 forKeyedSubscript:@"actionName"];

  v16 = [*(id *)(*(void *)(a1 + 32) + 8) id];
  v17 = [v20 userInfo];
  [v17 setObject:v16 forKeyedSubscript:@"id"];

  v18 = [NSNumber numberWithBool:v13];
  v19 = [v20 userInfo];
  [v19 setObject:v18 forKeyedSubscript:@"isTurnOnApps"];

  [*(id *)(a1 + 40) addButtonAction:v20];
}

- (AMSUIBubbleTipInlineAnchorInfo)tipArrow
{
  v3 = [(ICQInlineTip *)self->_tip arrowConfiguration];
  int v4 = [v3 isEqualToString:*MEMORY[0x263F88888]];

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x263F27FD0]);
    double v6 = 0.5;
LABEL_10:
    uint64_t v9 = 0;
    goto LABEL_11;
  }
  v7 = [(ICQInlineTip *)self->_tip arrowConfiguration];
  int v8 = [v7 isEqualToString:*MEMORY[0x263F88870]];

  if (v8)
  {
    id v5 = objc_alloc(MEMORY[0x263F27FD0]);
    double v6 = 0.5;
LABEL_5:
    uint64_t v9 = 1;
    goto LABEL_11;
  }
  v10 = [(ICQInlineTip *)self->_tip arrowConfiguration];
  int v11 = [v10 isEqualToString:*MEMORY[0x263F88890]];

  if (v11)
  {
    id v5 = objc_alloc(MEMORY[0x263F27FD0]);
    double v6 = 0.1;
    goto LABEL_10;
  }
  uint64_t v12 = [(ICQInlineTip *)self->_tip arrowConfiguration];
  int v13 = [v12 isEqualToString:*MEMORY[0x263F88898]];

  if (v13)
  {
    id v5 = objc_alloc(MEMORY[0x263F27FD0]);
    double v6 = 0.9;
    goto LABEL_10;
  }
  v16 = [(ICQInlineTip *)self->_tip arrowConfiguration];
  int v17 = [v16 isEqualToString:*MEMORY[0x263F88878]];

  if (v17)
  {
    id v5 = objc_alloc(MEMORY[0x263F27FD0]);
    double v6 = 0.1;
    goto LABEL_5;
  }
  v18 = [(ICQInlineTip *)self->_tip arrowConfiguration];
  int v19 = [v18 isEqualToString:*MEMORY[0x263F88880]];

  id v5 = objc_alloc(MEMORY[0x263F27FD0]);
  if (v19)
  {
    double v6 = 0.9;
    goto LABEL_5;
  }
  double v6 = 0.0;
  uint64_t v9 = -1;
LABEL_11:
  v14 = (void *)[v5 initWithArrowDirection:v9 relativeArrowOffset:v6];
  return (AMSUIBubbleTipInlineAnchorInfo *)v14;
}

- (id)_tipTintColorName
{
  v3 = [(ICQInlineTip *)self->_tip icon];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [(ICQInlineTip *)self->_tip icon];
    double v6 = [v5 systemColorName];

    if (v6)
    {
      v7 = [v5 systemColorName];
    }
    else
    {
      v7 = @"blue";
    }
  }
  else
  {
    v7 = @"blue";
  }
  return v7;
}

- (ICQInlineTip)tip
{
  return self->_tip;
}

- (void).cxx_destruct
{
}

@end