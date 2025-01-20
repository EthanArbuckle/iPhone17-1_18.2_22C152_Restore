@interface iOSLinkAcceleratorCollectionViewSeparatorCell
- (_TtC11NotesEditor45iOSLinkAcceleratorCollectionViewSeparatorCell)initWithCoder:(id)a3;
- (_TtC11NotesEditor45iOSLinkAcceleratorCollectionViewSeparatorCell)initWithFrame:(CGRect)a3;
@end

@implementation iOSLinkAcceleratorCollectionViewSeparatorCell

- (_TtC11NotesEditor45iOSLinkAcceleratorCollectionViewSeparatorCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)swift_getObjectType();
  v7 = -[iOSLinkAcceleratorCollectionViewSeparatorCell initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
  uint64_t v8 = qword_2676BB008;
  v9 = v7;
  if (v8 != -1) {
    swift_once();
  }
  [(iOSLinkAcceleratorCollectionViewSeparatorCell *)v9 setBackgroundColor:qword_2676C01B8];

  return v9;
}

- (_TtC11NotesEditor45iOSLinkAcceleratorCollectionViewSeparatorCell)initWithCoder:(id)a3
{
  result = (_TtC11NotesEditor45iOSLinkAcceleratorCollectionViewSeparatorCell *)sub_20C163BD0();
  __break(1u);
  return result;
}

@end