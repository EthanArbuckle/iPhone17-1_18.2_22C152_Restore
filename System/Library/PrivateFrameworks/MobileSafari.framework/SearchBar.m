@interface SearchBar
- (BOOL)becomeFirstResponder;
- (BOOL)textFieldShouldBeginEditing:(id)a3;
- (BOOL)textFieldShouldEndEditing:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (_TtC12MobileSafari9SearchBar)initWithCoder:(id)a3;
- (_TtC12MobileSafari9SearchBar)initWithFrame:(CGRect)a3;
- (void)didReceiveHover:(id)a3;
- (void)layoutMarginsDidChange;
- (void)layoutSubviews;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
- (void)updateConstraints;
@end

@implementation SearchBar

- (_TtC12MobileSafari9SearchBar)initWithFrame:(CGRect)a3
{
  return (_TtC12MobileSafari9SearchBar *)sub_18C689110(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12MobileSafari9SearchBar)initWithCoder:(id)a3
{
  return (_TtC12MobileSafari9SearchBar *)sub_18C689424(a3);
}

- (void)didReceiveHover:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_18C68AF78(v4);
}

- (void)layoutMarginsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SearchBar();
  id v2 = v3.receiver;
  [(SearchBar *)&v3 layoutMarginsDidChange];
  objc_msgSend(v2, sel_setNeedsUpdateConstraints, v3.receiver, v3.super_class);
}

- (void)layoutSubviews
{
  id v2 = self;
  sub_18C68B178();
}

- (void)updateConstraints
{
  id v2 = self;
  sub_18C68B2B4();
}

- (BOOL)becomeFirstResponder
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC12MobileSafari9SearchBar_searchField), sel_becomeFirstResponder);
}

- (void)textFieldDidBeginEditing:(id)a3
{
}

- (void)textFieldDidEndEditing:(id)a3
{
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  if (*((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC12MobileSafari9SearchBar_isEnabled) == 1)
  {
    id v4 = *(uint64_t (**)(uint64_t))((char *)&self->super.super.super.isa
                                           + OBJC_IVAR____TtC12MobileSafari9SearchBar_shouldBeginSearching);
    id v5 = a3;
    v6 = self;
    uint64_t v7 = sub_18C6F7B98();
    char v8 = v4(v7);

    swift_release();
  }
  else
  {
    char v8 = 0;
  }
  return v8 & 1;
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari9SearchBar_searchFieldBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari9SearchBar____lazy_storage___searchFieldBackgroundToDoneButtonConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari9SearchBar____lazy_storage___searchFieldHeightConstraint));

  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12MobileSafari9SearchBar____lazy_storage___blurRadius);
}

@end