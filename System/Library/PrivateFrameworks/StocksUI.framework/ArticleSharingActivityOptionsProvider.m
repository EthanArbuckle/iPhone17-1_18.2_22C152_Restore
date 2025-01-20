@interface ArticleSharingActivityOptionsProvider
- (int64_t)articleActivityOptionsForHeadline:(id)a3;
@end

@implementation ArticleSharingActivityOptionsProvider

- (int64_t)articleActivityOptionsForHeadline:(id)a3
{
  __swift_project_boxed_opaque_existential_1(self->featureAvailability, *(void *)&self->featureAvailability[24]);
  swift_unknownObjectRetain();
  swift_retain();
  char v3 = sub_20A8C3810();
  swift_unknownObjectRelease();
  swift_release();
  if (v3) {
    return 124;
  }
  else {
    return 88;
  }
}

@end