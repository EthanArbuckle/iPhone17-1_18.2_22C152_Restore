@interface AWDWiFiNWActivityHistogramBin
- (BOOL)hasBin;
- (BOOL)hasHits;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)bin;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)hits;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setBin:(id)a3;
- (void)setHasHits:(BOOL)a3;
- (void)setHits:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiNWActivityHistogramBin

- (void)dealloc
{
  [(AWDWiFiNWActivityHistogramBin *)self setBin:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiNWActivityHistogramBin;
  [(AWDWiFiNWActivityHistogramBin *)&v3 dealloc];
}

- (BOOL)hasBin
{
  return self->_bin != 0;
}

- (void)setHits:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_hits = a3;
}

- (void)setHasHits:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasHits
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiNWActivityHistogramBin;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiNWActivityHistogramBin description](&v3, sel_description), -[AWDWiFiNWActivityHistogramBin dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  bin = self->_bin;
  if (bin) {
    [v3 setObject:bin forKey:@"bin"];
  }
  if (*(unsigned char *)&self->_has) {
    [v4 setObject:[NSNumber numberWithUnsignedLongLong:self->_hits] forKey:@"hits"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiNWActivityHistogramBinReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_bin) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
  }
}

- (void)copyTo:(id)a3
{
  if (self->_bin) {
    [a3 setBin:];
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_hits;
    *((unsigned char *)a3 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [[(id)objc_opt_class() allocWithZone:a3] init];

  *(void *)(v5 + 16) = [(NSString *)self->_bin copyWithZone:a3];
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_hits;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    bin = self->_bin;
    if (!((unint64_t)bin | *((void *)a3 + 2)) || (int v5 = -[NSString isEqual:](bin, "isEqual:")) != 0)
    {
      LOBYTE(v5) = (*((unsigned char *)a3 + 24) & 1) == 0;
      if (*(unsigned char *)&self->_has) {
        LOBYTE(v5) = (*((unsigned char *)a3 + 24) & 1) != 0 && self->_hits == *((void *)a3 + 1);
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_bin hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v4 = 2654435761u * self->_hits;
  }
  else {
    unint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 2)) {
    -[AWDWiFiNWActivityHistogramBin setBin:](self, "setBin:");
  }
  if (*((unsigned char *)a3 + 24))
  {
    self->_hits = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)bin
{
  return self->_bin;
}

- (void)setBin:(id)a3
{
}

- (unint64_t)hits
{
  return self->_hits;
}

@end