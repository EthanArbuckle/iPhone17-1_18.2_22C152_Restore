@interface PGGraphRelationshipEdge
+ (MAEdgeFilter)acquaintanceFilter;
+ (MAEdgeFilter)brotherFilter;
+ (MAEdgeFilter)childFilter;
+ (MAEdgeFilter)confirmedRelationshipFilter;
+ (MAEdgeFilter)coworkerFilter;
+ (MAEdgeFilter)coworkerSocialGroupFilter;
+ (MAEdgeFilter)daughterFilter;
+ (MAEdgeFilter)familyFilter;
+ (MAEdgeFilter)familySocialGroupFilter;
+ (MAEdgeFilter)fatherFilter;
+ (MAEdgeFilter)friendFilter;
+ (MAEdgeFilter)inferredAcquaintanceFilter;
+ (MAEdgeFilter)inferredBrotherFilter;
+ (MAEdgeFilter)inferredChildFilter;
+ (MAEdgeFilter)inferredCoworkerFilter;
+ (MAEdgeFilter)inferredCoworkerSocialGroupFilter;
+ (MAEdgeFilter)inferredDaughterFilter;
+ (MAEdgeFilter)inferredFamilyFilter;
+ (MAEdgeFilter)inferredFamilySocialGroupFilter;
+ (MAEdgeFilter)inferredFatherFilter;
+ (MAEdgeFilter)inferredFriendFilter;
+ (MAEdgeFilter)inferredMotherFilter;
+ (MAEdgeFilter)inferredParentFilter;
+ (MAEdgeFilter)inferredPartnerFilter;
+ (MAEdgeFilter)inferredRelationshipFilter;
+ (MAEdgeFilter)inferredSisterFilter;
+ (MAEdgeFilter)inferredSonFilter;
+ (MAEdgeFilter)inferredVipFilter;
+ (MAEdgeFilter)motherFilter;
+ (MAEdgeFilter)parentFilter;
+ (MAEdgeFilter)partnerFilter;
+ (MAEdgeFilter)sisterFilter;
+ (MAEdgeFilter)sonFilter;
+ (MAEdgeFilter)vipFilter;
+ (id)familyRelationshipLabels;
+ (id)filter;
+ (id)filterWithConfirmedRelationship:(id)a3;
+ (id)filterWithInferredRelationship:(id)a3;
+ (id)filterWithRelationship:(id)a3;
+ (id)filterWithRelationship:(id)a3 status:(unint64_t)a4;
+ (id)filterWithSource:(unsigned __int8)a3;
+ (id)propertiesWithRelationshipSource:(unsigned __int8)a3;
+ (id)relationshipSourceToString:(unsigned __int8)a3;
+ (id)supportedRelationshipLabels;
- (BOOL)hasAnniversaryDate;
- (BOOL)hasParentContactName;
- (BOOL)hasProperties:(id)a3;
- (BOOL)hasSameFamilyNameAsMePerson;
- (BOOL)isPersonAgeDifferentThanMeNode;
- (BOOL)isPersonOldEnoughToBeParentOrGrandparent;
- (BOOL)isPersonYoungEnoughToBeMeNodeChild;
- (BOOL)isTopPerson;
- (BOOL)isTopTwoPersonsSocialGroup;
- (NSString)relationship;
- (PGGraphRelationshipEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7;
- (PGGraphRelationshipEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 weight:(float)a7 properties:(id)a8;
- (PGGraphRelationshipEdge)initWithRelationship:(id)a3 fromPersonNode:(id)a4 toPersonNode:(id)a5 confidence:(double)a6 status:(unint64_t)a7 familyHolidayAttendanceRate:(double)a8 hasParentContactName:(BOOL)a9 hasSameFamilyNameAsMePerson:(BOOL)a10 numberOfMomentsAtHome:(unint64_t)a11 hasAnniversaryDate:(BOOL)a12 isTopTwoPersonsSocialGroup:(BOOL)a13 numberOfLoveEmojisExchanged:(unint64_t)a14 isTopPerson:(BOOL)a15 friendNightOutAttendanceRate:(double)a16 partnerTripAttendanceRate:(double)a17 friendsAndFamilyTripAttendanceRate:(double)a18 weekendAppearanceRatio:(double)a19 momentsAtWorkAppearanceRate:(double)a20 calendarAttendanceRatio:(double)a21 isPersonAgeDifferentThanMeNode:(BOOL)a22 isPersonOldEnoughToBeParentOrGrandparent:(BOOL)a23 isPersonYoungEnoughToBeMeNodeChild:(BOOL)a24 source:(unsigned __int8)a25;
- (double)calendarAttendanceRatio;
- (double)confidence;
- (double)familyHolidayAttendanceRate;
- (double)friendNightOutAttendanceRate;
- (double)friendsAndFamilyTripAttendanceRate;
- (double)momentsAtWorkAppearanceRate;
- (double)partnerTripAttendanceRate;
- (double)weekendAppearanceRatio;
- (id)_readableStringForProperty:(id)a3;
- (id)edgeDescription;
- (id)label;
- (id)propertyDictionary;
- (unint64_t)numberOfLoveEmojisExchanged;
- (unint64_t)numberOfMomentsAtHome;
- (unint64_t)status;
- (unsigned)domain;
- (unsigned)source;
@end

@implementation PGGraphRelationshipEdge

- (void).cxx_destruct
{
}

- (unsigned)source
{
  return self->_source;
}

- (unint64_t)status
{
  return self->_status;
}

- (BOOL)isPersonYoungEnoughToBeMeNodeChild
{
  return self->_isPersonYoungEnoughToBeMeNodeChild;
}

- (BOOL)isPersonOldEnoughToBeParentOrGrandparent
{
  return (*((unsigned __int8 *)self + 48) >> 6) & 1;
}

- (BOOL)isPersonAgeDifferentThanMeNode
{
  return (*((unsigned __int8 *)self + 48) >> 5) & 1;
}

- (double)calendarAttendanceRatio
{
  return self->_calendarAttendanceRatio;
}

- (double)momentsAtWorkAppearanceRate
{
  return self->_momentsAtWorkAppearanceRate;
}

- (double)weekendAppearanceRatio
{
  return self->_weekendAppearanceRatio;
}

- (double)friendsAndFamilyTripAttendanceRate
{
  return self->_friendsAndFamilyTripAttendanceRate;
}

- (double)partnerTripAttendanceRate
{
  return self->_partnerTripAttendanceRate;
}

- (double)friendNightOutAttendanceRate
{
  return self->_friendNightOutAttendanceRate;
}

- (BOOL)isTopPerson
{
  return (*((unsigned __int8 *)self + 48) >> 4) & 1;
}

- (unint64_t)numberOfLoveEmojisExchanged
{
  return *((unsigned int *)self + 11);
}

- (BOOL)isTopTwoPersonsSocialGroup
{
  return (*((unsigned __int8 *)self + 48) >> 3) & 1;
}

- (BOOL)hasAnniversaryDate
{
  return (*((unsigned __int8 *)self + 48) >> 2) & 1;
}

- (unint64_t)numberOfMomentsAtHome
{
  return *((unsigned int *)self + 10);
}

- (BOOL)hasSameFamilyNameAsMePerson
{
  return (*((unsigned __int8 *)self + 48) >> 1) & 1;
}

- (BOOL)hasParentContactName
{
  return *((unsigned char *)self + 48) & 1;
}

- (double)familyHolidayAttendanceRate
{
  return self->_familyHolidayAttendanceRate;
}

- (double)confidence
{
  return self->_confidence;
}

- (NSString)relationship
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (id)_readableStringForProperty:(id)a3
{
  v11[20] = *MEMORY[0x1E4F143B8];
  v10[0] = @"confidence";
  v10[1] = @"rfamhol";
  v11[0] = @"SignalConfidence";
  v11[1] = @"SignalFamilyHolidayAttendanceRatio";
  v10[2] = @"rparnam";
  v10[3] = @"rfamnam";
  v11[2] = @"SignalHasParentContactName";
  v11[3] = @"SignalHasSameFamilyNameAsMePerson";
  v10[4] = @"gwnummmtshome";
  v10[5] = @"rhasanniv";
  v11[4] = @"SignalNumberOfMomentsAtHome";
  v11[5] = @"SignalHasAnniversaryDate";
  v10[6] = @"rtop2sg";
  v10[7] = @"rlovexch";
  v11[6] = @"SignalIsTopTwoPersonsSocialGroup";
  v11[7] = @"SignalNumberOfLoveEmojisExchanged";
  v10[8] = @"rtop";
  v10[9] = @"rfrndnghtout";
  v11[8] = @"SignalTopPerson";
  v11[9] = @"SignalFriendNightOutAttendanceRatio";
  v10[10] = @"rprtnrtrip";
  v10[11] = @"rfrfamtrip";
  v11[10] = @"SignalPartnerTripAttendanceRatio";
  v11[11] = @"SignalFriendsAndFamilyTripAttendanceRatio";
  v10[12] = @"rwkend";
  v10[13] = @"rwork";
  v11[12] = @"SignalWeekendAppearanceRatio";
  v11[13] = @"SignalCoworkerWorkMomentsRatio";
  v10[14] = @"rcal";
  v10[15] = @"ragediff";
  v11[14] = @"SignalCalendarAttendanceRatio";
  v11[15] = @"SignalAgeDifferentThanMeNode";
  v10[16] = @"rold";
  v10[17] = @"rchild";
  v11[16] = @"SignalAgeOldEnoughToBeParentOrGrandparent";
  v11[17] = @"SignalAgeYoungEnoughToBeMeNodeChild";
  v10[18] = @"relstatus";
  v10[19] = @"relsource";
  v11[18] = @"RelationshipStatus";
  v11[19] = @"RelationshipSource";
  v3 = (void *)MEMORY[0x1E4F1C9E8];
  id v4 = a3;
  v5 = [v3 dictionaryWithObjects:v11 forKeys:v10 count:20];
  v6 = [v5 objectForKeyedSubscript:v4];
  v7 = v6;
  if (!v6) {
    v6 = v4;
  }
  id v8 = v6;

  return v8;
}

- (unsigned)domain
{
  return 300;
}

- (id)label
{
  return self->_relationship;
}

- (id)edgeDescription
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v3 = [(PGGraphRelationshipEdge *)self propertyDictionary];
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        v11 = [(PGGraphRelationshipEdge *)self _readableStringForProperty:v10];
        v12 = NSString;
        v13 = [v5 objectForKeyedSubscript:v10];
        v14 = [v12 stringWithFormat:@"%@", v13];

        v15 = [NSString stringWithFormat:@"%@: %@", v11, v14];
        [v4 addObject:v15];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v7);
  }

  v16 = [v4 sortedArrayUsingSelector:sel_compare_];
  v17 = NSString;
  v25.receiver = self;
  v25.super_class = (Class)PGGraphRelationshipEdge;
  v18 = [(PGGraphOptimizedEdge *)&v25 edgeDescription];
  relationship = self->_relationship;
  [(PGGraphRelationshipEdge *)self confidence];
  uint64_t v21 = v20;
  v22 = [v16 componentsJoinedByString:@", "];
  v23 = [v17 stringWithFormat:@"%@ (%@, confidence = %f, %@)", v18, relationship, v21, v22];

  return v23;
}

