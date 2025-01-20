@interface OmniSearchService
- (_TtC10OmniSearch17OmniSearchService)init;
@end

@implementation OmniSearchService

- (_TtC10OmniSearch17OmniSearchService)init
{
  return (_TtC10OmniSearch17OmniSearchService *)OmniSearchService.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC10OmniSearch17OmniSearchService_answerResolver);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC10OmniSearch17OmniSearchService_queryParser);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC10OmniSearch17OmniSearchService_answerSynthesisController);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC10OmniSearch17OmniSearchService_resultHydrator);
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC10OmniSearch17OmniSearchService_intermediateCallback);
  _sxq_s5Error_pRi_zRi0_zRi__Ri0__r0_lySay10OmniSearch0C6ResultVGAEIsegHnrzo_SgWOe(v3);
}

@end