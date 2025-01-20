@interface PSUICallTimeGroup
- (CHManager)callHistoryManager;
- (PSListController)hostController;
- (PSSpecifier)currentCallTimeSpecifier;
- (PSSpecifier)groupSpecifier;
- (PSSpecifier)lifetimeCallTimeSpecifier;
- (PSUICallTimeGroup)initWithListController:(id)a3;
- (id)callTime:(id)a3;
- (id)callTimeDurationRestrictedToCurrentPeriod:(BOOL)a3;
- (id)getLogger;
- (id)lifetimeCallTime:(id)a3;
- (id)specifiers;
- (void)handleCallTimersChanged;
- (void)setCallHistoryManager:(id)a3;
- (void)setCurrentCallTimeSpecifier:(id)a3;
- (void)setGroupSpecifier:(id)a3;
- (void)setHostController:(id)a3;
- (void)setLifetimeCallTimeSpecifier:(id)a3;
@end

@implementation PSUICallTimeGroup

- (PSUICallTimeGroup)initWithListController:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)PSUICallTimeGroup;
  v5 = [(PSUICallTimeGroup *)&v28 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_hostController, v4);
    v7 = (CHManager *)objc_alloc_init(MEMORY[0x263F30588]);
    callHistoryManager = v6->_callHistoryManager;
    v6->_callHistoryManager = v7;

    v9 = (void *)MEMORY[0x263F5FC40];
    v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v11 = [v10 localizedStringForKey:@"CALL_TIME" value:&stru_26D410CA0 table:@"Cellular"];
    uint64_t v12 = [v9 groupSpecifierWithName:v11];
    groupSpecifier = v6->_groupSpecifier;
    v6->_groupSpecifier = (PSSpecifier *)v12;

    v14 = (void *)MEMORY[0x263F5FC40];
    v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v16 = [v15 localizedStringForKey:@"CURRENT_CALL_PERIOD" value:&stru_26D410CA0 table:@"Cellular"];
    uint64_t v17 = [v14 preferenceSpecifierNamed:v16 target:v6 set:0 get:sel_callTime_ detail:0 cell:4 edit:0];
    currentCallTimeSpecifier = v6->_currentCallTimeSpecifier;
    v6->_currentCallTimeSpecifier = (PSSpecifier *)v17;

    [(PSSpecifier *)v6->_currentCallTimeSpecifier setIdentifier:@"CALL_TIME_IN_PERIOD"];
    uint64_t v19 = *MEMORY[0x263F601F8];
    uint64_t v20 = MEMORY[0x263EFFA88];
    [(PSSpecifier *)v6->_currentCallTimeSpecifier setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F601F8]];
    v21 = (void *)MEMORY[0x263F5FC40];
    v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v23 = [v22 localizedStringForKey:@"TOTAL" value:&stru_26D410CA0 table:@"Cellular"];
    uint64_t v24 = [v21 preferenceSpecifierNamed:v23 target:v6 set:0 get:sel_lifetimeCallTime_ detail:0 cell:4 edit:0];
    lifetimeCallTimeSpecifier = v6->_lifetimeCallTimeSpecifier;
    v6->_lifetimeCallTimeSpecifier = (PSSpecifier *)v24;

    [(PSSpecifier *)v6->_lifetimeCallTimeSpecifier setIdentifier:@"CALL_TIME_TOTAL"];
    [(PSSpecifier *)v6->_lifetimeCallTimeSpecifier setProperty:v20 forKey:v19];
    v26 = [MEMORY[0x263F08A00] defaultCenter];
    [v26 addObserver:v6 selector:sel_handleCallTimersChanged name:*MEMORY[0x263F30640] object:0];
  }
  return v6;
}

