@interface LinkBackdropView
+ (Class)layerClass;
- (_TtC11NotesEditor16LinkBackdropView)initWithCoder:(id)a3;
- (_TtC11NotesEditor16LinkBackdropView)initWithFrame:(CGRect)a3;
@end

@implementation LinkBackdropView

+ (Class)layerClass
{
  sub_20BFCEE58(0, &qword_2676BF198);

  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC11NotesEditor16LinkBackdropView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for LinkBackdropView();
  return -[LinkBackdropView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC11NotesEditor16LinkBackdropView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for LinkBackdropView();
  return [(LinkBackdropView *)&v5 initWithCoder:a3];
}

@end