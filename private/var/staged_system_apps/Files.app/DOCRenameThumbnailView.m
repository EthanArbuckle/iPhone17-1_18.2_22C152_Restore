@interface DOCRenameThumbnailView
- (CGSize)intrinsicContentSize;
- (UIImage)image;
- (_TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7522DOCRenameThumbnailView)initWithCoder:(id)a3;
- (_TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7522DOCRenameThumbnailView)initWithImage:(id)a3;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setImage:(id)a3;
- (void)thumbnailLoaded:(id)a3;
@end

@implementation DOCRenameThumbnailView

- (UIImage)image
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = [(DOCAspectImageView *)&v4 image];

  return v2;
}

- (void)setImage:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v7.receiver;
  [(DOCAspectImageView *)&v7 setImage:v4];
  unsigned __int8 v6 = sub_1002E6098();
  sub_1002EF404(v5, v6 & 1);
}

- (_TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7522DOCRenameThumbnailView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7522DOCRenameThumbnailView_item) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7522DOCRenameThumbnailView_initialThumbnail) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7522DOCRenameThumbnailView_fullSizeThumbnail) = 0;
  id v4 = a3;

  result = (_TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7522DOCRenameThumbnailView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  id v2 = v4.receiver;
  [(DOCRenameThumbnailView *)&v4 didMoveToWindow];
  id v3 = [v2 window];

  if (v3) {
    sub_1002E5DD8();
  }
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  id v2 = v4.receiver;
  [(DOCRenameThumbnailView *)&v4 layoutSubviews];
  unsigned __int8 v3 = sub_1002E6098();
  sub_1002EF404(v2, v3 & 1);
}

- (void)thumbnailLoaded:(id)a3
{
}

- (CGSize)intrinsicContentSize
{
  v10.receiver = self;
  v10.super_class = (Class)swift_getObjectType();
  id v2 = v10.receiver;
  [(DOCRenameThumbnailView *)&v10 intrinsicContentSize];
  id v3 = [v2 traitCollection];
  [v3 displayScale];

  DOCAdaptSizeToRect();
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (_TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7522DOCRenameThumbnailView)initWithImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7522DOCRenameThumbnailView_item));
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

@end