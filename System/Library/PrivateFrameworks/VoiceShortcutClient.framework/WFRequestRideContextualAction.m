@interface WFRequestRideContextualAction
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)showsUserInterfaceWhenRunning;
- (CLLocation)destination;
- (NSString)applicationBundleIdentifier;
- (NSString)destinationName;
- (WFRequestRideContextualAction)initWithApplicationBundleIdentifier:(id)a3 destination:(id)a4 name:(id)a5;
- (WFRequestRideContextualAction)initWithCoder:(id)a3;
- (id)uniqueIdentifier;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFRequestRideContextualAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationName, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
}

- (NSString)destinationName
{
  return self->_destinationName;
}

- (CLLocation)destination
{
  return self->_destination;
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFRequestRideContextualAction;
  id v4 = a3;
  [(WFContextualAction *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_applicationBundleIdentifier, @"applicationBundleIdentifier", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_destination forKey:@"destination"];
  [v4 encodeObject:self->_destinationName forKey:@"destinationName"];
}

- (WFRequestRideContextualAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFRequestRideContextualAction;
  objc_super v5 = [(WFContextualAction *)&v14 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationBundleIdentifier"];
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x2050000000;
    v7 = (void *)getCLLocationClass_softClass_8850;
    uint64_t v19 = getCLLocationClass_softClass_8850;
    if (!getCLLocationClass_softClass_8850)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __getCLLocationClass_block_invoke_8851;
      v15[3] = &unk_1E6079C28;
      v15[4] = &v16;
      __getCLLocationClass_block_invoke_8851((uint64_t)v15);
      v7 = (void *)v17[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v16, 8);
    v9 = [v4 decodeObjectOfClass:v8 forKey:@"destination"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"destinationName"];
    v11 = (void *)v10;
    v12 = 0;
    if (v6 && v9 && v10)
    {
      objc_storeStrong((id *)&v5->_applicationBundleIdentifier, v6);
      objc_storeStrong((id *)&v5->_destination, v9);
      objc_storeStrong((id *)&v5->_destinationName, v11);
      v12 = v5;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)WFRequestRideContextualAction;
  if ([(WFContextualAction *)&v24 isEqual:v4])
  {
    id v5 = v4;
    if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v11) = 0;
LABEL_27:

      goto LABEL_28;
    }
    v6 = [v5 applicationBundleIdentifier];
    v7 = [(WFRequestRideContextualAction *)self applicationBundleIdentifier];
    id v8 = v6;
    id v9 = v7;
    uint64_t v10 = v9;
    if (v8 == v9)
    {
    }
    else
    {
      LOBYTE(v11) = 0;
      v12 = v9;
      id v13 = v8;
      if (!v8 || !v9) {
        goto LABEL_25;
      }
      int v14 = [v8 isEqualToString:v9];

      if (!v14)
      {
        LOBYTE(v11) = 0;
LABEL_26:

        goto LABEL_27;
      }
    }
    v15 = [v5 destination];
    uint64_t v16 = [(WFRequestRideContextualAction *)self destination];
    id v13 = v15;
    id v17 = v16;
    v12 = v17;
    if (v13 == v17)
    {
    }
    else
    {
      LOBYTE(v11) = 0;
      uint64_t v18 = v17;
      id v19 = v13;
      if (!v13 || !v17)
      {
LABEL_24:

LABEL_25:
        goto LABEL_26;
      }
      int v11 = [v13 isEqual:v17];

      if (!v11) {
        goto LABEL_25;
      }
    }
    v20 = [v5 destinationName];
    v21 = [(WFRequestRideContextualAction *)self destinationName];
    id v19 = v20;
    id v22 = v21;
    uint64_t v18 = v22;
    if (v19 == v22)
    {
      LOBYTE(v11) = 1;
    }
    else
    {
      LOBYTE(v11) = 0;
      if (v19 && v22) {
        LOBYTE(v11) = [v19 isEqualToString:v22];
      }
    }

    goto LABEL_24;
  }
  LOBYTE(v11) = 0;
LABEL_28:

  return v11;
}

