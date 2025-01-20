@interface DelayedSendTimerEvent
- (BOOL)requiresNewTurn;
- (_TtC14SiriMessagesUI21DelayedSendTimerEvent)init;
- (void)emitWithTurnIdentifier:(id)a3;
- (void)emitWithTurnIdentifier:(id)a3 aceViewId:(id)a4;
@end

@implementation DelayedSendTimerEvent

- (BOOL)requiresNewTurn
{
  return 0;
}

- (void)emitWithTurnIdentifier:(id)a3
{
  uint64_t v4 = sub_25D677750();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25D677730();
  v8 = self;
  sub_25D5E8CD4();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)emitWithTurnIdentifier:(id)a3 aceViewId:(id)a4
{
  uint64_t v5 = sub_25D677750();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  v11 = (char *)&v14 - v10;
  sub_25D677730();
  sub_25D677730();
  v12 = self;
  sub_25D5E8F2C();

  v13 = *(void (**)(char *, uint64_t))(v6 + 8);
  v13(v9, v5);
  v13(v11, v5);
}

- (_TtC14SiriMessagesUI21DelayedSendTimerEvent)init
{
}

- (void).cxx_destruct
{
}

@end