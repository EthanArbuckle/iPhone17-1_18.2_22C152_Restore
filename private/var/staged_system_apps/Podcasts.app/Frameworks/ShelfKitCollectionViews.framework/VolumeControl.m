@interface VolumeControl
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC23ShelfKitCollectionViews13VolumeControl)init;
- (_TtC23ShelfKitCollectionViews13VolumeControl)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews13VolumeControl)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)didSlideWithGestureRecognizer:(id)a3;
- (void)didTap;
- (void)layoutSubviews;
- (void)volumeChangedWithNotification:(id)a3;
@end

@implementation VolumeControl

- (_TtC23ShelfKitCollectionViews13VolumeControl)init
{
  sub_378318();
  return result;
}

- (void)dealloc
{
  v2 = self;
  sub_378B9C();
}

- (void).cxx_destruct
{
  sub_E544((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews13VolumeControl_volumeObserver, &qword_472710);
  sub_E544((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews13VolumeControl_delegate, &qword_4834D0);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews13VolumeControl_currentVolumeGlyph));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews13VolumeControl_backdrop));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews13VolumeControl_volumeBar));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews13VolumeControl_volumeBarFill));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews13VolumeControl_volumeKnob));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews13VolumeControl_panGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews13VolumeControl_tapGestureRecognizer));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews13VolumeControl_volumeTimer);
}

- (_TtC23ShelfKitCollectionViews13VolumeControl)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_37AB04();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_378DD0();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  uint64_t v3 = qword_4709E8;
  v4 = self;
  if (v3 != -1) {
    swift_once();
  }
  unsigned long long v5 = xmmword_483418;

  *(void *)&double v7 = v5 >> 64;
  *(void *)&double v6 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)didSlideWithGestureRecognizer:(id)a3
{
  id v4 = a3;
  unsigned long long v5 = self;
  sub_3799D4(v4);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  unsigned long long v5 = self;
  LOBYTE(self) = sub_379BC4(v4);

  return self & 1;
}

- (void)didTap
{
  char v2 = *((unsigned char *)&self->super.super.super.super.isa
       + OBJC_IVAR____TtC23ShelfKitCollectionViews13VolumeControl_isExpanded);
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews13VolumeControl_isExpanded) = v2 ^ 1;
  uint64_t v3 = self;
  sub_378000(v2);
}

- (void)volumeChangedWithNotification:(id)a3
{
  id v4 = a3;
  unsigned long long v5 = self;
  sub_37A540(v4);
}

- (_TtC23ShelfKitCollectionViews13VolumeControl)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC23ShelfKitCollectionViews13VolumeControl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end