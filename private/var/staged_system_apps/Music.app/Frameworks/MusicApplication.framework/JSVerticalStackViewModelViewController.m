@interface JSVerticalStackViewModelViewController
- (NSData)playActivityRecommendationData;
- (NSString)playActivityFeatureName;
- (_TtC16MusicApplication38JSVerticalStackViewModelViewController)initWithCoder:(id)a3;
@end

@implementation JSVerticalStackViewModelViewController

- (_TtC16MusicApplication38JSVerticalStackViewModelViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication38JSVerticalStackViewModelViewController_lastSeenScrollableHeight) = 0;
  id v4 = a3;

  result = (_TtC16MusicApplication38JSVerticalStackViewModelViewController *)sub_AB8280();
  __break(1u);
  return result;
}

- (NSString)playActivityFeatureName
{
  v2 = *(void (**)(void))&stru_68.segname[(**(void **)((char *)&self->super.super.super.super.super.isa
                                                       + OBJC_IVAR____TtC16MusicApplication38JSVerticalStackViewModelViewController_verticalStack) & swift_isaMask)
                                        + 8];
  v3 = self;
  v2();

  NSString v4 = sub_AB64D0();
  swift_bridgeObjectRelease();

  return (NSString *)v4;
}

- (NSData)playActivityRecommendationData
{
  v2 = *(uint64_t (**)(void))((char *)&stru_68.offset
                           + (**(void **)((char *)&self->super.super.super.super.super.isa
                                          + OBJC_IVAR____TtC16MusicApplication38JSVerticalStackViewModelViewController_verticalStack) & swift_isaMask));
  v3 = self;
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

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication38JSVerticalStackViewModelViewController_verticalStack));
}

@end