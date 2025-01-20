@interface InteractiveBackgroundContentView
- (UIColor)backgroundColor;
- (_TtC8AppStoreP33_7CB11EB016C41A3CC100BCE813D63B9132InteractiveBackgroundContentView)initWithCoder:(id)a3;
- (_TtC8AppStoreP33_7CB11EB016C41A3CC100BCE813D63B9132InteractiveBackgroundContentView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
@end

@implementation InteractiveBackgroundContentView

- (_TtC8AppStoreP33_7CB11EB016C41A3CC100BCE813D63B9132InteractiveBackgroundContentView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStoreP33_7CB11EB016C41A3CC100BCE813D63B9132InteractiveBackgroundContentView *)sub_10044D03C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStoreP33_7CB11EB016C41A3CC100BCE813D63B9132InteractiveBackgroundContentView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8AppStoreP33_7CB11EB016C41A3CC100BCE813D63B9132InteractiveBackgroundContentView_artworkView;
  type metadata accessor for ArtworkView();
  id v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];

  result = (_TtC8AppStoreP33_7CB11EB016C41A3CC100BCE813D63B9132InteractiveBackgroundContentView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (UIColor)backgroundColor
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for InteractiveBackgroundContentView();
  v2 = [(InteractiveBackgroundContentView *)&v4 backgroundColor];

  return v2;
}

- (void)setBackgroundColor:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for InteractiveBackgroundContentView();
  id v4 = a3;
  id v5 = v7.receiver;
  [(InteractiveBackgroundContentView *)&v7 setBackgroundColor:v4];
  id v6 = [v5 backgroundColor];
  ArtworkView.backgroundColor.setter();
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for InteractiveBackgroundContentView();
  id v2 = v3.receiver;
  [(InteractiveBackgroundContentView *)&v3 layoutSubviews];
  [v2 bounds];
  ArtworkView.frame.setter();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStoreP33_7CB11EB016C41A3CC100BCE813D63B9132InteractiveBackgroundContentView_artworkView));
}

@end