- (id)propertyDictionary
{
  v26[20] = *MEMORY[0x1E4F143B8];
  v25[0] = @"confidence";
  v24 = [NSNumber numberWithDouble:self->_confidence];
  v26[0] = v24;
  v25[1] = @"rfamhol";
  v23 = [NSNumber numberWithDouble:self->_familyHolidayAttendanceRate];
  v26[1] = v23;
  v25[2] = @"rparnam";
  v22 = [NSNumber numberWithBool:*((unsigned char *)self + 48) & 1];
  v26[2] = v22;
  v25[3] = @"rfamnam";
  uint64_t v21 = [NSNumber numberWithBool:(*((unsigned __int8 *)self + 48) >> 1) & 1];
  v26[3] = v21;
  v25[4] = @"gwnummmtshome";
  uint64_t v20 = [NSNumber numberWithUnsignedInteger:*((unsigned int *)self + 10)];
  v26[4] = v20;
  v25[5] = @"rhasanniv";
  v19 = [NSNumber numberWithBool:(*((unsigned __int8 *)self + 48) >> 2) & 1];
  v26[5] = v19;
  v25[6] = @"rtop2sg";
  v18 = [NSNumber numberWithBool:(*((unsigned __int8 *)self + 48) >> 3) & 1];
  v26[6] = v18;
  v25[7] = @"rlovexch";
  v17 = [NSNumber numberWithUnsignedInteger:*((unsigned int *)self + 11)];
  v26[7] = v17;
  v25[8] = @"rtop";
  v16 = [NSNumber numberWithBool:(*((unsigned __int8 *)self + 48) >> 4) & 1];
  v26[8] = v16;
  v25[9] = @"rfrndnghtout";
  v15 = [NSNumber numberWithDouble:self->_friendNightOutAttendanceRate];
  v26[9] = v15;
  v25[10] = @"rprtnrtrip";
  v14 = [NSNumber numberWithDouble:self->_partnerTripAttendanceRate];
  v26[10] = v14;
  v25[11] = @"rfrfamtrip";
  v3 = [NSNumber numberWithDouble:self->_friendsAndFamilyTripAttendanceRate];
  v26[11] = v3;
  v25[12] = @"rwkend";
  id v4 = [NSNumber numberWithDouble:self->_weekendAppearanceRatio];
  v26[12] = v4;
  v25[13] = @"rwork";
  id v5 = [NSNumber numberWithDouble:self->_momentsAtWorkAppearanceRate];
  v26[13] = v5;
  v25[14] = @"rcal";
  uint64_t v6 = [NSNumber numberWithDouble:self->_calendarAttendanceRatio];
  v26[14] = v6;
  v25[15] = @"ragediff";
  uint64_t v7 = [NSNumber numberWithBool:(*((unsigned __int8 *)self + 48) >> 5) & 1];
  v26[15] = v7;
  v25[16] = @"rold";
  uint64_t v8 = [NSNumber numberWithBool:(*((unsigned __int8 *)self + 48) >> 6) & 1];
  v26[16] = v8;
  v25[17] = @"rchild";
  v9 = [NSNumber numberWithBool:self->_isPersonYoungEnoughToBeMeNodeChild];
  v26[17] = v9;
  v25[18] = @"relstatus";
  uint64_t v10 = [NSNumber numberWithUnsignedInteger:self->_status];
  v26[18] = v10;
  v25[19] = @"relsource";
  v11 = [NSNumber numberWithUnsignedChar:self->_source];
  v26[19] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:20];

  return v12;
}

