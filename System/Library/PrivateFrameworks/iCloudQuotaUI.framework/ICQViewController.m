@interface ICQViewController
+ (BOOL)supportsPageClassIdentifier:(id)a3;
+ (Class)viewControllerClassForPageClassIdentifier:(id)a3;
- (ICQPageDelegate)pageDelegate;
- (ICQViewController)initWithCoder:(id)a3;
- (ICQViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (ICQViewController)initWithPageSpecification:(id)a3;
- (UIColor)buttonTintColor;
- (_ICQPageSpecification)pageSpecification;
- (void)sender:(id)a3 action:(int64_t)a4 parameters:(id)a5;
- (void)setButtonTintColor:(id)a3;
- (void)setPageDelegate:(id)a3;
@end

@implementation ICQViewController

+ (Class)viewControllerClassForPageClassIdentifier:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"_ICQUpgradeOfferPageSpecification"] & 1) != 0
    || [v3 isEqualToString:@"_ICQUpgradeCompletePageSpecification"])
  {
    v4 = objc_opt_class();
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  return v5;
}

- (ICQViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[ICQViewController initWithPageSpecification:](self, "initWithPageSpecification:", 0, a4);
}

- (ICQViewController)initWithCoder:(id)a3
{
  return [(ICQViewController *)self initWithPageSpecification:0];
}

- (ICQViewController)initWithPageSpecification:(id)a3
{
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    v9 = [v5 pageClassIdentifier];
    v10 = +[ICQViewController viewControllerClassForPageClassIdentifier:v9];

    if ((ICQViewController *)objc_opt_class() == self)
    {
      v11 = _ICQGetLogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C821000, v11, OS_LOG_TYPE_DEFAULT, "internal error: improper class returned", buf, 2u);
      }

      v8 = 0;
    }
    else
    {
      v8 = (ICQViewController *)[[v10 alloc] initWithPageSpecification:v5];
    }
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)ICQViewController;
    v7 = [(ICQViewController *)&v13 initWithNibName:0 bundle:0];
    v8 = v7;
    if (v7) {
      objc_storeStrong((id *)&v7->_pageSpecification, a3);
    }
  }

  return v8;
}

+ (BOOL)supportsPageClassIdentifier:(id)a3
{
  return 0;
}

- (void)sender:(id)a3 action:(int64_t)a4 parameters:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a5;
  v8 = _ICQGetLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_22C821000, v8, OS_LOG_TYPE_DEFAULT, "ICQViewController sender:action:parameters:", (uint8_t *)&v18, 2u);
  }

  v9 = [(ICQViewController *)self pageDelegate];
  char v10 = objc_opt_respondsToSelector();

  v11 = _ICQGetLogSystem();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      objc_super v13 = [(ICQViewController *)self pageDelegate];
      v14 = (objc_class *)objc_opt_class();
      v15 = NSStringFromClass(v14);
      v16 = _ICQStringForAction();
      int v18 = 138412802;
      v19 = v15;
      __int16 v20 = 2112;
      v21 = v16;
      __int16 v22 = 2112;
      id v23 = v7;
      _os_log_impl(&dword_22C821000, v11, OS_LOG_TYPE_DEFAULT, "pageDelegate %@ being sent action:%@ parameters:%@", (uint8_t *)&v18, 0x20u);
    }
    v11 = [(ICQViewController *)self pageDelegate];
    [v11 sender:self action:a4 parameters:v7];
  }
  else if (v12)
  {
    v17 = [(ICQViewController *)self pageDelegate];
    int v18 = 138412290;
    v19 = v17;
    _os_log_impl(&dword_22C821000, v11, OS_LOG_TYPE_DEFAULT, "ICQViewController - page delegate %@ does not respond to sender:action:parameters:", (uint8_t *)&v18, 0xCu);
  }
}

- (_ICQPageSpecification)pageSpecification
{
  return self->_pageSpecification;
}

- (UIColor)buttonTintColor
{
  return self->_buttonTintColor;
}

- (void)setButtonTintColor:(id)a3
{
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
  objc_storeStrong((id *)&self->_buttonTintColor, 0);
  objc_storeStrong((id *)&self->_pageSpecification, 0);
}

@end