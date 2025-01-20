@interface PGGuessWhoRelationshipMetricEvent
- (BOOL)shouldReportMetrics;
- (PGGuessWhoRelationshipMetricEvent)initWithGraphManager:(id)a3;
- (id)_inferredRelationshipKeys;
- (id)_readableStringByRelationshipEdgeProperty;
- (id)_relationshipKeyForLabel:(id)a3;
- (id)identifier;
- (id)payload;
- (unint64_t)numberOfAgeDifferentThanMeSignalRegistrations;
- (unint64_t)numberOfAgeDifferentThanMeSignalRegistrationsInCorrectInference;
- (unint64_t)numberOfAnniversaryDateSignalRegistrations;
- (unint64_t)numberOfAnniversaryDateSignalRegistrationsInCorrectInference;
- (unint64_t)numberOfCoworkerCalendarSignalRegistrations;
- (unint64_t)numberOfCoworkerCalendarSignalRegistrationsInCorrectInference;
- (unint64_t)numberOfCoworkersAtWorkSignalRegistrations;
- (unint64_t)numberOfCoworkersAtWorkSignalRegistrationsInCorrectInference;
- (unint64_t)numberOfFamilyHolidaySignalRegistrations;
- (unint64_t)numberOfFamilyHolidaySignalRegistrationsInCorrectInference;
- (unint64_t)numberOfFriendNightOutSignalRegistrations;
- (unint64_t)numberOfFriendNightOutSignalRegistrationsInCorrectInference;
- (unint64_t)numberOfFriendsFamilyTripSignalRegistrations;
- (unint64_t)numberOfFriendsFamilyTripSignalRegistrationsInCorrectInference;
- (unint64_t)numberOfHomeMomentsSignalRegistrations;
- (unint64_t)numberOfHomeMomentsSignalRegistrationsInCorrectInference;
- (unint64_t)numberOfInferredChildren;
- (unint64_t)numberOfInferredCoworkers;
- (unint64_t)numberOfInferredFamilyMembers;
- (unint64_t)numberOfInferredFriends;
- (unint64_t)numberOfInferredParents;
- (unint64_t)numberOfInferredPartners;
- (unint64_t)numberOfLoveEmojisSignalRegistrations;
- (unint64_t)numberOfLoveEmojisSignalRegistrationsInCorrectInference;
- (unint64_t)numberOfParentContactNameSignalRegistrations;
- (unint64_t)numberOfParentContactNameSignalRegistrationsInCorrectInference;
- (unint64_t)numberOfParentGrandparentOldSignalRegistrations;
- (unint64_t)numberOfParentGrandparentOldSignalRegistrationsInCorrectInference;
- (unint64_t)numberOfPartnerTripSignalRegistrations;
- (unint64_t)numberOfPartnerTripSignalRegistrationsInCorrectInference;
- (unint64_t)numberOfPeople;
- (unint64_t)numberOfSameFamilyNameSignalRegistrations;
- (unint64_t)numberOfSameFamilyNameSignalRegistrationsInCorrectInference;
- (unint64_t)numberOfTopPersonSignalRegistrations;
- (unint64_t)numberOfTopPersonSignalRegistrationsInCorrectInference;
- (unint64_t)numberOfTopTwoPersonSocialGroupSignalRegistrations;
- (unint64_t)numberOfTopTwoPersonSocialGroupSignalRegistrationsInCorrectInference;
- (unint64_t)numberOfWeekendSignalRegistrations;
- (unint64_t)numberOfWeekendSignalRegistrationsInCorrectInference;
- (void)_incrementRelationshipSignalMetricsForRelationshipEdge:(id)a3 inferredRelationshipCorrect:(BOOL)a4;
- (void)gatherMetricsWithProgressBlock:(id)a3;
- (void)setNumberOfAgeDifferentThanMeSignalRegistrations:(unint64_t)a3;
- (void)setNumberOfAgeDifferentThanMeSignalRegistrationsInCorrectInference:(unint64_t)a3;
- (void)setNumberOfAnniversaryDateSignalRegistrations:(unint64_t)a3;
- (void)setNumberOfAnniversaryDateSignalRegistrationsInCorrectInference:(unint64_t)a3;
- (void)setNumberOfCoworkerCalendarSignalRegistrations:(unint64_t)a3;
- (void)setNumberOfCoworkerCalendarSignalRegistrationsInCorrectInference:(unint64_t)a3;
- (void)setNumberOfCoworkersAtWorkSignalRegistrations:(unint64_t)a3;
- (void)setNumberOfCoworkersAtWorkSignalRegistrationsInCorrectInference:(unint64_t)a3;
- (void)setNumberOfFamilyHolidaySignalRegistrations:(unint64_t)a3;
- (void)setNumberOfFamilyHolidaySignalRegistrationsInCorrectInference:(unint64_t)a3;
- (void)setNumberOfFriendNightOutSignalRegistrations:(unint64_t)a3;
- (void)setNumberOfFriendNightOutSignalRegistrationsInCorrectInference:(unint64_t)a3;
- (void)setNumberOfFriendsFamilyTripSignalRegistrations:(unint64_t)a3;
- (void)setNumberOfFriendsFamilyTripSignalRegistrationsInCorrectInference:(unint64_t)a3;
- (void)setNumberOfHomeMomentsSignalRegistrations:(unint64_t)a3;
- (void)setNumberOfHomeMomentsSignalRegistrationsInCorrectInference:(unint64_t)a3;
- (void)setNumberOfInferredChildren:(unint64_t)a3;
- (void)setNumberOfInferredCoworkers:(unint64_t)a3;
- (void)setNumberOfInferredFamilyMembers:(unint64_t)a3;
- (void)setNumberOfInferredFriends:(unint64_t)a3;
- (void)setNumberOfInferredParents:(unint64_t)a3;
- (void)setNumberOfInferredPartners:(unint64_t)a3;
- (void)setNumberOfLoveEmojisSignalRegistrations:(unint64_t)a3;
- (void)setNumberOfLoveEmojisSignalRegistrationsInCorrectInference:(unint64_t)a3;
- (void)setNumberOfParentContactNameSignalRegistrations:(unint64_t)a3;
- (void)setNumberOfParentContactNameSignalRegistrationsInCorrectInference:(unint64_t)a3;
- (void)setNumberOfParentGrandparentOldSignalRegistrations:(unint64_t)a3;
- (void)setNumberOfParentGrandparentOldSignalRegistrationsInCorrectInference:(unint64_t)a3;
- (void)setNumberOfPartnerTripSignalRegistrations:(unint64_t)a3;
- (void)setNumberOfPartnerTripSignalRegistrationsInCorrectInference:(unint64_t)a3;
- (void)setNumberOfPeople:(unint64_t)a3;
- (void)setNumberOfSameFamilyNameSignalRegistrations:(unint64_t)a3;
- (void)setNumberOfSameFamilyNameSignalRegistrationsInCorrectInference:(unint64_t)a3;
- (void)setNumberOfTopPersonSignalRegistrations:(unint64_t)a3;
- (void)setNumberOfTopPersonSignalRegistrationsInCorrectInference:(unint64_t)a3;
- (void)setNumberOfTopTwoPersonSocialGroupSignalRegistrations:(unint64_t)a3;
- (void)setNumberOfTopTwoPersonSocialGroupSignalRegistrationsInCorrectInference:(unint64_t)a3;
- (void)setNumberOfWeekendSignalRegistrations:(unint64_t)a3;
- (void)setNumberOfWeekendSignalRegistrationsInCorrectInference:(unint64_t)a3;
@end

@implementation PGGuessWhoRelationshipMetricEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_manager, 0);
}

- (void)setNumberOfParentGrandparentOldSignalRegistrationsInCorrectInference:(unint64_t)a3
{
  self->_numberOfParentGrandparentOldSignalRegistrationsInCorrectInference = a3;
}

- (unint64_t)numberOfParentGrandparentOldSignalRegistrationsInCorrectInference
{
  return self->_numberOfParentGrandparentOldSignalRegistrationsInCorrectInference;
}

- (void)setNumberOfAgeDifferentThanMeSignalRegistrationsInCorrectInference:(unint64_t)a3
{
  self->_numberOfAgeDifferentThanMeSignalRegistrationsInCorrectInference = a3;
}

- (unint64_t)numberOfAgeDifferentThanMeSignalRegistrationsInCorrectInference
{
  return self->_numberOfAgeDifferentThanMeSignalRegistrationsInCorrectInference;
}

- (void)setNumberOfCoworkerCalendarSignalRegistrationsInCorrectInference:(unint64_t)a3
{
  self->_numberOfCoworkerCalendarSignalRegistrationsInCorrectInference = a3;
}

- (unint64_t)numberOfCoworkerCalendarSignalRegistrationsInCorrectInference
{
  return self->_numberOfCoworkerCalendarSignalRegistrationsInCorrectInference;
}

- (void)setNumberOfCoworkersAtWorkSignalRegistrationsInCorrectInference:(unint64_t)a3
{
  self->_numberOfCoworkersAtWorkSignalRegistrationsInCorrectInference = a3;
}

- (unint64_t)numberOfCoworkersAtWorkSignalRegistrationsInCorrectInference
{
  return self->_numberOfCoworkersAtWorkSignalRegistrationsInCorrectInference;
}

- (void)setNumberOfWeekendSignalRegistrationsInCorrectInference:(unint64_t)a3
{
  self->_numberOfWeekendSignalRegistrationsInCorrectInference = a3;
}

- (unint64_t)numberOfWeekendSignalRegistrationsInCorrectInference
{
  return self->_numberOfWeekendSignalRegistrationsInCorrectInference;
}

- (void)setNumberOfFriendsFamilyTripSignalRegistrationsInCorrectInference:(unint64_t)a3
{
  self->_numberOfFriendsFamilyTripSignalRegistrationsInCorrectInference = a3;
}

- (unint64_t)numberOfFriendsFamilyTripSignalRegistrationsInCorrectInference
{
  return self->_numberOfFriendsFamilyTripSignalRegistrationsInCorrectInference;
}

- (void)setNumberOfPartnerTripSignalRegistrationsInCorrectInference:(unint64_t)a3
{
  self->_numberOfPartnerTripSignalRegistrationsInCorrectInference = a3;
}

- (unint64_t)numberOfPartnerTripSignalRegistrationsInCorrectInference
{
  return self->_numberOfPartnerTripSignalRegistrationsInCorrectInference;
}

- (void)setNumberOfFriendNightOutSignalRegistrationsInCorrectInference:(unint64_t)a3
{
  self->_numberOfFriendNightOutSignalRegistrationsInCorrectInference = a3;
}

- (unint64_t)numberOfFriendNightOutSignalRegistrationsInCorrectInference
{
  return self->_numberOfFriendNightOutSignalRegistrationsInCorrectInference;
}

- (void)setNumberOfTopPersonSignalRegistrationsInCorrectInference:(unint64_t)a3
{
  self->_numberOfTopPersonSignalRegistrationsInCorrectInference = a3;
}

- (unint64_t)numberOfTopPersonSignalRegistrationsInCorrectInference
{
  return self->_numberOfTopPersonSignalRegistrationsInCorrectInference;
}

- (void)setNumberOfLoveEmojisSignalRegistrationsInCorrectInference:(unint64_t)a3
{
  self->_numberOfLoveEmojisSignalRegistrationsInCorrectInference = a3;
}

- (unint64_t)numberOfLoveEmojisSignalRegistrationsInCorrectInference
{
  return self->_numberOfLoveEmojisSignalRegistrationsInCorrectInference;
}

- (void)setNumberOfTopTwoPersonSocialGroupSignalRegistrationsInCorrectInference:(unint64_t)a3
{
  self->_numberOfTopTwoPersonSocialGroupSignalRegistrationsInCorrectInference = a3;
}

- (unint64_t)numberOfTopTwoPersonSocialGroupSignalRegistrationsInCorrectInference
{
  return self->_numberOfTopTwoPersonSocialGroupSignalRegistrationsInCorrectInference;
}

- (void)setNumberOfAnniversaryDateSignalRegistrationsInCorrectInference:(unint64_t)a3
{
  self->_numberOfAnniversaryDateSignalRegistrationsInCorrectInference = a3;
}

- (unint64_t)numberOfAnniversaryDateSignalRegistrationsInCorrectInference
{
  return self->_numberOfAnniversaryDateSignalRegistrationsInCorrectInference;
}

- (void)setNumberOfHomeMomentsSignalRegistrationsInCorrectInference:(unint64_t)a3
{
  self->_numberOfHomeMomentsSignalRegistrationsInCorrectInference = a3;
}

- (unint64_t)numberOfHomeMomentsSignalRegistrationsInCorrectInference
{
  return self->_numberOfHomeMomentsSignalRegistrationsInCorrectInference;
}

