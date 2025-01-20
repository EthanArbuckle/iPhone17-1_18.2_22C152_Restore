@interface PXPhotosViewRoundedAccessoryButton
- (CGPoint)menuAttachmentPointForConfiguration:(id)a3;
- (CGPoint)menuOffset;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PXPhotosViewRoundedAccessoryButton)initWithCoder:(id)a3;
- (PXPhotosViewRoundedAccessoryButton)initWithFrame:(CGRect)a3;
- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)layoutSubviews;
- (void)setMenuOffset:(CGPoint)a3;
@end

@implementation PXPhotosViewRoundedAccessoryButton

- (PXPhotosViewRoundedAccessoryButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR___PXPhotosViewRoundedAccessoryButton_symbolName);
  void *v8 = 0;
  v8[1] = 0;
  v9 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR___PXPhotosViewRoundedAccessoryButton_menuOffset);
  v10 = (objc_class *)type metadata accessor for PhotosViewRoundedAccessoryButton();
  void *v9 = 0;
  v9[1] = 0;
  v12.receiver = self;
  v12.super_class = v10;
  return -[PXPhotosViewRoundedAccessoryButton initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1A9B2A4FC();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  sub_1A9B344AC(width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)setMenuOffset:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v5 = (CGFloat *)((char *)self + OBJC_IVAR___PXPhotosViewRoundedAccessoryButton_menuOffset);
  swift_beginAccess();
  CGFloat *v5 = x;
  v5[1] = y;
}

- (CGPoint)menuOffset
{
  v2 = (double *)((char *)self + OBJC_IVAR___PXPhotosViewRoundedAccessoryButton_menuOffset);
  swift_beginAccess();
  double v3 = *v2;
  double v4 = v2[1];
  result.CGFloat y = v4;
  result.CGFloat x = v3;
  return result;
}

- (CGPoint)menuAttachmentPointForConfiguration:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)type metadata accessor for PhotosViewRoundedAccessoryButton();
  id v4 = a3;
  v5 = v18.receiver;
  id v6 = [(PXPhotosViewRoundedAccessoryButton *)&v18 menuAttachmentPointForConfiguration:v4];
  double v8 = v7;
  double v9 = *(double (**)(id))((*MEMORY[0x1E4FBC8C8] & *v5) + 0x78);
  double v11 = v10 + v9(v6);
  ((void (*)(uint64_t, uint64_t))v9)(v12, v13);
  double v15 = v14;

  double v16 = v8 + v15;
  double v17 = v11;
  result.CGFloat y = v16;
  result.CGFloat x = v17;
  return result;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
}

- (PXPhotosViewRoundedAccessoryButton)initWithCoder:(id)a3
{
  v5 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR___PXPhotosViewRoundedAccessoryButton_symbolName);
  void *v5 = 0;
  v5[1] = 0;
  id v6 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR___PXPhotosViewRoundedAccessoryButton_menuOffset);
  double v7 = (objc_class *)type metadata accessor for PhotosViewRoundedAccessoryButton();
  *id v6 = 0;
  v6[1] = 0;
  v9.receiver = self;
  v9.super_class = v7;
  return [(PXPhotosViewRoundedAccessoryButton *)&v9 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end