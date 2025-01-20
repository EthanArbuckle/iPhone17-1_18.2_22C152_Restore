@interface ALCMCoarseElevationDeprecated
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)elevationAscended;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setElevationAscended:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALCMCoarseElevationDeprecated

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)ALCMCoarseElevationDeprecated;
  return +[NSString stringWithFormat:@"%@ %@", [(ALCMCoarseElevationDeprecated *)&v3 description], [(ALCMCoarseElevationDeprecated *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  [v3 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_elevationAscended)] forKey:@"elevationAscended"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1010A10C8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 2) = self->_elevationAscended;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[[objc_opt_class() allocWithZone:a3] init];
  *((_DWORD *)result + 2) = self->_elevationAscended;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5) {
    LOBYTE(v5) = self->_elevationAscended == *((_DWORD *)a3 + 2);
  }
  return v5;
}

- (unint64_t)hash
{
  return 2654435761 * self->_elevationAscended;
}

- (void)mergeFrom:(id)a3
{
  self->_elevationAscended = *((_DWORD *)a3 + 2);
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