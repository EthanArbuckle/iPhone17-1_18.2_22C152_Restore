@interface AmbientCollectionViewCell
- (_TtC11PosterBoard25AmbientCollectionViewCell)initWithCoder:(id)a3;
- (_TtC11PosterBoard25AmbientCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)ambientPosterViewControllerRequestExtensionInstanceIdentifier:(id)a3;
- (void)ambientEditingCollectionViewController:(id)a3 didUpdatePosterConfiguration:(id)a4;
- (void)ambientEditingCollectionViewControllerDidUpdatePosters:(id)a3;
- (void)ambientPosterViewController:(id)a3 relinquishExtensionInstanceIdentifier:(id)a4;
@end

@implementation AmbientCollectionViewCell

- (_TtC11PosterBoard25AmbientCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC11PosterBoard25AmbientCollectionViewCell *)sub_1D32F245C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11PosterBoard25AmbientCollectionViewCell)initWithCoder:(id)a3
{
  return (_TtC11PosterBoard25AmbientCollectionViewCell *)sub_1D32F2640(a3);
}

- (void)ambientEditingCollectionViewControllerDidUpdatePosters:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1D32F47A8();
}

- (void)ambientEditingCollectionViewController:(id)a3 didUpdatePosterConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1D32F5804(v7);
}

- (id)ambientPosterViewControllerRequestExtensionInstanceIdentifier:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBD6F910);
  MEMORY[0x1F4188790](v5 - 8);
  id v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (MEMORY[0x1D9434A30]((char *)self + OBJC_IVAR____TtC11PosterBoard25AmbientCollectionViewCell_delegate))
  {
    id v8 = a3;
    v9 = self;
    sub_1D330955C(v7);

    swift_unknownObjectRelease();
    uint64_t v10 = sub_1D3371F48();
    uint64_t v11 = *(void *)(v10 - 8);
    v12 = 0;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v7, 1, v10) != 1)
    {
      v12 = (void *)sub_1D3371F08();
      (*(void (**)(char *, uint64_t))(v11 + 8))(v7, v10);
    }
  }
  else
  {
    uint64_t v13 = sub_1D3371F48();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v7, 1, 1, v13);
    v12 = 0;
  }
  return v12;
}

- (void)ambientPosterViewController:(id)a3 relinquishExtensionInstanceIdentifier:(id)a4
{
  uint64_t v6 = sub_1D3371F48();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D3371F28();
  id v10 = a3;
  uint64_t v11 = self;
  sub_1D32F5E5C((uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void).cxx_destruct
{
  sub_1D32CE208((uint64_t)self + OBJC_IVAR____TtC11PosterBoard25AmbientCollectionViewCell_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard25AmbientCollectionViewCell_posterModel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard25AmbientCollectionViewCell_editingButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard25AmbientCollectionViewCell_hideOrDeleteButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard25AmbientCollectionViewCell_editingViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard25AmbientCollectionViewCell_ambientPosterViewController));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC11PosterBoard25AmbientCollectionViewCell_shadowView);
}

@end