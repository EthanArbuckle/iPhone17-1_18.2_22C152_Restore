@interface PGGraphStatisticsMetricEvent
- (BOOL)hasMeHomeNode;
- (BOOL)hasMeNode;
- (BOOL)hasMeWorkNode;
- (BOOL)hasMusicData;
- (BOOL)hasNamedMeNode;
- (BOOL)shouldReportMetrics;
- (PGGraphStatisticsMetricEvent)initWithGraphManager:(id)a3;
- (PGManager)manager;
- (double)averageDurationBetweenTwoSignificantEvents;
- (double)averageMusicSessionSize;
- (double)averageSocialGroupSize;
- (double)ratioOfDaysWithASignificantEventPastYear;
- (double)ratioOfFavoritedPeople;
- (double)ratioOfMeaningfulMoments;
- (double)ratioOfMomentsAtAFrequentLocation;
- (double)ratioOfMomentsAtMyHome;
- (double)ratioOfMomentsAtMyWork;
- (double)ratioOfMomentsCelebratingAHoliday;
- (double)ratioOfMomentsInTrip;
- (double)ratioOfMomentsLinkedToABusinessNode;
- (double)ratioOfMomentsLinkedToAPublicEvent;
- (double)ratioOfMomentsWithAtLeastOneGemAsset;
- (double)ratioOfPeopleLinkedToContact;
- (double)ratioOfPeopleNotLinkedToContact;
- (double)ratioOfPeopleNotLinkedToContactWithHighConfidenceContactSuggestion;
- (double)ratioOfPeoplePartOfASocialGroup;
- (double)ratioOfPeopleWithExplicitBirthdayDate;
- (double)ratioOfPeopleWithInferredBirthdayDate;
- (double)ratioOfSelfies;
- (double)ratioOfSignificantMoments;
- (double)ratioOfTwoPeopleSocialGroup;
- (id)identifier;
- (id)payload;
- (int64_t)librarySizeRange;
- (unint64_t)librarySize;
- (unint64_t)maximumMusicSessionSize;
- (unint64_t)maximumSocialGroupSize;
- (unint64_t)numberOfBusinessNodes;
- (unint64_t)numberOfCelebratedHolidays;
- (unint64_t)numberOfFrequentLocations;
- (unint64_t)numberOfFrequentLocationsCities;
- (unint64_t)numberOfFrequentLocationsCountries;
- (unint64_t)numberOfLongTrips;
- (unint64_t)numberOfMeaningfulMoments;
- (unint64_t)numberOfMeaningfulMomentsActivity;
- (unint64_t)numberOfMeaningfulMomentsActivityBeach;
- (unint64_t)numberOfMeaningfulMomentsActivityClimbing;
- (unint64_t)numberOfMeaningfulMomentsActivityDiving;
- (unint64_t)numberOfMeaningfulMomentsActivityHiking;
- (unint64_t)numberOfMeaningfulMomentsActivityWinterSport;
- (unint64_t)numberOfMeaningfulMomentsCelebration;
- (unint64_t)numberOfMeaningfulMomentsCelebrationAnniversary;
- (unint64_t)numberOfMeaningfulMomentsCelebrationBirthday;
- (unint64_t)numberOfMeaningfulMomentsCelebrationHolidayEvent;
- (unint64_t)numberOfMeaningfulMomentsCelebrationWedding;
- (unint64_t)numberOfMeaningfulMomentsEntertainment;
- (unint64_t)numberOfMeaningfulMomentsEntertainmentAmusementPark;
- (unint64_t)numberOfMeaningfulMomentsEntertainmentConcert;
- (unint64_t)numberOfMeaningfulMomentsEntertainmentDance;
- (unint64_t)numberOfMeaningfulMomentsEntertainmentFestival;
- (unint64_t)numberOfMeaningfulMomentsEntertainmentMuseum;
- (unint64_t)numberOfMeaningfulMomentsEntertainmentNightOut;
- (unint64_t)numberOfMeaningfulMomentsEntertainmentPerformance;
- (unint64_t)numberOfMeaningfulMomentsEntertainmentSportEvent;
- (unint64_t)numberOfMeaningfulMomentsEntertainmentTheater;
- (unint64_t)numberOfMeaningfulMomentsGathering;
- (unint64_t)numberOfMeaningfulMomentsRestaurant;
- (unint64_t)numberOfMeaningfulMomentsRestaurantBreakfast;
- (unint64_t)numberOfMeaningfulMomentsRestaurantDinner;
- (unint64_t)numberOfMeaningfulMomentsRestaurantLunch;
- (unint64_t)numberOfMoments;
- (unint64_t)numberOfMomentsAtMyHome;
- (unint64_t)numberOfMomentsAtMyWork;
- (unint64_t)numberOfMomentsCelebratingAHoliday;
- (unint64_t)numberOfMomentsInTrip;
- (unint64_t)numberOfMomentsLinkedToABusinessNode;
- (unint64_t)numberOfMomentsLinkedToAPublicEvent;
- (unint64_t)numberOfMomentsWithAtLeastOneGemAsset;
- (unint64_t)numberOfMusicSessions;
- (unint64_t)numberOfPeople;
- (unint64_t)numberOfPetNodes;
- (unint64_t)numberOfPublicEvents;
- (unint64_t)numberOfPublicEventsCategoryAppleEvents;
- (unint64_t)numberOfPublicEventsCategoryArtsAndMuseums;
- (unint64_t)numberOfPublicEventsCategoryBusinessAndTechnology;
- (unint64_t)numberOfPublicEventsCategoryCommunity;
- (unint64_t)numberOfPublicEventsCategoryDance;
- (unint64_t)numberOfPublicEventsCategoryEducational;
- (unint64_t)numberOfPublicEventsCategoryFamilyEvents;
- (unint64_t)numberOfPublicEventsCategoryFestivalsAndFairs;
- (unint64_t)numberOfPublicEventsCategoryMusicConcerts;
- (unint64_t)numberOfPublicEventsCategoryNightLife;
- (unint64_t)numberOfPublicEventsCategorySports;
- (unint64_t)numberOfPublicEventsCategoryTheater;
- (unint64_t)numberOfPublicEventsCategoryTours;
- (unint64_t)numberOfSelfies;
- (unint64_t)numberOfShortTrips;
- (unint64_t)numberOfSignificantMoments;
- (unint64_t)numberOfSocialGroups;
- (void)_fillBusinessStatisticsWithGraph:(id)a3 progressReporter:(id)a4;
- (void)_fillFrequentLocationsStatisticsWithGraph:(id)a3 progressReporter:(id)a4;
- (void)_fillGenericStatisticsWithGraph:(id)a3;
- (void)_fillHolidaysStatisticsWithGraph:(id)a3 progressReporter:(id)a4;
- (void)_fillHomeWorkStatisticsWithGraph:(id)a3;
- (void)_fillMeaningfulEventsStatisticsWithGraph:(id)a3 progressReporter:(id)a4;
- (void)_fillMomentStatisticsWithGraph:(id)a3 progressReporter:(id)a4;
- (void)_fillMusicStatisticsWithGraph:(id)a3 progressReporter:(id)a4;
- (void)_fillPeopleStatisticsWithGraph:(id)a3 progressReporter:(id)a4;
- (void)_fillPetStatisticsWithGraph:(id)a3;
- (void)_fillPublicEventStatisticsWithGraph:(id)a3 progressReporter:(id)a4;
- (void)_fillTripStatisticsWithGraph:(id)a3 progressReporter:(id)a4;
- (void)_saveKey:(id)a3 BOOLValue:(BOOL)a4 payload:(id)a5;
- (void)_saveKey:(id)a3 doubleValue:(double)a4 payload:(id)a5;
- (void)_saveKey:(id)a3 integerValue:(unint64_t)a4 payload:(id)a5;
- (void)_saveKey:(id)a3 stringValue:(id)a4 payload:(id)a5;
- (void)gatherMetricsWithProgressBlock:(id)a3;
- (void)setAverageDurationBetweenTwoSignificantEvents:(double)a3;
- (void)setAverageMusicSessionSize:(double)a3;
- (void)setAverageSocialGroupSize:(double)a3;
- (void)setHasMeHomeNode:(BOOL)a3;
- (void)setHasMeNode:(BOOL)a3;
- (void)setHasMeWorkNode:(BOOL)a3;
- (void)setHasMusicData:(BOOL)a3;
- (void)setHasNamedMeNode:(BOOL)a3;
- (void)setLibrarySize:(unint64_t)a3;
- (void)setLibrarySizeRange:(int64_t)a3;
- (void)setManager:(id)a3;
- (void)setMaximumMusicSessionSize:(unint64_t)a3;
- (void)setMaximumSocialGroupSize:(unint64_t)a3;
- (void)setNumberOfBusinessNodes:(unint64_t)a3;
- (void)setNumberOfCelebratedHolidays:(unint64_t)a3;
- (void)setNumberOfFrequentLocations:(unint64_t)a3;
- (void)setNumberOfFrequentLocationsCities:(unint64_t)a3;
- (void)setNumberOfFrequentLocationsCountries:(unint64_t)a3;
- (void)setNumberOfLongTrips:(unint64_t)a3;
- (void)setNumberOfMeaningfulMoments:(unint64_t)a3;
- (void)setNumberOfMeaningfulMomentsActivity:(unint64_t)a3;
- (void)setNumberOfMeaningfulMomentsActivityBeach:(unint64_t)a3;
- (void)setNumberOfMeaningfulMomentsActivityClimbing:(unint64_t)a3;
- (void)setNumberOfMeaningfulMomentsActivityDiving:(unint64_t)a3;
- (void)setNumberOfMeaningfulMomentsActivityHiking:(unint64_t)a3;
- (void)setNumberOfMeaningfulMomentsActivityWinterSport:(unint64_t)a3;
- (void)setNumberOfMeaningfulMomentsCelebration:(unint64_t)a3;
- (void)setNumberOfMeaningfulMomentsCelebrationAnniversary:(unint64_t)a3;
- (void)setNumberOfMeaningfulMomentsCelebrationBirthday:(unint64_t)a3;
- (void)setNumberOfMeaningfulMomentsCelebrationHolidayEvent:(unint64_t)a3;
- (void)setNumberOfMeaningfulMomentsCelebrationWedding:(unint64_t)a3;
- (void)setNumberOfMeaningfulMomentsEntertainment:(unint64_t)a3;
- (void)setNumberOfMeaningfulMomentsEntertainmentAmusementPark:(unint64_t)a3;
- (void)setNumberOfMeaningfulMomentsEntertainmentConcert:(unint64_t)a3;
- (void)setNumberOfMeaningfulMomentsEntertainmentDance:(unint64_t)a3;
- (void)setNumberOfMeaningfulMomentsEntertainmentFestival:(unint64_t)a3;
- (void)setNumberOfMeaningfulMomentsEntertainmentMuseum:(unint64_t)a3;
- (void)setNumberOfMeaningfulMomentsEntertainmentNightOut:(unint64_t)a3;
- (void)setNumberOfMeaningfulMomentsEntertainmentPerformance:(unint64_t)a3;
- (void)setNumberOfMeaningfulMomentsEntertainmentSportEvent:(unint64_t)a3;
- (void)setNumberOfMeaningfulMomentsEntertainmentTheater:(unint64_t)a3;
- (void)setNumberOfMeaningfulMomentsGathering:(unint64_t)a3;
- (void)setNumberOfMeaningfulMomentsRestaurant:(unint64_t)a3;
- (void)setNumberOfMeaningfulMomentsRestaurantBreakfast:(unint64_t)a3;
- (void)setNumberOfMeaningfulMomentsRestaurantDinner:(unint64_t)a3;
- (void)setNumberOfMeaningfulMomentsRestaurantLunch:(unint64_t)a3;
- (void)setNumberOfMoments:(unint64_t)a3;
- (void)setNumberOfMomentsAtMyHome:(unint64_t)a3;
- (void)setNumberOfMomentsAtMyWork:(unint64_t)a3;
- (void)setNumberOfMomentsCelebratingAHoliday:(unint64_t)a3;
- (void)setNumberOfMomentsInTrip:(unint64_t)a3;
- (void)setNumberOfMomentsLinkedToABusinessNode:(unint64_t)a3;
- (void)setNumberOfMomentsLinkedToAPublicEvent:(unint64_t)a3;
- (void)setNumberOfMomentsWithAtLeastOneGemAsset:(unint64_t)a3;
- (void)setNumberOfMusicSessions:(unint64_t)a3;
- (void)setNumberOfPeople:(unint64_t)a3;
- (void)setNumberOfPetNodes:(unint64_t)a3;
- (void)setNumberOfPublicEvents:(unint64_t)a3;
- (void)setNumberOfPublicEventsCategoryAppleEvents:(unint64_t)a3;
- (void)setNumberOfPublicEventsCategoryArtsAndMuseums:(unint64_t)a3;
- (void)setNumberOfPublicEventsCategoryBusinessAndTechnology:(unint64_t)a3;
- (void)setNumberOfPublicEventsCategoryCommunity:(unint64_t)a3;
- (void)setNumberOfPublicEventsCategoryDance:(unint64_t)a3;
- (void)setNumberOfPublicEventsCategoryEducational:(unint64_t)a3;
- (void)setNumberOfPublicEventsCategoryFamilyEvents:(unint64_t)a3;
- (void)setNumberOfPublicEventsCategoryFestivalsAndFairs:(unint64_t)a3;
- (void)setNumberOfPublicEventsCategoryMusicConcerts:(unint64_t)a3;
- (void)setNumberOfPublicEventsCategoryNightLife:(unint64_t)a3;
- (void)setNumberOfPublicEventsCategorySports:(unint64_t)a3;
- (void)setNumberOfPublicEventsCategoryTheater:(unint64_t)a3;
- (void)setNumberOfPublicEventsCategoryTours:(unint64_t)a3;
- (void)setNumberOfSelfies:(unint64_t)a3;
- (void)setNumberOfShortTrips:(unint64_t)a3;
- (void)setNumberOfSignificantMoments:(unint64_t)a3;
- (void)setNumberOfSocialGroups:(unint64_t)a3;
- (void)setRatioOfDaysWithASignificantEventPastYear:(double)a3;
- (void)setRatioOfFavoritedPeople:(double)a3;
- (void)setRatioOfMeaningfulMoments:(double)a3;
- (void)setRatioOfMomentsAtAFrequentLocation:(double)a3;
- (void)setRatioOfMomentsAtMyHome:(double)a3;
- (void)setRatioOfMomentsAtMyWork:(double)a3;
- (void)setRatioOfMomentsCelebratingAHoliday:(double)a3;
- (void)setRatioOfMomentsInTrip:(double)a3;
- (void)setRatioOfMomentsLinkedToABusinessNode:(double)a3;
- (void)setRatioOfMomentsLinkedToAPublicEvent:(double)a3;
- (void)setRatioOfMomentsWithAtLeastOneGemAsset:(double)a3;
- (void)setRatioOfPeopleLinkedToContact:(double)a3;
- (void)setRatioOfPeopleNotLinkedToContact:(double)a3;
- (void)setRatioOfPeopleNotLinkedToContactWithHighConfidenceContactSuggestion:(double)a3;
- (void)setRatioOfPeoplePartOfASocialGroup:(double)a3;
- (void)setRatioOfPeopleWithExplicitBirthdayDate:(double)a3;
- (void)setRatioOfPeopleWithInferredBirthdayDate:(double)a3;
- (void)setRatioOfSelfies:(double)a3;
- (void)setRatioOfSignificantMoments:(double)a3;
- (void)setRatioOfTwoPeopleSocialGroup:(double)a3;
@end

