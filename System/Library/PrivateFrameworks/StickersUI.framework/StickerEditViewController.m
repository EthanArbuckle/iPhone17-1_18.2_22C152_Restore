@interface StickerEditViewController
- (_TtC10StickersUI25StickerEditViewController)initWithCoder:(id)a3;
- (_TtC10StickersUI25StickerEditViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)handleDoneButton;
- (void)handleLiveButton;
- (void)loadView;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation StickerEditViewController

- (_TtC10StickersUI25StickerEditViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_25E441EB0();
}

- (void)loadView
{
  v2 = self;
  sub_25E43E31C();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for StickerEditViewController();
  v4 = v9.receiver;
  [(StickerEditViewController *)&v9 viewDidAppear:v3];
  v5 = (void *)MEMORY[0x263F8EED0];
  (*(void (**)(void))((*MEMORY[0x263F8EED0] & *v4) + 0x1D0))(0);
  v6 = self;
  id v7 = sub_25E43D964();
  objc_msgSend(v6, sel_playSettlingAnimation_, v7, v9.receiver, v9.super_class);

  v8 = sub_25E43DB50();
  (*(void (**)(uint64_t))((*v5 & *v8) + 0x118))(1);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for StickerEditViewController();
  v4 = v7.receiver;
  [(StickerEditViewController *)&v7 viewWillDisappear:v3];
  v5 = (void *)MEMORY[0x263F8EED0];
  uint64_t v6 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v4) + 0x1D0))(1);
  (*(void (**)(uint64_t))((*v5 & *v4) + 0x2B8))(v6);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_25E43F5B0();
}

- (void)handleDoneButton
{
  uint64_t v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v4 = *(void (**)(void (*)(), uint64_t))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.super.super.isa) + 0x2E0);
  v5 = self;
  swift_retain();
  v4(sub_25E442044, v3);

  swift_release_n();
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    uint64_t v6 = sub_25E4426F8;
  }
  else
  {
    uint64_t v7 = 0;
  }
  v8 = self;
  sub_25E440CF4(a3, (uint64_t)v6, v7);
  sub_25E4426B0((uint64_t)v6);
}

- (void)handleLiveButton
{
  v2 = self;
  sub_25E440F0C();
}

- (_TtC10StickersUI25StickerEditViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC10StickersUI25StickerEditViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickersUI25StickerEditViewController_sticker));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickersUI25StickerEditViewController_preferredRepresentation));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickersUI25StickerEditViewController_stillRepresentation));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickersUI25StickerEditViewController_animatedRepresentation));
  swift_release();
  swift_release();
  sub_25E43DCDC((uint64_t)self + OBJC_IVAR____TtC10StickersUI25StickerEditViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickersUI25StickerEditViewController____lazy_storage___previewView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickersUI25StickerEditViewController____lazy_storage___effectChooser));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickersUI25StickerEditViewController____lazy_storage___doneButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickersUI25StickerEditViewController____lazy_storage___liveButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickersUI25StickerEditViewController____lazy_storage___previewWidthConstraint));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC10StickersUI25StickerEditViewController____lazy_storage___previewHeightConstraint);
}

@end