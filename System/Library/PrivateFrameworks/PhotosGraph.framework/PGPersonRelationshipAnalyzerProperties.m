@interface PGPersonRelationshipAnalyzerProperties
- (BOOL)hasAnniversaryDate;
- (BOOL)hasParentContactName;
- (BOOL)hasSameFamilyNameAsMePerson;
- (BOOL)isInferredHighRecallChild;
- (BOOL)isInferredHighRecallHouseholdMember;
- (BOOL)isTopPerson;
- (BOOL)isTopTwoPersonSocialGroup;
- (BOOL)personAgeDifferentThanMeNode;
- (BOOL)personInferredToBeChild;
- (BOOL)personInferredToBeMeNodeChild;
- (BOOL)personOldEnoughToBeMeNodeParentOrGrandparent;
- (double)calendarEventAttendanceRatio;
- (double)childScore;
- (double)coworkerScore;
- (double)familyHolidayAttendanceRatio;
- (double)familyScore;
- (double)friendNightOutAttendanceRatio;
- (double)friendScore;
- (double)momentsAtWorkAppearancesRatio;
- (double)oneOnOneTripAttendanceRatio;
- (double)parentScore;
- (double)partnerScore;
- (double)ratioOfOfMomentsAtHome;
- (double)tripAttendanceRatio;
- (double)weekendAppearanceRatio;
- (id)description;
- (id)edgeProperties;
- (unint64_t)numberOfLoveEmojisExchanged;
- (unint64_t)numberOfMomentsAtHome;
- (void)penalizePersonAgeCategoryDifferentThanMeNode;
- (void)penalizePersonScoresForChild;
- (void)registerAnniversaryDate;
- (void)registerAttendance:(unint64_t)a3 amongFamilyHolidays:(unint64_t)a4;
- (void)registerAttendance:(unint64_t)a3 amongWorkCalendarEvents:(unint64_t)a4;
- (void)registerNumberOfExchangedLoveEmojis:(unint64_t)a3 amongExchangedLoveEmojis:(unint64_t)a4;
- (void)registerNumberOfMomentsAtHome:(unint64_t)a3 amongMomentsAtHome:(unint64_t)a4;
- (void)registerNumberOfMomentsAtWork:(unint64_t)a3 amongMomentsAtWork:(unint64_t)a4;
- (void)registerNumberOfNightsOut:(unint64_t)a3 amongNightsOut:(unint64_t)a4;
- (void)registerNumberOfTrips:(unint64_t)a3 withTripsScore:(double)a4 amongTrips:(unint64_t)a5;
- (void)registerNumberOfWeekendMoments:(unint64_t)a3 amongWeekends:(unint64_t)a4;
- (void)registerOneOnOneTripAppearance:(unint64_t)a3 amongOneOnOneTrips:(unint64_t)a4;
- (void)registerParentContactName;
- (void)registerPersonAsMeNodeChild;
- (void)registerPersonOldEnoughToBeMeNodeParentOrMyGrandparent;
- (void)registerSameFamilyNameAsMePerson;
- (void)registerTopPersonAmongTopPeople:(unint64_t)a3;
- (void)registerTopTwoPersonSocialGroup;
- (void)setCalendarEventAttendanceRatio:(double)a3;
- (void)setFamilyHolidayAttendanceRatio:(double)a3;
- (void)setFriendNightOutAttendanceRatio:(double)a3;
- (void)setHasAnniversaryDate:(BOOL)a3;
- (void)setHasParentContactName:(BOOL)a3;
- (void)setHasSameFamilyNameAsMePerson:(BOOL)a3;
- (void)setIsTopPerson:(BOOL)a3;
- (void)setIsTopTwoPersonSocialGroup:(BOOL)a3;
- (void)setMomentsAtWorkAppearancesRatio:(double)a3;
- (void)setNumberOfLoveEmojisExchanged:(unint64_t)a3;
- (void)setNumberOfMomentsAtHome:(unint64_t)a3;
- (void)setOneOnOneTripAttendanceRatio:(double)a3;
- (void)setPersonAgeDifferentThanMeNode:(BOOL)a3;
- (void)setPersonInferredToBeChild:(BOOL)a3;
- (void)setPersonInferredToBeMeNodeChild:(BOOL)a3;
- (void)setPersonOldEnoughToBeMeNodeParentOrGrandparent:(BOOL)a3;
- (void)setRatioOfOfMomentsAtHome:(double)a3;
- (void)setTripAttendanceRatio:(double)a3;
- (void)setWeekendAppearanceRatio:(double)a3;
@end

@implementation PGPersonRelationshipAnalyzerProperties

- (double)childScore
{
  return self->_childScore;
}

- (double)coworkerScore
{
  return self->_coworkerScore;
}

- (double)friendScore
{
  return self->_friendScore;
}

