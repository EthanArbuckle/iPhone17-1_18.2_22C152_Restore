@interface SBDashBoardPolicyBasedBehaviorProvider
- (NSString)coverSheetIdentifier;
- (SBDashBoardPolicyBasedBehaviorProvider)initWithCoverSheetViewController:(id)a3 policyAggregator:(id)a4;
- (int64_t)notificationBehavior;
- (int64_t)participantState;
- (int64_t)proximityDetectionMode;
- (int64_t)scrollingStrategy;
- (unint64_t)_cameraRestrictions;
- (unint64_t)_restrictedCapability:(unint64_t)a3 forAggregatorCapability:(int64_t)a4;
- (unint64_t)restrictedCapabilities;
- (void)dealloc;
@end

@implementation SBDashBoardPolicyBasedBehaviorProvider

- (SBDashBoardPolicyBasedBehaviorProvider)initWithCoverSheetViewController:(id)a3 policyAggregator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SBDashBoardPolicyBasedBehaviorProvider;
  v9 = [(SBDashBoardPolicyBasedBehaviorProvider *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_coverSheetViewController, a3);
    [(CSCoverSheetViewController *)v10->_coverSheetViewController registerExternalBehaviorProvider:v10];
    objc_storeStrong((id *)&v10->_policyAggregator, a4);
    objc_initWeak(&location, v10);
    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __92__SBDashBoardPolicyBasedBehaviorProvider_initWithCoverSheetViewController_policyAggregator___block_invoke;
    v15[3] = &unk_1E6B01728;
    objc_copyWeak(&v16, &location);
    uint64_t v12 = [v11 addObserverForName:@"SBPolicyAggregatorCapabilitiesChangedNotification" object:v8 queue:0 usingBlock:v15];
    id notificationToken = v10->_notificationToken;
    v10->_id notificationToken = (id)v12;

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v10;
}

void __92__SBDashBoardPolicyBasedBehaviorProvider_initWithCoverSheetViewController_policyAggregator___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained[1] externalBehaviorProviderBehaviorChanged:WeakRetained];
}

- (void)dealloc
{
  [(CSCoverSheetViewController *)self->_coverSheetViewController unregisterExternalBehaviorProvider:self];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self->_notificationToken];

  v4.receiver = self;
  v4.super_class = (Class)SBDashBoardPolicyBasedBehaviorProvider;
  [(SBDashBoardPolicyBasedBehaviorProvider *)&v4 dealloc];
}

- (NSString)coverSheetIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (int64_t)participantState
{
  return 2;
}

- (int64_t)notificationBehavior
{
  return 0;
}

- (int64_t)proximityDetectionMode
{
  return 0;
}

- (int64_t)scrollingStrategy
{
  return 0;
}

- (unint64_t)restrictedCapabilities
{
  unint64_t v3 = [(SBDashBoardPolicyBasedBehaviorProvider *)self _cameraRestrictions];
  unint64_t v4 = [(SBDashBoardPolicyBasedBehaviorProvider *)self _restrictedCapability:64 forAggregatorCapability:22] | v3;
  unint64_t v5 = [(SBDashBoardPolicyBasedBehaviorProvider *)self _restrictedCapability:128 forAggregatorCapability:20];
  unint64_t v6 = v4 | v5 | [(SBDashBoardPolicyBasedBehaviorProvider *)self _restrictedCapability:0x2000 forAggregatorCapability:25];
  unint64_t v7 = [(SBDashBoardPolicyBasedBehaviorProvider *)self _restrictedCapability:0x10000 forAggregatorCapability:21];
  unint64_t v8 = v7 | [(SBDashBoardPolicyBasedBehaviorProvider *)self _restrictedCapability:0x200000 forAggregatorCapability:26];
  unint64_t v9 = v6 | v8 | [(SBDashBoardPolicyBasedBehaviorProvider *)self _restrictedCapability:0x400000 forAggregatorCapability:20];
  return v9 | [(SBDashBoardPolicyBasedBehaviorProvider *)self _restrictedCapability:0x800000 forAggregatorCapability:27];
}

- (unint64_t)_cameraRestrictions
{
  if ([(SBMainDisplayPolicyAggregator *)self->_policyAggregator allowsCapability:10]
    && [(SBMainDisplayPolicyAggregator *)self->_policyAggregator allowsCapability:11])
  {
    return 0;
  }
  else
  {
    return 4;
  }
}

- (unint64_t)_restrictedCapability:(unint64_t)a3 forAggregatorCapability:(int64_t)a4
{
  if ([(SBMainDisplayPolicyAggregator *)self->_policyAggregator allowsCapability:a4]) {
    return 0;
  }
  else {
    return a3;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_notificationToken, 0);
  objc_storeStrong((id *)&self->_policyAggregator, 0);
  objc_storeStrong((id *)&self->_coverSheetViewController, 0);
}

@end