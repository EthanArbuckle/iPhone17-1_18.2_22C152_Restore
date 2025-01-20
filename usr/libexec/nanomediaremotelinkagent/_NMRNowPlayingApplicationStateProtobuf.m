@interface _NMRNowPlayingApplicationStateProtobuf
- (BOOL)hasCompanionBundleIdentifier;
- (BOOL)hasIconDigest;
- (BOOL)hasLocalizedDisplayName;
- (BOOL)hasPlaybackState;
- (BOOL)hasProcessID;
- (BOOL)hasWatchBundleIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)iconDigest;
- (NSString)companionBundleIdentifier;
- (NSString)localizedDisplayName;
- (NSString)watchBundleIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)processID;
- (unint64_t)hash;
- (unsigned)playbackState;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCompanionBundleIdentifier:(id)a3;
- (void)setHasPlaybackState:(BOOL)a3;
- (void)setHasProcessID:(BOOL)a3;
- (void)setIconDigest:(id)a3;
- (void)setLocalizedDisplayName:(id)a3;
- (void)setPlaybackState:(unsigned int)a3;
- (void)setProcessID:(int)a3;
- (void)setWatchBundleIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _NMRNowPlayingApplicationStateProtobuf

- (BOOL)hasCompanionBundleIdentifier
{
  return self->_companionBundleIdentifier != 0;
}

- (BOOL)hasLocalizedDisplayName
{
  return self->_localizedDisplayName != 0;
}

- (void)setPlaybackState:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_playbackState = a3;
}

- (void)setHasPlaybackState:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPlaybackState
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasWatchBundleIdentifier
{
  return self->_watchBundleIdentifier != 0;
}

- (BOOL)hasIconDigest
{
  return self->_iconDigest != 0;
}

- (void)setProcessID:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_processID = a3;
}

- (void)setHasProcessID:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasProcessID
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)_NMRNowPlayingApplicationStateProtobuf;
  char v3 = [(_NMRNowPlayingApplicationStateProtobuf *)&v7 description];
  v4 = [(_NMRNowPlayingApplicationStateProtobuf *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  companionBundleIdentifier = self->_companionBundleIdentifier;
  if (companionBundleIdentifier) {
    [v3 setObject:companionBundleIdentifier forKey:@"companionBundleIdentifier"];
  }
  localizedDisplayName = self->_localizedDisplayName;
  if (localizedDisplayName) {
    [v4 setObject:localizedDisplayName forKey:@"localizedDisplayName"];
  }
  if (*(unsigned char *)&self->_has)
  {
    objc_super v7 = +[NSNumber numberWithUnsignedInt:self->_playbackState];
    [v4 setObject:v7 forKey:@"playbackState"];
  }
  watchBundleIdentifier = self->_watchBundleIdentifier;
  if (watchBundleIdentifier) {
    [v4 setObject:watchBundleIdentifier forKey:@"watchBundleIdentifier"];
  }
  iconDigest = self->_iconDigest;
  if (iconDigest) {
    [v4 setObject:iconDigest forKey:@"iconDigest"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v10 = +[NSNumber numberWithInt:self->_processID];
    [v4 setObject:v10 forKey:@"processID"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10000886C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_companionBundleIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_localizedDisplayName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_watchBundleIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_iconDigest)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_companionBundleIdentifier)
  {
    [v4 setCompanionBundleIdentifier:];
    id v4 = v5;
  }
  if (self->_localizedDisplayName)
  {
    [v5 setLocalizedDisplayName:];
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 8) = self->_playbackState;
    *((unsigned char *)v4 + 48) |= 1u;
  }
  if (self->_watchBundleIdentifier)
  {
    [v5 setWatchBundleIdentifier:];
    id v4 = v5;
  }
  if (self->_iconDigest)
  {
    [v5 setIconDigest:];
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 9) = self->_processID;
    *((unsigned char *)v4 + 48) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSString *)self->_companionBundleIdentifier copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(NSString *)self->_localizedDisplayName copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 8) = self->_playbackState;
    *((unsigned char *)v5 + 48) |= 1u;
  }
  id v10 = [(NSString *)self->_watchBundleIdentifier copyWithZone:a3];
  v11 = (void *)v5[5];
  v5[5] = v10;

  id v12 = [(NSData *)self->_iconDigest copyWithZone:a3];
  v13 = (void *)v5[2];
  v5[2] = v12;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v5 + 9) = self->_processID;
    *((unsigned char *)v5 + 48) |= 2u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  companionBundleIdentifier = self->_companionBundleIdentifier;
  if ((unint64_t)companionBundleIdentifier | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](companionBundleIdentifier, "isEqual:")) {
      goto LABEL_19;
    }
  }
  localizedDisplayName = self->_localizedDisplayName;
  if ((unint64_t)localizedDisplayName | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](localizedDisplayName, "isEqual:")) {
      goto LABEL_19;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_playbackState != *((_DWORD *)v4 + 8)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_19:
    BOOL v9 = 0;
    goto LABEL_20;
  }
  watchBundleIdentifier = self->_watchBundleIdentifier;
  if ((unint64_t)watchBundleIdentifier | *((void *)v4 + 5)
    && !-[NSString isEqual:](watchBundleIdentifier, "isEqual:"))
  {
    goto LABEL_19;
  }
  iconDigest = self->_iconDigest;
  if ((unint64_t)iconDigest | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](iconDigest, "isEqual:")) {
      goto LABEL_19;
    }
  }
  BOOL v9 = (*((unsigned char *)v4 + 48) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_processID != *((_DWORD *)v4 + 9)) {
      goto LABEL_19;
    }
    BOOL v9 = 1;
  }
