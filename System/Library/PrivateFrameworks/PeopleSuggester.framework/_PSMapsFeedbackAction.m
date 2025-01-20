@interface _PSMapsFeedbackAction
+ (id)engagementWithNonSuggestionWithContactIdentifier:(id)a3 handle:(id)a4;
+ (id)engagementWithSuggestionWithContactIdentifier:(id)a3 handle:(id)a4;
- (NSString)contactId;
- (NSString)handle;
- (_PSMapsFeedbackAction)initWithContactIdentifier:(id)a3 handle:(id)a4 type:(int64_t)a5;
@end

@implementation _PSMapsFeedbackAction

+ (id)engagementWithSuggestionWithContactIdentifier:(id)a3 handle:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithContactIdentifier:v7 handle:v6 type:0];

  return v8;
}

+ (id)engagementWithNonSuggestionWithContactIdentifier:(id)a3 handle:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithContactIdentifier:v7 handle:v6 type:1];

  return v8;
}

- (_PSMapsFeedbackAction)initWithContactIdentifier:(id)a3 handle:(id)a4 type:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_PSMapsFeedbackAction;
  v11 = [(_PSFeedbackAction *)&v14 initWithType:a5 suggestion:0 transportBundleID:0];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_contactId, a3);
    objc_storeStrong((id *)&v12->_handle, a4);
  }

  return v12;
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
}

@end