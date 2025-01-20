@interface APPBInstallAttribution
- (BOOL)hasAdNetworkId;
- (BOOL)hasAdamId;
- (BOOL)hasAttributionSignature;
- (BOOL)hasCampaignId;
- (BOOL)hasSourceAppAdamId;
- (BOOL)hasTimestamp;
- (BOOL)hasUuid;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)adNetworkId;
- (NSString)attributionSignature;
- (NSString)uuid;
- (NSString)version;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)adamId;
- (unint64_t)campaignId;
- (unint64_t)hash;
- (unint64_t)sourceAppAdamId;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAdNetworkId:(id)a3;
- (void)setAdamId:(unint64_t)a3;
- (void)setAttributionSignature:(id)a3;
- (void)setCampaignId:(unint64_t)a3;
- (void)setHasAdamId:(BOOL)a3;
- (void)setHasCampaignId:(BOOL)a3;
- (void)setHasSourceAppAdamId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setSourceAppAdamId:(unint64_t)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setUuid:(id)a3;
- (void)setVersion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation APPBInstallAttribution

- (BOOL)hasAdNetworkId
{
  return self->_adNetworkId != 0;
}

- (void)setCampaignId:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_campaignId = a3;
}

- (void)setHasCampaignId:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCampaignId
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasVersion
{
  return self->_version != 0;
}

- (BOOL)hasAttributionSignature
{
  return self->_attributionSignature != 0;
}

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (void)setAdamId:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_adamId = a3;
}

- (void)setHasAdamId:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAdamId
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSourceAppAdamId:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_sourceAppAdamId = a3;
}

- (void)setHasSourceAppAdamId:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSourceAppAdamId
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBInstallAttribution;
  char v3 = [(APPBInstallAttribution *)&v7 description];
  v4 = [(APPBInstallAttribution *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  adNetworkId = self->_adNetworkId;
  if (adNetworkId) {
    [v3 setObject:adNetworkId forKey:@"adNetworkId"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v6 = +[NSNumber numberWithUnsignedLongLong:self->_campaignId];
    [v4 setObject:v6 forKey:@"campaignId"];
  }
  version = self->_version;
  if (version) {
    [v4 setObject:version forKey:@"version"];
  }
  attributionSignature = self->_attributionSignature;
  if (attributionSignature) {
    [v4 setObject:attributionSignature forKey:@"attributionSignature"];
  }
  uuid = self->_uuid;
  if (uuid) {
    [v4 setObject:uuid forKey:@"uuid"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v13 = +[NSNumber numberWithUnsignedLongLong:self->_adamId];
    [v4 setObject:v13 forKey:@"adamId"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_13:
      if ((has & 8) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_13;
  }
  v14 = +[NSNumber numberWithUnsignedLongLong:self->_sourceAppAdamId];
  [v4 setObject:v14 forKey:@"sourceAppAdamId"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_14:
    v11 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v4 setObject:v11 forKey:@"timestamp"];
  }
LABEL_15:

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return APPBInstallAttributionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_adNetworkId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
  }
  if (self->_version)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_attributionSignature)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_uuid)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_13:
      if ((has & 8) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteUint64Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_14:
    PBDataWriterWriteUint64Field();
    id v4 = v6;
  }
LABEL_15:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_adNetworkId)
  {
    [v4 setAdNetworkId:];
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((void *)v4 + 2) = self->_campaignId;
    *((unsigned char *)v4 + 72) |= 2u;
  }
  if (self->_version)
  {
    [v6 setVersion:];
    id v4 = v6;
  }
  if (self->_attributionSignature)
  {
    [v6 setAttributionSignature:];
    id v4 = v6;
  }
  if (self->_uuid)
  {
    [v6 setUuid:];
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = self->_adamId;
    *((unsigned char *)v4 + 72) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_13:
      if ((has & 8) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_13;
  }
  *((void *)v4 + 3) = self->_sourceAppAdamId;
  *((unsigned char *)v4 + 72) |= 4u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_14:
    *((void *)v4 + 4) = self->_timestamp;
    *((unsigned char *)v4 + 72) |= 8u;
  }
LABEL_15:
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  id v6 = [(NSString *)self->_adNetworkId copyWithZone:a3];
  objc_super v7 = (void *)v5[5];
  v5[5] = v6;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v5[2] = self->_campaignId;
    *((unsigned char *)v5 + 72) |= 2u;
  }
  id v8 = [(NSString *)self->_version copyWithZone:a3];
  v9 = (void *)v5[8];
  v5[8] = v8;

  id v10 = [(NSString *)self->_attributionSignature copyWithZone:a3];
  v11 = (void *)v5[6];
  v5[6] = v10;

  id v12 = [(NSString *)self->_uuid copyWithZone:a3];
  v13 = (void *)v5[7];
  v5[7] = v12;

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_5;
    }