- (BOOL)hasProperties:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 count])
  {
    uint64_t v6 = [v5 objectForKeyedSubscript:@"confidence"];
    uint64_t v7 = v6;
    if (v6)
    {
      [v6 doubleValue];
      if (v8 != self->_confidence) {
        goto LABEL_45;
      }
    }

    v9 = [v5 objectForKeyedSubscript:@"rfamhol"];
    uint64_t v7 = v9;
    if (v9)
    {
      [v9 doubleValue];
      if (v10 != self->_familyHolidayAttendanceRate) {
        goto LABEL_45;
      }
    }

    v11 = [v5 objectForKeyedSubscript:@"rparnam"];
    uint64_t v7 = v11;
    if (v11)
    {
      if ([v11 BOOLValue] == ((*((unsigned char *)self + 48) & 1) == 0)) {
        goto LABEL_45;
      }
    }

    v12 = [v5 objectForKeyedSubscript:@"rfamnam"];
    uint64_t v7 = v12;
    if (v12)
    {
      if ([v12 BOOLValue] == ((*((unsigned char *)self + 48) & 2) == 0)) {
        goto LABEL_45;
      }
    }

    v13 = [v5 objectForKeyedSubscript:@"gwnummmtshome"];
    uint64_t v7 = v13;
    if (v13)
    {
      if ([v13 unsignedIntegerValue] != *((_DWORD *)self + 10)) {
        goto LABEL_45;
      }
    }

    v14 = [v5 objectForKeyedSubscript:@"rhasanniv"];
    uint64_t v7 = v14;
    if (v14)
    {
      if ([v14 BOOLValue] == ((*((unsigned char *)self + 48) & 4) == 0)) {
        goto LABEL_45;
      }
    }

    v15 = [v5 objectForKeyedSubscript:@"rtop2sg"];
    uint64_t v7 = v15;
    if (v15)
    {
      if ([v15 BOOLValue] == ((*((unsigned char *)self + 48) & 8) == 0)) {
        goto LABEL_45;
      }
    }

    v16 = [v5 objectForKeyedSubscript:@"rlovexch"];
    uint64_t v7 = v16;
    if (v16)
    {
      if ([v16 unsignedIntegerValue] != *((_DWORD *)self + 11)) {
        goto LABEL_45;
      }
    }

    v17 = [v5 objectForKeyedSubscript:@"rtop"];
    uint64_t v7 = v17;
    if (v17)
    {
      if ([v17 BOOLValue] == ((*((unsigned char *)self + 48) & 0x10) == 0)) {
        goto LABEL_45;
      }
    }

    v18 = [v5 objectForKeyedSubscript:@"rfrndnghtout"];
    uint64_t v7 = v18;
    if (v18)
    {
      [v18 doubleValue];
      if (v19 != self->_friendNightOutAttendanceRate) {
        goto LABEL_45;
      }
    }

    uint64_t v20 = [v5 objectForKeyedSubscript:@"rprtnrtrip"];
    uint64_t v7 = v20;
    if (v20)
    {
      [v20 doubleValue];
      if (v21 != self->_partnerTripAttendanceRate) {
        goto LABEL_45;
      }
    }

    v22 = [v5 objectForKeyedSubscript:@"rfrfamtrip"];
    uint64_t v7 = v22;
    if (v22)
    {
      [v22 doubleValue];
      if (v23 != self->_friendsAndFamilyTripAttendanceRate) {
        goto LABEL_45;
      }
    }

    v24 = [v5 objectForKeyedSubscript:@"rwkend"];
    uint64_t v7 = v24;
    if (v24)
    {
      [v24 doubleValue];
      if (v25 != self->_weekendAppearanceRatio) {
        goto LABEL_45;
      }
    }

    long long v26 = [v5 objectForKeyedSubscript:@"rwork"];
    uint64_t v7 = v26;
    if (v26)
    {
      [v26 doubleValue];
      if (v27 != self->_momentsAtWorkAppearanceRate) {
        goto LABEL_45;
      }
    }

    long long v28 = [v5 objectForKeyedSubscript:@"rcal"];
    uint64_t v7 = v28;
    if (v28)
    {
      [v28 doubleValue];
      if (v29 != self->_calendarAttendanceRatio) {
        goto LABEL_45;
      }
    }

    v30 = [v5 objectForKeyedSubscript:@"ragediff"];
    uint64_t v7 = v30;
    if (v30)
    {
      if ([v30 BOOLValue] == ((*((unsigned char *)self + 48) & 0x20) == 0)) {
        goto LABEL_45;
      }
    }

    uint64_t v31 = [v5 objectForKeyedSubscript:@"rold"];
    uint64_t v7 = v31;
    if (v31)
    {
      if ([v31 BOOLValue] == ((*((unsigned char *)self + 48) & 0x40) == 0)) {
        goto LABEL_45;
      }
    }

    v32 = [v5 objectForKeyedSubscript:@"rchild"];
    uint64_t v7 = v32;
    if (v32)
    {
      if (self->_isPersonYoungEnoughToBeMeNodeChild != [v32 BOOLValue]) {
        goto LABEL_45;
      }
    }

    v33 = [v5 objectForKeyedSubscript:@"relstatus"];
    uint64_t v7 = v33;
    if (v33)
    {
      if ([v33 unsignedIntegerValue] != self->_status) {
        goto LABEL_45;
      }
    }

    v34 = [v5 objectForKeyedSubscript:@"relsource"];
    uint64_t v7 = v34;
    if (v34 && [v34 unsignedIntValue] != self->_source) {
LABEL_45:
    }
      BOOL v35 = 0;
    else {
      BOOL v35 = 1;
    }
  }
  else
  {
    BOOL v35 = 1;
  }

  return v35;
}

