@interface WFToggleAlarmContextualAction
+ (BOOL)supportsSecureCoding;
+ (id)spotlightDomainIdentifierForBundleIdentifier:(id)a3;
- (BOOL)availableFromLockedContext;
- (BOOL)isEqual:(id)a3;
- (BOOL)showsUserInterfaceWhenRunning;
- (NSString)alarmIdentifier;
- (NSString)alarmName;
- (WFToggleAlarmContextualAction)initWithAlarmIdentifier:(id)a3 alarmName:(id)a4 alarmData:(id)a5 operation:(unint64_t)a6;
- (WFToggleAlarmContextualAction)initWithAlarmIdentifier:(id)a3 alarmName:(id)a4 operation:(unint64_t)a5;
- (WFToggleAlarmContextualAction)initWithCoder:(id)a3;
- (id)settingBiomeStreamIdentifier;
- (id)uniqueIdentifier;
- (unint64_t)hash;
- (unint64_t)operation;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFToggleAlarmContextualAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarmName, 0);
  objc_storeStrong((id *)&self->_alarmIdentifier, 0);
}

- (unint64_t)operation
{
  return self->_operation;
}

- (NSString)alarmName
{
  return self->_alarmName;
}

- (NSString)alarmIdentifier
{
  return self->_alarmIdentifier;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFToggleAlarmContextualAction;
  id v4 = a3;
  [(WFContextualAction *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_alarmIdentifier, @"alarmIdentifier", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_alarmName forKey:@"alarmName"];
  [v4 encodeInteger:self->_operation forKey:@"operation"];
}

- (WFToggleAlarmContextualAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WFToggleAlarmContextualAction;
  objc_super v5 = [(WFContextualAction *)&v13 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"alarmIdentifier"];
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"alarmName"];
    uint64_t v8 = [v4 decodeIntegerForKey:@"operation"];
    if (v6) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9)
    {
      v11 = 0;
    }
    else
    {
      unint64_t v10 = v8;
      objc_storeStrong((id *)&v5->_alarmIdentifier, v6);
      objc_storeStrong((id *)&v5->_alarmName, v7);
      v5->_operation = v10;
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
  v19.super_class = (Class)WFToggleAlarmContextualAction;
  if ([(WFContextualAction *)&v19 isEqual:v4])
  {
    id v5 = v4;
    if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v11) = 0;
LABEL_22:

      goto LABEL_23;
    }
    v6 = [v5 alarmIdentifier];
    v7 = [(WFToggleAlarmContextualAction *)self alarmIdentifier];
    id v8 = v6;
    id v9 = v7;
    unint64_t v10 = v9;
    if (v8 == v9)
    {
    }
    else
    {
      LOBYTE(v11) = 0;
      v12 = v9;
      id v13 = v8;
      if (!v8 || !v9) {
        goto LABEL_20;
      }
      int v14 = [v8 isEqualToString:v9];

      if (!v14)
      {
        LOBYTE(v11) = 0;
LABEL_21:

        goto LABEL_22;
      }
    }
    v15 = [v5 alarmName];
    v16 = [(WFToggleAlarmContextualAction *)self alarmName];
    id v13 = v15;
    id v17 = v16;
    v12 = v17;
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
    uint64_t v11 = [v5 operation];
    LOBYTE(v11) = v11 == [(WFToggleAlarmContextualAction *)self operation];
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
  v12.super_class = (Class)WFToggleAlarmContextualAction;
  id v4 = (id)objc_msgSend(v3, "combineInteger:", -[WFContextualAction hash](&v12, sel_hash));
  id v5 = [(WFToggleAlarmContextualAction *)self alarmIdentifier];
  id v6 = (id)[v3 combineContentsOfPropertyListObject:v5];

  v7 = [(WFToggleAlarmContextualAction *)self alarmName];
  id v8 = (id)[v3 combineContentsOfPropertyListObject:v7];

  id v9 = (id)objc_msgSend(v3, "combineInteger:", -[WFToggleAlarmContextualAction operation](self, "operation"));
  unint64_t v10 = [v3 finalize];

  return v10;
}

- (BOOL)showsUserInterfaceWhenRunning
{
  return [(WFToggleAlarmContextualAction *)self operation] != 2;
}

- (id)uniqueIdentifier
{
  v10[3] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(WFToggleAlarmContextualAction *)self operation];
  if (v3 > 3) {
    id v4 = 0;
  }
  else {
    id v4 = off_1E60796D8[v3];
  }
  id v5 = [(WFContextualAction *)self identifier];
  id v6 = [(WFToggleAlarmContextualAction *)self alarmIdentifier];
  v10[1] = v6;
  v10[2] = v4;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:3];

  id v8 = [v7 componentsJoinedByString:@"."];

  return v8;
}

- (BOOL)availableFromLockedContext
{
  return 1;
}

