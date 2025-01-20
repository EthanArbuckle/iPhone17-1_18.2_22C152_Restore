@interface BYAnalyticsExpressRestore
- (BOOL)offeredBackup;
- (BOOL)paneShown;
- (BYAnalyticsExpressRestore)initWithAnalyticsManager:(id)a3;
- (id)eventPayload;
- (unint64_t)restoreChoice;
- (void)setOfferedBackup:(BOOL)a3;
- (void)setPaneShown:(BOOL)a3;
- (void)setRestoreChoice:(unint64_t)a3;
@end

@implementation BYAnalyticsExpressRestore

- (BYAnalyticsExpressRestore)initWithAnalyticsManager:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BYAnalyticsExpressRestore;
  v5 = [(BYAnalyticsExpressRestore *)&v10 init];
  v6 = v5;
  if (v5)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __54__BYAnalyticsExpressRestore_initWithAnalyticsManager___block_invoke;
    v8[3] = &unk_1E5D2C910;
    v9 = v5;
    [v4 addEvent:@"com.apple.setupassistant.ios.expressRestore.pane" withPayloadBlock:v8 persist:0];
  }
  return v6;
}

uint64_t __54__BYAnalyticsExpressRestore_initWithAnalyticsManager___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) eventPayload];
}

- (id)eventPayload
{
  v10[3] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(BYAnalyticsExpressRestore *)self restoreChoice];
  if (v3 > 3) {
    id v4 = 0;
  }
  else {
    id v4 = off_1E5D2CFB0[v3];
  }
  v9[0] = @"paneShown";
  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[BYAnalyticsExpressRestore paneShown](self, "paneShown"));
  v10[0] = v5;
  v9[1] = @"offeredBackup";
  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[BYAnalyticsExpressRestore offeredBackup](self, "offeredBackup"));
  v9[2] = @"restoreChoice";
  v10[1] = v6;
  v10[2] = v4;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:3];

  return v7;
}

- (BOOL)paneShown
{
  return self->_paneShown;
}

- (void)setPaneShown:(BOOL)a3
{
  self->_paneShown = a3;
}

- (unint64_t)restoreChoice
{
  return self->_restoreChoice;
}

- (void)setRestoreChoice:(unint64_t)a3
{
  self->_restoreChoice = a3;
}

- (BOOL)offeredBackup
{
  return self->_offeredBackup;
}

- (void)setOfferedBackup:(BOOL)a3
{
  self->_offeredBackup = a3;
}

@end