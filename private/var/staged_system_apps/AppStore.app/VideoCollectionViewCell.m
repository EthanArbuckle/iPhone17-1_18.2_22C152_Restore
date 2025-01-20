@interface VideoCollectionViewCell
- (_TtC8AppStore23VideoCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore23VideoCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation VideoCollectionViewCell

- (_TtC8AppStore23VideoCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  static VideoConfiguration.defaultConfiguration.getter();
  swift_unknownObjectWeakInit();

  v11.receiver = v7;
  v11.super_class = (Class)type metadata accessor for VideoCollectionViewCell();
  v8 = -[VideoCollectionViewCell initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
  id v9 = [(VideoCollectionViewCell *)v8 contentView];
  [v9 setLayoutMargins:UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right];

  return v8;
}

- (_TtC8AppStore23VideoCollectionViewCell)initWithCoder:(id)a3
{
  id v4 = a3;
  static VideoConfiguration.defaultConfiguration.getter();
  swift_unknownObjectWeakInit();

  result = (_TtC8AppStore23VideoCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for VideoCollectionViewCell();
  id v2 = v3.receiver;
  [(VideoCollectionViewCell *)&v3 prepareForReuse];
  sub_1002005C8();
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for VideoCollectionViewCell();
  id v2 = v13.receiver;
  [(VideoCollectionViewCell *)&v13 layoutSubviews];
  id v3 = [v2 contentView];
  sub_10003A33C();
  LayoutMarginsAware<>.layoutFrame.getter();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  [Strong setFrame:v5, v7, v9, v11];
}

- (void).cxx_destruct
{
  id v2 = (char *)self + OBJC_IVAR____TtC8AppStore23VideoCollectionViewCell_configuration;
  uint64_t v3 = type metadata accessor for VideoConfiguration();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);

  swift_unknownObjectWeakDestroy();
}

@end