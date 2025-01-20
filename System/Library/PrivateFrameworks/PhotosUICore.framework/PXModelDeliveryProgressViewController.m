@interface PXModelDeliveryProgressViewController
- (_TtC12PhotosUICore37PXModelDeliveryProgressViewController)initWithCoder:(id)a3;
- (_TtC12PhotosUICore37PXModelDeliveryProgressViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)reportProgress:(double)a3 stage:(unint64_t)a4;
- (void)setErrorState:(int64_t)a3;
- (void)setIsiPadConfiguration:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation PXModelDeliveryProgressViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PXModelDeliveryProgressViewController(0);
  id v2 = v3.receiver;
  [(PXModelDeliveryProgressViewController *)&v3 viewDidLoad];
  sub_1AA15AEB0();
}

- (void)reportProgress:(double)a3 stage:(unint64_t)a4
{
  v6 = self;
  sub_1AA15B290(a4, a3);
}

- (void)setIsiPadConfiguration:(BOOL)a3
{
  v4 = self;
  sub_1AA15B814(a3);
}

- (void)setErrorState:(int64_t)a3
{
  v4 = self;
  sub_1AA15B924(a3);
}

- (_TtC12PhotosUICore37PXModelDeliveryProgressViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_1AB23A76C();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC12PhotosUICore37PXModelDeliveryProgressViewController *)sub_1AA15BB44(v5, v7, a4);
}

- (_TtC12PhotosUICore37PXModelDeliveryProgressViewController)initWithCoder:(id)a3
{
  return (_TtC12PhotosUICore37PXModelDeliveryProgressViewController *)sub_1AA15BCF4(a3);
}

- (void).cxx_destruct
{
  sub_1AA161B10((uint64_t)self + OBJC_IVAR____TtC12PhotosUICore37PXModelDeliveryProgressViewController____lazy_storage___progressView, &qword_1E982B0F8, type metadata accessor for PXModelDeliveryProgressView, MEMORY[0x1E4FBB718]);
  swift_release();
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12PhotosUICore37PXModelDeliveryProgressViewController_progressHostingViewController);
}

@end