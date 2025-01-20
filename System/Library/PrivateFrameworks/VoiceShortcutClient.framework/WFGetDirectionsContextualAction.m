@interface WFGetDirectionsContextualAction
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)showsUserInterfaceWhenRunning;
- (CLLocation)destination;
- (NSString)destinationName;
- (WFGetDirectionsContextualAction)initWithCoder:(id)a3;
- (WFGetDirectionsContextualAction)initWithDestination:(id)a3 name:(id)a4 type:(unint64_t)a5;
- (id)uniqueIdentifier;
- (unint64_t)hash;
- (unint64_t)navigationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFGetDirectionsContextualAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationName, 0);
  objc_storeStrong((id *)&self->_destination, 0);
}

- (unint64_t)navigationType
{
  return self->_navigationType;
}

- (NSString)destinationName
{
  return self->_destinationName;
}

- (CLLocation)destination
{
  return self->_destination;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFGetDirectionsContextualAction;
  id v4 = a3;
  [(WFContextualAction *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_destination, @"destination", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_destinationName forKey:@"destinationName"];
  [v4 encodeInteger:self->_navigationType forKey:@"navigationType"];
}

- (WFGetDirectionsContextualAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFGetDirectionsContextualAction;
  objc_super v5 = [(WFContextualAction *)&v14 initWithCoder:v4];
  if (v5)
  {
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x2050000000;
    v6 = (void *)getCLLocationClass_softClass;
    uint64_t v19 = getCLLocationClass_softClass;
    if (!getCLLocationClass_softClass)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __getCLLocationClass_block_invoke;
      v15[3] = &unk_1E6079C28;
      v15[4] = &v16;
      __getCLLocationClass_block_invoke((uint64_t)v15);
      v6 = (void *)v17[3];
    }
    id v7 = v6;
    _Block_object_dispose(&v16, 8);
    v8 = [v4 decodeObjectOfClass:v7 forKey:@"destination"];
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"destinationName"];
    uint64_t v10 = [v4 decodeIntegerForKey:@"navigationType"];
    v11 = 0;
    if (v8 && v9)
    {
      unint64_t v12 = v10;
      objc_storeStrong((id *)&v5->_destination, v8);
      objc_storeStrong((id *)&v5->_destinationName, v9);
      v5->_navigationType = v12;
      v11 = v5;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)WFGetDirectionsContextualAction;
  if ([(WFContextualAction *)&v19 isEqual:v4])
  {
    id v5 = v4;
    if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v11) = 0;
LABEL_22:

      goto LABEL_23;
    }
    v6 = [v5 destination];
    id v7 = [(WFGetDirectionsContextualAction *)self destination];
    id v8 = v6;
    id v9 = v7;
    uint64_t v10 = v9;
    if (v8 == v9)
    {
    }
    else
    {
      LOBYTE(v11) = 0;
      unint64_t v12 = v9;
      id v13 = v8;
      if (!v8 || !v9) {
        goto LABEL_20;
      }
      int v14 = [v8 isEqual:v9];

      if (!v14)
      {
        LOBYTE(v11) = 0;
LABEL_21:

        goto LABEL_22;
      }
    }
    v15 = [v5 destinationName];
    uint64_t v16 = [(WFGetDirectionsContextualAction *)self destinationName];
    id v13 = v15;
    id v17 = v16;
    unint64_t v12 = v17;
    if (v13 == v17)
    {
    }
    else
    {
      if (!v13 || !v17)
      {

        LOBYTE(v11) = 0;
        goto LABEL_20;
      }
      LODWORD(v11) = [v13 isEqualToString:v17];

      if (!v11) {
        goto LABEL_20;
      }
    }
    uint64_t v11 = [v5 navigationType];
    LOBYTE(v11) = v11 == [(WFGetDirectionsContextualAction *)self navigationType];
LABEL_20:

    goto LABEL_21;
  }
  LOBYTE(v11) = 0;
