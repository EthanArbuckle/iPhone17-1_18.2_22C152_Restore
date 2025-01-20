@interface NTPBColorGradient
+ (Class)colorStopsType;
- (BOOL)hasEndPoint;
- (BOOL)hasStartPoint;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)colorStops;
- (NTPBPoint)endPoint;
- (NTPBPoint)startPoint;
- (id)colorStopsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)colorStopsCount;
- (unint64_t)hash;
- (void)addColorStops:(id)a3;
- (void)clearColorStops;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setColorStops:(id)a3;
- (void)setEndPoint:(id)a3;
- (void)setStartPoint:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBColorGradient

- (void)dealloc
{
  [(NTPBColorGradient *)self setStartPoint:0];
  [(NTPBColorGradient *)self setEndPoint:0];
  [(NTPBColorGradient *)self setColorStops:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBColorGradient;
  [(NTPBColorGradient *)&v3 dealloc];
}

- (BOOL)hasStartPoint
{
  return self->_startPoint != 0;
}

- (BOOL)hasEndPoint
{
  return self->_endPoint != 0;
}

- (void)clearColorStops
{
}

- (void)addColorStops:(id)a3
{
  colorStops = self->_colorStops;
  if (!colorStops)
  {
    colorStops = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_colorStops = colorStops;
  }

  [(NSMutableArray *)colorStops addObject:a3];
}

- (unint64_t)colorStopsCount
{
  return [(NSMutableArray *)self->_colorStops count];
}

- (id)colorStopsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_colorStops objectAtIndex:a3];
}

+ (Class)colorStopsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBColorGradient;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBColorGradient description](&v3, sel_description), -[NTPBColorGradient dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  startPoint = self->_startPoint;
  if (startPoint) {
    objc_msgSend(v3, "setObject:forKey:", -[NTPBPoint dictionaryRepresentation](startPoint, "dictionaryRepresentation"), @"startPoint");
  }
  endPoint = self->_endPoint;
  if (endPoint) {
    objc_msgSend(v3, "setObject:forKey:", -[NTPBPoint dictionaryRepresentation](endPoint, "dictionaryRepresentation"), @"endPoint");
  }
  if ([(NSMutableArray *)self->_colorStops count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_colorStops, "count"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    colorStops = self->_colorStops;
    uint64_t v8 = [(NSMutableArray *)colorStops countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(colorStops);
          }
          objc_msgSend(v6, "addObject:", objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        uint64_t v9 = [(NSMutableArray *)colorStops countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
    [v3 setObject:v6 forKey:@"colorStops"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBColorGradientReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (self->_startPoint) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_endPoint) {
    PBDataWriterWriteSubmessage();
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  colorStops = self->_colorStops;
  uint64_t v5 = [(NSMutableArray *)colorStops countByEnumeratingWithState:&v9 objects:v13 count:16];
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
          objc_enumerationMutation(colorStops);
        }
        PBDataWriterWriteSubmessage();
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)colorStops countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  v5[3] = [(NTPBPoint *)self->_startPoint copyWithZone:a3];
  v5[2] = [(NTPBPoint *)self->_endPoint copyWithZone:a3];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  colorStops = self->_colorStops;
  uint64_t v7 = [(NSMutableArray *)colorStops countByEnumeratingWithState:&v13 objects:v17 count:16];
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
          objc_enumerationMutation(colorStops);
        }
        long long v11 = (void *)[*(id *)(*((void *)&v13 + 1) + 8 * v10) copyWithZone:a3];
        [v5 addColorStops:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)colorStops countByEnumeratingWithState:&v13 objects:v17 count:16];
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
    startPoint = self->_startPoint;
    if (!((unint64_t)startPoint | *((void *)a3 + 3))
      || (int v5 = -[NTPBPoint isEqual:](startPoint, "isEqual:")) != 0)
    {
      endPoint = self->_endPoint;
      if (!((unint64_t)endPoint | *((void *)a3 + 2))
        || (int v5 = -[NTPBPoint isEqual:](endPoint, "isEqual:")) != 0)
      {
        colorStops = self->_colorStops;
        if ((unint64_t)colorStops | *((void *)a3 + 1))
        {
          LOBYTE(v5) = -[NSMutableArray isEqual:](colorStops, "isEqual:");
        }
        else
        {
          LOBYTE(v5) = 1;
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3 = [(NTPBPoint *)self->_startPoint hash];
  unint64_t v4 = [(NTPBPoint *)self->_endPoint hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_colorStops hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  startPoint = self->_startPoint;
  uint64_t v6 = *((void *)a3 + 3);
  if (startPoint)
  {
    if (v6) {
      -[NTPBPoint mergeFrom:](startPoint, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[NTPBColorGradient setStartPoint:](self, "setStartPoint:");
  }
  endPoint = self->_endPoint;
  uint64_t v8 = *((void *)a3 + 2);
  if (endPoint)
  {
    if (v8) {
      -[NTPBPoint mergeFrom:](endPoint, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[NTPBColorGradient setEndPoint:](self, "setEndPoint:");
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v9 = (void *)*((void *)a3 + 1);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [(NTPBColorGradient *)self addColorStops:*(void *)(*((void *)&v14 + 1) + 8 * i)];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (NTPBPoint)startPoint
{
  return self->_startPoint;
}

- (void)setStartPoint:(id)a3
{
}

- (NTPBPoint)endPoint
{
  return self->_endPoint;
}

- (void)setEndPoint:(id)a3
{
}

- (NSMutableArray)colorStops
{
  return self->_colorStops;
}

- (void)setColorStops:(id)a3
{
}

@end