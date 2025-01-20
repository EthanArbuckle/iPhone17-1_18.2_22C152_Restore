@interface _MRPlaybackQueueRequestProtobuf
+ (Class)contentItemIdentifiersType;
+ (Class)requestedArtworkFormatsType;
+ (Class)requestedRemoteArtworkFormatsType;
- (BOOL)hasArtworkHeight;
- (BOOL)hasArtworkWidth;
- (BOOL)hasCachingPolicy;
- (BOOL)hasContext;
- (BOOL)hasIncludeAlignments;
- (BOOL)hasIncludeAvailableArtworkFormats;
- (BOOL)hasIncludeInfo;
- (BOOL)hasIncludeLanguageOptions;
- (BOOL)hasIncludeLyrics;
- (BOOL)hasIncludeMetadata;
- (BOOL)hasIncludeParticipants;
- (BOOL)hasIncludeSections;
- (BOOL)hasIsLegacyNowPlayingInfoRequest;
- (BOOL)hasLabel;
- (BOOL)hasLength;
- (BOOL)hasLocation;
- (BOOL)hasPlayerPath;
- (BOOL)hasRequestID;
- (BOOL)hasReturnContentItemAssetsInUserCompletion;
- (BOOL)includeAlignments;
- (BOOL)includeAvailableArtworkFormats;
- (BOOL)includeInfo;
- (BOOL)includeLanguageOptions;
- (BOOL)includeLyrics;
- (BOOL)includeMetadata;
- (BOOL)includeParticipants;
- (BOOL)includeSections;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLegacyNowPlayingInfoRequest;
- (BOOL)readFrom:(id)a3;
- (BOOL)returnContentItemAssetsInUserCompletion;
- (NSMutableArray)contentItemIdentifiers;
- (NSMutableArray)requestedArtworkFormats;
- (NSMutableArray)requestedRemoteArtworkFormats;
- (NSString)label;
- (NSString)requestID;
- (_MRNowPlayingPlayerPathProtobuf)playerPath;
- (_MRPlaybackQueueContextProtobuf)context;
- (double)artworkHeight;
- (double)artworkWidth;
- (id)contentItemIdentifiersAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)requestedArtworkFormatsAtIndex:(unint64_t)a3;
- (id)requestedRemoteArtworkFormatsAtIndex:(unint64_t)a3;
- (int)cachingPolicy;
- (int)length;
- (int)location;
- (unint64_t)contentItemIdentifiersCount;
- (unint64_t)hash;
- (unint64_t)requestedArtworkFormatsCount;
- (unint64_t)requestedRemoteArtworkFormatsCount;
- (void)addContentItemIdentifiers:(id)a3;
- (void)addRequestedArtworkFormats:(id)a3;
- (void)addRequestedRemoteArtworkFormats:(id)a3;
- (void)clearContentItemIdentifiers;
- (void)clearRequestedArtworkFormats;
- (void)clearRequestedRemoteArtworkFormats;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setArtworkHeight:(double)a3;
- (void)setArtworkWidth:(double)a3;
- (void)setCachingPolicy:(int)a3;
- (void)setContentItemIdentifiers:(id)a3;
- (void)setContext:(id)a3;
- (void)setHasArtworkHeight:(BOOL)a3;
- (void)setHasArtworkWidth:(BOOL)a3;
- (void)setHasCachingPolicy:(BOOL)a3;
- (void)setHasIncludeAlignments:(BOOL)a3;
- (void)setHasIncludeAvailableArtworkFormats:(BOOL)a3;
- (void)setHasIncludeInfo:(BOOL)a3;
- (void)setHasIncludeLanguageOptions:(BOOL)a3;
- (void)setHasIncludeLyrics:(BOOL)a3;
- (void)setHasIncludeMetadata:(BOOL)a3;
- (void)setHasIncludeParticipants:(BOOL)a3;
- (void)setHasIncludeSections:(BOOL)a3;
- (void)setHasIsLegacyNowPlayingInfoRequest:(BOOL)a3;
- (void)setHasLength:(BOOL)a3;
- (void)setHasLocation:(BOOL)a3;
- (void)setHasReturnContentItemAssetsInUserCompletion:(BOOL)a3;
- (void)setIncludeAlignments:(BOOL)a3;
- (void)setIncludeAvailableArtworkFormats:(BOOL)a3;
- (void)setIncludeInfo:(BOOL)a3;
- (void)setIncludeLanguageOptions:(BOOL)a3;
- (void)setIncludeLyrics:(BOOL)a3;
- (void)setIncludeMetadata:(BOOL)a3;
- (void)setIncludeParticipants:(BOOL)a3;
- (void)setIncludeSections:(BOOL)a3;
- (void)setIsLegacyNowPlayingInfoRequest:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setLength:(int)a3;
- (void)setLocation:(int)a3;
- (void)setPlayerPath:(id)a3;
- (void)setRequestID:(id)a3;
- (void)setRequestedArtworkFormats:(id)a3;
- (void)setRequestedRemoteArtworkFormats:(id)a3;
- (void)setReturnContentItemAssetsInUserCompletion:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRPlaybackQueueRequestProtobuf

