@interface WFToggleFocusModeContextualAction
+ (BOOL)supportsSecureCoding;
+ (id)spotlightDomainIdentifierForBundleIdentifier:(id)a3;
+ (id)toggle:(id)a3;
+ (id)turnOff:(id)a3;
+ (id)turnOn:(id)a3;
+ (id)turnOn:(id)a3 untilEventEnds:(id)a4;
- (BOOL)isEqual:(id)a3;
- (WFContextualActionCalendarEventDescriptor)eventDescriptor;
- (WFToggleFocusModeContextualAction)initWithCoder:(id)a3;
- (WFToggleFocusModeContextualAction)initWithFocusMode:(id)a3 operation:(unint64_t)a4 event:(id)a5;
- (WFToggleFocusModeContextualActionFocusMode)focusMode;
- (id)settingBiomeStreamIdentifier;
- (id)spotlightItem;
- (id)uniqueIdentifier;
- (unint64_t)hash;
- (unint64_t)operation;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFToggleFocusModeContextualAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventDescriptor, 0);
  objc_storeStrong((id *)&self->_focusMode, 0);
}

- (WFContextualActionCalendarEventDescriptor)eventDescriptor
{
  return self->_eventDescriptor;
}

- (unint64_t)operation
{
  return self->_operation;
}

- (WFToggleFocusModeContextualActionFocusMode)focusMode
{
  return self->_focusMode;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFToggleFocusModeContextualAction;
  id v4 = a3;
  [(WFContextualAction *)&v7 encodeWithCoder:v4];
  v5 = [(WFToggleFocusModeContextualAction *)self focusMode];
  [v4 encodeObject:v5 forKey:@"focusMode"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[WFToggleFocusModeContextualAction operation](self, "operation"), @"operation");
  v6 = [(WFToggleFocusModeContextualAction *)self eventDescriptor];
  [v4 encodeObject:v6 forKey:@"eventDescriptor"];
}

- (WFToggleFocusModeContextualAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFToggleFocusModeContextualAction;
  v5 = [(WFContextualAction *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"focusMode"];
    if (v6)
    {
      uint64_t v7 = [v4 decodeIntegerForKey:@"operation"];
      uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eventDescriptor"];
      v9 = (void *)v8;
      if (v7 != 1 || v8)
      {
        objc_storeStrong((id *)&v5->_focusMode, v6);
        v5->_operation = v7;
        objc_storeStrong((id *)&v5->_eventDescriptor, v9);
        v10 = v5;
      }
      else
      {
        v10 = 0;
      }
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)spotlightItem
{
  v10.receiver = self;
  v10.super_class = (Class)WFToggleFocusModeContextualAction;
  v3 = [(WFContextualAction *)&v10 spotlightItem];
  id v4 = [v3 attributeSet];
  v5 = [(WFToggleFocusModeContextualAction *)self focusMode];
  v6 = [v5 color];
  uint64_t v7 = [v6 hexValue];
  uint64_t v8 = WFSpotlightResultRunnableTintColorNameIdentifier();
  [v4 setValue:v7 forCustomKey:v8];

  return v3;
}

- (id)settingBiomeStreamIdentifier
{
  if ([(WFToggleFocusModeContextualAction *)self operation] == 3)
  {
    uint64_t v11 = 0;
    objc_super v12 = &v11;
    uint64_t v13 = 0x2020000000;
    v2 = (void (*)(void))getBiomeLibrarySymbolLoc_ptr;
    v14 = getBiomeLibrarySymbolLoc_ptr;
    if (!getBiomeLibrarySymbolLoc_ptr)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __getBiomeLibrarySymbolLoc_block_invoke;
      v10[3] = &unk_1E6079C28;
      v10[4] = &v11;
      __getBiomeLibrarySymbolLoc_block_invoke(v10);
      v2 = (void (*)(void))v12[3];
    }
    _Block_object_dispose(&v11, 8);
    if (!v2)
    {
      uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
      v9 = [NSString stringWithUTF8String:"id<BMRootLibrary> WFBiomeLibrary(void)"];
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, @"WFToggleFocusModeContextualAction.m", 20, @"%s", dlerror());

      __break(1u);
      return result;
    }
    v3 = v2();
    id v4 = [v3 UserFocus];
    v5 = [v4 ComputedMode];
    v6 = [v5 identifier];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)WFToggleFocusModeContextualAction;
  if ([(WFContextualAction *)&v19 isEqual:v4])
  {
    id v5 = v4;
    if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v11) = 0;
LABEL_22:

      goto LABEL_23;
    }
    v6 = [v5 focusMode];
    uint64_t v7 = [(WFToggleFocusModeContextualAction *)self focusMode];
    id v8 = v6;
    id v9 = v7;
    objc_super v10 = v9;
    if (v8 == v9)
    {
    }
    else
    {
      LOBYTE(v11) = 0;
      objc_super v12 = v9;
      id v13 = v8;
      if (!v8 || !v9) {
        goto LABEL_20;
      }
      int v11 = [v8 isEqual:v9];

      if (!v11) {
        goto LABEL_21;
      }
    }
    uint64_t v14 = [v5 operation];
    if (v14 != [(WFToggleFocusModeContextualAction *)self operation])
    {
      LOBYTE(v11) = 0;
LABEL_21:

      goto LABEL_22;
    }
    v15 = [v5 eventDescriptor];
    v16 = [(WFToggleFocusModeContextualAction *)self eventDescriptor];
    id v13 = v15;
    id v17 = v16;
    objc_super v12 = v17;
    if (v13 == v17)
    {
      LOBYTE(v11) = 1;
    }
    else
    {
      LOBYTE(v11) = 0;
      if (v13 && v17) {
        LOBYTE(v11) = [v13 isEqual:v17];
      }
    }

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
  v12.super_class = (Class)WFToggleFocusModeContextualAction;
  id v4 = (id)objc_msgSend(v3, "combineInteger:", -[WFContextualAction hash](&v12, sel_hash));
  id v5 = [(WFToggleFocusModeContextualAction *)self focusMode];
  id v6 = (id)[v3 combine:v5];

  id v7 = (id)objc_msgSend(v3, "combineInteger:", -[WFToggleFocusModeContextualAction operation](self, "operation"));
  id v8 = [(WFToggleFocusModeContextualAction *)self eventDescriptor];
  id v9 = (id)[v3 combine:v8];

  unint64_t v10 = [v3 finalize];
  return v10;
}

