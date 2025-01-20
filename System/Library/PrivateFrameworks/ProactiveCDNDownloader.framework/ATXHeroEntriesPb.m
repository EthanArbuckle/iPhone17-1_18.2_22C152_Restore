@interface ATXHeroEntriesPb
+ (Class)poiCategoryType;
+ (Class)urlHashType;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTouristAppAtIndex:(unint64_t)a3;
- (BOOL)isTouristApps;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)poiCategorys;
- (NSMutableArray)urlHashs;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)poiCategoryAtIndex:(unint64_t)a3;
- (id)urlHashAtIndex:(unint64_t)a3;
- (int)deltaLatitudeAtIndex:(unint64_t)a3;
- (int)deltaLatitudes;
- (int)deltaLongitudeAtIndex:(unint64_t)a3;
- (int)deltaLongitudes;
- (int)tileLatitudeE7;
- (int)tileLongitudeE7;
- (unint64_t)adamIdsCount;
- (unint64_t)deltaLatitudesCount;
- (unint64_t)deltaLongitudesCount;
- (unint64_t)hash;
- (unint64_t)isTouristAppsCount;
- (unint64_t)muidAtIndex:(unint64_t)a3;
- (unint64_t)muids;
- (unint64_t)muidsCount;
- (unint64_t)poiCategorysCount;
- (unint64_t)radiusCount;
- (unint64_t)ranksCount;
- (unint64_t)urlHashsCount;
- (unsigned)adamIdAtIndex:(unint64_t)a3;
- (unsigned)adamIds;
- (unsigned)radius;
- (unsigned)radiusAtIndex:(unint64_t)a3;
- (unsigned)rankAtIndex:(unint64_t)a3;
- (unsigned)ranks;
- (void)addAdamId:(unsigned int)a3;
- (void)addDeltaLatitude:(int)a3;
- (void)addDeltaLongitude:(int)a3;
- (void)addIsTouristApp:(BOOL)a3;
- (void)addMuid:(unint64_t)a3;
- (void)addPoiCategory:(id)a3;
- (void)addRadius:(unsigned int)a3;
- (void)addRank:(unsigned int)a3;
- (void)addUrlHash:(id)a3;
- (void)clearAdamIds;
- (void)clearDeltaLatitudes;
- (void)clearDeltaLongitudes;
- (void)clearIsTouristApps;
- (void)clearMuids;
- (void)clearPoiCategorys;
- (void)clearRadius;
- (void)clearRanks;
- (void)clearUrlHashs;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAdamIds:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setDeltaLatitudes:(int *)a3 count:(unint64_t)a4;
- (void)setDeltaLongitudes:(int *)a3 count:(unint64_t)a4;
- (void)setIsTouristApps:(BOOL *)a3 count:(unint64_t)a4;
- (void)setMuids:(unint64_t *)a3 count:(unint64_t)a4;
- (void)setPoiCategorys:(id)a3;
- (void)setRadius:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setRanks:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setTileLatitudeE7:(int)a3;
- (void)setTileLongitudeE7:(int)a3;
- (void)setUrlHashs:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXHeroEntriesPb

- (void)dealloc
{
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedBOOLClear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)ATXHeroEntriesPb;
  [(ATXHeroEntriesPb *)&v3 dealloc];
}

- (unint64_t)deltaLatitudesCount
{
  return self->_deltaLatitudes.count;
}

- (int)deltaLatitudes
{
  return self->_deltaLatitudes.list;
}

- (void)clearDeltaLatitudes
{
}

- (void)addDeltaLatitude:(int)a3
{
}

- (int)deltaLatitudeAtIndex:(unint64_t)a3
{
  p_deltaLatitudes = &self->_deltaLatitudes;
  unint64_t count = self->_deltaLatitudes.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_deltaLatitudes->list[a3];
}

- (void)setDeltaLatitudes:(int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)deltaLongitudesCount
{
  return self->_deltaLongitudes.count;
}

- (int)deltaLongitudes
{
  return self->_deltaLongitudes.list;
}

- (void)clearDeltaLongitudes
{
}

- (void)addDeltaLongitude:(int)a3
{
}

- (int)deltaLongitudeAtIndex:(unint64_t)a3
{
  p_deltaLongitudes = &self->_deltaLongitudes;
  unint64_t count = self->_deltaLongitudes.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_deltaLongitudes->list[a3];
}

- (void)setDeltaLongitudes:(int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)adamIdsCount
{
  return self->_adamIds.count;
}

- (unsigned)adamIds
{
  return self->_adamIds.list;
}

- (void)clearAdamIds
{
}