- (BOOL)readFrom:(id)a3
{
  return _MRPlaybackQueueRequestProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (NSMutableArray)requestedRemoteArtworkFormats
{
  return self->_requestedRemoteArtworkFormats;
}

- (NSMutableArray)requestedArtworkFormats
{
  return self->_requestedArtworkFormats;
}

- (NSString)requestID
{
  return self->_requestID;
}

- (int)location
{
  return self->_location;
}

- (int)length
{
  return self->_length;
}

- (NSString)label
{
  return self->_label;
}

- (BOOL)isLegacyNowPlayingInfoRequest
{
  return self->_isLegacyNowPlayingInfoRequest;
}

- (BOOL)includeSections
{
  return self->_includeSections;
}

- (BOOL)includeMetadata
{
  return self->_includeMetadata;
}

- (BOOL)includeLyrics
{
  return self->_includeLyrics;
}

- (BOOL)includeLanguageOptions
{
  return self->_includeLanguageOptions;
}

- (BOOL)includeInfo
{
  return self->_includeInfo;
}

- (BOOL)includeAvailableArtworkFormats
{
  return self->_includeAvailableArtworkFormats;
}

- (BOOL)includeAlignments
{
  return self->_includeAlignments;
}

- (BOOL)hasPlayerPath
{
  return self->_playerPath != 0;
}

- (BOOL)hasLocation
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (BOOL)hasLength
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (BOOL)hasIsLegacyNowPlayingInfoRequest
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (BOOL)hasIncludeSections
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (BOOL)hasIncludeMetadata
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (BOOL)hasIncludeLyrics
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (BOOL)hasIncludeLanguageOptions
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (BOOL)hasIncludeInfo
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (BOOL)hasIncludeAvailableArtworkFormats
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (BOOL)hasIncludeAlignments
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (BOOL)hasCachingPolicy
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (BOOL)hasArtworkWidth
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (BOOL)hasArtworkHeight
{
  return *(_WORD *)&self->_has & 1;
}

- (NSMutableArray)contentItemIdentifiers
{
  return self->_contentItemIdentifiers;
}

- (int)cachingPolicy
{
  return self->_cachingPolicy;
}

- (double)artworkWidth
{
  return self->_artworkWidth;
}

- (double)artworkHeight
{
  return self->_artworkHeight;
}

- (void)setReturnContentItemAssetsInUserCompletion:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_returnContentItemAssetsInUserCompletion = a3;
}

- (void)setRequestedRemoteArtworkFormats:(id)a3
{
}

- (void)setRequestedArtworkFormats:(id)a3
{
}

- (void)setRequestID:(id)a3
{
}

- (void)setPlayerPath:(id)a3
{
}

- (void)setLocation:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_location = a3;
}

- (void)setLength:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_length = a3;
}

- (void)setLabel:(id)a3
{
}

- (void)setIsLegacyNowPlayingInfoRequest:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_isLegacyNowPlayingInfoRequest = a3;
}

- (void)setIncludeSections:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_includeSections = a3;
}

- (void)setIncludeMetadata:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_includeMetadata = a3;
}

- (void)setIncludeLyrics:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_includeLyrics = a3;
}

- (void)setIncludeLanguageOptions:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_includeLanguageOptions = a3;
}

- (void)setIncludeInfo:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_includeInfo = a3;
}

- (void)setIncludeAvailableArtworkFormats:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_includeAvailableArtworkFormats = a3;
}

- (void)setHasReturnContentItemAssetsInUserCompletion:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x4000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (void)setHasLocation:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (void)setHasLength:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (void)setHasIsLegacyNowPlayingInfoRequest:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (void)setHasIncludeSections:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (void)setHasIncludeMetadata:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (void)setHasIncludeLyrics:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (void)setHasIncludeLanguageOptions:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (void)setHasIncludeInfo:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (void)setHasIncludeAvailableArtworkFormats:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (void)setHasCachingPolicy:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (void)setHasArtworkWidth:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (void)setHasArtworkHeight:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)setContentItemIdentifiers:(id)a3
{
}

- (void)setCachingPolicy:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_cachingPolicy = a3;
}

- (void)setArtworkWidth:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_artworkWidth = a3;
}

- (void)setArtworkHeight:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_artworkHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedRemoteArtworkFormats, 0);
  objc_storeStrong((id *)&self->_requestedArtworkFormats, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_playerPath, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_contentItemIdentifiers, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x400) == 0) {
        goto LABEL_4;
      }
      goto LABEL_53;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 0x1000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_58:
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
LABEL_10:
  }
    PBDataWriterWriteBOOLField();
LABEL_11:
  if (self->_context) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_requestID) {
    PBDataWriterWriteStringField();
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v6 = self->_contentItemIdentifiers;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v8);
  }

  if ((*(_WORD *)&self->_has & 0x4000) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_playerPath) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(_WORD *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_label) {
    PBDataWriterWriteStringField();
  }
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x2000) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 v11 = (__int16)self->_has;
    if ((v11 & 0x800) == 0)
    {
LABEL_32:
      if ((v11 & 0x40) == 0) {
        goto LABEL_34;
      }
      goto LABEL_33;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_32;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
LABEL_33:
  }
    PBDataWriterWriteBOOLField();
LABEL_34:
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v12 = self->_requestedArtworkFormats;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v26 objects:v35 count:16];
    }
    while (v14);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v17 = self->_requestedRemoteArtworkFormats;
  uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v22 objects:v34 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v23;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v23 != v20) {
          objc_enumerationMutation(v17);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v22 objects:v34 count:16];
    }
    while (v19);
  }

  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)hasContext
{
  return self->_context != 0;
}

- (BOOL)hasRequestID
{
  return self->_requestID != 0;
}

- (void)clearContentItemIdentifiers
{
}

- (void)addContentItemIdentifiers:(id)a3
{
  id v4 = a3;
  contentItemIdentifiers = self->_contentItemIdentifiers;
  id v8 = v4;
  if (!contentItemIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_contentItemIdentifiers;
    self->_contentItemIdentifiers = v6;

    id v4 = v8;
    contentItemIdentifiers = self->_contentItemIdentifiers;
  }
  [(NSMutableArray *)contentItemIdentifiers addObject:v4];
}

- (unint64_t)contentItemIdentifiersCount
{
  return [(NSMutableArray *)self->_contentItemIdentifiers count];
}