- (PGGraphRelationshipEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 weight:(float)a7 properties:(id)a8
{
  uint64_t v10 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  v18 = [v17 objectForKeyedSubscript:@"confidence"];

  if (!v18)
  {
    double v19 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v17];
    *(float *)&double v20 = a7;
    double v21 = [NSNumber numberWithFloat:v20];
    [v19 setObject:v21 forKeyedSubscript:@"confidence"];

    id v17 = v19;
  }
  v22 = [(PGGraphRelationshipEdge *)self initWithLabel:v14 sourceNode:v15 targetNode:v16 domain:v10 properties:v17];

  return v22;
}

- (PGGraphRelationshipEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  id v10 = a7;
  id v61 = a5;
  id v60 = a4;
  id v11 = a3;
  v12 = [v10 objectForKeyedSubscript:@"confidence"];
  [v12 doubleValue];
  double v14 = v13;

  id v15 = [v10 objectForKeyedSubscript:@"rfamhol"];
  [v15 doubleValue];
  double v17 = v16;

  v18 = [v10 objectForKeyedSubscript:@"rparnam"];
  unsigned int v59 = [v18 BOOLValue];

  double v19 = [v10 objectForKeyedSubscript:@"rfamnam"];
  unsigned int v58 = [v19 BOOLValue];

  double v20 = [v10 objectForKeyedSubscript:@"gwnummmtshome"];
  uint64_t v57 = [v20 unsignedIntegerValue];

  double v21 = [v10 objectForKeyedSubscript:@"rhasanniv"];
  char v56 = [v21 BOOLValue];

  v22 = [v10 objectForKeyedSubscript:@"rtop2sg"];
  char v23 = [v22 BOOLValue];

  v24 = [v10 objectForKeyedSubscript:@"rlovexch"];
  uint64_t v25 = [v24 unsignedIntegerValue];

  long long v26 = [v10 objectForKeyedSubscript:@"rtop"];
  LOBYTE(v24) = [v26 BOOLValue];

  double v27 = [v10 objectForKeyedSubscript:@"rfrndnghtout"];
  [v27 doubleValue];
  double v29 = v28;

  v30 = [v10 objectForKeyedSubscript:@"rprtnrtrip"];
  [v30 doubleValue];
  double v32 = v31;

  v33 = [v10 objectForKeyedSubscript:@"rfrfamtrip"];
  [v33 doubleValue];
  double v35 = v34;

  v36 = [v10 objectForKeyedSubscript:@"rwkend"];
  [v36 doubleValue];
  double v38 = v37;

  v39 = [v10 objectForKeyedSubscript:@"rwork"];
  [v39 doubleValue];
  double v41 = v40;

  v42 = [v10 objectForKeyedSubscript:@"rcal"];
  [v42 doubleValue];
  double v44 = v43;

  v45 = [v10 objectForKeyedSubscript:@"ragediff"];
  LOBYTE(v42) = [v45 BOOLValue];

  v46 = [v10 objectForKeyedSubscript:@"rold"];
  LOBYTE(v45) = [v46 BOOLValue];

  v47 = [v10 objectForKeyedSubscript:@"rchild"];
  char v48 = [v47 BOOLValue];

  v49 = [v10 objectForKeyedSubscript:@"relstatus"];
  uint64_t v50 = [v49 unsignedIntegerValue];

  v51 = [v10 objectForKeyedSubscript:@"relsource"];

  LOBYTE(v10) = [v51 unsignedIntValue];
  BYTE4(v55) = (_BYTE)v10;
  BYTE3(v55) = v48;
  BYTE2(v55) = (_BYTE)v45;
  BYTE1(v55) = (_BYTE)v42;
  LOBYTE(v55) = (_BYTE)v24;
  BYTE1(v54) = v23;
  LOBYTE(v54) = v56;
  v52 = -[PGGraphRelationshipEdge initWithRelationship:fromPersonNode:toPersonNode:confidence:status:familyHolidayAttendanceRate:hasParentContactName:hasSameFamilyNameAsMePerson:numberOfMomentsAtHome:hasAnniversaryDate:isTopTwoPersonsSocialGroup:numberOfLoveEmojisExchanged:isTopPerson:friendNightOutAttendanceRate:partnerTripAttendanceRate:friendsAndFamilyTripAttendanceRate:weekendAppearanceRatio:momentsAtWorkAppearanceRate:calendarAttendanceRatio:isPersonAgeDifferentThanMeNode:isPersonOldEnoughToBeParentOrGrandparent:isPersonYoungEnoughToBeMeNodeChild:source:](self, "initWithRelationship:fromPersonNode:toPersonNode:confidence:status:familyHolidayAttendanceRate:hasParentContactName:hasSameFamilyNameAsMePerson:numberOfMomentsAtHome:hasAnniversaryDate:isTopTwoPersonsSocialGroup:numberOfLoveEmojisExchanged:isTopPerson:friendNightOutAttendanceRate:partnerTripAttendanceRate:friendsAndFamilyTripAttendanceRate:weekendAppearanceRatio:momentsAtWorkAppearanceRate:calendarAttendanceRatio:isPersonAgeDifferentThanMeNode:isPersonOldEnoughToBeParentOrGrandparent:isPersonYoungEnoughToBeMeNodeChild:source:", v11, v60, v61, v50, v59, v58, v14, v17, v29, v32, v35, v38, v41,
          v44,
          v57,
          v54,
          v25,
          v55);

  return v52;
}

