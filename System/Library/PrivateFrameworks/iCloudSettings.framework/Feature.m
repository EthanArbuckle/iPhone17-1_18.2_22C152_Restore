@interface Feature
- (NSString)bundleIdentifier;
- (NSString)featureId;
- (NSString)iTunesItemId;
- (NSString)subtitle;
- (NSString)title;
- (_TtC14iCloudSettings5Icons)icons;
- (_TtC14iCloudSettings6Action)action;
- (_TtC14iCloudSettings7Feature)init;
- (_TtC14iCloudSettings7Feature)initWithFeatureId:(id)a3 title:(id)a4 subtitle:(id)a5 icons:(id)a6 action:(id)a7 iTunesItemId:(id)a8 bundleIdentifier:(id)a9;
- (id)init:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation Feature

- (NSString)title
{
  return (NSString *)sub_262ADA1A0();
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return (NSString *)sub_262ADA1A0();
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)featureId
{
  return (NSString *)sub_2629FBBF8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC14iCloudSettings7Feature_featureId);
}

- (_TtC14iCloudSettings6Action)action
{
  return (_TtC14iCloudSettings6Action *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                + OBJC_IVAR____TtC14iCloudSettings7Feature_action));
}

- (NSString)iTunesItemId
{
  return (NSString *)sub_2629FBBF8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC14iCloudSettings7Feature_iTunesItemId);
}

- (NSString)bundleIdentifier
{
  return (NSString *)sub_2629FBBF8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC14iCloudSettings7Feature_bundleIdentifier);
}

- (_TtC14iCloudSettings5Icons)icons
{
  return (_TtC14iCloudSettings5Icons *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                               + OBJC_IVAR____TtC14iCloudSettings7Feature_icons));
}

- (id)init:(id)a3
{
  uint64_t v3 = sub_262B04408();
  return Feature.init(_:)(v3);
}

- (_TtC14iCloudSettings7Feature)initWithFeatureId:(id)a3 title:(id)a4 subtitle:(id)a5 icons:(id)a6 action:(id)a7 iTunesItemId:(id)a8 bundleIdentifier:(id)a9
{
  uint64_t v11 = sub_262B04488();
  uint64_t v13 = v12;
  uint64_t v14 = sub_262B04488();
  uint64_t v16 = v15;
  uint64_t v17 = sub_262B04488();
  uint64_t v19 = v18;
  if (!a8)
  {
    uint64_t v20 = 0;
    if (a9) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v22 = 0;
    uint64_t v23 = 0;
    goto LABEL_6;
  }
  uint64_t v20 = sub_262B04488();
  a8 = v21;
  if (!a9) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v22 = sub_262B04488();
LABEL_6:
  v24 = (uint64_t *)((char *)self + OBJC_IVAR____TtC14iCloudSettings7Feature_featureId);
  uint64_t *v24 = v11;
  v24[1] = v13;
  v25 = (uint64_t *)((char *)self + OBJC_IVAR____TtC14iCloudSettings7Feature_title);
  uint64_t *v25 = v14;
  v25[1] = v16;
  v26 = (uint64_t *)((char *)self + OBJC_IVAR____TtC14iCloudSettings7Feature_subtitle);
  uint64_t *v26 = v17;
  v26[1] = v19;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14iCloudSettings7Feature_action) = (Class)a7;
  v27 = (uint64_t *)((char *)self + OBJC_IVAR____TtC14iCloudSettings7Feature_iTunesItemId);
  uint64_t *v27 = v20;
  v27[1] = (uint64_t)a8;
  v28 = (uint64_t *)((char *)self + OBJC_IVAR____TtC14iCloudSettings7Feature_bundleIdentifier);
  uint64_t *v28 = v22;
  v28[1] = v23;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14iCloudSettings7Feature_icons) = (Class)a6;
  v34.receiver = self;
  v34.super_class = (Class)type metadata accessor for Feature();
  id v29 = a6;
  id v30 = a7;
  return [(Feature *)&v34 init];
}

- (_TtC14iCloudSettings7Feature)init
{
  result = (_TtC14iCloudSettings7Feature *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14iCloudSettings7Feature_icons);
}

@end