- (id)contentItemIdentifiersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_contentItemIdentifiers objectAtIndex:a3];
}

+ (Class)contentItemIdentifiersType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasReturnContentItemAssetsInUserCompletion
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (BOOL)hasLabel
{
  return self->_label != 0;
}

- (void)setIncludeParticipants:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_includeParticipants = a3;
}

- (void)setHasIncludeParticipants:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasIncludeParticipants
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)clearRequestedArtworkFormats
{
}

- (void)addRequestedArtworkFormats:(id)a3
{
  id v4 = a3;
  requestedArtworkFormats = self->_requestedArtworkFormats;
  id v8 = v4;
  if (!requestedArtworkFormats)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_requestedArtworkFormats;
    self->_requestedArtworkFormats = v6;

    id v4 = v8;
    requestedArtworkFormats = self->_requestedArtworkFormats;
  }
  [(NSMutableArray *)requestedArtworkFormats addObject:v4];
}

- (unint64_t)requestedArtworkFormatsCount
{
  return [(NSMutableArray *)self->_requestedArtworkFormats count];
}

- (id)requestedArtworkFormatsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_requestedArtworkFormats objectAtIndex:a3];
}

+ (Class)requestedArtworkFormatsType
{
  return (Class)objc_opt_class();
}

- (void)clearRequestedRemoteArtworkFormats
{
}

- (void)addRequestedRemoteArtworkFormats:(id)a3
{
  id v4 = a3;
  requestedRemoteArtworkFormats = self->_requestedRemoteArtworkFormats;
  id v8 = v4;
  if (!requestedRemoteArtworkFormats)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_requestedRemoteArtworkFormats;
    self->_requestedRemoteArtworkFormats = v6;

    id v4 = v8;
    requestedRemoteArtworkFormats = self->_requestedRemoteArtworkFormats;
  }
  [(NSMutableArray *)requestedRemoteArtworkFormats addObject:v4];
}

- (unint64_t)requestedRemoteArtworkFormatsCount
{
  return [(NSMutableArray *)self->_requestedRemoteArtworkFormats count];
}

- (id)requestedRemoteArtworkFormatsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_requestedRemoteArtworkFormats objectAtIndex:a3];
}

+ (Class)requestedRemoteArtworkFormatsType
{
  return (Class)objc_opt_class();
}

- (void)setIncludeAlignments:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_includeAlignments = a3;
}

- (void)setHasIncludeAlignments:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRPlaybackQueueRequestProtobuf;
  id v4 = [(_MRPlaybackQueueRequestProtobuf *)&v8 description];
  v5 = [(_MRPlaybackQueueRequestProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    v21 = [NSNumber numberWithInt:self->_location];
    [v3 setObject:v21 forKey:@"location"];

    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x400) == 0) {
        goto LABEL_4;
      }
      goto LABEL_40;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  long long v22 = [NSNumber numberWithInt:self->_length];
  [v3 setObject:v22 forKey:@"length"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_41;
  }
LABEL_40:
  long long v23 = [NSNumber numberWithBool:self->_includeMetadata];
  [v3 setObject:v23 forKey:@"includeMetadata"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_42;
  }
LABEL_41:
  long long v24 = [NSNumber numberWithDouble:self->_artworkWidth];
  [v3 setObject:v24 forKey:@"artworkWidth"];

  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_43;
  }
LABEL_42:
  long long v25 = [NSNumber numberWithDouble:self->_artworkHeight];
  [v3 setObject:v25 forKey:@"artworkHeight"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 0x1000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_44;
  }
LABEL_43:
  long long v26 = [NSNumber numberWithBool:self->_includeLyrics];
  [v3 setObject:v26 forKey:@"includeLyrics"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_45;
  }
LABEL_44:
  long long v27 = [NSNumber numberWithBool:self->_includeSections];
  [v3 setObject:v27 forKey:@"includeSections"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_45:
  long long v28 = [NSNumber numberWithBool:self->_includeInfo];
  [v3 setObject:v28 forKey:@"includeInfo"];

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_10:
    v5 = [NSNumber numberWithBool:self->_includeLanguageOptions];
    [v3 setObject:v5 forKey:@"includeLanguageOptions"];
  }
LABEL_11:
  context = self->_context;
  if (context)
  {
    uint64_t v7 = [(_MRPlaybackQueueContextProtobuf *)context dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"context"];
  }
  requestID = self->_requestID;
  if (requestID) {
    [v3 setObject:requestID forKey:@"requestID"];
  }
  contentItemIdentifiers = self->_contentItemIdentifiers;
  if (contentItemIdentifiers) {
    [v3 setObject:contentItemIdentifiers forKey:@"contentItemIdentifiers"];
  }
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
    v10 = [NSNumber numberWithBool:self->_returnContentItemAssetsInUserCompletion];
    [v3 setObject:v10 forKey:@"returnContentItemAssetsInUserCompletion"];
  }
  playerPath = self->_playerPath;
  if (playerPath)
  {
    v12 = [(_MRNowPlayingPlayerPathProtobuf *)playerPath dictionaryRepresentation];
    [v3 setObject:v12 forKey:@"playerPath"];
  }
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    uint64_t v13 = [NSNumber numberWithInt:self->_cachingPolicy];
    [v3 setObject:v13 forKey:@"cachingPolicy"];
  }
  label = self->_label;
  if (label) {
    [v3 setObject:label forKey:@"label"];
  }
  __int16 v15 = (__int16)self->_has;
  if ((v15 & 0x2000) != 0)
  {
    long long v29 = [NSNumber numberWithBool:self->_isLegacyNowPlayingInfoRequest];
    [v3 setObject:v29 forKey:@"isLegacyNowPlayingInfoRequest"];

    __int16 v15 = (__int16)self->_has;
    if ((v15 & 0x800) == 0)
    {
LABEL_27:
      if ((v15 & 0x40) == 0) {
        goto LABEL_29;
      }
      goto LABEL_28;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_27;
  }
  long long v30 = [NSNumber numberWithBool:self->_includeParticipants];
  [v3 setObject:v30 forKey:@"includeParticipants"];

  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_28:
    v16 = [NSNumber numberWithBool:self->_includeAvailableArtworkFormats];
    [v3 setObject:v16 forKey:@"includeAvailableArtworkFormats"];
  }
