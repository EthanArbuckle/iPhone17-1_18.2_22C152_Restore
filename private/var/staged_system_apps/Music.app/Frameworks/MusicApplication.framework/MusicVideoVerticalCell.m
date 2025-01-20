@interface MusicVideoVerticalCell
+ (unint64_t)visualContentInsets;
- (BOOL)accessibilityIsExplicit;
- (CGRect)bounds;
- (CGRect)frame;
- (NSString)headline;
- (NSString)subtitle;
- (NSString)title;
- (_TtC16MusicApplication22MusicVideoVerticalCell)initWithCoder:(id)a3;
- (_TtC16MusicApplication22MusicVideoVerticalCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHeadline:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation MusicVideoVerticalCell

- (_TtC16MusicApplication22MusicVideoVerticalCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication22MusicVideoVerticalCell *)sub_2E5A50(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication22MusicVideoVerticalCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2E74C8();
}

- (NSString)headline
{
  return (NSString *)sub_42EA8();
}

- (void)setHeadline:(id)a3
{
}

- (NSString)title
{
  return (NSString *)sub_42EA8();
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return (NSString *)sub_42EA8();
}

- (void)setSubtitle:(id)a3
{
}

- (CGRect)frame
{
  sub_2E6404(self, (uint64_t)a2, (SEL *)&selRef_frame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
}

- (CGRect)bounds
{
  sub_2E6404(self, (uint64_t)a2, (SEL *)&selRef_bounds);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
}

- (void)layoutSubviews
{
  double v2 = self;
  sub_2E6680();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_2E6974((uint64_t)a3);
}

- (BOOL)accessibilityIsExplicit
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.super.isa
                  + OBJC_IVAR____TtC16MusicApplication22MusicVideoVerticalCell_badgeView);
  return v2 && sub_4C10E0(0, *(void *)(v2 + OBJC_IVAR____TtC16MusicApplication9BadgeView_badgeSet));
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22MusicVideoVerticalCell_badgeView));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  swift_release();
}

+ (unint64_t)visualContentInsets
{
  sub_2E6DFC();
  unint64_t v1 = v0;
  if (qword_DBDB80 != -1) {
    swift_once();
  }
  if (!(v1 >> 62))
  {
    uint64_t v2 = *(void *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
    if (v2) {
      goto LABEL_5;
    }
LABEL_12:
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_AB8300();
  if (!v2) {
    goto LABEL_12;
  }
LABEL_5:
  unint64_t result = v2 - 1;
  if (__OFSUB__(v2, 1))
  {
    __break(1u);
    goto LABEL_15;
  }
  if ((v1 & 0xC000000000000001) != 0)
  {
LABEL_15:
    sub_AB8090();
    goto LABEL_10;
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (result < *(void *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFFF8)))
  {
    swift_retain();
LABEL_10:
    swift_bridgeObjectRelease();
    swift_beginAccess();
    swift_release();
LABEL_13:
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    return swift_release();
  }
  __break(1u);
  return result;
}

@end