@implementation PGGraphStatisticsMetricEvent

- (void).cxx_destruct
{
}

- (void)setRatioOfSelfies:(double)a3
{
  self->_ratioOfSelfies = a3;
}

- (double)ratioOfSelfies
{
  return self->_ratioOfSelfies;
}

- (void)setNumberOfSelfies:(unint64_t)a3
{
  self->_numberOfSelfies = a3;
}

- (unint64_t)numberOfSelfies
{
  return self->_numberOfSelfies;
}

- (void)setRatioOfMomentsWithAtLeastOneGemAsset:(double)a3
{
  self->_ratioOfMomentsWithAtLeastOneGemAsset = a3;
}

- (double)ratioOfMomentsWithAtLeastOneGemAsset
{
  return self->_ratioOfMomentsWithAtLeastOneGemAsset;
}

- (void)setNumberOfMomentsWithAtLeastOneGemAsset:(unint64_t)a3
{
  self->_numberOfMomentsWithAtLeastOneGemAsset = a3;
}

- (unint64_t)numberOfMomentsWithAtLeastOneGemAsset
{
  return self->_numberOfMomentsWithAtLeastOneGemAsset;
}

- (void)setRatioOfMomentsInTrip:(double)a3
{
  self->_ratioOfMomentsInTrip = a3;
}

- (double)ratioOfMomentsInTrip
{
  return self->_ratioOfMomentsInTrip;
}

- (void)setNumberOfMomentsInTrip:(unint64_t)a3
{
  self->_numberOfMomentsInTrip = a3;
}

- (unint64_t)numberOfMomentsInTrip
{
  return self->_numberOfMomentsInTrip;
}

- (void)setNumberOfLongTrips:(unint64_t)a3
{
  self->_numberOfLongTrips = a3;
}

- (unint64_t)numberOfLongTrips
{
  return self->_numberOfLongTrips;
}

- (void)setNumberOfShortTrips:(unint64_t)a3
{
  self->_numberOfShortTrips = a3;
}

- (unint64_t)numberOfShortTrips
{
  return self->_numberOfShortTrips;
}

- (void)setRatioOfMomentsCelebratingAHoliday:(double)a3
{
  self->_ratioOfMomentsCelebratingAHoliday = a3;
}

- (double)ratioOfMomentsCelebratingAHoliday
{
  return self->_ratioOfMomentsCelebratingAHoliday;
}

- (void)setNumberOfMomentsCelebratingAHoliday:(unint64_t)a3
{
  self->_numberOfMomentsCelebratingAHoliday = a3;
}

- (unint64_t)numberOfMomentsCelebratingAHoliday
{
  return self->_numberOfMomentsCelebratingAHoliday;
}

- (void)setNumberOfCelebratedHolidays:(unint64_t)a3
{
  self->_numberOfCelebratedHolidays = a3;
}

- (unint64_t)numberOfCelebratedHolidays
{
  return self->_numberOfCelebratedHolidays;
}

- (void)setNumberOfPetNodes:(unint64_t)a3
{
  self->_numberOfPetNodes = a3;
}

- (unint64_t)numberOfPetNodes
{
  return self->_numberOfPetNodes;
}

- (void)setNumberOfFrequentLocationsCountries:(unint64_t)a3
{
  self->_numberOfFrequentLocationsCountries = a3;
}

- (unint64_t)numberOfFrequentLocationsCountries
{
  return self->_numberOfFrequentLocationsCountries;
}

- (void)setNumberOfFrequentLocationsCities:(unint64_t)a3
{
  self->_numberOfFrequentLocationsCities = a3;
}

- (unint64_t)numberOfFrequentLocationsCities
{
  return self->_numberOfFrequentLocationsCities;
}

- (void)setNumberOfFrequentLocations:(unint64_t)a3
{
  self->_numberOfFrequentLocations = a3;
}

- (unint64_t)numberOfFrequentLocations
{
  return self->_numberOfFrequentLocations;
}

- (void)setRatioOfMomentsAtAFrequentLocation:(double)a3
{
  self->_ratioOfMomentsAtAFrequentLocation = a3;
}

- (double)ratioOfMomentsAtAFrequentLocation
{
  return self->_ratioOfMomentsAtAFrequentLocation;
}

- (void)setRatioOfMomentsAtMyWork:(double)a3
{
  self->_ratioOfMomentsAtMyWork = a3;
}

- (double)ratioOfMomentsAtMyWork
{
  return self->_ratioOfMomentsAtMyWork;
}

- (void)setRatioOfMomentsAtMyHome:(double)a3
{
  self->_ratioOfMomentsAtMyHome = a3;
}

- (double)ratioOfMomentsAtMyHome
{
  return self->_ratioOfMomentsAtMyHome;
}

- (void)setNumberOfMomentsAtMyWork:(unint64_t)a3
{
  self->_numberOfMomentsAtMyWork = a3;
}

- (unint64_t)numberOfMomentsAtMyWork
{
  return self->_numberOfMomentsAtMyWork;
}

- (void)setNumberOfMomentsAtMyHome:(unint64_t)a3
{
  self->_numberOfMomentsAtMyHome = a3;
}

- (unint64_t)numberOfMomentsAtMyHome
{
  return self->_numberOfMomentsAtMyHome;
}

- (void)setHasMeWorkNode:(BOOL)a3
{
  self->_hasMeWorkNode = a3;
}

- (BOOL)hasMeWorkNode
{
  return self->_hasMeWorkNode;
}

- (void)setHasMeHomeNode:(BOOL)a3
{
  self->_hasMeHomeNode = a3;
}

- (BOOL)hasMeHomeNode
{
  return self->_hasMeHomeNode;
}

- (void)setAverageMusicSessionSize:(double)a3
{
  self->_averageMusicSessionSize = a3;
}

- (double)averageMusicSessionSize
{
  return self->_averageMusicSessionSize;
}

- (void)setMaximumMusicSessionSize:(unint64_t)a3
{
  self->_maximumMusicSessionSize = a3;
}

- (unint64_t)maximumMusicSessionSize
{
  return self->_maximumMusicSessionSize;
}

- (void)setNumberOfMusicSessions:(unint64_t)a3
{
  self->_numberOfMusicSessions = a3;
}

- (unint64_t)numberOfMusicSessions
{
  return self->_numberOfMusicSessions;
}

- (void)setHasMusicData:(BOOL)a3
{
  self->_hasMusicData = a3;
}

- (BOOL)hasMusicData
{
  return self->_hasMusicData;
}

- (void)setAverageSocialGroupSize:(double)a3
{
  self->_averageSocialGroupSize = a3;
}

- (double)averageSocialGroupSize
{
  return self->_averageSocialGroupSize;
}

- (void)setMaximumSocialGroupSize:(unint64_t)a3
{
  self->_maximumSocialGroupSize = a3;
}

- (unint64_t)maximumSocialGroupSize
{
  return self->_maximumSocialGroupSize;
}

- (void)setRatioOfTwoPeopleSocialGroup:(double)a3
{
  self->_ratioOfTwoPeopleSocialGroup = a3;
}

- (double)ratioOfTwoPeopleSocialGroup
{
  return self->_ratioOfTwoPeopleSocialGroup;
}

- (void)setRatioOfPeoplePartOfASocialGroup:(double)a3
{
  self->_ratioOfPeoplePartOfASocialGroup = a3;
}

- (double)ratioOfPeoplePartOfASocialGroup
{
  return self->_ratioOfPeoplePartOfASocialGroup;
}

- (void)setNumberOfSocialGroups:(unint64_t)a3
{
  self->_numberOfSocialGroups = a3;
}

- (unint64_t)numberOfSocialGroups
{
  return self->_numberOfSocialGroups;
}

- (void)setRatioOfPeopleWithInferredBirthdayDate:(double)a3
{
  self->_ratioOfPeopleWithInferredBirthdayDate = a3;
}

- (double)ratioOfPeopleWithInferredBirthdayDate
{
  return self->_ratioOfPeopleWithInferredBirthdayDate;
}

- (void)setRatioOfPeopleWithExplicitBirthdayDate:(double)a3
{
  self->_ratioOfPeopleWithExplicitBirthdayDate = a3;
}

- (double)ratioOfPeopleWithExplicitBirthdayDate
{
  return self->_ratioOfPeopleWithExplicitBirthdayDate;
}

- (void)setRatioOfFavoritedPeople:(double)a3
{
  self->_ratioOfFavoritedPeople = a3;
}

- (double)ratioOfFavoritedPeople
{
  return self->_ratioOfFavoritedPeople;
}

- (void)setRatioOfPeopleNotLinkedToContactWithHighConfidenceContactSuggestion:(double)a3
{
  self->_ratioOfPeopleNotLinkedToContactWithHighConfidenceContactSuggestion = a3;
}

- (double)ratioOfPeopleNotLinkedToContactWithHighConfidenceContactSuggestion
{
  return self->_ratioOfPeopleNotLinkedToContactWithHighConfidenceContactSuggestion;
}

- (void)setRatioOfPeopleNotLinkedToContact:(double)a3
{
  self->_ratioOfPeopleNotLinkedToContact = a3;
}

- (double)ratioOfPeopleNotLinkedToContact
{
  return self->_ratioOfPeopleNotLinkedToContact;
}

- (void)setRatioOfPeopleLinkedToContact:(double)a3
{
  self->_ratioOfPeopleLinkedToContact = a3;
}

- (double)ratioOfPeopleLinkedToContact
{
  return self->_ratioOfPeopleLinkedToContact;
}

- (void)setNumberOfPeople:(unint64_t)a3
{
  self->_numberOfPeople = a3;
}

- (unint64_t)numberOfPeople
{
  return self->_numberOfPeople;
}

- (void)setHasNamedMeNode:(BOOL)a3
{
  self->_hasNamedMeNode = a3;
}

- (BOOL)hasNamedMeNode
{
  return self->_hasNamedMeNode;
}

- (void)setHasMeNode:(BOOL)a3
{
  self->_hasMeNode = a3;
}

- (BOOL)hasMeNode
{
  return self->_hasMeNode;
}

- (void)setAverageDurationBetweenTwoSignificantEvents:(double)a3
{
  self->_averageDurationBetweenTwoSignificantEvents = a3;
}

- (double)averageDurationBetweenTwoSignificantEvents
{
  return self->_averageDurationBetweenTwoSignificantEvents;
}

- (void)setRatioOfDaysWithASignificantEventPastYear:(double)a3
{
  self->_ratioOfDaysWithASignificantEventPastYear = a3;
}

- (double)ratioOfDaysWithASignificantEventPastYear
{
  return self->_ratioOfDaysWithASignificantEventPastYear;
}

- (void)setRatioOfSignificantMoments:(double)a3
{
  self->_ratioOfSignificantMoments = a3;
}

- (double)ratioOfSignificantMoments
{
  return self->_ratioOfSignificantMoments;
}

- (void)setNumberOfSignificantMoments:(unint64_t)a3
{
  self->_numberOfSignificantMoments = a3;
}