LABEL_29:
  requestedArtworkFormats = self->_requestedArtworkFormats;
  if (requestedArtworkFormats) {
    [v3 setObject:requestedArtworkFormats forKey:@"requestedArtworkFormats"];
  }
  requestedRemoteArtworkFormats = self->_requestedRemoteArtworkFormats;
  if (requestedRemoteArtworkFormats) {
    [v3 setObject:requestedRemoteArtworkFormats forKey:@"requestedRemoteArtworkFormats"];
  }
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    uint64_t v19 = [NSNumber numberWithBool:self->_includeAlignments];
    [v3 setObject:v19 forKey:@"includeAlignments"];
  }

  return v3;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    v4[15] = self->_location;
    *((_WORD *)v4 + 54) |= 0x10u;
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x400) == 0) {
        goto LABEL_4;
      }
      goto LABEL_46;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  v4[14] = self->_length;
  *((_WORD *)v4 + 54) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_47;
  }
LABEL_46:
  *((unsigned char *)v4 + 101) = self->_includeMetadata;
  *((_WORD *)v4 + 54) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_48;
  }
LABEL_47:
  *((void *)v4 + 2) = *(void *)&self->_artworkWidth;
  *((_WORD *)v4 + 54) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_49;
  }
LABEL_48:
  *((void *)v4 + 1) = *(void *)&self->_artworkHeight;
  *((_WORD *)v4 + 54) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 0x1000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_50;
  }
LABEL_49:
  *((unsigned char *)v4 + 100) = self->_includeLyrics;
  *((_WORD *)v4 + 54) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_51;
  }
LABEL_50:
  *((unsigned char *)v4 + 103) = self->_includeSections;
  *((_WORD *)v4 + 54) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_51:
  *((unsigned char *)v4 + 98) = self->_includeInfo;
  *((_WORD *)v4 + 54) |= 0x80u;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_10:
    *((unsigned char *)v4 + 99) = self->_includeLanguageOptions;
    *((_WORD *)v4 + 54) |= 0x100u;
  }
LABEL_11:
  id v20 = v4;
  if (self->_context) {
    objc_msgSend(v4, "setContext:");
  }
  if (self->_requestID) {
    objc_msgSend(v20, "setRequestID:");
  }
  if ([(_MRPlaybackQueueRequestProtobuf *)self contentItemIdentifiersCount])
  {
    [v20 clearContentItemIdentifiers];
    unint64_t v6 = [(_MRPlaybackQueueRequestProtobuf *)self contentItemIdentifiersCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(_MRPlaybackQueueRequestProtobuf *)self contentItemIdentifiersAtIndex:i];
        [v20 addContentItemIdentifiers:v9];
      }
    }
  }
  v10 = v20;
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
    *((unsigned char *)v20 + 105) = self->_returnContentItemAssetsInUserCompletion;
    *((_WORD *)v20 + 54) |= 0x4000u;
  }
  if (self->_playerPath)
  {
    objc_msgSend(v20, "setPlayerPath:");
    v10 = v20;
  }
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    v10[6] = self->_cachingPolicy;
    *((_WORD *)v10 + 54) |= 4u;
  }
  if (self->_label)
  {
    objc_msgSend(v20, "setLabel:");
    v10 = v20;
  }
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x2000) == 0)
  {
    if ((*(_WORD *)&self->_has & 0x800) == 0) {
      goto LABEL_29;
    }
LABEL_54:
    *((unsigned char *)v10 + 102) = self->_includeParticipants;
    *((_WORD *)v10 + 54) |= 0x800u;
    if ((*(_WORD *)&self->_has & 0x40) == 0) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  *((unsigned char *)v10 + 104) = self->_isLegacyNowPlayingInfoRequest;
  *((_WORD *)v10 + 54) |= 0x2000u;
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x800) != 0) {
    goto LABEL_54;
  }
LABEL_29:
  if ((v11 & 0x40) != 0)
  {
LABEL_30:
    *((unsigned char *)v10 + 97) = self->_includeAvailableArtworkFormats;
    *((_WORD *)v10 + 54) |= 0x40u;
  }
LABEL_31:
  if ([(_MRPlaybackQueueRequestProtobuf *)self requestedArtworkFormatsCount])
  {
    [v20 clearRequestedArtworkFormats];
    unint64_t v12 = [(_MRPlaybackQueueRequestProtobuf *)self requestedArtworkFormatsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t j = 0; j != v13; ++j)
      {
        __int16 v15 = [(_MRPlaybackQueueRequestProtobuf *)self requestedArtworkFormatsAtIndex:j];
        [v20 addRequestedArtworkFormats:v15];
      }
    }
  }
  if ([(_MRPlaybackQueueRequestProtobuf *)self requestedRemoteArtworkFormatsCount])
  {
    [v20 clearRequestedRemoteArtworkFormats];
    unint64_t v16 = [(_MRPlaybackQueueRequestProtobuf *)self requestedRemoteArtworkFormatsCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t k = 0; k != v17; ++k)
      {
        uint64_t v19 = [(_MRPlaybackQueueRequestProtobuf *)self requestedRemoteArtworkFormatsAtIndex:k];
        [v20 addRequestedRemoteArtworkFormats:v19];
      }
    }
  }
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    *((unsigned char *)v20 + 96) = self->_includeAlignments;
    *((_WORD *)v20 + 54) |= 0x20u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_location;
    *(_WORD *)(v5 + 108) |= 0x10u;
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x400) == 0) {
        goto LABEL_4;
      }
      goto LABEL_45;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 56) = self->_length;
  *(_WORD *)(v5 + 108) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_46;
  }
