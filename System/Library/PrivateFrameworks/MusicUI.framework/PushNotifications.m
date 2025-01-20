@interface PushNotifications
- (_TtC7MusicUI17PushNotifications)init;
- (void)connection:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
@end

@implementation PushNotifications

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  v4 = a4;
  if (a4)
  {
    id v6 = a3;
    v7 = self;
    id v8 = v4;
    v4 = (void *)sub_22A168F70();
    unint64_t v10 = v9;
  }
  else
  {
    id v11 = a3;
    v12 = self;
    unint64_t v10 = 0xF000000000000000;
  }
  sub_2294B7BAC((uint64_t)v4, v10);
}

- (void)connection:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5
{
  uint64_t v5 = (uint64_t)a5;
  if (a4)
  {
    uint64_t v8 = sub_22A1707E0();
    uint64_t v10 = v9;
    if (!v5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v8 = 0;
  uint64_t v10 = 0;
  if (a5) {
LABEL_3:
  }
    uint64_t v5 = sub_22A170640();
LABEL_4:
  id v11 = a3;
  v12 = self;
  sub_22A0F18EC((uint64_t)v12, v8, v10, v5);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (_TtC7MusicUI17PushNotifications)init
{
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC7MusicUI17PushNotifications_bag;
  sub_22A170300();
  OUTLINED_FUNCTION_16();
  (*(void (**)(char *))(v4 + 8))(v3);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7MusicUI17PushNotifications_connection);

  sub_22A0F3260(v5);
}

@end