@interface OBAdditionalDisplayLanguageManager
- (NSString)additionalDisplayLanguage;
- (NSString)originalDisplayLanguage;
- (OBAdditionalDisplayLanguageManager)initWithDisplayLanguage:(id)a3;
- (id)didTapRightBarButtonItemForWelcomeController:(id)a3 currentDisplayLanguage:(id)a4;
- (void)configureNavigationItemRightBarButtonItemForWelcomeController:(id)a3 currentDisplayLanguage:(id)a4 action:(SEL)a5;
- (void)setAdditionalDisplayLanguage:(id)a3;
- (void)setOriginalDisplayLanguage:(id)a3;
@end

@implementation OBAdditionalDisplayLanguageManager

- (OBAdditionalDisplayLanguageManager)initWithDisplayLanguage:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)OBAdditionalDisplayLanguageManager;
  v5 = [(OBAdditionalDisplayLanguageManager *)&v10 init];
  if (v5)
  {
    v6 = (void *)[v4 copy];
    [(OBAdditionalDisplayLanguageManager *)v5 setOriginalDisplayLanguage:v6];

    v7 = +[OBCapabilities sharedCapabilities];
    v8 = [v7 additionalDisplayLanguageForDisplayLanguage:v4];
    [(OBAdditionalDisplayLanguageManager *)v5 setAdditionalDisplayLanguage:v8];
  }
  return v5;
}

- (void)configureNavigationItemRightBarButtonItemForWelcomeController:(id)a3 currentDisplayLanguage:(id)a4 action:(SEL)a5
{
  id v17 = a3;
  id v8 = a4;
  v9 = [(OBAdditionalDisplayLanguageManager *)self additionalDisplayLanguage];

  if (v9)
  {
    objc_super v10 = [(OBAdditionalDisplayLanguageManager *)self additionalDisplayLanguage];
    int v11 = [v8 isEqualToString:v10];

    if (v11) {
      [(OBAdditionalDisplayLanguageManager *)self originalDisplayLanguage];
    }
    else {
    v12 = [(OBAdditionalDisplayLanguageManager *)self additionalDisplayLanguage];
    }
    v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v14 = +[OBUtilities localizedString:@"ALTERNATE_LANGUAGE_BUTTON_TITLE" forTable:@"Localizable" inBundle:v13 forLanguage:v12];

    v15 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:v14 style:0 target:v17 action:a5];
    v16 = [v17 navigationItem];
    [v16 setRightBarButtonItem:v15];
  }
}

- (id)didTapRightBarButtonItemForWelcomeController:(id)a3 currentDisplayLanguage:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 scrollView];
  objc_msgSend(v8, "setContentOffset:animated:", 0, 0.0, 0.0);

  [v7 updateNavigationBarAnimated:0];
  v9 = [(OBAdditionalDisplayLanguageManager *)self additionalDisplayLanguage];
  LODWORD(v8) = [v9 isEqualToString:v6];

  if (v8) {
    [(OBAdditionalDisplayLanguageManager *)self originalDisplayLanguage];
  }
  else {
  objc_super v10 = [(OBAdditionalDisplayLanguageManager *)self additionalDisplayLanguage];
  }
  return v10;
}

- (NSString)originalDisplayLanguage
{
  return self->_originalDisplayLanguage;
}

- (void)setOriginalDisplayLanguage:(id)a3
{
}

- (NSString)additionalDisplayLanguage
{
  return self->_additionalDisplayLanguage;
}

- (void)setAdditionalDisplayLanguage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalDisplayLanguage, 0);
  objc_storeStrong((id *)&self->_originalDisplayLanguage, 0);
}

@end