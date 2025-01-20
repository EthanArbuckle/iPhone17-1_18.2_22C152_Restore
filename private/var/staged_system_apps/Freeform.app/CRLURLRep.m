@interface CRLURLRep
- (BOOL)isAccessibilityElement;
- (BOOL)shouldShowSelectionHighlight;
- (BOOL)wantsToHandleDoubleTapsWhenLocked;
- (NSString)previewItemTitle;
- (NSURL)previewItemURL;
- (_TtC8Freeform10CRLURLItem)item;
- (_TtC8Freeform9CRLURLRep)initWithLayout:(id)a3 canvas:(id)a4;
- (void)cancelReload:(id)a3;
- (void)enterPreviewMode;
- (void)processChangedProperty:(unint64_t)a3;
- (void)willBeRemoved;
@end

@implementation CRLURLRep

- (_TtC8Freeform9CRLURLRep)initWithLayout:(id)a3 canvas:(id)a4
{
  v5 = (char *)a3;
  id v6 = a4;
  sub_100652098(v5, a4);
  return result;
}

- (void)willBeRemoved
{
  v2 = self;
  sub_1006523F4();
}

- (void)processChangedProperty:(unint64_t)a3
{
  v4 = self;
  sub_1006529DC(a3);
}

- (_TtC8Freeform10CRLURLItem)item
{
  v2 = self;
  sub_1006531EC();
  v4 = v3;

  return (_TtC8Freeform10CRLURLItem *)v4;
}

- (BOOL)shouldShowSelectionHighlight
{
  return 0;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)cancelReload:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_10065331C();

  sub_10052E2B0((uint64_t)v6);
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC8Freeform9CRLURLRep_downloadObserverIdentifier;
  uint64_t v3 = type metadata accessor for UUID();
  v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

- (BOOL)wantsToHandleDoubleTapsWhenLocked
{
  return 1;
}

- (void)enterPreviewMode
{
  v2 = self;
  sub_100FA5168();
}

- (NSURL)previewItemURL
{
  uint64_t v3 = sub_1005057FC(&qword_101672E90);
  __chkstk_darwin(v3 - 8, v4);
  id v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  CRLLinkViewHostingRep.item.getter();
  uint64_t v9 = v8;
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(ObjectType, v9);

  swift_unknownObjectRelease();
  uint64_t v11 = type metadata accessor for URL();
  uint64_t v12 = *(void *)(v11 - 8);
  v14 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v6, 1, v11) != 1)
  {
    URL._bridgeToObjectiveC()(v13);
    v14 = v15;
    (*(void (**)(char *, uint64_t))(v12 + 8))(v6, v11);
  }

  return (NSURL *)v14;
}

- (NSString)previewItemTitle
{
  v2 = self;
  CRLLinkViewHostingRep.item.getter();
  uint64_t v4 = v3;
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v4 + 16))(ObjectType, v4);
  uint64_t v7 = v6;

  swift_unknownObjectRelease();
  if (v7)
  {
    NSString v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v8 = 0;
  }

  return (NSString *)v8;
}

@end