- (void)setNumberOfSameFamilyNameSignalRegistrationsInCorrectInference:(unint64_t)a3
{
  self->_numberOfSameFamilyNameSignalRegistrationsInCorrectInference = a3;
}

- (unint64_t)numberOfSameFamilyNameSignalRegistrationsInCorrectInference
{
  return self->_numberOfSameFamilyNameSignalRegistrationsInCorrectInference;
}

- (void)setNumberOfParentContactNameSignalRegistrationsInCorrectInference:(unint64_t)a3
{
  self->_numberOfParentContactNameSignalRegistrationsInCorrectInference = a3;
}

- (unint64_t)numberOfParentContactNameSignalRegistrationsInCorrectInference
{
  return self->_numberOfParentContactNameSignalRegistrationsInCorrectInference;
}

- (void)setNumberOfFamilyHolidaySignalRegistrationsInCorrectInference:(unint64_t)a3
{
  self->_numberOfFamilyHolidaySignalRegistrationsInCorrectInference = a3;
}

- (unint64_t)numberOfFamilyHolidaySignalRegistrationsInCorrectInference
{
  return self->_numberOfFamilyHolidaySignalRegistrationsInCorrectInference;
}

- (void)setNumberOfParentGrandparentOldSignalRegistrations:(unint64_t)a3
{
  self->_numberOfParentGrandparentOldSignalRegistrations = a3;
}

- (unint64_t)numberOfParentGrandparentOldSignalRegistrations
{
  return self->_numberOfParentGrandparentOldSignalRegistrations;
}

- (void)setNumberOfAgeDifferentThanMeSignalRegistrations:(unint64_t)a3
{
  self->_numberOfAgeDifferentThanMeSignalRegistrations = a3;
}

- (unint64_t)numberOfAgeDifferentThanMeSignalRegistrations
{
  return self->_numberOfAgeDifferentThanMeSignalRegistrations;
}

- (void)setNumberOfCoworkerCalendarSignalRegistrations:(unint64_t)a3
{
  self->_numberOfCoworkerCalendarSignalRegistrations = a3;
}

- (unint64_t)numberOfCoworkerCalendarSignalRegistrations
{
  return self->_numberOfCoworkerCalendarSignalRegistrations;
}

- (void)setNumberOfCoworkersAtWorkSignalRegistrations:(unint64_t)a3
{
  self->_numberOfCoworkersAtWorkSignalRegistrations = a3;
}

- (unint64_t)numberOfCoworkersAtWorkSignalRegistrations
{
  return self->_numberOfCoworkersAtWorkSignalRegistrations;
}

- (void)setNumberOfWeekendSignalRegistrations:(unint64_t)a3
{
  self->_numberOfWeekendSignalRegistrations = a3;
}

- (unint64_t)numberOfWeekendSignalRegistrations
{
  return self->_numberOfWeekendSignalRegistrations;
}

- (void)setNumberOfFriendsFamilyTripSignalRegistrations:(unint64_t)a3
{
  self->_numberOfFriendsFamilyTripSignalRegistrations = a3;
}

- (unint64_t)numberOfFriendsFamilyTripSignalRegistrations
{
  return self->_numberOfFriendsFamilyTripSignalRegistrations;
}

- (void)setNumberOfPartnerTripSignalRegistrations:(unint64_t)a3
{
  self->_numberOfPartnerTripSignalRegistrations = a3;
}

- (unint64_t)numberOfPartnerTripSignalRegistrations
{
  return self->_numberOfPartnerTripSignalRegistrations;
}

- (void)setNumberOfFriendNightOutSignalRegistrations:(unint64_t)a3
{
  self->_numberOfFriendNightOutSignalRegistrations = a3;
}

- (unint64_t)numberOfFriendNightOutSignalRegistrations
{
  return self->_numberOfFriendNightOutSignalRegistrations;
}

- (void)setNumberOfTopPersonSignalRegistrations:(unint64_t)a3
{
  self->_numberOfTopPersonSignalRegistrations = a3;
}

- (unint64_t)numberOfTopPersonSignalRegistrations
{
  return self->_numberOfTopPersonSignalRegistrations;
}

- (void)setNumberOfLoveEmojisSignalRegistrations:(unint64_t)a3
{
  self->_numberOfLoveEmojisSignalRegistrations = a3;
}

- (unint64_t)numberOfLoveEmojisSignalRegistrations
{
  return self->_numberOfLoveEmojisSignalRegistrations;
}

- (void)setNumberOfTopTwoPersonSocialGroupSignalRegistrations:(unint64_t)a3
{
  self->_numberOfTopTwoPersonSocialGroupSignalRegistrations = a3;
}

- (unint64_t)numberOfTopTwoPersonSocialGroupSignalRegistrations
{
  return self->_numberOfTopTwoPersonSocialGroupSignalRegistrations;
}

- (void)setNumberOfAnniversaryDateSignalRegistrations:(unint64_t)a3
{
  self->_numberOfAnniversaryDateSignalRegistrations = a3;
}

- (unint64_t)numberOfAnniversaryDateSignalRegistrations
{
  return self->_numberOfAnniversaryDateSignalRegistrations;
}

- (void)setNumberOfHomeMomentsSignalRegistrations:(unint64_t)a3
{
  self->_numberOfHomeMomentsSignalRegistrations = a3;
}

- (unint64_t)numberOfHomeMomentsSignalRegistrations
{
  return self->_numberOfHomeMomentsSignalRegistrations;
}

- (void)setNumberOfSameFamilyNameSignalRegistrations:(unint64_t)a3
{
  self->_numberOfSameFamilyNameSignalRegistrations = a3;
}

- (unint64_t)numberOfSameFamilyNameSignalRegistrations
{
  return self->_numberOfSameFamilyNameSignalRegistrations;
}

- (void)setNumberOfParentContactNameSignalRegistrations:(unint64_t)a3
{
  self->_numberOfParentContactNameSignalRegistrations = a3;
}

- (unint64_t)numberOfParentContactNameSignalRegistrations
{
  return self->_numberOfParentContactNameSignalRegistrations;
}

- (void)setNumberOfFamilyHolidaySignalRegistrations:(unint64_t)a3
{
  self->_numberOfFamilyHolidaySignalRegistrations = a3;
}

- (unint64_t)numberOfFamilyHolidaySignalRegistrations
{
  return self->_numberOfFamilyHolidaySignalRegistrations;
}

- (void)setNumberOfInferredChildren:(unint64_t)a3
{
  self->_numberOfInferredChildren = a3;
}

