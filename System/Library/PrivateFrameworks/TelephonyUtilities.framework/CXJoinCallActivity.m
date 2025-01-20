@interface CXJoinCallActivity
+ (CXJoinCallActivity)activityWithTUConversationActivity:(id)a3;
- (TUConversationActivity)tuActivity;
@end

@implementation CXJoinCallActivity

+ (CXJoinCallActivity)activityWithTUConversationActivity:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)CXJoinCallActivity);
  v5 = [v3 bundleIdentifier];
  v6 = [v3 metadata];
  v7 = [v6 serializedData];
  v8 = [v3 applicationContext];
  v9 = [v3 activityIdentifier];
  id v10 = [v4 initWithBundleIdentifier:v5 metadata:v7 applicationContext:v8 activityIdentifier:v9];

  v11 = [v3 UUID];
  [v10 setUUID:v11];

  id v12 = [v3 startWhenStaged];
  [v10 setStartWhenStaged:v12];

  return (CXJoinCallActivity *)v10;
}

- (TUConversationActivity)tuActivity
{
  id v3 = objc_alloc((Class)TUConversationActivity);
  id v4 = [(CXJoinCallActivity *)self metadata];
  v5 = +[TUConversationActivityMetadata activityMetadataWithDataBlob:v4];
  v6 = [(CXJoinCallActivity *)self applicationContext];
  v7 = [(CXJoinCallActivity *)self UUID];
  v8 = [(CXJoinCallActivity *)self activityIdentifier];
  id v9 = [v3 initWithMetadata:v5 applicationContext:v6 uuid:v7 activityIdentifier:v8];

  id v10 = [(CXJoinCallActivity *)self bundleIdentifier];
  [v9 setBundleIdentifier:v10];

  objc_msgSend(v9, "setStartWhenStaged:", -[CXJoinCallActivity startWhenStaged](self, "startWhenStaged"));

  return (TUConversationActivity *)v9;
}

@end