@interface PlaybackTrackMask
- (_TtC9SeymourUI17PlaybackTrackMask)initWithCoder:(id)a3;
- (_TtC9SeymourUI17PlaybackTrackMask)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PlaybackTrackMask

- (_TtC9SeymourUI17PlaybackTrackMask)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for PlaybackTrackMask();
  v7 = -[PlaybackTrackMask initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  v8 = self;
  v9 = v7;
  id v10 = objc_msgSend(v8, sel_blackColor);
  [(PlaybackTrackMask *)v9 setBackgroundColor:v10];

  return v9;
}

- (_TtC9SeymourUI17PlaybackTrackMask)initWithCoder:(id)a3
{
  result = (_TtC9SeymourUI17PlaybackTrackMask *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for PlaybackTrackMask();
  id v2 = v4.receiver;
  [(PlaybackTrackMask *)&v4 layoutSubviews];
  id v3 = objc_msgSend(v2, sel_layer, v4.receiver, v4.super_class);
  objc_msgSend(v2, sel_bounds);
  objc_msgSend(v3, sel_setCornerRadius_, CGRectGetHeight(v5) * 0.5);
}

@end