- (void)addAdamId:(unsigned int)a3
{
}

- (unsigned)adamIdAtIndex:(unint64_t)a3
{
  p_adamIds = &self->_adamIds;
  unint64_t count = self->_adamIds.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_adamIds->list[a3];
}

- (void)setAdamIds:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)isTouristAppsCount
{
  return self->_isTouristApps.count;
}

- (BOOL)isTouristApps
{
  return self->_isTouristApps.list;
}

- (void)clearIsTouristApps
{
}

- (void)addIsTouristApp:(BOOL)a3
{
}

- (BOOL)isTouristAppAtIndex:(unint64_t)a3
{
  p_isTouristApps = &self->_isTouristApps;
  unint64_t count = self->_isTouristApps.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_isTouristApps->list[a3];
}

- (void)setIsTouristApps:(BOOL *)a3 count:(unint64_t)a4
{
}

- (unint64_t)ranksCount
{
  return self->_ranks.count;
}

- (unsigned)ranks
{
  return self->_ranks.list;
}

- (void)clearRanks
{
}

- (void)addRank:(unsigned int)a3
{
}

- (unsigned)rankAtIndex:(unint64_t)a3
{
  p_ranks = &self->_ranks;
  unint64_t count = self->_ranks.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_ranks->list[a3];
}

- (void)setRanks:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)radiusCount
{
  return self->_radius.count;
}

- (unsigned)radius
{
  return self->_radius.list;
}

- (void)clearRadius
{
}

- (void)addRadius:(unsigned int)a3
{
}

- (unsigned)radiusAtIndex:(unint64_t)a3
{
  p_radius = &self->_radius;
  unint64_t count = self->_radius.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_radius->list[a3];
}

- (void)setRadius:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (void)clearUrlHashs
{
}

- (void)addUrlHash:(id)a3
{
  id v4 = a3;
  urlHashs = self->_urlHashs;
  id v8 = v4;
  if (!urlHashs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_urlHashs;
    self->_urlHashs = v6;

    id v4 = v8;
    urlHashs = self->_urlHashs;
  }
  [(NSMutableArray *)urlHashs addObject:v4];
}

- (unint64_t)urlHashsCount
{
  return [(NSMutableArray *)self->_urlHashs count];
}

- (id)urlHashAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_urlHashs objectAtIndex:a3];
}

+ (Class)urlHashType
{
  return (Class)objc_opt_class();
}

- (void)clearPoiCategorys
{
}

- (void)addPoiCategory:(id)a3
{
  id v4 = a3;
  poiCategorys = self->_poiCategorys;
  id v8 = v4;
  if (!poiCategorys)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_poiCategorys;
    self->_poiCategorys = v6;

    id v4 = v8;
    poiCategorys = self->_poiCategorys;
  }
  [(NSMutableArray *)poiCategorys addObject:v4];
}

- (unint64_t)poiCategorysCount
{
  return [(NSMutableArray *)self->_poiCategorys count];
}

- (id)poiCategoryAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_poiCategorys objectAtIndex:a3];
}

+ (Class)poiCategoryType
{
  return (Class)objc_opt_class();
}

- (unint64_t)muidsCount
{
  return self->_muids.count;
}

- (unint64_t)muids
{
  return self->_muids.list;
}

- (void)clearMuids
{
}

- (void)addMuid:(unint64_t)a3
{
}

- (unint64_t)muidAtIndex:(unint64_t)a3
{
  p_muids = &self->_muids;
  unint64_t count = self->_muids.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    id v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_muids->list[a3];
}

