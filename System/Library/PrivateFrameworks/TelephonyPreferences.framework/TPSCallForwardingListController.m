@interface TPSCallForwardingListController
- (PSSpecifier)conditionalServiceSwitchSpecifier;
- (PSSpecifier)mainSwitchSpecifier;
- (TPSCallForwardingController)callForwardingController;
- (id)conditionalServiceBusyPhoneNumber:(id)a3;
- (id)conditionalServiceSwitchOn:(id)a3;
- (id)conditionalServiceTypeSpecifiers;
- (id)conditionalServiceUnansweredPhoneNumber:(id)a3;
- (id)conditionalServiceUnreachablePhoneNumber:(id)a3;
- (id)mainSwitchOn:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)unconditionalServicePhoneNumber:(id)a3;
- (id)unconditionalServiceTypeSpecifiers;
- (void)configureCell:(id)a3;
- (void)configureCell:(id)a3 forSpecifier:(id)a4;
- (void)setConditionalServiceBusyPhoneNumber:(id)a3 specifier:(id)a4;
- (void)setConditionalServiceSwitchOn:(id)a3 specifier:(id)a4;
- (void)setConditionalServiceUnansweredPhoneNumber:(id)a3 specifier:(id)a4;
- (void)setConditionalServiceUnreachablePhoneNumber:(id)a3 specifier:(id)a4;
- (void)setMainSwitchOn:(id)a3 specifier:(id)a4;
- (void)setUnconditionalServicePhoneNumber:(id)a3 specifier:(id)a4;
@end

@implementation TPSCallForwardingListController

- (TPSCallForwardingController)callForwardingController
{
  callForwardingController = self->_callForwardingController;
  if (!callForwardingController)
  {
    v4 = [TPSCallForwardingController alloc];
    v5 = [(TPSListController *)self subscriptionContext];
    v6 = [(TPSCallForwardingController *)v4 initWithSubscriptionContext:v5];
    v7 = self->_callForwardingController;
    self->_callForwardingController = v6;

    [(TPSCallForwardingController *)self->_callForwardingController setDelegate:self];
    callForwardingController = self->_callForwardingController;
  }
  return callForwardingController;
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x1E4F92F08];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = [(TPSListController *)self subscriptionContext];
    v6 = [(TPSCallForwardingListController *)self callForwardingController];
    if (!v5)
    {
LABEL_14:

      v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
      goto LABEL_15;
    }
    v7 = [MEMORY[0x1E4F1CA48] array];
    v8 = [(TPSCallForwardingListController *)self mainSwitchSpecifier];
    [v7 addObject:v8];

    uint64_t v9 = [v6 serviceType];
    if (v9 != 1)
    {
      uint64_t v10 = v9;
      if (([v6 isLoading] & 1) == 0 && (objc_msgSend(v6, "isUnloading") & 1) == 0)
      {
        if ([v6 isConditionalServiceAvailable])
        {
          v11 = [(TPSCallForwardingListController *)self conditionalServiceSwitchSpecifier];
          [v7 addObject:v11];
        }
        if (v10 == 2)
        {
          uint64_t v12 = [(TPSCallForwardingListController *)self unconditionalServiceTypeSpecifiers];
          goto LABEL_12;
        }
        if (v10 == 3)
        {
          uint64_t v12 = [(TPSCallForwardingListController *)self conditionalServiceTypeSpecifiers];
LABEL_12:
          v13 = (void *)v12;
          [v7 addObjectsFromArray:v12];
        }
      }
    }
    v14 = (objc_class *)[v7 copy];
    v15 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = v14;

    goto LABEL_14;
  }
LABEL_15:
  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TPSCallForwardingListController;
  v5 = [(TPSCallForwardingListController *)&v7 tableView:a3 cellForRowAtIndexPath:a4];
  [(TPSCallForwardingListController *)self configureCell:v5];
  return v5;
}

- (PSSpecifier)mainSwitchSpecifier
{
  mainSwitchSpecifier = self->_mainSwitchSpecifier;
  if (!mainSwitchSpecifier)
  {
    v4 = (void *)MEMORY[0x1E4F92E70];
    v5 = +[TPSLocalizedString localizedStringForKey:@"MAIN_SWITCH_SPECIFIER_TITLE"];
    v6 = [v4 preferenceSpecifierNamed:v5 target:self set:sel_setMainSwitchOn_specifier_ get:sel_mainSwitchOn_ detail:0 cell:6 edit:0];
    objc_super v7 = self->_mainSwitchSpecifier;
    self->_mainSwitchSpecifier = v6;

    mainSwitchSpecifier = self->_mainSwitchSpecifier;
  }
  return mainSwitchSpecifier;
}

