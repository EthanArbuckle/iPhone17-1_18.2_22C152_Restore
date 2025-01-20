@interface TabThumbnailView.CornerButton
- (BOOL)isHighlighted;
- (_TtCC12MobileSafari16TabThumbnailView12CornerButton)initWithCoder:(id)a3;
- (_TtCC12MobileSafari16TabThumbnailView12CornerButton)initWithFrame:(CGRect)a3;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)didReceiveHover:(id)a3;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation TabThumbnailView.CornerButton

- (_TtCC12MobileSafari16TabThumbnailView12CornerButton)initWithFrame:(CGRect)a3
{
  return (_TtCC12MobileSafari16TabThumbnailView12CornerButton *)sub_18C364860(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_18C3DD994();
}

- (_TtCC12MobileSafari16TabThumbnailView12CornerButton)initWithCoder:(id)a3
{
  return (_TtCC12MobileSafari16TabThumbnailView12CornerButton *)sub_18C5BF464(a3);
}

- (void)didReceiveHover:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_18C5C026C(v4);
}

- (BOOL)isHighlighted
{
  v3.receiver = self;
  v3.super_class = (Class)_s12CornerButtonCMa();
  return [(TabThumbnailView.CornerButton *)&v3 isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (objc_class *)_s12CornerButtonCMa();
  v12.receiver = self;
  v12.super_class = v5;
  v6 = self;
  unsigned int v7 = [(TabThumbnailView.CornerButton *)&v12 isHighlighted];
  v11.receiver = v6;
  v11.super_class = v5;
  [(TabThumbnailView.CornerButton *)&v11 setHighlighted:v3];
  if (v7 == [(TabThumbnailView.CornerButton *)v6 isHighlighted])
  {
  }
  else
  {
    if (qword_1E9175AD8 != -1) {
      swift_once();
    }
    uint64_t v8 = qword_1E9190548;
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v6;
    v10 = v6;
    sub_18C3B3898(v8, 0, (uint64_t)sub_18C5C15BC, v9, (void (*)())CGRectMake, 0);

    swift_release();
  }
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5 = a3;
  v6 = self;
  id v7 = sub_18C5C1120();

  return v7;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari16TabThumbnailView12CornerButton____lazy_storage___blurRadius));
  BOOL v3 = *(void **)((char *)&self->super.super.super._responderFlags
                + OBJC_IVAR____TtCC12MobileSafari16TabThumbnailView12CornerButton_configuration);
  id v4 = *(FBSSceneIdentityToken **)((char *)&self->super.super.super.__layeringSceneIdentity
                                 + OBJC_IVAR____TtCC12MobileSafari16TabThumbnailView12CornerButton_configuration);
  id v5 = *(UITraitCollection **)((char *)&self->super.super._cachedTraitCollection
                             + OBJC_IVAR____TtCC12MobileSafari16TabThumbnailView12CornerButton_configuration);
  v6 = *(id *)((char *)&self->super.super._swiftAnimationInfo
             + OBJC_IVAR____TtCC12MobileSafari16TabThumbnailView12CornerButton_configuration);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari16TabThumbnailView12CornerButton_configuration));

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari16TabThumbnailView12CornerButton_menu));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari16TabThumbnailView12CornerButton_borderView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari16TabThumbnailView12CornerButton_highlightView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari16TabThumbnailView12CornerButton_imageView));
  id v7 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtCC12MobileSafari16TabThumbnailView12CornerButton_vibrantEffectView);
}

@end