LABEL_20:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_companionBundleIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_localizedDisplayName hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_playbackState;
  }
  else {
    uint64_t v5 = 0;
  }
  NSUInteger v6 = [(NSString *)self->_watchBundleIdentifier hash];
  unint64_t v7 = (unint64_t)[(NSData *)self->_iconDigest hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v8 = 2654435761 * self->_processID;
  }
  else {
    uint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*((void *)v4 + 1))
  {
    -[_NMRNowPlayingApplicationStateProtobuf setCompanionBundleIdentifier:](self, "setCompanionBundleIdentifier:");
    id v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[_NMRNowPlayingApplicationStateProtobuf setLocalizedDisplayName:](self, "setLocalizedDisplayName:");
    id v4 = v5;
  }
  if (*((unsigned char *)v4 + 48))
  {
    self->_playbackState = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 5))
  {
    -[_NMRNowPlayingApplicationStateProtobuf setWatchBundleIdentifier:](self, "setWatchBundleIdentifier:");
    id v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[_NMRNowPlayingApplicationStateProtobuf setIconDigest:](self, "setIconDigest:");
    id v4 = v5;
  }
  if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
    self->_processID = *((_DWORD *)v4 + 9);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (NSString)companionBundleIdentifier
{
  return self->_companionBundleIdentifier;
}

- (void)setCompanionBundleIdentifier:(id)a3
{
}

- (NSString)localizedDisplayName
{
  return self->_localizedDisplayName;
}

- (void)setLocalizedDisplayName:(id)a3
{
}

- (unsigned)playbackState
{
  return self->_playbackState;
}

- (NSString)watchBundleIdentifier
{
  return self->_watchBundleIdentifier;
}

- (void)setWatchBundleIdentifier:(id)a3
{
}

- (NSData)iconDigest
{
  return self->_iconDigest;
}

- (void)setIconDigest:(id)a3
{
}

- (int)processID
{
  return self->_processID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_localizedDisplayName, 0);
  objc_storeStrong((id *)&self->_iconDigest, 0);

  objc_storeStrong((id *)&self->_companionBundleIdentifier, 0);
}

@end