- (PSSpecifier)conditionalServiceSwitchSpecifier
{
  conditionalServiceSwitchSpecifier = self->_conditionalServiceSwitchSpecifier;
  if (!conditionalServiceSwitchSpecifier)
  {
    v4 = (void *)MEMORY[0x1E4F92E70];
    v5 = +[TPSLocalizedString localizedStringForKey:@"CONDITIONAL_SWITCH_SPECIFIER_TITLE"];
    v6 = [v4 preferenceSpecifierNamed:v5 target:self set:sel_setConditionalServiceSwitchOn_specifier_ get:sel_conditionalServiceSwitchOn_ detail:0 cell:6 edit:0];
    objc_super v7 = self->_conditionalServiceSwitchSpecifier;
    self->_conditionalServiceSwitchSpecifier = v6;

    conditionalServiceSwitchSpecifier = self->_conditionalServiceSwitchSpecifier;
  }
  return conditionalServiceSwitchSpecifier;
}

- (id)conditionalServiceTypeSpecifiers
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = [(TPSCallForwardingListController *)self callForwardingController];
  v5 = [MEMORY[0x1E4F92E70] emptyGroupSpecifier];
  [v3 addObject:v5];
  v6 = (void *)MEMORY[0x1E4F92E70];
  objc_super v7 = [v4 localizedConditionalBusyTitle];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = [v6 preferenceSpecifierNamed:v7 target:self set:sel_setConditionalServiceBusyPhoneNumber_specifier_ get:sel_conditionalServiceBusyPhoneNumber_ detail:v8 cell:2 edit:objc_opt_class()];

  [v3 addObject:v9];
  uint64_t v10 = (void *)MEMORY[0x1E4F92E70];
  v11 = [v4 localizedConditionalUnansweredTitle];
  uint64_t v12 = objc_opt_class();
  v13 = [v10 preferenceSpecifierNamed:v11 target:self set:sel_setConditionalServiceUnansweredPhoneNumber_specifier_ get:sel_conditionalServiceUnansweredPhoneNumber_ detail:v12 cell:2 edit:objc_opt_class()];

  [v3 addObject:v13];
  v14 = (void *)MEMORY[0x1E4F92E70];
  v15 = [v4 localizedConditionalUnreachableTitle];
  uint64_t v16 = objc_opt_class();
  v17 = [v14 preferenceSpecifierNamed:v15 target:self set:sel_setConditionalServiceUnreachablePhoneNumber_specifier_ get:sel_conditionalServiceUnreachablePhoneNumber_ detail:v16 cell:2 edit:objc_opt_class()];

  [v3 addObject:v17];
  v18 = (void *)[v3 copy];

  return v18;
}

- (id)unconditionalServiceTypeSpecifiers
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = [MEMORY[0x1E4F92E70] emptyGroupSpecifier];
  [v3 addObject:v4];
  v5 = (void *)MEMORY[0x1E4F92E70];
  v6 = +[TPSLocalizedString localizedStringForKey:@"UNCONDITIONAL_SERVICE_FORWARD_TO_SPECIFIER_TITLE"];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = [v5 preferenceSpecifierNamed:v6 target:self set:sel_setUnconditionalServicePhoneNumber_specifier_ get:sel_unconditionalServicePhoneNumber_ detail:v7 cell:2 edit:objc_opt_class()];

  [v3 addObject:v8];
  uint64_t v9 = (void *)[v3 copy];

  return v9;
}

- (id)mainSwitchOn:(id)a3
{
  uint64_t v3 = NSNumber;
  v4 = [(TPSCallForwardingListController *)self callForwardingController];
  v5 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "serviceType") != 1);

  return v5;
}

- (void)setMainSwitchOn:(id)a3 specifier:(id)a4
{
  id v14 = a3;
  uint64_t v6 = *MEMORY[0x1E4F930F0];
  id v7 = a4;
  uint64_t v8 = [v7 propertyForKey:v6];
  objc_msgSend(v8, "setOn:animated:", objc_msgSend(v14, "BOOLValue"), 1);
  uint64_t v9 = [(TPSCallForwardingListController *)self cachedCellForSpecifier:v7];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v9 setLoading:1];
  }
  int v10 = [v14 BOOLValue];
  v11 = [(TPSCallForwardingListController *)self callForwardingController];
  uint64_t v12 = v11;
  if (v10) {
    uint64_t v13 = 2;
  }
  else {
    uint64_t v13 = 1;
  }
  [v11 updateServiceType:v13];
}

