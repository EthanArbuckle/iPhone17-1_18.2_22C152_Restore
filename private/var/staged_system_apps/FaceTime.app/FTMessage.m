@interface FTMessage
- (BOOL)isDataAvailable;
- (BOOL)isDeleted;
- (BOOL)isRTT;
- (BOOL)isRead;
- (BOOL)isSensitive;
- (BOOL)isTranscribing;
- (BOOL)isTranscriptionAvailable;
- (BOOL)isTranscriptionRated;
- (BOOL)shouldMarkAsReadForPlaybackCurrentTime:(double)a3;
- (BOOL)transcriptionAttempted;
- (MPMessageID)identifier;
- (MPTranscriptMessage)transcript;
- (NSDate)date;
- (NSString)callbackDestinationID;
- (NSString)provider;
- (NSString)receiverDestinationID;
- (NSString)receiverISOCountryCode;
- (NSString)senderDestinationID;
- (NSString)senderISOCountryCode;
- (NSURL)dataURL;
- (NSURL)thumbnailURL;
- (NSUUID)callUUID;
- (TUHandle)senderHandle;
- (_TtC20FaceTimeMessageStore7Message)ftMessage;
- (double)duration;
- (id)contactUsingContactStore:(id)a3 withKeysToFetch:(id)a4;
- (id)displayNameUsingContactStore:(id)a3;
- (int64_t)folder;
- (int64_t)messageType;
- (void)setDataURL:(id)a3;
- (void)setFolder:(int64_t)a3;
- (void)setIsDeleted:(BOOL)a3;
- (void)setIsRead:(BOOL)a3;
- (void)setThumbnailURL:(id)a3;
- (void)setTranscript:(id)a3;
@end

@implementation FTMessage

- (_TtC20FaceTimeMessageStore7Message)ftMessage
{
  return (_TtC20FaceTimeMessageStore7Message *)*(id *)self->ftMessage;
}

- (MPMessageID)identifier
{
  uint64_t v2 = type metadata accessor for UUID();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v8 = (char *)&v15 - v7;
  swift_retain();
  dispatch thunk of Message.recordUUID.getter();
  v9 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
  v9(v6, v8, v2);
  v10 = (objc_class *)type metadata accessor for MessageID(0);
  v11 = (char *)objc_allocWithZone(v10);
  v9(&v11[OBJC_IVAR___MPMessageID_value], v6, v2);
  type metadata accessor for MessageID.Value(0);
  swift_storeEnumTagMultiPayload();
  v15.receiver = v11;
  v15.super_class = v10;
  v12 = [(FTMessage *)&v15 init];
  v13 = *(void (**)(char *, uint64_t))(v3 + 8);
  v13(v6, v2);
  v13(v8, v2);
  swift_release();

  return (MPMessageID *)v12;
}

- (NSString)provider
{
  swift_retain();
  dispatch thunk of Message.provider.getter();
  swift_release();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NSUUID)callUUID
{
  uint64_t v2 = sub_100017E2C(&qword_1000BAF20);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  dispatch thunk of Message.callUUID.getter();
  uint64_t v5 = type metadata accessor for UUID();
  uint64_t v6 = *(void *)(v5 - 8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v4, 0, 1, v5);
  swift_release();
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) != 1)
  {
    Class isa = UUID._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
  }

  return (NSUUID *)isa;
}

- (int64_t)messageType
{
  swift_retain();
  int64_t v2 = sub_10005FC60();
  swift_release();
  return v2;
}

- (TUHandle)senderHandle
{
  swift_retain();
  if (dispatch thunk of Message.isFromUnknown.getter())
  {
    swift_release();
    id v2 = 0;
  }
  else
  {
    dispatch thunk of Message.from.getter();
    uint64_t v3 = self;
    NSString v4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v2 = [v3 normalizedHandleWithDestinationID:v4];
    swift_release();
  }

  return (TUHandle *)v2;
}

- (NSString)senderDestinationID
{
  return (NSString *)sub_10005FE48((uint64_t)self, (uint64_t)a2, (uint64_t)&selRef_normalizedValue, (void (*)(uint64_t))sub_10005FED4);
}

- (NSString)senderISOCountryCode
{
  return (NSString *)sub_10005FE48((uint64_t)self, (uint64_t)a2, (uint64_t)&selRef_isoCountryCode, (void (*)(uint64_t))sub_10005FED4);
}

- (NSString)receiverDestinationID
{
  return (NSString *)sub_10005FE48((uint64_t)self, (uint64_t)a2, (uint64_t)&selRef_normalizedValue, (void (*)(uint64_t))sub_10005FFF4);
}

- (NSString)receiverISOCountryCode
{
  return (NSString *)sub_10005FE48((uint64_t)self, (uint64_t)a2, (uint64_t)&selRef_isoCountryCode, (void (*)(uint64_t))sub_10005FFF4);
}

- (NSString)callbackDestinationID
{
  swift_retain();
  if (dispatch thunk of Message.isFromUnknown.getter())
  {
    swift_release();
    NSString v2 = 0;
  }
  else
  {
    dispatch thunk of Message.from.getter();
    swift_release();
    NSString v2 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }

  return (NSString *)v2;
}

- (int64_t)folder
{
  swift_retain();
  int64_t v2 = sub_1000601E8();
  swift_release();
  return v2;
}

