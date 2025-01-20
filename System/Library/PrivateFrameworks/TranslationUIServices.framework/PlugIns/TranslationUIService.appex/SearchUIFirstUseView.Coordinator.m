@interface SearchUIFirstUseView.Coordinator
- (_TtCV20TranslationUIService20SearchUIFirstUseView11Coordinator)init;
- (void)firstTimeExperienceContinueButtonPressed;
@end

@implementation SearchUIFirstUseView.Coordinator

- (void)firstTimeExperienceContinueButtonPressed
{
  v2 = *(void (**)(uint64_t))((char *)&self->super.isa
                                      + OBJC_IVAR____TtCV20TranslationUIService20SearchUIFirstUseView11Coordinator_continueAction);
  if (v2)
  {
    v4 = self;
    uint64_t v3 = sub_100014C28((uint64_t)v2);
    v2(v3);
    sub_10000A374((uint64_t)v2);
  }
}

- (_TtCV20TranslationUIService20SearchUIFirstUseView11Coordinator)init
{
  uint64_t v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCV20TranslationUIService20SearchUIFirstUseView11Coordinator_continueAction);
  v4 = (objc_class *)type metadata accessor for SearchUIFirstUseView.Coordinator();
  *uint64_t v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return [(SearchUIFirstUseView.Coordinator *)&v6 init];
}

- (void).cxx_destruct
{
  sub_10000A374(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCV20TranslationUIService20SearchUIFirstUseView11Coordinator_continueAction));
}

@end