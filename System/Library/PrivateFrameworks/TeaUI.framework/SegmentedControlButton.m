@interface SegmentedControlButton
- (_TtC5TeaUI22SegmentedControlButton)initWithCoder:(id)a3;
- (_TtC5TeaUI22SegmentedControlButton)initWithFrame:(CGRect)a3;
@end

@implementation SegmentedControlButton

- (_TtC5TeaUI22SegmentedControlButton)initWithCoder:(id)a3
{
  id v3 = a3;
  SegmentedControlButton.init(coder:)();
}

- (_TtC5TeaUI22SegmentedControlButton)initWithFrame:(CGRect)a3
{
  return (_TtC5TeaUI22SegmentedControlButton *)SegmentedControlButton.init(frame:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI22SegmentedControlButton_onTap));
}

@end