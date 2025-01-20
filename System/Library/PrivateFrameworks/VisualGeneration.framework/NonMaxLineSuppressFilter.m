@interface NonMaxLineSuppressFilter
- (CIImage)outputImage;
- (_TtC16VisualGeneration24NonMaxLineSuppressFilter)init;
- (_TtC16VisualGeneration24NonMaxLineSuppressFilter)initWithCoder:(id)a3;
@end

@implementation NonMaxLineSuppressFilter

- (CIImage)outputImage
{
  v2 = self;
  id v3 = sub_260ED477C();

  return (CIImage *)v3;
}

- (_TtC16VisualGeneration24NonMaxLineSuppressFilter)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC16VisualGeneration24NonMaxLineSuppressFilter_inputImage) = 0;
  *(_DWORD *)((char *)&self->super.super.isa + OBJC_IVAR____TtC16VisualGeneration24NonMaxLineSuppressFilter_threshold) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for NonMaxLineSuppressFilter();
  return [(NonMaxLineSuppressFilter *)&v3 init];
}

- (_TtC16VisualGeneration24NonMaxLineSuppressFilter)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC16VisualGeneration24NonMaxLineSuppressFilter_inputImage) = 0;
  *(_DWORD *)((char *)&self->super.super.isa + OBJC_IVAR____TtC16VisualGeneration24NonMaxLineSuppressFilter_threshold) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NonMaxLineSuppressFilter();
  return [(NonMaxLineSuppressFilter *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC16VisualGeneration24NonMaxLineSuppressFilter_inputImage));
}

@end