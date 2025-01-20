@interface WFStartPhoneCallContextualAction
+ (void)getTopHitContextualActionsWithLimit:(int64_t)a3 completion:(id)a4;
- (WFStartPhoneCallContextualAction)initWithPerson:(id)a3 serializedRepresentation:(id)a4 namedQueryInfo:(id)a5;
- (id)uniqueIdentifier;
@end

@implementation WFStartPhoneCallContextualAction

- (WFStartPhoneCallContextualAction)initWithPerson:(id)a3 serializedRepresentation:(id)a4 namedQueryInfo:(id)a5
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v37 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2, self, @"WFStartPhoneCallContextualAction.m", 33, @"Invalid parameter not satisfying: %@", @"person" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v35 = [MEMORY[0x1E4F28B00] currentHandler];
  [v35 handleFailureInMethod:a2, self, @"WFStartPhoneCallContextualAction.m", 34, @"Invalid parameter not satisfying: %@", @"serializedRepresentation" object file lineNumber description];

LABEL_3:
  v11 = [v9 nameComponents];
  v12 = [v11 givenName];
  v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v14 = [v9 displayName];
  }
  v15 = v14;

  if (![v15 length])
  {
    v16 = [v9 displayName];
    v17 = v16;
    if (v16)
    {
      id v18 = v16;
    }
    else
    {
      v19 = [v9 personHandle];
      id v18 = [v19 value];

      v15 = v19;
    }

    v15 = v18;
  }
  v20 = [[WFContextualActionParameter alloc] initWithType:@"WFContactContentItem" displayString:v15 wfParameterKey:@"WFCallContact" wfSerializedRepresentation:v10];
  v21 = [v9 image];
  v22 = [v21 _imageData];

  v23 = [WFContextualActionIcon alloc];
  v24 = v23;
  v36 = v10;
  if (v22)
  {
    v25 = [v9 image];
    v26 = [v25 _imageData];
    v27 = [(WFContextualActionIcon *)v24 initWithImageData:v26 scale:1 displayStyle:2.0];
  }
  else
  {
    v27 = [(WFContextualActionIcon *)v23 initWithSystemName:@"person.fill"];
  }
  v39[0] = v20;
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];
  v29 = WFLocalizedString(@"Call %@");
  v30 = WFLocalizedString(@"Start Call");
  v31 = +[WFContextualActionIcon iconWithApplicationBundleIdentifier:@"com.apple.mobilephone"];
  v38.receiver = self;
  v38.super_class = (Class)WFStartPhoneCallContextualAction;
  v32 = [(WFTopHitItemContextualAction *)&v38 initWithItem:v9 identifier:@"com.apple.mobilephone.call" wfActionIdentifier:@"com.apple.mobilephone.call" associatedAppBundleIdentifier:@"com.apple.mobilephone" parameters:v28 displayFormatString:v29 title:v30 subtitleFormatString:v15 primaryColor:4 icon:v27 accessoryIcon:v31 namedQueryInfo:v37];

  return v32;
}

- (id)uniqueIdentifier
{
  v3 = [(WFContextualAction *)self identifier];
  v4 = [(WFStartPhoneCallContextualAction *)self person];
  uint64_t v5 = [v4 contactIdentifier];
  v6 = (void *)v5;
  if (v5)
  {
    v7 = [v3 stringByAppendingFormat:@":%@", v5];
  }
  else
  {
    v8 = [(WFStartPhoneCallContextualAction *)self person];
    id v9 = [v8 displayName];
    v7 = [v3 stringByAppendingFormat:@":%@", v9];
  }
  return v7;
}

+ (void)getTopHitContextualActionsWithLimit:(int64_t)a3 completion:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F28C58];
  id v6 = a4;
  id v7 = [v5 errorWithDomain:@"TopHitItemContextualActionError" code:0 userInfo:0];
  (*((void (**)(id, void, id))a4 + 2))(v6, 0, v7);
}

@end