LABEL_45:
  *(unsigned char *)(v5 + 101) = self->_includeMetadata;
  *(_WORD *)(v5 + 108) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_47;
  }
LABEL_46:
  *(double *)(v5 + 16) = self->_artworkWidth;
  *(_WORD *)(v5 + 108) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_48;
  }
LABEL_47:
  *(double *)(v5 + 8) = self->_artworkHeight;
  *(_WORD *)(v5 + 108) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 0x1000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_49;
  }
LABEL_48:
  *(unsigned char *)(v5 + 100) = self->_includeLyrics;
  *(_WORD *)(v5 + 108) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_50;
  }
LABEL_49:
  *(unsigned char *)(v5 + 103) = self->_includeSections;
  *(_WORD *)(v5 + 108) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_50:
  *(unsigned char *)(v5 + 98) = self->_includeInfo;
  *(_WORD *)(v5 + 108) |= 0x80u;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_10:
    *(unsigned char *)(v5 + 99) = self->_includeLanguageOptions;
    *(_WORD *)(v5 + 108) |= 0x100u;
  }
LABEL_11:
  id v8 = [(_MRPlaybackQueueContextProtobuf *)self->_context copyWithZone:a3];
  uint64_t v9 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v8;

  uint64_t v10 = [(NSString *)self->_requestID copyWithZone:a3];
  __int16 v11 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v10;

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  unint64_t v12 = self->_contentItemIdentifiers;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v45 != v15) {
          objc_enumerationMutation(v12);
        }
        unint64_t v17 = (void *)[*(id *)(*((void *)&v44 + 1) + 8 * i) copyWithZone:a3];
        [(id)v6 addContentItemIdentifiers:v17];
      }
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v44 objects:v50 count:16];
    }
    while (v14);
  }

  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
    *(unsigned char *)(v6 + 105) = self->_returnContentItemAssetsInUserCompletion;
    *(_WORD *)(v6 + 108) |= 0x4000u;
  }
  id v18 = [(_MRNowPlayingPlayerPathProtobuf *)self->_playerPath copyWithZone:a3];
  uint64_t v19 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v18;

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v6 + 24) = self->_cachingPolicy;
    *(_WORD *)(v6 + 108) |= 4u;
  }
  uint64_t v20 = [(NSString *)self->_label copyWithZone:a3];
  v21 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v20;

  __int16 v22 = (__int16)self->_has;
  if ((v22 & 0x2000) != 0)
  {
    *(unsigned char *)(v6 + 104) = self->_isLegacyNowPlayingInfoRequest;
    *(_WORD *)(v6 + 108) |= 0x2000u;
    __int16 v22 = (__int16)self->_has;
    if ((v22 & 0x800) == 0)
    {
LABEL_24:
      if ((v22 & 0x40) == 0) {
        goto LABEL_26;
      }
      goto LABEL_25;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_24;
  }
  *(unsigned char *)(v6 + 102) = self->_includeParticipants;
  *(_WORD *)(v6 + 108) |= 0x800u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_25:
    *(unsigned char *)(v6 + 97) = self->_includeAvailableArtworkFormats;
    *(_WORD *)(v6 + 108) |= 0x40u;
  }
