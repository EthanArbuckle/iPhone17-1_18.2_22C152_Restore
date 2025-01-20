@interface NSSProfileDataRespMsg
- (BOOL)hasProfileData;
- (BOOL)hasProfilePayloadsSummary;
- (BOOL)hasRmConfigurationViewModels;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)profileData;
- (NSData)profilePayloadsSummary;
- (NSData)rmConfigurationViewModels;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setProfileData:(id)a3;
- (void)setProfilePayloadsSummary:(id)a3;
- (void)setRmConfigurationViewModels:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NSSProfileDataRespMsg

- (BOOL)hasProfileData
{
  return self->_profileData != 0;
}

- (BOOL)hasProfilePayloadsSummary
{
  return self->_profilePayloadsSummary != 0;
}

- (BOOL)hasRmConfigurationViewModels
{
  return self->_rmConfigurationViewModels != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NSSProfileDataRespMsg;
  v4 = [(NSSProfileDataRespMsg *)&v8 description];
  v5 = [(NSSProfileDataRespMsg *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  profileData = self->_profileData;
  if (profileData) {
    [v3 setObject:profileData forKey:@"profileData"];
  }
  profilePayloadsSummary = self->_profilePayloadsSummary;
  if (profilePayloadsSummary) {
    [v4 setObject:profilePayloadsSummary forKey:@"profilePayloadsSummary"];
  }
  rmConfigurationViewModels = self->_rmConfigurationViewModels;
  if (rmConfigurationViewModels) {
    [v4 setObject:rmConfigurationViewModels forKey:@"rmConfigurationViewModels"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NSSProfileDataRespMsgReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_profileData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_profilePayloadsSummary)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_rmConfigurationViewModels)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_profileData)
  {
    objc_msgSend(v4, "setProfileData:");
    id v4 = v5;
  }
  if (self->_profilePayloadsSummary)
  {
    objc_msgSend(v5, "setProfilePayloadsSummary:");
    id v4 = v5;
  }
  if (self->_rmConfigurationViewModels)
  {
    objc_msgSend(v5, "setRmConfigurationViewModels:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_profileData copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSData *)self->_profilePayloadsSummary copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSData *)self->_rmConfigurationViewModels copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((profileData = self->_profileData, !((unint64_t)profileData | v4[1]))
     || -[NSData isEqual:](profileData, "isEqual:"))
    && ((profilePayloadsSummary = self->_profilePayloadsSummary, !((unint64_t)profilePayloadsSummary | v4[2]))
     || -[NSData isEqual:](profilePayloadsSummary, "isEqual:")))
  {
    rmConfigurationViewModels = self->_rmConfigurationViewModels;
    if ((unint64_t)rmConfigurationViewModels | v4[3]) {
      char v8 = -[NSData isEqual:](rmConfigurationViewModels, "isEqual:");
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
  uint64_t v3 = [(NSData *)self->_profileData hash];
  uint64_t v4 = [(NSData *)self->_profilePayloadsSummary hash] ^ v3;
  return v4 ^ [(NSData *)self->_rmConfigurationViewModels hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  if (v4[1]) {
    -[NSSProfileDataRespMsg setProfileData:](self, "setProfileData:");
  }
  if (v4[2]) {
    -[NSSProfileDataRespMsg setProfilePayloadsSummary:](self, "setProfilePayloadsSummary:");
  }
  if (v4[3]) {
    -[NSSProfileDataRespMsg setRmConfigurationViewModels:](self, "setRmConfigurationViewModels:");
  }
}

- (NSData)profileData
{
  return self->_profileData;
}

- (void)setProfileData:(id)a3
{
}

- (NSData)profilePayloadsSummary
{
  return self->_profilePayloadsSummary;
}

- (void)setProfilePayloadsSummary:(id)a3
{
}

- (NSData)rmConfigurationViewModels
{
  return self->_rmConfigurationViewModels;
}

- (void)setRmConfigurationViewModels:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rmConfigurationViewModels, 0);
  objc_storeStrong((id *)&self->_profilePayloadsSummary, 0);
  objc_storeStrong((id *)&self->_profileData, 0);
}

@end