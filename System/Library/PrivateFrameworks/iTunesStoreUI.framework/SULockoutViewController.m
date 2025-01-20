@interface SULockoutViewController
- (NSBundle)localizationBundle;
- (NSString)messageBody;
- (NSString)messageTitle;
- (SULockoutViewController)init;
- (UIImage)image;
- (id)copyArchivableContext;
- (void)dealloc;
- (void)loadView;
- (void)setImage:(id)a3;
- (void)setLocalizationBundle:(id)a3;
- (void)setMessageBody:(id)a3;
- (void)setMessageTitle:(id)a3;
@end

@implementation SULockoutViewController

- (SULockoutViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)SULockoutViewController;
  v2 = [(SUViewController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(SUViewController *)v2 setTitle:[(NSBundle *)[(SULockoutViewController *)v2 localizationBundle] localizedStringForKey:@"NO_STORE_TITLE" value:&stru_26DB8C5F8 table:0]];
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SULockoutViewController;
  [(SUViewController *)&v3 dealloc];
}

- (void)setLocalizationBundle:(id)a3
{
  localizationBundle = self->_localizationBundle;
  if (localizationBundle != a3)
  {

    self->_localizationBundle = (NSBundle *)a3;
    v6 = [(NSBundle *)[(SULockoutViewController *)self localizationBundle] localizedStringForKey:@"NO_STORE_TITLE" value:&stru_26DB8C5F8 table:0];
    [(SUViewController *)self setTitle:v6];
  }
}

- (id)copyArchivableContext
{
  return 0;
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x263F1CC50]);
  v4 = [(SULockoutViewController *)self messageTitle];
  id v5 = (id)objc_msgSend(v3, "initWithFrame:title:style:", v4, 0, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  objc_msgSend(v5, "setMessage:", -[SULockoutViewController messageBody](self, "messageBody"));
  objc_msgSend(v5, "setBackgroundColor:", objc_msgSend(MEMORY[0x263F1C550], "whiteColor"));
  [(SULockoutViewController *)self setView:v5];
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (NSBundle)localizationBundle
{
  return self->_localizationBundle;
}

- (NSString)messageBody
{
  return self->_messageBody;
}

- (void)setMessageBody:(id)a3
{
}

- (NSString)messageTitle
{
  return self->_messageTitle;
}

- (void)setMessageTitle:(id)a3
{
}

@end