- (id)uniqueIdentifier
{
  v11[3] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(WFToggleFocusModeContextualAction *)self operation];
  if (v3 > 3) {
    id v4 = 0;
  }
  else {
    id v4 = off_1E6077438[v3];
  }
  id v5 = [(WFContextualAction *)self identifier];
  id v6 = [(WFToggleFocusModeContextualAction *)self focusMode];
  id v7 = [v6 identifier];
  v11[1] = v7;
  v11[2] = v4;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:3];

  id v9 = [v8 componentsJoinedByString:@"."];

  return v9;
}

- (WFToggleFocusModeContextualAction)initWithFocusMode:(id)a3 operation:(unint64_t)a4 event:(id)a5
{
  v59[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if (!v9)
  {
    v49 = [MEMORY[0x1E4F28B00] currentHandler];
    [v49 handleFailureInMethod:a2, self, @"WFToggleFocusModeContextualAction.m", 133, @"Invalid parameter not satisfying: %@", @"focusMode" object file lineNumber description];
  }
  if (a4 == 1 && !v10)
  {
    v50 = [MEMORY[0x1E4F28B00] currentHandler];
    [v50 handleFailureInMethod:a2, self, @"WFToggleFocusModeContextualAction.m", 134, @"If the operation is turn on until event ends, we need an event" object file lineNumber description];
  }
  v53 = self;
  int v11 = [WFContextualActionParameter alloc];
  v57[0] = @"Identifier";
  objc_super v12 = [v9 identifier];
  v57[1] = @"DisplayString";
  v58[0] = v12;
  id v13 = [v9 name];
  v58[1] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:v57 count:2];
  v15 = [(WFContextualActionParameter *)v11 initWithType:@"WFDictionaryContentItem" displayString:0 wfParameterKey:@"FocusModes" wfSerializedRepresentation:v14];
  v59[0] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:1];

  id v17 = [v9 identifier];
  int v18 = [v17 isEqualToString:@"com.apple.donotdisturb.mode.default"];

  id v51 = v10;
  switch(a4)
  {
    case 0uLL:
    case 2uLL:
      objc_super v19 = NSString;
      if (a4)
      {
        if (v18)
        {
          v20 = @"Turn Off (Focus Mode)";
          v21 = @"Turn Off %@";
        }
        else
        {
          v20 = @"Turn Off (Focus Mode), with Focus appended";
          v21 = @"Turn Off %@ Focus";
        }
      }
      else if (v18)
      {
        v20 = @"Turn On (Focus Mode)";
        v21 = @"Turn On %@";
      }
      else
      {
        v20 = @"Turn On (Focus Mode), with Focus appended";
        v21 = @"Turn On %@ Focus";
      }
      v39 = WFLocalizedStringWithKey(v20, v21);
      v40 = [v9 name];
      v22 = objc_msgSend(v19, "stringWithFormat:", v39, v40);

      v28 = [[WFContextualActionParameter alloc] initWithType:@"WFStringContentItem" displayString:0 wfParameterKey:@"AssertionType" wfSerializedRepresentation:@"Turned Off"];
      v56[0] = v28;
      v41 = [WFContextualActionParameter alloc];
      [NSNumber numberWithBool:a4 == 0];
      v30 = (WFContextualActionParameter *)objc_claimAutoreleasedReturnValue();
      v31 = [(WFContextualActionParameter *)v41 initWithType:@"WFNumberContentItem" displayString:0 wfParameterKey:@"Enabled" wfSerializedRepresentation:v30];
      v56[1] = v31;
      v32 = (void *)MEMORY[0x1E4F1C978];
      v33 = v56;
      uint64_t v34 = 2;
      goto LABEL_24;
    case 1uLL:
      v23 = NSString;
      if (v18) {
        v24 = @"Turn On %1$@ Until %2$@ Ends";
      }
      else {
        v24 = @"Turn On %1$@ Focus Until %2$@ Ends";
      }
      v25 = WFLocalizedString(v24);
      v26 = [v9 name];
      v27 = [v10 title];
      v22 = objc_msgSend(v23, "stringWithFormat:", v25, v26, v27);

      v28 = [[WFContextualActionParameter alloc] initWithType:@"WFStringContentItem" displayString:0 wfParameterKey:@"AssertionType" wfSerializedRepresentation:@"Event Ends"];
      v55[0] = v28;
      v29 = [WFContextualActionParameter alloc];
      v30 = [(WFContextualActionParameter *)v29 initWithType:@"WFNumberContentItem" displayString:0 wfParameterKey:@"Enabled" wfSerializedRepresentation:MEMORY[0x1E4F1CC38]];
      v55[1] = v30;
      v31 = [[WFContextualActionParameter alloc] initWithType:@"WFCalendarEventContentItem" displayString:0 wfParameterKey:@"Event" isActionInput:1];
      v55[2] = v31;
      v32 = (void *)MEMORY[0x1E4F1C978];
      v33 = v55;
      uint64_t v34 = 3;
LABEL_24:
      uint64_t v42 = [v32 arrayWithObjects:v33 count:v34];
      uint64_t v38 = [v16 arrayByAddingObjectsFromArray:v42];

      v16 = (void *)v42;
      goto LABEL_25;
    case 3uLL:
      if (v18)
      {
        v22 = WFLocalizedString(@"Do Not Disturb");
      }
      else
      {
        v35 = NSString;
        v36 = WFLocalizedStringWithKey(@"Toggle (Focus Mode), with Focus appended", @"%@ Focus");
        v37 = [v9 name];
        v22 = objc_msgSend(v35, "stringWithFormat:", v36, v37);
      }
      v28 = [[WFContextualActionParameter alloc] initWithType:@"WFStringContentItem" displayString:0 wfParameterKey:@"AssertionType" wfSerializedRepresentation:@"Turned Off"];
      v54[0] = v28;
      v30 = [[WFContextualActionParameter alloc] initWithType:@"WFStringContentItem" displayString:0 wfParameterKey:@"Operation" wfSerializedRepresentation:@"Toggle"];
      v54[1] = v30;
      v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:2];
      uint64_t v38 = [v16 arrayByAddingObjectsFromArray:v31];
