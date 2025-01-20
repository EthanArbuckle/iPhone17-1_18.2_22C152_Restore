@interface NCNotificationManagementSuggestionContentProvider
- (BOOL)auxiliaryOptionsVisible;
- (NCNotificationManagementSuggestionContentProvider)initWithNotificationRequest:(id)a3 bundleDisplayName:(id)a4 managementDelegate:(id)a5 suggestionDelegate:(id)a6;
- (NCNotificationManagementSuggestionDelegate)suggestionDelegate;
- (NSString)auxiliaryOptionsSummaryText;
- (void)setAuxiliaryOptionsSummaryText:(id)a3;
- (void)setAuxiliaryOptionsVisible:(BOOL)a3;
- (void)setSuggestionDelegate:(id)a3;
@end

@implementation NCNotificationManagementSuggestionContentProvider

- (NCNotificationManagementSuggestionContentProvider)initWithNotificationRequest:(id)a3 bundleDisplayName:(id)a4 managementDelegate:(id)a5 suggestionDelegate:(id)a6
{
  id v9 = a6;
  v13.receiver = self;
  v13.super_class = (Class)NCNotificationManagementSuggestionContentProvider;
  v10 = [(NCNotificationManagementContentProvider *)&v13 initWithNotificationRequest:a3 managementDelegate:a5];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_suggestionDelegate, v9);
    v11->_auxiliaryOptionsVisible = 1;
  }

  return v11;
}

- (NSString)auxiliaryOptionsSummaryText
{
  return self->_auxiliaryOptionsSummaryText;
}

- (void)setAuxiliaryOptionsSummaryText:(id)a3
{
}

- (BOOL)auxiliaryOptionsVisible
{
  return self->_auxiliaryOptionsVisible;
}

- (void)setAuxiliaryOptionsVisible:(BOOL)a3
{
  self->_auxiliaryOptionsVisible = a3;
}

- (NCNotificationManagementSuggestionDelegate)suggestionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_suggestionDelegate);

  return (NCNotificationManagementSuggestionDelegate *)WeakRetained;
}

- (void)setSuggestionDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_suggestionDelegate);

  objc_storeStrong((id *)&self->_auxiliaryOptionsSummaryText, 0);
}

@end