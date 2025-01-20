@interface PGGraphMeaningNode
+ (MARelation)childMeaningOfMeaning;
+ (MARelation)eventOfMeaning;
+ (MARelation)eventOfReliableMeaning;
+ (MARelation)momentOfMeaning;
+ (MARelation)momentOfReliableMeaning;
+ (MARelation)parentMeaningOfMeaning;
+ (id)_localizationKeyForMeaningLabel:(id)a3;
+ (id)_localizedNameForLabel:(id)a3;
+ (id)filter;
+ (id)filterWithMeaning:(unint64_t)a3;
- (BOOL)isVeryMeaningful;
- (NSArray)localizedSynonyms;
- (NSString)featureIdentifier;
- (NSString)localizedName;
- (PGGraphMeaningNode)initWithLabel:(id)a3;
- (PGGraphMeaningNode)parentMeaningNode;
- (PGGraphMeaningNodeCollection)collection;
- (id)associatedNodesForRemoval;
- (id)label;
- (int64_t)isVeryMeaningfulCachedValue;
- (unint64_t)featureType;
- (unsigned)domain;
- (void)enumerateMeaningfulEventsUsingBlock:(id)a3;
- (void)enumerateMomentAlternativeEdgesAndNodesUsingBlock:(id)a3;
- (void)enumerateMomentEdgesAndNodesUsingBlock:(id)a3;
- (void)enumerateSubmeaningsUsingBlock:(id)a3;
- (void)setIsVeryMeaningfulCachedValue:(int64_t)a3;
- (void)traverseParentMeaningHierarchyUsingBlock:(id)a3;
- (void)traverseSubmeaningHierarchyUsingBlock:(id)a3;
@end

@implementation PGGraphMeaningNode

- (void).cxx_destruct
{
}

- (void)setIsVeryMeaningfulCachedValue:(int64_t)a3
{
  self->_isVeryMeaningfulCachedValue = a3;
}

- (int64_t)isVeryMeaningfulCachedValue
{
  return self->_isVeryMeaningfulCachedValue;
}

- (id)label
{
  return self->_label;
}

- (NSString)featureIdentifier
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(PGGraphMeaningNode *)self label];
  v7 = [v3 stringWithFormat:@"%@|%@", v5, v6];

  return (NSString *)v7;
}

- (unint64_t)featureType
{
  return 13;
}

- (PGGraphMeaningNodeCollection)collection
{
  v2 = [(MANodeCollection *)[PGGraphMeaningNodeCollection alloc] initWithNode:self];
  return v2;
}

- (id)associatedNodesForRemoval
{
  v3 = [MEMORY[0x1E4F1CA80] set];
  v4 = [(PGGraphMeaningNode *)self parentMeaningNode];

  if (v4)
  {
    v5 = [(PGGraphMeaningNode *)self parentMeaningNode];
    if (![v5 countOfEdgesWithLabel:@"MEANING" domain:700]
      && [v5 countOfEdgesWithLabel:@"SUBMEANING_OF" domain:700] == 1)
    {
      [v3 addObject:v5];
    }
  }
  else
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __47__PGGraphMeaningNode_associatedNodesForRemoval__block_invoke;
    v7[3] = &unk_1E68E8AA0;
    id v8 = v3;
    [(PGGraphMeaningNode *)self enumerateSubmeaningsUsingBlock:v7];
  }
  return v3;
}

uint64_t __47__PGGraphMeaningNode_associatedNodesForRemoval__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

- (NSArray)localizedSynonyms
{
  v3 = objc_opt_class();
  v4 = [(PGGraphMeaningNode *)self label];
  v5 = [v3 _localizationKeyForMeaningLabel:v4];

  v6 = +[PGGraphSynonymSupportHelper localizedSynonymsForLocalizationKey:v5];

  return (NSArray *)v6;
}

- (NSString)localizedName
{
  v3 = objc_opt_class();
  v4 = [(PGGraphMeaningNode *)self label];
  v5 = [v3 _localizedNameForLabel:v4];

  return (NSString *)v5;
}

- (BOOL)isVeryMeaningful
{
  int64_t isVeryMeaningfulCachedValue = self->_isVeryMeaningfulCachedValue;
  if (isVeryMeaningfulCachedValue)
  {
    LOBYTE(v3) = isVeryMeaningfulCachedValue == 1;
  }
  else
  {
    v5 = [(PGGraphMeaningNode *)self label];
    unint64_t v6 = +[PGGraph meaningForMeaningLabel:v5];

    v7 = +[PGGraph veryMeaningfulMeanings];
    int v3 = [v7 containsIndex:v6];
    int64_t v8 = 1;
    if (!v3) {
      int64_t v8 = -1;
    }
    self->_int64_t isVeryMeaningfulCachedValue = v8;
  }
  return v3;
}

