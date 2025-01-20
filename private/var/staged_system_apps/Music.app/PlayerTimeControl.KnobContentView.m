@interface PlayerTimeControl.KnobContentView
- (_TtCC5Music17PlayerTimeControlP33_49F0BC05FDBB8FE791FA6BF39E95831815KnobContentView)initWithCoder:(id)a3;
- (_TtCC5Music17PlayerTimeControlP33_49F0BC05FDBB8FE791FA6BF39E95831815KnobContentView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)tintColorDidChange;
@end

@implementation PlayerTimeControl.KnobContentView

- (_TtCC5Music17PlayerTimeControlP33_49F0BC05FDBB8FE791FA6BF39E95831815KnobContentView)initWithFrame:(CGRect)a3
{
  return (_TtCC5Music17PlayerTimeControlP33_49F0BC05FDBB8FE791FA6BF39E95831815KnobContentView *)sub_1002CC888(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC5Music17PlayerTimeControlP33_49F0BC05FDBB8FE791FA6BF39E95831815KnobContentView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtCC5Music17PlayerTimeControlP33_49F0BC05FDBB8FE791FA6BF39E95831815KnobContentView_knob;
  id v6 = objc_allocWithZone((Class)UIView);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];

  result = (_TtCC5Music17PlayerTimeControlP33_49F0BC05FDBB8FE791FA6BF39E95831815KnobContentView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1002CCA74();
}

- (void)tintColorDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PlayerTimeControl.KnobContentView();
  v2 = (char *)v5.receiver;
  [(PlayerTimeControl.KnobContentView *)&v5 tintColorDidChange];
  v3 = *(void **)&v2[OBJC_IVAR____TtCC5Music17PlayerTimeControlP33_49F0BC05FDBB8FE791FA6BF39E95831815KnobContentView_knob];
  id v4 = [v2 tintColor];
  [v3 setBackgroundColor:v4];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC5Music17PlayerTimeControlP33_49F0BC05FDBB8FE791FA6BF39E95831815KnobContentView_knob));
}

@end