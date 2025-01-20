@interface AWDCoreRoutineVisit
+ (Class)possibleMapItemsType;
- (AWDCoreRoutineMapItem)selectedMapItem;
- (BOOL)hasDwellTime;
- (BOOL)hasSelectedMapItem;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)possibleMapItems;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)mapItemSourcesAsString:(int)a3;
- (id)possibleMapItemsAtIndex:(unint64_t)a3;
- (int)StringAsMapItemSources:(id)a3;
- (int)mapItemSources;
- (int)mapItemSourcesAtIndex:(unint64_t)a3;
- (unint64_t)dwellTime;
- (unint64_t)hash;
- (unint64_t)mapItemSourcesCount;
- (unint64_t)possibleMapItemsCount;
- (void)addMapItemSources:(int)a3;
- (void)addPossibleMapItems:(id)a3;
- (void)clearMapItemSources;
- (void)clearPossibleMapItems;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setDwellTime:(unint64_t)a3;
- (void)setHasDwellTime:(BOOL)a3;
- (void)setMapItemSources:(int *)a3 count:(unint64_t)a4;
- (void)setPossibleMapItems:(id)a3;
- (void)setSelectedMapItem:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCoreRoutineVisit

- (void)dealloc
{
  PBRepeatedInt32Clear();
  [(AWDCoreRoutineVisit *)self setPossibleMapItems:0];
  [(AWDCoreRoutineVisit *)self setSelectedMapItem:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineVisit;
  [(AWDCoreRoutineVisit *)&v3 dealloc];
}

- (unint64_t)mapItemSourcesCount
{
  return self->_mapItemSources.count;
}

- (int)mapItemSources
{
  return self->_mapItemSources.list;
}

- (void)clearMapItemSources
{
}

- (void)addMapItemSources:(int)a3
{
}

- (int)mapItemSourcesAtIndex:(unint64_t)a3
{
  p_mapItemSources = &self->_mapItemSources;
  unint64_t count = self->_mapItemSources.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count), 0), "raise" reason userInfo];
  }
  return p_mapItemSources->list[a3];
}

- (void)setMapItemSources:(int *)a3 count:(unint64_t)a4
{
}

- (id)mapItemSourcesAsString:(int)a3
{
  if (a3 >= 0x12) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641B96C0[a3];
  }
}

- (int)StringAsMapItemSources:(id)a3
{
  if ([a3 isEqualToString:@"CoreRoutineMapItemSourceNone"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"CoreRoutineMapItemSourceReverseGeocode"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"CoreRoutineMapItemSourceContacts"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"CoreRoutineMapItemSourceMapsSupport"]) {
    return 3;
  }
  if ([a3 isEqualToString:@"CoreRoutineMapItemSourceUser"]) {
    return 4;
  }
  if ([a3 isEqualToString:@"CoreRoutineMapItemSourceMapsSupportFavorite"]) {
    return 5;
  }
  if ([a3 isEqualToString:@"CoreRoutineMapItemSourceMapsSupportHistoryEntry"]) {
    return 6;
  }
  if ([a3 isEqualToString:@"CoreRoutineMapItemSourceMapsSupportHistoryEntryRoute"]) {
    return 7;
  }
  if ([a3 isEqualToString:@"CoreRoutineMapItemSourceMapsSupportHistoryEntryPlaceDisplay"]) {
    return 8;
  }
  if ([a3 isEqualToString:@"CoreRoutineMapItemSourceEventKit"]) {
    return 9;
  }
  if ([a3 isEqualToString:@"CoreRoutineMapItemSourceLocalSearch"]) {
    return 10;
  }
  if ([a3 isEqualToString:@"CoreRoutineMapItemSourceMapItemHandle"]) {
    return 11;
  }
  if ([a3 isEqualToString:@"CoreRoutineMapItemSourceForwardGeocode"]) {
    return 12;
  }
  if ([a3 isEqualToString:@"CoreRoutineMapItemSourceProactiveExperts"]) {
    return 13;
  }
  if ([a3 isEqualToString:@"CoreRoutineMapItemSourcePortrait"]) {
    return 14;
  }
  if ([a3 isEqualToString:@"CoreRoutineMapItemSourceLearnedPlace"]) {
    return 15;
  }
  if ([a3 isEqualToString:@"CoreRoutineMapItemSourceBluePOI"]) {
    return 16;
  }
  if ([a3 isEqualToString:@"CoreRoutineMapItemSourceMapItemURL"]) {
    return 17;
  }
  return 0;
}