- (id)settingBiomeStreamIdentifier
{
  if ([(WFToggleAlarmContextualAction *)self operation] == 2)
  {
    uint64_t v11 = 0;
    objc_super v12 = &v11;
    uint64_t v13 = 0x2020000000;
    v2 = (void (*)(void))getBiomeLibrarySymbolLoc_ptr_19949;
    int v14 = getBiomeLibrarySymbolLoc_ptr_19949;
    if (!getBiomeLibrarySymbolLoc_ptr_19949)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __getBiomeLibrarySymbolLoc_block_invoke_19950;
      v10[3] = &unk_1E6079C28;
      void v10[4] = &v11;
      __getBiomeLibrarySymbolLoc_block_invoke_19950(v10);
      v2 = (void (*)(void))v12[3];
    }
    _Block_object_dispose(&v11, 8);
    if (!v2)
    {
      id v8 = [MEMORY[0x1E4F28B00] currentHandler];
      id v9 = [NSString stringWithUTF8String:"id<BMRootLibrary> WFBiomeLibrary(void)"];
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, @"WFToggleAlarmContextualAction.m", 19, @"%s", dlerror());

      __break(1u);
      return result;
    }
    unint64_t v3 = v2();
    id v4 = [v3 Clock];
    id v5 = [v4 Alarm];
    id v6 = [v5 identifier];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (WFToggleAlarmContextualAction)initWithAlarmIdentifier:(id)a3 alarmName:(id)a4 alarmData:(id)a5 operation:(unint64_t)a6
{
  v45[2] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    v39 = [MEMORY[0x1E4F28B00] currentHandler];
    [v39 handleFailureInMethod:a2, self, @"WFToggleAlarmContextualAction.m", 37, @"Invalid parameter not satisfying: %@", @"alarmIdentifier" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v40 = [MEMORY[0x1E4F28B00] currentHandler];
  [v40 handleFailureInMethod:a2, self, @"WFToggleAlarmContextualAction.m", 38, @"Invalid parameter not satisfying: %@", @"alarmName" object file lineNumber description];

LABEL_3:
  int v14 = [[WFContextualActionParameter alloc] initWithType:@"WFDictionaryContentItem" displayString:0 wfParameterKey:@"alarm" wfSerializedRepresentation:v13];
  v15 = [[WFContextualActionParameter alloc] initWithType:@"WFStringContentItem" displayString:0 wfParameterKey:@"operation" wfSerializedRepresentation:@"toggle"];
  v45[0] = v14;
  v45[1] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:2];
  id v17 = (void *)[v16 mutableCopy];

  unint64_t v41 = a6;
  v42 = v15;
  v43 = v14;
  switch(a6)
  {
    case 0uLL:
      v18 = NSString;
      objc_super v19 = @"Turn On (Alarm)";
      v20 = @"Turn On %@";
      goto LABEL_7;
    case 1uLL:
      v18 = NSString;
      objc_super v19 = @"Turn Off (Alarm)";
      v20 = @"Turn Off";
LABEL_7:
      uint64_t v23 = WFLocalizedStringWithKey(v19, v20);
      goto LABEL_10;
    case 2uLL:
      v24 = NSString;
      v25 = WFLocalizedString(@"%@ Alarm");
      v22 = objc_msgSend(v24, "stringWithFormat:", v25, v12);

      v26 = [WFContextualActionParameter alloc];
      v27 = [(WFContextualActionParameter *)v26 initWithType:@"WFNumberContentItem" displayString:0 wfParameterKey:@"ShowWhenRun" wfSerializedRepresentation:MEMORY[0x1E4F1CC28]];
      [v17 addObject:v27];
      goto LABEL_11;
    case 3uLL:
      v18 = NSString;
      uint64_t v23 = WFLocalizedString(@"Snooze");
LABEL_10:
      v27 = (WFContextualActionParameter *)v23;
      v22 = objc_msgSend(v18, "stringWithFormat:", v23, v12);
LABEL_11:
      v21 = v13;

      break;
    default:
      v21 = v13;
      v22 = 0;
      break;
  }
  v44[0] = @"com.apple.mobiletimer-framework.MobileTimerIntents.MTToggleAlarmIntent";
  v44[1] = v11;
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:2];
  v29 = [v28 componentsJoinedByString:@"."];

  v30 = WFLocalizedString(@"Alarm");
  v31 = +[WFContextualActionIcon iconWithApplicationBundleIdentifier:@"com.apple.mobiletimer"];
  v32 = [(WFContextualAction *)self initWithIdentifier:v29 wfActionIdentifier:@"com.apple.mobiletimer-framework.MobileTimerIntents.MTToggleAlarmIntent" associatedAppBundleIdentifier:@"com.apple.mobiletimer" parameters:v17 displayFormatString:v22 title:v30 subtitleFormatString:v22 icon:v31];

  if (v32)
  {
    v32->_operation = v41;
    uint64_t v33 = [v11 copy];
    alarmIdentifier = v32->_alarmIdentifier;
    v32->_alarmIdentifier = (NSString *)v33;

    uint64_t v35 = [v12 copy];
    alarmName = v32->_alarmName;
    v32->_alarmName = (NSString *)v35;

    v37 = v32;
  }

  return v32;
}

- (WFToggleAlarmContextualAction)initWithAlarmIdentifier:(id)a3 alarmName:(id)a4 operation:(unint64_t)a5
{
  return [(WFToggleAlarmContextualAction *)self initWithAlarmIdentifier:a3 alarmName:a4 alarmData:MEMORY[0x1E4F1CC08] operation:a5];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)spotlightDomainIdentifierForBundleIdentifier:(id)a3
{
  return @"alarm-toggle";
}

@end