- (id)conditionalServiceBusyPhoneNumber:(id)a3
{
  uint64_t v3 = [(TPSCallForwardingListController *)self callForwardingController];
  v4 = [v3 conditionalServiceBusyPhoneNumber];

  return v4;
}

- (void)setConditionalServiceBusyPhoneNumber:(id)a3 specifier:(id)a4
{
  id v8 = a4;
  id v6 = a3;
  id v7 = [(TPSCallForwardingListController *)self callForwardingController];
  [v7 setConditionalServiceBusyPhoneNumber:v6];

  [(TPSCallForwardingListController *)self reloadSpecifier:v8];
}

- (id)conditionalServiceUnansweredPhoneNumber:(id)a3
{
  uint64_t v3 = [(TPSCallForwardingListController *)self callForwardingController];
  v4 = [v3 conditionalServiceUnansweredPhoneNumber];

  return v4;
}

- (void)setConditionalServiceUnansweredPhoneNumber:(id)a3 specifier:(id)a4
{
  id v8 = a4;
  id v6 = a3;
  id v7 = [(TPSCallForwardingListController *)self callForwardingController];
  [v7 setConditionalServiceUnansweredPhoneNumber:v6];

  [(TPSCallForwardingListController *)self reloadSpecifier:v8];
}

- (id)conditionalServiceUnreachablePhoneNumber:(id)a3
{
  uint64_t v3 = [(TPSCallForwardingListController *)self callForwardingController];
  v4 = [v3 conditionalServiceUnreachablePhoneNumber];

  return v4;
}

- (void)setConditionalServiceUnreachablePhoneNumber:(id)a3 specifier:(id)a4
{
  id v8 = a4;
  id v6 = a3;
  id v7 = [(TPSCallForwardingListController *)self callForwardingController];
  [v7 setConditionalServiceUnreachablePhoneNumber:v6];

  [(TPSCallForwardingListController *)self reloadSpecifier:v8];
}

- (id)conditionalServiceSwitchOn:(id)a3
{
  uint64_t v3 = NSNumber;
  v4 = [(TPSCallForwardingListController *)self callForwardingController];
  v5 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "serviceType") == 3);

  return v5;
}

- (void)setConditionalServiceSwitchOn:(id)a3 specifier:(id)a4
{
  id v14 = a3;
  uint64_t v6 = *MEMORY[0x1E4F930F0];
  id v7 = a4;
  id v8 = [v7 propertyForKey:v6];
  objc_msgSend(v8, "setOn:animated:", objc_msgSend(v14, "BOOLValue"), 1);
  uint64_t v9 = [(TPSCallForwardingListController *)self cachedCellForSpecifier:v7];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v9 setLoading:1];
  }
  int v10 = [v14 BOOLValue];
  v11 = [(TPSCallForwardingListController *)self callForwardingController];
  uint64_t v12 = v11;
  if (v10) {
    uint64_t v13 = 3;
  }
  else {
    uint64_t v13 = 2;
  }
  [v11 updateServiceType:v13];
}

- (id)unconditionalServicePhoneNumber:(id)a3
{
  uint64_t v3 = [(TPSCallForwardingListController *)self callForwardingController];
  v4 = [v3 unconditionalServicePhoneNumber];

  return v4;
}

- (void)setUnconditionalServicePhoneNumber:(id)a3 specifier:(id)a4
{
  id v8 = a4;
  id v6 = a3;
  id v7 = [(TPSCallForwardingListController *)self callForwardingController];
  [v7 setUnconditionalServicePhoneNumber:v6];

  [(TPSCallForwardingListController *)self reloadSpecifier:v8];
}

- (void)configureCell:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v6;
    v5 = [v4 specifier];
    [(TPSCallForwardingListController *)self configureCell:v4 forSpecifier:v5];
  }
}

- (void)configureCell:(id)a3 forSpecifier:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = [(TPSCallForwardingListController *)self callForwardingController];
  id v8 = [v13 specifier];
  uint64_t v9 = [(TPSCallForwardingListController *)self mainSwitchSpecifier];

  if (v8 == v9)
  {
    id v10 = v13;
    if ([v7 isLoading]) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = [v7 isUnloading];
    }
    [v10 setLoading:v11];
    uint64_t v12 = [v6 propertyForKey:*MEMORY[0x1E4F930F0]];
    objc_msgSend(v12, "setEnabled:", objc_msgSend(v7, "serviceType") != 0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainSwitchSpecifier, 0);
  objc_storeStrong((id *)&self->_conditionalServiceSwitchSpecifier, 0);
  objc_storeStrong((id *)&self->_callForwardingController, 0);
}

@end