@interface ActivityViewController
- (_TtC5Music22ActivityViewController)initWithActivityItems:(id)a3 applicationActivities:(id)a4;
- (int64_t)sharingStyle;
- (void)_prepareActivity:(id)a3;
- (void)setSharingStyle:(int64_t)a3;
@end

@implementation ActivityViewController

- (int64_t)sharingStyle
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ActivityViewController();
  return [(ActivityViewController *)&v3 sharingStyle];
}

- (void)setSharingStyle:(int64_t)a3
{
  v5 = (objc_class *)type metadata accessor for ActivityViewController();
  v9.receiver = self;
  v9.super_class = v5;
  v6 = self;
  id v7 = [(ActivityViewController *)&v9 sharingStyle];
  v8.receiver = v6;
  v8.super_class = v5;
  [(ActivityViewController *)&v8 setSharingStyle:a3];
  sub_1000DDA0C(v7);
}

- (void)_prepareActivity:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000DDB58(v4);
}

- (_TtC5Music22ActivityViewController)initWithActivityItems:(id)a3 applicationActivities:(id)a4
{
  result = (_TtC5Music22ActivityViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end