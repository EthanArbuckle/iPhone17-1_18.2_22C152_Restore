@interface _MRNowPlayingPlayerProtobuf
- (BOOL)hasAudioSessionID;
- (BOOL)hasAudioSessionType;
- (BOOL)hasDisplayName;
- (BOOL)hasIconURL;
- (BOOL)hasIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)displayName;
- (NSString)iconURL;
- (NSString)identifier;
- (id)audioSessionTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsAudioSessionType:(id)a3;
- (int)audioSessionType;
- (int64_t)mxSessionIDAtIndex:(unint64_t)a3;
- (int64_t)mxSessionIDs;
- (unint64_t)hash;
- (unint64_t)mxSessionIDsCount;
- (unsigned)audioSessionID;
- (void)addMxSessionID:(int64_t)a3;
- (void)clearMxSessionIDs;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAudioSessionID:(unsigned int)a3;
- (void)setAudioSessionType:(int)a3;
- (void)setDisplayName:(id)a3;
- (void)setHasAudioSessionID:(BOOL)a3;
- (void)setHasAudioSessionType:(BOOL)a3;
- (void)setIconURL:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setMxSessionIDs:(int64_t *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation _MRNowPlayingPlayerProtobuf

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_iconURL, 0);

  objc_storeStrong((id *)&self->_displayName, 0);
}

- (void)dealloc
{
  PBRepeatedInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)_MRNowPlayingPlayerProtobuf;
  [(_MRNowPlayingPlayerProtobuf *)&v3 dealloc];
}

- (void)setIdentifier:(id)a3
{
}

- (void)setIconURL:(id)a3
{
}

- (void)setHasAudioSessionType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setDisplayName:(id)a3
{
}

- (void)setAudioSessionType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_audioSessionType = a3;
}

- (void)setAudioSessionID:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_audioSessionID = a3;
}

- (unint64_t)mxSessionIDsCount
{
  return self->_mxSessionIDs.count;
}

- (unsigned)audioSessionID
{
  return self->_audioSessionID;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)hasIconURL
{
  return self->_iconURL != 0;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (int)audioSessionType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_audioSessionType;
  }
  else {
    return 0;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_displayName)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_mxSessionIDs.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteInt64Field();
      id v4 = v6;
      ++v5;
    }
    while (v5 < self->_mxSessionIDs.count);
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
  if (self->_iconURL)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasDisplayName
{
  return self->_displayName != 0;
}

- (BOOL)hasAudioSessionType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)audioSessionTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E57D1280[a3];
  }

  return v3;
}

- (int)StringAsAudioSessionType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Default"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LongForm"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Independent"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int64_t)mxSessionIDs
{
  return self->_mxSessionIDs.list;
}

- (void)clearMxSessionIDs
{
}

- (void)addMxSessionID:(int64_t)a3
{
}