- (unint64_t)numberOfSignificantMoments
{
  return self->_numberOfSignificantMoments;
}

- (void)setRatioOfMomentsLinkedToAPublicEvent:(double)a3
{
  self->_ratioOfMomentsLinkedToAPublicEvent = a3;
}

- (double)ratioOfMomentsLinkedToAPublicEvent
{
  return self->_ratioOfMomentsLinkedToAPublicEvent;
}

- (void)setNumberOfMomentsLinkedToAPublicEvent:(unint64_t)a3
{
  self->_numberOfMomentsLinkedToAPublicEvent = a3;
}

- (unint64_t)numberOfMomentsLinkedToAPublicEvent
{
  return self->_numberOfMomentsLinkedToAPublicEvent;
}

- (void)setNumberOfPublicEventsCategoryAppleEvents:(unint64_t)a3
{
  self->_numberOfPublicEventsCategoryAppleEvents = a3;
}

- (unint64_t)numberOfPublicEventsCategoryAppleEvents
{
  return self->_numberOfPublicEventsCategoryAppleEvents;
}

- (void)setNumberOfPublicEventsCategoryTours:(unint64_t)a3
{
  self->_numberOfPublicEventsCategoryTours = a3;
}

- (unint64_t)numberOfPublicEventsCategoryTours
{
  return self->_numberOfPublicEventsCategoryTours;
}

- (void)setNumberOfPublicEventsCategoryFamilyEvents:(unint64_t)a3
{
  self->_numberOfPublicEventsCategoryFamilyEvents = a3;
}

- (unint64_t)numberOfPublicEventsCategoryFamilyEvents
{
  return self->_numberOfPublicEventsCategoryFamilyEvents;
}

- (void)setNumberOfPublicEventsCategoryEducational:(unint64_t)a3
{
  self->_numberOfPublicEventsCategoryEducational = a3;
}

- (unint64_t)numberOfPublicEventsCategoryEducational
{
  return self->_numberOfPublicEventsCategoryEducational;
}

- (void)setNumberOfPublicEventsCategoryCommunity:(unint64_t)a3
{
  self->_numberOfPublicEventsCategoryCommunity = a3;
}

- (unint64_t)numberOfPublicEventsCategoryCommunity
{
  return self->_numberOfPublicEventsCategoryCommunity;
}

- (void)setNumberOfPublicEventsCategoryBusinessAndTechnology:(unint64_t)a3
{
  self->_numberOfPublicEventsCategoryBusinessAndTechnology = a3;
}

- (unint64_t)numberOfPublicEventsCategoryBusinessAndTechnology
{
  return self->_numberOfPublicEventsCategoryBusinessAndTechnology;
}

- (void)setNumberOfPublicEventsCategorySports:(unint64_t)a3
{
  self->_numberOfPublicEventsCategorySports = a3;
}

- (unint64_t)numberOfPublicEventsCategorySports
{
  return self->_numberOfPublicEventsCategorySports;
}

- (void)setNumberOfPublicEventsCategoryArtsAndMuseums:(unint64_t)a3
{
  self->_numberOfPublicEventsCategoryArtsAndMuseums = a3;
}

- (unint64_t)numberOfPublicEventsCategoryArtsAndMuseums
{
  return self->_numberOfPublicEventsCategoryArtsAndMuseums;
}

- (void)setNumberOfPublicEventsCategoryFestivalsAndFairs:(unint64_t)a3
{
  self->_numberOfPublicEventsCategoryFestivalsAndFairs = a3;
}

- (unint64_t)numberOfPublicEventsCategoryFestivalsAndFairs
{
  return self->_numberOfPublicEventsCategoryFestivalsAndFairs;
}

- (void)setNumberOfPublicEventsCategoryDance:(unint64_t)a3
{
  self->_numberOfPublicEventsCategoryDance = a3;
}

- (unint64_t)numberOfPublicEventsCategoryDance
{
  return self->_numberOfPublicEventsCategoryDance;
}

- (void)setNumberOfPublicEventsCategoryTheater:(unint64_t)a3
{
  self->_numberOfPublicEventsCategoryTheater = a3;
}

- (unint64_t)numberOfPublicEventsCategoryTheater
{
  return self->_numberOfPublicEventsCategoryTheater;
}

- (void)setNumberOfPublicEventsCategoryNightLife:(unint64_t)a3
{
  self->_numberOfPublicEventsCategoryNightLife = a3;
}

- (unint64_t)numberOfPublicEventsCategoryNightLife
{
  return self->_numberOfPublicEventsCategoryNightLife;
}

- (void)setNumberOfPublicEventsCategoryMusicConcerts:(unint64_t)a3
{
  self->_numberOfPublicEventsCategoryMusicConcerts = a3;
}

- (unint64_t)numberOfPublicEventsCategoryMusicConcerts
{
  return self->_numberOfPublicEventsCategoryMusicConcerts;
}

- (void)setNumberOfPublicEvents:(unint64_t)a3
{
  self->_numberOfPublicEvents = a3;
}

- (unint64_t)numberOfPublicEvents
{
  return self->_numberOfPublicEvents;
}

- (void)setNumberOfMeaningfulMomentsRestaurantDinner:(unint64_t)a3
{
  self->_numberOfMeaningfulMomentsRestaurantDinner = a3;
}

- (unint64_t)numberOfMeaningfulMomentsRestaurantDinner
{
  return self->_numberOfMeaningfulMomentsRestaurantDinner;
}

- (void)setNumberOfMeaningfulMomentsRestaurantLunch:(unint64_t)a3
{
  self->_numberOfMeaningfulMomentsRestaurantLunch = a3;
}

- (unint64_t)numberOfMeaningfulMomentsRestaurantLunch
{
  return self->_numberOfMeaningfulMomentsRestaurantLunch;
}

- (void)setNumberOfMeaningfulMomentsRestaurantBreakfast:(unint64_t)a3
{
  self->_numberOfMeaningfulMomentsRestaurantBreakfast = a3;
}

- (unint64_t)numberOfMeaningfulMomentsRestaurantBreakfast
{
  return self->_numberOfMeaningfulMomentsRestaurantBreakfast;
}

- (void)setNumberOfMeaningfulMomentsRestaurant:(unint64_t)a3
{
  self->_numberOfMeaningfulMomentsRestaurant = a3;
}

- (unint64_t)numberOfMeaningfulMomentsRestaurant
{
  return self->_numberOfMeaningfulMomentsRestaurant;
}

- (void)setNumberOfMeaningfulMomentsCelebrationWedding:(unint64_t)a3
{
  self->_numberOfMeaningfulMomentsCelebrationWedding = a3;
}

- (unint64_t)numberOfMeaningfulMomentsCelebrationWedding
{
  return self->_numberOfMeaningfulMomentsCelebrationWedding;
}

- (void)setNumberOfMeaningfulMomentsCelebrationHolidayEvent:(unint64_t)a3
{
  self->_numberOfMeaningfulMomentsCelebrationHolidayEvent = a3;
}

- (unint64_t)numberOfMeaningfulMomentsCelebrationHolidayEvent
{
  return self->_numberOfMeaningfulMomentsCelebrationHolidayEvent;
}

- (void)setNumberOfMeaningfulMomentsCelebrationBirthday:(unint64_t)a3
{
  self->_numberOfMeaningfulMomentsCelebrationBirthday = a3;
}

- (unint64_t)numberOfMeaningfulMomentsCelebrationBirthday
{
  return self->_numberOfMeaningfulMomentsCelebrationBirthday;
}

- (void)setNumberOfMeaningfulMomentsCelebrationAnniversary:(unint64_t)a3
{
  self->_numberOfMeaningfulMomentsCelebrationAnniversary = a3;
}

- (unint64_t)numberOfMeaningfulMomentsCelebrationAnniversary
{
  return self->_numberOfMeaningfulMomentsCelebrationAnniversary;
}

- (void)setNumberOfMeaningfulMomentsCelebration:(unint64_t)a3
{
  self->_numberOfMeaningfulMomentsCelebration = a3;
}

- (unint64_t)numberOfMeaningfulMomentsCelebration
{
  return self->_numberOfMeaningfulMomentsCelebration;
}

- (void)setNumberOfMeaningfulMomentsEntertainmentSportEvent:(unint64_t)a3
{
  self->_numberOfMeaningfulMomentsEntertainmentSportEvent = a3;
}

- (unint64_t)numberOfMeaningfulMomentsEntertainmentSportEvent
{
  return self->_numberOfMeaningfulMomentsEntertainmentSportEvent;
}

- (void)setNumberOfMeaningfulMomentsEntertainmentMuseum:(unint64_t)a3
{
  self->_numberOfMeaningfulMomentsEntertainmentMuseum = a3;
}

- (unint64_t)numberOfMeaningfulMomentsEntertainmentMuseum
{
  return self->_numberOfMeaningfulMomentsEntertainmentMuseum;
}

- (void)setNumberOfMeaningfulMomentsEntertainmentDance:(unint64_t)a3
{
  self->_numberOfMeaningfulMomentsEntertainmentDance = a3;
}

- (unint64_t)numberOfMeaningfulMomentsEntertainmentDance
{
  return self->_numberOfMeaningfulMomentsEntertainmentDance;
}

- (void)setNumberOfMeaningfulMomentsEntertainmentTheater:(unint64_t)a3
{
  self->_numberOfMeaningfulMomentsEntertainmentTheater = a3;
}

- (unint64_t)numberOfMeaningfulMomentsEntertainmentTheater
{
  return self->_numberOfMeaningfulMomentsEntertainmentTheater;
}

- (void)setNumberOfMeaningfulMomentsEntertainmentFestival:(unint64_t)a3
{
  self->_numberOfMeaningfulMomentsEntertainmentFestival = a3;
}

- (unint64_t)numberOfMeaningfulMomentsEntertainmentFestival
{
  return self->_numberOfMeaningfulMomentsEntertainmentFestival;
}

- (void)setNumberOfMeaningfulMomentsEntertainmentConcert:(unint64_t)a3
{
  self->_numberOfMeaningfulMomentsEntertainmentConcert = a3;
}

- (unint64_t)numberOfMeaningfulMomentsEntertainmentConcert
{
  return self->_numberOfMeaningfulMomentsEntertainmentConcert;
}

- (void)setNumberOfMeaningfulMomentsEntertainmentPerformance:(unint64_t)a3
{
  self->_numberOfMeaningfulMomentsEntertainmentPerformance = a3;
}

- (unint64_t)numberOfMeaningfulMomentsEntertainmentPerformance
{
  return self->_numberOfMeaningfulMomentsEntertainmentPerformance;
}

- (void)setNumberOfMeaningfulMomentsEntertainmentNightOut:(unint64_t)a3
{
  self->_numberOfMeaningfulMomentsEntertainmentNightOut = a3;
}

- (unint64_t)numberOfMeaningfulMomentsEntertainmentNightOut
{
  return self->_numberOfMeaningfulMomentsEntertainmentNightOut;
}

- (void)setNumberOfMeaningfulMomentsEntertainmentAmusementPark:(unint64_t)a3
{
  self->_numberOfMeaningfulMomentsEntertainmentAmusementPark = a3;
}

- (unint64_t)numberOfMeaningfulMomentsEntertainmentAmusementPark
{
  return self->_numberOfMeaningfulMomentsEntertainmentAmusementPark;
}

- (void)setNumberOfMeaningfulMomentsEntertainment:(unint64_t)a3
{
  self->_numberOfMeaningfulMomentsEntertainment = a3;
}

- (unint64_t)numberOfMeaningfulMomentsEntertainment
{
  return self->_numberOfMeaningfulMomentsEntertainment;
}

- (void)setNumberOfMeaningfulMomentsActivityWinterSport:(unint64_t)a3
{
  self->_numberOfMeaningfulMomentsActivityWinterSport = a3;
}

- (unint64_t)numberOfMeaningfulMomentsActivityWinterSport
{
  return self->_numberOfMeaningfulMomentsActivityWinterSport;
}

- (void)setNumberOfMeaningfulMomentsActivityClimbing:(unint64_t)a3
{
  self->_numberOfMeaningfulMomentsActivityClimbing = a3;
}

- (unint64_t)numberOfMeaningfulMomentsActivityClimbing
{
  return self->_numberOfMeaningfulMomentsActivityClimbing;
}

- (void)setNumberOfMeaningfulMomentsActivityHiking:(unint64_t)a3
{
  self->_numberOfMeaningfulMomentsActivityHiking = a3;
}

- (unint64_t)numberOfMeaningfulMomentsActivityHiking
{
  return self->_numberOfMeaningfulMomentsActivityHiking;
}

- (void)setNumberOfMeaningfulMomentsActivityDiving:(unint64_t)a3
{
  self->_numberOfMeaningfulMomentsActivityDiving = a3;
}

- (unint64_t)numberOfMeaningfulMomentsActivityDiving
{
  return self->_numberOfMeaningfulMomentsActivityDiving;
}

- (void)setNumberOfMeaningfulMomentsActivityBeach:(unint64_t)a3
{
  self->_numberOfMeaningfulMomentsActivityBeach = a3;
}

- (unint64_t)numberOfMeaningfulMomentsActivityBeach
{
  return self->_numberOfMeaningfulMomentsActivityBeach;
}