LABEL_9:
    v5[3] = self->_sourceAppAdamId;
    *((unsigned char *)v5 + 72) |= 4u;
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      return v5;
    }
    goto LABEL_6;
  }
  v5[1] = self->_adamId;
  *((unsigned char *)v5 + 72) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_9;
  }
LABEL_5:
  if ((has & 8) != 0)
  {
LABEL_6:
    v5[4] = self->_timestamp;
    *((unsigned char *)v5 + 72) |= 8u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_29;
  }
  adNetworkId = self->_adNetworkId;
  if ((unint64_t)adNetworkId | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](adNetworkId, "isEqual:")) {
      goto LABEL_29;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 2) == 0 || self->_campaignId != *((void *)v4 + 2)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 2) != 0)
  {
LABEL_29:
    BOOL v9 = 0;
    goto LABEL_30;
  }
  version = self->_version;
  if ((unint64_t)version | *((void *)v4 + 8) && !-[NSString isEqual:](version, "isEqual:")) {
    goto LABEL_29;
  }
  attributionSignature = self->_attributionSignature;
  if ((unint64_t)attributionSignature | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](attributionSignature, "isEqual:")) {
      goto LABEL_29;
    }
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](uuid, "isEqual:")) {
      goto LABEL_29;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 72) & 1) == 0 || self->_adamId != *((void *)v4 + 1)) {
      goto LABEL_29;
    }
  }
  else if (*((unsigned char *)v4 + 72))
  {
    goto LABEL_29;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 4) == 0 || self->_sourceAppAdamId != *((void *)v4 + 3)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 4) != 0)
  {
    goto LABEL_29;
  }
  BOOL v9 = (*((unsigned char *)v4 + 72) & 8) == 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 8) == 0 || self->_timestamp != *((void *)v4 + 4)) {
      goto LABEL_29;
    }
    BOOL v9 = 1;
  }
LABEL_30:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_adNetworkId hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    unint64_t v4 = 2654435761u * self->_campaignId;
  }
  else {
    unint64_t v4 = 0;
  }
  NSUInteger v5 = [(NSString *)self->_version hash];
  NSUInteger v6 = [(NSString *)self->_attributionSignature hash];
  NSUInteger v7 = [(NSString *)self->_uuid hash];
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    unint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
LABEL_9:
    unint64_t v9 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_7;
    }
LABEL_10:
    unint64_t v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  }
  unint64_t v8 = 2654435761u * self->_adamId;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  unint64_t v9 = 2654435761u * self->_sourceAppAdamId;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_10;
  }
LABEL_7:
  unint64_t v10 = 2654435761u * self->_timestamp;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = (unint64_t *)a3;
  NSUInteger v6 = v4;
  if (v4[5])
  {
    -[APPBInstallAttribution setAdNetworkId:](self, "setAdNetworkId:");
    unint64_t v4 = v6;
  }
  if ((v4[9] & 2) != 0)
  {
    self->_campaignId = v4[2];
    *(unsigned char *)&self->_has |= 2u;
  }
  if (v4[8])
  {
    -[APPBInstallAttribution setVersion:](self, "setVersion:");
    unint64_t v4 = v6;
  }
  if (v4[6])
  {
    -[APPBInstallAttribution setAttributionSignature:](self, "setAttributionSignature:");
    unint64_t v4 = v6;
  }
  if (v4[7])
  {
    -[APPBInstallAttribution setUuid:](self, "setUuid:");
    unint64_t v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 72);
  if (v5)
  {
    self->_adamId = v4[1];
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 72);
    if ((v5 & 4) == 0)
    {
LABEL_13:
      if ((v5 & 8) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((v4[9] & 4) == 0)
  {
    goto LABEL_13;
  }
  self->_sourceAppAdamId = v4[3];
  *(unsigned char *)&self->_has |= 4u;
  if ((v4[9] & 8) != 0)
  {
LABEL_14:
    self->_timestamp = v4[4];
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_15:
}

- (NSString)adNetworkId
{
  return self->_adNetworkId;
}

- (void)setAdNetworkId:(id)a3
{
}

- (unint64_t)campaignId
{
  return self->_campaignId;
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (NSString)attributionSignature
{
  return self->_attributionSignature;
}

- (void)setAttributionSignature:(id)a3
{
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (unint64_t)adamId
{
  return self->_adamId;
}

- (unint64_t)sourceAppAdamId
{
  return self->_sourceAppAdamId;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_attributionSignature, 0);

  objc_storeStrong((id *)&self->_adNetworkId, 0);
}

@end