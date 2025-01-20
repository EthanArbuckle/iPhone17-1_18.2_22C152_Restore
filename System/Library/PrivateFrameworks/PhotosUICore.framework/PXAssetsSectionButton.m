@interface PXAssetsSectionButton
+ (double)preferredHeightWithExtendedTraitCollection:(id)a3 numberOfLines:(int64_t)a4;
+ (id)configurationWithTitle:(id)a3 numberOfLines:(int64_t)a4 action:(id)a5;
- (CGRect)clippingRect;
- (NSCopying)userData;
- (PXAssetsSectionButton)initWithCoder:(id)a3;
- (PXAssetsSectionButton)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setClippingRect:(CGRect)a3;
- (void)setUserData:(id)a3;
@end

@implementation PXAssetsSectionButton

+ (double)preferredHeightWithExtendedTraitCollection:(id)a3 numberOfLines:(int64_t)a4
{
  self;
  id v5 = a3;
  UIFontTextStyleFromPXFontTextStyle();
}

+ (id)configurationWithTitle:(id)a3 numberOfLines:(int64_t)a4 action:(id)a5
{
  v6 = _Block_copy(a5);
  uint64_t v7 = sub_1AB23A76C();
  uint64_t v9 = v8;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v6;
  v11 = (objc_class *)type metadata accessor for AssetsSectionButton.Configuration();
  v12 = (char *)objc_allocWithZone(v11);
  v13 = (uint64_t *)&v12[OBJC_IVAR____TtCC12PhotosUICore19AssetsSectionButton13Configuration_title];
  uint64_t *v13 = v7;
  v13[1] = v9;
  *(void *)&v12[OBJC_IVAR____TtCC12PhotosUICore19AssetsSectionButton13Configuration_numberOfLines] = a4;
  v14 = (uint64_t (**)())&v12[OBJC_IVAR____TtCC12PhotosUICore19AssetsSectionButton13Configuration_action];
  *v14 = sub_1AA24EFF8;
  v14[1] = (uint64_t (*)())v10;
  v16 = v12;
  v17 = v11;
  _s12PhotosUICore13SpriteBuilderV11buildEither5firstSayAA0C13Configuration_pGAG_tFZ_0();
}

- (PXAssetsSectionButton)initWithFrame:(CGRect)a3
{
  return (PXAssetsSectionButton *)sub_1AA6ECBE0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PXAssetsSectionButton)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PXAssetsSectionButton_configuration) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PXAssetsSectionButton_userData) = 0;
  v4 = (_OWORD *)((char *)self + OBJC_IVAR___PXAssetsSectionButton_clippingRect);
  _OWORD *v4 = 0u;
  v4[1] = 0u;
  id v5 = a3;

  result = (PXAssetsSectionButton *)sub_1AB23C1FC();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AssetsSectionButton();
  v2 = (char *)v4.receiver;
  [(PXAssetsSectionButton *)&v4 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR___PXAssetsSectionButton_button];
  objc_msgSend(v2, sel_bounds, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setFrame_);
}

- (NSCopying)userData
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();
  return (NSCopying *)v2;
}

- (void)setUserData:(id)a3
{
  swift_unknownObjectRetain();
  id v5 = self;
  sub_1AA6ED808((uint64_t)a3);

  swift_unknownObjectRelease();
}

- (CGRect)clippingRect
{
  v2 = (double *)((char *)self + OBJC_IVAR___PXAssetsSectionButton_clippingRect);
  swift_beginAccess();
  double v3 = *v2;
  double v4 = v2[1];
  double v5 = v2[2];
  double v6 = v2[3];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)setClippingRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v7 = (CGFloat *)((char *)self + OBJC_IVAR___PXAssetsSectionButton_clippingRect);
  swift_beginAccess();
  *uint64_t v7 = x;
  v7[1] = y;
  v7[2] = width;
  v7[3] = height;
}

- (void)prepareForReuse
{
  v2 = *(void (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.super.super.isa) + 0x78);
  double v3 = self;
  v2(0);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

@end