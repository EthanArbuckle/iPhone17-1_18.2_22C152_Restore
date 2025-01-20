@interface TRANSITPbLocationFingerprintsV1
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)locationFingerprints;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)locationFingerprintAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)locationFingerprintsCount;
- (void)addLocationFingerprint:(id)a3;
- (void)clearLocationFingerprints;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setLocationFingerprints:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TRANSITPbLocationFingerprintsV1

- (void)dealloc
{
  [(TRANSITPbLocationFingerprintsV1 *)self setLocationFingerprints:0];
  v3.receiver = self;
  v3.super_class = (Class)TRANSITPbLocationFingerprintsV1;
  [(TRANSITPbLocationFingerprintsV1 *)&v3 dealloc];
}

- (void)clearLocationFingerprints
{
}

- (void)addLocationFingerprint:(id)a3
{
  locationFingerprints = self->_locationFingerprints;
  if (!locationFingerprints)
  {
    locationFingerprints = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->_locationFingerprints = locationFingerprints;
  }

  [(NSMutableArray *)locationFingerprints addObject:a3];
}

- (unint64_t)locationFingerprintsCount
{
  return (unint64_t)[(NSMutableArray *)self->_locationFingerprints count];
}

- (id)locationFingerprintAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_locationFingerprints objectAtIndex:a3];
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)TRANSITPbLocationFingerprintsV1;
  return +[NSString stringWithFormat:@"%@ %@", [(TRANSITPbLocationFingerprintsV1 *)&v3 description], [(TRANSITPbLocationFingerprintsV1 *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  if ([(NSMutableArray *)self->_locationFingerprints count])
  {
    id v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_locationFingerprints, "count")];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    locationFingerprints = self->_locationFingerprints;
    id v6 = [(NSMutableArray *)locationFingerprints countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(locationFingerprints);
          }
          [v4 addObject:[(*(id *)(*((void *)&v11 + 1) + 8 * (void)v9)) dictionaryRepresentation]];
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [(NSMutableArray *)locationFingerprints countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
    [v3 setObject:v4 forKey:@"locationFingerprint"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10121B980(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  locationFingerprints = self->_locationFingerprints;
  id v4 = (char *)[(NSMutableArray *)locationFingerprints countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(locationFingerprints);
        }
        PBDataWriterWriteSubmessage();
      }
      v5 = (char *)[(NSMutableArray *)locationFingerprints countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)copyTo:(id)a3
{
  if ([(TRANSITPbLocationFingerprintsV1 *)self locationFingerprintsCount])
  {
    [a3 clearLocationFingerprints];
    unint64_t v5 = [(TRANSITPbLocationFingerprintsV1 *)self locationFingerprintsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        [a3 addLocationFingerprint:-[TRANSITPbLocationFingerprintsV1 locationFingerprintAtIndex:](self, "locationFingerprintAtIndex:", i)];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  locationFingerprints = self->_locationFingerprints;
  id v7 = [(NSMutableArray *)locationFingerprints countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      long long v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(locationFingerprints);
        }
        id v11 = [*(id *)(*((void *)&v13 + 1) + 8 * (void)v10) copyWithZone:a3];
        [v5 addLocationFingerprint:v11];

        long long v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSMutableArray *)locationFingerprints countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    locationFingerprints = self->_locationFingerprints;
    if ((unint64_t)locationFingerprints | *((void *)a3 + 1))
    {
      LOBYTE(v5) = -[NSMutableArray isEqual:](locationFingerprints, "isEqual:");
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  return (unint64_t)[(NSMutableArray *)self->_locationFingerprints hash];
}

- (void)mergeFrom:(id)a3
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = (void *)*((void *)a3 + 1);
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(TRANSITPbLocationFingerprintsV1 *)self addLocationFingerprint:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8)];
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (NSMutableArray)locationFingerprints
{
  return self->_locationFingerprints;
}

- (void)setLocationFingerprints:(id)a3
{
}

@end