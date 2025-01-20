@interface PLAssetComputeSyncPayloadWrapper
- (BOOL)hasAssetPayload;
- (BOOL)hasAssetPayloadVersion;
- (BOOL)hasDeviceBuild;
- (BOOL)hasDeviceHwModel;
- (BOOL)hasMediaAnalysisPayload;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)assetPayload;
- (NSData)mediaAnalysisPayload;
- (NSString)deviceBuild;
- (NSString)deviceHwModel;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)assetPayloadVersion;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAssetPayload:(id)a3;
- (void)setAssetPayloadVersion:(unsigned int)a3;
- (void)setDeviceBuild:(id)a3;
- (void)setDeviceHwModel:(id)a3;
- (void)setHasAssetPayloadVersion:(BOOL)a3;
- (void)setMediaAnalysisPayload:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PLAssetComputeSyncPayloadWrapper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaAnalysisPayload, 0);
  objc_storeStrong((id *)&self->_deviceHwModel, 0);
  objc_storeStrong((id *)&self->_deviceBuild, 0);
  objc_storeStrong((id *)&self->_assetPayload, 0);
}

- (void)setDeviceHwModel:(id)a3
{
}

- (NSString)deviceHwModel
{
  return self->_deviceHwModel;
}

- (void)setDeviceBuild:(id)a3
{
}

- (NSString)deviceBuild
{
  return self->_deviceBuild;
}

- (void)setMediaAnalysisPayload:(id)a3
{
}

- (NSData)mediaAnalysisPayload
{
  return self->_mediaAnalysisPayload;
}

- (void)setAssetPayload:(id)a3
{
}

- (NSData)assetPayload
{
  return self->_assetPayload;
}

- (unsigned)assetPayloadVersion
{
  return self->_assetPayloadVersion;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  if (v4[12])
  {
    self->_assetPayloadVersion = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
  v5 = v4;
  if (*((void *)v4 + 1))
  {
    -[PLAssetComputeSyncPayloadWrapper setAssetPayload:](self, "setAssetPayload:");
    v4 = v5;
  }
  if (*((void *)v4 + 5))
  {
    -[PLAssetComputeSyncPayloadWrapper setMediaAnalysisPayload:](self, "setMediaAnalysisPayload:");
    v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[PLAssetComputeSyncPayloadWrapper setDeviceBuild:](self, "setDeviceBuild:");
    v4 = v5;
  }
  if (*((void *)v4 + 4))
  {
    -[PLAssetComputeSyncPayloadWrapper setDeviceHwModel:](self, "setDeviceHwModel:");
    v4 = v5;
  }
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_assetPayloadVersion;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSData *)self->_assetPayload hash] ^ v3;
  uint64_t v5 = [(NSData *)self->_mediaAnalysisPayload hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_deviceBuild hash];
  return v6 ^ [(NSString *)self->_deviceHwModel hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_assetPayloadVersion != *((_DWORD *)v4 + 4)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_15:
    char v9 = 0;
    goto LABEL_16;
  }
  assetPayload = self->_assetPayload;
  if ((unint64_t)assetPayload | *((void *)v4 + 1)
    && !-[NSData isEqual:](assetPayload, "isEqual:"))
  {
    goto LABEL_15;
  }
  mediaAnalysisPayload = self->_mediaAnalysisPayload;
  if ((unint64_t)mediaAnalysisPayload | *((void *)v4 + 5))
  {
    if (!-[NSData isEqual:](mediaAnalysisPayload, "isEqual:")) {
      goto LABEL_15;
    }
  }
  deviceBuild = self->_deviceBuild;
  if ((unint64_t)deviceBuild | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](deviceBuild, "isEqual:")) {
      goto LABEL_15;
    }
  }
  deviceHwModel = self->_deviceHwModel;
  if ((unint64_t)deviceHwModel | *((void *)v4 + 4)) {
    char v9 = -[NSString isEqual:](deviceHwModel, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_16:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  NSUInteger v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_assetPayloadVersion;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  uint64_t v7 = [(NSData *)self->_assetPayload copyWithZone:a3];
  v8 = (void *)v6[1];
  v6[1] = v7;

  uint64_t v9 = [(NSData *)self->_mediaAnalysisPayload copyWithZone:a3];
  v10 = (void *)v6[5];
  v6[5] = v9;

  uint64_t v11 = [(NSString *)self->_deviceBuild copyWithZone:a3];
  v12 = (void *)v6[3];
  v6[3] = v11;

  uint64_t v13 = [(NSString *)self->_deviceHwModel copyWithZone:a3];
  v14 = (void *)v6[4];
  v6[4] = v13;

  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[4] = self->_assetPayloadVersion;
    *((unsigned char *)v4 + 48) |= 1u;
  }
  uint64_t v5 = v4;
  if (self->_assetPayload)
  {
    objc_msgSend(v4, "setAssetPayload:");
    id v4 = v5;
  }
  if (self->_mediaAnalysisPayload)
  {
    objc_msgSend(v5, "setMediaAnalysisPayload:");
    id v4 = v5;
  }
  if (self->_deviceBuild)
  {
    objc_msgSend(v5, "setDeviceBuild:");
    id v4 = v5;
  }
  if (self->_deviceHwModel)
  {
    objc_msgSend(v5, "setDeviceHwModel:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_assetPayload)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_mediaAnalysisPayload)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_deviceBuild)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_deviceHwModel)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PLAssetComputeSyncPayloadWrapperReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithUnsignedInt:self->_assetPayloadVersion];
    [v3 setObject:v4 forKey:@"assetPayloadVersion"];
  }
  assetPayload = self->_assetPayload;
  if (assetPayload) {
    [v3 setObject:assetPayload forKey:@"assetPayload"];
  }
  mediaAnalysisPayload = self->_mediaAnalysisPayload;
  if (mediaAnalysisPayload) {
    [v3 setObject:mediaAnalysisPayload forKey:@"mediaAnalysisPayload"];
  }
  deviceBuild = self->_deviceBuild;
  if (deviceBuild) {
    [v3 setObject:deviceBuild forKey:@"deviceBuild"];
  }
  deviceHwModel = self->_deviceHwModel;
  if (deviceHwModel) {
    [v3 setObject:deviceHwModel forKey:@"deviceHwModel"];
  }
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PLAssetComputeSyncPayloadWrapper;
  id v4 = [(PLAssetComputeSyncPayloadWrapper *)&v8 description];
  id v5 = [(PLAssetComputeSyncPayloadWrapper *)self dictionaryRepresentation];
  NSUInteger v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasDeviceHwModel
{
  return self->_deviceHwModel != 0;
}

- (BOOL)hasDeviceBuild
{
  return self->_deviceBuild != 0;
}

- (BOOL)hasMediaAnalysisPayload
{
  return self->_mediaAnalysisPayload != 0;
}

- (BOOL)hasAssetPayload
{
  return self->_assetPayload != 0;
}

- (BOOL)hasAssetPayloadVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasAssetPayloadVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setAssetPayloadVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_assetPayloadVersion = a3;
}

@end