- (void)setMuids:(unint64_t *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  objc_super v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXHeroEntriesPb;
  id v4 = [(ATXHeroEntriesPb *)&v8 description];
  v5 = [(ATXHeroEntriesPb *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  objc_super v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [NSNumber numberWithInt:self->_tileLatitudeE7];
  [v3 setObject:v4 forKey:@"tileLatitudeE7"];

  v5 = [NSNumber numberWithInt:self->_tileLongitudeE7];
  [v3 setObject:v5 forKey:@"tileLongitudeE7"];

  v6 = PBRepeatedInt32NSArray();
  [v3 setObject:v6 forKey:@"deltaLatitude"];

  uint64_t v7 = PBRepeatedInt32NSArray();
  [v3 setObject:v7 forKey:@"deltaLongitude"];

  objc_super v8 = PBRepeatedUInt32NSArray();
  [v3 setObject:v8 forKey:@"adamId"];

  v9 = PBRepeatedBOOLNSArray();
  [v3 setObject:v9 forKey:@"isTouristApp"];

  v10 = PBRepeatedUInt32NSArray();
  [v3 setObject:v10 forKey:@"rank"];

  v11 = PBRepeatedUInt32NSArray();
  [v3 setObject:v11 forKey:@"radius"];

  urlHashs = self->_urlHashs;
  if (urlHashs) {
    [v3 setObject:urlHashs forKey:@"urlHash"];
  }
  poiCategorys = self->_poiCategorys;
  if (poiCategorys) {
    [v3 setObject:poiCategorys forKey:@"poiCategory"];
  }
  v14 = PBRepeatedUInt64NSArray();
  [v3 setObject:v14 forKey:@"muid"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXHeroEntriesPbReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  PBDataWriterWriteSfixed32Field();
  PBDataWriterWriteSfixed32Field();
  if (self->_deltaLatitudes.count)
  {
    uint64_t v31 = 0;
    PBDataWriterPlaceMark();
    if (self->_deltaLatitudes.count)
    {
      unint64_t v5 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v5;
      }
      while (v5 < self->_deltaLatitudes.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_deltaLongitudes.count)
  {
    uint64_t v31 = 0;
    PBDataWriterPlaceMark();
    if (self->_deltaLongitudes.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v6;
      }
      while (v6 < self->_deltaLongitudes.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_adamIds.count)
  {
    uint64_t v31 = 0;
    PBDataWriterPlaceMark();
    if (self->_adamIds.count)
    {
      unint64_t v7 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v7;
      }
      while (v7 < self->_adamIds.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_isTouristApps.count)
  {
    uint64_t v31 = 0;
    PBDataWriterPlaceMark();
    if (self->_isTouristApps.count)
    {
      unint64_t v8 = 0;
      do
      {
        PBDataWriterWriteBOOLField();
        ++v8;
      }
      while (v8 < self->_isTouristApps.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_ranks.count)
  {
    uint64_t v31 = 0;
    PBDataWriterPlaceMark();
    if (self->_ranks.count)
    {
      unint64_t v9 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v9;
      }
      while (v9 < self->_ranks.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_radius.count)
  {
    uint64_t v31 = 0;
    PBDataWriterPlaceMark();
    if (self->_radius.count)
    {
      unint64_t v10 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v10;
      }
      while (v10 < self->_radius.count);
    }
    PBDataWriterRecallMark();
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v11 = self->_urlHashs;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v28;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteDataField();
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v13);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v16 = self->_poiCategorys;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v32 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v24;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        PBDataWriterWriteStringField();
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v32 count:16];
    }
    while (v18);
  }

  p_muids = &self->_muids;
  if (p_muids->count)
  {
    uint64_t v31 = 0;
    PBDataWriterPlaceMark();
    if (p_muids->count)
    {
      unint64_t v22 = 0;
      do
      {
        PBDataWriterWriteUint64Field();
        ++v22;
      }
      while (v22 < p_muids->count);
    }
    PBDataWriterRecallMark();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  v4[46] = self->_tileLatitudeE7;
  id v34 = v4;
  v4[47] = self->_tileLongitudeE7;
  if ([(ATXHeroEntriesPb *)self deltaLatitudesCount])
  {
    [v34 clearDeltaLatitudes];
    unint64_t v5 = [(ATXHeroEntriesPb *)self deltaLatitudesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        objc_msgSend(v34, "addDeltaLatitude:", -[ATXHeroEntriesPb deltaLatitudeAtIndex:](self, "deltaLatitudeAtIndex:", i));
    }
  }
  if ([(ATXHeroEntriesPb *)self deltaLongitudesCount])
  {
    [v34 clearDeltaLongitudes];
    unint64_t v8 = [(ATXHeroEntriesPb *)self deltaLongitudesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
        objc_msgSend(v34, "addDeltaLongitude:", -[ATXHeroEntriesPb deltaLongitudeAtIndex:](self, "deltaLongitudeAtIndex:", j));
    }
  }
  if ([(ATXHeroEntriesPb *)self adamIdsCount])
  {
    [v34 clearAdamIds];
    unint64_t v11 = [(ATXHeroEntriesPb *)self adamIdsCount];
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t k = 0; k != v12; ++k)
        objc_msgSend(v34, "addAdamId:", -[ATXHeroEntriesPb adamIdAtIndex:](self, "adamIdAtIndex:", k));
    }
  }
  if ([(ATXHeroEntriesPb *)self isTouristAppsCount])
  {
    [v34 clearIsTouristApps];
    unint64_t v14 = [(ATXHeroEntriesPb *)self isTouristAppsCount];
    if (v14)
    {
      unint64_t v15 = v14;
      for (uint64_t m = 0; m != v15; ++m)
        objc_msgSend(v34, "addIsTouristApp:", -[ATXHeroEntriesPb isTouristAppAtIndex:](self, "isTouristAppAtIndex:", m));
    }
  }
  if ([(ATXHeroEntriesPb *)self ranksCount])
  {
    [v34 clearRanks];
    unint64_t v17 = [(ATXHeroEntriesPb *)self ranksCount];
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t n = 0; n != v18; ++n)
        objc_msgSend(v34, "addRank:", -[ATXHeroEntriesPb rankAtIndex:](self, "rankAtIndex:", n));
    }
  }
  if ([(ATXHeroEntriesPb *)self radiusCount])
  {
    [v34 clearRadius];
    unint64_t v20 = [(ATXHeroEntriesPb *)self radiusCount];
    if (v20)
    {
      unint64_t v21 = v20;
      for (iuint64_t i = 0; ii != v21; ++ii)
        objc_msgSend(v34, "addRadius:", -[ATXHeroEntriesPb radiusAtIndex:](self, "radiusAtIndex:", ii));
    }
  }
  if ([(ATXHeroEntriesPb *)self urlHashsCount])
  {
    [v34 clearUrlHashs];
    unint64_t v23 = [(ATXHeroEntriesPb *)self urlHashsCount];
    if (v23)
    {
      unint64_t v24 = v23;
      for (juint64_t j = 0; jj != v24; ++jj)
      {
        long long v26 = [(ATXHeroEntriesPb *)self urlHashAtIndex:jj];
        [v34 addUrlHash:v26];
      }
    }
  }
  if ([(ATXHeroEntriesPb *)self poiCategorysCount])
  {
    [v34 clearPoiCategorys];
    unint64_t v27 = [(ATXHeroEntriesPb *)self poiCategorysCount];
    if (v27)
    {
      unint64_t v28 = v27;
      for (kuint64_t k = 0; kk != v28; ++kk)
      {
        long long v30 = [(ATXHeroEntriesPb *)self poiCategoryAtIndex:kk];
        [v34 addPoiCategory:v30];
      }
    }
  }
  if ([(ATXHeroEntriesPb *)self muidsCount])
  {
    [v34 clearMuids];
    unint64_t v31 = [(ATXHeroEntriesPb *)self muidsCount];
    if (v31)
    {
      unint64_t v32 = v31;
      for (muint64_t m = 0; mm != v32; ++mm)
        objc_msgSend(v34, "addMuid:", -[ATXHeroEntriesPb muidAtIndex:](self, "muidAtIndex:", mm));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  unint64_t v5 = (_DWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[46] = self->_tileLatitudeE7;
  v5[47] = self->_tileLongitudeE7;
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedBOOLCopy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  unint64_t v6 = self->_urlHashs;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        unint64_t v11 = (void *)[*(id *)(*((void *)&v23 + 1) + 8 * v10) copyWithZone:a3];
        [v5 addUrlHash:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v8);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  unint64_t v12 = self->_poiCategorys;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        unint64_t v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v16), "copyWithZone:", a3, (void)v19);
        [v5 addPoiCategory:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }

  PBRepeatedUInt64Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && self->_tileLatitudeE7 == *((_DWORD *)v4 + 46)
    && self->_tileLongitudeE7 == *((_DWORD *)v4 + 47)
    && PBRepeatedInt32IsEqual()
    && PBRepeatedInt32IsEqual()
    && PBRepeatedUInt32IsEqual()
    && PBRepeatedBOOLIsEqual()
    && PBRepeatedUInt32IsEqual()
    && PBRepeatedUInt32IsEqual()
    && ((urlHashs = self->_urlHashs, !((unint64_t)urlHashs | *((void *)v4 + 24)))
     || -[NSMutableArray isEqual:](urlHashs, "isEqual:"))
    && ((poiCategorys = self->_poiCategorys, !((unint64_t)poiCategorys | *((void *)v4 + 22)))
     || -[NSMutableArray isEqual:](poiCategorys, "isEqual:")))
  {
    char IsEqual = PBRepeatedUInt64IsEqual();
  }
  else
  {
    char IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v3 = (2654435761 * self->_tileLongitudeE7) ^ (2654435761 * self->_tileLatitudeE7);
  uint64_t v4 = PBRepeatedInt32Hash();
  uint64_t v5 = v4 ^ PBRepeatedInt32Hash();
  uint64_t v6 = v5 ^ PBRepeatedUInt32Hash();
  uint64_t v7 = v6 ^ PBRepeatedBOOLHash();
  uint64_t v8 = v7 ^ PBRepeatedUInt32Hash();
  uint64_t v9 = v8 ^ PBRepeatedUInt32Hash();
  uint64_t v10 = v9 ^ [(NSMutableArray *)self->_urlHashs hash];
  uint64_t v11 = v10 ^ [(NSMutableArray *)self->_poiCategorys hash];
  return v3 ^ v11 ^ PBRepeatedUInt64Hash();
}

- (void)mergeFrom:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v4 = a3;
  self->_tileLatitudeE7 = *((_DWORD *)v4 + 46);
  self->_tileLongitudeE7 = *((_DWORD *)v4 + 47);
  uint64_t v5 = [v4 deltaLatitudesCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[ATXHeroEntriesPb addDeltaLatitude:](self, "addDeltaLatitude:", [v4 deltaLatitudeAtIndex:i]);
  }
  uint64_t v8 = [v4 deltaLongitudesCount];
  if (v8)
  {
    uint64_t v9 = v8;
    for (uint64_t j = 0; j != v9; ++j)
      -[ATXHeroEntriesPb addDeltaLongitude:](self, "addDeltaLongitude:", [v4 deltaLongitudeAtIndex:j]);
  }
  uint64_t v11 = [v4 adamIdsCount];
  if (v11)
  {
    uint64_t v12 = v11;
    for (uint64_t k = 0; k != v12; ++k)
      -[ATXHeroEntriesPb addAdamId:](self, "addAdamId:", [v4 adamIdAtIndex:k]);
  }
  uint64_t v14 = [v4 isTouristAppsCount];
  if (v14)
  {
    uint64_t v15 = v14;
    for (uint64_t m = 0; m != v15; ++m)
      -[ATXHeroEntriesPb addIsTouristApp:](self, "addIsTouristApp:", [v4 isTouristAppAtIndex:m]);
  }
  uint64_t v17 = [v4 ranksCount];
  if (v17)
  {
    uint64_t v18 = v17;
    for (uint64_t n = 0; n != v18; ++n)
      -[ATXHeroEntriesPb addRank:](self, "addRank:", [v4 rankAtIndex:n]);
  }
  uint64_t v20 = [v4 radiusCount];
  if (v20)
  {
    uint64_t v21 = v20;
    for (iuint64_t i = 0; ii != v21; ++ii)
      -[ATXHeroEntriesPb addRadius:](self, "addRadius:", [v4 radiusAtIndex:ii]);
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v23 = *((id *)v4 + 24);
  uint64_t v24 = [v23 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v41;
    do
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v41 != v26) {
          objc_enumerationMutation(v23);
        }
        [(ATXHeroEntriesPb *)self addUrlHash:*(void *)(*((void *)&v40 + 1) + 8 * v27++)];
      }
      while (v25 != v27);
      uint64_t v25 = [v23 countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v25);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v28 = *((id *)v4 + 22);
  uint64_t v29 = [v28 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v37;
    do
    {
      uint64_t v32 = 0;
      do
      {
        if (*(void *)v37 != v31) {
          objc_enumerationMutation(v28);
        }
        -[ATXHeroEntriesPb addPoiCategory:](self, "addPoiCategory:", *(void *)(*((void *)&v36 + 1) + 8 * v32++), (void)v36);
      }
      while (v30 != v32);
      uint64_t v30 = [v28 countByEnumeratingWithState:&v36 objects:v44 count:16];
    }
    while (v30);
  }

  uint64_t v33 = [v4 muidsCount];
  if (v33)
  {
    uint64_t v34 = v33;
    for (juint64_t j = 0; jj != v34; ++jj)
      -[ATXHeroEntriesPb addMuid:](self, "addMuid:", objc_msgSend(v4, "muidAtIndex:", jj, (void)v36));
  }
}

- (int)tileLatitudeE7
{
  return self->_tileLatitudeE7;
}

- (void)setTileLatitudeE7:(int)a3
{
  self->_tileLatitudeE7 = a3;
}

- (int)tileLongitudeE7
{
  return self->_tileLongitudeE7;
}

- (void)setTileLongitudeE7:(int)a3
{
  self->_tileLongitudeE7 = a3;
}

- (NSMutableArray)urlHashs
{
  return self->_urlHashs;
}

- (void)setUrlHashs:(id)a3
{
}

- (NSMutableArray)poiCategorys
{
  return self->_poiCategorys;
}

- (void)setPoiCategorys:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlHashs, 0);

  objc_storeStrong((id *)&self->_poiCategorys, 0);
}

@end