LABEL_26:
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v23 = self->_requestedArtworkFormats;
  uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v40 objects:v49 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v41;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v41 != v26) {
          objc_enumerationMutation(v23);
        }
        long long v28 = (void *)[*(id *)(*((void *)&v40 + 1) + 8 * j) copyWithZone:a3];
        [(id)v6 addRequestedArtworkFormats:v28];
      }
      uint64_t v25 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v40 objects:v49 count:16];
    }
    while (v25);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v29 = self->_requestedRemoteArtworkFormats;
  uint64_t v30 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v36 objects:v48 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v37;
    do
    {
      for (uint64_t k = 0; k != v31; ++k)
      {
        if (*(void *)v37 != v32) {
          objc_enumerationMutation(v29);
        }
        v34 = objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * k), "copyWithZone:", a3, (void)v36);
        [(id)v6 addRequestedRemoteArtworkFormats:v34];
      }
      uint64_t v31 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v36 objects:v48 count:16];
    }
    while (v31);
  }

  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    *(unsigned char *)(v6 + 96) = self->_includeAlignments;
    *(_WORD *)(v6 + 108) |= 0x20u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_118;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 54);
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_location != *((_DWORD *)v4 + 15)) {
      goto LABEL_118;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_118;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_length != *((_DWORD *)v4 + 14)) {
      goto LABEL_118;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_118;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 54) & 0x400) == 0) {
      goto LABEL_118;
    }
    if (self->_includeMetadata)
    {
      if (!*((unsigned char *)v4 + 101)) {
        goto LABEL_118;
      }
    }
    else if (*((unsigned char *)v4 + 101))
    {
      goto LABEL_118;
    }
  }
  else if ((*((_WORD *)v4 + 54) & 0x400) != 0)
  {
    goto LABEL_118;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_artworkWidth != *((double *)v4 + 2)) {
      goto LABEL_118;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_118;
  }
  if (has)
  {
    if ((v6 & 1) == 0 || self->_artworkHeight != *((double *)v4 + 1)) {
      goto LABEL_118;
    }
  }
  else if (v6)
  {
    goto LABEL_118;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 54) & 0x200) == 0) {
      goto LABEL_118;
    }
    if (self->_includeLyrics)
    {
      if (!*((unsigned char *)v4 + 100)) {
        goto LABEL_118;
      }
    }
    else if (*((unsigned char *)v4 + 100))
    {
      goto LABEL_118;
    }
  }
  else if ((*((_WORD *)v4 + 54) & 0x200) != 0)
  {
    goto LABEL_118;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 54) & 0x1000) == 0) {
      goto LABEL_118;
    }
    if (self->_includeSections)
    {
      if (!*((unsigned char *)v4 + 103)) {
        goto LABEL_118;
      }
    }
    else if (*((unsigned char *)v4 + 103))
    {
      goto LABEL_118;
    }
  }
  else if ((*((_WORD *)v4 + 54) & 0x1000) != 0)
  {
    goto LABEL_118;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0) {
      goto LABEL_118;
    }
    if (self->_includeInfo)
    {
      if (!*((unsigned char *)v4 + 98)) {
        goto LABEL_118;
      }
    }
    else if (*((unsigned char *)v4 + 98))
    {
      goto LABEL_118;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_118;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 54) & 0x100) == 0) {
      goto LABEL_118;
    }
    if (self->_includeLanguageOptions)
    {
      if (!*((unsigned char *)v4 + 99)) {
        goto LABEL_118;
      }
    }
    else if (*((unsigned char *)v4 + 99))
    {
      goto LABEL_118;
    }
  }
  else if ((*((_WORD *)v4 + 54) & 0x100) != 0)
  {
    goto LABEL_118;
  }
  context = self->_context;
  if ((unint64_t)context | *((void *)v4 + 5)
    && !-[_MRPlaybackQueueContextProtobuf isEqual:](context, "isEqual:"))
  {
    goto LABEL_118;
  }
  requestID = self->_requestID;
  if ((unint64_t)requestID | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](requestID, "isEqual:")) {
      goto LABEL_118;
    }
  }
  contentItemIdentifiers = self->_contentItemIdentifiers;
  if ((unint64_t)contentItemIdentifiers | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](contentItemIdentifiers, "isEqual:")) {
      goto LABEL_118;
    }
  }
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x4000) != 0)
  {
    if ((*((_WORD *)v4 + 54) & 0x4000) == 0) {
      goto LABEL_118;
    }
    if (self->_returnContentItemAssetsInUserCompletion)
    {
      if (!*((unsigned char *)v4 + 105)) {
        goto LABEL_118;
      }
    }
    else if (*((unsigned char *)v4 + 105))
    {
      goto LABEL_118;
    }
  }
  else if ((*((_WORD *)v4 + 54) & 0x4000) != 0)
  {
    goto LABEL_118;
  }
  playerPath = self->_playerPath;
  if ((unint64_t)playerPath | *((void *)v4 + 8))
  {
    if (!-[_MRNowPlayingPlayerPathProtobuf isEqual:](playerPath, "isEqual:")) {
      goto LABEL_118;
    }
    __int16 v10 = (__int16)self->_has;
  }
  __int16 v12 = *((_WORD *)v4 + 54);
  if ((v10 & 4) != 0)
  {
    if ((v12 & 4) == 0 || self->_cachingPolicy != *((_DWORD *)v4 + 6)) {
      goto LABEL_118;
    }
  }
  else if ((v12 & 4) != 0)
  {
    goto LABEL_118;
  }
  label = self->_label;
  if ((unint64_t)label | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](label, "isEqual:")) {
      goto LABEL_118;
    }
    __int16 v10 = (__int16)self->_has;
  }
  __int16 v14 = *((_WORD *)v4 + 54);
  if ((v10 & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 54) & 0x2000) == 0) {
      goto LABEL_118;
    }
    if (self->_isLegacyNowPlayingInfoRequest)
    {
      if (!*((unsigned char *)v4 + 104)) {
        goto LABEL_118;
      }
    }
    else if (*((unsigned char *)v4 + 104))
    {
      goto LABEL_118;
    }
  }
  else if ((*((_WORD *)v4 + 54) & 0x2000) != 0)
  {
    goto LABEL_118;
  }
  if ((v10 & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 54) & 0x800) == 0) {
      goto LABEL_118;
    }
    if (self->_includeParticipants)
    {
      if (!*((unsigned char *)v4 + 102)) {
        goto LABEL_118;
      }
    }
    else if (*((unsigned char *)v4 + 102))
    {
      goto LABEL_118;
    }
  }
  else if ((*((_WORD *)v4 + 54) & 0x800) != 0)
  {
    goto LABEL_118;
  }
  if ((v10 & 0x40) != 0)
  {
    if ((v14 & 0x40) == 0) {
      goto LABEL_118;
    }
    if (self->_includeAvailableArtworkFormats)
    {
      if (!*((unsigned char *)v4 + 97)) {
        goto LABEL_118;
      }
    }
    else if (*((unsigned char *)v4 + 97))
    {
      goto LABEL_118;
    }
  }
  else if ((v14 & 0x40) != 0)
  {
    goto LABEL_118;
  }
  requestedArtworkFormats = self->_requestedArtworkFormats;
  if ((unint64_t)requestedArtworkFormats | *((void *)v4 + 10)
    && !-[NSMutableArray isEqual:](requestedArtworkFormats, "isEqual:"))
  {
    goto LABEL_118;
  }
  requestedRemoteArtworkFormats = self->_requestedRemoteArtworkFormats;
  if ((unint64_t)requestedRemoteArtworkFormats | *((void *)v4 + 11))
  {
    if (!-[NSMutableArray isEqual:](requestedRemoteArtworkFormats, "isEqual:")) {
      goto LABEL_118;
    }
  }
  __int16 v17 = *((_WORD *)v4 + 54);
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    if ((v17 & 0x20) != 0)
    {
      if (self->_includeAlignments)
      {
        if (!*((unsigned char *)v4 + 96)) {
          goto LABEL_118;
        }
      }
      else if (*((unsigned char *)v4 + 96))
      {
        goto LABEL_118;
      }
      BOOL v18 = 1;
      goto LABEL_119;
    }
