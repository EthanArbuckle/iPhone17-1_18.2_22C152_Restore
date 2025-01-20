@interface ContainerDetail.HeaderCell
- (CGRect)bounds;
- (_TtCV5Music15ContainerDetail10HeaderCell)initWithCoder:(id)a3;
- (_TtCV5Music15ContainerDetail10HeaderCell)initWithFrame:(CGRect)a3;
- (void)setBounds:(CGRect)a3;
@end

@implementation ContainerDetail.HeaderCell

- (CGRect)bounds
{
  v6.receiver = self;
  v6.super_class = (Class)_s10HeaderCellCMa();
  [(ContainerDetail.HeaderCell *)&v6 bounds];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)_s10HeaderCellCMa();
  v7 = (char *)v9.receiver;
  -[ContainerDetail.HeaderCell setBounds:](&v9, "setBounds:", x, y, width, height);
  v8 = *(void (**)(char *))&v7[OBJC_IVAR____TtCV5Music15ContainerDetail10HeaderCell_didSetBoundsBlock];
  if (v8)
  {
    swift_retain();
    v8(v7);
    sub_10006ADFC((uint64_t)v8);
  }
}

- (_TtCV5Music15ContainerDetail10HeaderCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtCV5Music15ContainerDetail10HeaderCell_didSetBoundsBlock);
  objc_super v9 = (objc_class *)_s10HeaderCellCMa();
  void *v8 = 0;
  v8[1] = 0;
  v11.receiver = self;
  v11.super_class = v9;
  return -[ContainerDetail.HeaderCell initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
}

- (_TtCV5Music15ContainerDetail10HeaderCell)initWithCoder:(id)a3
{
  double v5 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtCV5Music15ContainerDetail10HeaderCell_didSetBoundsBlock);
  objc_super v6 = (objc_class *)_s10HeaderCellCMa();
  *double v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return [(ContainerDetail.HeaderCell *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
  sub_10006ADFC(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtCV5Music15ContainerDetail10HeaderCell_didSetBoundsBlock));
}

@end