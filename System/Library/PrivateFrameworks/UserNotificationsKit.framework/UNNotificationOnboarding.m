@interface UNNotificationOnboarding
+ (BOOL)isEligibleForExperience:(unint64_t)a3;
+ (BOOL)shouldShowExperience:(unint64_t)a3 forClient:(unint64_t)a4;
+ (id)allowedClassesForExperience:(unint64_t)a3;
+ (id)onboardingControllerForExperience:(unint64_t)a3;
+ (id)onboardingControllerForViewModel:(id)a3;
+ (id)viewModelForExperience:(unint64_t)a3;
- (UNNotificationOnboarding)init;
@end

@implementation UNNotificationOnboarding

+ (BOOL)isEligibleForExperience:(unint64_t)a3
{
  if (objc_msgSend(a1, sel_shouldShowExperience_forClient_, a3, 0)) {
    return 1;
  }

  return objc_msgSend(a1, sel_shouldShowExperience_forClient_, a3, 1);
}

+ (BOOL)shouldShowExperience:(unint64_t)a3 forClient:(unint64_t)a4
{
  return sub_22017E794(a3, a4) & 1;
}

+ (id)onboardingControllerForExperience:(unint64_t)a3
{
  if (a3)
  {
    id v3 = 0;
  }
  else
  {
    id v5 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for NotificationSummarizationOnboardingViewModel()), sel_init);
    id v3 = objc_msgSend(a1, sel_onboardingControllerForViewModel_, v5);
  }

  return v3;
}

+ (id)onboardingControllerForViewModel:(id)a3
{
  swift_getObjCClassMetadata();
  id v3 = (void *)swift_unknownObjectRetain();
  v4 = (void *)sub_2201767A4(v3);
  swift_unknownObjectRelease();

  return v4;
}

+ (id)viewModelForExperience:(unint64_t)a3
{
  id v3 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for NotificationSummarizationOnboardingViewModel()), sel_init);

  return v3;
}

+ (id)allowedClassesForExperience:(unint64_t)a3
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0AA88);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_220186E60;
  *(void *)(v3 + 32) = type metadata accessor for NotificationSummarizationOnboardingViewModel();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F0AA90);
  v4 = (void *)sub_2201824E0();
  swift_bridgeObjectRelease();

  return v4;
}

- (UNNotificationOnboarding)init
{
  v3.receiver = self;
  v3.super_class = (Class)UNNotificationOnboarding;
  return [(UNNotificationOnboarding *)&v3 init];
}

@end