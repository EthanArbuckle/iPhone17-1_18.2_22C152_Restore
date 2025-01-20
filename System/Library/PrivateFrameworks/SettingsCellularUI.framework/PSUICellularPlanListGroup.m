@interface PSUICellularPlanListGroup
- (BOOL)isPrivateNetworkPlansList;
- (PSUICellularPlanListGroup)initWithListController:(id)a3 groupSpecifier:(id)a4;
- (PSUICellularPlanListGroup)initWithListController:(id)a3 groupSpecifier:(id)a4 isPrivateNetworkPlansList:(BOOL)a5;
- (id)danglingPlanSpecifierDetailText:(id)a3;
- (id)getLogger;
- (id)planSpecifierDetailText:(id)a3;
- (id)specifiers;
- (void)danglingPlanPressed:(id)a3;
- (void)setIsPrivateNetworkPlansList:(BOOL)a3;
@end

@implementation PSUICellularPlanListGroup

- (PSUICellularPlanListGroup)initWithListController:(id)a3 groupSpecifier:(id)a4
{
  id v5 = a4;
  v10.receiver = self;
  v10.super_class = (Class)PSUICellularPlanListGroup;
  v6 = [(PSUICellularPlanListGroup *)&v10 init];
  if (v6)
  {
    v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v8 = [v7 localizedStringForKey:@"CELLULAR_PLANS" value:&stru_26D410CA0 table:@"Cellular"];
    [v5 setName:v8];
  }
  return v6;
}

- (PSUICellularPlanListGroup)initWithListController:(id)a3 groupSpecifier:(id)a4 isPrivateNetworkPlansList:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PSUICellularPlanListGroup;
  v8 = [(PSUICellularPlanListGroup *)&v14 init];
  if (v8)
  {
    v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    objc_super v10 = v9;
    if (v5)
    {
      v11 = [v9 localizedStringForKey:@"NON_PUBLIC_NETWORK_PLANS" value:&stru_26D410CA0 table:@"Cellular"];
      [v7 setName:v11];

      v8->_isPrivateNetworkPlansList = 1;
    }
    else
    {
      v12 = [v9 localizedStringForKey:@"CELLULAR_PLANS" value:&stru_26D410CA0 table:@"Cellular"];
      [v7 setName:v12];
    }
  }

  return v8;
}