- (unint64_t)numberOfInferredChildren
{
  return self->_numberOfInferredChildren;
}

- (void)setNumberOfInferredPartners:(unint64_t)a3
{
  self->_numberOfInferredPartners = a3;
}

- (unint64_t)numberOfInferredPartners
{
  return self->_numberOfInferredPartners;
}

- (void)setNumberOfInferredCoworkers:(unint64_t)a3
{
  self->_numberOfInferredCoworkers = a3;
}

- (unint64_t)numberOfInferredCoworkers
{
  return self->_numberOfInferredCoworkers;
}

- (void)setNumberOfInferredParents:(unint64_t)a3
{
  self->_numberOfInferredParents = a3;
}

- (unint64_t)numberOfInferredParents
{
  return self->_numberOfInferredParents;
}

- (void)setNumberOfInferredFriends:(unint64_t)a3
{
  self->_numberOfInferredFriends = a3;
}

- (unint64_t)numberOfInferredFriends
{
  return self->_numberOfInferredFriends;
}

- (void)setNumberOfInferredFamilyMembers:(unint64_t)a3
{
  self->_numberOfInferredFamilyMembers = a3;
}

- (unint64_t)numberOfInferredFamilyMembers
{
  return self->_numberOfInferredFamilyMembers;
}

- (void)setNumberOfPeople:(unint64_t)a3
{
  self->_numberOfPeople = a3;
}

- (unint64_t)numberOfPeople
{
  return self->_numberOfPeople;
}

- (id)_relationshipKeyForLabel:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"FAMILY"])
  {
    v4 = &unk_1F28D1E78;
  }
  else if ([v3 isEqualToString:@"PARTNER"])
  {
    v4 = &unk_1F28D1EC0;
  }
  else if ([v3 isEqualToString:@"COWORKER"])
  {
    v4 = &unk_1F28D1EA8;
  }
  else if ([v3 isEqualToString:@"FRIEND"])
  {
    v4 = &unk_1F28D1E90;
  }
  else if ([v3 isEqualToString:@"PARENT"])
  {
    v4 = &unk_1F28D1ED8;
  }
  else
  {
    v4 = &unk_1F28D1F08;
  }

  return v4;
}

- (id)_readableStringByRelationshipEdgeProperty
{
  v5[16] = *MEMORY[0x1E4F143B8];
  v4[0] = @"rfamhol";
  v4[1] = @"rparnam";
  v5[0] = @"Family Holiday";
  v5[1] = @"Parent Contact Name";
  v4[2] = @"rfamnam";
  v4[3] = @"gwnummmtshome";
  v5[2] = @"Same Family Name";
  v5[3] = @"Moments At Home";
  v4[4] = @"rhasanniv";
  v4[5] = @"rtop2sg";
  v5[4] = @"Anniversary Date";
  v5[5] = @"Top Two Person SG";
  v4[6] = @"rlovexch";
  v4[7] = @"rtop";
  v5[6] = @"Love Emojis";
  v5[7] = @"Top Person";
  v4[8] = @"rfrndnghtout";
  v4[9] = @"rprtnrtrip";
  v5[8] = @"Friend Night Out";
  v5[9] = @"Partner Trip";
  v4[10] = @"rfrfamtrip";
  v4[11] = @"rwkend";
  v5[10] = @"Friends/Family Trip";
  v5[11] = @"Weekend";
  v4[12] = @"rwork";
  v4[13] = @"rcal";
  v5[12] = @"Coworkers At Work";
  v5[13] = @"Coworker Calendar";
  v4[14] = @"ragediff";
  v4[15] = @"rold";
  v5[14] = @"Age Different Than Me";
  v5[15] = @"Parent Or Grandparent Old Enough";
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:16];
  return v2;
}

- (id)_inferredRelationshipKeys
{
  return &unk_1F28D40B0;
}