- (PGGraphRelationshipEdge)initWithRelationship:(id)a3 fromPersonNode:(id)a4 toPersonNode:(id)a5 confidence:(double)a6 status:(unint64_t)a7 familyHolidayAttendanceRate:(double)a8 hasParentContactName:(BOOL)a9 hasSameFamilyNameAsMePerson:(BOOL)a10 numberOfMomentsAtHome:(unint64_t)a11 hasAnniversaryDate:(BOOL)a12 isTopTwoPersonsSocialGroup:(BOOL)a13 numberOfLoveEmojisExchanged:(unint64_t)a14 isTopPerson:(BOOL)a15 friendNightOutAttendanceRate:(double)a16 partnerTripAttendanceRate:(double)a17 friendsAndFamilyTripAttendanceRate:(double)a18 weekendAppearanceRatio:(double)a19 momentsAtWorkAppearanceRate:(double)a20 calendarAttendanceRatio:(double)a21 isPersonAgeDifferentThanMeNode:(BOOL)a22 isPersonOldEnoughToBeParentOrGrandparent:(BOOL)a23 isPersonYoungEnoughToBeMeNodeChild:(BOOL)a24 source:(unsigned __int8)a25
{
  BOOL v25 = a10;
  id v39 = a3;
  v50.receiver = self;
  v50.super_class = (Class)PGGraphRelationshipEdge;
  double v40 = [(PGGraphEdge *)&v50 initWithSourceNode:a4 targetNode:a5];
  if (v40)
  {
    uint64_t v41 = [v39 copy];
    relationship = v40->_relationship;
    v40->_relationship = (NSString *)v41;

    v40->_confidence = a6;
    v40->_status = a7;
    v40->_familyHolidayAttendanceRate = a8;
    *((unsigned char *)v40 + 48) = *((unsigned char *)v40 + 48) & 0xFE | a9;
    if (v25) {
      char v43 = 2;
    }
    else {
      char v43 = 0;
    }
    *((unsigned char *)v40 + 48) = *((unsigned char *)v40 + 48) & 0xFD | v43;
    *((_DWORD *)v40 + 10) = a11;
    if (a12) {
      char v44 = 4;
    }
    else {
      char v44 = 0;
    }
    *((unsigned char *)v40 + 48) = *((unsigned char *)v40 + 48) & 0xFB | v44;
    if (a13) {
      char v45 = 8;
    }
    else {
      char v45 = 0;
    }
    *((unsigned char *)v40 + 48) = *((unsigned char *)v40 + 48) & 0xF7 | v45;
    *((_DWORD *)v40 + 11) = a14;
    if (a15) {
      char v46 = 16;
    }
    else {
      char v46 = 0;
    }
    *((unsigned char *)v40 + 48) = *((unsigned char *)v40 + 48) & 0xEF | v46;
    v40->_friendNightOutAttendanceRate = a16;
    v40->_partnerTripAttendanceRate = a17;
    v40->_friendsAndFamilyTripAttendanceRate = a18;
    v40->_weekendAppearanceRatio = a19;
    v40->_momentsAtWorkAppearanceRate = a20;
    v40->_calendarAttendanceRatio = a21;
    if (a22) {
      char v47 = 32;
    }
    else {
      char v47 = 0;
    }
    *((unsigned char *)v40 + 48) = *((unsigned char *)v40 + 48) & 0xDF | v47;
    if (a23) {
      char v48 = 64;
    }
    else {
      char v48 = 0;
    }
    *((unsigned char *)v40 + 48) = *((unsigned char *)v40 + 48) & 0xBF | v48;
    v40->_isPersonYoungEnoughToBeMeNodeChild = a24;
    v40->_source = a25;
  }

  return v40;
}

