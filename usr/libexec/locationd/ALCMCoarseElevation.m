@interface ALCMCoarseElevation
- (BOOL)hasSource;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)sourceAsString:(int)a3;
- (int)StringAsSource:(id)a3;
- (int)source;
- (unint64_t)hash;
- (unsigned)elevationAscended;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setElevationAscended:(unsigned int)a3;
- (void)setHasSource:(BOOL)a3;
- (void)setSource:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALCMCoarseElevation

- (int)source
{
  if (*(unsigned char *)&self->_has) {
    return self->_source;
  }
  else {
    return 0;
  }
}

- (void)setSource:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_source = a3;
}

- (void)setHasSource:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSource
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)sourceAsString:(int)a3
{
  if (!a3) {
    return @"kElevationSourcePhone";
  }
  if (a3 == 1) {
    return @"kElevationSourceWatch";
  }
  return +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
}

- (int)StringAsSource:(id)a3
{
  if ([a3 isEqualToString:@"kElevationSourcePhone"]) {
    return 0;
  }
  else {
    return [a3 isEqualToString:@"kElevationSourceWatch"];
  }
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)ALCMCoarseElevation;
  return +[NSString stringWithFormat:@"%@ %@", [(ALCMCoarseElevation *)&v3 description], [(ALCMCoarseElevation *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  [v3 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_elevationAscended)] forKey:@"elevationAscended"];
  if (*(unsigned char *)&self->_has)
  {
    int source = self->_source;
    if (source)
    {
      if (source == 1) {
        CFStringRef v5 = @"kElevationSourceWatch";
      }
      else {
        CFStringRef v5 = +[NSString stringWithFormat:@"(unknown: %i)", self->_source];
      }
    }
    else
    {
      CFStringRef v5 = @"kElevationSourcePhone";
    }
    [v3 setObject:v5 forKey:@"source"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100964174((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  PBDataWriterWriteUint32Field();
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 2) = self->_elevationAscended;
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)a3 + 3) = self->_source;
    *((unsigned char *)a3 + 16) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[[objc_opt_class() allocWithZone:a3] init];
  *((_DWORD *)result + 2) = self->_elevationAscended;
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)result + 3) = self->_source;
    *((unsigned char *)result + 16) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (self->_elevationAscended != *((_DWORD *)a3 + 2)) {
      goto LABEL_7;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 16) & 1) == 0;
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 16) & 1) != 0 && self->_source == *((_DWORD *)a3 + 3))
      {
        LOBYTE(v5) = 1;
        return v5;
      }
LABEL_7:
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_source;
  }
  else {
    uint64_t v2 = 0;
  }
  return v2 ^ (2654435761 * self->_elevationAscended);
}

- (void)mergeFrom:(id)a3
{
  self->_elevationAscended = *((_DWORD *)a3 + 2);
  if (*((unsigned char *)a3 + 16))
  {
    self->_int source = *((_DWORD *)a3 + 3);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unsigned)elevationAscended
{
  return self->_elevationAscended;
}

- (void)setElevationAscended:(unsigned int)a3
{
  self->_elevationAscended = a3;
}

@end