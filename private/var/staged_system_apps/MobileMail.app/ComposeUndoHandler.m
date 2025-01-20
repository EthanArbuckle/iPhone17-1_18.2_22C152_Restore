@interface ComposeUndoHandler
- (_TtC10MobileMail18ComposeUndoHandler)init;
- (_TtC10MobileMail18ComposeUndoHandler)initWithOutgoingMessageRepository:(id)a3;
- (void)cancelLastDelayedMessage;
- (void)enableUndoSend:(BOOL)a3 for:(id)a4;
@end

@implementation ComposeUndoHandler

- (_TtC10MobileMail18ComposeUndoHandler)initWithOutgoingMessageRepository:(id)a3
{
  id v3 = a3;
  return (_TtC10MobileMail18ComposeUndoHandler *)sub_10001103C(a3);
}

- (void)enableUndoSend:(BOOL)a3 for:(id)a4
{
  id v5 = a4;
  v6 = self;
  char v7 = _convertObjCBoolToBool(_:)();
  sub_100270CD8(v7 & 1, a4);
}

- (void)cancelLastDelayedMessage
{
  v2 = self;
  sub_1002710A4();
}

- (_TtC10MobileMail18ComposeUndoHandler)init
{
  return (_TtC10MobileMail18ComposeUndoHandler *)sub_100271B38();
}

- (void).cxx_destruct
{
  uint64_t v3 = OBJC_IVAR____TtC10MobileMail18ComposeUndoHandler_logger;
  uint64_t v2 = type metadata accessor for Logger();
  (*(void (**)(char *))(*(void *)(v2 - 8) + 8))((char *)self + v3);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10MobileMail18ComposeUndoHandler_outgoingMessageRepository));
}

@end