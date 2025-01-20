@interface ICQBuddyOfferViewController
+ (BOOL)supportsPageClassIdentifier:(id)a3;
- (ICQBuddyOfferViewController)initWithPageSpecification:(id)a3;
- (ICQPageDelegate)pageDelegate;
- (_ICQPageSpecification)pageSpecification;
- (void)bottomButtonTapped:(id)a3;
- (void)hideSpinner;
- (void)purchase2ButtonTapped:(id)a3;
- (void)purchaseButtonTapped:(id)a3;
- (void)sender:(id)a3 action:(int64_t)a4 parameters:(id)a5;
- (void)setPageDelegate:(id)a3;
@end

@implementation ICQBuddyOfferViewController

- (ICQBuddyOfferViewController)initWithPageSpecification:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_pageSpecification, a3);
  id v6 = v5;
  v7 = (void *)MEMORY[0x263F88928];
  v8 = [v6 message];
  v9 = [v6 altMessage];
  v10 = [v7 stringWithPlaceholderFormat:v8 alternateString:v9];

  v11 = [MEMORY[0x263F827E8] icqBundleImageNamed:@"iCloudLargeTransparent"];
  v12 = [v6 title];
  v45.receiver = self;
  v45.super_class = (Class)ICQBuddyOfferViewController;
  v13 = [(ICQBuddyOfferViewController *)&v45 initWithTitle:v12 detailText:v10 icon:v11 contentLayout:2];

  if (v13)
  {
    v14 = [v6 purchaseLink];
    v15 = [v14 text];
    uint64_t v16 = [v15 length];

    v17 = [v6 purchase2Link];
    v18 = [v17 text];
    uint64_t v19 = [v18 length];

    v20 = [v6 bottomLink];
    v21 = [v20 text];
    uint64_t v22 = [v21 length];

    if (v16)
    {
      v23 = [MEMORY[0x263F5B898] boldButton];
      v24 = [v6 purchaseLink];
      v25 = [v24 text];
      [v23 setTitle:v25 forState:0];

      [v23 addTarget:v13 action:sel_purchaseButtonTapped_ forControlEvents:64];
      v26 = [(ICQBuddyOfferViewController *)v13 buttonTray];
      [v26 addButton:v23];

      purchaseButton = v13->_purchaseButton;
      v13->_purchaseButton = (OBBoldTrayButton *)v23;
    }
    if (v19)
    {
      v28 = [MEMORY[0x263F5B898] boldButton];
      v29 = [v6 purchase2Link];
      v30 = [v29 text];
      [v28 setTitle:v30 forState:0];

      [v28 addTarget:v13 action:sel_purchase2ButtonTapped_ forControlEvents:64];
      v31 = [(ICQBuddyOfferViewController *)v13 buttonTray];
      [v31 addButton:v28];

      purchase2Button = v13->_purchase2Button;
      v13->_purchase2Button = (OBBoldTrayButton *)v28;
    }
    if (v22)
    {
      v33 = [MEMORY[0x263F5B8D0] linkButton];
      v34 = [v6 bottomLink];
      v35 = [v34 text];
      [v33 setTitle:v35 forState:0];

      [v33 addTarget:v13 action:sel_bottomButtonTapped_ forControlEvents:64];
      v36 = [(ICQBuddyOfferViewController *)v13 buttonTray];
      [v36 addButton:v33];
    }
    v37 = [v6 fineprintFormat];
    uint64_t v38 = [v37 length];

    if (v38)
    {
      v39 = [v6 fineprintLinks];
      v40 = [v39 firstObject];
      v41 = [v40 serverUIURL];

      v42 = [(ICQBuddyOfferViewController *)v13 buttonTray];
      v43 = [v6 fineprintFormat];
      if (v41) {
        [v42 setCaptionText:v43 learnMoreURL:v41];
      }
      else {
        [v42 setCaptionText:v43];
      }
    }
  }

  return v13;
}

+ (BOOL)supportsPageClassIdentifier:(id)a3
{
  return [a3 isEqualToString:@"_ICQUpgradeOfferPageSpecification"];
}