LABEL_25:

      v16 = (void *)v38;
      id v10 = v51;
      break;
    default:
      v22 = 0;
      break;
  }
  v43 = [v9 symbolName];
  v44 = +[WFContextualActionIcon iconWithSystemName:v43];

  v45 = WFLocalizedString(@"Focus Mode");
  v46 = [(WFContextualAction *)v53 initWithIdentifier:@"is.workflow.actions.dnd.set" wfActionIdentifier:@"is.workflow.actions.dnd.set" associatedAppBundleIdentifier:@"com.apple.Preferences" parameters:v16 displayFormatString:v22 title:v45 subtitleFormatString:v22 icon:v44];

  if (v46)
  {
    objc_storeStrong((id *)&v46->_focusMode, a3);
    v46->_operation = a4;
    objc_storeStrong((id *)&v46->_eventDescriptor, a5);
    v47 = v46;
  }

  return v46;
}

+ (id)toggle:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithFocusMode:v4 operation:3 event:0];

  return v5;
}

+ (id)turnOff:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithFocusMode:v4 operation:2 event:0];

  return v5;
}

+ (id)turnOn:(id)a3 untilEventEnds:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    int v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"WFToggleFocusModeContextualAction.m", 324, @"Invalid parameter not satisfying: %@", @"eventDescriptor" object file lineNumber description];
  }
  id v9 = (void *)[objc_alloc((Class)a1) initWithFocusMode:v7 operation:1 event:v8];

  return v9;
}

+ (id)turnOn:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithFocusMode:v4 operation:0 event:0];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)spotlightDomainIdentifierForBundleIdentifier:(id)a3
{
  return @"focus";
}

@end