- (double)parentScore
{
  return self->_parentScore;
}

- (double)familyScore
{
  return self->_familyScore;
}

- (double)partnerScore
{
  return self->_partnerScore;
}

- (void)setPersonInferredToBeMeNodeChild:(BOOL)a3
{
  self->_personInferredToBeMeNodeChild = a3;
}

- (BOOL)personInferredToBeMeNodeChild
{
  return self->_personInferredToBeMeNodeChild;
}

- (void)setPersonOldEnoughToBeMeNodeParentOrGrandparent:(BOOL)a3
{
  self->_personOldEnoughToBeMeNodeParentOrGrandparent = a3;
}

- (BOOL)personOldEnoughToBeMeNodeParentOrGrandparent
{
  return self->_personOldEnoughToBeMeNodeParentOrGrandparent;
}

- (void)setPersonInferredToBeChild:(BOOL)a3
{
  self->_personInferredToBeChild = a3;
}

- (BOOL)personInferredToBeChild
{
  return self->_personInferredToBeChild;
}

- (void)setPersonAgeDifferentThanMeNode:(BOOL)a3
{
  self->_personAgeDifferentThanMeNode = a3;
}

- (BOOL)personAgeDifferentThanMeNode
{
  return self->_personAgeDifferentThanMeNode;
}

- (void)setMomentsAtWorkAppearancesRatio:(double)a3
{
  self->_momentsAtWorkAppearancesRatio = a3;
}

- (double)momentsAtWorkAppearancesRatio
{
  return self->_momentsAtWorkAppearancesRatio;
}

- (void)setCalendarEventAttendanceRatio:(double)a3
{
  self->_calendarEventAttendanceRatio = a3;
}

- (double)calendarEventAttendanceRatio
{
  return self->_calendarEventAttendanceRatio;
}

- (void)setWeekendAppearanceRatio:(double)a3
{
  self->_weekendAppearanceRatio = a3;
}

- (double)weekendAppearanceRatio
{
  return self->_weekendAppearanceRatio;
}

- (void)setFriendNightOutAttendanceRatio:(double)a3
{
  self->_friendNightOutAttendanceRatio = a3;
}

- (double)friendNightOutAttendanceRatio
{
  return self->_friendNightOutAttendanceRatio;
}

- (void)setIsTopPerson:(BOOL)a3
{
  self->_isTopPerson = a3;
}

- (BOOL)isTopPerson
{
  return self->_isTopPerson;
}

- (void)setNumberOfLoveEmojisExchanged:(unint64_t)a3
{
  self->_numberOfLoveEmojisExchanged = a3;
}

- (unint64_t)numberOfLoveEmojisExchanged
{
  return self->_numberOfLoveEmojisExchanged;
}

- (void)setIsTopTwoPersonSocialGroup:(BOOL)a3
{
  self->_isTopTwoPersonSocialGroup = a3;
}

- (BOOL)isTopTwoPersonSocialGroup
{
  return self->_isTopTwoPersonSocialGroup;
}

- (void)setHasAnniversaryDate:(BOOL)a3
{
  self->_hasAnniversaryDate = a3;
}

- (BOOL)hasAnniversaryDate
{
  return self->_hasAnniversaryDate;
}

- (void)setRatioOfOfMomentsAtHome:(double)a3
{
  self->_ratioOfOfMomentsAtHome = a3;
}

- (double)ratioOfOfMomentsAtHome
{
  return self->_ratioOfOfMomentsAtHome;
}

- (void)setNumberOfMomentsAtHome:(unint64_t)a3
{
  self->_numberOfMomentsAtHome = a3;
}

- (unint64_t)numberOfMomentsAtHome
{
  return self->_numberOfMomentsAtHome;
}

- (void)setHasSameFamilyNameAsMePerson:(BOOL)a3
{
  self->_hasSameFamilyNameAsMePerson = a3;
}

- (BOOL)hasSameFamilyNameAsMePerson
{
  return self->_hasSameFamilyNameAsMePerson;
}

- (void)setHasParentContactName:(BOOL)a3
{
  self->_hasParentContactName = a3;
}

- (BOOL)hasParentContactName
{
  return self->_hasParentContactName;
}

- (void)setFamilyHolidayAttendanceRatio:(double)a3
{
  self->_familyHolidayAttendanceRatio = a3;
}

- (double)familyHolidayAttendanceRatio
{
  return self->_familyHolidayAttendanceRatio;
}

- (void)setTripAttendanceRatio:(double)a3
{
  self->_tripAttendanceRatio = a3;
}

- (double)tripAttendanceRatio
{
  return self->_tripAttendanceRatio;
}

- (void)setOneOnOneTripAttendanceRatio:(double)a3
{
  self->_oneOnOneTripAttendanceRatio = a3;
}

