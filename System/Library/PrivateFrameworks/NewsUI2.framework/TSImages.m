@interface TSImages
+ (UIImage)blockHUD;
+ (UIImage)filterActions;
+ (UIImage)filterActionsSelected;
+ (UIImage)followHUD;
+ (UIImage)iconArticleMarkingDelete;
+ (UIImage)iconArticleMarkingDislike;
+ (UIImage)iconArticleMarkingLike;
+ (UIImage)iconArticleMarkingReport;
+ (UIImage)iconArticleMarkingSave;
+ (UIImage)iconArticleMarkingSaveSelected;
+ (UIImage)iconArticleMarkingShare;
+ (UIImage)iconFeedLike;
+ (UIImage)iconFeedLikeSelected;
+ (UIImage)iconFeedLikeSelectedWhite;
+ (UIImage)iconFeedLikeWhite;
+ (UIImage)iconFollowingDislike;
+ (UIImage)iconFollowingDislikeSelected;
+ (UIImage)iconMoreActions;
+ (UIImage)iconMoreActionsSelected;
+ (UIImage)iconMoreActionsSelectedWhite;
+ (UIImage)iconMoreActionsWhite;
+ (UIImage)iconSportsOnboardingLike;
+ (UIImage)iconSportsOnboardingLikeSelected;
+ (UIImage)iconSportsOnboardingRemove;
+ (UIImage)iconSubscriptionButtonLike;
+ (UIImage)iconSubscriptionButtonLikeHeart;
+ (UIImage)iconSubscriptionButtonLikeOpaque;
+ (UIImage)iconSubscriptionButtonLikeSelected;
+ (UIImage)iconSubscriptionButtonLikeSelectedHeart;
+ (UIImage)iconSubscriptionButtonLikeSelectedOpaque;
+ (UIImage)ignoreHUD;
+ (UIImage)saveHUD;
+ (UIImage)showLessHUD;
+ (UIImage)showMoreHUD;
+ (id)iconFollowingLikeSelectedWithShouldLayoutForLargeText:(BOOL)a3;
- (TSImages)init;
@end

@implementation TSImages

+ (UIImage)iconFeedLike
{
  return (UIImage *)sub_1DF3FD540((uint64_t)a1, (uint64_t)a2, &qword_1EAC1D180, (void **)&qword_1EAC2C500);
}

+ (UIImage)iconFeedLikeSelected
{
  return (UIImage *)sub_1DF3FD540((uint64_t)a1, (uint64_t)a2, &qword_1EAC1D188, (void **)&qword_1EBABE368);
}

+ (UIImage)iconFeedLikeWhite
{
  return (UIImage *)sub_1DF3FD540((uint64_t)a1, (uint64_t)a2, &qword_1EAC1D190, (void **)&qword_1EAC2C508);
}

+ (UIImage)iconFeedLikeSelectedWhite
{
  return (UIImage *)sub_1DF3FD540((uint64_t)a1, (uint64_t)a2, qword_1EAC1D198, (void **)&qword_1EAC2C510);
}

+ (UIImage)iconMoreActions
{
  return (UIImage *)sub_1DF3FD540((uint64_t)a1, (uint64_t)a2, &qword_1EBAE91C0, (void **)&qword_1EBAE91B0);
}

+ (UIImage)iconMoreActionsSelected
{
  return (UIImage *)sub_1DF3FD540((uint64_t)a1, (uint64_t)a2, &qword_1EAC1D1A8, (void **)&qword_1EAC2C518);
}

+ (UIImage)iconMoreActionsWhite
{
  return (UIImage *)sub_1DF3FD540((uint64_t)a1, (uint64_t)a2, &qword_1EAC1D1B0, (void **)&qword_1EAC2C520);
}

+ (UIImage)iconMoreActionsSelectedWhite
{
  return (UIImage *)sub_1DF3FD540((uint64_t)a1, (uint64_t)a2, &qword_1EAC1D1B8, (void **)&qword_1EAC2C528);
}

+ (UIImage)filterActions
{
  return (UIImage *)sub_1DF3FD540((uint64_t)a1, (uint64_t)a2, &qword_1EAC1D1C0, (void **)&qword_1EAC2C530);
}

+ (UIImage)filterActionsSelected
{
  return (UIImage *)sub_1DF3FD540((uint64_t)a1, (uint64_t)a2, &qword_1EAC1D1C8, (void **)&qword_1EAC2C538);
}

+ (id)iconFollowingLikeSelectedWithShouldLayoutForLargeText:(BOOL)a3
{
  sub_1DF3FDA5C(a3, 0xD000000000000015, 0x80000001DFEF0F50, (SEL *)&selRef_systemPinkColor);
  return v3;
}

+ (UIImage)iconSportsOnboardingLike
{
  return (UIImage *)sub_1DF3FD540((uint64_t)a1, (uint64_t)a2, &qword_1EAC1D1D0, (void **)&qword_1EAC2C540);
}

+ (UIImage)iconSportsOnboardingLikeSelected
{
  return (UIImage *)sub_1DF3FD540((uint64_t)a1, (uint64_t)a2, &qword_1EAC1D1D8, (void **)&qword_1EAC2C548);
}

