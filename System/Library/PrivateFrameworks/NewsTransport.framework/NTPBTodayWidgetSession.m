@interface NTPBTodayWidgetSession
+ (Class)countOfArticlesExposedEachSectionType;
+ (Class)widgetSectionIdsExposedType;
- (BOOL)hasWidgetArticleCount;
- (BOOL)hasWidgetSectionsExposed;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)countOfArticlesExposedEachSections;
- (NSMutableArray)widgetSectionIdsExposeds;
- (id)copyWithZone:(_NSZone *)a3;
- (id)countOfArticlesExposedEachSectionAtIndex:(unint64_t)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)widgetSectionIdsExposedAtIndex:(unint64_t)a3;
- (int)countOfArticlesExposedPerSectionAtIndex:(unint64_t)a3;
- (int)countOfArticlesExposedPerSections;
- (int)widgetArticleCount;
- (int)widgetSectionsExposed;
- (unint64_t)countOfArticlesExposedEachSectionsCount;
- (unint64_t)countOfArticlesExposedPerSectionsCount;
- (unint64_t)hash;
- (unint64_t)widgetSectionIdsExposedsCount;
- (void)addCountOfArticlesExposedEachSection:(id)a3;
- (void)addCountOfArticlesExposedPerSection:(int)a3;
- (void)addWidgetSectionIdsExposed:(id)a3;
- (void)clearCountOfArticlesExposedEachSections;
- (void)clearCountOfArticlesExposedPerSections;
- (void)clearWidgetSectionIdsExposeds;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setCountOfArticlesExposedEachSections:(id)a3;
- (void)setCountOfArticlesExposedPerSections:(int *)a3 count:(unint64_t)a4;
- (void)setHasWidgetArticleCount:(BOOL)a3;
- (void)setHasWidgetSectionsExposed:(BOOL)a3;
- (void)setWidgetArticleCount:(int)a3;
- (void)setWidgetSectionIdsExposeds:(id)a3;
- (void)setWidgetSectionsExposed:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBTodayWidgetSession

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)NTPBTodayWidgetSession;
  [(NTPBTodayWidgetSession *)&v3 dealloc];
}

- (void)setWidgetArticleCount:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_widgetArticleCount = a3;
}

- (void)setHasWidgetArticleCount:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasWidgetArticleCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setWidgetSectionsExposed:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_widgetSectionsExposed = a3;
}

- (void)setHasWidgetSectionsExposed:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasWidgetSectionsExposed
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (unint64_t)countOfArticlesExposedPerSectionsCount
{
  return self->_countOfArticlesExposedPerSections.count;
}

- (int)countOfArticlesExposedPerSections
{
  return self->_countOfArticlesExposedPerSections.list;
}

- (void)clearCountOfArticlesExposedPerSections
{
}

- (void)addCountOfArticlesExposedPerSection:(int)a3
{
}

- (int)countOfArticlesExposedPerSectionAtIndex:(unint64_t)a3
{
  p_countOfArticlesExposedPerSections = &self->_countOfArticlesExposedPerSections;
  unint64_t count = self->_countOfArticlesExposedPerSections.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_countOfArticlesExposedPerSections->list[a3];
}

- (void)setCountOfArticlesExposedPerSections:(int *)a3 count:(unint64_t)a4
{
}

- (void)clearWidgetSectionIdsExposeds
{
}

- (void)addWidgetSectionIdsExposed:(id)a3
{
  id v4 = a3;
  widgetSectionIdsExposeds = self->_widgetSectionIdsExposeds;
  id v8 = v4;
  if (!widgetSectionIdsExposeds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_widgetSectionIdsExposeds;
    self->_widgetSectionIdsExposeds = v6;

    id v4 = v8;
    widgetSectionIdsExposeds = self->_widgetSectionIdsExposeds;
  }
  [(NSMutableArray *)widgetSectionIdsExposeds addObject:v4];
}

- (unint64_t)widgetSectionIdsExposedsCount
{
  return [(NSMutableArray *)self->_widgetSectionIdsExposeds count];
}

- (id)widgetSectionIdsExposedAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_widgetSectionIdsExposeds objectAtIndex:a3];
}

+ (Class)widgetSectionIdsExposedType
{
  return (Class)objc_opt_class();
}

- (void)clearCountOfArticlesExposedEachSections
{
}

- (void)addCountOfArticlesExposedEachSection:(id)a3
{
  id v4 = a3;
  countOfArticlesExposedEachSections = self->_countOfArticlesExposedEachSections;
  id v8 = v4;
  if (!countOfArticlesExposedEachSections)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_countOfArticlesExposedEachSections;
    self->_countOfArticlesExposedEachSections = v6;

    id v4 = v8;
    countOfArticlesExposedEachSections = self->_countOfArticlesExposedEachSections;
  }
  [(NSMutableArray *)countOfArticlesExposedEachSections addObject:v4];
}

- (unint64_t)countOfArticlesExposedEachSectionsCount
{
  return [(NSMutableArray *)self->_countOfArticlesExposedEachSections count];
}

- (id)countOfArticlesExposedEachSectionAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_countOfArticlesExposedEachSections objectAtIndex:a3];
}

