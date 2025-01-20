@interface LibraryMenuViewController.Cell
- (_TtCC16MusicApplication25LibraryMenuViewController4Cell)initWithCoder:(id)a3;
- (_TtCC16MusicApplication25LibraryMenuViewController4Cell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)layoutMarginsDidChange;
- (void)layoutSubviews;
- (void)music_inheritedLayoutInsetsDidChange;
- (void)prepareForReuse;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation LibraryMenuViewController.Cell

- (_TtCC16MusicApplication25LibraryMenuViewController4Cell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)sub_AB6510();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtCC16MusicApplication25LibraryMenuViewController4Cell *)sub_21A248(a3, (uint64_t)a4, v6);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for LibraryMenuViewController.Cell();
  id v6 = v8.receiver;
  [(LibraryMenuViewController.Cell *)&v8 setSelected:v5 animated:v4];
  v7 = &UIAccessibilityTraitNone;
  if (v5) {
    v7 = &UIAccessibilityTraitSelected;
  }
  [v6 setAccessibilityTraits:*v7];
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v6 = self;
  unsigned int v7 = [(LibraryMenuViewController.Cell *)v6 isEditing];
  v8.receiver = v6;
  v8.super_class = (Class)type metadata accessor for LibraryMenuViewController.Cell();
  [(LibraryMenuViewController.Cell *)&v8 setEditing:v5 animated:v4];
  if (v7 != v5) {
    [(LibraryMenuViewController.Cell *)v6 invalidateIntrinsicContentSize];
  }
}

- (_TtCC16MusicApplication25LibraryMenuViewController4Cell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_21CEB0();
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LibraryMenuViewController.Cell();
  id v2 = v3.receiver;
  [(LibraryMenuViewController.Cell *)&v3 prepareForReuse];
  sub_21B1AC();
}

- (void)layoutSubviews
{
  id v2 = self;
  sub_21ACE0();
}

- (void)music_inheritedLayoutInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LibraryMenuViewController.Cell();
  id v2 = v3.receiver;
  [(LibraryMenuViewController.Cell *)&v3 music_inheritedLayoutInsetsDidChange];
  [v2 music_inheritedLayoutInsets];
  [v2 setLayoutMargins:];
}

- (void)layoutMarginsDidChange
{
  id v2 = self;
  sub_21AF2C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication25LibraryMenuViewController4Cell_symbol));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication25LibraryMenuViewController4Cell_symbolView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication25LibraryMenuViewController4Cell_activityIndicatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication25LibraryMenuViewController4Cell_activeDownloadsCountLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication25LibraryMenuViewController4Cell____lazy_storage___titleLabel));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtCC16MusicApplication25LibraryMenuViewController4Cell____lazy_storage___defaultTitleLabelTrailingConstraint);
}

@end