+ (id)familyRelationshipLabels
{
  v6[9] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = @"FAMILY";
  v6[1] = @"SISTER";
  v6[2] = @"BROTHER";
  v6[3] = @"PARENT";
  v6[4] = @"MOTHER";
  v6[5] = @"FATHER";
  v6[6] = @"CHILD";
  v6[7] = @"DAUGHTER";
  v6[8] = @"SON";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:9];
  id v4 = [v2 setWithArray:v3];

  return v4;
}

+ (id)filterWithSource:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = +[PGGraphRelationshipEdge filter];
  v9 = @"relsource";
  id v5 = [NSNumber numberWithUnsignedChar:v3];
  v10[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  uint64_t v7 = [v4 filterBySettingProperties:v6];

  return v7;
}

+ (MAEdgeFilter)inferredVipFilter
{
  return (MAEdgeFilter *)[a1 filterWithInferredRelationship:@"VIP"];
}

+ (MAEdgeFilter)vipFilter
{
  return (MAEdgeFilter *)[a1 filterWithConfirmedRelationship:@"VIP"];
}

+ (MAEdgeFilter)inferredAcquaintanceFilter
{
  return (MAEdgeFilter *)[a1 filterWithInferredRelationship:@"ACQUAINTANCE"];
}

+ (MAEdgeFilter)acquaintanceFilter
{
  return (MAEdgeFilter *)[a1 filterWithConfirmedRelationship:@"ACQUAINTANCE"];
}

