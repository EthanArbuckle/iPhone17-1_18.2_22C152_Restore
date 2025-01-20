@interface NTPBTodayQueueConfig
+ (Class)todaySectionConfigsType;
- (BOOL)hasWidgetVisibleSectionsLimit;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)todaySectionConfigs;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)todaySectionConfigsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)todaySectionConfigsCount;
- (unint64_t)widgetVisibleSectionsLimit;
- (void)addTodaySectionConfigs:(id)a3;
- (void)clearTodaySectionConfigs;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasWidgetVisibleSectionsLimit:(BOOL)a3;
- (void)setTodaySectionConfigs:(id)a3;
- (void)setWidgetVisibleSectionsLimit:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBTodayQueueConfig

- (void)dealloc
{
  [(NTPBTodayQueueConfig *)self setTodaySectionConfigs:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBTodayQueueConfig;
  [(NTPBTodayQueueConfig *)&v3 dealloc];
}

- (void)clearTodaySectionConfigs
{
}

- (void)addTodaySectionConfigs:(id)a3
{
  todaySectionConfigs = self->_todaySectionConfigs;
  if (!todaySectionConfigs)
  {
    todaySectionConfigs = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_todaySectionConfigs = todaySectionConfigs;
  }

  [(NSMutableArray *)todaySectionConfigs addObject:a3];
}

- (unint64_t)todaySectionConfigsCount
{
  return [(NSMutableArray *)self->_todaySectionConfigs count];
}

- (id)todaySectionConfigsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_todaySectionConfigs objectAtIndex:a3];
}

+ (Class)todaySectionConfigsType
{
  return (Class)objc_opt_class();
}

- (void)setWidgetVisibleSectionsLimit:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_widgetVisibleSectionsLimit = a3;
}

- (void)setHasWidgetVisibleSectionsLimit:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasWidgetVisibleSectionsLimit
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBTodayQueueConfig;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBTodayQueueConfig description](&v3, sel_description), -[NTPBTodayQueueConfig dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if ([(NSMutableArray *)self->_todaySectionConfigs count])
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_todaySectionConfigs, "count"));
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    todaySectionConfigs = self->_todaySectionConfigs;
    uint64_t v6 = [(NSMutableArray *)todaySectionConfigs countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(todaySectionConfigs);
          }
          objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        uint64_t v7 = [(NSMutableArray *)todaySectionConfigs countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
    [v3 setObject:v4 forKey:@"today_section_configs"];
  }
  if (*(unsigned char *)&self->_has) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_widgetVisibleSectionsLimit), @"widget_visible_sections_limit");
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBTodayQueueConfigReadFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  todaySectionConfigs = self->_todaySectionConfigs;
  uint64_t v5 = [(NSMutableArray *)todaySectionConfigs countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(todaySectionConfigs);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v6 = [(NSMutableArray *)todaySectionConfigs countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  todaySectionConfigs = self->_todaySectionConfigs;
  uint64_t v7 = [(NSMutableArray *)todaySectionConfigs countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(todaySectionConfigs);
        }
        long long v11 = (void *)[*(id *)(*((void *)&v13 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addTodaySectionConfigs:v11];
      }
      uint64_t v8 = [(NSMutableArray *)todaySectionConfigs countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_widgetVisibleSectionsLimit;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    todaySectionConfigs = self->_todaySectionConfigs;
    if (!((unint64_t)todaySectionConfigs | *((void *)a3 + 2))
      || (int v5 = -[NSMutableArray isEqual:](todaySectionConfigs, "isEqual:")) != 0)
    {
      LOBYTE(v5) = (*((unsigned char *)a3 + 24) & 1) == 0;
      if (*(unsigned char *)&self->_has) {
        LOBYTE(v5) = (*((unsigned char *)a3 + 24) & 1) != 0 && self->_widgetVisibleSectionsLimit == *((void *)a3 + 1);
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_todaySectionConfigs hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v4 = 2654435761u * self->_widgetVisibleSectionsLimit;
  }
  else {
    unint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int v5 = (void *)*((void *)a3 + 2);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(NTPBTodayQueueConfig *)self addTodaySectionConfigs:*(void *)(*((void *)&v10 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
  if (*((unsigned char *)a3 + 24))
  {
    self->_widgetVisibleSectionsLimit = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSMutableArray)todaySectionConfigs
{
  return self->_todaySectionConfigs;
}

- (void)setTodaySectionConfigs:(id)a3
{
}

- (unint64_t)widgetVisibleSectionsLimit
{
  return self->_widgetVisibleSectionsLimit;
}

@end