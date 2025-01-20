@interface PBBProtoSetRegion
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)region;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setRegion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PBBProtoSetRegion

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PBBProtoSetRegion;
  v4 = [(PBBProtoSetRegion *)&v8 description];
  v5 = [(PBBProtoSetRegion *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  region = self->_region;
  if (region) {
    [v3 setObject:region forKey:@"region"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PBBProtoSetRegionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
}

- (void)copyTo:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_region copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    region = self->_region;
    if ((unint64_t)region | v4[1]) {
      char v6 = -[NSString isEqual:](region, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSString *)self->_region hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[PBBProtoSetRegion setRegion:](self, "setRegion:");
  }
}

- (NSString)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end