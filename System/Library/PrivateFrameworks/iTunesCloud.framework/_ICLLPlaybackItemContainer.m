@interface _ICLLPlaybackItemContainer
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation _ICLLPlaybackItemContainer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stationHash, 0);
  objc_storeStrong((id *)&self->_mediaId, 0);
  objc_storeStrong((id *)&self->_featureName, 0);

  objc_storeStrong((id *)&self->_containerId, 0);
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_type;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_mediaId hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_containerId hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_featureName hash];
  return v6 ^ [(NSString *)self->_stationHash hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_type != *((_DWORD *)v4 + 10)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
LABEL_15:
    char v9 = 0;
    goto LABEL_16;
  }
  mediaId = self->_mediaId;
  if ((unint64_t)mediaId | *((void *)v4 + 3) && !-[NSString isEqual:](mediaId, "isEqual:")) {
    goto LABEL_15;
  }
  containerId = self->_containerId;
  if ((unint64_t)containerId | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](containerId, "isEqual:")) {
      goto LABEL_15;
    }
  }
  featureName = self->_featureName;
  if ((unint64_t)featureName | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](featureName, "isEqual:")) {
      goto LABEL_15;
    }
  }
  stationHash = self->_stationHash;
  if ((unint64_t)stationHash | *((void *)v4 + 4)) {
    char v9 = -[NSString isEqual:](stationHash, "isEqual:");
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
    *(_DWORD *)(v5 + 40) = self->_type;
    *(unsigned char *)(v5 + 44) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_mediaId copyWithZone:a3];
  v8 = (void *)v6[3];
  v6[3] = v7;

  uint64_t v9 = [(NSString *)self->_containerId copyWithZone:a3];
  v10 = (void *)v6[1];
  v6[1] = v9;

  uint64_t v11 = [(NSString *)self->_featureName copyWithZone:a3];
  v12 = (void *)v6[2];
  v6[2] = v11;

  uint64_t v13 = [(NSString *)self->_stationHash copyWithZone:a3];
  v14 = (void *)v6[4];
  v6[4] = v13;

  return v6;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_mediaId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_containerId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_featureName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_stationHash)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _ICLLPlaybackItemContainerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithInt:self->_type];
    [v3 setObject:v4 forKey:@"type"];
  }
  mediaId = self->_mediaId;
  if (mediaId) {
    [v3 setObject:mediaId forKey:@"mediaId"];
  }
  containerId = self->_containerId;
  if (containerId) {
    [v3 setObject:containerId forKey:@"containerId"];
  }
  featureName = self->_featureName;
  if (featureName) {
    [v3 setObject:featureName forKey:@"featureName"];
  }
  stationHash = self->_stationHash;
  if (stationHash) {
    [v3 setObject:stationHash forKey:@"stationHash"];
  }

  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_ICLLPlaybackItemContainer;
  id v4 = [(_ICLLPlaybackItemContainer *)&v8 description];
  id v5 = [(_ICLLPlaybackItemContainer *)self dictionaryRepresentation];
  NSUInteger v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end