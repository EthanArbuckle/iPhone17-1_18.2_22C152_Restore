@interface FMBTDistanceView
- (_TtC10TVRemoteUI16FMBTDistanceView)init;
- (_TtC10TVRemoteUI16FMBTDistanceView)initWithCoder:(id)a3;
- (_TtC10TVRemoteUI16FMBTDistanceView)initWithFrame:(CGRect)a3;
@end

@implementation FMBTDistanceView

- (_TtC10TVRemoteUI16FMBTDistanceView)init
{
  return (_TtC10TVRemoteUI16FMBTDistanceView *)FMBTDistanceView.init()();
}

- (_TtC10TVRemoteUI16FMBTDistanceView)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized FMBTDistanceView.init(coder:)();
}

- (_TtC10TVRemoteUI16FMBTDistanceView)initWithFrame:(CGRect)a3
{
  result = (_TtC10TVRemoteUI16FMBTDistanceView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI16FMBTDistanceView_distanceLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI16FMBTDistanceView_bottomRowStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI16FMBTDistanceView_hintLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI16FMBTDistanceView_connectingActivityViewContainer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI16FMBTDistanceView_connectingActivityView));
  id v3 = (id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC10TVRemoteUI16FMBTDistanceView_style);
  v4 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC10TVRemoteUI16FMBTDistanceView_style);
  v5 = *(void **)((char *)&self->super.super.super._responderFlags + OBJC_IVAR____TtC10TVRemoteUI16FMBTDistanceView_style);
  id v6 = v4;
}

@end