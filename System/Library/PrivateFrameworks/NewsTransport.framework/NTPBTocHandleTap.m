@interface NTPBTocHandleTap
- (BOOL)hasTocExposureId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)tocExposureId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setTocExposureId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBTocHandleTap

- (BOOL)hasTocExposureId
{
  return self->_tocExposureId != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBTocHandleTap;
  v4 = [(NTPBTocHandleTap *)&v8 description];
  v5 = [(NTPBTocHandleTap *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  tocExposureId = self->_tocExposureId;
  if (tocExposureId) {
    [v3 setObject:tocExposureId forKey:@"toc_exposure_id"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBTocHandleTapReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_tocExposureId) {
    PBDataWriterWriteDataField();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_tocExposureId copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    tocExposureId = self->_tocExposureId;
    if ((unint64_t)tocExposureId | v4[1]) {
      char v6 = -[NSData isEqual:](tocExposureId, "isEqual:");
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
  return [(NSData *)self->_tocExposureId hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[NTPBTocHandleTap setTocExposureId:](self, "setTocExposureId:");
  }
}

- (NSData)tocExposureId
{
  return self->_tocExposureId;
}

- (void)setTocExposureId:(id)a3
{
}

- (void).cxx_destruct
{
}

@end