- (void)setFolder:(int64_t)a3
{
  self->_TtCs12_SwiftObject_opaque[OBJC_IVAR____TtC8FaceTime9FTMessage_isDirty] = 1;
  *(void *)self->$__lazy_storage_$_dirtyFolder = a3;
  self->$__lazy_storage_$_dirtyFolder[8] = 0;
}

- (BOOL)isRead
{
  if (self->_TtCs12_SwiftObject_opaque[OBJC_IVAR____TtC8FaceTime9FTMessage_isDirty] == 1)
  {
    swift_retain();
    char v2 = sub_100060274();
  }
  else
  {
    swift_retain();
    char v2 = dispatch thunk of Message.isRead.getter();
  }
  char v3 = v2;
  swift_release();
  return v3 & 1;
}

- (void)setIsRead:(BOOL)a3
{
  self->_TtCs12_SwiftObject_opaque[OBJC_IVAR____TtC8FaceTime9FTMessage_isDirty] = 1;
  self->$__lazy_storage_$_dirtyRead[0] = a3;
}

- (NSDate)date
{
  uint64_t v2 = type metadata accessor for Date();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  dispatch thunk of Message.dateCreated.getter();
  swift_release();
  v6.super.Class isa = Date._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);

  return (NSDate *)v6.super.isa;
}

- (BOOL)isTranscriptionAvailable
{
  return sub_100061914((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_100060454);
}

- (double)duration
{
  swift_retain();
  dispatch thunk of Message.duration.getter();
  double v3 = v2;
  swift_release();
  return v3;
}

- (BOOL)isTranscriptionRated
{
  return 0;
}

- (BOOL)isTranscribing
{
  return 0;
}

- (BOOL)transcriptionAttempted
{
  swift_retain();
  dispatch thunk of Message.transcriptionStatus.getter();
  int v2 = (unsigned __int16)TranscriptionStatus.rawValue.getter();
  unsigned __int16 v3 = TranscriptionStatus.rawValue.getter();
  swift_release();
  return v2 != v3;
}

- (BOOL)isDeleted
{
  return sub_100060C08() & 1;
}

- (void)setIsDeleted:(BOOL)a3
{
  self->_TtCs12_SwiftObject_opaque[OBJC_IVAR____TtC8FaceTime9FTMessage_isDirty] = 1;
  self->$__lazy_storage_$_isDeleted[0] = a3;
}

- (BOOL)isSensitive
{
  return sub_1000618B0((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))&dispatch thunk of Message.isSensitive.getter);
}

- (NSURL)dataURL
{
  uint64_t v2 = sub_100017E2C((uint64_t *)&unk_1000BAD70);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  sub_100060D80((uint64_t)v4);
  swift_release();
  uint64_t v5 = type metadata accessor for URL();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v8 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) != 1)
  {
    URL._bridgeToObjectiveC()(v7);
    uint64_t v8 = v9;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
  }

  return (NSURL *)v8;
}

- (void)setDataURL:(id)a3
{
}

- (NSURL)thumbnailURL
{
  uint64_t v2 = sub_100017E2C((uint64_t *)&unk_1000BAD70);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  sub_1000612A0(&OBJC_IVAR____TtC8FaceTime9FTMessage____lazy_storage___thumbnailURL, (uint64_t (*)(uint64_t))&dispatch thunk of Message.sandboxThumbnailFile.getter, (uint64_t)v4);
  swift_release();
  uint64_t v5 = type metadata accessor for URL();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v8 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) != 1)
  {
    URL._bridgeToObjectiveC()(v7);
    uint64_t v8 = v9;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
  }

  return (NSURL *)v8;
}

- (void)setThumbnailURL:(id)a3
{
}

- (BOOL)isRTT
{
  return sub_1000618B0((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))&dispatch thunk of Message.isRTT.getter);
}

- (BOOL)isDataAvailable
{
  return sub_100061914((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_100061954);
}

- (MPTranscriptMessage)transcript
{
  swift_retain();
  uint64_t v2 = (void *)sub_1000608EC();
  swift_release();

  return (MPTranscriptMessage *)v2;
}

- (void)setTranscript:(id)a3
{
  uint64_t v3 = *(void *)&self->_TtCs12_SwiftObject_opaque[OBJC_IVAR____TtC8FaceTime9FTMessage____lazy_storage___transcript];
  *(void *)&self->_TtCs12_SwiftObject_opaque[OBJC_IVAR____TtC8FaceTime9FTMessage____lazy_storage___transcript] = a3;
  swift_unknownObjectRetain();

  sub_100063C2C(v3);
}

- (BOOL)shouldMarkAsReadForPlaybackCurrentTime:(double)a3
{
  swift_retain();
  BOOL v4 = sub_1000626C4(a3);
  swift_release();
  return v4;
}

- (id)contactUsingContactStore:(id)a3 withKeysToFetch:(id)a4
{
  sub_100017E2C(&qword_1000BAD60);
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v5 = a3;
  swift_retain();
  id v6 = sub_100062794(v5);

  swift_release();
  swift_bridgeObjectRelease();

  return v6;
}

- (id)displayNameUsingContactStore:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_100062990(v3);
  uint64_t v5 = v4;

  swift_release();
  if (v5)
  {
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }

  return v6;
}

@end