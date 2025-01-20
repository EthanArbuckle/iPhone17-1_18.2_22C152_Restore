@interface NPTOAsset
- (BOOL)hasDate;
- (BOOL)hasUuidData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)uuidData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dateAsDate;
- (id)description;
- (id)dictionaryRepresentation;
- (id)localIdentifier;
- (int64_t)date;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDate:(int64_t)a3;
- (void)setDateAsDate:(id)a3;
- (void)setHasDate:(BOOL)a3;
- (void)setUuidData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPTOAsset

- (BOOL)hasUuidData
{
  return self->_uuidData != 0;
}

- (void)setDate:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_date = a3;
}

- (void)setHasDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NPTOAsset;
  v3 = [(NPTOAsset *)&v7 description];
  v4 = [(NPTOAsset *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  uuidData = self->_uuidData;
  if (uuidData) {
    [v3 setObject:uuidData forKey:@"uuidData"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = +[NSNumber numberWithLongLong:self->_date];
    [v4 setObject:v6 forKey:@"date"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPTOAssetReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_uuidData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteSfixed64Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_uuidData)
  {
    id v5 = v4;
    [v4 setUuidData:];
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_date;
    *((unsigned char *)v4 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSData *)self->_uuidData copyWithZone:a3];
  objc_super v7 = (void *)v5[2];
  v5[2] = v6;

  if (*(unsigned char *)&self->_has)
  {
    v5[1] = self->_date;
    *((unsigned char *)v5 + 24) |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  uuidData = self->_uuidData;
  if ((unint64_t)uuidData | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](uuidData, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) != 0 && self->_date == *((void *)v4 + 1))
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(NSData *)self->_uuidData hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_date;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (int64_t *)a3;
  if (v4[2])
  {
    id v5 = v4;
    -[NPTOAsset setUuidData:](self, "setUuidData:");
    uint64_t v4 = v5;
  }
  if (v4[3])
  {
    self->_date = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSData)uuidData
{
  return self->_uuidData;
}

- (void)setUuidData:(id)a3
{
}

- (int64_t)date
{
  return self->_date;
}

- (void).cxx_destruct
{
}

- (id)dateAsDate
{
  if ([(NPTOAsset *)self hasDate]) {
    unint64_t v3 = +[NSDate dateWithTimeIntervalSinceReferenceDate:(double)[(NPTOAsset *)self date] / 1000.0];
  }
  else {
    unint64_t v3 = 0;
  }

  return v3;
}

- (void)setDateAsDate:(id)a3
{
  if (a3)
  {
    [a3 timeIntervalSinceReferenceDate];
    unint64_t v5 = llround(v4 * 1000.0);
    [(NPTOAsset *)self setDate:v5];
  }
  else
  {
    -[NPTOAsset setHasDate:](self, "setHasDate:");
  }
}

- (id)localIdentifier
{
  v2 = [(NPTOAsset *)self uuidData];
  unint64_t v3 = [v2 npto_uuid];
  double v4 = [v3 UUIDString];
  unint64_t v5 = +[PHAsset localIdentifierWithUUID:v4];

  return v5;
}

@end