- (id)specifiers
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  id v61 = (id)objc_opt_new();
  v3 = +[PSUICellularPlanManagerCache sharedInstance];
  v4 = [v3 planItems];

  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v70 objects:v78 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v71;
    obuint64_t j = (id)*MEMORY[0x263F5FFE0];
    uint64_t v54 = *MEMORY[0x263F60290];
    uint64_t v56 = *MEMORY[0x263F5FFF0];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v71 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_super v10 = *(void **)(*((void *)&v70 + 1) + 8 * i);
        if ([v10 settingsMode] && objc_msgSend(v10, "settingsMode") != 1)
        {
          if ([v10 settingsMode] == 2)
          {
            if (self->_isPrivateNetworkPlansList) {
              continue;
            }
          }
          else
          {
            v11 = [(PSUICellularPlanListGroup *)self getLogger];
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315138;
              v77 = "-[PSUICellularPlanListGroup specifiers]";
              _os_log_error_impl(&dword_221B17000, v11, OS_LOG_TYPE_ERROR, "%s unexpected settings mode", buf, 0xCu);
            }
          }
        }
        else if (!self->_isPrivateNetworkPlansList)
        {
          continue;
        }
        v12 = [(PSUICellularPlanListGroup *)self getLogger];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v77 = (const char *)v10;
          _os_log_impl(&dword_221B17000, v12, OS_LOG_TYPE_DEFAULT, "planItem: %@", buf, 0xCu);
        }

        v13 = [v10 plan];
        objc_super v14 = [v13 subscriptionStatusOverride];
        int v15 = [v14 isEqualToNumber:&unk_26D425F90];

        if (v15)
        {
          v16 = (void *)MEMORY[0x263F5FC40];
          v17 = [v10 name];
          v18 = [v16 preferenceSpecifierNamed:v17 target:self set:0 get:sel_planSpecifierDetailText_ detail:0 cell:16 edit:0];
        }
        else if ([v10 isInstalling])
        {
          v19 = (void *)MEMORY[0x263F5FC40];
          v20 = [v10 name];
          v18 = [v19 preferenceSpecifierNamed:v20 target:self set:0 get:sel_planSpecifierDetailText_ detail:objc_opt_class() cell:3 edit:0];
        }
        else if ([v10 transferredStatus] == 4)
        {
          v21 = (void *)MEMORY[0x263F5FC40];
          v22 = [v10 name];
          v18 = [v21 preferenceSpecifierNamed:v22 target:self set:0 get:sel_planSpecifierDetailText_ detail:objc_opt_class() cell:2 edit:0];

          [v10 isSelected];
        }
        else
        {
          uint64_t v23 = [v10 transferredStatus];
          v24 = (void *)MEMORY[0x263F5FC40];
          v25 = [v10 name];
          v18 = [v24 preferenceSpecifierNamed:v25 target:self set:0 get:sel_planSpecifierDetailText_ detail:objc_opt_class() cell:2 edit:0];

          if (!v23) {
            [v10 isSelected];
          }
        }
        [v18 setProperty:objc_opt_class() forKey:obj];
        v26 = +[PSUICellularPlanUniversalReference referenceFromPlanItem:v10];
        [v18 setProperty:v26 forKey:v56];

        v27 = +[PSUICellularPlanManagerCache sharedInstance];
        v28 = [v27 subscriptionContextForPlanItem:v10 cachedSubscriptionContexts:0];
        [v18 setProperty:v28 forKey:v54];

        [v61 addObject:v18];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v70 objects:v78 count:16];
    }
    while (v7);
  }
  v57 = v5;

  v29 = +[PSUICellularPlanManagerCache sharedInstance];
  v30 = [v29 danglingPlanItems];

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v31 = v30;
  uint64_t v32 = [v31 countByEnumeratingWithState:&v66 objects:v75 count:16];
  if (!v32) {
    goto LABEL_41;
  }
  uint64_t v33 = v32;
  uint64_t v34 = *(void *)v67;
  id obja = (id)*MEMORY[0x263F5FFE0];
  uint64_t v35 = *MEMORY[0x263F5FFF0];
  do
  {
    for (uint64_t j = 0; j != v33; ++j)
    {
      if (*(void *)v67 != v34) {
        objc_enumerationMutation(v31);
      }
      v37 = *(void **)(*((void *)&v66 + 1) + 8 * j);
      if (self->_isPrivateNetworkPlansList)
      {
        if (![*(id *)(*((void *)&v66 + 1) + 8 * j) isPrivateNetworkSim]) {
          continue;
        }
        if (self->_isPrivateNetworkPlansList) {
          goto LABEL_38;
        }
      }
      if (([v37 isPrivateNetworkSim] & 1) == 0)
      {
LABEL_38:
        v38 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:0 target:self set:0 get:sel_danglingPlanSpecifierDetailText_ detail:0 cell:3 edit:0];
        [v38 setProperty:objc_opt_class() forKey:obja];
        v39 = +[PSUICellularPlanUniversalReference referenceFromDanglingPlanItem:v37];
        [v38 setProperty:v39 forKey:v35];

        [v38 setButtonAction:sel_danglingPlanPressed_];
        [v61 addObject:v38];
      }
    }
    uint64_t v33 = [v31 countByEnumeratingWithState:&v66 objects:v75 count:16];
  }
  while (v33);
