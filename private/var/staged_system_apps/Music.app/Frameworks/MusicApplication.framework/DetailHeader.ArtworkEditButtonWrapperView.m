@interface DetailHeader.ArtworkEditButtonWrapperView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtCC16MusicApplication12DetailHeaderP33_A13DD19D58D33EBE9EDF18CE691179B728ArtworkEditButtonWrapperView)initWithCoder:(id)a3;
- (_TtCC16MusicApplication12DetailHeaderP33_A13DD19D58D33EBE9EDF18CE691179B728ArtworkEditButtonWrapperView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation DetailHeader.ArtworkEditButtonWrapperView

- (_TtCC16MusicApplication12DetailHeaderP33_A13DD19D58D33EBE9EDF18CE691179B728ArtworkEditButtonWrapperView)initWithFrame:(CGRect)a3
{
  return (_TtCC16MusicApplication12DetailHeaderP33_A13DD19D58D33EBE9EDF18CE691179B728ArtworkEditButtonWrapperView *)sub_2D5F88(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC16MusicApplication12DetailHeaderP33_A13DD19D58D33EBE9EDF18CE691179B728ArtworkEditButtonWrapperView)initWithCoder:(id)a3
{
  result = (_TtCC16MusicApplication12DetailHeaderP33_A13DD19D58D33EBE9EDF18CE691179B728ArtworkEditButtonWrapperView *)sub_AB8280();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(DetailHeader.ArtworkEditButtonWrapperView *)self intrinsicContentSize];
  if (height >= width) {
    double v7 = width;
  }
  else {
    double v7 = height;
  }
  if (v5 < width && v6 < height)
  {
    double v6 = v7;
    double v5 = v7;
  }
  result.double height = v6;
  result.double width = v5;
  return result;
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  id v3 = [(DetailHeader.ArtworkEditButtonWrapperView *)v2 traitCollection];
  v4 = (char *)[v3 horizontalSizeClass];

  double v5 = 64.0;
  if (v4 == (unsigned char *)&def_3B9D84 + 2) {
    double v5 = 80.0;
  }
  double v6 = v5;
  result.double height = v6;
  result.double width = v5;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_2D6530();
}

- (void)traitCollectionDidChange:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for DetailHeader.ArtworkEditButtonWrapperView();
  id v4 = a3;
  double v5 = (char *)v10.receiver;
  [(DetailHeader.ArtworkEditButtonWrapperView *)&v10 traitCollectionDidChange:v4];
  double v6 = *(void **)&v5[OBJC_IVAR____TtCC16MusicApplication12DetailHeaderP33_A13DD19D58D33EBE9EDF18CE691179B728ArtworkEditButtonWrapperView_button];
  id v7 = [v5 traitCollection];
  v8 = (char *)[v7 horizontalSizeClass];

  double v9 = 12.0;
  if (v8 == (unsigned char *)&def_3B9D84 + 2) {
    double v9 = 25.0;
  }
  [v6 setImageEdgeInsets:v9, v9, v9, v9];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication12DetailHeaderP33_A13DD19D58D33EBE9EDF18CE691179B728ArtworkEditButtonWrapperView_button));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCC16MusicApplication12DetailHeaderP33_A13DD19D58D33EBE9EDF18CE691179B728ArtworkEditButtonWrapperView_visualEffectView);
}

@end