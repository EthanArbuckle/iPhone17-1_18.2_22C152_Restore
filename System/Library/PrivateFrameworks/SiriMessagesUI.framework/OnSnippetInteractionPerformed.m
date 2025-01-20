@interface OnSnippetInteractionPerformed
- (_TtC14SiriMessagesUI29OnSnippetInteractionPerformed)init;
- (void)emitWithTurnIdentifier:(id)a3;
- (void)emitWithTurnIdentifier:(id)a3 aceViewId:(id)a4;
@end

@implementation OnSnippetInteractionPerformed

- (void)emitWithTurnIdentifier:(id)a3
{
  uint64_t v4 = sub_25D677750();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25D677730();
  v8 = self;
  sub_25D6679E8();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)emitWithTurnIdentifier:(id)a3 aceViewId:(id)a4
{
  uint64_t v5 = sub_25D677750();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  v11 = (char *)&v14 - v10;
  sub_25D677730();
  sub_25D677730();
  v12 = self;
  sub_25D667C38();

  v13 = *(void (**)(char *, uint64_t))(v6 + 8);
  v13(v8, v5);
  v13(v11, v5);
}

- (_TtC14SiriMessagesUI29OnSnippetInteractionPerformed)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC14SiriMessagesUI29OnSnippetInteractionPerformed_interactionType;
  uint64_t v4 = sub_25D679560();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
}

@end