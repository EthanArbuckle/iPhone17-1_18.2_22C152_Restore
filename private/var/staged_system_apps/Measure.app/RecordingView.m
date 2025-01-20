@interface RecordingView
- (_TtC7Measure13RecordingView)initWithCoder:(id)a3;
- (_TtC7Measure13RecordingView)initWithFrame:(CGRect)a3;
- (void)stopRecording;
- (void)updateForCurrentOrientation;
@end

@implementation RecordingView

- (_TtC7Measure13RecordingView)initWithFrame:(CGRect)a3
{
  return (_TtC7Measure13RecordingView *)sub_1001BD44C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Measure13RecordingView)initWithCoder:(id)a3
{
  result = (_TtC7Measure13RecordingView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)updateForCurrentOrientation
{
  v2 = self;
  sub_1001BD954();
}

- (void)stopRecording
{
  v2 = self;
  sub_1001BDB88();
}

@end