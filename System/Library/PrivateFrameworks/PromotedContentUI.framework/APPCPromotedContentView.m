@interface APPCPromotedContentView
- (APPCPromotedContentView)initWithCoder:(id)a3;
- (APPCPromotedContentView)initWithFrame:(CGRect)a3;
- (CGRect)frame;
- (NSString)description;
- (int64_t)readiness;
- (void)dealloc;
- (void)layoutSubviews;
- (void)newsTransparencyViewControllerDidDismiss:(id)a3;
- (void)safariViewControllerDidFinish:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setReadiness:(int64_t)a3;
- (void)sizeCategoryChanged:(id)a3;
- (void)tapRecognized:(id)a3;
- (void)tappedPrivacyMarker:(id)a3;
@end

@implementation APPCPromotedContentView

- (void)safariViewControllerDidFinish:(id)a3
{
  uint64_t v4 = qword_1EB849898;
  id v10 = a3;
  v5 = self;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_1B5DBA938();
  sub_1B5CEFDCC(v6, (uint64_t)qword_1EB84BA88);
  v7 = sub_1B5DBA918();
  os_log_type_t v8 = sub_1B5DBAD88();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1B5CE2000, v7, v8, "Safari view controller did finish.", v9, 2u);
    MEMORY[0x1BA9AC560](v9, -1, -1);
  }
}

- (int64_t)readiness
{
  return *(int64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___APPCPromotedContentView_readiness);
}

- (void)setReadiness:(int64_t)a3
{
  uint64_t v4 = self;
  sub_1B5D2B910(a3);
}

- (CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PromotedContentView();
  [(APPCPromotedContentView *)&v6 frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  os_log_type_t v8 = (objc_class *)type metadata accessor for PromotedContentView();
  v20.receiver = self;
  v20.super_class = v8;
  v9 = self;
  [(APPCPromotedContentView *)&v20 frame];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  v19.receiver = v9;
  v19.super_class = v8;
  -[APPCPromotedContentView setFrame:](&v19, sel_setFrame_, x, y, width, height);
  [(APPCPromotedContentView *)v9 frame];
  v22.origin.double x = v11;
  v22.origin.double y = v13;
  v22.size.double width = v15;
  v22.size.double height = v17;
  if (!CGRectEqualToRect(v21, v22))
  {
    id v18 = sub_1B5D2B07C();
    (*(void (**)(id))((*MEMORY[0x1E4FBC8C8] & (uint64_t)v9->super.super.super.isa) + 0x2C0))(v18);
  }
}

- (NSString)description
{
  double v2 = self;
  sub_1B5D2BBC4();

  double v3 = (void *)sub_1B5DBAAC8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (APPCPromotedContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  _s17PromotedContentUI0aB4ViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)dealloc
{
  double v2 = self;
  PromotedContentView.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___APPCPromotedContentView_expandedAdTapGestureRecognizer));
  swift_unknownObjectRelease();

  sub_1B5CF6804((uint64_t)self + OBJC_IVAR___APPCPromotedContentView_interactionDelegate);
  sub_1B5CF6804((uint64_t)self + OBJC_IVAR___APPCPromotedContentView_interactionPresentationDelegate);

  sub_1B5CEF924((uint64_t)self + OBJC_IVAR___APPCPromotedContentView_videoActionTimestamp, &qword_1EB847E58);
  id v3 = (char *)self + OBJC_IVAR___APPCPromotedContentView_urlOpener;
  sub_1B5CEE588((uint64_t)v3);
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for PromotedContentView();
  double v2 = v4.receiver;
  [(APPCPromotedContentView *)&v4 layoutSubviews];
  id v3 = sub_1B5D2B07C();
  (*(void (**)(id))((*MEMORY[0x1E4FBC8C8] & *v2) + 0x2C0))(v3);
}

- (void)sizeCategoryChanged:(id)a3
{
  uint64_t v3 = sub_1B5DB9698();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  objc_super v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B5DB9688();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (APPCPromotedContentView)initWithFrame:(CGRect)a3
{
  CGRect result = (APPCPromotedContentView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)tappedPrivacyMarker:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1B5D381E0();
}

- (void)newsTransparencyViewControllerDidDismiss:(id)a3
{
  uint64_t v5 = (char *)self + OBJC_IVAR___APPCPromotedContentView_interactionDelegate;
  if (MEMORY[0x1BA9AC660]((char *)self + OBJC_IVAR___APPCPromotedContentView_interactionDelegate, a2))
  {
    uint64_t v6 = *((void *)v5 + 1);
    uint64_t ObjectType = swift_getObjectType();
    os_log_type_t v8 = *(void (**)(id, uint64_t, uint64_t))(v6 + 24);
    id v9 = a3;
    double v10 = self;
    v8(v9, ObjectType, v6);

    swift_unknownObjectRelease();
  }
}

- (void)tapRecognized:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___APPCPromotedContentView_tapGestureRecognizer);
  id v5 = a3;
  uint64_t v6 = self;
  id v7 = v4;
  sub_1B5D87FC4((uint64_t)v7);
}

@end