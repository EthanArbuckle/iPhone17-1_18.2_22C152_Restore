@interface UWLLiveActivityEventChannel
- (BOOL)hasChannelBrandId;
- (BOOL)hasChannelCanonicalId;
- (BOOL)hasChannelExternalLiveServiceId;
- (BOOL)hasChannelInternalLegId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)channelBrandId;
- (NSString)channelCanonicalId;
- (NSString)channelExternalLiveServiceId;
- (NSString)channelInternalLegId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setChannelBrandId:(id)a3;
- (void)setChannelCanonicalId:(id)a3;
- (void)setChannelExternalLiveServiceId:(id)a3;
- (void)setChannelInternalLegId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation UWLLiveActivityEventChannel

- (BOOL)hasChannelCanonicalId
{
  return self->_channelCanonicalId != 0;
}

- (BOOL)hasChannelBrandId
{
  return self->_channelBrandId != 0;
}

- (BOOL)hasChannelExternalLiveServiceId
{
  return self->_channelExternalLiveServiceId != 0;
}

- (BOOL)hasChannelInternalLegId
{
  return self->_channelInternalLegId != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)UWLLiveActivityEventChannel;
  v3 = [(UWLLiveActivityEventChannel *)&v7 description];
  v4 = [(UWLLiveActivityEventChannel *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  channelCanonicalId = self->_channelCanonicalId;
  if (channelCanonicalId) {
    [v3 setObject:channelCanonicalId forKey:@"channel_canonical_id"];
  }
  channelBrandId = self->_channelBrandId;
  if (channelBrandId) {
    [v4 setObject:channelBrandId forKey:@"channel_brand_id"];
  }
  channelExternalLiveServiceId = self->_channelExternalLiveServiceId;
  if (channelExternalLiveServiceId) {
    [v4 setObject:channelExternalLiveServiceId forKey:@"channel_external_live_service_id"];
  }
  channelInternalLegId = self->_channelInternalLegId;
  if (channelInternalLegId) {
    [v4 setObject:channelInternalLegId forKey:@"channel_internal_leg_id"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return UWLLiveActivityEventChannelReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_channelCanonicalId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_channelBrandId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_channelExternalLiveServiceId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_channelInternalLegId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_channelCanonicalId)
  {
    objc_msgSend(v4, "setChannelCanonicalId:");
    id v4 = v5;
  }
  if (self->_channelBrandId)
  {
    objc_msgSend(v5, "setChannelBrandId:");
    id v4 = v5;
  }
  if (self->_channelExternalLiveServiceId)
  {
    objc_msgSend(v5, "setChannelExternalLiveServiceId:");
    id v4 = v5;
  }
  if (self->_channelInternalLegId)
  {
    objc_msgSend(v5, "setChannelInternalLegId:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_channelCanonicalId copyWithZone:a3];
  objc_super v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(NSString *)self->_channelBrandId copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  id v10 = [(NSString *)self->_channelExternalLiveServiceId copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  id v12 = [(NSString *)self->_channelInternalLegId copyWithZone:a3];
  v13 = (void *)v5[4];
  v5[4] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((channelCanonicalId = self->_channelCanonicalId, !((unint64_t)channelCanonicalId | v4[2]))
     || -[NSString isEqual:](channelCanonicalId, "isEqual:"))
    && ((channelBrandId = self->_channelBrandId, !((unint64_t)channelBrandId | v4[1]))
     || -[NSString isEqual:](channelBrandId, "isEqual:"))
    && ((channelExternalLiveServiceId = self->_channelExternalLiveServiceId,
         !((unint64_t)channelExternalLiveServiceId | v4[3]))
     || -[NSString isEqual:](channelExternalLiveServiceId, "isEqual:")))
  {
    channelInternalLegId = self->_channelInternalLegId;
    if ((unint64_t)channelInternalLegId | v4[4]) {
      unsigned __int8 v9 = -[NSString isEqual:](channelInternalLegId, "isEqual:");
    }
    else {
      unsigned __int8 v9 = 1;
    }
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_channelCanonicalId hash];
  unint64_t v4 = [(NSString *)self->_channelBrandId hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_channelExternalLiveServiceId hash];
  return v4 ^ v5 ^ [(NSString *)self->_channelInternalLegId hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  if (v4[2]) {
    -[UWLLiveActivityEventChannel setChannelCanonicalId:](self, "setChannelCanonicalId:");
  }
  if (v4[1]) {
    -[UWLLiveActivityEventChannel setChannelBrandId:](self, "setChannelBrandId:");
  }
  if (v4[3]) {
    -[UWLLiveActivityEventChannel setChannelExternalLiveServiceId:](self, "setChannelExternalLiveServiceId:");
  }
  if (v4[4]) {
    -[UWLLiveActivityEventChannel setChannelInternalLegId:](self, "setChannelInternalLegId:");
  }
}

- (NSString)channelCanonicalId
{
  return self->_channelCanonicalId;
}

- (void)setChannelCanonicalId:(id)a3
{
}

- (NSString)channelBrandId
{
  return self->_channelBrandId;
}

- (void)setChannelBrandId:(id)a3
{
}

- (NSString)channelExternalLiveServiceId
{
  return self->_channelExternalLiveServiceId;
}

- (void)setChannelExternalLiveServiceId:(id)a3
{
}

- (NSString)channelInternalLegId
{
  return self->_channelInternalLegId;
}

- (void)setChannelInternalLegId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channelInternalLegId, 0);
  objc_storeStrong((id *)&self->_channelExternalLiveServiceId, 0);
  objc_storeStrong((id *)&self->_channelCanonicalId, 0);

  objc_storeStrong((id *)&self->_channelBrandId, 0);
}

@end