LABEL_118:
    BOOL v18 = 0;
    goto LABEL_119;
  }
  BOOL v18 = (v17 & 0x20) == 0;
LABEL_119:

  return v18;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    uint64_t v36 = 2654435761 * self->_location;
    if ((has & 8) != 0)
    {
LABEL_3:
      uint64_t v35 = 2654435761 * self->_length;
      if ((*(_WORD *)&self->_has & 0x400) != 0) {
        goto LABEL_4;
      }
LABEL_11:
      uint64_t v34 = 0;
      if ((has & 2) != 0) {
        goto LABEL_5;
      }
LABEL_12:
      unint64_t v8 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v36 = 0;
    if ((has & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v35 = 0;
  if ((*(_WORD *)&self->_has & 0x400) == 0) {
    goto LABEL_11;
  }
LABEL_4:
  uint64_t v34 = 2654435761 * self->_includeMetadata;
  if ((has & 2) == 0) {
    goto LABEL_12;
  }
LABEL_5:
  double artworkWidth = self->_artworkWidth;
  double v5 = -artworkWidth;
  if (artworkWidth >= 0.0) {
    double v5 = self->_artworkWidth;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0) {
      v8 += (unint64_t)v7;
    }
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
LABEL_15:
  if (has)
  {
    double artworkHeight = self->_artworkHeight;
    double v11 = -artworkHeight;
    if (artworkHeight >= 0.0) {
      double v11 = self->_artworkHeight;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if ((has & 0x200) == 0)
  {
    uint64_t v32 = 0;
    if ((has & 0x1000) != 0) {
      goto LABEL_25;
    }
LABEL_28:
    uint64_t v31 = 0;
    if ((has & 0x80) != 0) {
      goto LABEL_26;
    }
    goto LABEL_29;
  }
  uint64_t v32 = 2654435761 * self->_includeLyrics;
  if ((has & 0x1000) == 0) {
    goto LABEL_28;
  }
LABEL_25:
  uint64_t v31 = 2654435761 * self->_includeSections;
  if ((has & 0x80) != 0)
  {
LABEL_26:
    uint64_t v30 = 2654435761 * self->_includeInfo;
    goto LABEL_30;
  }
LABEL_29:
  uint64_t v30 = 0;
LABEL_30:
  unint64_t v33 = v9;
  if ((has & 0x100) != 0) {
    uint64_t v29 = 2654435761 * self->_includeLanguageOptions;
  }
  else {
    uint64_t v29 = 0;
  }
  unint64_t v28 = [(_MRPlaybackQueueContextProtobuf *)self->_context hash];
  NSUInteger v27 = [(NSString *)self->_requestID hash];
  uint64_t v26 = [(NSMutableArray *)self->_contentItemIdentifiers hash];
  if ((*(_WORD *)&self->_has & 0x4000) != 0) {
    uint64_t v25 = 2654435761 * self->_returnContentItemAssetsInUserCompletion;
  }
  else {
    uint64_t v25 = 0;
  }
  unint64_t v24 = [(_MRNowPlayingPlayerPathProtobuf *)self->_playerPath hash];
  if ((*(_WORD *)&self->_has & 4) != 0) {
    uint64_t v14 = 2654435761 * self->_cachingPolicy;
  }
  else {
    uint64_t v14 = 0;
  }
  NSUInteger v15 = [(NSString *)self->_label hash];
  __int16 v16 = (__int16)self->_has;
  if ((v16 & 0x2000) == 0)
  {
    uint64_t v17 = 0;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_41;
    }
LABEL_44:
    uint64_t v18 = 0;
    if ((v16 & 0x40) != 0) {
      goto LABEL_42;
    }
    goto LABEL_45;
  }
  uint64_t v17 = 2654435761 * self->_isLegacyNowPlayingInfoRequest;
  if ((*(_WORD *)&self->_has & 0x800) == 0) {
    goto LABEL_44;
  }
LABEL_41:
  uint64_t v18 = 2654435761 * self->_includeParticipants;
  if ((v16 & 0x40) != 0)
  {
LABEL_42:
    uint64_t v19 = 2654435761 * self->_includeAvailableArtworkFormats;
    goto LABEL_46;
  }
LABEL_45:
  uint64_t v19 = 0;
LABEL_46:
  uint64_t v20 = [(NSMutableArray *)self->_requestedArtworkFormats hash];
  uint64_t v21 = [(NSMutableArray *)self->_requestedRemoteArtworkFormats hash];
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    uint64_t v22 = 2654435761 * self->_includeAlignments;
  }
  else {
    uint64_t v22 = 0;
  }
  return v35 ^ v36 ^ v34 ^ v8 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v14 ^ v15 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  __int16 v6 = *((_WORD *)v4 + 54);
  if ((v6 & 0x10) != 0)
  {
    self->_location = *((_DWORD *)v4 + 15);
    *(_WORD *)&self->_has |= 0x10u;
    __int16 v6 = *((_WORD *)v4 + 54);
    if ((v6 & 8) == 0)
    {
LABEL_3:
      if ((v6 & 0x400) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((v6 & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_length = *((_DWORD *)v4 + 14);
  *(_WORD *)&self->_has |= 8u;
  __int16 v6 = *((_WORD *)v4 + 54);
  if ((v6 & 0x400) == 0)
  {
LABEL_4:
    if ((v6 & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_includeMetadata = *((unsigned char *)v4 + 101);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v6 = *((_WORD *)v4 + 54);
  if ((v6 & 2) == 0)
  {
LABEL_5:
    if ((v6 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_double artworkWidth = *((double *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  __int16 v6 = *((_WORD *)v4 + 54);
  if ((v6 & 1) == 0)
  {
LABEL_6:
    if ((v6 & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_double artworkHeight = *((double *)v4 + 1);
  *(_WORD *)&self->_has |= 1u;
  __int16 v6 = *((_WORD *)v4 + 54);
  if ((v6 & 0x200) == 0)
  {
LABEL_7:
    if ((v6 & 0x1000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_includeLyrics = *((unsigned char *)v4 + 100);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v6 = *((_WORD *)v4 + 54);
  if ((v6 & 0x1000) == 0)
  {
LABEL_8:
    if ((v6 & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_includeSections = *((unsigned char *)v4 + 103);
  *(_WORD *)&self->_has |= 0x1000u;
  __int16 v6 = *((_WORD *)v4 + 54);
  if ((v6 & 0x80) == 0)
  {
LABEL_9:
    if ((v6 & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_21:
  self->_includeInfo = *((unsigned char *)v4 + 98);
  *(_WORD *)&self->_has |= 0x80u;
  if ((*((_WORD *)v4 + 54) & 0x100) != 0)
  {
LABEL_10:
    self->_includeLanguageOptions = *((unsigned char *)v4 + 99);
    *(_WORD *)&self->_has |= 0x100u;
  }
LABEL_11:
  context = self->_context;
  uint64_t v8 = *((void *)v5 + 5);
  if (context)
  {
    if (v8) {
      -[_MRPlaybackQueueContextProtobuf mergeFrom:](context, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[_MRPlaybackQueueRequestProtobuf setContext:](self, "setContext:");
  }
  if (*((void *)v5 + 9)) {
    -[_MRPlaybackQueueRequestProtobuf setRequestID:](self, "setRequestID:");
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v9 = *((id *)v5 + 4);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v36 != v12) {
          objc_enumerationMutation(v9);
        }
        [(_MRPlaybackQueueRequestProtobuf *)self addContentItemIdentifiers:*(void *)(*((void *)&v35 + 1) + 8 * i)];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v11);
  }

  if ((*((_WORD *)v5 + 54) & 0x4000) != 0)
  {
    self->_returnContentItemAssetsInUserCompletion = *((unsigned char *)v5 + 105);
    *(_WORD *)&self->_has |= 0x4000u;
  }
  playerPath = self->_playerPath;
  uint64_t v15 = *((void *)v5 + 8);
  if (playerPath)
  {
    if (v15) {
      -[_MRNowPlayingPlayerPathProtobuf mergeFrom:](playerPath, "mergeFrom:");
    }
  }
  else if (v15)
  {
    -[_MRPlaybackQueueRequestProtobuf setPlayerPath:](self, "setPlayerPath:");
  }
  if ((*((_WORD *)v5 + 54) & 4) != 0)
  {
    self->_cachingPolicy = *((_DWORD *)v5 + 6);
    *(_WORD *)&self->_has |= 4u;
  }
  if (*((void *)v5 + 6)) {
    -[_MRPlaybackQueueRequestProtobuf setLabel:](self, "setLabel:");
  }
  __int16 v16 = *((_WORD *)v5 + 54);
  if ((v16 & 0x2000) != 0)
  {
    self->_isLegacyNowPlayingInfoRequest = *((unsigned char *)v5 + 104);
    *(_WORD *)&self->_has |= 0x2000u;
    __int16 v16 = *((_WORD *)v5 + 54);
    if ((v16 & 0x800) == 0)
    {
LABEL_47:
      if ((v16 & 0x40) == 0) {
        goto LABEL_49;
      }
      goto LABEL_48;
    }
  }
  else if ((*((_WORD *)v5 + 54) & 0x800) == 0)
  {
    goto LABEL_47;
  }
  self->_includeParticipants = *((unsigned char *)v5 + 102);
  *(_WORD *)&self->_has |= 0x800u;
  if ((*((_WORD *)v5 + 54) & 0x40) != 0)
  {
LABEL_48:
    self->_includeAvailableArtworkFormats = *((unsigned char *)v5 + 97);
    *(_WORD *)&self->_has |= 0x40u;
  }
LABEL_49:
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v17 = *((id *)v5 + 10);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v32 != v20) {
          objc_enumerationMutation(v17);
        }
        [(_MRPlaybackQueueRequestProtobuf *)self addRequestedArtworkFormats:*(void *)(*((void *)&v31 + 1) + 8 * j)];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v31 objects:v40 count:16];
    }
    while (v19);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v22 = *((id *)v5 + 11);
  uint64_t v23 = [v22 countByEnumeratingWithState:&v27 objects:v39 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v28;
    do
    {
      for (uint64_t k = 0; k != v24; ++k)
      {
        if (*(void *)v28 != v25) {
          objc_enumerationMutation(v22);
        }
        -[_MRPlaybackQueueRequestProtobuf addRequestedRemoteArtworkFormats:](self, "addRequestedRemoteArtworkFormats:", *(void *)(*((void *)&v27 + 1) + 8 * k), (void)v27);
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v27 objects:v39 count:16];
    }
    while (v24);
  }

  if ((*((_WORD *)v5 + 54) & 0x20) != 0)
  {
    self->_includeAlignments = *((unsigned char *)v5 + 96);
    *(_WORD *)&self->_has |= 0x20u;
  }
}

- (_MRPlaybackQueueContextProtobuf)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (BOOL)returnContentItemAssetsInUserCompletion
{
  return self->_returnContentItemAssetsInUserCompletion;
}

- (_MRNowPlayingPlayerPathProtobuf)playerPath
{
  return self->_playerPath;
}

- (BOOL)includeParticipants
{
  return self->_includeParticipants;
}

@end