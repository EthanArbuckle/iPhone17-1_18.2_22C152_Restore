@interface AWDCoreRoutineMapItem
- (BOOL)hasHasMuid;
- (BOOL)hasMuid;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)mapItemSourcesAsString:(int)a3;
- (int)StringAsMapItemSources:(id)a3;
- (int)mapItemSources;
- (int)mapItemSourcesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)mapItemSourcesCount;
- (void)addMapItemSources:(int)a3;
- (void)clearMapItemSources;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasHasMuid:(BOOL)a3;
- (void)setHasMuid:(BOOL)a3;
- (void)setMapItemSources:(int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation AWDCoreRoutineMapItem

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineMapItem;
  [(AWDCoreRoutineMapItem *)&v3 dealloc];
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
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count] raise];
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
    return off_2641B95E8[a3];
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

- (void)setHasMuid:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_hasMuid = a3;
}

- (void)setHasHasMuid:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasHasMuid
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineMapItem;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDCoreRoutineMapItem description](&v3, sel_description), -[AWDCoreRoutineMapItem dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
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
          v8 = off_2641B95E8[v7];
        }
        [v5 addObject:v8];
        ++v6;
      }
      while (v6 < self->_mapItemSources.count);
    }
    [v3 setObject:v5 forKey:@"mapItemSources"];
  }
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithBool:self->_hasMuid] forKey:@"hasMuid"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineMapItemReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
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
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  if ([(AWDCoreRoutineMapItem *)self mapItemSourcesCount])
  {
    [a3 clearMapItemSources];
    unint64_t v5 = [(AWDCoreRoutineMapItem *)self mapItemSourcesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        [a3 addMapItemSources:-[AWDCoreRoutineMapItem mapItemSourcesAtIndex:](self, "mapItemSourcesAtIndex:", i)];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    *((unsigned char *)a3 + 32) = self->_hasMuid;
    *((unsigned char *)a3 + 36) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (unsigned char *)[((id)objc_opt_class()) allocWithZone:a3];
  PBRepeatedInt32Copy();
  if (*(unsigned char *)&self->_has)
  {
    v4[32] = self->_hasMuid;
    v4[36] |= 1u;
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  int IsEqual = [a3 isMemberOfClass:objc_opt_class()];
  if (IsEqual)
  {
    int IsEqual = PBRepeatedInt32IsEqual();
    if (IsEqual)
    {
      LOBYTE(IsEqual) = (*((unsigned char *)a3 + 36) & 1) == 0;
      if (*(unsigned char *)&self->_has)
      {
        if ((*((unsigned char *)a3 + 36) & 1) == 0)
        {
LABEL_5:
          LOBYTE(IsEqual) = 0;
          return IsEqual;
        }
        if (self->_hasMuid)
        {
          if (!*((unsigned char *)a3 + 32)) {
            goto LABEL_5;
          }
        }
        else if (*((unsigned char *)a3 + 32))
        {
          goto LABEL_5;
        }
        LOBYTE(IsEqual) = 1;
      }
    }
  }
  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v3 = PBRepeatedInt32Hash();
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_hasMuid;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5 = [a3 mapItemSourcesCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[AWDCoreRoutineMapItem addMapItemSources:](self, "addMapItemSources:", [a3 mapItemSourcesAtIndex:i]);
  }
  if (*((unsigned char *)a3 + 36))
  {
    self->_hasMuid = *((unsigned char *)a3 + 32);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (BOOL)hasMuid
{
  return self->_hasMuid;
}

@end