- (void)purchaseButtonTapped:(id)a3
{
  v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "ICQBuddyOfferViewController main button tapped", v11, 2u);
  }

  [(OBBoldTrayButton *)self->_purchaseButton showsBusyIndicator];
  id v5 = [(ICQBuddyOfferViewController *)self upgradeOfferPageSpecification];
  id v6 = [v5 purchaseLink];
  uint64_t v7 = [v6 action];
  v8 = [(ICQBuddyOfferViewController *)self upgradeOfferPageSpecification];
  v9 = [v8 purchaseLink];
  v10 = [v9 parameters];
  [(ICQBuddyOfferViewController *)self sender:self action:v7 parameters:v10];
}

- (void)purchase2ButtonTapped:(id)a3
{
  v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "ICQBuddyOfferViewController second button tapped", v11, 2u);
  }

  [(OBBoldTrayButton *)self->_purchase2Button showsBusyIndicator];
  id v5 = [(ICQBuddyOfferViewController *)self upgradeOfferPageSpecification];
  id v6 = [v5 purchase2Link];
  uint64_t v7 = [v6 action];
  v8 = [(ICQBuddyOfferViewController *)self upgradeOfferPageSpecification];
  v9 = [v8 purchase2Link];
  v10 = [v9 parameters];
  [(ICQBuddyOfferViewController *)self sender:self action:v7 parameters:v10];
}

- (void)bottomButtonTapped:(id)a3
{
  v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "ICQBuddyOfferViewController bottom button tapped", v11, 2u);
  }

  id v5 = [(ICQBuddyOfferViewController *)self upgradeOfferPageSpecification];
  id v6 = [v5 bottomLink];
  uint64_t v7 = [v6 action];
  v8 = [(ICQBuddyOfferViewController *)self upgradeOfferPageSpecification];
  v9 = [v8 bottomLink];
  v10 = [v9 parameters];
  [(ICQBuddyOfferViewController *)self sender:self action:v7 parameters:v10];
}

- (void)sender:(id)a3 action:(int64_t)a4 parameters:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a5;
  v8 = _ICQGetLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_22C821000, v8, OS_LOG_TYPE_DEFAULT, "ICQBuddyOfferViewController sender:action:parameters:", (uint8_t *)&v18, 2u);
  }

  v9 = [(ICQBuddyOfferViewController *)self pageDelegate];
  char v10 = objc_opt_respondsToSelector();

  v11 = _ICQGetLogSystem();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      v13 = [(ICQBuddyOfferViewController *)self pageDelegate];
      v14 = (objc_class *)objc_opt_class();
      v15 = NSStringFromClass(v14);
      uint64_t v16 = _ICQStringForAction();
      int v18 = 138412802;
      uint64_t v19 = v15;
      __int16 v20 = 2112;
      v21 = v16;
      __int16 v22 = 2112;
      id v23 = v7;
      _os_log_impl(&dword_22C821000, v11, OS_LOG_TYPE_DEFAULT, "pageDelegate %@ being sent action:%@ parameters:%@", (uint8_t *)&v18, 0x20u);
    }
    v11 = [(ICQBuddyOfferViewController *)self pageDelegate];
    [v11 sender:self action:a4 parameters:v7];
  }
  else if (v12)
  {
    v17 = [(ICQBuddyOfferViewController *)self pageDelegate];
    int v18 = 138412290;
    uint64_t v19 = v17;
    _os_log_impl(&dword_22C821000, v11, OS_LOG_TYPE_DEFAULT, "ICQViewController - page delegate %@ does not respond to sender:action:parameters:", (uint8_t *)&v18, 0xCu);
  }
}

- (void)hideSpinner
{
  v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_22C821000, v3, OS_LOG_TYPE_DEFAULT, "ICQBuddyOfferViewController remove spinners", v6, 2u);
  }

  purchaseButton = self->_purchaseButton;
  if (purchaseButton) {
    [(OBBoldTrayButton *)purchaseButton hidesBusyIndicator];
  }
  purchase2Button = self->_purchase2Button;
  if (purchase2Button) {
    [(OBBoldTrayButton *)purchase2Button hidesBusyIndicator];
  }
}

- (_ICQPageSpecification)pageSpecification
{
  return self->_pageSpecification;
}

- (ICQPageDelegate)pageDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pageDelegate);
  return (ICQPageDelegate *)WeakRetained;
}

- (void)setPageDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pageDelegate);
  objc_storeStrong((id *)&self->_pageSpecification, 0);
  objc_storeStrong((id *)&self->_purchase2Button, 0);
  objc_storeStrong((id *)&self->_purchaseButton, 0);
}

@end