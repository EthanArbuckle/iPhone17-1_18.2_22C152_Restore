@interface JSStaticImageViewController
- (NSData)playActivityRecommendationData;
- (NSString)playActivityFeatureName;
- (_TtC16MusicApplication27JSStaticImageViewController)initWithCoder:(id)a3;
- (_TtC16MusicApplication27JSStaticImageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation JSStaticImageViewController

- (_TtC16MusicApplication27JSStaticImageViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_461560();
}

- (NSString)playActivityFeatureName
{
  v2 = *(void (**)(void))&stru_68.segname[(**(void **)((char *)&self->super.super.super.isa
                                                       + OBJC_IVAR____TtC16MusicApplication27JSStaticImageViewController_staticImageViewModel) & swift_isaMask)
                                        + 8];
  id v3 = self;
  v2();

  NSString v4 = sub_AB64D0();
  swift_bridgeObjectRelease();

  return (NSString *)v4;
}

- (NSData)playActivityRecommendationData
{
  v2 = *(uint64_t (**)(void))((char *)&stru_68.offset
                           + (**(void **)((char *)&self->super.super.super.isa
                                          + OBJC_IVAR____TtC16MusicApplication27JSStaticImageViewController_staticImageViewModel) & swift_isaMask));
  id v3 = self;
  uint64_t v4 = v2();
  unint64_t v6 = v5;

  if (v6 >> 60 == 15)
  {
    Class isa = 0;
  }
  else
  {
    Class isa = sub_AB09C0().super.isa;
    sub_4B654(v4, v6);
  }

  return (NSData *)isa;
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_4604A8();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_46066C();
}

- (_TtC16MusicApplication27JSStaticImageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC16MusicApplication27JSStaticImageViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication27JSStaticImageViewController_staticImageViewModel));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication27JSStaticImageViewController_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication27JSStaticImageViewController_artworkCatalog));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication27JSStaticImageViewController_image);
}

@end