- (void)_incrementRelationshipSignalMetricsForRelationshipEdge:(id)a3 inferredRelationshipCorrect:(BOOL)a4
{
  BOOL v4 = a4;
  id v64 = a3;
  [v64 familyHolidayAttendanceRate];
  double v7 = v6;
  unint64_t v8 = [(PGGuessWhoRelationshipMetricEvent *)self numberOfFamilyHolidaySignalRegistrations];
  if (v7 <= 0.0) {
    unint64_t v9 = v8;
  }
  else {
    unint64_t v9 = v8 + 1;
  }
  [(PGGuessWhoRelationshipMetricEvent *)self setNumberOfFamilyHolidaySignalRegistrations:v9];
  unint64_t v10 = [(PGGuessWhoRelationshipMetricEvent *)self numberOfFamilyHolidaySignalRegistrationsInCorrectInference];
  BOOL v11 = v4 && v7 > 0.0;
  [(PGGuessWhoRelationshipMetricEvent *)self setNumberOfFamilyHolidaySignalRegistrationsInCorrectInference:v10 + v11];
  unsigned int v12 = [v64 hasParentContactName];
  if (v4) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = 0;
  }
  [(PGGuessWhoRelationshipMetricEvent *)self setNumberOfParentContactNameSignalRegistrations:[(PGGuessWhoRelationshipMetricEvent *)self numberOfParentContactNameSignalRegistrations]+ v12];
  [(PGGuessWhoRelationshipMetricEvent *)self setNumberOfParentContactNameSignalRegistrationsInCorrectInference:[(PGGuessWhoRelationshipMetricEvent *)self numberOfParentContactNameSignalRegistrationsInCorrectInference]+ v13];
  unsigned int v14 = [v64 hasSameFamilyNameAsMePerson];
  if (v4) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = 0;
  }
  [(PGGuessWhoRelationshipMetricEvent *)self setNumberOfSameFamilyNameSignalRegistrations:[(PGGuessWhoRelationshipMetricEvent *)self numberOfSameFamilyNameSignalRegistrations]+ v14];
  [(PGGuessWhoRelationshipMetricEvent *)self setNumberOfSameFamilyNameSignalRegistrationsInCorrectInference:[(PGGuessWhoRelationshipMetricEvent *)self numberOfSameFamilyNameSignalRegistrationsInCorrectInference]+ v15];
  uint64_t v16 = [v64 numberOfMomentsAtHome];
  unint64_t v17 = [(PGGuessWhoRelationshipMetricEvent *)self numberOfHomeMomentsSignalRegistrations];
  if (v16) {
    unint64_t v18 = v17 + 1;
  }
  else {
    unint64_t v18 = v17;
  }
  BOOL v19 = v4 && v16 != 0;
  [(PGGuessWhoRelationshipMetricEvent *)self setNumberOfHomeMomentsSignalRegistrations:v18];
  [(PGGuessWhoRelationshipMetricEvent *)self setNumberOfHomeMomentsSignalRegistrationsInCorrectInference:[(PGGuessWhoRelationshipMetricEvent *)self numberOfHomeMomentsSignalRegistrationsInCorrectInference]+ v19];
  unsigned int v20 = [v64 hasAnniversaryDate];
  if (v4) {
    uint64_t v21 = v20;
  }
  else {
    uint64_t v21 = 0;
  }
  [(PGGuessWhoRelationshipMetricEvent *)self setNumberOfAnniversaryDateSignalRegistrations:[(PGGuessWhoRelationshipMetricEvent *)self numberOfAnniversaryDateSignalRegistrations]+ v20];
  [(PGGuessWhoRelationshipMetricEvent *)self setNumberOfAnniversaryDateSignalRegistrationsInCorrectInference:[(PGGuessWhoRelationshipMetricEvent *)self numberOfAnniversaryDateSignalRegistrationsInCorrectInference]+ v21];
  unsigned int v22 = [v64 isTopTwoPersonsSocialGroup];
  if (v4) {
    uint64_t v23 = v22;
  }
  else {
    uint64_t v23 = 0;
  }
  [(PGGuessWhoRelationshipMetricEvent *)self setNumberOfTopTwoPersonSocialGroupSignalRegistrations:[(PGGuessWhoRelationshipMetricEvent *)self numberOfTopTwoPersonSocialGroupSignalRegistrations]+ v22];
  [(PGGuessWhoRelationshipMetricEvent *)self setNumberOfTopTwoPersonSocialGroupSignalRegistrationsInCorrectInference:[(PGGuessWhoRelationshipMetricEvent *)self numberOfTopTwoPersonSocialGroupSignalRegistrationsInCorrectInference]+ v23];
  uint64_t v24 = [v64 numberOfLoveEmojisExchanged];
  unint64_t v25 = [(PGGuessWhoRelationshipMetricEvent *)self numberOfLoveEmojisSignalRegistrations];
  if (v24) {
    unint64_t v26 = v25 + 1;
  }
  else {
    unint64_t v26 = v25;
  }
  BOOL v27 = v4 && v24 != 0;
  [(PGGuessWhoRelationshipMetricEvent *)self setNumberOfLoveEmojisSignalRegistrations:v26];
  [(PGGuessWhoRelationshipMetricEvent *)self setNumberOfLoveEmojisSignalRegistrationsInCorrectInference:[(PGGuessWhoRelationshipMetricEvent *)self numberOfLoveEmojisSignalRegistrationsInCorrectInference]+ v27];
  unsigned int v28 = [v64 isTopPerson];
  if (v4) {
    uint64_t v29 = v28;
  }
  else {
    uint64_t v29 = 0;
  }
  [(PGGuessWhoRelationshipMetricEvent *)self setNumberOfTopPersonSignalRegistrations:[(PGGuessWhoRelationshipMetricEvent *)self numberOfTopPersonSignalRegistrations]+ v28];
  [(PGGuessWhoRelationshipMetricEvent *)self setNumberOfTopPersonSignalRegistrationsInCorrectInference:[(PGGuessWhoRelationshipMetricEvent *)self numberOfTopPersonSignalRegistrationsInCorrectInference]+ v29];
  [v64 friendNightOutAttendanceRate];
  double v31 = v30;
  unint64_t v32 = [(PGGuessWhoRelationshipMetricEvent *)self numberOfFriendNightOutSignalRegistrations];
  if (v31 <= 0.0) {
    unint64_t v33 = v32;
  }
  else {
    unint64_t v33 = v32 + 1;
  }
  BOOL v34 = v4 && v31 > 0.0;
  [(PGGuessWhoRelationshipMetricEvent *)self setNumberOfFriendNightOutSignalRegistrations:v33];
  [(PGGuessWhoRelationshipMetricEvent *)self setNumberOfFriendNightOutSignalRegistrationsInCorrectInference:[(PGGuessWhoRelationshipMetricEvent *)self numberOfFriendNightOutSignalRegistrationsInCorrectInference]+ v34];
  [v64 partnerTripAttendanceRate];
  double v36 = v35;
  unint64_t v37 = [(PGGuessWhoRelationshipMetricEvent *)self numberOfPartnerTripSignalRegistrations];
  if (v36 <= 0.0) {
    unint64_t v38 = v37;
  }
  else {
    unint64_t v38 = v37 + 1;
  }
  BOOL v39 = v4 && v36 > 0.0;
  [(PGGuessWhoRelationshipMetricEvent *)self setNumberOfPartnerTripSignalRegistrations:v38];
  [(PGGuessWhoRelationshipMetricEvent *)self setNumberOfPartnerTripSignalRegistrationsInCorrectInference:[(PGGuessWhoRelationshipMetricEvent *)self numberOfPartnerTripSignalRegistrationsInCorrectInference]+ v39];
  [v64 friendsAndFamilyTripAttendanceRate];
  double v41 = v40;
  unint64_t v42 = [(PGGuessWhoRelationshipMetricEvent *)self numberOfFriendsFamilyTripSignalRegistrations];
  if (v41 <= 0.0) {
    unint64_t v43 = v42;
  }
  else {
    unint64_t v43 = v42 + 1;
  }
  BOOL v44 = v4 && v41 > 0.0;
  [(PGGuessWhoRelationshipMetricEvent *)self setNumberOfFriendsFamilyTripSignalRegistrations:v43];
  [(PGGuessWhoRelationshipMetricEvent *)self setNumberOfFriendsFamilyTripSignalRegistrationsInCorrectInference:[(PGGuessWhoRelationshipMetricEvent *)self numberOfFriendsFamilyTripSignalRegistrationsInCorrectInference]+ v44];
  [v64 weekendAppearanceRatio];
  double v46 = v45;
  unint64_t v47 = [(PGGuessWhoRelationshipMetricEvent *)self numberOfWeekendSignalRegistrations];
  if (v46 <= 0.0) {
    unint64_t v48 = v47;
  }
  else {
    unint64_t v48 = v47 + 1;
  }
  BOOL v49 = v4 && v46 > 0.0;
  [(PGGuessWhoRelationshipMetricEvent *)self setNumberOfWeekendSignalRegistrations:v48];
  [(PGGuessWhoRelationshipMetricEvent *)self setNumberOfWeekendSignalRegistrationsInCorrectInference:[(PGGuessWhoRelationshipMetricEvent *)self numberOfWeekendSignalRegistrationsInCorrectInference]+ v49];
  [v64 momentsAtWorkAppearanceRate];
  double v51 = v50;
  unint64_t v52 = [(PGGuessWhoRelationshipMetricEvent *)self numberOfCoworkersAtWorkSignalRegistrations];
  if (v51 <= 0.0) {
    unint64_t v53 = v52;
  }
  else {
    unint64_t v53 = v52 + 1;
  }
  BOOL v54 = v4 && v51 > 0.0;
  [(PGGuessWhoRelationshipMetricEvent *)self setNumberOfCoworkersAtWorkSignalRegistrations:v53];
  [(PGGuessWhoRelationshipMetricEvent *)self setNumberOfCoworkersAtWorkSignalRegistrationsInCorrectInference:[(PGGuessWhoRelationshipMetricEvent *)self numberOfCoworkersAtWorkSignalRegistrationsInCorrectInference]+ v54];
  [v64 calendarAttendanceRatio];
  double v56 = v55;
  unint64_t v57 = [(PGGuessWhoRelationshipMetricEvent *)self numberOfCoworkerCalendarSignalRegistrations];
  if (v56 <= 0.0) {
    unint64_t v58 = v57;
  }
  else {
    unint64_t v58 = v57 + 1;
  }
  BOOL v59 = v4 && v56 > 0.0;
  [(PGGuessWhoRelationshipMetricEvent *)self setNumberOfCoworkerCalendarSignalRegistrations:v58];
  [(PGGuessWhoRelationshipMetricEvent *)self setNumberOfCoworkerCalendarSignalRegistrationsInCorrectInference:[(PGGuessWhoRelationshipMetricEvent *)self numberOfCoworkerCalendarSignalRegistrationsInCorrectInference]+ v59];
  unsigned int v60 = [v64 isPersonAgeDifferentThanMeNode];
  if (v4) {
    uint64_t v61 = v60;
  }
  else {
    uint64_t v61 = 0;
  }
  [(PGGuessWhoRelationshipMetricEvent *)self setNumberOfAgeDifferentThanMeSignalRegistrations:[(PGGuessWhoRelationshipMetricEvent *)self numberOfAgeDifferentThanMeSignalRegistrations]+ v60];
  [(PGGuessWhoRelationshipMetricEvent *)self setNumberOfAgeDifferentThanMeSignalRegistrationsInCorrectInference:[(PGGuessWhoRelationshipMetricEvent *)self numberOfAgeDifferentThanMeSignalRegistrationsInCorrectInference]+ v61];
  unsigned int v62 = [v64 isPersonOldEnoughToBeParentOrGrandparent];
  if (v4) {
    uint64_t v63 = v62;
  }
  else {
    uint64_t v63 = 0;
  }
  [(PGGuessWhoRelationshipMetricEvent *)self setNumberOfParentGrandparentOldSignalRegistrations:[(PGGuessWhoRelationshipMetricEvent *)self numberOfParentGrandparentOldSignalRegistrations]+ v62];
  [(PGGuessWhoRelationshipMetricEvent *)self setNumberOfParentGrandparentOldSignalRegistrationsInCorrectInference:[(PGGuessWhoRelationshipMetricEvent *)self numberOfParentGrandparentOldSignalRegistrationsInCorrectInference]+ v63];
}

