@interface WFFaceTimeContextualAction
- (WFFaceTimeContextualAction)initWithPerson:(id)a3 type:(unint64_t)a4 callTypeSerializedRepresentation:(id)a5 personSerializedRepresentation:(id)a6 namedQueryInfo:(id)a7;
- (id)uniqueIdentifier;
@end

@implementation WFFaceTimeContextualAction

- (WFFaceTimeContextualAction)initWithPerson:(id)a3 type:(unint64_t)a4 callTypeSerializedRepresentation:(id)a5 personSerializedRepresentation:(id)a6 namedQueryInfo:(id)a7
{
  v59[2] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v52 = a7;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
LABEL_28:
    v48 = [MEMORY[0x1E4F28B00] currentHandler];
    [v48 handleFailureInMethod:a2, self, @"WFFaceTimeContextualAction.m", 70, @"Invalid parameter not satisfying: %@", @"callTypeSerializedRepresentation" object file lineNumber description];

    if (v14) {
      goto LABEL_4;
    }
    goto LABEL_29;
  }
  v47 = [MEMORY[0x1E4F28B00] currentHandler];
  [v47 handleFailureInMethod:a2, self, @"WFFaceTimeContextualAction.m", 69, @"Invalid parameter not satisfying: %@", @"person" object file lineNumber description];

  if (!v13) {
    goto LABEL_28;
  }
LABEL_3:
  if (v14) {
    goto LABEL_4;
  }
LABEL_29:
  v49 = [MEMORY[0x1E4F28B00] currentHandler];
  [v49 handleFailureInMethod:a2, self, @"WFFaceTimeContextualAction.m", 71, @"Invalid parameter not satisfying: %@", @"personSerializedRepresentation" object file lineNumber description];

LABEL_4:
  v15 = @"Video";
  if (a4 == 1) {
    v15 = @"Audio";
  }
  v16 = v15;
  uint64_t v17 = WFLocalizedString(v16);
  v18 = [v12 nameComponents];
  v19 = [v18 givenName];
  v20 = v19;
  if (v19)
  {
    id v21 = v19;
  }
  else
  {
    id v21 = [v12 displayName];
  }
  v22 = v21;

  v56 = v16;
  if (![v22 length])
  {
    v23 = [v12 displayName];
    v24 = v23;
    if (v23)
    {
      id v25 = v23;
    }
    else
    {
      v26 = [v12 personHandle];
      id v25 = [v26 value];

      v22 = v26;
      v16 = v56;
    }

    v22 = v25;
  }
  v57 = [[WFContextualActionParameter alloc] initWithType:@"WFStringContentItem" displayString:v17 wfParameterKey:@"WFFaceTimeType" wfSerializedRepresentation:v13];
  v50 = v22;
  v27 = [[WFContextualActionParameter alloc] initWithType:@"WFContactContentItem" displayString:v22 wfParameterKey:@"WFFaceTimeContact" wfSerializedRepresentation:v14];
  v28 = [v12 image];
  v29 = [v28 _imageData];

  if (v29)
  {
    v30 = [WFContextualActionIcon alloc];
    [v12 image];
    v32 = unint64_t v31 = a4;
    v33 = [v32 _imageData];
    uint64_t v34 = [(WFContextualActionIcon *)v30 initWithImageData:v33 scale:1 displayStyle:2.0];

    a4 = v31;
  }
  else
  {
    uint64_t v34 = 0;
  }
  v53 = v14;
  v51 = (void *)v17;
  v35 = (void *)v34;
  if (a4 == 1)
  {
    v37 = +[WFDevice currentDevice];
    uint64_t v38 = [v37 idiom];

    if (v38 == 1)
    {
      uint64_t v39 = +[WFContextualActionIcon iconWithImageName:@"Phone"];
LABEL_25:
      v40 = (void *)v39;
      goto LABEL_26;
    }
    v36 = @"com.apple.mobilephone";
LABEL_24:
    uint64_t v39 = +[WFContextualActionIcon iconWithApplicationBundleIdentifier:v36];
    goto LABEL_25;
  }
  if (!a4)
  {
    v36 = @"com.apple.facetime";
    goto LABEL_24;
  }
  v40 = 0;
LABEL_26:
  v41 = [@"com.apple.facetime.facetime" stringByAppendingFormat:@":%@", v16];
  v59[0] = v57;
  v59[1] = v27;
  v42 = v27;
  v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:2];
  v44 = WFLocalizedString(@"%@ Call %@");
  v45 = WFLocalizedString(@"FaceTime");
  v58.receiver = self;
  v58.super_class = (Class)WFFaceTimeContextualAction;
  v55 = [(WFTopHitItemContextualAction *)&v58 initWithItem:v12 identifier:v41 wfActionIdentifier:@"com.apple.facetime.facetime" associatedAppBundleIdentifier:@"com.apple.facetime" parameters:v43 displayFormatString:v44 title:v45 subtitleFormatString:v50 primaryColor:4 icon:v35 accessoryIcon:v40 namedQueryInfo:v52];

  return v55;
}

- (id)uniqueIdentifier
{
  v3 = [(WFContextualAction *)self identifier];
  v4 = [(WFFaceTimeContextualAction *)self person];
  uint64_t v5 = [v4 contactIdentifier];
  v6 = (void *)v5;
  if (v5)
  {
    v7 = [v3 stringByAppendingFormat:@":%@", v5];
  }
  else
  {
    v8 = [(WFFaceTimeContextualAction *)self person];
    v9 = [v8 displayName];
    v7 = [v3 stringByAppendingFormat:@":%@", v9];
  }
  return v7;
}

@end