- (void)setNumberOfMeaningfulMomentsActivity:(unint64_t)a3
{
  self->_numberOfMeaningfulMomentsActivity = a3;
}

- (unint64_t)numberOfMeaningfulMomentsActivity
{
  return self->_numberOfMeaningfulMomentsActivity;
}

- (void)setNumberOfMeaningfulMomentsGathering:(unint64_t)a3
{
  self->_numberOfMeaningfulMomentsGathering = a3;
}

- (unint64_t)numberOfMeaningfulMomentsGathering
{
  return self->_numberOfMeaningfulMomentsGathering;
}

- (void)setRatioOfMeaningfulMoments:(double)a3
{
  self->_ratioOfMeaningfulMoments = a3;
}

- (double)ratioOfMeaningfulMoments
{
  return self->_ratioOfMeaningfulMoments;
}

- (void)setNumberOfMeaningfulMoments:(unint64_t)a3
{
  self->_numberOfMeaningfulMoments = a3;
}

- (unint64_t)numberOfMeaningfulMoments
{
  return self->_numberOfMeaningfulMoments;
}

- (void)setRatioOfMomentsLinkedToABusinessNode:(double)a3
{
  self->_ratioOfMomentsLinkedToABusinessNode = a3;
}

- (double)ratioOfMomentsLinkedToABusinessNode
{
  return self->_ratioOfMomentsLinkedToABusinessNode;
}

- (void)setNumberOfMomentsLinkedToABusinessNode:(unint64_t)a3
{
  self->_numberOfMomentsLinkedToABusinessNode = a3;
}

- (unint64_t)numberOfMomentsLinkedToABusinessNode
{
  return self->_numberOfMomentsLinkedToABusinessNode;
}

- (void)setNumberOfBusinessNodes:(unint64_t)a3
{
  self->_numberOfBusinessNodes = a3;
}

- (unint64_t)numberOfBusinessNodes
{
  return self->_numberOfBusinessNodes;
}

- (void)setNumberOfMoments:(unint64_t)a3
{
  self->_numberOfMoments = a3;
}

- (unint64_t)numberOfMoments
{
  return self->_numberOfMoments;
}

- (void)setLibrarySizeRange:(int64_t)a3
{
  self->_librarySizeRange = a3;
}

- (int64_t)librarySizeRange
{
  return self->_librarySizeRange;
}

- (void)setLibrarySize:(unint64_t)a3
{
  self->_librarySize = a3;
}

- (unint64_t)librarySize
{
  return self->_librarySize;
}

- (void)setManager:(id)a3
{
}

- (PGManager)manager
{
  return self->_manager;
}

- (void)_saveKey:(id)a3 stringValue:(id)a4 payload:(id)a5
{
}

- (void)_saveKey:(id)a3 integerValue:(unint64_t)a4 payload:(id)a5
{
  if (PGMetricsUnavailableIntegerValue != a4)
  {
    v7 = NSNumber;
    id v8 = a5;
    id v9 = a3;
    id v10 = [v7 numberWithUnsignedInteger:a4];
    [v8 setObject:v10 forKeyedSubscript:v9];
  }
}

- (void)_saveKey:(id)a3 BOOLValue:(BOOL)a4 payload:(id)a5
{
  BOOL v5 = a4;
  v7 = NSNumber;
  id v8 = a5;
  id v9 = a3;
  id v10 = [v7 numberWithBool:v5];
  [v8 setObject:v10 forKeyedSubscript:v9];
}

- (void)_saveKey:(id)a3 doubleValue:(double)a4 payload:(id)a5
{
  if (*(double *)&PGMetricsUnavailableDoubleValue != a4)
  {
    v7 = NSNumber;
    id v8 = a5;
    id v9 = a3;
    id v10 = [v7 numberWithDouble:a4];
    [v8 setObject:v10 forKeyedSubscript:v9];
  }
}

- (id)payload
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"librarySize" integerValue:self->_librarySize payload:v3];
  v4 = +[PGCuratedLibraryIntelligenceMetricEvent librarySizeRangeDescriptionForLibrarySizeRange:self->_librarySizeRange];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"librarySizeRange" stringValue:v4 payload:v3];

  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"numberOfSelfies" integerValue:self->_numberOfSelfies payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"ratioOfSelfies" doubleValue:v3 payload:self->_ratioOfSelfies];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"numberOfMoments" integerValue:self->_numberOfMoments payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"numberOfBusinessNodes" integerValue:self->_numberOfBusinessNodes payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"numberOfMomentsLinkedToABusinessNode" integerValue:self->_numberOfMomentsLinkedToABusinessNode payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"ratioOfMomentsLinkedToABusinessNode" doubleValue:v3 payload:self->_ratioOfMomentsLinkedToABusinessNode];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"numberOfMeaningfulMoments" integerValue:self->_numberOfMeaningfulMoments payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"ratioOfMeaningfulMoments" doubleValue:v3 payload:self->_ratioOfMeaningfulMoments];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"numberOfMeaningfulMomentsGathering" integerValue:self->_numberOfMeaningfulMomentsGathering payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"numberOfMeaningfulMomentsActivity" integerValue:self->_numberOfMeaningfulMomentsActivity payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"numberOfMeaningfulMomentsActivityBeach" integerValue:self->_numberOfMeaningfulMomentsActivityBeach payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"numberOfMeaningfulMomentsActivityDiving" integerValue:self->_numberOfMeaningfulMomentsActivityDiving payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"numberOfMeaningfulMomentsActivityHiking" integerValue:self->_numberOfMeaningfulMomentsActivityHiking payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"numberOfMeaningfulMomentsActivityClimbing" integerValue:self->_numberOfMeaningfulMomentsActivityClimbing payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"numberOfMeaningfulMomentsActivityWinterSport" integerValue:self->_numberOfMeaningfulMomentsActivityWinterSport payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"numberOfMeaningfulMomentsEntertainment" integerValue:self->_numberOfMeaningfulMomentsEntertainment payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"numberOfMeaningfulMomentsEntertainmentAmusementPark" integerValue:self->_numberOfMeaningfulMomentsEntertainmentAmusementPark payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"numberOfMeaningfulMomentsEntertainmentNightOut" integerValue:self->_numberOfMeaningfulMomentsEntertainmentNightOut payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"numberOfMeaningfulMomentsEntertainmentPerformance" integerValue:self->_numberOfMeaningfulMomentsEntertainmentPerformance payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"numberOfMeaningfulMomentsEntertainmentConcert" integerValue:self->_numberOfMeaningfulMomentsEntertainmentConcert payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"numberOfMeaningfulMomentsEntertainmentFestival" integerValue:self->_numberOfMeaningfulMomentsEntertainmentFestival payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"numberOfMeaningfulMomentsEntertainmentTheater" integerValue:self->_numberOfMeaningfulMomentsEntertainmentTheater payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"numberOfMeaningfulMomentsEntertainmentDance" integerValue:self->_numberOfMeaningfulMomentsEntertainmentDance payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"numberOfMeaningfulMomentsEntertainmentMuseum" integerValue:self->_numberOfMeaningfulMomentsEntertainmentMuseum payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"numberOfMeaningfulMomentsEntertainmentSportEvent" integerValue:self->_numberOfMeaningfulMomentsEntertainmentSportEvent payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"numberOfMeaningfulMomentsCelebration" integerValue:self->_numberOfMeaningfulMomentsCelebration payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"numberOfMeaningfulMomentsCelebrationAnniversary" integerValue:self->_numberOfMeaningfulMomentsCelebrationAnniversary payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"numberOfMeaningfulMomentsCelebrationBirthday" integerValue:self->_numberOfMeaningfulMomentsCelebrationBirthday payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"numberOfMeaningfulMomentsCelebrationHolidayEvent" integerValue:self->_numberOfMeaningfulMomentsCelebrationHolidayEvent payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"numberOfMeaningfulMomentsCelebrationWedding" integerValue:self->_numberOfMeaningfulMomentsCelebrationWedding payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"numberOfMeaningfulMomentsRestaurant" integerValue:self->_numberOfMeaningfulMomentsRestaurant payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"numberOfMeaningfulMomentsRestaurantBreakfast" integerValue:self->_numberOfMeaningfulMomentsRestaurantBreakfast payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"numberOfMeaningfulMomentsRestaurantLunch" integerValue:self->_numberOfMeaningfulMomentsRestaurantLunch payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"numberOfMeaningfulMomentsRestaurantDinner" integerValue:self->_numberOfMeaningfulMomentsRestaurantDinner payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"numberOfPublicEvents" integerValue:self->_numberOfPublicEvents payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"numberOfPublicEventsCategoryMusicConcerts" integerValue:self->_numberOfPublicEventsCategoryMusicConcerts payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"numberOfPublicEventsCategoryNightLife" integerValue:self->_numberOfPublicEventsCategoryNightLife payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"numberOfPublicEventsCategoryTheater" integerValue:self->_numberOfPublicEventsCategoryTheater payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"numberOfPublicEventsCategoryDance" integerValue:self->_numberOfPublicEventsCategoryDance payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"numberOfPublicEventsCategoryFestivalsAndFairs" integerValue:self->_numberOfPublicEventsCategoryFestivalsAndFairs payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"numberOfPublicEventsCategoryArtsAndMuseums" integerValue:self->_numberOfPublicEventsCategoryArtsAndMuseums payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"numberOfPublicEventsCategorySports" integerValue:self->_numberOfPublicEventsCategorySports payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"numberOfPublicEventsCategoryBusinessAndTechnology" integerValue:self->_numberOfPublicEventsCategoryBusinessAndTechnology payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"numberOfPublicEventsCategoryCommunity" integerValue:self->_numberOfPublicEventsCategoryCommunity payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"numberOfPublicEventsCategoryEducational" integerValue:self->_numberOfPublicEventsCategoryEducational payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"numberOfPublicEventsCategoryFamilyEvents" integerValue:self->_numberOfPublicEventsCategoryFamilyEvents payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"numberOfPublicEventsCategoryTours" integerValue:self->_numberOfPublicEventsCategoryTours payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"numberOfPublicEventsCategoryAppleEvents" integerValue:self->_numberOfPublicEventsCategoryAppleEvents payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"numberOfMomentsLinkedToAPublicEvent" integerValue:self->_numberOfMomentsLinkedToAPublicEvent payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"ratioOfMomentsLinkedToAPublicEvent" doubleValue:v3 payload:self->_ratioOfMomentsLinkedToAPublicEvent];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"hasMeNode" BOOLValue:self->_hasMeNode payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"hasNamedMeNode" BOOLValue:self->_hasNamedMeNode payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"numberOfPeople" integerValue:self->_numberOfPeople payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"ratioOfPeopleLinkedToContact" doubleValue:v3 payload:self->_ratioOfPeopleLinkedToContact];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"ratioOfPeopleNotLinkedToContact" doubleValue:v3 payload:self->_ratioOfPeopleNotLinkedToContact];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"ratioOfPeopleNotLinkedToContactWithHighConfidenceContactSuggestion" doubleValue:v3 payload:self->_ratioOfPeopleNotLinkedToContactWithHighConfidenceContactSuggestion];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"ratioOfFavoritedPeople" doubleValue:v3 payload:self->_ratioOfFavoritedPeople];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"ratioOfPeopleWithExplicitBirthdayDate" doubleValue:v3 payload:self->_ratioOfPeopleWithExplicitBirthdayDate];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"ratioOfPeopleWithInferredBirthdayDate" doubleValue:v3 payload:self->_ratioOfPeopleWithInferredBirthdayDate];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"numberOfSocialGroups" integerValue:self->_numberOfSocialGroups payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"ratioOfPeoplePartOfASocialGroup" doubleValue:v3 payload:self->_ratioOfPeoplePartOfASocialGroup];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"ratioOfTwoPeopleSocialGroup" doubleValue:v3 payload:self->_ratioOfTwoPeopleSocialGroup];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"averageSocialGroupSize" doubleValue:v3 payload:self->_averageSocialGroupSize];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"maximumSocialGroupSize" integerValue:self->_maximumSocialGroupSize payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"hasMusicData" BOOLValue:self->_hasMusicData payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"numberOfMusicSessions" integerValue:self->_numberOfMusicSessions payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"maximumMusicSessionSize" integerValue:self->_maximumMusicSessionSize payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"averageMusicSessionSize" doubleValue:v3 payload:self->_averageMusicSessionSize];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"hasMeHomeNode" BOOLValue:self->_hasMeHomeNode payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"hasMeWorkNode" BOOLValue:self->_hasMeWorkNode payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"numberOfMomentsAtMyHome" integerValue:self->_numberOfMomentsAtMyHome payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"numberOfMomentsAtMyWork" integerValue:self->_numberOfMomentsAtMyWork payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"ratioOfMomentsAtMyHome" doubleValue:v3 payload:self->_ratioOfMomentsAtMyHome];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"ratioOfMomentsAtMyWork" doubleValue:v3 payload:self->_ratioOfMomentsAtMyWork];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"ratioOfMomentsAtAFrequentLocation" doubleValue:v3 payload:self->_ratioOfMomentsAtAFrequentLocation];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"numberOfFrequentLocations" integerValue:self->_numberOfFrequentLocations payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"numberOfFrequentLocationsCities" integerValue:self->_numberOfFrequentLocationsCities payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"numberOfFrequentLocationsCountries" integerValue:self->_numberOfFrequentLocationsCountries payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"numberOfPetNodes" integerValue:self->_numberOfPetNodes payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"numberOfCelebratedHolidays" integerValue:self->_numberOfCelebratedHolidays payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"numberOfMomentsCelebratingAHoliday" integerValue:self->_numberOfMomentsCelebratingAHoliday payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"ratioOfMomentsCelebratingAHoliday" doubleValue:v3 payload:self->_ratioOfMomentsCelebratingAHoliday];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"numberOfShortTrips" integerValue:self->_numberOfShortTrips payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"numberOfLongTrips" integerValue:self->_numberOfLongTrips payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"numberOfMomentsInTrip" integerValue:self->_numberOfMomentsInTrip payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"ratioOfMomentsInTrip" doubleValue:v3 payload:self->_ratioOfMomentsInTrip];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"numberOfMomentsWithAtLeastOneGemAsset" integerValue:self->_numberOfMomentsWithAtLeastOneGemAsset payload:v3];
  [(PGGraphStatisticsMetricEvent *)self _saveKey:@"ratioOfMomentsWithAtLeastOneGemAsset" doubleValue:v3 payload:self->_ratioOfMomentsWithAtLeastOneGemAsset];
  return v3;
}

