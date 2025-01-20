@interface NTPBWidgetSectionsArticleCountPair
- (BOOL)hasWidgetSectionIdsExposed;
- (BOOL)hasWidgetSectionSubidsExposed;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)widgetSectionIdsExposed;
- (NSString)widgetSectionSubidsExposed;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)countOfArticlesExposedEachSectionAtIndex:(unint64_t)a3;
- (int64_t)countOfArticlesExposedEachSections;
- (unint64_t)countOfArticlesExposedEachSectionsCount;
- (unint64_t)hash;
- (void)addCountOfArticlesExposedEachSection:(int64_t)a3;
- (void)clearCountOfArticlesExposedEachSections;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setCountOfArticlesExposedEachSections:(int64_t *)a3 count:(unint64_t)a4;
- (void)setWidgetSectionIdsExposed:(id)a3;
- (void)setWidgetSectionSubidsExposed:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBWidgetSectionsArticleCountPair

- (void)dealloc
{
  PBRepeatedInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)NTPBWidgetSectionsArticleCountPair;
  [(NTPBWidgetSectionsArticleCountPair *)&v3 dealloc];
}

- (BOOL)hasWidgetSectionIdsExposed
{
  return self->_widgetSectionIdsExposed != 0;
}

- (unint64_t)countOfArticlesExposedEachSectionsCount
{
  return self->_countOfArticlesExposedEachSections.count;
}

- (int64_t)countOfArticlesExposedEachSections
{
  return self->_countOfArticlesExposedEachSections.list;
}

- (void)clearCountOfArticlesExposedEachSections
{
}

- (void)addCountOfArticlesExposedEachSection:(int64_t)a3
{
}

- (int64_t)countOfArticlesExposedEachSectionAtIndex:(unint64_t)a3
{
  p_countOfArticlesExposedEachSections = &self->_countOfArticlesExposedEachSections;
  unint64_t count = self->_countOfArticlesExposedEachSections.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_countOfArticlesExposedEachSections->list[a3];
}

- (void)setCountOfArticlesExposedEachSections:(int64_t *)a3 count:(unint64_t)a4
{
}

- (BOOL)hasWidgetSectionSubidsExposed
{
  return self->_widgetSectionSubidsExposed != 0;
}

- (id)description
{
  objc_super v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBWidgetSectionsArticleCountPair;
  v4 = [(NTPBWidgetSectionsArticleCountPair *)&v8 description];
  v5 = [(NTPBWidgetSectionsArticleCountPair *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  objc_super v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  widgetSectionIdsExposed = self->_widgetSectionIdsExposed;
  if (widgetSectionIdsExposed) {
    [v3 setObject:widgetSectionIdsExposed forKey:@"widget_section_ids_exposed"];
  }
  v6 = PBRepeatedInt64NSArray();
  [v4 setObject:v6 forKey:@"count_of_articles_exposed_each_section"];

  widgetSectionSubidsExposed = self->_widgetSectionSubidsExposed;
  if (widgetSectionSubidsExposed) {
    [v4 setObject:widgetSectionSubidsExposed forKey:@"widget_section_subids_exposed"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBWidgetSectionsArticleCountPairReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_widgetSectionIdsExposed)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_countOfArticlesExposedEachSections.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteInt64Field();
      id v4 = v6;
      ++v5;
    }
    while (v5 < self->_countOfArticlesExposedEachSections.count);
  }
  if (self->_widgetSectionSubidsExposed)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_widgetSectionIdsExposed copyWithZone:a3];
  uint64_t v7 = (void *)v5[4];
  v5[4] = v6;

  PBRepeatedInt64Copy();
  uint64_t v8 = [(NSString *)self->_widgetSectionSubidsExposed copyWithZone:a3];
  v9 = (void *)v5[5];
  v5[5] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((widgetSectionIdsExposed = self->_widgetSectionIdsExposed, !((unint64_t)widgetSectionIdsExposed | v4[4]))
     || -[NSString isEqual:](widgetSectionIdsExposed, "isEqual:"))
    && PBRepeatedInt64IsEqual())
  {
    widgetSectionSubidsExposed = self->_widgetSectionSubidsExposed;
    if ((unint64_t)widgetSectionSubidsExposed | v4[5]) {
      char v7 = -[NSString isEqual:](widgetSectionSubidsExposed, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_widgetSectionIdsExposed hash];
  uint64_t v4 = PBRepeatedInt64Hash() ^ v3;
  return v4 ^ [(NSString *)self->_widgetSectionSubidsExposed hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  v9 = v4;
  if (v4[4])
  {
    -[NTPBWidgetSectionsArticleCountPair setWidgetSectionIdsExposed:](self, "setWidgetSectionIdsExposed:");
    uint64_t v4 = v9;
  }
  uint64_t v5 = [v4 countOfArticlesExposedEachSectionsCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[NTPBWidgetSectionsArticleCountPair addCountOfArticlesExposedEachSection:](self, "addCountOfArticlesExposedEachSection:", [v9 countOfArticlesExposedEachSectionAtIndex:i]);
  }
  uint64_t v8 = v9;
  if (v9[5])
  {
    -[NTPBWidgetSectionsArticleCountPair setWidgetSectionSubidsExposed:](self, "setWidgetSectionSubidsExposed:");
    uint64_t v8 = v9;
  }
}

- (NSString)widgetSectionIdsExposed
{
  return self->_widgetSectionIdsExposed;
}

- (void)setWidgetSectionIdsExposed:(id)a3
{
}

- (NSString)widgetSectionSubidsExposed
{
  return self->_widgetSectionSubidsExposed;
}

- (void)setWidgetSectionSubidsExposed:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetSectionSubidsExposed, 0);

  objc_storeStrong((id *)&self->_widgetSectionIdsExposed, 0);
}

@end