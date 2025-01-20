@interface NTPBTodaySectionIdentifierToGroupTypes
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)personalizationSectionIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)groupTypesAsString:(int)a3;
- (int)StringAsGroupTypes:(id)a3;
- (int)groupTypes;
- (int)groupTypesAtIndex:(unint64_t)a3;
- (unint64_t)groupTypesCount;
- (unint64_t)hash;
- (void)addGroupTypes:(int)a3;
- (void)clearGroupTypes;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setGroupTypes:(int *)a3 count:(unint64_t)a4;
- (void)setPersonalizationSectionIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBTodaySectionIdentifierToGroupTypes

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)NTPBTodaySectionIdentifierToGroupTypes;
  [(NTPBTodaySectionIdentifierToGroupTypes *)&v3 dealloc];
}

- (unint64_t)groupTypesCount
{
  return self->_groupTypes.count;
}

- (int)groupTypes
{
  return self->_groupTypes.list;
}

- (void)clearGroupTypes
{
}

- (void)addGroupTypes:(int)a3
{
}

- (int)groupTypesAtIndex:(unint64_t)a3
{
  p_groupTypes = &self->_groupTypes;
  unint64_t count = self->_groupTypes.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_groupTypes->list[a3];
}

- (void)setGroupTypes:(int *)a3 count:(unint64_t)a4
{
}

- (id)groupTypesAsString:(int)a3
{
  if (a3 >= 0x28)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    objc_super v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_super v3 = off_26444EE18[a3];
  }

  return v3;
}

- (int)StringAsGroupTypes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_GROUP_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TOP_STORIES_GROUP_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"TRENDING_STORIES_GROUP_TYPE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"LATEST_STORIES_GROUP_TYPE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"TOPIC_ARTICLES_GROUP_TYPE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"EDITORS_PICKS_GROUP_TYPE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"MORE_FROM_TOPIC_GROUP_TYPE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"CHANNEL_ARTICLES_GROUP_TYPE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"DAILY_BRIEFINGS_GROUP_TYPE"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"GREAT_STORIES_YOU_MISSED_GROUP_TYPE"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"SAVED_STORIES_GROUP_TYPE"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"MORE_FOR_YOU_GROUP_TYPE"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"PAID_SUBSCRIPTION_GROUP_TYPE"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"LATEST_AND_GREATEST_GROUP_TYPE"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"SUGGESTED_TOPICS_GROUP_TYPE"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"FEATURED_STORIES_GROUP_TYPE"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"TOP_VIDEOS_GROUP_TYPE"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"MORE_VIDEOS_GROUP_TYPE"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"SYMBOL_GROUP_TYPE"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"RECIRCULATION_GROUP_TYPE"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"MORE_FROM_PUB_GROUP_TYPE"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"RELATED_GROUP_TYPE"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"MY_MAGAZINES_GROUP_TYPE"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"FEATURED_ISSUE_GROUP_TYPE"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"ISSUES_GROUP_TYPE"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"FEATURED_ARTICLE_GROUP_TYPE"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"FEATURED_ISSUE_ARTICLE_GROUP_TYPE"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"RECOMMENDED_ISSUES_GROUP_TYPE"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"NEW_ISSUE_GROUP_TYPE"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"SPOTLIGHT_GROUP_TYPE"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"ARTICLE_LIST_GROUP_TYPE"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"ORDERED_ARTICLE_LIST_GROUP_TYPE"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"BEST_OF_BUNDLE_GROUP_TYPE"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"CURATED_GROUP_TYPE"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"NEWSPAPER_GROUP_TYPE"])
  {
    int v4 = 34;
  }
  else if ([v3 isEqualToString:@"LOCAL_NEWS_GROUP_TYPE"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"AUDIO_UP_NEXT_GROUP_TYPE"])
  {
    int v4 = 36;
  }
  else if ([v3 isEqualToString:@"AUDIO_FOR_YOU_GROUP_TYPE"])
  {
    int v4 = 37;
  }
  else if ([v3 isEqualToString:@"AUDIO_RECENTLY_PLAYED_GROUP_TYPE"])
  {
    int v4 = 38;
  }
  else if ([v3 isEqualToString:@"AUDIO_DAILY_BRIEFING_GROUP_TYPE"])
  {
    int v4 = 39;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBTodaySectionIdentifierToGroupTypes;
  int v4 = [(NTPBTodaySectionIdentifierToGroupTypes *)&v8 description];
  v5 = [(NTPBTodaySectionIdentifierToGroupTypes *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  int v4 = v3;
  personalizationSectionIdentifier = self->_personalizationSectionIdentifier;
  if (personalizationSectionIdentifier) {
    [v3 setObject:personalizationSectionIdentifier forKey:@"personalization_section_identifier"];
  }
  p_groupTypes = &self->_groupTypes;
  if (self->_groupTypes.count)
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:");
    if (p_groupTypes->count)
    {
      unint64_t v8 = 0;
      do
      {
        uint64_t v9 = p_groupTypes->list[v8];
        if (v9 >= 0x28)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", p_groupTypes->list[v8]);
          v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v10 = off_26444EE18[v9];
        }
        [v7 addObject:v10];

        ++v8;
      }
      while (v8 < p_groupTypes->count);
    }
    [v4 setObject:v7 forKey:@"group_types"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBTodaySectionIdentifierToGroupTypesReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  PBDataWriterWriteStringField();
  p_groupTypes = &self->_groupTypes;
  if (p_groupTypes->count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v5;
    }
    while (v5 < p_groupTypes->count);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_personalizationSectionIdentifier copyWithZone:a3];
  uint64_t v7 = (void *)v5[4];
  v5[4] = v6;

  PBRepeatedInt32Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((personalizationSectionIdentifier = self->_personalizationSectionIdentifier,
         !((unint64_t)personalizationSectionIdentifier | v4[4]))
     || -[NSString isEqual:](personalizationSectionIdentifier, "isEqual:")))
  {
    char IsEqual = PBRepeatedInt32IsEqual();
  }
  else
  {
    char IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  NSUInteger v2 = [(NSString *)self->_personalizationSectionIdentifier hash];
  return PBRepeatedInt32Hash() ^ v2;
}

- (void)mergeFrom:(id)a3
{
  int v4 = a3;
  unint64_t v8 = v4;
  if (v4[4])
  {
    -[NTPBTodaySectionIdentifierToGroupTypes setPersonalizationSectionIdentifier:](self, "setPersonalizationSectionIdentifier:");
    int v4 = v8;
  }
  uint64_t v5 = [v4 groupTypesCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[NTPBTodaySectionIdentifierToGroupTypes addGroupTypes:](self, "addGroupTypes:", [v8 groupTypesAtIndex:i]);
  }
}

- (NSString)personalizationSectionIdentifier
{
  return self->_personalizationSectionIdentifier;
}

- (void)setPersonalizationSectionIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end