+ (UIImage)iconFollowingDislike
{
  return (UIImage *)sub_1DF3FD540((uint64_t)a1, (uint64_t)a2, &qword_1EAC1D1E0, (void **)&qword_1EAC2C550);
}

+ (UIImage)iconFollowingDislikeSelected
{
  return (UIImage *)sub_1DF3FD540((uint64_t)a1, (uint64_t)a2, &qword_1EAC1D1E8, (void **)&qword_1EAC2C558);
}

+ (UIImage)iconSportsOnboardingRemove
{
  return (UIImage *)sub_1DF3FD540((uint64_t)a1, (uint64_t)a2, &qword_1EAC1D1F0, (void **)&qword_1EAC2C560);
}

+ (UIImage)iconSubscriptionButtonLike
{
  return (UIImage *)sub_1DF3FD540((uint64_t)a1, (uint64_t)a2, &qword_1EAC1D208, (void **)&qword_1EAC2C570);
}

+ (UIImage)iconSubscriptionButtonLikeSelected
{
  return (UIImage *)sub_1DF3FD540((uint64_t)a1, (uint64_t)a2, &qword_1EAC1D210, (void **)&qword_1EAC2C578);
}

+ (UIImage)iconSubscriptionButtonLikeOpaque
{
  return (UIImage *)sub_1DF3FD540((uint64_t)a1, (uint64_t)a2, &qword_1EAC1D218, (void **)&qword_1EAC2C580);
}

+ (UIImage)iconSubscriptionButtonLikeSelectedOpaque
{
  return (UIImage *)sub_1DF3FD540((uint64_t)a1, (uint64_t)a2, &qword_1EAC1D220, (void **)&qword_1EAC2C588);
}

+ (UIImage)iconSubscriptionButtonLikeHeart
{
  return (UIImage *)sub_1DF3FD540((uint64_t)a1, (uint64_t)a2, &qword_1EAC1D228, (void **)&qword_1EAC2C590);
}

+ (UIImage)iconSubscriptionButtonLikeSelectedHeart
{
  return (UIImage *)sub_1DF3FD540((uint64_t)a1, (uint64_t)a2, &qword_1EAC1D230, (void **)&qword_1EAC2C598);
}

+ (UIImage)iconArticleMarkingLike
{
  return (UIImage *)sub_1DF3FD540((uint64_t)a1, (uint64_t)a2, &qword_1EAC1D238, (void **)&qword_1EAC2C5A0);
}

+ (UIImage)iconArticleMarkingDislike
{
  return (UIImage *)sub_1DF3FD540((uint64_t)a1, (uint64_t)a2, &qword_1EAC1D240, (void **)&qword_1EAC2C5A8);
}

+ (UIImage)iconArticleMarkingReport
{
  return (UIImage *)sub_1DF3FD540((uint64_t)a1, (uint64_t)a2, &qword_1EAC1D248, (void **)&qword_1EAC2C5B0);
}

+ (UIImage)iconArticleMarkingDelete
{
  return (UIImage *)sub_1DF3FD540((uint64_t)a1, (uint64_t)a2, &qword_1EAC1D250, (void **)&qword_1EAC2C5B8);
}

+ (UIImage)iconArticleMarkingSave
{
  return (UIImage *)sub_1DF3FD540((uint64_t)a1, (uint64_t)a2, &qword_1EAC1D258, (void **)&qword_1EAC2C5C0);
}

+ (UIImage)iconArticleMarkingSaveSelected
{
  return (UIImage *)sub_1DF3FD540((uint64_t)a1, (uint64_t)a2, &qword_1EAC1D260, (void **)&qword_1EAC2C5C8);
}

+ (UIImage)iconArticleMarkingShare
{
  return (UIImage *)sub_1DF3FD540((uint64_t)a1, (uint64_t)a2, &qword_1EAC1D268, (void **)&qword_1EAC2C5D0);
}

+ (UIImage)followHUD
{
  return (UIImage *)sub_1DF3FD540((uint64_t)a1, (uint64_t)a2, &qword_1EAC1D2E0, (void **)&qword_1EAC2C5D8);
}

+ (UIImage)ignoreHUD
{
  return (UIImage *)sub_1DF3FD540((uint64_t)a1, (uint64_t)a2, &qword_1EAC1D2E8, (void **)&qword_1EAC2C5E0);
}

+ (UIImage)saveHUD
{
  return (UIImage *)sub_1DF3FD540((uint64_t)a1, (uint64_t)a2, &qword_1EAC1D2F0, (void **)&qword_1EAC2C5E8);
}

+ (UIImage)blockHUD
{
  return (UIImage *)sub_1DF3FD540((uint64_t)a1, (uint64_t)a2, &qword_1EAC1D2F8, (void **)&qword_1EAC2C5F0);
}

+ (UIImage)showMoreHUD
{
  return (UIImage *)sub_1DF3FD540((uint64_t)a1, (uint64_t)a2, &qword_1EAC1D300, (void **)&qword_1EAC2C5F8);
}

+ (UIImage)showLessHUD
{
  return (UIImage *)sub_1DF3FD540((uint64_t)a1, (uint64_t)a2, &qword_1EAC1D308, (void **)&qword_1EAC2C600);
}

- (TSImages)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for Images();
  return [(TSImages *)&v3 init];
}

@end