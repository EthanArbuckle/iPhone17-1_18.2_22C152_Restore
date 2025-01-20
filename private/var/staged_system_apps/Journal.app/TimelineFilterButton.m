@interface TimelineFilterButton
- (UIBezierPath)accessibilityPath;
- (_TtC7Journal20TimelineFilterButton)initWithCoder:(id)a3;
- (_TtC7Journal20TimelineFilterButton)initWithFrame:(CGRect)a3;
- (void)updateConfiguration;
@end

@implementation TimelineFilterButton

- (_TtC7Journal20TimelineFilterButton)initWithFrame:(CGRect)a3
{
  return (_TtC7Journal20TimelineFilterButton *)sub_1000C24D0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Journal20TimelineFilterButton)initWithCoder:(id)a3
{
  return (_TtC7Journal20TimelineFilterButton *)sub_1000C25E8(a3);
}

- (void)updateConfiguration
{
  uint64_t v3 = sub_100010218(&qword_1007F9770);
  __chkstk_darwin(v3 - 8);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for UIButton.Configuration();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = self;
  sub_1000C2E00((char)[(TimelineFilterButton *)v10 isSelected]);
  if (qword_1007F7BE0 != -1) {
    swift_once();
  }
  id v11 = (id)qword_10083E8C8;
  UIButton.Configuration.image.setter();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v5, v9, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  UIButton.configuration.setter();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (UIBezierPath)accessibilityPath
{
  v2 = self;
  if ([(TimelineFilterButton *)v2 isSelected]
    && (id v3 = [(TimelineFilterButton *)v2 superview]) != 0)
  {
    uint64_t v4 = v3;
    [v3 accessibilityFrame];
    v9 = [self bezierPathWithRect:v5, v6, v7, v8];
  }
  else
  {
    v11.receiver = v2;
    v11.super_class = (Class)type metadata accessor for TimelineFilterButton();
    v9 = [(TimelineFilterButton *)&v11 accessibilityPath];
  }

  return v9;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1000109BC((uint64_t)self + OBJC_IVAR____TtC7Journal20TimelineFilterButton_filtersDelegate);
  swift_release();

  swift_release();
}

@end