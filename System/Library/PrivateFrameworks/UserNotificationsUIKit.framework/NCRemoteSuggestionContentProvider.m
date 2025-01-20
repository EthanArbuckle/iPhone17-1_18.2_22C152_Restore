@interface NCRemoteSuggestionContentProvider
- (NCRemoteSuggestionContentProvider)initWithNotificationRequest:(id)a3 bundleDisplayName:(id)a4 managementDelegate:(id)a5 suggestionDelegate:(id)a6 uuid:(id)a7;
- (NSUUID)uuid;
@end

@implementation NCRemoteSuggestionContentProvider

- (NCRemoteSuggestionContentProvider)initWithNotificationRequest:(id)a3 bundleDisplayName:(id)a4 managementDelegate:(id)a5 suggestionDelegate:(id)a6 uuid:(id)a7
{
  id v13 = a7;
  v17.receiver = self;
  v17.super_class = (Class)NCRemoteSuggestionContentProvider;
  v14 = [(NCNotificationManagementSuggestionContentProvider *)&v17 initWithNotificationRequest:a3 bundleDisplayName:a4 managementDelegate:a5 suggestionDelegate:a6];
  v15 = v14;
  if (v14) {
    objc_storeStrong((id *)&v14->_uuid, a7);
  }

  return v15;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void).cxx_destruct
{
}

@end