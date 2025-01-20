@interface NTPBUserSegmentationApiConfiguration
- (BOOL)hasUserSegmentationApiModMax;
- (BOOL)hasUserSegmentationApiModThreshold;
- (BOOL)hasUserSegmentationRefreshRate;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)userSegmentationApiModMax;
- (NSString)userSegmentationApiModThreshold;
- (NSString)userSegmentationRefreshRate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setUserSegmentationApiModMax:(id)a3;
- (void)setUserSegmentationApiModThreshold:(id)a3;
- (void)setUserSegmentationRefreshRate:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBUserSegmentationApiConfiguration

- (BOOL)hasUserSegmentationApiModThreshold
{
  return self->_userSegmentationApiModThreshold != 0;
}

- (BOOL)hasUserSegmentationApiModMax
{
  return self->_userSegmentationApiModMax != 0;
}

- (BOOL)hasUserSegmentationRefreshRate
{
  return self->_userSegmentationRefreshRate != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBUserSegmentationApiConfiguration;
  v4 = [(NTPBUserSegmentationApiConfiguration *)&v8 description];
  v5 = [(NTPBUserSegmentationApiConfiguration *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  userSegmentationApiModThreshold = self->_userSegmentationApiModThreshold;
  if (userSegmentationApiModThreshold) {
    [v3 setObject:userSegmentationApiModThreshold forKey:@"user_segmentation_api_mod_threshold"];
  }
  userSegmentationApiModMax = self->_userSegmentationApiModMax;
  if (userSegmentationApiModMax) {
    [v4 setObject:userSegmentationApiModMax forKey:@"user_segmentation_api_mod_max"];
  }
  userSegmentationRefreshRate = self->_userSegmentationRefreshRate;
  if (userSegmentationRefreshRate) {
    [v4 setObject:userSegmentationRefreshRate forKey:@"user_segmentation_refresh_rate"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBUserSegmentationApiConfigurationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_userSegmentationApiModThreshold)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_userSegmentationApiModMax)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_userSegmentationRefreshRate)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_userSegmentationApiModThreshold copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_userSegmentationApiModMax copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  uint64_t v10 = [(NSString *)self->_userSegmentationRefreshRate copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((userSegmentationApiModThreshold = self->_userSegmentationApiModThreshold,
         !((unint64_t)userSegmentationApiModThreshold | v4[2]))
     || -[NSString isEqual:](userSegmentationApiModThreshold, "isEqual:"))
    && ((userSegmentationApiModMax = self->_userSegmentationApiModMax,
         !((unint64_t)userSegmentationApiModMax | v4[1]))
     || -[NSString isEqual:](userSegmentationApiModMax, "isEqual:")))
  {
    userSegmentationRefreshRate = self->_userSegmentationRefreshRate;
    if ((unint64_t)userSegmentationRefreshRate | v4[3]) {
      char v8 = -[NSString isEqual:](userSegmentationRefreshRate, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_userSegmentationApiModThreshold hash];
  NSUInteger v4 = [(NSString *)self->_userSegmentationApiModMax hash] ^ v3;
  return v4 ^ [(NSString *)self->_userSegmentationRefreshRate hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[2]) {
    -[NTPBUserSegmentationApiConfiguration setUserSegmentationApiModThreshold:](self, "setUserSegmentationApiModThreshold:");
  }
  if (v4[1]) {
    -[NTPBUserSegmentationApiConfiguration setUserSegmentationApiModMax:](self, "setUserSegmentationApiModMax:");
  }
  if (v4[3]) {
    -[NTPBUserSegmentationApiConfiguration setUserSegmentationRefreshRate:](self, "setUserSegmentationRefreshRate:");
  }
}

- (NSString)userSegmentationApiModThreshold
{
  return self->_userSegmentationApiModThreshold;
}

- (void)setUserSegmentationApiModThreshold:(id)a3
{
}

- (NSString)userSegmentationApiModMax
{
  return self->_userSegmentationApiModMax;
}

- (void)setUserSegmentationApiModMax:(id)a3
{
}

- (NSString)userSegmentationRefreshRate
{
  return self->_userSegmentationRefreshRate;
}

- (void)setUserSegmentationRefreshRate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userSegmentationRefreshRate, 0);
  objc_storeStrong((id *)&self->_userSegmentationApiModThreshold, 0);

  objc_storeStrong((id *)&self->_userSegmentationApiModMax, 0);
}

@end