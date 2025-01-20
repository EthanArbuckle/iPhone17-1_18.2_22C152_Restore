@interface CSDCallCenterObserver
- (CSDCallCenterObserver)init;
- (CSDCallCenterObserverDelegate)delegate;
- (CSDCallContainer)callContainer;
- (id)activeConversationForCall:(id)a3;
- (id)callChanged;
- (unint64_t)triggers;
- (void)handleChannelTrigger:(id)a3;
- (void)handleSharePlayTrigger:(id)a3;
- (void)handleTrigger:(id)a3;
- (void)setCallChanged:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTriggers:(unint64_t)a3;
@end

@implementation CSDCallCenterObserver

- (id)activeConversationForCall:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_10022011C((uint64_t)v4);

  return v6;
}

- (CSDCallCenterObserverDelegate)delegate
{
  v2 = (void *)sub_100220218();

  return (CSDCallCenterObserverDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  sub_100220288();
}

- (unint64_t)triggers
{
  return sub_1002202F4();
}

- (void)setTriggers:(unint64_t)a3
{
  id v4 = self;
  sub_100220358(a3);
}

- (id)callChanged
{
  uint64_t v2 = sub_1002208C8();
  if (v2)
  {
    v6[4] = v2;
    v6[5] = v3;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 1107296256;
    v6[2] = sub_1002F8408;
    v6[3] = &unk_10050DB90;
    id v4 = _Block_copy(v6);
    swift_release();
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)setCallChanged:(id)a3
{
  id v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    id v4 = sub_100222660;
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = self;
  sub_1002209B0((uint64_t)v4, v5);
}

- (CSDCallContainer)callContainer
{
  uint64_t v2 = self;
  uint64_t v3 = (void *)sub_100220A14();

  return (CSDCallContainer *)v3;
}

- (CSDCallCenterObserver)init
{
  return (CSDCallCenterObserver *)sub_100220AF4();
}

- (void)handleTrigger:(id)a3
{
}

- (void)handleChannelTrigger:(id)a3
{
}

- (void)handleSharePlayTrigger:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_100221768((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void).cxx_destruct
{
  swift_release();

  sub_100222678((uint64_t)self + OBJC_IVAR___CSDCallCenterObserver_delegate);
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___CSDCallCenterObserver_callChanged);

  sub_100208490(v3);
}

@end