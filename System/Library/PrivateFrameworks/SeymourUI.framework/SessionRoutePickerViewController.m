@interface SessionRoutePickerViewController
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (_TtC9SeymourUI32SessionRoutePickerViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI32SessionRoutePickerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)onTapBackground;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SessionRoutePickerViewController

- (_TtC9SeymourUI32SessionRoutePickerViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_239FEA4D4();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_239FE843C();
}

- (void)viewWillAppear:(BOOL)a3
{
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for SessionRoutePickerViewController();
  id v4 = v11.receiver;
  [(SessionRoutePickerViewController *)&v11 viewDidAppear:v3];
  if (v3) {
    double v5 = 0.18;
  }
  else {
    double v5 = 0.0;
  }
  v6 = self;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v4;
  v10[4] = sub_239FEAB60;
  v10[5] = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 1107296256;
  v10[2] = sub_239E3E38C;
  v10[3] = &block_descriptor_57;
  v8 = _Block_copy(v10);
  id v9 = v4;
  swift_release();
  objc_msgSend(v6, sel_animateWithDuration_animations_, v8, v5);
  _Block_release(v8);
}

- (void)viewDidDisappear:(BOOL)a3
{
}

- (unint64_t)supportedInterfaceOrientations
{
  if (sub_23A7FB658() == 1) {
    return 30;
  }
  else {
    return 24;
  }
}

- (void)onTapBackground
{
  v2 = self;
  sub_239FE954C();
}

- (_TtC9SeymourUI32SessionRoutePickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI32SessionRoutePickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32SessionRoutePickerViewController_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32SessionRoutePickerViewController_collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32SessionRoutePickerViewController_collectionBlurView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32SessionRoutePickerViewController_headerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32SessionRoutePickerViewController_footerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32SessionRoutePickerViewController_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32SessionRoutePickerViewController_presenter));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI32SessionRoutePickerViewController____lazy_storage___collectionViewDataSource);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_23A7F6B08();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  id v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A7F6AA8();
  id v10 = a3;
  objc_super v11 = self;
  sub_239FEA6C0();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v8 = sub_23A7F6B08();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  objc_super v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A7F6AA8();
  id v12 = a3;
  id v13 = a4;
  v14 = self;
  objc_msgSend(v12, sel_bounds);
  CGFloat Width = CGRectGetWidth(v20);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  double v16 = 50.0;
  double v17 = Width;
  result.height = v16;
  result.width = v17;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = self;
  sub_239FEA880(v8, a5);
  double v12 = v11;
  double v14 = v13;

  double v15 = v12;
  double v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

@end