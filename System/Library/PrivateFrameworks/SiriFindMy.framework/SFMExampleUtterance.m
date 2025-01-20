@interface SFMExampleUtterance
- (NSString)utteranceText;
- (_TtC10SiriFindMy19SFMExampleUtterance)init;
- (id)initForRole:(id)a3;
- (void)setUtteranceText:(id)a3;
@end

@implementation SFMExampleUtterance

- (NSString)utteranceText
{
  v2 = self;
  SFMExampleUtterance.utteranceText.getter();
  uint64_t v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1D463F8B8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

- (void)setUtteranceText:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1D463F8C8();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = self;
  sub_1D46131F4(v4, v6);
}

- (id)initForRole:(id)a3
{
  id v4 = a3;
  return SFMExampleUtterance.init(forRole:)((uint64_t)a3);
}

- (_TtC10SiriFindMy19SFMExampleUtterance)init
{
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10SiriFindMy19SFMExampleUtterance_languageProvider);

  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC10SiriFindMy19SFMExampleUtterance____lazy_storage___utteranceText);
  uint64_t v4 = *(void *)&self->languageProvider[OBJC_IVAR____TtC10SiriFindMy19SFMExampleUtterance____lazy_storage___utteranceText];

  sub_1D44ECAFC(v3, v4);
}

@end