- (id)specifiers
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = [(PSUICallTimeGroup *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = "not null";
    if (self->_groupSpecifier) {
      v5 = "not null";
    }
    else {
      v5 = "null";
    }
    lifetimeCallTimeSpecifier = self->_lifetimeCallTimeSpecifier;
    if (self->_currentCallTimeSpecifier) {
      v7 = "not null";
    }
    else {
      v7 = "null";
    }
    *(_DWORD *)buf = 136315650;
    if (!lifetimeCallTimeSpecifier) {
      id v4 = "null";
    }
    v13 = v5;
    __int16 v14 = 2080;
    v15 = v7;
    __int16 v16 = 2080;
    uint64_t v17 = v4;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "Call time group returning, group: %s, current: %s, lifetime: %s", buf, 0x20u);
  }

  long long v10 = *(_OWORD *)&self->_groupSpecifier;
  v11 = self->_lifetimeCallTimeSpecifier;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v10 count:3];
  return v8;
}

- (void)handleCallTimersChanged
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = [(PSUICallTimeGroup *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *MEMORY[0x263F30640];
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v4;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "Call time group received notification %@", buf, 0xCu);
  }

  *(void *)buf = 0;
  objc_initWeak((id *)buf, self);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__PSUICallTimeGroup_handleCallTimersChanged__block_invoke;
  v5[3] = &unk_2645E0BD8;
  v5[4] = self;
  objc_copyWeak(&v6, (id *)buf);
  dispatch_async(MEMORY[0x263EF83A0], v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

void __44__PSUICallTimeGroup_handleCallTimersChanged__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) hostController];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = [WeakRetained currentCallTimeSpecifier];
  [v2 reloadSpecifier:v4 animated:1];

  id v7 = [*(id *)(a1 + 32) hostController];
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = [v5 lifetimeCallTimeSpecifier];
  [v7 reloadSpecifier:v6 animated:1];
}

- (id)callTimeDurationRestrictedToCurrentPeriod:(BOOL)a3
{
  uint64_t v4 = [(PSUICallTimeGroup *)self callHistoryManager];
  [v4 callTimersGetOutgoing];
  id v5 = [(PSUICallTimeGroup *)self callHistoryManager];
  [v5 callTimersGetIncoming];

  id v6 = [(PSUICallTimeGroup *)self callHistoryManager];
  [v6 callTimersGetLifetime];

  if ((PSTimeStringIsShortened() & 1) != 0 || PSTimeStringIsShortened())
  {
    id v7 = PSAbbreviatedFormattedTimeStringWithDays();
  }
  else
  {
    id v7 = PSFormattedTimeStringWithDays();
  }
  return v7;
}

- (id)callTime:(id)a3
{
  return [(PSUICallTimeGroup *)self callTimeDurationRestrictedToCurrentPeriod:1];
}

- (id)lifetimeCallTime:(id)a3
{
  return [(PSUICallTimeGroup *)self callTimeDurationRestrictedToCurrentPeriod:0];
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"PSUICallTimeGroup"];
}

- (PSListController)hostController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
  return (PSListController *)WeakRetained;
}

- (void)setHostController:(id)a3
{
}

- (CHManager)callHistoryManager
{
  return self->_callHistoryManager;
}

- (void)setCallHistoryManager:(id)a3
{
}

- (PSSpecifier)groupSpecifier
{
  return self->_groupSpecifier;
}

- (void)setGroupSpecifier:(id)a3
{
}

- (PSSpecifier)currentCallTimeSpecifier
{
  return self->_currentCallTimeSpecifier;
}

- (void)setCurrentCallTimeSpecifier:(id)a3
{
}

- (PSSpecifier)lifetimeCallTimeSpecifier
{
  return self->_lifetimeCallTimeSpecifier;
}

- (void)setLifetimeCallTimeSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lifetimeCallTimeSpecifier, 0);
  objc_storeStrong((id *)&self->_currentCallTimeSpecifier, 0);
  objc_storeStrong((id *)&self->_groupSpecifier, 0);
  objc_storeStrong((id *)&self->_callHistoryManager, 0);
  objc_destroyWeak((id *)&self->_hostController);
}

@end