+ (MAEdgeFilter)inferredCoworkerSocialGroupFilter
{
  return (MAEdgeFilter *)[a1 filterWithInferredRelationship:@"COWORKER_SOCIALGROUP"];
}

+ (MAEdgeFilter)coworkerSocialGroupFilter
{
  return (MAEdgeFilter *)[a1 filterWithConfirmedRelationship:@"COWORKER_SOCIALGROUP"];
}

+ (MAEdgeFilter)inferredCoworkerFilter
{
  return (MAEdgeFilter *)[a1 filterWithInferredRelationship:@"COWORKER"];
}

+ (MAEdgeFilter)coworkerFilter
{
  return (MAEdgeFilter *)[a1 filterWithConfirmedRelationship:@"COWORKER"];
}

+ (MAEdgeFilter)inferredFriendFilter
{
  return (MAEdgeFilter *)[a1 filterWithInferredRelationship:@"FRIEND"];
}

+ (MAEdgeFilter)friendFilter
{
  return (MAEdgeFilter *)[a1 filterWithConfirmedRelationship:@"FRIEND"];
}

+ (MAEdgeFilter)inferredChildFilter
{
  return (MAEdgeFilter *)[a1 filterWithInferredRelationship:@"CHILD"];
}

+ (MAEdgeFilter)childFilter
{
  return (MAEdgeFilter *)[a1 filterWithConfirmedRelationship:@"CHILD"];
}

+ (MAEdgeFilter)inferredFamilySocialGroupFilter
{
  return (MAEdgeFilter *)[a1 filterWithInferredRelationship:@"FAMILY_SOCIALGROUP"];
}

+ (MAEdgeFilter)familySocialGroupFilter
{
  return (MAEdgeFilter *)[a1 filterWithConfirmedRelationship:@"FAMILY_SOCIALGROUP"];
}

+ (MAEdgeFilter)inferredFamilyFilter
{
  return (MAEdgeFilter *)[a1 filterWithInferredRelationship:@"FAMILY"];
}

+ (MAEdgeFilter)familyFilter
{
  return (MAEdgeFilter *)[a1 filterWithConfirmedRelationship:@"FAMILY"];
}

+ (MAEdgeFilter)inferredParentFilter
{
  return (MAEdgeFilter *)[a1 filterWithInferredRelationship:@"PARENT"];
}

+ (MAEdgeFilter)parentFilter
{
  return (MAEdgeFilter *)[a1 filterWithConfirmedRelationship:@"PARENT"];
}

+ (MAEdgeFilter)inferredSonFilter
{
  return (MAEdgeFilter *)[a1 filterWithInferredRelationship:@"SON"];
}

+ (MAEdgeFilter)sonFilter
{
  return (MAEdgeFilter *)[a1 filterWithConfirmedRelationship:@"SON"];
}

+ (MAEdgeFilter)inferredDaughterFilter
{
  return (MAEdgeFilter *)[a1 filterWithInferredRelationship:@"DAUGHTER"];
}

+ (MAEdgeFilter)daughterFilter
{
  return (MAEdgeFilter *)[a1 filterWithConfirmedRelationship:@"DAUGHTER"];
}

+ (MAEdgeFilter)inferredSisterFilter
{
  return (MAEdgeFilter *)[a1 filterWithInferredRelationship:@"SISTER"];
}

