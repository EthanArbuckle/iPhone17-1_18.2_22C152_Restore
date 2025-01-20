@interface BCPPTConfig
+ (BOOL)currentlyInTest;
+ (BOOL)extendedLaunchTestDestinationIsAudiobook;
+ (BOOL)extendedLaunchTestDestinationIsBook;
+ (BOOL)extendedLaunchTestDestinationIsHome;
+ (BOOL)hasExtendedLaunchTypeSet;
+ (BOOL)isReturningUser;
+ (BOOL)shouldHaveContinueAndPreviousContent;
+ (BOOL)shouldUseCachedTopPicksCards;
+ (BOOL)usePPTLaunchContent;
+ (NSString)cachedTopPickCardsJSONString;
+ (NSString)extendedLaunchTestTypeForLogging;
+ (NSString)launchTestKey;
+ (OS_os_log)os_log;
- (BCPPTConfig)init;
@end

@implementation BCPPTConfig

+ (NSString)launchTestKey
{
  NSString v2 = sub_1F2160();

  return (NSString *)v2;
}

+ (OS_os_log)os_log
{
  if (qword_342BC0 != -1) {
    swift_once();
  }
  NSString v2 = (void *)qword_344E48;

  return (OS_os_log *)v2;
}

+ (BOOL)currentlyInTest
{
  return sub_1D9D60((uint64_t)a1, (uint64_t)a2, &qword_342BC8, (unsigned __int8 *)&byte_344E50);
}

+ (BOOL)usePPTLaunchContent
{
  if (qword_342BC8 != -1) {
    swift_once();
  }
  if (byte_344E50) {
    return 1;
  }
  if (qword_342BD0 != -1) {
    swift_once();
  }
  return byte_344E51;
}

+ (BOOL)hasExtendedLaunchTypeSet
{
  return sub_1D9D60((uint64_t)a1, (uint64_t)a2, &qword_342BD0, (unsigned __int8 *)&byte_344E51);
}

+ (NSString)extendedLaunchTestTypeForLogging
{
  return (NSString *)sub_1D9DD8((uint64_t)a1, (uint64_t)a2, (void (*)(void))_s8BookCore9PPTConfigC32extendedLaunchTestTypeForLoggingSSvgZ_0);
}

+ (BOOL)extendedLaunchTestDestinationIsHome
{
  return _s8BookCore9PPTConfigC35extendedLaunchTestDestinationIsHomeSbvgZ_0() & 1;
}

+ (BOOL)extendedLaunchTestDestinationIsBook
{
  return _s8BookCore9PPTConfigC031extendedLaunchTestDestinationIsA0SbvgZ_0() & 1;
}

+ (BOOL)extendedLaunchTestDestinationIsAudiobook
{
  return _s8BookCore9PPTConfigC40extendedLaunchTestDestinationIsAudiobookSbvgZ_0() & 1;
}

+ (BOOL)isReturningUser
{
  return sub_1D9D60((uint64_t)a1, (uint64_t)a2, &qword_342BE0, (unsigned __int8 *)&byte_344E53);
}

+ (BOOL)shouldHaveContinueAndPreviousContent
{
  return sub_1D9D60((uint64_t)a1, (uint64_t)a2, &qword_342BE8, (unsigned __int8 *)&byte_344E54);
}

+ (BOOL)shouldUseCachedTopPicksCards
{
  return _s8BookCore9PPTConfigC28shouldUseCachedTopPicksCardsSbvgZ_0() & 1;
}

+ (NSString)cachedTopPickCardsJSONString
{
  return (NSString *)sub_1D9DD8((uint64_t)a1, (uint64_t)a2, (void (*)(void))_s8BookCore9PPTConfigC28cachedTopPickCardsJSONStringSSvgZ_0);
}

- (BCPPTConfig)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PPTConfig();
  return [(BCPPTConfig *)&v3 init];
}

@end