@interface BKPresentationDonationTarget
- (BKPresentationDonationTarget)init;
@end

@implementation BKPresentationDonationTarget

- (BKPresentationDonationTarget)init
{
  result = (BKPresentationDonationTarget *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  sub_10003E138(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BKPresentationDonationTarget_targetFrame));
  sub_10003E138(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BKPresentationDonationTarget_adopt));
  sub_10003E138(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BKPresentationDonationTarget_prepareForAdoption));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BKPresentationDonationTarget_finalizeAdoption);

  sub_10003E138(v3);
}

@end