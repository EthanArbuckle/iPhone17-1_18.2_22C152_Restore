@interface FormatLabelLinkHandler
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (_TtC8NewsFeed22FormatLabelLinkHandler)init;
- (void)didTap:(id)a3;
@end

@implementation FormatLabelLinkHandler

- (_TtC8NewsFeed22FormatLabelLinkHandler)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8NewsFeed22FormatLabelLinkHandler_tapGestureRecognizer) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8NewsFeed22FormatLabelLinkHandler_link) = 0;
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8NewsFeed22FormatLabelLinkHandler_linkBlock);
  void *v4 = 0;
  v4[1] = 0;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return [(FormatLabelLinkHandler *)&v6 init];
}

- (void)didTap:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C0FB80B4(v4);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();

  swift_release();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8NewsFeed22FormatLabelLinkHandler_linkBlock);
  sub_1BFC3E5C0(v3);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1C0FB83AC(v4);

  return self & 1;
}

@end