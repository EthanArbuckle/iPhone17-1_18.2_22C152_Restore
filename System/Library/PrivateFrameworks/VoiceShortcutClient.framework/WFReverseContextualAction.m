@interface WFReverseContextualAction
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)reversalState;
- (WFContextualAction)actionToReverse;
- (WFReverseContextualAction)initWithActionToReverse:(id)a3 reversalState:(id)a4;
- (WFReverseContextualAction)initWithCoder:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFReverseContextualAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reversalState, 0);
  objc_storeStrong((id *)&self->_actionToReverse, 0);
}

- (NSData)reversalState
{
  return self->_reversalState;
}

- (WFContextualAction)actionToReverse
{
  return self->_actionToReverse;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFReverseContextualAction;
  id v4 = a3;
  [(WFContextualAction *)&v7 encodeWithCoder:v4];
  v5 = [(WFReverseContextualAction *)self actionToReverse];
  [v4 encodeObject:v5 forKey:@"actionToReverse"];

  v6 = [(WFReverseContextualAction *)self reversalState];
  [v4 encodeObject:v6 forKey:@"reversalState"];
}

- (WFReverseContextualAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFReverseContextualAction;
  v5 = [(WFContextualAction *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionToReverse"];
    actionToReverse = v5->_actionToReverse;
    v5->_actionToReverse = (WFContextualAction *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reversalState"];
    reversalState = v5->_reversalState;
    v5->_reversalState = (NSData *)v8;

    v10 = v5;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)WFReverseContextualAction;
  if ([(WFContextualAction *)&v18 isEqual:v4])
  {
    id v5 = v4;
    if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v11) = 0;
LABEL_20:

      goto LABEL_21;
    }
    uint64_t v6 = [v5 actionToReverse];
    objc_super v7 = [(WFReverseContextualAction *)self actionToReverse];
    id v8 = v6;
    id v9 = v7;
    v10 = v9;
    if (v8 == v9)
    {
    }
    else
    {
      LOBYTE(v11) = 0;
      objc_super v12 = v9;
      id v13 = v8;
      if (!v8 || !v9)
      {
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }
      int v11 = [v8 isEqual:v9];

      if (!v11) {
        goto LABEL_19;
      }
    }
    v14 = [v5 reversalState];
    v15 = [(WFReverseContextualAction *)self reversalState];
    id v13 = v14;
    id v16 = v15;
    objc_super v12 = v16;
    if (v13 == v16)
    {
      LOBYTE(v11) = 1;
    }
    else
    {
      LOBYTE(v11) = 0;
      if (v13 && v16) {
        LOBYTE(v11) = [v13 isEqual:v16];
      }
    }

    goto LABEL_18;
  }
  LOBYTE(v11) = 0;
LABEL_21:

  return v11;
}

- (unint64_t)hash
{
  v3 = objc_opt_new();
  v11.receiver = self;
  v11.super_class = (Class)WFReverseContextualAction;
  id v4 = (id)objc_msgSend(v3, "combineInteger:", -[WFContextualAction hash](&v11, sel_hash));
  id v5 = [(WFReverseContextualAction *)self actionToReverse];
  id v6 = (id)[v3 combine:v5];

  objc_super v7 = [(WFReverseContextualAction *)self reversalState];
  id v8 = (id)[v3 combineContentsOfPropertyListObject:v7];

  unint64_t v9 = [v3 finalize];
  return v9;
}

- (WFReverseContextualAction)initWithActionToReverse:(id)a3 reversalState:(id)a4
{
  v30[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"WFReverseContextualAction.m", 20, @"Invalid parameter not satisfying: %@", @"actionToReverse" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v28 = [MEMORY[0x1E4F28B00] currentHandler];
  [v28 handleFailureInMethod:a2, self, @"WFReverseContextualAction.m", 21, @"Invalid parameter not satisfying: %@", @"reversalState" object file lineNumber description];

LABEL_3:
  if ([v8 isReversible])
  {
    objc_super v11 = [v8 identifier];
    v30[0] = v11;
    v30[1] = @"reverse";
    objc_super v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
    id v13 = [v12 componentsJoinedByString:@"."];

    v14 = NSString;
    v15 = WFLocalizedString(@"Reverse '%@'");
    id v16 = [v8 displayFormatString];
    v17 = objc_msgSend(v14, "stringWithFormat:", v15, v16);

    objc_super v18 = [v8 wfActionIdentifier];
    v19 = [v8 associatedAppBundleIdentifier];
    v20 = [v8 parameters];
    v21 = [v8 icon];
    v29.receiver = self;
    v29.super_class = (Class)WFReverseContextualAction;
    self = [(WFContextualAction *)&v29 initWithIdentifier:v13 wfActionIdentifier:v18 associatedAppBundleIdentifier:v19 parameters:v20 displayFormatString:v17 title:v17 subtitleFormatString:0 icon:v21];

    if (self)
    {
      objc_storeStrong((id *)&self->_actionToReverse, a3);
      v22 = (NSData *)[v10 copy];
      reversalState = self->_reversalState;
      self->_reversalState = v22;

      v24 = self;
    }

    v25 = self;
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end