- (PGGraphMeaningNode)parentMeaningNode
{
  v2 = [(PGGraphMeaningNode *)self collection];
  int v3 = [v2 parentMeaningNodes];
  v4 = [v3 anyNode];

  return (PGGraphMeaningNode *)v4;
}

- (void)traverseParentMeaningHierarchyUsingBlock:(id)a3
{
  v4 = (void (**)(id, void *, unsigned char *))a3;
  uint64_t v5 = [(PGGraphMeaningNode *)self parentMeaningNode];
  char v8 = 0;
  if (v5)
  {
    unint64_t v6 = (void *)v5;
    do
    {
      v7 = v6;
      v4[2](v4, v6, &v8);
      unint64_t v6 = [v6 parentMeaningNode];
    }
    while (v6 && !v8);
  }
}

- (void)traverseSubmeaningHierarchyUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__PGGraphMeaningNode_traverseSubmeaningHierarchyUsingBlock___block_invoke;
  v6[3] = &unk_1E68E8A78;
  id v7 = v4;
  id v5 = v4;
  [(PGGraphMeaningNode *)self enumerateSubmeaningsUsingBlock:v6];
}

void __60__PGGraphMeaningNode_traverseSubmeaningHierarchyUsingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  if (!*a4) {
    [v6 traverseSubmeaningHierarchyUsingBlock:*(void *)(a1 + 32)];
  }
}

- (void)enumerateSubmeaningsUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__PGGraphMeaningNode_enumerateSubmeaningsUsingBlock___block_invoke;
  v6[3] = &unk_1E68E8A50;
  id v7 = v4;
  id v5 = v4;
  [(MANode *)self enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:@"SUBMEANING_OF" domain:700 usingBlock:v6];
}

void __53__PGGraphMeaningNode_enumerateSubmeaningsUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = [v8 sourceNode];
  int v7 = [v6 isSameNodeAsNode:v5];

  if (v7) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)enumerateMomentAlternativeEdgesAndNodesUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72__PGGraphMeaningNode_enumerateMomentAlternativeEdgesAndNodesUsingBlock___block_invoke;
  v6[3] = &unk_1E68E8A20;
  id v7 = v4;
  id v5 = v4;
  [(MANode *)self enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:@"MEANING" domain:702 usingBlock:v6];
}

void __72__PGGraphMeaningNode_enumerateMomentAlternativeEdgesAndNodesUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = [v5 label];
  int v7 = [v6 isEqualToString:@"Moment"];

  if (v7) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)enumerateMomentEdgesAndNodesUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__PGGraphMeaningNode_enumerateMomentEdgesAndNodesUsingBlock___block_invoke;
  v6[3] = &unk_1E68E89F8;
  id v7 = v4;
  id v5 = v4;
  [(MANode *)self enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:@"MEANING" domain:700 usingBlock:v6];
}

void __61__PGGraphMeaningNode_enumerateMomentEdgesAndNodesUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = [v5 label];
  int v7 = [v6 isEqualToString:@"Moment"];

  if (v7) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)enumerateMeaningfulEventsUsingBlock:(id)a3
{
}

- (unsigned)domain
{
  return 700;
}

- (PGGraphMeaningNode)initWithLabel:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphMeaningNode;
  id v5 = [(PGGraphNode *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    label = v5->_label;
    v5->_label = (NSString *)v6;
  }
  return v5;
}

+ (id)filterWithMeaning:(unint64_t)a3
{
  int v3 = PGMeaningLabelForMeaning(a3);
  if (v3) {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:v3 domain:700];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

+ (MARelation)momentOfReliableMeaning
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F71F18];
  int v3 = [a1 eventOfReliableMeaning];
  v9[0] = v3;
  id v4 = +[PGGraphMomentNode filter];
  id v5 = [v4 relation];
  v9[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  int v7 = [v2 chain:v6];

  return (MARelation *)v7;
}

+ (MARelation)momentOfMeaning
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F71F18];
  int v3 = [a1 eventOfMeaning];
  v9[0] = v3;
  id v4 = +[PGGraphMomentNode filter];
  id v5 = [v4 relation];
  v9[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  int v7 = [v2 chain:v6];

  return (MARelation *)v7;
}