- (void)_fillTripStatisticsWithGraph:(id)a3 progressReporter:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v7 isCancelledWithProgress:0.0])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      int v11 = 67109378;
      int v12 = 661;
      __int16 v13 = 2080;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Me"
            "tricEvents/PGGraphStatisticsMetricEvent.m";
      id v8 = MEMORY[0x1E4F14500];
LABEL_10:
      _os_log_impl(&dword_1D1805000, v8, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v11, 0x12u);
    }
  }
  else
  {
    id v9 = [v6 longTripNodes];
    self->_numberOfLongTrips = [v9 count];

    if ([v7 isCancelledWithProgress:0.5])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        int v11 = 67109378;
        int v12 = 664;
        __int16 v13 = 2080;
        v14 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/"
              "MetricEvents/PGGraphStatisticsMetricEvent.m";
        id v8 = MEMORY[0x1E4F14500];
        goto LABEL_10;
      }
    }
    else
    {
      id v10 = [v6 shortTripNodes];
      self->_numberOfShortTrips = [v10 count];

      if ([v7 isCancelledWithProgress:1.0]
        && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        int v11 = 67109378;
        int v12 = 666;
        __int16 v13 = 2080;
        v14 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/"
              "MetricEvents/PGGraphStatisticsMetricEvent.m";
        id v8 = MEMORY[0x1E4F14500];
        goto LABEL_10;
      }
    }
  }
}

- (void)_fillFrequentLocationsStatisticsWithGraph:(id)a3 progressReporter:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v7 isCancelledWithProgress:0.0])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      int v12 = 67109378;
      int v13 = 649;
      __int16 v14 = 2080;
      uint64_t v15 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Me"
            "tricEvents/PGGraphStatisticsMetricEvent.m";
      id v8 = MEMORY[0x1E4F14500];
LABEL_13:
      _os_log_impl(&dword_1D1805000, v8, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v12, 0x12u);
    }
  }
  else
  {
    id v9 = [v6 supersets];
    self->_numberOfFrequentLocations = [v9 count];

    if ([v7 isCancelledWithProgress:0.3])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        int v12 = 67109378;
        int v13 = 652;
        __int16 v14 = 2080;
        uint64_t v15 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/"
              "MetricEvents/PGGraphStatisticsMetricEvent.m";
        id v8 = MEMORY[0x1E4F14500];
        goto LABEL_13;
      }
    }
    else
    {
      id v10 = [v6 supersetCityNodes];
      self->_numberOfFrequentLocationsCities = [v10 count];

      if ([v7 isCancelledWithProgress:0.6])
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          int v12 = 67109378;
          int v13 = 654;
          __int16 v14 = 2080;
          uint64_t v15 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metric"
                "s/MetricEvents/PGGraphStatisticsMetricEvent.m";
          id v8 = MEMORY[0x1E4F14500];
          goto LABEL_13;
        }
      }
      else
      {
        int v11 = [v6 supersetCountryNodes];
        self->_numberOfFrequentLocationsCountries = [v11 count];

        if ([v7 isCancelledWithProgress:1.0]
          && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          int v12 = 67109378;
          int v13 = 656;
          __int16 v14 = 2080;
          uint64_t v15 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metric"
                "s/MetricEvents/PGGraphStatisticsMetricEvent.m";
          id v8 = MEMORY[0x1E4F14500];
          goto LABEL_13;
        }
      }
    }
  }
}

- (void)_fillHomeWorkStatisticsWithGraph:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 meNodeCollection];
  id v6 = [v5 homeNodes];
  self->_hasMeHomeNode = [v6 count] != 0;

  id v8 = [v4 meNodeCollection];

  id v7 = [v8 workNodes];
  self->_hasMeWorkNode = [v7 count] != 0;
}

- (void)_fillPetStatisticsWithGraph:(id)a3
{
  id v4 = +[PGGraphNodeCollection nodesInGraph:a3];
  self->_numberOfPetNodes = [v4 count];
}

- (void)_fillHolidaysStatisticsWithGraph:(id)a3 progressReporter:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D25FED50]();
  id v9 = v7;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  int v10 = [v9 isCancelledWithProgress:0.0];
  *((unsigned char *)v33 + 24) = v10;
  if (!v10)
  {
    int v11 = [v6 celebratedHolidayNodes];
    self->_numberOfCelebratedHolidays = [v11 count];
    v23 = [MEMORY[0x1E4F1CA80] set];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id obj = v11;
    uint64_t v12 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v29;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v29 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          v24[2] = __82__PGGraphStatisticsMetricEvent__fillHolidaysStatisticsWithGraph_progressReporter___block_invoke;
          v24[3] = &unk_1E68F1898;
          id v25 = v23;
          v27 = &v32;
          id v16 = v9;
          id v26 = v16;
          [v15 enumerateCelebratingMomentNodesUsingBlock:v24];
          if (*((unsigned char *)v33 + 24))
          {
            *((unsigned char *)v33 + 24) = 1;
LABEL_16:
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              int v38 = 627;
              __int16 v39 = 2080;
              v40 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Me"
                    "trics/MetricEvents/PGGraphStatisticsMetricEvent.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }

            goto LABEL_25;
          }
          int v17 = [v16 isCancelledWithProgress:0.5];
          *((unsigned char *)v33 + 24) = v17;
          if (v17) {
            goto LABEL_16;
          }
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    unint64_t v18 = [v23 count];
    self->_numberOfMomentsCelebratingAHoliday = v18;
    unint64_t numberOfMoments = self->_numberOfMoments;
    if (numberOfMoments) {
      double v20 = (double)v18 / (double)numberOfMoments;
    }
    else {
      double v20 = *(double *)&PGMetricsUnavailableDoubleValue;
    }
    self->_ratioOfMomentsCelebratingAHoliday = v20;
    if (*((unsigned char *)v33 + 24))
    {
      *((unsigned char *)v33 + 24) = 1;
    }
    else
    {
      char v21 = [v9 isCancelledWithProgress:1.0];
      *((unsigned char *)v33 + 24) = v21;
      if ((v21 & 1) == 0)
      {
LABEL_25:

        goto LABEL_26;
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      int v38 = 632;
      __int16 v39 = 2080;
      v40 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Me"
            "tricEvents/PGGraphStatisticsMetricEvent.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    goto LABEL_25;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v38 = 615;
    __int16 v39 = 2080;
    v40 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGGraphStatisticsMetricEvent.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_26:
  _Block_object_dispose(&v32, 8);
}

uint64_t __82__PGGraphStatisticsMetricEvent__fillHolidaysStatisticsWithGraph_progressReporter___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) addObject:a2];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v3 + 24))
  {
    uint64_t result = 1;
  }
  else
  {
    uint64_t result = [*(id *)(a1 + 40) isCancelledWithProgress:0.5];
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  }
  *(unsigned char *)(v3 + 24) = result;
  return result;
}

