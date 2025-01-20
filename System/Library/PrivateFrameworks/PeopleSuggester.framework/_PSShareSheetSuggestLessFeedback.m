@interface _PSShareSheetSuggestLessFeedback
- (NSString)bundleId;
- (NSString)contactId;
- (NSString)conversationId;
- (NSString)derivedIntentId;
- (NSString)handle;
- (_PSShareSheetSuggestLessFeedback)initWithBundleId:(id)a3 conversationId:(id)a4 derivedIntentId:(id)a5 handle:(id)a6 contactId:(id)a7;
- (_PSShareSheetSuggestLessFeedback)initWithBundleId:(id)a3 conversationId:(id)a4 handle:(id)a5 contactId:(id)a6;
@end

@implementation _PSShareSheetSuggestLessFeedback

- (_PSShareSheetSuggestLessFeedback)initWithBundleId:(id)a3 conversationId:(id)a4 handle:(id)a5 contactId:(id)a6
{
  return [(_PSShareSheetSuggestLessFeedback *)self initWithBundleId:a3 conversationId:a4 derivedIntentId:0 handle:a5 contactId:a6];
}

- (_PSShareSheetSuggestLessFeedback)initWithBundleId:(id)a3 conversationId:(id)a4 derivedIntentId:(id)a5 handle:(id)a6 contactId:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)_PSShareSheetSuggestLessFeedback;
  v17 = [(_PSShareSheetSuggestLessFeedback *)&v29 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    bundleId = v17->_bundleId;
    v17->_bundleId = (NSString *)v18;

    uint64_t v20 = [v13 copy];
    conversationId = v17->_conversationId;
    v17->_conversationId = (NSString *)v20;

    uint64_t v22 = [v14 copy];
    derivedIntentId = v17->_derivedIntentId;
    v17->_derivedIntentId = (NSString *)v22;

    uint64_t v24 = [v15 copy];
    handle = v17->_handle;
    v17->_handle = (NSString *)v24;

    uint64_t v26 = [v16 copy];
    contactId = v17->_contactId;
    v17->_contactId = (NSString *)v26;
  }
  return v17;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSString)conversationId
{
  return self->_conversationId;
}

- (NSString)derivedIntentId
{
  return self->_derivedIntentId;
}

- (NSString)contactId
{
  return self->_contactId;
}

- (NSString)handle
{
  return self->_handle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_contactId, 0);
  objc_storeStrong((id *)&self->_derivedIntentId, 0);
  objc_storeStrong((id *)&self->_conversationId, 0);

  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end