- (void)gatherMetricsWithProgressBlock:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (void (**)(void *, unsigned char *, double))_Block_copy(a3);
  double v5 = 0.0;
  if (v4)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      char v10 = 0;
      v4[2](v4, &v10, 0.0);
      if (v10)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v12 = 155;
          __int16 v13 = 2080;
          unsigned int v14 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metric"
                "s/MetricEvents/PGGuessWhoRelationshipMetricEvent.m";
          double v7 = MEMORY[0x1E4F14500];
LABEL_12:
          _os_log_impl(&dword_1D1805000, v7, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          goto LABEL_13;
        }
        goto LABEL_13;
      }
      double v5 = Current;
    }
  }
  manager = self->_manager;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__PGGuessWhoRelationshipMetricEvent_gatherMetricsWithProgressBlock___block_invoke;
  v9[3] = &unk_1E68F0848;
  v9[4] = self;
  [(PGManager *)manager performSynchronousConcurrentGraphReadUsingBlock:v9];
  if (v4)
  {
    if (CFAbsoluteTimeGetCurrent() - v5 >= 0.01)
    {
      char v10 = 0;
      v4[2](v4, &v10, 1.0);
      if (v10)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v12 = 232;
          __int16 v13 = 2080;
          unsigned int v14 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metric"
                "s/MetricEvents/PGGuessWhoRelationshipMetricEvent.m";
          double v7 = MEMORY[0x1E4F14500];
          goto LABEL_12;
        }
      }
    }
  }
LABEL_13:
}