- (double)oneOnOneTripAttendanceRatio
{
  return self->_oneOnOneTripAttendanceRatio;
}

- (id)edgeProperties
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_familyHolidayAttendanceRatio > 0.0)
  {
    v4 = objc_msgSend(NSNumber, "numberWithDouble:");
    [v3 setObject:v4 forKeyedSubscript:@"rfamhol"];
  }
  if (self->_hasParentContactName)
  {
    v5 = [NSNumber numberWithBool:1];
    [v3 setObject:v5 forKeyedSubscript:@"rparnam"];
  }
  if (self->_hasSameFamilyNameAsMePerson)
  {
    v6 = [NSNumber numberWithBool:1];
    [v3 setObject:v6 forKeyedSubscript:@"rfamnam"];
  }
  if (self->_numberOfMomentsAtHome)
  {
    v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    [v3 setObject:v7 forKeyedSubscript:@"gwnummmtshome"];
  }
  if (self->_hasAnniversaryDate)
  {
    v8 = [NSNumber numberWithBool:1];
    [v3 setObject:v8 forKeyedSubscript:@"rhasanniv"];
  }
  if (self->_isTopTwoPersonSocialGroup)
  {
    v9 = [NSNumber numberWithBool:1];
    [v3 setObject:v9 forKeyedSubscript:@"rtop2sg"];
  }
  if (self->_numberOfLoveEmojisExchanged)
  {
    v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    [v3 setObject:v10 forKeyedSubscript:@"rlovexch"];
  }
  if (self->_isTopPerson)
  {
    v11 = [NSNumber numberWithBool:1];
    [v3 setObject:v11 forKeyedSubscript:@"rtop"];
  }
  if (self->_friendNightOutAttendanceRatio > 0.0)
  {
    v12 = objc_msgSend(NSNumber, "numberWithDouble:");
    [v3 setObject:v12 forKeyedSubscript:@"rfrndnghtout"];
  }
  if (self->_oneOnOneTripAttendanceRatio > 0.0)
  {
    v13 = objc_msgSend(NSNumber, "numberWithDouble:");
    [v3 setObject:v13 forKeyedSubscript:@"rprtnrtrip"];
  }
  if (self->_tripAttendanceRatio > 0.0)
  {
    v14 = objc_msgSend(NSNumber, "numberWithDouble:");
    [v3 setObject:v14 forKeyedSubscript:@"rfrfamtrip"];
  }
  if (self->_weekendAppearanceRatio > 0.0)
  {
    v15 = objc_msgSend(NSNumber, "numberWithDouble:");
    [v3 setObject:v15 forKeyedSubscript:@"rwkend"];
  }
  if (self->_momentsAtWorkAppearancesRatio > 0.0)
  {
    v16 = objc_msgSend(NSNumber, "numberWithDouble:");
    [v3 setObject:v16 forKeyedSubscript:@"rwork"];
  }
  if (self->_calendarEventAttendanceRatio > 0.0)
  {
    v17 = objc_msgSend(NSNumber, "numberWithDouble:");
    [v3 setObject:v17 forKeyedSubscript:@"rcal"];
  }
  if (self->_personAgeDifferentThanMeNode)
  {
    v18 = [NSNumber numberWithBool:1];
    [v3 setObject:v18 forKeyedSubscript:@"ragediff"];
  }
  if (self->_personOldEnoughToBeMeNodeParentOrGrandparent)
  {
    v19 = [NSNumber numberWithBool:1];
    [v3 setObject:v19 forKeyedSubscript:@"rold"];
  }
  if (self->_personInferredToBeMeNodeChild)
  {
    v20 = [NSNumber numberWithBool:1];
    [v3 setObject:v20 forKeyedSubscript:@"rchild"];
  }
  return v3;
}

- (id)description
{
  v2 = [(PGPersonRelationshipAnalyzerProperties *)self edgeProperties];
  v3 = [v2 description];

  return v3;
}

- (BOOL)isInferredHighRecallHouseholdMember
{
  return self->_ratioOfOfMomentsAtHome > 0.1;
}

- (BOOL)isInferredHighRecallChild
{
  return self->_personInferredToBeMeNodeChild;
}

- (void)registerPersonAsMeNodeChild
{
  if (!self->_hasParentContactName)
  {
    self->_personInferredToBeMeNodeChild = 1;
    self->_childScore = self->_childScore + 1.0;
  }
}

- (void)penalizePersonScoresForChild
{
  self->_personInferredToBeChild = 1;
  self->_partnerScore = 0.0;
  self->_coworkerScore = 0.0;
  self->_parentScore = 0.0;
}

- (void)penalizePersonAgeCategoryDifferentThanMeNode
{
  self->_personAgeDifferentThanMeNode = 1;
  self->_friendScore = self->_friendScore * 0.75;
  self->_partnerScore = self->_partnerScore * 0.75;
}