- (void)clearPossibleMapItems
{
}

- (void)addPossibleMapItems:(id)a3
{
  possibleMapItems = self->_possibleMapItems;
  if (!possibleMapItems)
  {
    possibleMapItems = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_possibleMapItems = possibleMapItems;
  }

  [(NSMutableArray *)possibleMapItems addObject:a3];
}

- (unint64_t)possibleMapItemsCount
{
  return [(NSMutableArray *)self->_possibleMapItems count];
}

- (id)possibleMapItemsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_possibleMapItems objectAtIndex:a3];
}

+ (Class)possibleMapItemsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasSelectedMapItem
{
  return self->_selectedMapItem != 0;
}

- (void)setDwellTime:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_dwellTime = a3;
}

- (void)setHasDwellTime:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDwellTime
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineVisit;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDCoreRoutineVisit description](&v3, sel_description), -[AWDCoreRoutineVisit dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  p_mapItemSources = &self->_mapItemSources;
  if (self->_mapItemSources.count)
  {
    v5 = [MEMORY[0x263EFF980] arrayWithCapacity:];
    if (self->_mapItemSources.count)
    {
      unint64_t v6 = 0;
      do
      {
        uint64_t v7 = p_mapItemSources->list[v6];
        if (v7 >= 0x12) {
          v8 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", p_mapItemSources->list[v6]];
        }
        else {
          v8 = off_2641B96C0[v7];
        }
        [v5 addObject:v8];
        ++v6;
      }
      while (v6 < self->_mapItemSources.count);
    }
    [v3 setObject:v5 forKey:@"mapItemSources"];
  }
  if ([(NSMutableArray *)self->_possibleMapItems count])
  {
    v9 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_possibleMapItems, "count")];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    possibleMapItems = self->_possibleMapItems;
    uint64_t v11 = [(NSMutableArray *)possibleMapItems countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(possibleMapItems);
          }
          [v9 addObject:[*(id *)(*((void *)&v17 + 1) + 8 * i) dictionaryRepresentation]];
        }
        uint64_t v12 = [(NSMutableArray *)possibleMapItems countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }
    [v3 setObject:v9 forKey:@"possibleMapItems"];
  }
  selectedMapItem = self->_selectedMapItem;
  if (selectedMapItem) {
    [v3 setObject:-[AWDCoreRoutineMapItem dictionaryRepresentation](selectedMapItem, "dictionaryRepresentation") forKey:@"selectedMapItem"];
  }
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_dwellTime] forKey:@"dwellTime"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineVisitReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  p_mapItemSources = &self->_mapItemSources;
  if (self->_mapItemSources.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v5;
    }
    while (v5 < p_mapItemSources->count);
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  possibleMapItems = self->_possibleMapItems;
  uint64_t v7 = [(NSMutableArray *)possibleMapItems countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(possibleMapItems);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)possibleMapItems countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
  if (self->_selectedMapItem) {
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
}