void __68__PGGuessWhoRelationshipMetricEvent_gatherMetricsWithProgressBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v10 = a2;
  int v12 = [v10 graph];
  if (PGIsAppleInternal_onceToken != -1) {
    dispatch_once(&PGIsAppleInternal_onceToken, &__block_literal_global_8452);
  }
  char v2 = PGIsAppleInternal_isAppleInternal;
  BOOL v11 = [v12 personNodesIncludingMe:0];
  objc_msgSend(*(id *)(a1 + 32), "setNumberOfPeople:", objc_msgSend(v11, "count"));
  unsigned int v14 = [v12 meNode];
  uint64_t v52 = 0;
  unint64_t v53 = &v52;
  uint64_t v54 = 0x2020000000;
  uint64_t v55 = 0;
  uint64_t v48 = 0;
  BOOL v49 = &v48;
  uint64_t v50 = 0x2020000000;
  uint64_t v51 = 0;
  uint64_t v44 = 0;
  double v45 = &v44;
  uint64_t v46 = 0x2020000000;
  uint64_t v47 = 0;
  uint64_t v40 = 0;
  double v41 = &v40;
  uint64_t v42 = 0x2020000000;
  uint64_t v43 = 0;
  uint64_t v36 = 0;
  unint64_t v37 = &v36;
  uint64_t v38 = 0x2020000000;
  uint64_t v39 = 0;
  uint64_t v32 = 0;
  unint64_t v33 = &v32;
  uint64_t v34 = 0x2020000000;
  uint64_t v35 = 0;
  [*(id *)(a1 + 32) _inferredRelationshipKeys];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v29 = 0u;
  long long v28 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [obj countByEnumeratingWithState:&v28 objects:v56 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v29 != v4) {
          objc_enumerationMutation(obj);
        }
        double v6 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v7 = [v6 unsignedIntegerValue];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __68__PGGuessWhoRelationshipMetricEvent_gatherMetricsWithProgressBlock___block_invoke_2;
        v16[3] = &unk_1E68E9A88;
        unint64_t v25 = &v32;
        uint64_t v26 = v7;
        unsigned int v20 = &v52;
        uint64_t v21 = &v48;
        unsigned int v22 = &v44;
        uint64_t v23 = &v40;
        uint64_t v24 = &v36;
        char v27 = v2;
        id v8 = v14;
        uint64_t v9 = *(void *)(a1 + 32);
        id v17 = v8;
        uint64_t v18 = v9;
        BOOL v19 = v6;
        [v8 enumeratePersonNodesWithRelationship:v7 matchingQuery:2 usingBlock:v16];
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v28 objects:v56 count:16];
    }
    while (v3);
  }

  [*(id *)(a1 + 32) setNumberOfInferredFamilyMembers:v53[3]];
  [*(id *)(a1 + 32) setNumberOfInferredFriends:v49[3]];
  [*(id *)(a1 + 32) setNumberOfInferredParents:v45[3]];
  [*(id *)(a1 + 32) setNumberOfInferredCoworkers:v41[3]];
  [*(id *)(a1 + 32) setNumberOfInferredPartners:v37[3]];
  [*(id *)(a1 + 32) setNumberOfInferredChildren:v33[3]];

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v52, 8);
}

void __68__PGGuessWhoRelationshipMetricEvent_gatherMetricsWithProgressBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  switch(*(void *)(a1 + 104))
  {
    case 1:
      uint64_t v7 = a1 + 80;
      goto LABEL_8;
    case 2:
      uint64_t v7 = a1 + 64;
      goto LABEL_8;
    case 4:
      uint64_t v7 = a1 + 56;
      goto LABEL_8;
    case 5:
      uint64_t v7 = a1 + 96;
      goto LABEL_8;
    case 8:
      uint64_t v7 = a1 + 72;
      goto LABEL_8;
    case 0xDLL:
      uint64_t v7 = a1 + 88;
LABEL_8:
      ++*(void *)(*(void *)(*(void *)v7 + 8) + 24);
      break;
    default:
      break;
  }
  if (*(unsigned char *)(a1 + 112))
  {
    id v8 = [*(id *)(a1 + 32) relationshipEdgesToPersonNode:v5 matchingQuery:1];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      char v11 = 0;
      uint64_t v12 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v8);
          }
          unsigned int v14 = *(void **)(a1 + 40);
          uint64_t v15 = [*(id *)(*((void *)&v17 + 1) + 8 * i) label];
          uint64_t v16 = [v14 _relationshipKeyForLabel:v15];
          LOBYTE(v14) = v16 == *(void **)(a1 + 48);

          v11 |= v14;
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }
    else
    {
      char v11 = 0;
    }
    [*(id *)(a1 + 40) _incrementRelationshipSignalMetricsForRelationshipEdge:v6 inferredRelationshipCorrect:v11 & 1];
  }
}

