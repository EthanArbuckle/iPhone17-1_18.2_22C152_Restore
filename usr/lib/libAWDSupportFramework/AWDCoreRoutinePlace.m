@interface AWDCoreRoutinePlace
+ (Class)distanceToOtherPlacesType;
- (AWDCoreRoutineMapItem)mapItem;
- (BOOL)hasMapItem;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)distanceToOtherPlaces;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)distanceToOtherPlacesAtIndex:(unint64_t)a3;
- (unint64_t)distanceToOtherPlacesCount;
- (unint64_t)hash;
- (void)addDistanceToOtherPlaces:(id)a3;
- (void)clearDistanceToOtherPlaces;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setDistanceToOtherPlaces:(id)a3;
- (void)setMapItem:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCoreRoutinePlace

- (void)dealloc
{
  [(AWDCoreRoutinePlace *)self setMapItem:0];
  [(AWDCoreRoutinePlace *)self setDistanceToOtherPlaces:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutinePlace;
  [(AWDCoreRoutinePlace *)&v3 dealloc];
}

- (BOOL)hasMapItem
{
  return self->_mapItem != 0;
}

- (void)clearDistanceToOtherPlaces
{
}

- (void)addDistanceToOtherPlaces:(id)a3
{
  distanceToOtherPlaces = self->_distanceToOtherPlaces;
  if (!distanceToOtherPlaces)
  {
    distanceToOtherPlaces = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_distanceToOtherPlaces = distanceToOtherPlaces;
  }

  [(NSMutableArray *)distanceToOtherPlaces addObject:a3];
}

- (unint64_t)distanceToOtherPlacesCount
{
  return [(NSMutableArray *)self->_distanceToOtherPlaces count];
}

- (id)distanceToOtherPlacesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_distanceToOtherPlaces objectAtIndex:a3];
}

+ (Class)distanceToOtherPlacesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutinePlace;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDCoreRoutinePlace description](&v3, sel_description), -[AWDCoreRoutinePlace dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  mapItem = self->_mapItem;
  if (mapItem) {
    [v3 setObject: -[AWDCoreRoutineMapItem dictionaryRepresentation](mapItem, "dictionaryRepresentation") forKey:@"mapItem"];
  }
  if ([(NSMutableArray *)self->_distanceToOtherPlaces count])
  {
    v5 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_distanceToOtherPlaces, "count")];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    distanceToOtherPlaces = self->_distanceToOtherPlaces;
    uint64_t v7 = [(NSMutableArray *)distanceToOtherPlaces countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(distanceToOtherPlaces);
          }
          [v5 addObject:[(*(id *)(*((void *)&v12 + 1) + 8 * i)) dictionaryRepresentation]];
        }
        uint64_t v8 = [(NSMutableArray *)distanceToOtherPlaces countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
    [v3 setObject:v5 forKey:@"distanceToOtherPlaces"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutinePlaceReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (self->_mapItem) {
    PBDataWriterWriteSubmessage();
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  distanceToOtherPlaces = self->_distanceToOtherPlaces;
  uint64_t v5 = [(NSMutableArray *)distanceToOtherPlaces countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(distanceToOtherPlaces);
        }
        PBDataWriterWriteSubmessage();
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)distanceToOtherPlaces countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)copyTo:(id)a3
{
  if (self->_mapItem) {
    [a3 setMapItem:];
  }
  if ([(AWDCoreRoutinePlace *)self distanceToOtherPlacesCount])
  {
    [a3 clearDistanceToOtherPlaces];
    unint64_t v5 = [(AWDCoreRoutinePlace *)self distanceToOtherPlacesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        [a3 addDistanceToOtherPlaces:-[AWDCoreRoutinePlace distanceToOtherPlacesAtIndex:](self, "distanceToOtherPlacesAtIndex:", i)];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  unint64_t v5 = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];

  v5[2] = [(AWDCoreRoutineMapItem *)self->_mapItem copyWithZone:a3];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  distanceToOtherPlaces = self->_distanceToOtherPlaces;
  uint64_t v7 = [(NSMutableArray *)distanceToOtherPlaces countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(distanceToOtherPlaces);
        }
        long long v11 = (void *)[*(id *)(*((void *)&v13 + 1) + 8 * v10) copyWithZone:a3];
        [v5 addDistanceToOtherPlaces:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)distanceToOtherPlaces countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    mapItem = self->_mapItem;
    if (!((unint64_t)mapItem | *((void *)a3 + 2))
      || (int v5 = -[AWDCoreRoutineMapItem isEqual:](mapItem, "isEqual:")) != 0)
    {
      distanceToOtherPlaces = self->_distanceToOtherPlaces;
      if ((unint64_t)distanceToOtherPlaces | *((void *)a3 + 1))
      {
        LOBYTE(v5) = -[NSMutableArray isEqual:](distanceToOtherPlaces, "isEqual:");
      }
      else
      {
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3 = [(AWDCoreRoutineMapItem *)self->_mapItem hash];
  return [(NSMutableArray *)self->_distanceToOtherPlaces hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  mapItem = self->_mapItem;
  uint64_t v6 = *((void *)a3 + 2);
  if (mapItem)
  {
    if (v6) {
      -[AWDCoreRoutineMapItem mergeFrom:](mapItem, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[AWDCoreRoutinePlace setMapItem:](self, "setMapItem:");
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v7 = (void *)*((void *)a3 + 1);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [(AWDCoreRoutinePlace *)self addDistanceToOtherPlaces:*(void *)(*((void *)&v12 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (AWDCoreRoutineMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
}

- (NSMutableArray)distanceToOtherPlaces
{
  return self->_distanceToOtherPlaces;
}

- (void)setDistanceToOtherPlaces:(id)a3
{
}

@end