- (void)_fillMusicStatisticsWithGraph:(id)a3 progressReporter:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D25FED50]();
  id v9 = v7;
  uint64_t v28 = 0;
  long long v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  int v10 = [v9 isCancelledWithProgress:0.0];
  *((unsigned char *)v29 + 24) = v10;
  if (!v10)
  {
    *(void *)buf = 0;
    *(void *)&long long v37 = buf;
    *((void *)&v37 + 1) = 0x2020000000;
    uint64_t v38 = 0;
    uint64_t v24 = 0;
    id v25 = &v24;
    uint64_t v26 = 0x2020000000;
    uint64_t v27 = 0;
    uint64_t v20 = 0;
    char v21 = &v20;
    uint64_t v22 = 0x2020000000;
    uint64_t v23 = 0;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __79__PGGraphStatisticsMetricEvent__fillMusicStatisticsWithGraph_progressReporter___block_invoke;
    v14[3] = &unk_1E68F1960;
    id v16 = buf;
    int v17 = &v20;
    unint64_t v18 = &v24;
    v19 = &v28;
    id v11 = v9;
    id v15 = v11;
    [v6 enumerateMusicSessionNodesUsingBlock:v14];
    self->_unint64_t numberOfMusicSessions = *(void *)(v37 + 24);
    self->_maximumMusicSessionSize = v25[3];
    unint64_t numberOfMusicSessions = self->_numberOfMusicSessions;
    self->_hasMusicData = numberOfMusicSessions != 0;
    if (numberOfMusicSessions) {
      self->_averageMusicSessionSize = (double)(unint64_t)v21[3] / (double)numberOfMusicSessions;
    }
    if (*((unsigned char *)v29 + 24))
    {
      *((unsigned char *)v29 + 24) = 1;
    }
    else
    {
      char v13 = [v11 isCancelledWithProgress:1.0];
      *((unsigned char *)v29 + 24) = v13;
      if ((v13 & 1) == 0)
      {
LABEL_11:

        _Block_object_dispose(&v20, 8);
        _Block_object_dispose(&v24, 8);
        _Block_object_dispose(buf, 8);
        goto LABEL_12;
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t v32 = 67109378;
      int v33 = 608;
      __int16 v34 = 2080;
      char v35 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Me"
            "tricEvents/PGGraphStatisticsMetricEvent.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v32, 0x12u);
    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&uint8_t buf[4] = 580;
    LOWORD(v37) = 2080;
    *(void *)((char *)&v37 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Metrics/MetricEvents/PGGraphStatisticsMetricEvent.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_12:
  _Block_object_dispose(&v28, 8);
}

void __79__PGGraphStatisticsMetricEvent__fillMusicStatisticsWithGraph_progressReporter___block_invoke(uint64_t a1, void *a2)
{
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  id v7 = [a2 trackNodes];
  unint64_t v3 = [v7 count];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += v3;
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  if (v3 > *(void *)(v4 + 24)) {
    *(void *)(v4 + 24) = v3;
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
  if (*(unsigned char *)(v5 + 24))
  {
    char v6 = 1;
  }
  else
  {
    char v6 = [*(id *)(a1 + 32) isCancelledWithProgress:0.5];
    uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
  }
  *(unsigned char *)(v5 + 24) = v6;
}

- (void)_fillPeopleStatisticsWithGraph:(id)a3 progressReporter:(id)a4
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v48 = a3;
  id v6 = a4;
  context = (void *)MEMORY[0x1D25FED50]();
  uint64_t v66 = 0;
  v67 = &v66;
  uint64_t v68 = 0x2020000000;
  char v69 = 0;
  id v52 = v6;
  int v7 = [v52 isCancelledWithProgress:0.0];
  *((unsigned char *)v67 + 24) = v7;
  if (!v7)
  {
    v47 = self;
    v44 = [v48 meNode];
    self->_hasMeNode = v44 != 0;
    id v8 = [v44 contactIdentifier];
    self->_hasNamedMeNode = [v8 length] != 0;

    id v9 = [v48 personNodesIncludingMe:0];
    uint64_t v43 = 456;
    self->_numberOfPeople = [v9 count];
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id obj = v9;
    unint64_t v10 = 0;
    unint64_t v11 = 0;
    uint64_t v12 = [obj countByEnumeratingWithState:&v62 objects:v74 count:16];
    if (v12)
    {
      unint64_t v13 = 0;
      unint64_t v14 = 0;
      unint64_t v50 = 0;
      uint64_t v51 = *(void *)v63;
      v46 = v58;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v63 != v51) {
            objc_enumerationMutation(obj);
          }
          id v16 = *(void **)(*((void *)&v62 + 1) + 8 * i);
          unsigned int v17 = objc_msgSend(v16, "isFavorite", v43, v44, context, v46);
          unint64_t v18 = [v16 contactIdentifier];
          BOOL v19 = [v18 length] == 0;

          if (v19)
          {
            *(void *)buf = 0;
            *(void *)&long long v72 = buf;
            *((void *)&v72 + 1) = 0x2020000000;
            char v73 = 0;
            v57[0] = MEMORY[0x1E4F143A8];
            v57[1] = 3221225472;
            v58[0] = __80__PGGraphStatisticsMetricEvent__fillPeopleStatisticsWithGraph_progressReporter___block_invoke;
            v58[1] = &unk_1E68F1938;
            v60 = buf;
            v61 = &v66;
            id v59 = v52;
            [v16 enumerateContactSuggestionsSortedByConfidenceMatchingQuery:1 usingBlock:v57];
            uint64_t v23 = *(unsigned __int8 *)(v72 + 24);

            v50 += v23;
            _Block_object_dispose(buf, 8);
          }
          else
          {
            uint64_t v20 = [v16 birthdayDate];

            char v21 = [v16 potentialBirthdayDate];
            if (v20) {
              ++v10;
            }
            BOOL v22 = v21 != 0;

            ++v13;
            v11 += v22;
          }
          if (*((unsigned char *)v67 + 24))
          {
            *((unsigned char *)v67 + 24) = 1;
LABEL_36:
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)&uint8_t buf[4] = 508;
              LOWORD(v72) = 2080;
              *(void *)((char *)&v72 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysi"
                                              "s/PhotosGraph/Framework/Metrics/MetricEvents/PGGraphStatisticsMetricEvent.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }

            goto LABEL_39;
          }
          char v24 = [v52 isCancelledWithProgress:0.5];
          *((unsigned char *)v67 + 24) = v24;
          if (v24) {
            goto LABEL_36;
          }
          v14 += v17;
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v62 objects:v74 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
    else
    {
      unint64_t v50 = 0;
      unint64_t v13 = 0;
      unint64_t v14 = 0;
    }

    unint64_t v25 = [obj count];
    *(Class *)((char *)&v47->super.super.isa + v43) = (Class)v25;
    if (v25)
    {
      double v26 = (double)v13 / (double)v25;
      v47->_ratioOfPeopleLinkedToContact = v26;
      v47->_ratioOfPeopleNotLinkedToContact = 1.0 - v26;
      v47->_ratioOfFavoritedPeople = (double)v14 / (double)v25;
      v47->_ratioOfPeopleWithExplicitBirthdayDate = (double)v10 / (double)v25;
      v47->_ratioOfPeopleWithInferredBirthdayDate = (double)(v11 / v25);
      v47->_ratioOfPeopleNotLinkedToContactWithHighConfidenceContactSuggestion = (double)v50 / (double)(v25 - v13);
      uint64_t v27 = [v48 socialGroupNodesSortedByImportance];
      v47->_unint64_t numberOfSocialGroups = [v27 count];
      uint64_t v28 = [MEMORY[0x1E4F1CA80] set];
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v29 = v27;
      uint64_t v30 = [v29 countByEnumeratingWithState:&v53 objects:v70 count:16];
      if (v30)
      {
        unint64_t v31 = 0;
        unint64_t v32 = 0;
        uint64_t v33 = *(void *)v54;
        double v34 = 0.0;
        while (2)
        {
          for (uint64_t j = 0; j != v30; ++j)
          {
            if (*(void *)v54 != v33) {
              objc_enumerationMutation(v29);
            }
            v36 = objc_msgSend(*(id *)(*((void *)&v53 + 1) + 8 * j), "personNodes", v43);
            [v28 unionSet:v36];
            unint64_t v37 = [v36 count];
            unint64_t v38 = v37;
            if (v37 == 1) {
              ++v31;
            }
            if (v37 > v32) {
              unint64_t v32 = v37;
            }
            if (*((unsigned char *)v67 + 24))
            {
              *((unsigned char *)v67 + 24) = 1;
LABEL_46:
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)&uint8_t buf[4] = 542;
                LOWORD(v72) = 2080;
                *(void *)((char *)&v72 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanaly"
                                                "sis/PhotosGraph/Framework/Metrics/MetricEvents/PGGraphStatisticsMetricEvent.m";
                _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }

              goto LABEL_39;
            }
            int v39 = [v52 isCancelledWithProgress:0.8];
            *((unsigned char *)v67 + 24) = v39;
            if (v39) {
              goto LABEL_46;
            }

            double v34 = v34 + (double)v38;
          }
          uint64_t v30 = [v29 countByEnumeratingWithState:&v53 objects:v70 count:16];
          if (v30) {
            continue;
          }
          break;
        }
        double v40 = (double)v31;
      }
      else
      {
        unint64_t v32 = 0;
        double v40 = 0.0;
        double v34 = 0.0;
      }

      v47->_ratioOfPeoplePartOfASocialGroup = (double)(unint64_t)[v28 count]
                                            / (double)*(unint64_t *)((char *)&v47->super.super.isa + v43);
      unint64_t numberOfSocialGroups = v47->_numberOfSocialGroups;
      if (numberOfSocialGroups)
      {
        v47->_ratioOfTwoPeopleSocialGroup = v40 / (double)numberOfSocialGroups;
        v47->_averageSocialGroupSize = v34 / (double)numberOfSocialGroups;
      }
      else
      {
        *(void *)&v47->_ratioOfTwoPeopleSocialGroup = PGMetricsUnavailableDoubleValue;
        *(void *)&v47->_averageSocialGroupSize = PGMetricsUnavailableDoubleValue;
        unint64_t v32 = PGMetricsUnavailableIntegerValue;
      }
      v47->_maximumSocialGroupSize = v32;
    }
    else
    {
      *(void *)&v47->_ratioOfPeopleLinkedToContact = PGMetricsUnavailableDoubleValue;
      *(void *)&v47->_ratioOfPeopleNotLinkedToContact = PGMetricsUnavailableDoubleValue;
      *(void *)&v47->_ratioOfFavoritedPeople = PGMetricsUnavailableDoubleValue;
      *(void *)&v47->_ratioOfPeopleWithExplicitBirthdayDate = PGMetricsUnavailableDoubleValue;
      *(void *)&v47->_ratioOfPeopleWithInferredBirthdayDate = PGMetricsUnavailableDoubleValue;
      *(void *)&v47->_ratioOfPeopleNotLinkedToContactWithHighConfidenceContactSuggestion = PGMetricsUnavailableDoubleValue;
      *(void *)&v47->_ratioOfPeoplePartOfASocialGroup = PGMetricsUnavailableDoubleValue;
      *(void *)&v47->_ratioOfTwoPeopleSocialGroup = PGMetricsUnavailableDoubleValue;
      *(void *)&v47->_averageSocialGroupSize = PGMetricsUnavailableDoubleValue;
      v47->_maximumSocialGroupSize = PGMetricsUnavailableIntegerValue;
    }
    if (*((unsigned char *)v67 + 24))
    {
      *((unsigned char *)v67 + 24) = 1;
    }
    else
    {
      char v42 = [v52 isCancelledWithProgress:1.0];
      *((unsigned char *)v67 + 24) = v42;
      if ((v42 & 1) == 0)
      {
LABEL_39:

        goto LABEL_40;
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&uint8_t buf[4] = 573;
      LOWORD(v72) = 2080;
      *(void *)((char *)&v72 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Metrics/MetricEvents/PGGraphStatisticsMetricEvent.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    goto LABEL_39;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&uint8_t buf[4] = 459;
    LOWORD(v72) = 2080;
    *(void *)((char *)&v72 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Metrics/MetricEvents/PGGraphStatisticsMetricEvent.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_40:
  _Block_object_dispose(&v66, 8);
}

uint64_t __80__PGGraphStatisticsMetricEvent__fillPeopleStatisticsWithGraph_progressReporter___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t result = 1;
  *(unsigned char *)(v6 + 24) = 1;
  *a5 = 1;
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  if (!*(unsigned char *)(v8 + 24))
  {
    uint64_t result = [*(id *)(a1 + 32) isCancelledWithProgress:0.5];
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  }
  *(unsigned char *)(v8 + 24) = result;
  return result;
}

- (void)_fillPublicEventStatisticsWithGraph:(id)a3 progressReporter:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1D25FED50]();
  id v9 = v7;
  uint64_t v39 = 0;
  double v40 = &v39;
  uint64_t v41 = 0x2020000000;
  char v42 = 0;
  int v10 = [v9 isCancelledWithProgress:0.0];
  *((unsigned char *)v40 + 24) = v10;
  if (!v10)
  {
    *(void *)buf = 0;
    *(void *)&long long v48 = buf;
    *((void *)&v48 + 1) = 0x2020000000;
    uint64_t v49 = 0;
    unint64_t v11 = [MEMORY[0x1E4F1CA80] set];
    id v12 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __85__PGGraphStatisticsMetricEvent__fillPublicEventStatisticsWithGraph_progressReporter___block_invoke;
    v33[3] = &unk_1E68F1910;
    unint64_t v37 = buf;
    id v13 = v12;
    id v34 = v13;
    unint64_t v38 = &v39;
    id v14 = v9;
    id v35 = v14;
    id v15 = v11;
    id v36 = v15;
    [v6 enumeratePublicEventNodesUsingBlock:v33];
    self->_numberOfPublicEvents = *(void *)(v48 + 24);
    unint64_t v16 = [v15 count];
    self->_numberOfMomentsLinkedToAPublicEvent = v16;
    unint64_t numberOfMoments = self->_numberOfMoments;
    if (numberOfMoments) {
      double v18 = (double)v16 / (double)numberOfMoments;
    }
    else {
      double v18 = *(double *)&PGMetricsUnavailableDoubleValue;
    }
    self->_ratioOfMomentsLinkedToAPublicEvent = v18;
    BOOL v19 = [MEMORY[0x1E4F76D68] musicConcerts];
    self->_numberOfPublicEventsCategoryMusicConcerts = [v13 countForObject:v19];

    uint64_t v20 = [MEMORY[0x1E4F76D68] nightLife];
    self->_numberOfPublicEventsCategoryNightLife = [v13 countForObject:v20];

    char v21 = [MEMORY[0x1E4F76D68] theater];
    self->_numberOfPublicEventsCategoryTheater = [v13 countForObject:v21];

    BOOL v22 = [MEMORY[0x1E4F76D68] dance];
    self->_numberOfPublicEventsCategoryDance = [v13 countForObject:v22];

    uint64_t v23 = [MEMORY[0x1E4F76D68] festivalsAndFairs];
    self->_numberOfPublicEventsCategoryFestivalsAndFairs = [v13 countForObject:v23];

    char v24 = [MEMORY[0x1E4F76D68] artsAndMuseums];
    self->_numberOfPublicEventsCategoryArtsAndMuseums = [v13 countForObject:v24];

    unint64_t v25 = [MEMORY[0x1E4F76D68] sports];
    self->_numberOfPublicEventsCategorySports = [v13 countForObject:v25];

    double v26 = [MEMORY[0x1E4F76D68] businessAndTechnology];
    self->_numberOfPublicEventsCategoryBusinessAndTechnology = [v13 countForObject:v26];

    uint64_t v27 = [MEMORY[0x1E4F76D68] community];
    self->_numberOfPublicEventsCategoryCommunity = [v13 countForObject:v27];

    uint64_t v28 = [MEMORY[0x1E4F76D68] educational];
    self->_numberOfPublicEventsCategoryEducational = [v13 countForObject:v28];

    id v29 = [MEMORY[0x1E4F76D68] familyEvents];
    self->_numberOfPublicEventsCategoryFamilyEvents = [v13 countForObject:v29];

    uint64_t v30 = [MEMORY[0x1E4F76D68] tours];
    self->_numberOfPublicEventsCategoryTours = [v13 countForObject:v30];

    unint64_t v31 = [MEMORY[0x1E4F76D68] appleEvents];
    self->_numberOfPublicEventsCategoryAppleEvents = [v13 countForObject:v31];

    if (*((unsigned char *)v40 + 24))
    {
      *((unsigned char *)v40 + 24) = 1;
    }
    else
    {
      char v32 = [v14 isCancelledWithProgress:1.0];
      *((unsigned char *)v40 + 24) = v32;
      if ((v32 & 1) == 0)
      {
LABEL_12:

        _Block_object_dispose(buf, 8);
        goto LABEL_13;
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t v43 = 67109378;
      int v44 = 452;
      __int16 v45 = 2080;
      v46 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Me"
            "tricEvents/PGGraphStatisticsMetricEvent.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v43, 0x12u);
    }
    goto LABEL_12;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&uint8_t buf[4] = 409;
    LOWORD(v48) = 2080;
    *(void *)((char *)&v48 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Metrics/MetricEvents/PGGraphStatisticsMetricEvent.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_13:
  _Block_object_dispose(&v39, 8);
}

void __85__PGGraphStatisticsMetricEvent__fillPublicEventStatisticsWithGraph_progressReporter___block_invoke(uint64_t a1, void *a2)
{
  ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __85__PGGraphStatisticsMetricEvent__fillPublicEventStatisticsWithGraph_progressReporter___block_invoke_2;
  v20[3] = &unk_1E68F18E8;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 64);
  id v21 = v4;
  uint64_t v23 = v5;
  id v22 = *(id *)(a1 + 40);
  id v6 = a2;
  [v6 enumeratePublicEventCategoryNodesUsingBlock:v20];
  id v7 = [v6 collection];

  uint64_t v8 = [v7 momentNodes];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __85__PGGraphStatisticsMetricEvent__fillPublicEventStatisticsWithGraph_progressReporter___block_invoke_3;
  unint64_t v16 = &unk_1E68F1898;
  id v9 = *(id *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 64);
  id v17 = v9;
  uint64_t v19 = v10;
  id v18 = *(id *)(a1 + 40);
  [v8 enumerateNodesUsingBlock:&v13];

  uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
  if (*(unsigned char *)(v11 + 24))
  {
    char v12 = 1;
  }
  else
  {
    char v12 = objc_msgSend(*(id *)(a1 + 40), "isCancelledWithProgress:", 0.5, v13, v14, v15, v16, v17);
    uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
  }
  *(unsigned char *)(v11 + 24) = v12;
}

uint64_t __85__PGGraphStatisticsMetricEvent__fillPublicEventStatisticsWithGraph_progressReporter___block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v3 = *(void **)(a1 + 32);
  id v4 = [a2 label];
  [v3 addObject:v4];

  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v5 + 24))
  {
    uint64_t result = 1;
  }
  else
  {
    uint64_t result = [*(id *)(a1 + 40) isCancelledWithProgress:0.5];
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  }
  *(unsigned char *)(v5 + 24) = result;
  return result;
}

uint64_t __85__PGGraphStatisticsMetricEvent__fillPublicEventStatisticsWithGraph_progressReporter___block_invoke_3(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) addObject:a2];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v3 + 24))
  {
    uint64_t result = 1;
  }
  else
  {
    uint64_t result = [*(id *)(a1 + 40) isCancelledWithProgress:0.5];
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  }
  *(unsigned char *)(v3 + 24) = result;
  return result;
}