+ (MARelation)eventOfReliableMeaning
{
  v2 = +[PGGraphMeaningEdge reliableFilter];
  int v3 = [v2 inRelation];

  return (MARelation *)v3;
}

+ (MARelation)eventOfMeaning
{
  v2 = +[PGGraphMeaningEdge filter];
  int v3 = [v2 inRelation];

  return (MARelation *)v3;
}

+ (MARelation)parentMeaningOfMeaning
{
  v2 = +[PGGraphSubmeaningOfEdge filter];
  int v3 = [v2 outRelation];

  return (MARelation *)v3;
}

+ (MARelation)childMeaningOfMeaning
{
  v2 = +[PGGraphSubmeaningOfEdge filter];
  int v3 = [v2 inRelation];

  return (MARelation *)v3;
}

+ (id)_localizationKeyForMeaningLabel:(id)a3
{
  uint64_t v3 = _localizationKeyForMeaningLabel__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_localizationKeyForMeaningLabel__onceToken, &__block_literal_global_31711);
  }
  id v5 = [(id)_localizationKeyForMeaningLabel__searchKeyByLabel objectForKeyedSubscript:v4];

  return v5;
}

void __54__PGGraphMeaningNode__localizationKeyForMeaningLabel___block_invoke()
{
  v3[26] = *MEMORY[0x1E4F143B8];
  v2[0] = @"Activity";
  v2[1] = @"Hiking";
  v3[0] = @"PGMeaningActivitySearchableText";
  v3[1] = @"PGMeaningHikingSearchableText";
  v2[2] = @"Beaching";
  v2[3] = @"Diving";
  v3[2] = @"PGMeaningBeachingSearchableText";
  v3[3] = @"PGMeaningDivingSearchableText";
  v2[4] = @"WinterSport";
  v2[5] = @"Climbing";
  v3[4] = @"PGMeaningWinterSportSearchableText";
  v3[5] = @"PGMeaningClimbingSearchableText";
  v2[6] = @"Entertainment";
  v2[7] = @"AmusementPark";
  v3[6] = @"PGMeaningEntertainmentSearchableText";
  v3[7] = @"PGMeaningAmusementParkSearchableText";
  v2[8] = @"Performance";
  v2[9] = @"Concert";
  v3[8] = @"PGMeaningPerformanceSearchableText";
  v3[9] = @"PGMeaningConcertSearchableText";
  v2[10] = @"Festival";
  v2[11] = @"Theater";
  v3[10] = @"PGMeaningFestivalSearchableText";
  v3[11] = @"PGMeaningTheaterSearchableText";
  v2[12] = @"Dance";
  v2[13] = @"SportEvent";
  v3[12] = @"PGMeaningDanceSearchableText";
  v3[13] = @"PGMeaningSportEventSearchableText";
  v2[14] = @"NightOut";
  v2[15] = @"Museum";
  v3[14] = @"PGMeaningNightOutSearchableText";
  v3[15] = @"PGMeaningMuseumSearchableText";
  v2[16] = @"Celebration";
  v2[17] = @"Birthday";
  v3[16] = @"PGMeaningCelebrationSearchableText";
  v3[17] = @"PGMeaningBirthdaySearchableText";
  v2[18] = @"Anniversary";
  v2[19] = @"Wedding";
  v3[18] = @"PGMeaningAnniversarySearchableText";
  v3[19] = @"PGMeaningWeddingSearchableText";
  v2[20] = @"HolidayEvent";
  v2[21] = @"Gathering";
  v3[20] = @"PGMeaningHolidayEventSearchableText";
  v3[21] = @"PGMeaningGatheringSearchableText";
  v2[22] = @"Restaurant";
  v2[23] = @"Breakfast";
  v3[22] = @"PGMeaningRestaurantSearchableText";
  v3[23] = @"PGMeaningBreakfastSearchableText";
  v2[24] = @"Lunch";
  v2[25] = @"Dinner";
  v3[24] = @"PGMeaningLunchSearchableText";
  v3[25] = @"PGMeaningDinnerSearchableText";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:26];
  v1 = (void *)_localizationKeyForMeaningLabel__searchKeyByLabel;
  _localizationKeyForMeaningLabel__searchKeyByLabel = v0;
}

+ (id)_localizedNameForLabel:(id)a3
{
  uint64_t v3 = [a1 _localizationKeyForMeaningLabel:a3];
  id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:v3 value:v3 table:@"Localizable"];

  return v5;
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:0 domain:700];
  return v2;
}

@end