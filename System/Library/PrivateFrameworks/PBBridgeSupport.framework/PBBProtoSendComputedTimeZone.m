@interface PBBProtoSendComputedTimeZone
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)computedTimeZone;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setComputedTimeZone:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PBBProtoSendComputedTimeZone

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PBBProtoSendComputedTimeZone;
  v4 = [(PBBProtoSendComputedTimeZone *)&v8 description];
  v5 = [(PBBProtoSendComputedTimeZone *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  computedTimeZone = self->_computedTimeZone;
  if (computedTimeZone) {
    [v3 setObject:computedTimeZone forKey:@"computedTimeZone"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PBBProtoSendComputedTimeZoneReadFrom((uint64_t)self, (uint64_t)a3);
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
  uint64_t v6 = [(NSString *)self->_computedTimeZone copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    computedTimeZone = self->_computedTimeZone;
    if ((unint64_t)computedTimeZone | v4[1]) {
      char v6 = -[NSString isEqual:](computedTimeZone, "isEqual:");
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
  return [(NSString *)self->_computedTimeZone hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[PBBProtoSendComputedTimeZone setComputedTimeZone:](self, "setComputedTimeZone:");
  }
}

- (NSString)computedTimeZone
{
  return self->_computedTimeZone;
}

- (void)setComputedTimeZone:(id)a3
{
}

- (void).cxx_destruct
{
}

@end