- (void)_fillBusinessStatisticsWithGraph:(id)a3 progressReporter:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1D25FED50]();
  id v9 = v7;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  int v10 = [v9 isCancelledWithProgress:0.0];
  *((unsigned char *)v27 + 24) = v10;
  if (!v10)
  {
    *(void *)buf = 0;
    *(void *)&long long v35 = buf;
    *((void *)&v35 + 1) = 0x2020000000;
    uint64_t v36 = 0;
    uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    uint64_t v20 = __82__PGGraphStatisticsMetricEvent__fillBusinessStatisticsWithGraph_progressReporter___block_invoke;
    id v21 = &unk_1E68F18C0;
    char v24 = buf;
    id v12 = v11;
    id v22 = v12;
    unint64_t v25 = &v26;
    id v13 = v9;
    id v23 = v13;
    [v6 enumerateBusinessNodesUsingBlock:&v18];
    self->_numberOfBusinessNodes = *(void *)(v35 + 24);
    unint64_t v14 = objc_msgSend(v12, "count", v18, v19, v20, v21);
    self->_numberOfMomentsLinkedToABusinessNode = v14;
    unint64_t numberOfMoments = self->_numberOfMoments;
    if (numberOfMoments) {
      double v16 = (double)v14 / (double)numberOfMoments;
    }
    else {
      double v16 = *(double *)&PGMetricsUnavailableDoubleValue;
    }
    self->_ratioOfMomentsLinkedToABusinessNode = v16;
    if (*((unsigned char *)v27 + 24))
    {
      *((unsigned char *)v27 + 24) = 1;
    }
    else
    {
      char v17 = [v13 isCancelledWithProgress:1.0];
      *((unsigned char *)v27 + 24) = v17;
      if ((v17 & 1) == 0)
      {
LABEL_12:

        _Block_object_dispose(buf, 8);
        goto LABEL_13;
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t v30 = 67109378;
      int v31 = 402;
      __int16 v32 = 2080;
      uint64_t v33 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Me"
            "tricEvents/PGGraphStatisticsMetricEvent.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v30, 0x12u);
    }
    goto LABEL_12;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&uint8_t buf[4] = 380;
    LOWORD(v35) = 2080;
    *(void *)((char *)&v35 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Metrics/MetricEvents/PGGraphStatisticsMetricEvent.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_13:
  _Block_object_dispose(&v26, 8);
}

void __82__PGGraphStatisticsMetricEvent__fillBusinessStatisticsWithGraph_progressReporter___block_invoke(uint64_t a1, void *a2)
{
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  uint64_t v3 = [a2 collection];
  id v4 = [v3 momentNodes];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __82__PGGraphStatisticsMetricEvent__fillBusinessStatisticsWithGraph_progressReporter___block_invoke_2;
  v9[3] = &unk_1E68F1898;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 56);
  id v10 = v5;
  uint64_t v12 = v6;
  id v11 = *(id *)(a1 + 40);
  [v4 enumerateNodesUsingBlock:v9];

  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  if (*(unsigned char *)(v7 + 24))
  {
    char v8 = 1;
  }
  else
  {
    char v8 = [*(id *)(a1 + 40) isCancelledWithProgress:0.5];
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  }
  *(unsigned char *)(v7 + 24) = v8;
}

uint64_t __82__PGGraphStatisticsMetricEvent__fillBusinessStatisticsWithGraph_progressReporter___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) addObject:a2];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v3 + 24))
  {
    uint64_t result = 1;
  }
  else
  {
    uint64_t result = [*(id *)(a1 + 40) isCancelledWithProgress:0.5];
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  }
  *(unsigned char *)(v3 + 24) = result;
  return result;
}

- (void)_fillMeaningfulEventsStatisticsWithGraph:(id)a3 progressReporter:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = (void *)MEMORY[0x1D25FED50]();
  id v9 = v7;
  if (![v9 isCancelledWithProgress:0.0])
  {
    id v10 = [v6 meaningfulEvents];
    if ([v9 isCancelledWithProgress:0.3])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        int v19 = 67109378;
        int v20 = 326;
        __int16 v21 = 2080;
        id v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/"
              "MetricEvents/PGGraphStatisticsMetricEvent.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v19, 0x12u);
      }
      goto LABEL_21;
    }
    id v11 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
    uint64_t v12 = [(MAElementCollection *)[PGGraphMomentNodeCollection alloc] initWithSet:v10 graph:v6];
    if ([v9 isCancelledWithProgress:0.5])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        int v19 = 67109378;
        int v20 = 330;
        __int16 v21 = 2080;
        id v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/"
              "MetricEvents/PGGraphStatisticsMetricEvent.m";
        id v13 = MEMORY[0x1E4F14500];
LABEL_19:
        _os_log_impl(&dword_1D1805000, v13, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v19, 0x12u);
      }
    }
    else
    {
      unint64_t v14 = [(PGGraphMomentNodeCollection *)v12 meaningNodes];
      id v15 = [v14 meaningLabels];
      [v11 unionSet:v15];

      if (![v9 isCancelledWithProgress:0.8])
      {
        self->_numberOfMeaningfulMomentsGathering = [v11 countForObject:@"Gathering"];
        self->_numberOfMeaningfulMomentsActivity = [v11 countForObject:@"Activity"];
        self->_numberOfMeaningfulMomentsActivityBeach = [v11 countForObject:@"Beaching"];
        self->_numberOfMeaningfulMomentsActivityDiving = [v11 countForObject:@"Diving"];
        self->_numberOfMeaningfulMomentsActivityHiking = [v11 countForObject:@"Hiking"];
        self->_numberOfMeaningfulMomentsActivityWinterSport = [v11 countForObject:@"WinterSport"];
        self->_numberOfMeaningfulMomentsEntertainment = [v11 countForObject:@"Entertainment"];
        self->_numberOfMeaningfulMomentsEntertainmentNightOut = [v11 countForObject:@"NightOut"];
        self->_numberOfMeaningfulMomentsEntertainmentPerformance = [v11 countForObject:@"Performance"];
        self->_numberOfMeaningfulMomentsEntertainmentSportEvent = [v11 countForObject:@"SportEvent"];
        self->_numberOfMeaningfulMomentsEntertainmentConcert = [v11 countForObject:@"Concert"];
        self->_numberOfMeaningfulMomentsEntertainmentDance = [v11 countForObject:@"Dance"];
        self->_numberOfMeaningfulMomentsEntertainmentAmusementPark = [v11 countForObject:@"AmusementPark"];
        self->_numberOfMeaningfulMomentsEntertainmentFestival = [v11 countForObject:@"Festival"];
        self->_numberOfMeaningfulMomentsEntertainmentMuseum = [v11 countForObject:@"Museum"];
        self->_numberOfMeaningfulMomentsEntertainmentTheater = [v11 countForObject:@"Theater"];
        self->_numberOfMeaningfulMomentsCelebration = [v11 countForObject:@"Celebration"];
        self->_numberOfMeaningfulMomentsCelebrationAnniversary = [v11 countForObject:@"Anniversary"];
        self->_numberOfMeaningfulMomentsCelebrationBirthday = [v11 countForObject:@"Birthday"];
        self->_numberOfMeaningfulMomentsCelebrationHolidayEvent = [v11 countForObject:@"HolidayEvent"];
        self->_numberOfMeaningfulMomentsCelebrationWedding = [v11 countForObject:@"Wedding"];
        self->_numberOfMeaningfulMomentsRestaurant = [v11 countForObject:@"Restaurant"];
        self->_numberOfMeaningfulMomentsRestaurantBreakfast = [v11 countForObject:@"Breakfast"];
        self->_numberOfMeaningfulMomentsRestaurantLunch = [v11 countForObject:@"Lunch"];
        self->_numberOfMeaningfulMomentsRestaurantDinner = [v11 countForObject:@"Dinner"];
        unint64_t v16 = [v10 count];
        self->_numberOfMeaningfulMoments = v16;
        unint64_t numberOfMoments = self->_numberOfMoments;
        if (numberOfMoments) {
          double v18 = (double)v16 / (double)numberOfMoments;
        }
        else {
          double v18 = *(double *)&PGMetricsUnavailableDoubleValue;
        }
        self->_ratioOfMeaningfulMoments = v18;
        if (![v9 isCancelledWithProgress:1.0]
          || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          goto LABEL_20;
        }
        int v19 = 67109378;
        int v20 = 373;
        __int16 v21 = 2080;
        id v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/"
              "MetricEvents/PGGraphStatisticsMetricEvent.m";
        id v13 = MEMORY[0x1E4F14500];
        goto LABEL_19;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        int v19 = 67109378;
        int v20 = 333;
        __int16 v21 = 2080;
        id v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/"
              "MetricEvents/PGGraphStatisticsMetricEvent.m";
        id v13 = MEMORY[0x1E4F14500];
        goto LABEL_19;
      }
    }
LABEL_20:

LABEL_21:
    goto LABEL_22;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v19 = 67109378;
    int v20 = 323;
    __int16 v21 = 2080;
    id v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGGraphStatisticsMetricEvent.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v19, 0x12u);
  }
LABEL_22:
}