LABEL_41:

  if (!self->_isPrivateNetworkPlansList)
  {
    id v55 = v31;
    v40 = +[PSUICellularPlanManagerCache sharedInstance];
    v41 = [v40 plansPendingTransfer];

    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id objb = v41;
    uint64_t v42 = [objb countByEnumeratingWithState:&v62 objects:v74 count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v63;
      uint64_t v45 = *MEMORY[0x263F5FFE0];
      uint64_t v46 = *MEMORY[0x263F5FFF0];
      do
      {
        for (uint64_t k = 0; k != v43; ++k)
        {
          if (*(void *)v63 != v44) {
            objc_enumerationMutation(objb);
          }
          v48 = *(void **)(*((void *)&v62 + 1) + 8 * k);
          v49 = (void *)MEMORY[0x263F5FC40];
          v50 = [v48 carrierName];
          v51 = [v49 preferenceSpecifierNamed:v50 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

          if ((unint64_t)[v48 status] <= 3) {
            [v51 setProperty:objc_opt_class() forKey:v45];
          }
          v52 = +[PSUICellularPlanUniversalReference referenceFromCellularPlanPendingTransfer:v48];
          [v51 setProperty:v52 forKey:v46];

          [v61 addObject:v51];
        }
        uint64_t v43 = [objb countByEnumeratingWithState:&v62 objects:v74 count:16];
      }
      while (v43);
    }

    id v31 = v55;
  }

  return v61;
}

- (id)planSpecifierDetailText:(id)a3
{
  v3 = [a3 propertyForKey:*MEMORY[0x263F5FFF0]];
  v4 = +[PSUICellularPlanManagerCache sharedInstance];
  id v5 = [v4 planFromReferenceSafe:v3];

  if (![v5 transferredStatus])
  {
    uint64_t v6 = [v5 plan];
    if ([v6 status] == 14)
    {
      uint64_t v7 = [MEMORY[0x263F82670] currentDevice];
      int v8 = objc_msgSend(v7, "sf_isiPhone");

      if (v8)
      {
        v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        objc_super v10 = v9;
        v11 = @"ACTIVATING";
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  if (![v5 transferredStatus])
  {
    int v16 = [v5 isSelected];
    v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    objc_super v10 = v9;
    if (v16) {
      v11 = @"ON_SINGLE_CELLULAR_PLAN";
    }
    else {
      v11 = @"OFF_SINGLE_CELLULAR_PLAN";
    }
    objc_super v14 = @"Cellular";
    goto LABEL_16;
  }
  if (![v5 isCheckingCellularConnectivity]
    || ([MEMORY[0x263F82670] currentDevice],
        v12 = objc_claimAutoreleasedReturnValue(),
        int v13 = objc_msgSend(v12, "sf_isiPhone"),
        v12,
        !v13))
  {
    int v15 = 0;
    goto LABEL_17;
  }
  v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  objc_super v10 = v9;
  v11 = @"CHECKING";
LABEL_10:
  objc_super v14 = @"Gemini-Gemini";
LABEL_16:
  int v15 = [v9 localizedStringForKey:v11 value:&stru_26D410CA0 table:v14];

LABEL_17:
  return v15;
}

- (id)danglingPlanSpecifierDetailText:(id)a3
{
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"NO_SIM" value:&stru_26D410CA0 table:@"Cellular"];

  return v4;
}

- (void)danglingPlanPressed:(id)a3
{
  id v6 = [a3 propertyForKey:*MEMORY[0x263F5FFF0]];
  v3 = +[PSUICellularPlanManagerCache sharedInstance];
  v4 = [v3 danglingPlanFromReference:v6];

  id v5 = +[PSUICellularPlanManagerCache sharedInstance];
  [v5 didSelectDanglingPlan:v4];
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"PlanListGroup"];
}

- (BOOL)isPrivateNetworkPlansList
{
  return self->_isPrivateNetworkPlansList;
}

- (void)setIsPrivateNetworkPlansList:(BOOL)a3
{
  self->_isPrivateNetworkPlansList = a3;
}

@end