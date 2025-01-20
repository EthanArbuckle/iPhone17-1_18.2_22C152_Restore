@interface StickerCollectionBlankCell
- (_TtC10StickersUI26StickerCollectionBlankCell)initWithCoder:(id)a3;
- (_TtC10StickersUI26StickerCollectionBlankCell)initWithFrame:(CGRect)a3;
@end

@implementation StickerCollectionBlankCell

- (_TtC10StickersUI26StickerCollectionBlankCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for StickerCollectionBlankCell();
  v7 = -[StickerCollectionBlankCell initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  v8 = self;
  v9 = v7;
  id v10 = objc_msgSend(v8, sel_clearColor);
  [(StickerCollectionBlankCell *)v9 setBackgroundColor:v10];

  return v9;
}

- (_TtC10StickersUI26StickerCollectionBlankCell)initWithCoder:(id)a3
{
  result = (_TtC10StickersUI26StickerCollectionBlankCell *)sub_25E4A2EA0();
  __break(1u);
  return result;
}

@end