- (void)registerPersonOldEnoughToBeMeNodeParentOrMyGrandparent
{
  self->_personOldEnoughToBeMeNodeParentOrGrandparent = 1;
  self->_familyScore = self->_familyScore + 1.0;
}

- (void)registerNumberOfMomentsAtWork:(unint64_t)a3 amongMomentsAtWork:(unint64_t)a4
{
  if (a3)
  {
    if (a4)
    {
      double v4 = (double)a3 / (double)a4;
      self->_momentsAtWorkAppearancesRatio = v4;
      self->_coworkerScore = v4 + self->_coworkerScore;
    }
  }
}

- (void)registerAttendance:(unint64_t)a3 amongWorkCalendarEvents:(unint64_t)a4
{
  if (a4)
  {
    double v4 = (double)a3 / (double)a4;
    self->_calendarEventAttendanceRatio = v4;
    self->_coworkerScore = v4 + self->_coworkerScore;
  }
}

- (void)registerNumberOfWeekendMoments:(unint64_t)a3 amongWeekends:(unint64_t)a4
{
  if (a3)
  {
    if (a4)
    {
      double v4 = (double)a3 / (double)a4;
      self->_weekendAppearanceRatio = v4;
      self->_friendScore = v4 + self->_friendScore;
    }
  }
}

- (void)registerNumberOfTrips:(unint64_t)a3 withTripsScore:(double)a4 amongTrips:(unint64_t)a5
{
  if (a3)
  {
    if (a4 > 0.0 && a5 != 0)
    {
      double v6 = (double)a3 / (double)a5;
      self->_tripAttendanceRatio = v6;
      double v7 = v6 * a4;
      self->_friendScore = v7 + self->_friendScore;
      self->_familyScore = self->_familyScore + v7 * 0.25;
    }
  }
}

- (void)registerOneOnOneTripAppearance:(unint64_t)a3 amongOneOnOneTrips:(unint64_t)a4
{
  if (a3)
  {
    if (a4)
    {
      double v4 = (double)a3 / (double)a4;
      self->_oneOnOneTripAttendanceRatio = v4;
      self->_partnerScore = v4 + self->_partnerScore;
    }
  }
}

- (void)registerNumberOfNightsOut:(unint64_t)a3 amongNightsOut:(unint64_t)a4
{
  if (a3)
  {
    if (a4)
    {
      double v4 = (double)a3 / (double)a4;
      self->_friendNightOutAttendanceRatio = v4;
      self->_friendScore = v4 + self->_friendScore;
    }
  }
}

- (void)registerTopPersonAmongTopPeople:(unint64_t)a3
{
  if (a3)
  {
    self->_isTopPerson = 1;
    double v3 = 1.0 / (double)a3;
    self->_friendScore = v3 + self->_friendScore;
    self->_partnerScore = self->_partnerScore + v3 * 0.5;
  }
}

- (void)registerNumberOfExchangedLoveEmojis:(unint64_t)a3 amongExchangedLoveEmojis:(unint64_t)a4
{
  if (a3)
  {
    if (a4)
    {
      self->_numberOfLoveEmojisExchanged = a3;
      self->_partnerScore = (double)a3 / (double)a4 + self->_partnerScore;
    }
  }
}

- (void)registerTopTwoPersonSocialGroup
{
  self->_isTopTwoPersonSocialGroup = 1;
  self->_partnerScore = self->_partnerScore + 1.0;
}

- (void)registerAnniversaryDate
{
  self->_hasAnniversaryDate = 1;
  self->_partnerScore = self->_partnerScore + 1.0;
}

- (void)registerNumberOfMomentsAtHome:(unint64_t)a3 amongMomentsAtHome:(unint64_t)a4
{
  if (a3)
  {
    if (a4)
    {
      self->_numberOfMomentsAtHome = a3;
      double v4 = (double)a3 / (double)a4;
      self->_ratioOfOfMomentsAtHome = v4;
      self->_familyScore = v4 + self->_familyScore;
    }
  }
}

- (void)registerSameFamilyNameAsMePerson
{
  self->_hasSameFamilyNameAsMePerson = 1;
  self->_familyScore = self->_familyScore + 1.0;
}

- (void)registerParentContactName
{
  self->_hasParentContactName = 1;
  __asm { FMOV            V1.2D, #1.0 }
  *(float64x2_t *)&self->_familyScore = vaddq_f64(*(float64x2_t *)&self->_familyScore, _Q1);
}

- (void)registerAttendance:(unint64_t)a3 amongFamilyHolidays:(unint64_t)a4
{
  if (a3)
  {
    if (a4)
    {
      double v4 = (double)a3 / (double)a4;
      self->_familyHolidayAttendanceRatio = v4;
      self->_familyScore = v4 + self->_familyScore;
    }
  }
}

@end