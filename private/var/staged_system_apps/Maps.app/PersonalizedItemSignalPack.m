@interface PersonalizedItemSignalPack
- (BOOL)hasValueForFeatureType:(int64_t)a3;
- (NSMutableDictionary)signalScalarValuesByFeatureType;
- (PersonalizedItemSignalPack)init;
- (PersonalizedItemSignalPack)initWithItem:(id)a3 suggestionEntry:(id)a4;
- (double)valueForFeatureType:(int64_t)a3;
- (int)itemServerEntryTypeSource;
- (int)itemSuggestionTypeSource;
- (void)setBooleanValue:(BOOL)a3 forFeatureType:(int64_t)a4;
- (void)setItemServerEntryTypeSource:(int)a3;
- (void)setItemSuggestionTypeSource:(int)a3;
- (void)setScalarValue:(double)a3 forFeatureType:(int64_t)a4;
@end

@implementation PersonalizedItemSignalPack

- (PersonalizedItemSignalPack)init
{
  v6.receiver = self;
  v6.super_class = (Class)PersonalizedItemSignalPack;
  v2 = [(PersonalizedItemSignalPack *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    signalScalarValuesByFeatureType = v2->_signalScalarValuesByFeatureType;
    v2->_signalScalarValuesByFeatureType = (NSMutableDictionary *)v3;

    v2->_itemSuggestionTypeSource = 0;
  }
  return v2;
}

- (PersonalizedItemSignalPack)initWithItem:(id)a3 suggestionEntry:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(PersonalizedItemSignalPack *)self init];

  if (v8)
  {
    -[PersonalizedItemSignalPack setItemSuggestionTypeSource:](v8, "setItemSuggestionTypeSource:", [v7 suggestionType]);
    -[PersonalizedItemSignalPack setItemServerEntryTypeSource:](v8, "setItemServerEntryTypeSource:", [v7 serverEntryType]);
    if ([v7 hasShownToUser]) {
      -[PersonalizedItemSignalPack setBooleanValue:forFeatureType:](v8, "setBooleanValue:forFeatureType:", [v7 shownToUser], 1);
    }
    if ([v7 hasFractionOfMatch])
    {
      [v7 fractionOfMatch];
      -[PersonalizedItemSignalPack setScalarValue:forFeatureType:](v8, "setScalarValue:forFeatureType:", 2);
    }
    if ([v7 hasDistanceToSuggestion]) {
      -[PersonalizedItemSignalPack setScalarValue:forFeatureType:](v8, "setScalarValue:forFeatureType:", 3, (float)(int)[v7 distanceToSuggestion]);
    }
    if ([v7 hasContactRelevanceScore])
    {
      [v7 contactRelevanceScore];
      -[PersonalizedItemSignalPack setScalarValue:forFeatureType:](v8, "setScalarValue:forFeatureType:", 4);
    }
    if ([v7 hasMatchedUsingName]) {
      -[PersonalizedItemSignalPack setBooleanValue:forFeatureType:](v8, "setBooleanValue:forFeatureType:", [v7 matchedUsingName], 5);
    }
    if ([v7 hasMatchedUsingOrganization]) {
      -[PersonalizedItemSignalPack setBooleanValue:forFeatureType:](v8, "setBooleanValue:forFeatureType:", [v7 matchedUsingOrganization], 6);
    }
    if ([v7 hasMatchedUsingAddress]) {
      -[PersonalizedItemSignalPack setBooleanValue:forFeatureType:](v8, "setBooleanValue:forFeatureType:", [v7 matchedUsingAddress], 7);
    }
    if ([v7 hasMatchedUsingLabel]) {
      -[PersonalizedItemSignalPack setBooleanValue:forFeatureType:](v8, "setBooleanValue:forFeatureType:", [v7 matchedUsingLabel], 8);
    }
    if ([v7 hasMatchedUsingEventName]) {
      -[PersonalizedItemSignalPack setBooleanValue:forFeatureType:](v8, "setBooleanValue:forFeatureType:", [v7 matchedUsingEventName], 9);
    }
    if ([v7 hasPeopleSuggesterRank]) {
      -[PersonalizedItemSignalPack setScalarValue:forFeatureType:](v8, "setScalarValue:forFeatureType:", 10, (double)(int)[v7 peopleSuggesterRank]);
    }
    if ([v7 hasAge]) {
      -[PersonalizedItemSignalPack setScalarValue:forFeatureType:](v8, "setScalarValue:forFeatureType:", 11, (double)(int)[v7 age]);
    }
    if ([v7 hasIsFavorite]) {
      -[PersonalizedItemSignalPack setBooleanValue:forFeatureType:](v8, "setBooleanValue:forFeatureType:", [v7 isFavorite], 12);
    }
    if ([v7 hasPoiOpenState])
    {
      unsigned int v9 = [v7 poiOpenState];
      if (v9 <= 4 && ((0x1Bu >> v9) & 1) != 0) {
        [(PersonalizedItemSignalPack *)v8 setBooleanValue:1 forFeatureType:qword_100F6F570[v9]];
      }
    }
    if ([v7 hasMapsSuggestionsContactRevelanceScore])
    {
      [v7 mapsSuggestionsContactRevelanceScore];
      -[PersonalizedItemSignalPack setScalarValue:forFeatureType:](v8, "setScalarValue:forFeatureType:", 17);
    }
    if ([v7 hasMapsSuggestionsPoiRevelanceScore])
    {
      [v7 mapsSuggestionsPoiRevelanceScore];
      -[PersonalizedItemSignalPack setScalarValue:forFeatureType:](v8, "setScalarValue:forFeatureType:", 18);
    }
    if ([v7 hasMapsSuggestionsIsTouristScore])
    {
      [v7 mapsSuggestionsIsTouristScore];
      -[PersonalizedItemSignalPack setScalarValue:forFeatureType:](v8, "setScalarValue:forFeatureType:", 19);
    }
    if ([v7 hasTimeSinceLastInteractedSeconds])
    {
      [v7 timeSinceLastInteractedSeconds];
      -[PersonalizedItemSignalPack setScalarValue:forFeatureType:](v8, "setScalarValue:forFeatureType:", 20);
    }
    if ([v7 hasDistanceToSuggestionFromViewportCenter])
    {
      [v7 distanceToSuggestionFromViewportCenter];
      -[PersonalizedItemSignalPack setScalarValue:forFeatureType:](v8, "setScalarValue:forFeatureType:", 21);
    }
    if ([v7 hasIsContainedInViewport]) {
      -[PersonalizedItemSignalPack setBooleanValue:forFeatureType:](v8, "setBooleanValue:forFeatureType:", [v7 isContainedInViewport], 22);
    }
    if ([v7 hasTimeSinceMapViewportChangedSeconds])
    {
      [v7 timeSinceMapViewportChangedSeconds];
      -[PersonalizedItemSignalPack setScalarValue:forFeatureType:](v8, "setScalarValue:forFeatureType:", 23);
    }
    if ([v7 hasIsContactWithHomeLocation]) {
      -[PersonalizedItemSignalPack setBooleanValue:forFeatureType:](v8, "setBooleanValue:forFeatureType:", [v7 isContactWithHomeLocation], 24);
    }
    if ([v7 hasIsContactWithWorkLocation]) {
      -[PersonalizedItemSignalPack setBooleanValue:forFeatureType:](v8, "setBooleanValue:forFeatureType:", [v7 isContactWithWorkLocation], 25);
    }
    if ([v7 hasIsContactWithSchoolLocation]) {
      -[PersonalizedItemSignalPack setBooleanValue:forFeatureType:](v8, "setBooleanValue:forFeatureType:", [v7 isContactWithSchoolLocation], 26);
    }
    if ([v7 hasIsContactWithOtherLocation]) {
      -[PersonalizedItemSignalPack setBooleanValue:forFeatureType:](v8, "setBooleanValue:forFeatureType:", [v7 isContactWithOtherLocation], 27);
    }
    if ([v7 hasIsContactWithLiveLocation]) {
      -[PersonalizedItemSignalPack setBooleanValue:forFeatureType:](v8, "setBooleanValue:forFeatureType:", [v7 isContactWithLiveLocation], 28);
    }
    if ([v7 hasPrefixLastTokenMatchCover])
    {
      [v7 prefixLastTokenMatchCover];
      [(PersonalizedItemSignalPack *)v8 setScalarValue:30 forFeatureType:v10];
    }
    if ([v7 hasPrefixMatchCover])
    {
      [v7 prefixMatchCover];
      [(PersonalizedItemSignalPack *)v8 setScalarValue:31 forFeatureType:v11];
    }
    if ([v7 hasPrefixMatchPosition]) {
      -[PersonalizedItemSignalPack setScalarValue:forFeatureType:](v8, "setScalarValue:forFeatureType:", 32, (double)(int)[v7 prefixMatchPosition]);
    }
    if ([v7 hasPrefixMatchWordBoundary]) {
      -[PersonalizedItemSignalPack setScalarValue:forFeatureType:](v8, "setScalarValue:forFeatureType:", 33, (double)(int)[v7 prefixMatchWordBoundary]);
    }
    if ([v7 hasPrefixTokenMatchLengthFirstQueryToken]) {
      -[PersonalizedItemSignalPack setScalarValue:forFeatureType:](v8, "setScalarValue:forFeatureType:", 34, (double)(int)[v7 prefixTokenMatchLengthFirstQueryToken]);
    }
    if ([v7 hasPrefixTokenMatchPositionFirstQueryToken]) {
      -[PersonalizedItemSignalPack setScalarValue:forFeatureType:](v8, "setScalarValue:forFeatureType:", 35, (double)(int)[v7 prefixTokenMatchPositionFirstQueryToken]);
    }
    if ([v7 hasPrefixTokenIsNumberFirstQueryToken]) {
      -[PersonalizedItemSignalPack setBooleanValue:forFeatureType:](v8, "setBooleanValue:forFeatureType:", [v7 prefixTokenIsNumberFirstQueryToken], 36);
    }
    if ([v7 hasPrefixTokenMatchLocationFirstQueryToken]) {
      -[PersonalizedItemSignalPack setScalarValue:forFeatureType:](v8, "setScalarValue:forFeatureType:", 37, (double)(int)[v7 prefixTokenMatchLocationFirstQueryToken]);
    }
    if ([v7 hasPrefixTokenMatchLengthSecondQueryToken]) {
      -[PersonalizedItemSignalPack setScalarValue:forFeatureType:](v8, "setScalarValue:forFeatureType:", 38, (double)(int)[v7 prefixTokenMatchLengthSecondQueryToken]);
    }
    if ([v7 hasPrefixTokenMatchPositionSecondQueryToken]) {
      -[PersonalizedItemSignalPack setScalarValue:forFeatureType:](v8, "setScalarValue:forFeatureType:", 39, (double)(int)[v7 prefixTokenMatchPositionSecondQueryToken]);
    }
    if ([v7 hasPrefixTokenIsNumberSecondQueryToken]) {
      -[PersonalizedItemSignalPack setBooleanValue:forFeatureType:](v8, "setBooleanValue:forFeatureType:", [v7 hasPrefixTokenIsNumberSecondQueryToken], 40);
    }
    if ([v7 hasPrefixTokenMatchLocationSecondQueryToken]) {
      -[PersonalizedItemSignalPack setScalarValue:forFeatureType:](v8, "setScalarValue:forFeatureType:", 41, (double)(int)[v7 prefixTokenMatchLocationSecondQueryToken]);
    }
  }
  v12 = v8;

  return v12;
}

