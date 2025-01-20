@interface ToastWindow
- (BOOL)overridesOrientationLock;
- (_TtC8VideosUIP33_CEC0FAA63D95F28694C5A7BD137F0AC111ToastWindow)initWithCoder:(id)a3;
- (_TtC8VideosUIP33_CEC0FAA63D95F28694C5A7BD137F0AC111ToastWindow)initWithFrame:(CGRect)a3;
- (_TtC8VideosUIP33_CEC0FAA63D95F28694C5A7BD137F0AC111ToastWindow)initWithWindowScene:(id)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation ToastWindow

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return sub_1E363EAB0((uint64_t)self, (uint64_t)a2, a4);
}

- (_TtC8VideosUIP33_CEC0FAA63D95F28694C5A7BD137F0AC111ToastWindow)initWithWindowScene:(id)a3
{
  return (_TtC8VideosUIP33_CEC0FAA63D95F28694C5A7BD137F0AC111ToastWindow *)sub_1E363EB34(a3);
}

- (_TtC8VideosUIP33_CEC0FAA63D95F28694C5A7BD137F0AC111ToastWindow)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUIP33_CEC0FAA63D95F28694C5A7BD137F0AC111ToastWindow *)sub_1E363EBB0();
}

- (_TtC8VideosUIP33_CEC0FAA63D95F28694C5A7BD137F0AC111ToastWindow)initWithCoder:(id)a3
{
  return (_TtC8VideosUIP33_CEC0FAA63D95F28694C5A7BD137F0AC111ToastWindow *)sub_1E363EC24(a3);
}

- (BOOL)overridesOrientationLock
{
  return sub_1E363ED18() & 1;
}

@end