@interface PFCoreDataUtils
+ (id)findDuplicateItemsWithEntity:(id)a3 itemsToLookAtFilter:(id)a4 keysThatMustMatchToBeConsideredADuplicate:(id)a5 keysThatShouldNotBeDuplicated:(id)a6 keyValuesOfDuplicatedItemsToReturn:(id)a7 sortDescriptors:(id)a8;
- (_TtC18PodcastsFoundation15PFCoreDataUtils)init;
@end

@implementation PFCoreDataUtils

+ (id)findDuplicateItemsWithEntity:(id)a3 itemsToLookAtFilter:(id)a4 keysThatMustMatchToBeConsideredADuplicate:(id)a5 keysThatShouldNotBeDuplicated:(id)a6 keyValuesOfDuplicatedItemsToReturn:(id)a7 sortDescriptors:(id)a8
{
  uint64_t v9 = sub_1ACE761B8();
  uint64_t v11 = v10;
  v12 = (void *)sub_1ACE76578();
  uint64_t v13 = sub_1ACE76578();
  uint64_t v14 = sub_1ACE76578();
  sub_1ACA50D4C(0, (unint64_t *)&qword_1EB768EB0);
  sub_1ACE76578();
  id v15 = a4;
  _s18PodcastsFoundation15PFCoreDataUtilsC18findDuplicateItems6entity19itemsToLookAtFilter017keysThatMustMatchK22BeConsideredADuplicate0op9ShouldNotS10Duplicated011keyValuesOfxhK6Return15sortDescriptorsSDySSSayyXlGGSS_So11NSPredicateCSaySSGA2OSaySo16NSSortDescriptorCGtFZ_0(v9, v11, (uint64_t)v15, v12, v13, v14);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E99F2880);
  v16 = (void *)sub_1ACE75FC8();
  swift_bridgeObjectRelease();
  return v16;
}

- (_TtC18PodcastsFoundation15PFCoreDataUtils)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PFCoreDataUtils();
  return [(PFCoreDataUtils *)&v3 init];
}

@end