- (int64_t)mxSessionIDAtIndex:(unint64_t)a3
{
  p_mxSessionIDs = &self->_mxSessionIDs;
  unint64_t count = self->_mxSessionIDs.count;
  if (count <= a3)
  {
    id v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_mxSessionIDs->list[a3];
}

- (void)setMxSessionIDs:(int64_t *)a3 count:(unint64_t)a4
{
}

- (void)setHasAudioSessionID:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAudioSessionID
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRNowPlayingPlayerProtobuf;
  int v4 = [(_MRNowPlayingPlayerProtobuf *)&v8 description];
  unint64_t v5 = [(_MRNowPlayingPlayerProtobuf *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  int v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  displayName = self->_displayName;
  if (displayName) {
    [v4 setObject:displayName forKey:@"displayName"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t audioSessionType = self->_audioSessionType;
    if (audioSessionType >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_audioSessionType);
      objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v8 = off_1E57D1280[audioSessionType];
    }
    [v4 setObject:v8 forKey:@"audioSessionType"];
  }
  v9 = PBRepeatedInt64NSArray();
  [v4 setObject:v9 forKey:@"mxSessionID"];

  if (*(unsigned char *)&self->_has)
  {
    v10 = [NSNumber numberWithUnsignedInt:self->_audioSessionID];
    [v4 setObject:v10 forKey:@"audioSessionID"];
  }
  iconURL = self->_iconURL;
  if (iconURL) {
    [v4 setObject:iconURL forKey:@"iconURL"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRNowPlayingPlayerProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (self->_identifier)
  {
    objc_msgSend(v4, "setIdentifier:");
    id v4 = v9;
  }
  if (self->_displayName)
  {
    objc_msgSend(v9, "setDisplayName:");
    id v4 = v9;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 9) = self->_audioSessionType;
    *((unsigned char *)v4 + 64) |= 2u;
  }
  if ([(_MRNowPlayingPlayerProtobuf *)self mxSessionIDsCount])
  {
    [v9 clearMxSessionIDs];
    unint64_t v5 = [(_MRNowPlayingPlayerProtobuf *)self mxSessionIDsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        objc_msgSend(v9, "addMxSessionID:", -[_MRNowPlayingPlayerProtobuf mxSessionIDAtIndex:](self, "mxSessionIDAtIndex:", i));
    }
  }
  objc_super v8 = v9;
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v9 + 8) = self->_audioSessionID;
    *((unsigned char *)v9 + 64) |= 1u;
  }
  if (self->_iconURL)
  {
    objc_msgSend(v9, "setIconURL:");
    objc_super v8 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v6;

  uint64_t v8 = [(NSString *)self->_displayName copyWithZone:a3];
  id v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 36) = self->_audioSessionType;
    *(unsigned char *)(v5 + 64) |= 2u;
  }
  PBRepeatedInt64Copy();
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 32) = self->_audioSessionID;
    *(unsigned char *)(v5 + 64) |= 1u;
  }
  uint64_t v10 = [(NSString *)self->_iconURL copyWithZone:a3];
  v11 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v10;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:")) {
      goto LABEL_19;
    }
  }
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:")) {
      goto LABEL_19;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 2) == 0 || self->_audioSessionType != *((_DWORD *)v4 + 9)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 2) != 0)
  {
    goto LABEL_19;
  }
  if (!PBRepeatedInt64IsEqual())
  {
LABEL_19:
    char v8 = 0;
    goto LABEL_20;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_audioSessionID != *((_DWORD *)v4 + 8)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
    goto LABEL_19;
  }
  iconURL = self->_iconURL;
  if ((unint64_t)iconURL | *((void *)v4 + 6)) {
    char v8 = -[NSString isEqual:](iconURL, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_20:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  NSUInteger v4 = [(NSString *)self->_displayName hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_audioSessionType;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = PBRepeatedInt64Hash();
  if (*(unsigned char *)&self->_has) {
    uint64_t v7 = 2654435761 * self->_audioSessionID;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ [(NSString *)self->_iconURL hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (int *)a3;
  id v9 = (unsigned int *)v4;
  if (*((void *)v4 + 7))
  {
    -[_MRNowPlayingPlayerProtobuf setIdentifier:](self, "setIdentifier:");
    NSUInteger v4 = (int *)v9;
  }
  if (*((void *)v4 + 5))
  {
    -[_MRNowPlayingPlayerProtobuf setDisplayName:](self, "setDisplayName:");
    NSUInteger v4 = (int *)v9;
  }
  if ((v4[16] & 2) != 0)
  {
    self->_uint64_t audioSessionType = v4[9];
    *(unsigned char *)&self->_has |= 2u;
  }
  uint64_t v5 = [v4 mxSessionIDsCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[_MRNowPlayingPlayerProtobuf addMxSessionID:](self, "addMxSessionID:", [v9 mxSessionIDAtIndex:i]);
  }
  char v8 = v9;
  if (v9[16])
  {
    self->_audioSessionID = v9[8];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v9 + 6))
  {
    -[_MRNowPlayingPlayerProtobuf setIconURL:](self, "setIconURL:");
    char v8 = v9;
  }
}

- (NSString)iconURL
{
  return self->_iconURL;
}

@end