- (id)payload
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v4 = [NSNumber numberWithUnsignedInteger:self->_numberOfPeople];
  [v3 setObject:v4 forKeyedSubscript:@"people_count"];

  id v5 = [NSNumber numberWithUnsignedInteger:self->_numberOfInferredFamilyMembers];
  [v3 setObject:v5 forKeyedSubscript:@"inferred_family_members_count"];

  id v6 = [NSNumber numberWithUnsignedInteger:self->_numberOfInferredFriends];
  [v3 setObject:v6 forKeyedSubscript:@"inferred_friends_count"];

  uint64_t v7 = [NSNumber numberWithUnsignedInteger:self->_numberOfInferredParents];
  [v3 setObject:v7 forKeyedSubscript:@"inferred_parents_count"];

  id v8 = [NSNumber numberWithUnsignedInteger:self->_numberOfInferredCoworkers];
  [v3 setObject:v8 forKeyedSubscript:@"inferred_coworkers_count"];

  uint64_t v9 = [NSNumber numberWithUnsignedInteger:self->_numberOfInferredPartners];
  [v3 setObject:v9 forKeyedSubscript:@"inferred_partners_count"];

  uint64_t v10 = [NSNumber numberWithUnsignedInteger:self->_numberOfInferredChildren];
  [v3 setObject:v10 forKeyedSubscript:@"inferred_children_count"];

  char v11 = [NSNumber numberWithUnsignedInteger:self->_numberOfFamilyHolidaySignalRegistrations];
  [v3 setObject:v11 forKeyedSubscript:@"family_holiday_signal_count"];

  uint64_t v12 = [NSNumber numberWithUnsignedInteger:self->_numberOfParentContactNameSignalRegistrations];
  [v3 setObject:v12 forKeyedSubscript:@"parent_contact_name_signal_count"];

  __int16 v13 = [NSNumber numberWithUnsignedInteger:self->_numberOfSameFamilyNameSignalRegistrations];
  [v3 setObject:v13 forKeyedSubscript:@"same_family_name_signal_count"];

  unsigned int v14 = [NSNumber numberWithUnsignedInteger:self->_numberOfHomeMomentsSignalRegistrations];
  [v3 setObject:v14 forKeyedSubscript:@"home_moments_signal_count"];

  uint64_t v15 = [NSNumber numberWithUnsignedInteger:self->_numberOfAnniversaryDateSignalRegistrations];
  [v3 setObject:v15 forKeyedSubscript:@"anniversary_date_signal_count"];

  uint64_t v16 = [NSNumber numberWithUnsignedInteger:self->_numberOfTopTwoPersonSocialGroupSignalRegistrations];
  [v3 setObject:v16 forKeyedSubscript:@"top_two_person_sg_signal_count"];

  long long v17 = [NSNumber numberWithUnsignedInteger:self->_numberOfLoveEmojisSignalRegistrations];
  [v3 setObject:v17 forKeyedSubscript:@"love_emojis_signal_count"];

  long long v18 = [NSNumber numberWithUnsignedInteger:self->_numberOfTopPersonSignalRegistrations];
  [v3 setObject:v18 forKeyedSubscript:@"top_person_signal_count"];

  long long v19 = [NSNumber numberWithUnsignedInteger:self->_numberOfFriendNightOutSignalRegistrations];
  [v3 setObject:v19 forKeyedSubscript:@"friend_night_out_signal_count"];

  long long v20 = [NSNumber numberWithUnsignedInteger:self->_numberOfPartnerTripSignalRegistrations];
  [v3 setObject:v20 forKeyedSubscript:@"partner_trip_signal_count"];

  uint64_t v21 = [NSNumber numberWithUnsignedInteger:self->_numberOfFriendsFamilyTripSignalRegistrations];
  [v3 setObject:v21 forKeyedSubscript:@"friends_family_trip_signal_count"];

  uint64_t v22 = [NSNumber numberWithUnsignedInteger:self->_numberOfWeekendSignalRegistrations];
  [v3 setObject:v22 forKeyedSubscript:@"weekend_signal_count"];

  uint64_t v23 = [NSNumber numberWithUnsignedInteger:self->_numberOfCoworkersAtWorkSignalRegistrations];
  [v3 setObject:v23 forKeyedSubscript:@"coworker_work_signal_count"];

  uint64_t v24 = [NSNumber numberWithUnsignedInteger:self->_numberOfCoworkerCalendarSignalRegistrations];
  [v3 setObject:v24 forKeyedSubscript:@"coworker_calendar_signal_count"];

  unint64_t v25 = [NSNumber numberWithUnsignedInteger:self->_numberOfAgeDifferentThanMeSignalRegistrations];
  [v3 setObject:v25 forKeyedSubscript:@"age_different_signal_count"];

  uint64_t v26 = [NSNumber numberWithUnsignedInteger:self->_numberOfParentGrandparentOldSignalRegistrations];
  [v3 setObject:v26 forKeyedSubscript:@"parent_grandparent_old_signal_count"];

  char v27 = [NSNumber numberWithUnsignedInteger:self->_numberOfFamilyHolidaySignalRegistrationsInCorrectInference];
  [v3 setObject:v27 forKeyedSubscript:@"family_holiday_signal_in_correct_inference_count"];

  long long v28 = [NSNumber numberWithUnsignedInteger:self->_numberOfParentContactNameSignalRegistrationsInCorrectInference];
  [v3 setObject:v28 forKeyedSubscript:@"parent_contact_name_signal_in_correct_inference_count"];

  long long v29 = [NSNumber numberWithUnsignedInteger:self->_numberOfSameFamilyNameSignalRegistrationsInCorrectInference];
  [v3 setObject:v29 forKeyedSubscript:@"same_family_name_signal_in_correct_inference_count"];

  long long v30 = [NSNumber numberWithUnsignedInteger:self->_numberOfHomeMomentsSignalRegistrationsInCorrectInference];
  [v3 setObject:v30 forKeyedSubscript:@"home_moments_signal_in_correct_inference_count"];

  long long v31 = [NSNumber numberWithUnsignedInteger:self->_numberOfAnniversaryDateSignalRegistrationsInCorrectInference];
  [v3 setObject:v31 forKeyedSubscript:@"anniversary_date_signal_in_correct_inference_count"];

  uint64_t v32 = [NSNumber numberWithUnsignedInteger:self->_numberOfTopTwoPersonSocialGroupSignalRegistrationsInCorrectInference];
  [v3 setObject:v32 forKeyedSubscript:@"top_two_person_sg_signal_in_correct_inference_count"];

  unint64_t v33 = [NSNumber numberWithUnsignedInteger:self->_numberOfLoveEmojisSignalRegistrationsInCorrectInference];
  [v3 setObject:v33 forKeyedSubscript:@"love_emojis_signal_in_correct_inference_count"];

  uint64_t v34 = [NSNumber numberWithUnsignedInteger:self->_numberOfTopPersonSignalRegistrationsInCorrectInference];
  [v3 setObject:v34 forKeyedSubscript:@"top_person_signal_in_correct_inference_count"];

  uint64_t v35 = [NSNumber numberWithUnsignedInteger:self->_numberOfFriendNightOutSignalRegistrationsInCorrectInference];
  [v3 setObject:v35 forKeyedSubscript:@"friend_night_out_signal_in_correct_inference_count"];

  uint64_t v36 = [NSNumber numberWithUnsignedInteger:self->_numberOfPartnerTripSignalRegistrationsInCorrectInference];
  [v3 setObject:v36 forKeyedSubscript:@"partner_trip_signal_in_correct_inference_count"];

  unint64_t v37 = [NSNumber numberWithUnsignedInteger:self->_numberOfFriendsFamilyTripSignalRegistrationsInCorrectInference];
  [v3 setObject:v37 forKeyedSubscript:@"friends_family_trip_signal_in_correct_inference_count"];

  uint64_t v38 = [NSNumber numberWithUnsignedInteger:self->_numberOfWeekendSignalRegistrationsInCorrectInference];
  [v3 setObject:v38 forKeyedSubscript:@"weekend_signal_in_correct_inference_count"];

  uint64_t v39 = [NSNumber numberWithUnsignedInteger:self->_numberOfCoworkersAtWorkSignalRegistrationsInCorrectInference];
  [v3 setObject:v39 forKeyedSubscript:@"coworker_work_signal_in_correct_inference_count"];

  uint64_t v40 = [NSNumber numberWithUnsignedInteger:self->_numberOfCoworkerCalendarSignalRegistrationsInCorrectInference];
  [v3 setObject:v40 forKeyedSubscript:@"coworker_calendar_signal_in_correct_inference_count"];

  double v41 = [NSNumber numberWithUnsignedInteger:self->_numberOfAgeDifferentThanMeSignalRegistrationsInCorrectInference];
  [v3 setObject:v41 forKeyedSubscript:@"age_different_signal_in_correct_inference_count"];

  uint64_t v42 = [NSNumber numberWithUnsignedInteger:self->_numberOfParentGrandparentOldSignalRegistrationsInCorrectInference];
  [v3 setObject:v42 forKeyedSubscript:@"parent_grandparent_old_signal_in_correct_inference_count"];

  return v3;
}

- (BOOL)shouldReportMetrics
{
  return [(PGManager *)self->_manager isReady];
}

- (id)identifier
{
  return @"com.apple.Photos.Intelligence.Guesswho.Relationship";
}

- (PGGuessWhoRelationshipMetricEvent)initWithGraphManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGuessWhoRelationshipMetricEvent;
  id v6 = [(PGGuessWhoRelationshipMetricEvent *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_manager, a3);
  }

  return v7;
}

@end