- (void)_fillMomentStatisticsWithGraph:(id)a3 progressReporter:(id)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = (void *)MEMORY[0x1D25FED50]();
  id v9 = v7;
  uint64_t v50 = 0;
  uint64_t v51 = &v50;
  uint64_t v52 = 0x2020000000;
  char v53 = 0;
  int v10 = [v9 isCancelledWithProgress:0.0];
  *((unsigned char *)v51 + 24) = v10;
  if (!v10)
  {
    id v11 = [v6 momentNodes];
    self->_unint64_t numberOfMoments = [v11 count];
    if (*((unsigned char *)v51 + 24))
    {
      *((unsigned char *)v51 + 24) = 1;
      goto LABEL_7;
    }
    char v12 = [v9 isCancelledWithProgress:0.2];
    *((unsigned char *)v51 + 24) = v12;
    if (v12)
    {
LABEL_7:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&uint8_t buf[4] = 255;
        LOWORD(v59) = 2080;
        *(void *)((char *)&v59 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Phot"
                                        "osGraph/Framework/Metrics/MetricEvents/PGGraphStatisticsMetricEvent.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      goto LABEL_24;
    }
    id v13 = [v6 meNodeCollection];
    if (*((unsigned char *)v51 + 24))
    {
      *((unsigned char *)v51 + 24) = 1;
      goto LABEL_12;
    }
    char v14 = [v9 isCancelledWithProgress:0.4];
    *((unsigned char *)v51 + 24) = v14;
    if (v14)
    {
LABEL_12:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&uint8_t buf[4] = 258;
        LOWORD(v59) = 2080;
        *(void *)((char *)&v59 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Phot"
                                        "osGraph/Framework/Metrics/MetricEvents/PGGraphStatisticsMetricEvent.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      goto LABEL_23;
    }
    *(void *)buf = 0;
    *(void *)&long long v59 = buf;
    *((void *)&v59 + 1) = 0x2020000000;
    uint64_t v60 = 0;
    uint64_t v46 = 0;
    v47 = &v46;
    uint64_t v48 = 0x2020000000;
    uint64_t v49 = 0;
    uint64_t v42 = 0;
    uint64_t v43 = &v42;
    uint64_t v44 = 0x2020000000;
    uint64_t v45 = 0;
    uint64_t v38 = 0;
    uint64_t v39 = &v38;
    uint64_t v40 = 0x2020000000;
    uint64_t v41 = 0;
    uint64_t v34 = 0;
    long long v35 = &v34;
    uint64_t v36 = 0x2020000000;
    uint64_t v37 = 0;
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    char v24 = __80__PGGraphStatisticsMetricEvent__fillMomentStatisticsWithGraph_progressReporter___block_invoke;
    unint64_t v25 = &unk_1E68F17D8;
    uint64_t v28 = buf;
    id v26 = v13;
    char v29 = &v46;
    uint64_t v30 = &v42;
    int v31 = &v38;
    __int16 v32 = &v34;
    uint64_t v33 = &v50;
    id v15 = v9;
    id v27 = v15;
    [v11 enumerateNodesUsingBlock:&v22];
    self->_numberOfMomentsWithAtLeastOneGemAsset = *(void *)(v59 + 24);
    unint64_t v16 = v47;
    self->_numberOfMomentsAtMyHome = v47[3];
    char v17 = v43;
    self->_numberOfMomentsAtMyWork = v43[3];
    double v18 = v35;
    self->_numberOfMomentsInTrip = v35[3];
    unint64_t numberOfMoments = self->_numberOfMoments;
    if (numberOfMoments)
    {
      self->_ratioOfMomentsWithAtLeastOneGemAsset = (double)self->_numberOfMomentsWithAtLeastOneGemAsset
                                                  / (double)numberOfMoments;
      self->_ratioOfMomentsAtMyHome = (double)(unint64_t)v16[3] / (double)numberOfMoments;
      self->_ratioOfMomentsAtMyWork = (double)(unint64_t)v17[3] / (double)numberOfMoments;
      self->_ratioOfMomentsAtAFrequentLocation = (double)(unint64_t)v39[3] / (double)numberOfMoments;
      double v20 = (double)(unint64_t)v18[3] / (double)numberOfMoments;
    }
    else
    {
      *(void *)&self->_ratioOfMomentsWithAtLeastOneGemAsset = PGMetricsUnavailableDoubleValue;
      *(void *)&self->_ratioOfMomentsAtMyHome = PGMetricsUnavailableDoubleValue;
      *(void *)&self->_ratioOfMomentsAtMyWork = PGMetricsUnavailableDoubleValue;
      *(void *)&self->_ratioOfMomentsAtAFrequentLocation = PGMetricsUnavailableDoubleValue;
      double v20 = *(double *)&PGMetricsUnavailableDoubleValue;
    }
    self->_ratioOfMomentsInTrip = v20;
    if (*((unsigned char *)v51 + 24))
    {
      *((unsigned char *)v51 + 24) = 1;
    }
    else
    {
      char v21 = objc_msgSend(v15, "isCancelledWithProgress:", 1.0, v22, v23, v24, v25, v26);
      *((unsigned char *)v51 + 24) = v21;
      if ((v21 & 1) == 0)
      {
LABEL_22:

        _Block_object_dispose(&v34, 8);
        _Block_object_dispose(&v38, 8);
        _Block_object_dispose(&v42, 8);
        _Block_object_dispose(&v46, 8);
        _Block_object_dispose(buf, 8);
LABEL_23:

LABEL_24:
        goto LABEL_25;
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long v54 = 67109378;
      int v55 = 316;
      __int16 v56 = 2080;
      v57 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Me"
            "tricEvents/PGGraphStatisticsMetricEvent.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v54, 0x12u);
    }
    goto LABEL_22;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&uint8_t buf[4] = 251;
    LOWORD(v59) = 2080;
    *(void *)((char *)&v59 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Metrics/MetricEvents/PGGraphStatisticsMetricEvent.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_25:
  _Block_object_dispose(&v50, 8);
}

void __80__PGGraphStatisticsMetricEvent__fillMomentStatisticsWithGraph_progressReporter___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 numberOfShinyGemAssets];
  if (v3 + [v6 numberOfRegularGemAssets]) {
    ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
  if ([v6 happensPartiallyAtHomeOfPersonNodes:*(void *)(a1 + 32)]) {
    ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  }
  if ([v6 happensPartiallyAtWorkOfPersonNodes:*(void *)(a1 + 32)]) {
    ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  }
  if ([v6 happensAtFrequentLocation]) {
    ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  }
  if ([v6 isPartOfTrip]) {
    ++*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 88) + 8);
  if (*(unsigned char *)(v4 + 24))
  {
    char v5 = 1;
  }
  else
  {
    char v5 = [*(id *)(a1 + 40) isCancelledWithProgress:0.8];
    uint64_t v4 = *(void *)(*(void *)(a1 + 88) + 8);
  }
  *(unsigned char *)(v4 + 24) = v5;
}

- (void)_fillGenericStatisticsWithGraph:(id)a3
{
  id v4 = a3;
  id v9 = [v4 infoNode];
  self->_unint64_t librarySize = [v9 numberOfAssets];
  int64_t v5 = [v4 librarySizeRange];

  self->_librarySizeRange = v5;
  unint64_t v6 = [v9 numberOfSelfies];
  self->_numberOfSelfies = v6;
  unint64_t librarySize = self->_librarySize;
  if (librarySize) {
    double v8 = (double)v6 / (double)librarySize;
  }
  else {
    double v8 = *(double *)&PGMetricsUnavailableDoubleValue;
  }
  self->_ratioOfSelfies = v8;
}

- (void)gatherMetricsWithProgressBlock:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(PGManager *)self->_manager enrichmentLoggingConnection];
  manager = self->_manager;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__PGGraphStatisticsMetricEvent_gatherMetricsWithProgressBlock___block_invoke;
  v9[3] = &unk_1E68F17B0;
  id v11 = self;
  id v12 = v4;
  id v10 = v5;
  id v7 = v5;
  id v8 = v4;
  [(PGManager *)manager performSynchronousConcurrentGraphReadUsingBlock:v9];
}

void __63__PGGraphStatisticsMetricEvent_gatherMetricsWithProgressBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F71F08] progressReporterWithProgressBlock:*(void *)(a1 + 48)];
  if (![v4 isCancelledWithProgress:0.0])
  {
    int64_t v5 = [v3 graph];
    unint64_t v6 = *(id *)(a1 + 32);
    os_signpost_id_t v7 = os_signpost_id_generate(v6);
    id v8 = v6;
    id v9 = v8;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "GraphStatisticsMetrics", "", buf, 2u);
    }

    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    uint64_t v10 = mach_absolute_time();
    [*(id *)(a1 + 40) _fillGenericStatisticsWithGraph:v5];
    if ([v4 isCancelledWithProgress:0.1])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)int v31 = 174;
        *(_WORD *)&v31[4] = 2080;
        *(void *)&v31[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Metrics/MetricEvents/PGGraphStatisticsMetricEvent.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      goto LABEL_56;
    }
    id v11 = [v4 childProgressReporterFromStart:0.11 toEnd:0.19];
    [*(id *)(a1 + 40) _fillMomentStatisticsWithGraph:v5 progressReporter:v11];
    if ([v4 isCancelledWithProgress:0.2])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)int v31 = 179;
        *(_WORD *)&v31[4] = 2080;
        *(void *)&v31[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Metrics/MetricEvents/PGGraphStatisticsMetricEvent.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      goto LABEL_55;
    }
    id v12 = [v4 childProgressReporterFromStart:0.21 toEnd:0.29];
    [*(id *)(a1 + 40) _fillBusinessStatisticsWithGraph:v5 progressReporter:v12];
    if ([v4 isCancelledWithProgress:0.3])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)int v31 = 184;
        *(_WORD *)&v31[4] = 2080;
        *(void *)&v31[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Metrics/MetricEvents/PGGraphStatisticsMetricEvent.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      goto LABEL_54;
    }
    uint64_t v28 = [v4 childProgressReporterFromStart:0.31 toEnd:0.39];
    objc_msgSend(*(id *)(a1 + 40), "_fillMeaningfulEventsStatisticsWithGraph:progressReporter:", v5);
    if ([v4 isCancelledWithProgress:0.4])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)int v31 = 189;
        *(_WORD *)&v31[4] = 2080;
        *(void *)&v31[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Metrics/MetricEvents/PGGraphStatisticsMetricEvent.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      goto LABEL_53;
    }
    id v27 = [v4 childProgressReporterFromStart:0.41 toEnd:0.49];
    objc_msgSend(*(id *)(a1 + 40), "_fillPublicEventStatisticsWithGraph:progressReporter:", v5);
    if ([v4 isCancelledWithProgress:0.5])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)int v31 = 194;
        *(_WORD *)&v31[4] = 2080;
        *(void *)&v31[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Metrics/MetricEvents/PGGraphStatisticsMetricEvent.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      goto LABEL_52;
    }
    id v26 = [v4 childProgressReporterFromStart:0.51 toEnd:0.59];
    objc_msgSend(*(id *)(a1 + 40), "_fillPeopleStatisticsWithGraph:progressReporter:", v5);
    if ([v4 isCancelledWithProgress:0.6])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)int v31 = 199;
        *(_WORD *)&v31[4] = 2080;
        *(void *)&v31[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Metrics/MetricEvents/PGGraphStatisticsMetricEvent.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      goto LABEL_51;
    }
    unint64_t v25 = [v4 childProgressReporterFromStart:0.61 toEnd:0.69];
    objc_msgSend(*(id *)(a1 + 40), "_fillTripStatisticsWithGraph:progressReporter:", v5);
    if ([v4 isCancelledWithProgress:0.7])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)int v31 = 204;
        *(_WORD *)&v31[4] = 2080;
        *(void *)&v31[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Metrics/MetricEvents/PGGraphStatisticsMetricEvent.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      goto LABEL_50;
    }
    char v24 = [v4 childProgressReporterFromStart:0.71 toEnd:0.79];
    objc_msgSend(*(id *)(a1 + 40), "_fillHolidaysStatisticsWithGraph:progressReporter:", v5);
    if ([v4 isCancelledWithProgress:0.8])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)int v31 = 209;
        *(_WORD *)&v31[4] = 2080;
        *(void *)&v31[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Metrics/MetricEvents/PGGraphStatisticsMetricEvent.m";
        id v13 = MEMORY[0x1E4F14500];
LABEL_34:
        _os_log_impl(&dword_1D1805000, v13, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        goto LABEL_49;
      }
      goto LABEL_49;
    }
    [*(id *)(a1 + 40) _fillPetStatisticsWithGraph:v5];
    [*(id *)(a1 + 40) _fillHomeWorkStatisticsWithGraph:v5];
    if ([v4 isCancelledWithProgress:0.9])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)int v31 = 216;
        *(_WORD *)&v31[4] = 2080;
        *(void *)&v31[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Metrics/MetricEvents/PGGraphStatisticsMetricEvent.m";
        id v13 = MEMORY[0x1E4F14500];
        goto LABEL_34;
      }
LABEL_49:

LABEL_50:
LABEL_51:

LABEL_52:
LABEL_53:

LABEL_54:
LABEL_55:

LABEL_56:
      goto LABEL_57;
    }
    uint64_t v23 = [v4 childProgressReporterFromStart:0.91 toEnd:0.94];
    objc_msgSend(*(id *)(a1 + 40), "_fillMusicStatisticsWithGraph:progressReporter:", v5);
    if ([v4 isCancelledWithProgress:0.95])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)int v31 = 221;
        *(_WORD *)&v31[4] = 2080;
        *(void *)&v31[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Metrics/MetricEvents/PGGraphStatisticsMetricEvent.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      goto LABEL_48;
    }
    uint64_t v22 = [v4 childProgressReporterFromStart:0.95 toEnd:0.99];
    objc_msgSend(*(id *)(a1 + 40), "_fillFrequentLocationsStatisticsWithGraph:progressReporter:", v5);
    if ([v4 isCancelledWithProgress:1.0])
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
LABEL_47:

LABEL_48:
        goto LABEL_49;
      }
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)int v31 = 226;
      *(_WORD *)&v31[4] = 2080;
      *(void *)&v31[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Metrics/MetricEvents/PGGraphStatisticsMetricEvent.m";
      char v14 = MEMORY[0x1E4F14500];
      id v15 = "Cancelled at line %d in file %s";
      uint32_t v16 = 18;
    }
    else
    {
      uint64_t v21 = mach_absolute_time();
      uint32_t numer = info.numer;
      uint32_t denom = info.denom;
      int v19 = v9;
      double v20 = v19;
      if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v20, OS_SIGNPOST_INTERVAL_END, v7, "GraphStatisticsMetrics", "", buf, 2u);
      }

      if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO)) {
        goto LABEL_47;
      }
      *(_DWORD *)buf = 136315394;
      *(void *)int v31 = "GraphStatisticsMetrics";
      *(_WORD *)&v31[8] = 2048;
      *(double *)&v31[10] = (float)((float)((float)((float)(v21 - v10) * (float)numer) / (float)denom) / 1000000.0);
      id v15 = "[Performance] %s: %f ms";
      char v14 = v20;
      uint32_t v16 = 22;
    }
    _os_log_impl(&dword_1D1805000, v14, OS_LOG_TYPE_INFO, v15, buf, v16);
    goto LABEL_47;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)int v31 = 166;
    *(_WORD *)&v31[4] = 2080;
    *(void *)&v31[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Metrics/MetricEvents/PGGraphStatisticsMetricEvent.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_57:
}

- (BOOL)shouldReportMetrics
{
  return [(PGManager *)self->_manager isReady];
}

- (id)identifier
{
  return @"com.apple.Photos.Intelligence.GraphStatistics";
}

- (PGGraphStatisticsMetricEvent)initWithGraphManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphStatisticsMetricEvent;
  unint64_t v6 = [(PGGraphStatisticsMetricEvent *)&v9 init];
  os_signpost_id_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_manager, a3);
  }

  return v7;
}

@end