@interface LibraryCell
- (BOOL)isSelected;
- (WFExecutableAppShortcut)autoShortcut;
- (WFWorkflowReference)workflowReference;
- (_TtC9Shortcuts11LibraryCell)initWithCoder:(id)a3;
- (_TtC9Shortcuts11LibraryCell)initWithFrame:(CGRect)a3;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAutoShortcut:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setWorkflowReference:(id)a3;
@end

@implementation LibraryCell

- (BOOL)isSelected
{
  v2 = self;
  unsigned __int8 v3 = sub_1000184D8();

  return v3 & 1;
}

- (_TtC9Shortcuts11LibraryCell)initWithFrame:(CGRect)a3
{
  return (_TtC9Shortcuts11LibraryCell *)sub_100018554();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100018AFC();
}

- (WFWorkflowReference)workflowReference
{
  v2 = sub_1000AD148();

  return (WFWorkflowReference *)v2;
}

- (void)setWorkflowReference:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_10001D5A8((uint64_t)a3);
}

- (WFExecutableAppShortcut)autoShortcut
{
  v2 = sub_1000AD208();

  return (WFExecutableAppShortcut *)v2;
}

- (void)setAutoShortcut:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1000AD294((uint64_t)a3);
}

- (_TtC9Shortcuts11LibraryCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000AD60C();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1000AD83C();
}

- (void)setSelected:(BOOL)a3
{
  v4 = self;
  sub_1000ADC08(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9Shortcuts11LibraryCell_hostingView));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9Shortcuts11LibraryCell_observation));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9Shortcuts11LibraryCell_workflowReference));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9Shortcuts11LibraryCell_autoShortcut));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9Shortcuts11LibraryCell_layoutMetrics));
  sub_10002D6C4((uint64_t)self + OBJC_IVAR____TtC9Shortcuts11LibraryCell_delegate);
  sub_10002354C(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC9Shortcuts11LibraryCell____lazy_storage___run));
  sub_10002354C(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC9Shortcuts11LibraryCell____lazy_storage___stop));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC9Shortcuts11LibraryCell____lazy_storage___accessibilitySelect);

  sub_10002354C(v3);
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1000ADE88();
  v10 = v9;

  return v10;
}

@end