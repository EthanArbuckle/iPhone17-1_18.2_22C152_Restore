@interface WTUIActionHostToClient
+ (id)_settingForActionType:(int64_t)a3 sessionUUID:(id)a4;
+ (id)actionForChangingPresentationStyle:(int64_t)a3;
+ (id)actionForDidDismissInputWarningForSessionWithUUID:(id)a3;
+ (id)actionForProofreadingSessionWithUUID:(id)a3 updateState:(int64_t)a4 forSuggestionWithUUID:(id)a5;
+ (id)actionForSourceResponderHorizontalSizeClassChanged:(int64_t)a3;
+ (id)actionForWindowingModeEnabledChanged:(BOOL)a3;
- (void)performActionForHostedWindowScene:(id)a3;
@end

@implementation WTUIActionHostToClient

+ (id)actionForProofreadingSessionWithUUID:(id)a3 updateState:(int64_t)a4 forSuggestionWithUUID:(id)a5
{
  id v8 = a5;
  v9 = [a1 _settingForActionType:1 sessionUUID:a3];
  v10 = [NSNumber numberWithInteger:a4];
  [v9 setObject:v10 forSetting:4];

  [v9 setObject:v8 forSetting:3];
  v11 = (void *)[objc_alloc((Class)a1) initWithInfo:v9 responder:0];

  return v11;
}

+ (id)_settingForActionType:(int64_t)a3 sessionUUID:(id)a4
{
  v5 = (objc_class *)MEMORY[0x263F29C78];
  id v6 = a4;
  id v7 = objc_alloc_init(v5);
  id v8 = [NSNumber numberWithInteger:a3];
  [v7 setObject:v8 forSetting:1];

  [v7 setObject:v6 forSetting:2];

  return v7;
}

+ (id)actionForChangingPresentationStyle:(int64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x263F29C78]);
  [v5 setObject:&unk_270DBA0F8 forSetting:1];
  id v6 = [NSNumber numberWithInteger:a3];
  [v5 setObject:v6 forSetting:5];

  id v7 = (void *)[objc_alloc((Class)a1) initWithInfo:v5 responder:0];

  return v7;
}

+ (id)actionForDidDismissInputWarningForSessionWithUUID:(id)a3
{
  v4 = [a1 _settingForActionType:3 sessionUUID:a3];
  id v5 = (void *)[objc_alloc((Class)a1) initWithInfo:v4 responder:0];

  return v5;
}

+ (id)actionForSourceResponderHorizontalSizeClassChanged:(int64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x263F29C78]);
  [v5 setObject:&unk_270DBA110 forSetting:1];
  id v6 = [NSNumber numberWithInteger:a3];
  [v5 setObject:v6 forSetting:6];

  id v7 = (void *)[objc_alloc((Class)a1) initWithInfo:v5 responder:0];

  return v7;
}

+ (id)actionForWindowingModeEnabledChanged:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F29C78]);
  [v5 setObject:&unk_270DBA128 forSetting:1];
  [v5 setFlag:v3 forSetting:8];
  id v6 = (void *)[objc_alloc((Class)a1) initWithInfo:v5 responder:0];

  return v6;
}

- (void)performActionForHostedWindowScene:(id)a3
{
  id v24 = a3;
  v4 = [(WTUIActionHostToClient *)self info];
  id v5 = [(WTUIActionHostToClient *)self info];
  id v6 = [v5 objectForSetting:1];
  uint64_t v7 = [v6 integerValue];

  switch(v7)
  {
    case 1:
      id v8 = [v24 delegate];
      v9 = [v4 objectForSetting:2];
      v10 = [v8 session];
      v11 = [v10 uuid];
      int v12 = [v9 isEqual:v11];

      if (v12)
      {
        v13 = [v4 objectForSetting:4];
        uint64_t v14 = [v13 integerValue];

        v15 = [v4 objectForSetting:3];
        [v8 proofreadingSessionWithUUID:v9 updateState:v14 forSuggestionWithUUID:v15];
      }
      goto LABEL_6;
    case 2:
      id v8 = [v24 delegate];
      v21 = [(WTUIActionHostToClient *)self info];
      v22 = [v21 objectForSetting:5];
      uint64_t v23 = [v22 integerValue];

      [v8 savePresentationStyle:v23];
      goto LABEL_10;
    case 3:
      id v8 = [v24 delegate];
      v9 = [v4 objectForSetting:2];
      [v8 didDismissInputWarningforSessionWithUUID:v9];
LABEL_6:

      goto LABEL_10;
    case 4:
      id v8 = [v24 delegate];
      v16 = [(WTUIActionHostToClient *)self info];
      v17 = [v16 objectForSetting:6];
      uint64_t v18 = [v17 integerValue];

      [v8 sourceResponderHorizontalSizeClassChanged:v18];
      goto LABEL_10;
    case 5:
      id v8 = [v24 delegate];
      v19 = [(WTUIActionHostToClient *)self info];
      BOOL v20 = [v19 flagForSetting:8] != 0;

      [v8 windowingModeEnabledChanged:v20];
LABEL_10:

      break;
    default:
      break;
  }
}

@end