LABEL_23:

  return v11;
}

- (unint64_t)hash
{
  v3 = objc_opt_new();
  v12.receiver = self;
  v12.super_class = (Class)WFGetDirectionsContextualAction;
  id v4 = (id)objc_msgSend(v3, "combineInteger:", -[WFContextualAction hash](&v12, sel_hash));
  id v5 = [(WFGetDirectionsContextualAction *)self destination];
  id v6 = (id)[v3 combine:v5];

  id v7 = [(WFGetDirectionsContextualAction *)self destinationName];
  id v8 = (id)[v3 combineContentsOfPropertyListObject:v7];

  id v9 = (id)objc_msgSend(v3, "combineInteger:", -[WFGetDirectionsContextualAction navigationType](self, "navigationType"));
  unint64_t v10 = [v3 finalize];

  return v10;
}

- (BOOL)showsUserInterfaceWhenRunning
{
  return 1;
}

- (id)uniqueIdentifier
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v3 = [(WFContextualAction *)self identifier];
  v8[0] = v3;
  id v4 = [(WFGetDirectionsContextualAction *)self destinationName];
  v8[1] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];

  id v6 = [v5 componentsJoinedByString:@"."];

  return v6;
}

- (WFGetDirectionsContextualAction)initWithDestination:(id)a3 name:(id)a4 type:(unint64_t)a5
{
  v38[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = v10;
  v37 = v9;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2, self, @"WFGetDirectionsContextualAction.m", 35, @"Invalid parameter not satisfying: %@", @"destination" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  v33 = [MEMORY[0x1E4F28B00] currentHandler];
  [v33 handleFailureInMethod:a2, self, @"WFGetDirectionsContextualAction.m", 36, @"Invalid parameter not satisfying: %@", @"destinationName" object file lineNumber description];

LABEL_3:
  unint64_t v35 = a5;
  v36 = self;
  if (a5 > 3)
  {
    objc_super v12 = 0;
    id v13 = 0;
  }
  else
  {
    objc_super v12 = off_1E6078068[a5];
    id v13 = WFLocalizedString(v12);
  }
  int v14 = NSString;
  v15 = WFLocalizedString(@"Get %@ directions to %@");
  uint64_t v16 = objc_msgSend(v14, "stringWithFormat:", v15, v13, v11);

  id v17 = NSString;
  uint64_t v18 = WFLocalizedString(@"Get %@ Directions");
  objc_super v19 = objc_msgSend(v17, "stringWithFormat:", v18, v13);

  v20 = NSString;
  v21 = WFLocalizedStringWithKey(@"To %@ (Get Directions)", @"To %@");
  v22 = objc_msgSend(v20, "stringWithFormat:", v21, v11);

  v23 = [[WFContextualActionParameter alloc] initWithType:@"WFStringContentItem" displayString:0 wfParameterKey:@"WFGetDirectionsActionMode" wfSerializedRepresentation:v12];
  v38[0] = v23;
  v24 = [[WFContextualActionParameter alloc] initWithType:@"WFLocationContentItem" displayString:0 wfParameterKey:@"WFDestination" isActionInput:1];
  v38[1] = v24;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
  v26 = +[WFContextualActionIcon iconWithApplicationBundleIdentifier:@"com.apple.Maps"];
  v27 = [(WFContextualAction *)v36 initWithIdentifier:@"is.workflow.actions.getdirections" wfActionIdentifier:@"is.workflow.actions.getdirections" associatedAppBundleIdentifier:@"com.apple.Maps" parameters:v25 displayFormatString:v16 title:v19 subtitleFormatString:v22 icon:v26];

  if (v27)
  {
    objc_storeStrong((id *)&v27->_destination, a3);
    uint64_t v28 = [v11 copy];
    destinationName = v27->_destinationName;
    v27->_destinationName = (NSString *)v28;

    v27->_navigationType = v35;
    v30 = v27;
  }

  return v27;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end