@interface MusicArtworkComponentImageView
- (CGRect)frame;
- (MusicArtworkComponentImageView)initWithCoder:(id)a3;
- (MusicArtworkComponentImageView)initWithFrame:(CGRect)a3;
- (MusicArtworkComponentImageView)initWithImage:(id)a3;
- (MusicArtworkComponentImageView)initWithImage:(id)a3 highlightedImage:(id)a4;
- (void)didMoveToSuperview;
- (void)setFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation MusicArtworkComponentImageView

- (void)didMoveToSuperview
{
  v2 = self;
  sub_10001DA48();
}

- (CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ArtworkComponentImageView();
  [(MusicArtworkComponentImageView *)&v6 frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (objc_class *)type metadata accessor for ArtworkComponentImageView();
  v23.receiver = self;
  v23.super_class = v8;
  v9 = self;
  [(MusicArtworkComponentImageView *)&v23 frame];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  v22.receiver = v9;
  v22.super_class = v8;
  -[MusicArtworkComponentImageView setFrame:](&v22, "setFrame:", x, y, width, height);
  [(MusicArtworkComponentImageView *)v9 frame];
  v25.origin.double x = v18;
  v25.origin.double y = v19;
  v25.size.double width = v20;
  v25.size.double height = v21;
  v24.origin.double x = v11;
  v24.origin.double y = v13;
  v24.size.double width = v15;
  v24.size.double height = v17;
  if (!CGRectEqualToRect(v24, v25)) {
    sub_10001DE38();
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  objc_super v6 = self;
  sub_10001DD18(a3);
}

- (MusicArtworkComponentImageView)initWithImage:(id)a3
{
  swift_weakInit();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR___MusicArtworkComponentImageView_accessoryArtworkCatalog) = 0;
  id v5 = (char *)self + OBJC_IVAR___MusicArtworkComponentImageView_accessoryStyle;
  *((void *)v5 + 1) = 0;
  *((void *)v5 + 2) = 0;
  *(void *)id v5 = 0;
  v5[24] = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___MusicArtworkComponentImageView_accessoryImageView) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___MusicArtworkComponentImageView_accessoryStrokeView) = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ArtworkComponentImageView();
  return [(MusicArtworkComponentImageView *)&v7 initWithImage:a3];
}

- (MusicArtworkComponentImageView)initWithImage:(id)a3 highlightedImage:(id)a4
{
  swift_weakInit();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR___MusicArtworkComponentImageView_accessoryArtworkCatalog) = 0;
  objc_super v7 = (char *)self + OBJC_IVAR___MusicArtworkComponentImageView_accessoryStyle;
  *((void *)v7 + 1) = 0;
  *((void *)v7 + 2) = 0;
  *(void *)objc_super v7 = 0;
  v7[24] = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___MusicArtworkComponentImageView_accessoryImageView) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___MusicArtworkComponentImageView_accessoryStrokeView) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ArtworkComponentImageView();
  return [(MusicArtworkComponentImageView *)&v9 initWithImage:a3 highlightedImage:a4];
}

- (MusicArtworkComponentImageView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  swift_weakInit();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR___MusicArtworkComponentImageView_accessoryArtworkCatalog) = 0;
  v8 = (char *)self + OBJC_IVAR___MusicArtworkComponentImageView_accessoryStyle;
  *((void *)v8 + 1) = 0;
  *((void *)v8 + 2) = 0;
  *(void *)v8 = 0;
  v8[24] = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___MusicArtworkComponentImageView_accessoryImageView) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___MusicArtworkComponentImageView_accessoryStrokeView) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for ArtworkComponentImageView();
  return -[MusicArtworkComponentImageView initWithFrame:](&v10, "initWithFrame:", x, y, width, height);
}

- (MusicArtworkComponentImageView)initWithCoder:(id)a3
{
  return (MusicArtworkComponentImageView *)sub_10001E5F8(a3);
}

- (void).cxx_destruct
{
  swift_weakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___MusicArtworkComponentImageView_accessoryArtworkCatalog));
  sub_10001F6A0(*(id *)((char *)&self->super.super.super.super.isa
                      + OBJC_IVAR___MusicArtworkComponentImageView_accessoryStyle));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___MusicArtworkComponentImageView_accessoryImageView));
  double v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___MusicArtworkComponentImageView_accessoryStrokeView);
}

@end