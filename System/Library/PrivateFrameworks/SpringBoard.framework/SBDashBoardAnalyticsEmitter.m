@interface SBDashBoardAnalyticsEmitter
- (BOOL)handleEvent:(id)a3;
- (BOOL)wouldHandleButtonEvent:(id)a3;
- (NSString)coverSheetIdentifier;
- (SBDashBoardAnalyticsEmitter)initWithCoverSheetViewController:(id)a3;
- (int64_t)participantState;
- (void)dealloc;
@end

@implementation SBDashBoardAnalyticsEmitter

- (SBDashBoardAnalyticsEmitter)initWithCoverSheetViewController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBDashBoardAnalyticsEmitter;
  v6 = [(SBDashBoardAnalyticsEmitter *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_coverSheetViewController, a3);
    [(CSCoverSheetViewController *)v7->_coverSheetViewController registerExternalEventHandler:v7];
  }

  return v7;
}

- (void)dealloc
{
  [(CSCoverSheetViewController *)self->_coverSheetViewController unregisterExternalEventHandler:self];
  v3.receiver = self;
  v3.super_class = (Class)SBDashBoardAnalyticsEmitter;
  [(SBDashBoardAnalyticsEmitter *)&v3 dealloc];
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

- (BOOL)handleEvent:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a3 type];
  uint64_t v4 = v3;
  if (v3 == 25)
  {
    uint64_t v20 = *MEMORY[0x1E4FA7608];
    uint64_t v21 = MEMORY[0x1E4F1CC28];
    id v5 = (void *)MEMORY[0x1E4F1C9E8];
    v6 = &v21;
    v7 = &v20;
  }
  else
  {
    if (v3 != 24) {
      goto LABEL_6;
    }
    uint64_t v22 = *MEMORY[0x1E4FA7608];
    v23[0] = MEMORY[0x1E4F1CC38];
    id v5 = (void *)MEMORY[0x1E4F1C9E8];
    v6 = v23;
    v7 = &v22;
  }
  v8 = [v5 dictionaryWithObjects:v6 forKeys:v7 count:1];
  objc_super v9 = (void *)MEMORY[0x1E4FA5E78];
  id v10 = v8;
  v11 = [v9 sharedInstance];
  [v11 emitEvent:36 withPayload:v10];

LABEL_6:
  if (CSEventShouldBeLogged())
  {
    uint64_t v18 = *MEMORY[0x1E4FA7728];
    v12 = [NSNumber numberWithInteger:v4];
    v19 = v12;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    v14 = (void *)MEMORY[0x1E4FA5E78];
    id v15 = v13;
    v16 = [v14 sharedInstance];
    [v16 emitEvent:37 withPayload:v15];
  }
  return 0;
}

- (BOOL)wouldHandleButtonEvent:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
}

@end