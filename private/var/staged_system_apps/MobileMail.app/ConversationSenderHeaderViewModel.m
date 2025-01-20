@interface ConversationSenderHeaderViewModel
- (BOOL)forceCollapsed;
- (BOOL)isBucketSelected;
- (EMCollectionItemID)itemID;
- (MUISenderHeaderColors)headerColors;
- (NSString)informationButtonTitle;
- (NSString)title;
- (UIImage)avatar;
- (_TtC10MobileMail33ConversationSenderHeaderViewModel)init;
- (_TtC10MobileMail33ConversationSenderHeaderViewModel)initWithItemID:(id)a3 avatar:(id)a4 avatarType:(int64_t)a5 title:(id)a6 bucket:(int64_t)a7 isBucketSelected:(BOOL)a8 categoryMessageCount:(int64_t)a9 totalMessageCount:(int64_t)a10 newMessageCount:(int64_t)a11 unreadMessageCount:(int64_t)a12 forceCollapsed:(BOOL)a13 headerColors:(id)a14;
- (id)copyWithZone:(void *)a3;
- (int64_t)avatarType;
- (int64_t)bucket;
- (void)setAvatar:(id)a3;
- (void)setAvatarType:(int64_t)a3;
- (void)setBucket:(int64_t)a3;
- (void)setForceCollapsed:(BOOL)a3;
- (void)setHeaderColors:(id)a3;
- (void)setInformationButtonTitle:(id)a3;
- (void)setIsBucketSelected:(BOOL)a3;
- (void)setItemID:(id)a3;
- (void)setTitle:(id)a3;
- (void)updateSubtitleInformationWithBucket:(int64_t)a3 isBucketSelected:(BOOL)a4 categoryMessageCount:(int64_t)a5 totalMessageCount:(int64_t)a6 unreadMessageCount:(int64_t)a7 newMessageCount:(int64_t)a8;
@end

@implementation ConversationSenderHeaderViewModel

- (EMCollectionItemID)itemID
{
  v2 = self;
  id v5 = (id)sub_100292BB8();

  return (EMCollectionItemID *)v5;
}

- (void)setItemID:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_100292C70((uint64_t)a3);
}

- (UIImage)avatar
{
  v2 = self;
  id v5 = sub_100292D50();

  return (UIImage *)v5;
}

- (void)setAvatar:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100292E08(a3);
}

- (int64_t)avatarType
{
  v2 = self;
  int64_t v5 = sub_100292ED4();

  return v5;
}

- (void)setAvatarType:(int64_t)a3
{
  v3 = self;
  sub_100292F80(a3);
}

- (NSString)title
{
  v2 = self;
  sub_100293068();

  id v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v5;
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v5 = self;
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  sub_100293138(v6, v7);
}

- (int64_t)bucket
{
  v2 = self;
  int64_t v5 = sub_100293224();

  return v5;
}

- (void)setBucket:(int64_t)a3
{
  v3 = self;
  sub_1002932D0(a3);
}

- (BOOL)isBucketSelected
{
  v2 = self;
  sub_100293394();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (void)setIsBucketSelected:(BOOL)a3
{
  v3 = self;
  char v4 = _convertObjCBoolToBool(_:)();
  sub_100293450(v4 & 1);
}

- (NSString)informationButtonTitle
{
  v2 = self;
  sub_100293594();
  uint64_t v8 = v3;

  if (v8)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v6 = v5;
  }
  else
  {
    id v6 = 0;
  }

  return (NSString *)v6;
}

- (void)setInformationButtonTitle:(id)a3
{
  id v3 = a3;
  char v4 = self;
  if (a3)
  {
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v5;

    uint64_t v8 = v6;
    uint64_t v9 = v7;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v9 = 0;
  }
  sub_1002936C4(v8, v9);
}

- (BOOL)forceCollapsed
{
  v2 = self;
  sub_1002937B8();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (void)setForceCollapsed:(BOOL)a3
{
  id v3 = self;
  char v4 = _convertObjCBoolToBool(_:)();
  sub_100293874(v4 & 1);
}

- (MUISenderHeaderColors)headerColors
{
  v2 = self;
  id v5 = sub_100293954();

  return (MUISenderHeaderColors *)v5;
}

- (void)setHeaderColors:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100293A0C(a3);
}

- (_TtC10MobileMail33ConversationSenderHeaderViewModel)initWithItemID:(id)a3 avatar:(id)a4 avatarType:(int64_t)a5 title:(id)a6 bucket:(int64_t)a7 isBucketSelected:(BOOL)a8 categoryMessageCount:(int64_t)a9 totalMessageCount:(int64_t)a10 newMessageCount:(int64_t)a11 unreadMessageCount:(int64_t)a12 forceCollapsed:(BOOL)a13 headerColors:(id)a14
{
  swift_unknownObjectRetain();
  id v14 = a4;
  id v15 = a6;
  id v16 = a14;
  uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v23 = v17;
  char v25 = _convertObjCBoolToBool(_:)();
  char v18 = _convertObjCBoolToBool(_:)();
  v28 = (_TtC10MobileMail33ConversationSenderHeaderViewModel *)sub_100293B60((uint64_t)a3, a4, a5, v22, v23, a7, v25 & 1, a9, a10, a11, a12, v18 & 1, a14);

  return v28;
}

- (id)copyWithZone:(void *)a3
{
  uint64_t v7 = self;
  v6[1] = a3;
  id v3 = self;
  v13 = v15;
  sub_1002943A8(v15);

  uint64_t v11 = v16;
  id v4 = sub_100270FC0(v15, v16);
  uint64_t v9 = *(void *)(v11 - 8);
  uint64_t v10 = v11 - 8;
  unint64_t v8 = (*(void *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v4);
  v12 = (char *)v6 - v8;
  (*(void (**)(void))(v9 + 16))();
  id v14 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v11);
  sub_10023B0BC((uint64_t)v13);
  return v14;
}

- (void)updateSubtitleInformationWithBucket:(int64_t)a3 isBucketSelected:(BOOL)a4 categoryMessageCount:(int64_t)a5 totalMessageCount:(int64_t)a6 unreadMessageCount:(int64_t)a7 newMessageCount:(int64_t)a8
{
  unint64_t v8 = self;
  char v9 = _convertObjCBoolToBool(_:)();
  sub_1002947D4(a3, v9 & 1, a5, a6, a7, a8);
}

- (_TtC10MobileMail33ConversationSenderHeaderViewModel)init
{
  return (_TtC10MobileMail33ConversationSenderHeaderViewModel *)sub_10029494C();
}

- (void).cxx_destruct
{
  sub_10024C328((id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10MobileMail33ConversationSenderHeaderViewModel_headerColors));
}

@end