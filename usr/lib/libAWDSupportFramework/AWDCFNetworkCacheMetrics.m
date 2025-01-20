@interface AWDCFNetworkCacheMetrics
- (BOOL)hasBundleID;
- (BOOL)hasTimestamp;
- (BOOL)hasTotalBytesWritten;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)bundleID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unint64_t)totalBytesWritten;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTotalBytesWritten:(BOOL)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTotalBytesWritten:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCFNetworkCacheMetrics

- (void)dealloc
{
  [(AWDCFNetworkCacheMetrics *)self setBundleID:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDCFNetworkCacheMetrics;
  [(AWDCFNetworkCacheMetrics *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setTotalBytesWritten:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_totalBytesWritten = a3;
}

- (void)setHasTotalBytesWritten:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTotalBytesWritten
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasBundleID
{
  return self->_bundleID != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDCFNetworkCacheMetrics;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDCFNetworkCacheMetrics description](&v3, sel_description), -[AWDCFNetworkCacheMetrics dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_totalBytesWritten] forKey:@"totalBytesWritten"];
  }
  bundleID = self->_bundleID;
  if (bundleID) {
    [v3 setObject:bundleID forKey:@"bundleID"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCFNetworkCacheMetricsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_bundleID)
  {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 32) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((void *)a3 + 2) = self->_totalBytesWritten;
    *((unsigned char *)a3 + 32) |= 2u;
  }
  bundleID = self->_bundleID;
  if (bundleID) {
    [a3 setBundleID:bundleID];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  v6 = (void *)v5;
  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 32) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_totalBytesWritten;
    *(unsigned char *)(v5 + 32) |= 2u;
  }

  v6[3] = [(NSString *)self->_bundleID copyWithZone:a3];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 32) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_14;
      }
    }
    else if (*((unsigned char *)a3 + 32))
    {
LABEL_14:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 32) & 2) == 0 || self->_totalBytesWritten != *((void *)a3 + 2)) {
        goto LABEL_14;
      }
    }
    else if ((*((unsigned char *)a3 + 32) & 2) != 0)
    {
      goto LABEL_14;
    }
    bundleID = self->_bundleID;
    if ((unint64_t)bundleID | *((void *)a3 + 3))
    {
      LOBYTE(v5) = -[NSString isEqual:](bundleID, "isEqual:");
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
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v2 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v3 = 0;
    return v3 ^ v2 ^ [(NSString *)self->_bundleID hash];
  }
  unint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v3 = 2654435761u * self->_totalBytesWritten;
  return v3 ^ v2 ^ [(NSString *)self->_bundleID hash];
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 32);
  if (v3)
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v3 = *((unsigned char *)a3 + 32);
  }
  if ((v3 & 2) != 0)
  {
    self->_totalBytesWritten = *((void *)a3 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)a3 + 3)) {
    -[AWDCFNetworkCacheMetrics setBundleID:](self, "setBundleID:");
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)totalBytesWritten
{
  return self->_totalBytesWritten;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

@end