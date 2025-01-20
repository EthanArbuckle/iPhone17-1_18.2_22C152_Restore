@interface BCReadingStatisticsProtoTOCEntry
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)href;
- (double)readProportion;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHref:(id)a3;
- (void)setReadProportion:(double)a3;
- (void)setTimestamp:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation BCReadingStatisticsProtoTOCEntry

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)BCReadingStatisticsProtoTOCEntry;
  v3 = [(BCReadingStatisticsProtoTOCEntry *)&v7 description];
  v4 = [(BCReadingStatisticsProtoTOCEntry *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  href = self->_href;
  if (href) {
    [v3 setObject:href forKey:@"href"];
  }
  v6 = +[NSNumber numberWithDouble:self->_readProportion];
  [v4 setObject:v6 forKey:@"readProportion"];

  objc_super v7 = +[NSNumber numberWithDouble:self->_timestamp];
  [v4 setObject:v7 forKey:@"timestamp"];

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BCReadingStatisticsProtoTOCEntryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteStringField();
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteDoubleField();
}

- (void)copyTo:(id)a3
{
  href = self->_href;
  v5 = (double *)a3;
  [v5 setHref:href];
  v5[1] = self->_readProportion;
  v5[2] = self->_timestamp;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_href copyWithZone:a3];
  objc_super v7 = (void *)v5[3];
  v5[3] = v6;

  v5[1] = *(void *)&self->_readProportion;
  v5[2] = *(void *)&self->_timestamp;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v6 = [v4 isMemberOfClass:objc_opt_class()]
    && ((href = self->_href, !((unint64_t)href | *((void *)v4 + 3)))
     || -[NSString isEqual:](href, "isEqual:"))
    && self->_readProportion == *((double *)v4 + 1)
    && self->_timestamp == *((double *)v4 + 2);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_href hash];
  double readProportion = self->_readProportion;
  double v5 = -readProportion;
  if (readProportion >= 0.0) {
    double v5 = self->_readProportion;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  double v8 = fmod(v6, 1.84467441e19);
  unint64_t v9 = 2654435761u * (unint64_t)v8;
  unint64_t v10 = v9 + (unint64_t)v7;
  if (v7 <= 0.0) {
    unint64_t v10 = 2654435761u * (unint64_t)v8;
  }
  unint64_t v11 = v9 - (unint64_t)fabs(v7);
  if (v7 < 0.0) {
    unint64_t v12 = v11;
  }
  else {
    unint64_t v12 = v10;
  }
  double timestamp = self->_timestamp;
  double v14 = -timestamp;
  if (timestamp >= 0.0) {
    double v14 = self->_timestamp;
  }
  long double v15 = floor(v14 + 0.5);
  double v16 = (v14 - v15) * 1.84467441e19;
  double v17 = fmod(v15, 1.84467441e19);
  unint64_t v18 = 2654435761u * (unint64_t)v17;
  unint64_t v19 = v18 + (unint64_t)v16;
  if (v16 <= 0.0) {
    unint64_t v19 = 2654435761u * (unint64_t)v17;
  }
  unint64_t v20 = v18 - (unint64_t)fabs(v16);
  if (v16 >= 0.0) {
    unint64_t v20 = v19;
  }
  return v12 ^ v3 ^ v20;
}

- (void)mergeFrom:(id)a3
{
  id v4 = (double *)a3;
  if (*((void *)v4 + 3))
  {
    double v5 = v4;
    -[BCReadingStatisticsProtoTOCEntry setHref:](self, "setHref:");
    id v4 = v5;
  }
  self->_double readProportion = v4[1];
  self->_double timestamp = v4[2];
}

- (NSString)href
{
  return self->_href;
}

- (void)setHref:(id)a3
{
}

- (double)readProportion
{
  return self->_readProportion;
}

- (void)setReadProportion:(double)a3
{
  self->_double readProportion = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_double timestamp = a3;
}

- (void).cxx_destruct
{
}

@end