+ (MAEdgeFilter)sisterFilter
{
  return (MAEdgeFilter *)[a1 filterWithConfirmedRelationship:@"SISTER"];
}

+ (MAEdgeFilter)inferredBrotherFilter
{
  return (MAEdgeFilter *)[a1 filterWithInferredRelationship:@"BROTHER"];
}

+ (MAEdgeFilter)brotherFilter
{
  return (MAEdgeFilter *)[a1 filterWithConfirmedRelationship:@"BROTHER"];
}

+ (MAEdgeFilter)inferredMotherFilter
{
  return (MAEdgeFilter *)[a1 filterWithInferredRelationship:@"MOTHER"];
}

+ (MAEdgeFilter)motherFilter
{
  return (MAEdgeFilter *)[a1 filterWithConfirmedRelationship:@"MOTHER"];
}

+ (MAEdgeFilter)inferredFatherFilter
{
  return (MAEdgeFilter *)[a1 filterWithInferredRelationship:@"FATHER"];
}

+ (MAEdgeFilter)fatherFilter
{
  return (MAEdgeFilter *)[a1 filterWithConfirmedRelationship:@"FATHER"];
}

+ (MAEdgeFilter)inferredPartnerFilter
{
  return (MAEdgeFilter *)[a1 filterWithInferredRelationship:@"PARTNER"];
}

+ (MAEdgeFilter)partnerFilter
{
  return (MAEdgeFilter *)[a1 filterWithConfirmedRelationship:@"PARTNER"];
}

+ (id)filterWithInferredRelationship:(id)a3
{
  return (id)[a1 filterWithRelationship:a3 status:1];
}

+ (id)filterWithConfirmedRelationship:(id)a3
{
  return (id)[a1 filterWithRelationship:a3 status:0];
}

+ (id)filterWithRelationship:(id)a3 status:(unint64_t)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = [a1 filterWithRelationship:a3];
  id v10 = @"relstatus";
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:a4];
  v11[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  double v8 = [v5 filterBySettingProperties:v7];

  return v8;
}

+ (id)filterWithRelationship:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F71EB0];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithLabel:v4 domain:300];

  return v5;
}

+ (MAEdgeFilter)inferredRelationshipFilter
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = +[PGGraphRelationshipEdge filter];
  uint64_t v6 = @"relstatus";
  v7[0] = &unk_1F28D0690;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  id v4 = [v2 filterBySettingProperties:v3];

  return (MAEdgeFilter *)v4;
}

+ (MAEdgeFilter)confirmedRelationshipFilter
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = +[PGGraphRelationshipEdge filter];
  uint64_t v6 = @"relstatus";
  v7[0] = &unk_1F28D0678;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  id v4 = [v2 filterBySettingProperties:v3];

  return (MAEdgeFilter *)v4;
}

+ (id)filter
{
  id v3 = objc_alloc(MEMORY[0x1E4F71EB0]);
  id v4 = [a1 supportedRelationshipLabels];
  id v5 = (void *)[v3 initWithLabels:v4 domain:300 properties:MEMORY[0x1E4F1CC08]];

  return v5;
}

+ (id)propertiesWithRelationshipSource:(unsigned __int8)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = @"relsource";
  id v3 = [NSNumber numberWithUnsignedChar:a3];
  v7[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return v4;
}

+ (id)relationshipSourceToString:(unsigned __int8)a3
{
  if (a3) {
    return @"Megadome";
  }
  else {
    return @"Graph";
  }
}

+ (id)supportedRelationshipLabels
{
  if (supportedRelationshipLabels_onceToken != -1) {
    dispatch_once(&supportedRelationshipLabels_onceToken, &__block_literal_global_3314);
  }
  v2 = (void *)supportedRelationshipLabels_supportedRelationshipLabels;
  return v2;
}

void __54__PGGraphRelationshipEdge_supportedRelationshipLabels__block_invoke()
{
  v4[17] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"PARTNER";
  v4[1] = @"FATHER";
  v4[2] = @"MOTHER";
  v4[3] = @"BROTHER";
  v4[4] = @"SISTER";
  v4[5] = @"DAUGHTER";
  v4[6] = @"SON";
  v4[7] = @"PARENT";
  v4[8] = @"FAMILY";
  v4[9] = @"FAMILY_SOCIALGROUP";
  v4[10] = @"CHILD";
  v4[11] = @"FRIEND";
  v4[12] = @"COWORKER";
  v4[13] = @"COWORKER_SOCIALGROUP";
  v4[14] = @"ACQUAINTANCE";
  v4[15] = @"VIP";
  v4[16] = @"HOUSEHOLD_MEMBER";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:17];
  uint64_t v2 = [v0 setWithArray:v1];
  id v3 = (void *)supportedRelationshipLabels_supportedRelationshipLabels;
  supportedRelationshipLabels_supportedRelationshipLabels = v2;
}

@end