- (void)setScalarValue:(double)a3 forFeatureType:(int64_t)a4
{
  if (a4)
  {
    id v8 = +[NSNumber numberWithDouble:a3];
    id v6 = [(PersonalizedItemSignalPack *)self signalScalarValuesByFeatureType];
    id v7 = +[NSNumber numberWithInteger:a4];
    [v6 setObject:v8 forKeyedSubscript:v7];
  }
}

- (void)setBooleanValue:(BOOL)a3 forFeatureType:(int64_t)a4
{
  double v4 = 0.0;
  if (a3) {
    double v4 = 1.0;
  }
  [(PersonalizedItemSignalPack *)self setScalarValue:a4 forFeatureType:v4];
}

- (BOOL)hasValueForFeatureType:(int64_t)a3
{
  int64_t v3 = a3;
  if (a3)
  {
    double v4 = [(PersonalizedItemSignalPack *)self signalScalarValuesByFeatureType];
    v5 = +[NSNumber numberWithInteger:v3];
    id v6 = [v4 objectForKeyedSubscript:v5];
    LOBYTE(v3) = v6 != 0;
  }
  return v3;
}

- (double)valueForFeatureType:(int64_t)a3
{
  if (!a3) {
    return 0.0;
  }
  double v4 = [(PersonalizedItemSignalPack *)self signalScalarValuesByFeatureType];
  v5 = +[NSNumber numberWithInteger:a3];
  id v6 = [v4 objectForKeyedSubscript:v5];
  [v6 doubleValue];
  double v8 = v7;

  return v8;
}

- (int)itemSuggestionTypeSource
{
  return self->_itemSuggestionTypeSource;
}

- (void)setItemSuggestionTypeSource:(int)a3
{
  self->_itemSuggestionTypeSource = a3;
}

- (int)itemServerEntryTypeSource
{
  return self->_itemServerEntryTypeSource;
}

- (void)setItemServerEntryTypeSource:(int)a3
{
  self->_itemServerEntryTypeSource = a3;
}

- (NSMutableDictionary)signalScalarValuesByFeatureType
{
  return self->_signalScalarValuesByFeatureType;
}

- (void).cxx_destruct
{
}

@end