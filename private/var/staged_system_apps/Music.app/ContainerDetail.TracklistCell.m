@interface ContainerDetail.TracklistCell
- (_TtCV5Music15ContainerDetail13TracklistCell)initWithCoder:(id)a3;
- (_TtCV5Music15ContainerDetail13TracklistCell)initWithFrame:(CGRect)a3;
@end

@implementation ContainerDetail.TracklistCell

- (_TtCV5Music15ContainerDetail13TracklistCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(_OWORD *)((char *)&self->super.super.super.super.super.super.isa
            + OBJC_IVAR____TtCV5Music15ContainerDetail13TracklistCell_data) = xmmword_100E3AC00;
  v8.receiver = self;
  v8.super_class = (Class)_s13TracklistCellCMa();
  return -[ContainerDetail.TracklistCell initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtCV5Music15ContainerDetail13TracklistCell)initWithCoder:(id)a3
{
  *(_OWORD *)((char *)&self->super.super.super.super.super.super.isa
            + OBJC_IVAR____TtCV5Music15ContainerDetail13TracklistCell_data) = xmmword_100E3AC00;
  v5.receiver = self;
  v5.super_class = (Class)_s13TracklistCellCMa();
  return [(ContainerDetail.TracklistCell *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end