- (unint64_t)hash
{
  v3 = objc_opt_new();
  v13.receiver = self;
  v13.super_class = (Class)WFRequestRideContextualAction;
  id v4 = (id)objc_msgSend(v3, "combineInteger:", -[WFContextualAction hash](&v13, sel_hash));
  id v5 = [(WFRequestRideContextualAction *)self applicationBundleIdentifier];
  id v6 = (id)[v3 combineContentsOfPropertyListObject:v5];

  v7 = [(WFRequestRideContextualAction *)self destination];
  id v8 = (id)[v3 combine:v7];

  id v9 = [(WFRequestRideContextualAction *)self destinationName];
  id v10 = (id)[v3 combineContentsOfPropertyListObject:v9];

  unint64_t v11 = [v3 finalize];
  return v11;
}

- (BOOL)showsUserInterfaceWhenRunning
{
  return 1;
}

- (id)uniqueIdentifier
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v3 = [(WFContextualAction *)self identifier];
  id v4 = [(WFRequestRideContextualAction *)self applicationBundleIdentifier];
  v12[1] = v4;
  id v5 = NSNumber;
  id v6 = [(WFRequestRideContextualAction *)self destinationName];
  v7 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "hash"));
  id v8 = [v7 stringValue];
  v12[2] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:3];

  id v10 = [v9 componentsJoinedByString:@"."];

  return v10;
}

- (WFRequestRideContextualAction)initWithApplicationBundleIdentifier:(id)a3 destination:(id)a4 name:(id)a5
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id obj = a4;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2, self, @"WFRequestRideContextualAction.m", 30, @"Invalid parameter not satisfying: %@", @"applicationBundleIdentifier" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v34 = [MEMORY[0x1E4F28B00] currentHandler];
  [v34 handleFailureInMethod:a2, self, @"WFRequestRideContextualAction.m", 31, @"Invalid parameter not satisfying: %@", @"destination" object file lineNumber description];

LABEL_3:
  v37 = v10;
  if (!v11)
  {
    v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, self, @"WFRequestRideContextualAction.m", 32, @"Invalid parameter not satisfying: %@", @"destinationName" object file lineNumber description];
  }
  v12 = NSString;
  objc_super v13 = WFLocalizedString(@"Request ride to %@");
  int v14 = objc_msgSend(v12, "stringWithFormat:", v13, v11);

  v15 = NSString;
  uint64_t v16 = WFLocalizedString(@"Request Ride");
  id v17 = objc_msgSend(v15, "stringWithFormat:", v16, v11);

  uint64_t v18 = NSString;
  id v19 = WFLocalizedString(@"To %@");
  v20 = objc_msgSend(v18, "stringWithFormat:", v19, v11);

  v21 = [WFContextualActionParameter alloc];
  v39 = @"BundleIdentifier";
  id v40 = v9;
  id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
  v23 = [(WFContextualActionParameter *)v21 initWithType:@"INAppDescriptor" displayString:0 wfParameterKey:@"IntentAppDefinition" wfSerializedRepresentation:v22];
  v41[0] = v23;
  objc_super v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1];
  v25 = +[WFContextualActionIcon iconWithApplicationBundleIdentifier:v9];
  v38.receiver = self;
  v38.super_class = (Class)WFRequestRideContextualAction;
  v26 = [(WFContextualAction *)&v38 initWithIdentifier:@"is.workflow.actions.ride.requestride" wfActionIdentifier:@"is.workflow.actions.ride.requestride" associatedAppBundleIdentifier:v9 parameters:v24 displayFormatString:v14 title:v17 subtitleFormatString:v20 icon:v25];

  if (v26)
  {
    uint64_t v27 = [v9 copy];
    applicationBundleIdentifier = v26->_applicationBundleIdentifier;
    v26->_applicationBundleIdentifier = (NSString *)v27;

    objc_storeStrong((id *)&v26->_destination, obj);
    uint64_t v29 = [v11 copy];
    destinationName = v26->_destinationName;
    v26->_destinationName = (NSString *)v29;

    v31 = v26;
  }

  return v26;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end