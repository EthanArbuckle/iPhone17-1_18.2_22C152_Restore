@interface PXFlexMusicViewController
- (PXFlexMusicViewController)initWithCoder:(id)a3;
- (PXFlexMusicViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation PXFlexMusicViewController

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for PXFlexMusicViewController();
  id v2 = v4.receiver;
  [(PXFlexMusicViewController *)&v4 viewDidLoad];
  v3 = (void *)sub_1AB23A72C();
  objc_msgSend(v2, sel_setTitle_, v3, v4.receiver, v4.super_class);

  sub_1AA0FA008();
}

- (PXFlexMusicViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_1AB23A76C();
    *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PXFlexMusicViewController_player) = 0;
    v6 = (char *)self + OBJC_IVAR___PXFlexMusicViewController_pickerView;
    *(_OWORD *)v6 = 0u;
    *((_OWORD *)v6 + 1) = 0u;
    v6[32] = 0;
    id v7 = a4;
    v8 = (void *)sub_1AB23A72C();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PXFlexMusicViewController_player) = 0;
    v9 = (char *)self + OBJC_IVAR___PXFlexMusicViewController_pickerView;
    *(_OWORD *)v9 = 0u;
    *((_OWORD *)v9 + 1) = 0u;
    v9[32] = 0;
    id v10 = a4;
    v8 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for PXFlexMusicViewController();
  v11 = [(PXFlexMusicViewController *)&v13 initWithNibName:v8 bundle:a4];

  return v11;
}

- (PXFlexMusicViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PXFlexMusicViewController_player) = 0;
  v5 = (char *)self + OBJC_IVAR___PXFlexMusicViewController_pickerView;
  v6 = (objc_class *)type metadata accessor for PXFlexMusicViewController();
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  v5[32] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return [(PXFlexMusicViewController *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___PXFlexMusicViewController_pickerView);
  objc_super v4 = *(void **)((char *)&self->super.super._responderFlags + OBJC_IVAR___PXFlexMusicViewController_pickerView);
  uint64_t v5 = *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity + OBJC_IVAR___PXFlexMusicViewController_pickerView);
  sub_1AA0F9EA0(v3, v4, v5);
}

@end