- (void)copyTo:(id)a3
{
  if ([(AWDCoreRoutineVisit *)self mapItemSourcesCount])
  {
    [a3 clearMapItemSources];
    unint64_t v5 = [(AWDCoreRoutineVisit *)self mapItemSourcesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        [a3 addMapItemSources:-[AWDCoreRoutineVisit mapItemSourcesAtIndex:](self, "mapItemSourcesAtIndex:", i)];
    }
  }
  if ([(AWDCoreRoutineVisit *)self possibleMapItemsCount])
  {
    [a3 clearPossibleMapItems];
    unint64_t v8 = [(AWDCoreRoutineVisit *)self possibleMapItemsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
        [a3 addPossibleMapItems:-[AWDCoreRoutineVisit possibleMapItemsAtIndex:](self, "possibleMapItemsAtIndex:", j)];
    }
  }
  if (self->_selectedMapItem) {
    [a3 setSelectedMapItem:];
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 4) = self->_dwellTime;
    *((unsigned char *)a3 + 56) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v5 = [objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init")
  PBRepeatedInt32Copy();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  possibleMapItems = self->_possibleMapItems;
  uint64_t v7 = [(NSMutableArray *)possibleMapItems countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(possibleMapItems);
        }
        long long v11 = (void *)[*(id *)(*((void *)&v13 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addPossibleMapItems:v11];
      }
      uint64_t v8 = [(NSMutableArray *)possibleMapItems countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  *(void *)(v5 + 48) = [(AWDCoreRoutineMapItem *)self->_selectedMapItem copyWithZone:a3];
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 32) = self->_dwellTime;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int IsEqual = [a3 isMemberOfClass:objc_opt_class()];
  if (IsEqual)
  {
    int IsEqual = PBRepeatedInt32IsEqual();
    if (IsEqual)
    {
      possibleMapItems = self->_possibleMapItems;
      if (!((unint64_t)possibleMapItems | *((void *)a3 + 5))
        || (int IsEqual = -[NSMutableArray isEqual:](possibleMapItems, "isEqual:")) != 0)
      {
        selectedMapItem = self->_selectedMapItem;
        if (!((unint64_t)selectedMapItem | *((void *)a3 + 6))
          || (int IsEqual = -[AWDCoreRoutineMapItem isEqual:](selectedMapItem, "isEqual:")) != 0)
        {
          LOBYTE(IsEqual) = (*((unsigned char *)a3 + 56) & 1) == 0;
          if (*(unsigned char *)&self->_has) {
            LOBYTE(IsEqual) = (*((unsigned char *)a3 + 56) & 1) != 0 && self->_dwellTime == *((void *)a3 + 4);
          }
        }
      }
    }
  }
  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v3 = PBRepeatedInt32Hash();
  uint64_t v4 = [(NSMutableArray *)self->_possibleMapItems hash];
  unint64_t v5 = [(AWDCoreRoutineMapItem *)self->_selectedMapItem hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v6 = 2654435761u * self->_dwellTime;
  }
  else {
    unint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a3 mapItemSourcesCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[AWDCoreRoutineVisit addMapItemSources:](self, "addMapItemSources:", [a3 mapItemSourcesAtIndex:i]);
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = (void *)*((void *)a3 + 5);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t j = 0; j != v10; ++j)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        [(AWDCoreRoutineVisit *)self addPossibleMapItems:*(void *)(*((void *)&v15 + 1) + 8 * j)];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
  selectedMapItem = self->_selectedMapItem;
  uint64_t v14 = *((void *)a3 + 6);
  if (selectedMapItem)
  {
    if (v14) {
      -[AWDCoreRoutineMapItem mergeFrom:](selectedMapItem, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[AWDCoreRoutineVisit setSelectedMapItem:](self, "setSelectedMapItem:");
  }
  if (*((unsigned char *)a3 + 56))
  {
    self->_dwellTime = *((void *)a3 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSMutableArray)possibleMapItems
{
  return self->_possibleMapItems;
}

- (void)setPossibleMapItems:(id)a3
{
}

- (AWDCoreRoutineMapItem)selectedMapItem
{
  return self->_selectedMapItem;
}

- (void)setSelectedMapItem:(id)a3
{
}

- (unint64_t)dwellTime
{
  return self->_dwellTime;
}

@end