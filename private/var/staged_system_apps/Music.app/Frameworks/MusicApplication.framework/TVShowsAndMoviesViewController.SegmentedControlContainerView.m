@interface TVShowsAndMoviesViewController.SegmentedControlContainerView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtCC16MusicApplication30TVShowsAndMoviesViewControllerP33_0A44ACF94072246E8AD16A61955F73C029SegmentedControlContainerView)init;
- (_TtCC16MusicApplication30TVShowsAndMoviesViewControllerP33_0A44ACF94072246E8AD16A61955F73C029SegmentedControlContainerView)initWithCoder:(id)a3;
- (_TtCC16MusicApplication30TVShowsAndMoviesViewControllerP33_0A44ACF94072246E8AD16A61955F73C029SegmentedControlContainerView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)music_inheritedLayoutInsetsDidChange;
@end

@implementation TVShowsAndMoviesViewController.SegmentedControlContainerView

- (_TtCC16MusicApplication30TVShowsAndMoviesViewControllerP33_0A44ACF94072246E8AD16A61955F73C029SegmentedControlContainerView)init
{
  return (_TtCC16MusicApplication30TVShowsAndMoviesViewControllerP33_0A44ACF94072246E8AD16A61955F73C029SegmentedControlContainerView *)sub_94DEC();
}

- (_TtCC16MusicApplication30TVShowsAndMoviesViewControllerP33_0A44ACF94072246E8AD16A61955F73C029SegmentedControlContainerView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_95754();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_95114();
}

- (CGSize)intrinsicContentSize
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCC16MusicApplication30TVShowsAndMoviesViewControllerP33_0A44ACF94072246E8AD16A61955F73C029SegmentedControlContainerView_segmentedControl);
  id v3 = self;
  [v2 intrinsicContentSize];
  [(TVShowsAndMoviesViewController.SegmentedControlContainerView *)v3 layoutMargins];
  sub_AB7120();
  sub_AB7790();
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCC16MusicApplication30TVShowsAndMoviesViewControllerP33_0A44ACF94072246E8AD16A61955F73C029SegmentedControlContainerView_segmentedControl);
  double v6 = self;
  [v5 intrinsicContentSize];
  [(TVShowsAndMoviesViewController.SegmentedControlContainerView *)v6 layoutMargins];
  sub_AB7120();
  sub_AB7790();
  double v8 = v7;
  double v10 = v9;

  if (width > v8) {
    double v11 = width;
  }
  else {
    double v11 = v8;
  }
  if (width <= 0.0) {
    double v11 = v8;
  }
  if (height > v10) {
    double v12 = height;
  }
  else {
    double v12 = v10;
  }
  if (height <= 0.0) {
    double v12 = v10;
  }
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (void)music_inheritedLayoutInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TVShowsAndMoviesViewController.SegmentedControlContainerView();
  id v2 = v3.receiver;
  [(TVShowsAndMoviesViewController.SegmentedControlContainerView *)&v3 music_inheritedLayoutInsetsDidChange];
  [v2 music_inheritedLayoutInsets];
  [v2 layoutMargins];
  [v2 setLayoutMargins:];
  [v2 music_inheritedLayoutInsets];
  [v2 layoutMargins];
  [v2 setLayoutMargins:];
}

- (_TtCC16MusicApplication30TVShowsAndMoviesViewControllerP33_0A44ACF94072246E8AD16A61955F73C029SegmentedControlContainerView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtCC16MusicApplication30TVShowsAndMoviesViewControllerP33_0A44ACF94072246E8AD16A61955F73C029SegmentedControlContainerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication30TVShowsAndMoviesViewControllerP33_0A44ACF94072246E8AD16A61955F73C029SegmentedControlContainerView_segmentedControl));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCC16MusicApplication30TVShowsAndMoviesViewControllerP33_0A44ACF94072246E8AD16A61955F73C029SegmentedControlContainerView_backgroundView);
}

@end