@interface _MRSystemPlaybackGenericTracklistQueueProtobuf
- (BOOL)hasCollectionIdentifierSet;
- (BOOL)hasFirstTrackIdentifier;
- (BOOL)hasRepeatMode;
- (BOOL)hasShuffleMode;
- (BOOL)hasTrackIdentifiers;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)collectionIdentifierSet;
- (NSString)firstTrackIdentifier;
- (NSString)trackIdentifiers;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)repeatModeAsString:(int)a3;
- (id)shuffleModeAsString:(int)a3;
- (int)StringAsRepeatMode:(id)a3;
- (int)StringAsShuffleMode:(id)a3;
- (int)repeatMode;
- (int)shuffleMode;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCollectionIdentifierSet:(id)a3;
- (void)setFirstTrackIdentifier:(id)a3;
- (void)setHasRepeatMode:(BOOL)a3;
- (void)setHasShuffleMode:(BOOL)a3;
- (void)setRepeatMode:(int)a3;
- (void)setShuffleMode:(int)a3;
- (void)setTrackIdentifiers:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRSystemPlaybackGenericTracklistQueueProtobuf

- (BOOL)hasFirstTrackIdentifier
{
  return self->_firstTrackIdentifier != 0;
}

- (BOOL)hasTrackIdentifiers
{
  return self->_trackIdentifiers != 0;
}

- (BOOL)hasCollectionIdentifierSet
{
  return self->_collectionIdentifierSet != 0;
}

- (int)shuffleMode
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_shuffleMode;
  }
  else {
    return 0;
  }
}

- (void)setShuffleMode:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_shuffleMode = a3;
}

- (void)setHasShuffleMode:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasShuffleMode
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)shuffleModeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E57D48F0[a3];
  }

  return v3;
}

- (int)StringAsShuffleMode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Off"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Albums"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Songs"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)repeatMode
{
  if (*(unsigned char *)&self->_has) {
    return self->_repeatMode;
  }
  else {
    return 0;
  }
}

- (void)setRepeatMode:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_repeatMode = a3;
}

- (void)setHasRepeatMode:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRepeatMode
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)repeatModeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E57D4910[a3];
  }

  return v3;
}

- (int)StringAsRepeatMode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"None"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"One"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"All"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRSystemPlaybackGenericTracklistQueueProtobuf;
  int v4 = [(_MRSystemPlaybackGenericTracklistQueueProtobuf *)&v8 description];
  v5 = [(_MRSystemPlaybackGenericTracklistQueueProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  int v4 = v3;
  firstTrackIdentifier = self->_firstTrackIdentifier;
  if (firstTrackIdentifier) {
    [v3 setObject:firstTrackIdentifier forKey:@"firstTrackIdentifier"];
  }
  trackIdentifiers = self->_trackIdentifiers;
  if (trackIdentifiers) {
    [v4 setObject:trackIdentifiers forKey:@"trackIdentifiers"];
  }
  collectionIdentifierSet = self->_collectionIdentifierSet;
  if (collectionIdentifierSet) {
    [v4 setObject:collectionIdentifierSet forKey:@"collectionIdentifierSet"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t shuffleMode = self->_shuffleMode;
    if (shuffleMode >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_shuffleMode);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E57D48F0[shuffleMode];
    }
    [v4 setObject:v10 forKey:@"shuffleMode"];

    char has = (char)self->_has;
  }
  if (has)
  {
    uint64_t repeatMode = self->_repeatMode;
    if (repeatMode >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_repeatMode);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = off_1E57D4910[repeatMode];
    }
    [v4 setObject:v12 forKey:@"repeatMode"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRSystemPlaybackGenericTracklistQueueProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_firstTrackIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_trackIdentifiers)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_collectionIdentifierSet)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_firstTrackIdentifier)
  {
    objc_msgSend(v4, "setFirstTrackIdentifier:");
    id v4 = v6;
  }
  if (self->_trackIdentifiers)
  {
    objc_msgSend(v6, "setTrackIdentifiers:");
    id v4 = v6;
  }
  if (self->_collectionIdentifierSet)
  {
    objc_msgSend(v6, "setCollectionIdentifierSet:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 7) = self->_shuffleMode;
    *((unsigned char *)v4 + 40) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v4 + 6) = self->_repeatMode;
    *((unsigned char *)v4 + 40) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_firstTrackIdentifier copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSString *)self->_trackIdentifiers copyWithZone:a3];
  v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  uint64_t v10 = [(NSData *)self->_collectionIdentifierSet copyWithZone:a3];
  v11 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v10;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_shuffleMode;
    *(unsigned char *)(v5 + 40) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(_DWORD *)(v5 + 24) = self->_repeatMode;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  firstTrackIdentifier = self->_firstTrackIdentifier;
  if ((unint64_t)firstTrackIdentifier | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](firstTrackIdentifier, "isEqual:")) {
      goto LABEL_17;
    }
  }
  trackIdentifiers = self->_trackIdentifiers;
  if ((unint64_t)trackIdentifiers | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](trackIdentifiers, "isEqual:")) {
      goto LABEL_17;
    }
  }
  collectionIdentifierSet = self->_collectionIdentifierSet;
  if ((unint64_t)collectionIdentifierSet | *((void *)v4 + 1))
  {
    if (!-[NSData isEqual:](collectionIdentifierSet, "isEqual:")) {
      goto LABEL_17;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_shuffleMode != *((_DWORD *)v4 + 7)) {
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
LABEL_17:
    BOOL v8 = 0;
    goto LABEL_18;
  }
  BOOL v8 = (*((unsigned char *)v4 + 40) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_repeatMode != *((_DWORD *)v4 + 6)) {
      goto LABEL_17;
    }
    BOOL v8 = 1;
  }
LABEL_18:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_firstTrackIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_trackIdentifiers hash];
  uint64_t v5 = [(NSData *)self->_collectionIdentifierSet hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v6 = 2654435761 * self->_shuffleMode;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v7 = 2654435761 * self->_repeatMode;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (int *)a3;
  uint64_t v6 = v4;
  if (*((void *)v4 + 2))
  {
    -[_MRSystemPlaybackGenericTracklistQueueProtobuf setFirstTrackIdentifier:](self, "setFirstTrackIdentifier:");
    NSUInteger v4 = v6;
  }
  if (*((void *)v4 + 4))
  {
    -[_MRSystemPlaybackGenericTracklistQueueProtobuf setTrackIdentifiers:](self, "setTrackIdentifiers:");
    NSUInteger v4 = v6;
  }
  if (*((void *)v4 + 1))
  {
    -[_MRSystemPlaybackGenericTracklistQueueProtobuf setCollectionIdentifierSet:](self, "setCollectionIdentifierSet:");
    NSUInteger v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 2) != 0)
  {
    self->_uint64_t shuffleMode = v4[7];
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 40);
  }
  if (v5)
  {
    self->_uint64_t repeatMode = v4[6];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)firstTrackIdentifier
{
  return self->_firstTrackIdentifier;
}

- (void)setFirstTrackIdentifier:(id)a3
{
}

- (NSString)trackIdentifiers
{
  return self->_trackIdentifiers;
}

- (void)setTrackIdentifiers:(id)a3
{
}

- (NSData)collectionIdentifierSet
{
  return self->_collectionIdentifierSet;
}

- (void)setCollectionIdentifierSet:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackIdentifiers, 0);
  objc_storeStrong((id *)&self->_firstTrackIdentifier, 0);

  objc_storeStrong((id *)&self->_collectionIdentifierSet, 0);
}

@end