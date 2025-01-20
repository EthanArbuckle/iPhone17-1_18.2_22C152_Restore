@interface _PSFeedbackAction
+ (id)abandonment;
+ (id)engagementWithAppSuggestion:(id)a3 transportBundleID:(id)a4;
+ (id)engagementWithNonSuggestionWithEngagementIdentifier:(id)a3;
+ (id)engagementWithSharingSuggestion:(id)a3 transportBundleID:(id)a4;
- (NSString)transportBundleID;
- (_PSFeedbackAction)initWithType:(int64_t)a3 suggestion:(id)a4 transportBundleID:(id)a5;
- (_PSSuggestion)suggestion;
- (int64_t)type;
@end

@implementation _PSFeedbackAction

+ (id)engagementWithNonSuggestionWithEngagementIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithType:1 suggestion:0 transportBundleID:v4];

  return v5;
}

+ (id)engagementWithSharingSuggestion:(id)a3 transportBundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc((Class)a1);
  v9 = v8;
  if (v7)
  {
    v10 = (void *)[v8 initWithType:0 suggestion:v6 transportBundleID:v7];
  }
  else
  {
    v11 = [v6 bundleID];
    v10 = (void *)[v9 initWithType:0 suggestion:v6 transportBundleID:v11];
  }

  return v10;
}

+ (id)engagementWithAppSuggestion:(id)a3 transportBundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc((Class)a1);
  v9 = v8;
  if (v7)
  {
    v10 = (void *)[v8 initWithType:4 suggestion:v6 transportBundleID:v7];
  }
  else
  {
    v11 = [v6 bundleID];
    v10 = (void *)[v9 initWithType:4 suggestion:v6 transportBundleID:v11];
  }

  return v10;
}

+ (id)abandonment
{
  v2 = (void *)[objc_alloc((Class)a1) initWithType:2 suggestion:0 transportBundleID:0];

  return v2;
}

- (_PSFeedbackAction)initWithType:(int64_t)a3 suggestion:(id)a4 transportBundleID:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)_PSFeedbackAction;
  v11 = [(_PSFeedbackAction *)&v16 init];
  v12 = v11;
  if (v11)
  {
    v11->_type = a3;
    objc_storeStrong((id *)&v11->_suggestion, a4);
    uint64_t v13 = [v10 copy];
    transportBundleID = v12->_transportBundleID;
    v12->_transportBundleID = (NSString *)v13;
  }
  return v12;
}

- (int64_t)type
{
  return self->_type;
}

- (_PSSuggestion)suggestion
{
  return self->_suggestion;
}

- (NSString)transportBundleID
{
  return self->_transportBundleID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportBundleID, 0);

  objc_storeStrong((id *)&self->_suggestion, 0);
}

@end