+ (Class)countOfArticlesExposedEachSectionType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBTodayWidgetSession;
  id v4 = [(NTPBTodayWidgetSession *)&v8 description];
  v5 = [(NTPBTodayWidgetSession *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v5 = [NSNumber numberWithInt:self->_widgetArticleCount];
    [v3 setObject:v5 forKey:@"widget_article_count"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = [NSNumber numberWithInt:self->_widgetSectionsExposed];
    [v3 setObject:v6 forKey:@"widget_sections_exposed"];
  }
  uint64_t v7 = PBRepeatedInt32NSArray();
  [v3 setObject:v7 forKey:@"count_of_articles_exposed_per_section"];

  widgetSectionIdsExposeds = self->_widgetSectionIdsExposeds;
  if (widgetSectionIdsExposeds) {
    [v3 setObject:widgetSectionIdsExposeds forKey:@"widget_section_ids_exposed"];
  }
  countOfArticlesExposedEachSections = self->_countOfArticlesExposedEachSections;
  if (countOfArticlesExposedEachSections) {
    [v3 setObject:countOfArticlesExposedEachSections forKey:@"count_of_articles_exposed_each_section"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBTodayWidgetSessionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_countOfArticlesExposedPerSections.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v6;
    }
    while (v6 < self->_countOfArticlesExposedPerSections.count);
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v7 = self->_widgetSectionIdsExposeds;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v9);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v12 = self->_countOfArticlesExposedEachSections;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  char has = (char)self->_has;
  if (has)
  {
    *(_DWORD *)(v5 + 40) = self->_widgetArticleCount;
    *(unsigned char *)(v5 + 60) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_widgetSectionsExposed;
    *(unsigned char *)(v5 + 60) |= 2u;
  }
  PBRepeatedInt32Copy();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v8 = self->_widgetSectionIdsExposeds;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = (void *)[*(id *)(*((void *)&v25 + 1) + 8 * i) copyWithZone:a3];
        [v6 addWidgetSectionIdsExposed:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v10);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v14 = self->_countOfArticlesExposedEachSections;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v19 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * j), "copyWithZone:", a3, (void)v21);
        [v6 addCountOfArticlesExposedEachSection:v19];
      }
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v16);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_widgetArticleCount != *((_DWORD *)v4 + 10)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
LABEL_17:
    char v7 = 0;
    goto LABEL_18;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0 || self->_widgetSectionsExposed != *((_DWORD *)v4 + 14)) {
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
    goto LABEL_17;
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_17;
  }
  widgetSectionIdsExposeds = self->_widgetSectionIdsExposeds;
  if ((unint64_t)widgetSectionIdsExposeds | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](widgetSectionIdsExposeds, "isEqual:")) {
      goto LABEL_17;
    }
  }
  countOfArticlesExposedEachSections = self->_countOfArticlesExposedEachSections;
  if ((unint64_t)countOfArticlesExposedEachSections | *((void *)v4 + 4)) {
    char v7 = -[NSMutableArray isEqual:](countOfArticlesExposedEachSections, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_18:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v3 = 2654435761 * self->_widgetArticleCount;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    goto LABEL_6;
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_widgetSectionsExposed;
LABEL_6:
  uint64_t v5 = v4 ^ v3 ^ PBRepeatedInt32Hash();
  uint64_t v6 = v5 ^ [(NSMutableArray *)self->_widgetSectionIdsExposeds hash];
  return v6 ^ [(NSMutableArray *)self->_countOfArticlesExposedEachSections hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (id *)v4;
  char v6 = *((unsigned char *)v4 + 60);
  if (v6)
  {
    self->_widgetArticleCount = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 1u;
    char v6 = *((unsigned char *)v4 + 60);
  }
  if ((v6 & 2) != 0)
  {
    self->_widgetSectionsExposed = *((_DWORD *)v4 + 14);
    *(unsigned char *)&self->_has |= 2u;
  }
  uint64_t v7 = [v4 countOfArticlesExposedPerSectionsCount];
  if (v7)
  {
    uint64_t v8 = v7;
    for (uint64_t i = 0; i != v8; ++i)
      -[NTPBTodayWidgetSession addCountOfArticlesExposedPerSection:](self, "addCountOfArticlesExposedPerSection:", [v5 countOfArticlesExposedPerSectionAtIndex:i]);
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = v5[6];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        [(NTPBTodayWidgetSession *)self addWidgetSectionIdsExposed:*(void *)(*((void *)&v24 + 1) + 8 * j)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v12);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v15 = v5[4];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        -[NTPBTodayWidgetSession addCountOfArticlesExposedEachSection:](self, "addCountOfArticlesExposedEachSection:", *(void *)(*((void *)&v20 + 1) + 8 * k), (void)v20);
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v17);
  }
}

- (int)widgetArticleCount
{
  return self->_widgetArticleCount;
}

- (int)widgetSectionsExposed
{
  return self->_widgetSectionsExposed;
}

- (NSMutableArray)widgetSectionIdsExposeds
{
  return self->_widgetSectionIdsExposeds;
}

- (void)setWidgetSectionIdsExposeds:(id)a3
{
}

- (NSMutableArray)countOfArticlesExposedEachSections
{
  return self->_countOfArticlesExposedEachSections;
}

- (void)setCountOfArticlesExposedEachSections:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetSectionIdsExposeds, 0);

  objc_storeStrong((id *)&self->_countOfArticlesExposedEachSections, 0);
}

@end