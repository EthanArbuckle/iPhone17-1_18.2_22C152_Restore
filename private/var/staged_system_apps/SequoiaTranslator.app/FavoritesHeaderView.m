@interface FavoritesHeaderView
- (_TtC17SequoiaTranslator19FavoritesHeaderView)initWithCoder:(id)a3;
- (_TtC17SequoiaTranslator19FavoritesHeaderView)initWithFrame:(CGRect)a3;
- (void)buttonPressed;
@end

@implementation FavoritesHeaderView

- (_TtC17SequoiaTranslator19FavoritesHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC17SequoiaTranslator19FavoritesHeaderView *)sub_1000EABBC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC17SequoiaTranslator19FavoritesHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000EB430();
}

- (void)buttonPressed
{
  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC17SequoiaTranslator19FavoritesHeaderView_buttonAction);
  if (v2)
  {
    v4 = self;
    uint64_t v3 = sub_100019614((uint64_t)v2);
    v2(v3);
    sub_1000324E4((uint64_t)v2);
  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator19FavoritesHeaderView_label));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator19FavoritesHeaderView_button));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC17SequoiaTranslator19FavoritesHeaderView_buttonAction);

  sub_1000324E4(v3);
}

@end