@interface DOCFolderThumbnailView
- (CGSize)intrinsicContentSize;
- (_TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7522DOCFolderThumbnailView)initWithCoder:(id)a3;
- (_TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7522DOCFolderThumbnailView)initWithImage:(id)a3;
- (void)didMoveToWindow;
- (void)thumbnailLoaded:(id)a3;
@end

@implementation DOCFolderThumbnailView

- (_TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7522DOCFolderThumbnailView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7522DOCFolderThumbnailView_thumbnail) = 0;
  id v4 = a3;

  result = (_TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7522DOCFolderThumbnailView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCFolderThumbnailView();
  id v2 = v4.receiver;
  [(DOCFolderThumbnailView *)&v4 didMoveToWindow];
  id v3 = [v2 window];

  if (v3) {
    sub_1002E6F20();
  }
}

- (void)thumbnailLoaded:(id)a3
{
}

- (CGSize)intrinsicContentSize
{
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for DOCFolderThumbnailView();
  id v2 = v10.receiver;
  [(DOCFolderThumbnailView *)&v10 intrinsicContentSize];
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

- (_TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7522DOCFolderThumbnailView)initWithImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5FilesP33_03C5E21A9DFBF0EC7F1C3AC78C186A7522DOCFolderThumbnailView_item));

  swift_unknownObjectRelease();
}

@end