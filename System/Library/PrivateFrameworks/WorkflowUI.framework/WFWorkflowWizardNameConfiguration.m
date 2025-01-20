@interface WFWorkflowWizardNameConfiguration
+ (id)addToSiriConfiguration;
+ (id)newWorkflowConfiguration;
+ (id)tellSiriInfoText;
- (BOOL)showsHeySiri;
- (BOOL)showsSuggestions;
- (NSString)doneBarButtonTitle;
- (NSString)footerText;
- (NSString)title;
- (WFWorkflowWizardNameConfiguration)init;
- (void)setDoneBarButtonTitle:(id)a3;
- (void)setFooterText:(id)a3;
- (void)setShowsHeySiri:(BOOL)a3;
- (void)setShowsSuggestions:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation WFWorkflowWizardNameConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doneBarButtonTitle, 0);
  objc_storeStrong((id *)&self->_footerText, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)setDoneBarButtonTitle:(id)a3
{
}

- (NSString)doneBarButtonTitle
{
  return self->_doneBarButtonTitle;
}

- (void)setShowsSuggestions:(BOOL)a3
{
  self->_showsSuggestions = a3;
}

- (BOOL)showsSuggestions
{
  return self->_showsSuggestions;
}

- (void)setShowsHeySiri:(BOOL)a3
{
  self->_showsHeySiri = a3;
}

- (BOOL)showsHeySiri
{
  return self->_showsHeySiri;
}

- (void)setFooterText:(id)a3
{
}

- (NSString)footerText
{
  return self->_footerText;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (WFWorkflowWizardNameConfiguration)init
{
  v8.receiver = self;
  v8.super_class = (Class)WFWorkflowWizardNameConfiguration;
  v2 = [(WFWorkflowWizardNameConfiguration *)&v8 init];
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_showsHeySiri = 257;
    uint64_t v4 = WFLocalizedString(@"Done");
    doneBarButtonTitle = v3->_doneBarButtonTitle;
    v3->_doneBarButtonTitle = (NSString *)v4;

    v6 = v3;
  }

  return v3;
}

+ (id)tellSiriInfoText
{
  return WFLocalizedString(@"Use this name to tell Siri to run this shortcut.");
}

+ (id)addToSiriConfiguration
{
  id v3 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v4 = WFLocalizedString(@"Add to Siri");
  [v3 setTitle:v4];

  v5 = [a1 tellSiriInfoText];
  [v3 setFooterText:v5];

  return v3;
}

+ (id)newWorkflowConfiguration
{
  id v3 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v4 = WFLocalizedString(@"New Shortcut");
  [v3 setTitle:v4];

  v5 = [a1 tellSiriInfoText];
  [v3 setFooterText:v5];

  return v3;
}

@end