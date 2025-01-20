@interface _MRContentItemProtobuf
+ (Class)availableArtworkFormatsType;
+ (Class)availableLanguageOptionsType;
+ (Class)availableRemoteArtworkFormatsType;
+ (Class)currentLanguageOptionsType;
+ (Class)dataArtworksType;
+ (Class)remoteArtworksType;
+ (Class)sectionsType;
+ (Class)transcriptAlignmentsType;
- (BOOL)hasAncestorIdentifier;
- (BOOL)hasArtworkData;
- (BOOL)hasArtworkDataHeight;
- (BOOL)hasArtworkDataWidth;
- (BOOL)hasAssociatedParticipantIdentifier;
- (BOOL)hasIdentifier;
- (BOOL)hasInfo;
- (BOOL)hasLyrics;
- (BOOL)hasMetadata;
- (BOOL)hasParentIdentifier;
- (BOOL)hasQueueIdentifier;
- (BOOL)hasRequestIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)artworkData;
- (NSMutableArray)availableArtworkFormats;
- (NSMutableArray)availableLanguageOptions;
- (NSMutableArray)availableRemoteArtworkFormats;
- (NSMutableArray)currentLanguageOptions;
- (NSMutableArray)dataArtworks;
- (NSMutableArray)remoteArtworks;
- (NSMutableArray)sections;
- (NSMutableArray)transcriptAlignments;
- (NSString)ancestorIdentifier;
- (NSString)associatedParticipantIdentifier;
- (NSString)identifier;
- (NSString)info;
- (NSString)parentIdentifier;
- (NSString)queueIdentifier;
- (NSString)requestIdentifier;
- (_MRContentItemMetadataProtobuf)metadata;
- (_MRLyricsItemProtobuf)lyrics;
- (id)availableArtworkFormatsAtIndex:(unint64_t)a3;
- (id)availableLanguageOptionsAtIndex:(unint64_t)a3;
- (id)availableRemoteArtworkFormatsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)currentLanguageOptionsAtIndex:(unint64_t)a3;
- (id)dataArtworksAtIndex:(unint64_t)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)remoteArtworksAtIndex:(unint64_t)a3;
- (id)sectionsAtIndex:(unint64_t)a3;
- (id)transcriptAlignmentsAtIndex:(unint64_t)a3;
- (int)artworkDataHeight;
- (int)artworkDataWidth;
- (unint64_t)availableArtworkFormatsCount;
- (unint64_t)availableLanguageOptionsCount;
- (unint64_t)availableRemoteArtworkFormatsCount;
- (unint64_t)currentLanguageOptionsCount;
- (unint64_t)dataArtworksCount;
- (unint64_t)hash;
- (unint64_t)remoteArtworksCount;
- (unint64_t)sectionsCount;
- (unint64_t)transcriptAlignmentsCount;
- (void)addAvailableArtworkFormats:(id)a3;
- (void)addAvailableLanguageOptions:(id)a3;
- (void)addAvailableRemoteArtworkFormats:(id)a3;
- (void)addCurrentLanguageOptions:(id)a3;
- (void)addDataArtworks:(id)a3;
- (void)addRemoteArtworks:(id)a3;
- (void)addSections:(id)a3;
- (void)addTranscriptAlignments:(id)a3;
- (void)clearAvailableArtworkFormats;
- (void)clearAvailableLanguageOptions;
- (void)clearAvailableRemoteArtworkFormats;
- (void)clearCurrentLanguageOptions;
- (void)clearDataArtworks;
- (void)clearRemoteArtworks;
- (void)clearSections;
- (void)clearTranscriptAlignments;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAncestorIdentifier:(id)a3;
- (void)setArtworkData:(id)a3;
- (void)setArtworkDataHeight:(int)a3;
- (void)setArtworkDataWidth:(int)a3;
- (void)setAssociatedParticipantIdentifier:(id)a3;
- (void)setAvailableArtworkFormats:(id)a3;
- (void)setAvailableLanguageOptions:(id)a3;
- (void)setAvailableRemoteArtworkFormats:(id)a3;
- (void)setCurrentLanguageOptions:(id)a3;
- (void)setDataArtworks:(id)a3;
- (void)setHasArtworkDataHeight:(BOOL)a3;
- (void)setHasArtworkDataWidth:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setInfo:(id)a3;
- (void)setLyrics:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setParentIdentifier:(id)a3;
- (void)setQueueIdentifier:(id)a3;
- (void)setRemoteArtworks:(id)a3;
- (void)setRequestIdentifier:(id)a3;
- (void)setSections:(id)a3;
- (void)setTranscriptAlignments:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRContentItemProtobuf

- (void)setTranscriptAlignments:(id)a3
{
}

- (void)setSections:(id)a3
{
}

- (void)setRequestIdentifier:(id)a3
{
}

- (void)setQueueIdentifier:(id)a3
{
}

- (void)setParentIdentifier:(id)a3
{
}

- (void)setMetadata:(id)a3
{
}

- (void)setInfo:(id)a3
{
}

- (void)setIdentifier:(id)a3
{
}

- (void)setHasArtworkDataWidth:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setHasArtworkDataHeight:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setCurrentLanguageOptions:(id)a3
{
}

- (void)setAvailableRemoteArtworkFormats:(id)a3
{
}

- (void)setAvailableLanguageOptions:(id)a3
{
}

- (void)setAvailableArtworkFormats:(id)a3
{
}

- (void)setAssociatedParticipantIdentifier:(id)a3
{
}

- (void)setArtworkDataWidth:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_artworkDataWidth = a3;
}

- (void)setArtworkDataHeight:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_artworkDataHeight = a3;
}

- (void)setArtworkData:(id)a3
{
}

- (void)setAncestorIdentifier:(id)a3
{
}

- (BOOL)readFrom:(id)a3
{
  return _MRContentItemProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (NSMutableArray)transcriptAlignments
{
  return self->_transcriptAlignments;
}

- (NSMutableArray)sections
{
  return self->_sections;
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (unint64_t)remoteArtworksCount
{
  return [(NSMutableArray *)self->_remoteArtworks count];
}

- (NSString)queueIdentifier
{
  return self->_queueIdentifier;
}

- (NSString)parentIdentifier
{
  return self->_parentIdentifier;
}

- (_MRContentItemMetadataProtobuf)metadata
{
  return self->_metadata;
}

- (NSString)info
{
  return self->_info;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)hasMetadata
{
  return self->_metadata != 0;
}

- (unint64_t)dataArtworksCount
{
  return [(NSMutableArray *)self->_dataArtworks count];
}

- (NSMutableArray)currentLanguageOptions
{
  return self->_currentLanguageOptions;
}

- (NSMutableArray)availableRemoteArtworkFormats
{
  return self->_availableRemoteArtworkFormats;
}

- (NSMutableArray)availableLanguageOptions
{
  return self->_availableLanguageOptions;
}

- (NSMutableArray)availableArtworkFormats
{
  return self->_availableArtworkFormats;
}

- (NSString)associatedParticipantIdentifier
{
  return self->_associatedParticipantIdentifier;
}

- (NSString)ancestorIdentifier
{
  return self->_ancestorIdentifier;
}

- (NSData)artworkData
{
  return self->_artworkData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transcriptAlignments, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_remoteArtworks, 0);
  objc_storeStrong((id *)&self->_queueIdentifier, 0);
  objc_storeStrong((id *)&self->_parentIdentifier, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_lyrics, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_dataArtworks, 0);
  objc_storeStrong((id *)&self->_currentLanguageOptions, 0);
  objc_storeStrong((id *)&self->_availableRemoteArtworkFormats, 0);
  objc_storeStrong((id *)&self->_availableLanguageOptions, 0);
  objc_storeStrong((id *)&self->_availableArtworkFormats, 0);
  objc_storeStrong((id *)&self->_associatedParticipantIdentifier, 0);
  objc_storeStrong((id *)&self->_artworkData, 0);

  objc_storeStrong((id *)&self->_ancestorIdentifier, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_identifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_metadata) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_artworkData) {
    PBDataWriterWriteDataField();
  }
  if (self->_info) {
    PBDataWriterWriteStringField();
  }
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  v5 = self->_availableLanguageOptions;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v74 objects:v85 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v75;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v75 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v74 objects:v85 count:16];
    }
    while (v7);
  }

  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  v10 = self->_currentLanguageOptions;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v70 objects:v84 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v71;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v71 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v70 objects:v84 count:16];
    }
    while (v12);
  }

  if (self->_lyrics) {
    PBDataWriterWriteSubmessage();
  }
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  v15 = self->_sections;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v66 objects:v83 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v67;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v67 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v66 objects:v83 count:16];
    }
    while (v17);
  }

  if (self->_parentIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_ancestorIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_queueIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_requestIdentifier) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_associatedParticipantIdentifier) {
    PBDataWriterWriteStringField();
  }
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  v21 = self->_availableArtworkFormats;
  uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v62 objects:v82 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v63;
    do
    {
      for (uint64_t m = 0; m != v23; ++m)
      {
        if (*(void *)v63 != v24) {
          objc_enumerationMutation(v21);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v62 objects:v82 count:16];
    }
    while (v23);
  }

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  v26 = self->_availableRemoteArtworkFormats;
  uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v58 objects:v81 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v59;
    do
    {
      for (uint64_t n = 0; n != v28; ++n)
      {
        if (*(void *)v59 != v29) {
          objc_enumerationMutation(v26);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v28 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v58 objects:v81 count:16];
    }
    while (v28);
  }

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v31 = self->_dataArtworks;
  uint64_t v32 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v54 objects:v80 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v55;
    do
    {
      for (iuint64_t i = 0; ii != v33; ++ii)
      {
        if (*(void *)v55 != v34) {
          objc_enumerationMutation(v31);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v33 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v54 objects:v80 count:16];
    }
    while (v33);
  }

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  v36 = self->_remoteArtworks;
  uint64_t v37 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v50 objects:v79 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v51;
    do
    {
      for (juint64_t j = 0; jj != v38; ++jj)
      {
        if (*(void *)v51 != v39) {
          objc_enumerationMutation(v36);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v38 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v50 objects:v79 count:16];
    }
    while (v38);
  }

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v41 = self->_transcriptAlignments;
  uint64_t v42 = [(NSMutableArray *)v41 countByEnumeratingWithState:&v46 objects:v78 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v47;
    do
    {
      for (kuint64_t k = 0; kk != v43; ++kk)
      {
        if (*(void *)v47 != v44) {
          objc_enumerationMutation(v41);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v43 = [(NSMutableArray *)v41 countByEnumeratingWithState:&v46 objects:v78 count:16];
    }
    while (v43);
  }
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasArtworkData
{
  return self->_artworkData != 0;
}

- (BOOL)hasInfo
{
  return self->_info != 0;
}

- (void)clearAvailableLanguageOptions
{
}

- (void)addAvailableLanguageOptions:(id)a3
{
  id v4 = a3;
  availableLanguageOptions = self->_availableLanguageOptions;
  id v8 = v4;
  if (!availableLanguageOptions)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_availableLanguageOptions;
    self->_availableLanguageOptions = v6;

    id v4 = v8;
    availableLanguageOptions = self->_availableLanguageOptions;
  }
  [(NSMutableArray *)availableLanguageOptions addObject:v4];
}

- (unint64_t)availableLanguageOptionsCount
{
  return [(NSMutableArray *)self->_availableLanguageOptions count];
}

- (id)availableLanguageOptionsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_availableLanguageOptions objectAtIndex:a3];
}

+ (Class)availableLanguageOptionsType
{
  return (Class)objc_opt_class();
}

- (void)clearCurrentLanguageOptions
{
}

- (void)addCurrentLanguageOptions:(id)a3
{
  id v4 = a3;
  currentLanguageOptions = self->_currentLanguageOptions;
  id v8 = v4;
  if (!currentLanguageOptions)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_currentLanguageOptions;
    self->_currentLanguageOptions = v6;

    id v4 = v8;
    currentLanguageOptions = self->_currentLanguageOptions;
  }
  [(NSMutableArray *)currentLanguageOptions addObject:v4];
}

- (unint64_t)currentLanguageOptionsCount
{
  return [(NSMutableArray *)self->_currentLanguageOptions count];
}

- (id)currentLanguageOptionsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_currentLanguageOptions objectAtIndex:a3];
}

+ (Class)currentLanguageOptionsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasLyrics
{
  return self->_lyrics != 0;
}

- (void)clearSections
{
}

- (void)addSections:(id)a3
{
  id v4 = a3;
  sections = self->_sections;
  id v8 = v4;
  if (!sections)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_sections;
    self->_sections = v6;

    id v4 = v8;
    sections = self->_sections;
  }
  [(NSMutableArray *)sections addObject:v4];
}

- (unint64_t)sectionsCount
{
  return [(NSMutableArray *)self->_sections count];
}

- (id)sectionsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_sections objectAtIndex:a3];
}

+ (Class)sectionsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasParentIdentifier
{
  return self->_parentIdentifier != 0;
}

- (BOOL)hasAncestorIdentifier
{
  return self->_ancestorIdentifier != 0;
}

- (BOOL)hasQueueIdentifier
{
  return self->_queueIdentifier != 0;
}

- (BOOL)hasRequestIdentifier
{
  return self->_requestIdentifier != 0;
}

- (BOOL)hasArtworkDataWidth
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasArtworkDataHeight
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasAssociatedParticipantIdentifier
{
  return self->_associatedParticipantIdentifier != 0;
}

- (void)clearAvailableArtworkFormats
{
}

- (void)addAvailableArtworkFormats:(id)a3
{
  id v4 = a3;
  availableArtworkFormats = self->_availableArtworkFormats;
  id v8 = v4;
  if (!availableArtworkFormats)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_availableArtworkFormats;
    self->_availableArtworkFormats = v6;

    id v4 = v8;
    availableArtworkFormats = self->_availableArtworkFormats;
  }
  [(NSMutableArray *)availableArtworkFormats addObject:v4];
}

- (unint64_t)availableArtworkFormatsCount
{
  return [(NSMutableArray *)self->_availableArtworkFormats count];
}

- (id)availableArtworkFormatsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_availableArtworkFormats objectAtIndex:a3];
}

+ (Class)availableArtworkFormatsType
{
  return (Class)objc_opt_class();
}

- (void)clearAvailableRemoteArtworkFormats
{
}

- (void)addAvailableRemoteArtworkFormats:(id)a3
{
  id v4 = a3;
  availableRemoteArtworkFormats = self->_availableRemoteArtworkFormats;
  id v8 = v4;
  if (!availableRemoteArtworkFormats)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_availableRemoteArtworkFormats;
    self->_availableRemoteArtworkFormats = v6;

    id v4 = v8;
    availableRemoteArtworkFormats = self->_availableRemoteArtworkFormats;
  }
  [(NSMutableArray *)availableRemoteArtworkFormats addObject:v4];
}

- (unint64_t)availableRemoteArtworkFormatsCount
{
  return [(NSMutableArray *)self->_availableRemoteArtworkFormats count];
}

- (id)availableRemoteArtworkFormatsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_availableRemoteArtworkFormats objectAtIndex:a3];
}

+ (Class)availableRemoteArtworkFormatsType
{
  return (Class)objc_opt_class();
}

- (void)clearDataArtworks
{
}

- (void)addDataArtworks:(id)a3
{
  id v4 = a3;
  dataArtworks = self->_dataArtworks;
  id v8 = v4;
  if (!dataArtworks)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_dataArtworks;
    self->_dataArtworks = v6;

    id v4 = v8;
    dataArtworks = self->_dataArtworks;
  }
  [(NSMutableArray *)dataArtworks addObject:v4];
}

- (id)dataArtworksAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_dataArtworks objectAtIndex:a3];
}

+ (Class)dataArtworksType
{
  return (Class)objc_opt_class();
}

- (void)clearRemoteArtworks
{
}

- (void)addRemoteArtworks:(id)a3
{
  id v4 = a3;
  remoteArtworks = self->_remoteArtworks;
  id v8 = v4;
  if (!remoteArtworks)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_remoteArtworks;
    self->_remoteArtworks = v6;

    id v4 = v8;
    remoteArtworks = self->_remoteArtworks;
  }
  [(NSMutableArray *)remoteArtworks addObject:v4];
}

- (id)remoteArtworksAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_remoteArtworks objectAtIndex:a3];
}

+ (Class)remoteArtworksType
{
  return (Class)objc_opt_class();
}

- (void)clearTranscriptAlignments
{
}

- (void)addTranscriptAlignments:(id)a3
{
  id v4 = a3;
  transcriptAlignments = self->_transcriptAlignments;
  id v8 = v4;
  if (!transcriptAlignments)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_transcriptAlignments;
    self->_transcriptAlignments = v6;

    id v4 = v8;
    transcriptAlignments = self->_transcriptAlignments;
  }
  [(NSMutableArray *)transcriptAlignments addObject:v4];
}

- (unint64_t)transcriptAlignmentsCount
{
  return [(NSMutableArray *)self->_transcriptAlignments count];
}

- (id)transcriptAlignmentsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_transcriptAlignments objectAtIndex:a3];
}

+ (Class)transcriptAlignmentsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRContentItemProtobuf;
  id v4 = [(_MRContentItemProtobuf *)&v8 description];
  v5 = [(_MRContentItemProtobuf *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  metadata = self->_metadata;
  if (metadata)
  {
    uint64_t v7 = [(_MRContentItemMetadataProtobuf *)metadata dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"metadata"];
  }
  artworkData = self->_artworkData;
  if (artworkData) {
    [v4 setObject:artworkData forKey:@"artworkData"];
  }
  info = self->_info;
  if (info) {
    [v4 setObject:info forKey:@"info"];
  }
  if ([(NSMutableArray *)self->_availableLanguageOptions count])
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_availableLanguageOptions, "count"));
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    uint64_t v11 = self->_availableLanguageOptions;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v85 objects:v94 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v86;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v86 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = [*(id *)(*((void *)&v85 + 1) + 8 * i) dictionaryRepresentation];
          [v10 addObject:v16];
        }
        uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v85 objects:v94 count:16];
      }
      while (v13);
    }

    [v4 setObject:v10 forKey:@"availableLanguageOptions"];
  }
  if ([(NSMutableArray *)self->_currentLanguageOptions count])
  {
    uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_currentLanguageOptions, "count"));
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    uint64_t v18 = self->_currentLanguageOptions;
    uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v81 objects:v93 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v82;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v82 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = [*(id *)(*((void *)&v81 + 1) + 8 * j) dictionaryRepresentation];
          [v17 addObject:v23];
        }
        uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v81 objects:v93 count:16];
      }
      while (v20);
    }

    [v4 setObject:v17 forKey:@"currentLanguageOptions"];
  }
  lyrics = self->_lyrics;
  if (lyrics)
  {
    v25 = [(_MRLyricsItemProtobuf *)lyrics dictionaryRepresentation];
    [v4 setObject:v25 forKey:@"lyrics"];
  }
  if ([(NSMutableArray *)self->_sections count])
  {
    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_sections, "count"));
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    uint64_t v27 = self->_sections;
    uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v77 objects:v92 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v78;
      do
      {
        for (uint64_t k = 0; k != v29; ++k)
        {
          if (*(void *)v78 != v30) {
            objc_enumerationMutation(v27);
          }
          uint64_t v32 = [*(id *)(*((void *)&v77 + 1) + 8 * k) dictionaryRepresentation];
          [v26 addObject:v32];
        }
        uint64_t v29 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v77 objects:v92 count:16];
      }
      while (v29);
    }

    [v4 setObject:v26 forKey:@"sections"];
  }
  parentIdentifier = self->_parentIdentifier;
  if (parentIdentifier) {
    [v4 setObject:parentIdentifier forKey:@"parentIdentifier"];
  }
  ancestorIdentifier = self->_ancestorIdentifier;
  if (ancestorIdentifier) {
    [v4 setObject:ancestorIdentifier forKey:@"ancestorIdentifier"];
  }
  queueIdentifier = self->_queueIdentifier;
  if (queueIdentifier) {
    [v4 setObject:queueIdentifier forKey:@"queueIdentifier"];
  }
  requestIdentifier = self->_requestIdentifier;
  if (requestIdentifier) {
    [v4 setObject:requestIdentifier forKey:@"requestIdentifier"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t v38 = [NSNumber numberWithInt:self->_artworkDataWidth];
    [v4 setObject:v38 forKey:@"artworkDataWidth"];

    char has = (char)self->_has;
  }
  if (has)
  {
    uint64_t v39 = [NSNumber numberWithInt:self->_artworkDataHeight];
    [v4 setObject:v39 forKey:@"artworkDataHeight"];
  }
  associatedParticipantIdentifier = self->_associatedParticipantIdentifier;
  if (associatedParticipantIdentifier) {
    [v4 setObject:associatedParticipantIdentifier forKey:@"associatedParticipantIdentifier"];
  }
  availableArtworkFormats = self->_availableArtworkFormats;
  if (availableArtworkFormats) {
    [v4 setObject:availableArtworkFormats forKey:@"availableArtworkFormats"];
  }
  availableRemoteArtworkFormats = self->_availableRemoteArtworkFormats;
  if (availableRemoteArtworkFormats) {
    [v4 setObject:availableRemoteArtworkFormats forKey:@"availableRemoteArtworkFormats"];
  }
  if ([(NSMutableArray *)self->_dataArtworks count])
  {
    uint64_t v43 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_dataArtworks, "count"));
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    uint64_t v44 = self->_dataArtworks;
    uint64_t v45 = [(NSMutableArray *)v44 countByEnumeratingWithState:&v73 objects:v91 count:16];
    if (v45)
    {
      uint64_t v46 = v45;
      uint64_t v47 = *(void *)v74;
      do
      {
        for (uint64_t m = 0; m != v46; ++m)
        {
          if (*(void *)v74 != v47) {
            objc_enumerationMutation(v44);
          }
          long long v49 = [*(id *)(*((void *)&v73 + 1) + 8 * m) dictionaryRepresentation];
          [v43 addObject:v49];
        }
        uint64_t v46 = [(NSMutableArray *)v44 countByEnumeratingWithState:&v73 objects:v91 count:16];
      }
      while (v46);
    }

    [v4 setObject:v43 forKey:@"dataArtworks"];
  }
  if ([(NSMutableArray *)self->_remoteArtworks count])
  {
    long long v50 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_remoteArtworks, "count"));
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v51 = self->_remoteArtworks;
    uint64_t v52 = [(NSMutableArray *)v51 countByEnumeratingWithState:&v69 objects:v90 count:16];
    if (v52)
    {
      uint64_t v53 = v52;
      uint64_t v54 = *(void *)v70;
      do
      {
        for (uint64_t n = 0; n != v53; ++n)
        {
          if (*(void *)v70 != v54) {
            objc_enumerationMutation(v51);
          }
          long long v56 = [*(id *)(*((void *)&v69 + 1) + 8 * n) dictionaryRepresentation];
          [v50 addObject:v56];
        }
        uint64_t v53 = [(NSMutableArray *)v51 countByEnumeratingWithState:&v69 objects:v90 count:16];
      }
      while (v53);
    }

    [v4 setObject:v50 forKey:@"remoteArtworks"];
  }
  if ([(NSMutableArray *)self->_transcriptAlignments count])
  {
    long long v57 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_transcriptAlignments, "count"));
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v58 = self->_transcriptAlignments;
    uint64_t v59 = [(NSMutableArray *)v58 countByEnumeratingWithState:&v65 objects:v89 count:16];
    if (v59)
    {
      uint64_t v60 = v59;
      uint64_t v61 = *(void *)v66;
      do
      {
        for (iuint64_t i = 0; ii != v60; ++ii)
        {
          if (*(void *)v66 != v61) {
            objc_enumerationMutation(v58);
          }
          long long v63 = objc_msgSend(*(id *)(*((void *)&v65 + 1) + 8 * ii), "dictionaryRepresentation", (void)v65);
          [v57 addObject:v63];
        }
        uint64_t v60 = [(NSMutableArray *)v58 countByEnumeratingWithState:&v65 objects:v89 count:16];
      }
      while (v60);
    }

    [v4 setObject:v57 forKey:@"transcriptAlignments"];
  }

  return v4;
}

- (void)copyTo:(id)a3
{
  id v38 = a3;
  if (self->_identifier) {
    objc_msgSend(v38, "setIdentifier:");
  }
  if (self->_metadata) {
    objc_msgSend(v38, "setMetadata:");
  }
  if (self->_artworkData) {
    objc_msgSend(v38, "setArtworkData:");
  }
  if (self->_info) {
    objc_msgSend(v38, "setInfo:");
  }
  if ([(_MRContentItemProtobuf *)self availableLanguageOptionsCount])
  {
    [v38 clearAvailableLanguageOptions];
    unint64_t v4 = [(_MRContentItemProtobuf *)self availableLanguageOptionsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(_MRContentItemProtobuf *)self availableLanguageOptionsAtIndex:i];
        [v38 addAvailableLanguageOptions:v7];
      }
    }
  }
  if ([(_MRContentItemProtobuf *)self currentLanguageOptionsCount])
  {
    [v38 clearCurrentLanguageOptions];
    unint64_t v8 = [(_MRContentItemProtobuf *)self currentLanguageOptionsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(_MRContentItemProtobuf *)self currentLanguageOptionsAtIndex:j];
        [v38 addCurrentLanguageOptions:v11];
      }
    }
  }
  if (self->_lyrics) {
    objc_msgSend(v38, "setLyrics:");
  }
  if ([(_MRContentItemProtobuf *)self sectionsCount])
  {
    [v38 clearSections];
    unint64_t v12 = [(_MRContentItemProtobuf *)self sectionsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        v15 = [(_MRContentItemProtobuf *)self sectionsAtIndex:k];
        [v38 addSections:v15];
      }
    }
  }
  if (self->_parentIdentifier) {
    objc_msgSend(v38, "setParentIdentifier:");
  }
  uint64_t v16 = v38;
  if (self->_ancestorIdentifier)
  {
    objc_msgSend(v38, "setAncestorIdentifier:");
    uint64_t v16 = v38;
  }
  if (self->_queueIdentifier)
  {
    objc_msgSend(v38, "setQueueIdentifier:");
    uint64_t v16 = v38;
  }
  if (self->_requestIdentifier)
  {
    objc_msgSend(v38, "setRequestIdentifier:");
    uint64_t v16 = v38;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v16[7] = self->_artworkDataWidth;
    *((unsigned char *)v16 + 160) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v16[6] = self->_artworkDataHeight;
    *((unsigned char *)v16 + 160) |= 1u;
  }
  if (self->_associatedParticipantIdentifier) {
    objc_msgSend(v38, "setAssociatedParticipantIdentifier:");
  }
  if ([(_MRContentItemProtobuf *)self availableArtworkFormatsCount])
  {
    [v38 clearAvailableArtworkFormats];
    unint64_t v18 = [(_MRContentItemProtobuf *)self availableArtworkFormatsCount];
    if (v18)
    {
      unint64_t v19 = v18;
      for (uint64_t m = 0; m != v19; ++m)
      {
        uint64_t v21 = [(_MRContentItemProtobuf *)self availableArtworkFormatsAtIndex:m];
        [v38 addAvailableArtworkFormats:v21];
      }
    }
  }
  if ([(_MRContentItemProtobuf *)self availableRemoteArtworkFormatsCount])
  {
    [v38 clearAvailableRemoteArtworkFormats];
    unint64_t v22 = [(_MRContentItemProtobuf *)self availableRemoteArtworkFormatsCount];
    if (v22)
    {
      unint64_t v23 = v22;
      for (uint64_t n = 0; n != v23; ++n)
      {
        v25 = [(_MRContentItemProtobuf *)self availableRemoteArtworkFormatsAtIndex:n];
        [v38 addAvailableRemoteArtworkFormats:v25];
      }
    }
  }
  if ([(_MRContentItemProtobuf *)self dataArtworksCount])
  {
    [v38 clearDataArtworks];
    unint64_t v26 = [(_MRContentItemProtobuf *)self dataArtworksCount];
    if (v26)
    {
      unint64_t v27 = v26;
      for (iuint64_t i = 0; ii != v27; ++ii)
      {
        uint64_t v29 = [(_MRContentItemProtobuf *)self dataArtworksAtIndex:ii];
        [v38 addDataArtworks:v29];
      }
    }
  }
  if ([(_MRContentItemProtobuf *)self remoteArtworksCount])
  {
    [v38 clearRemoteArtworks];
    unint64_t v30 = [(_MRContentItemProtobuf *)self remoteArtworksCount];
    if (v30)
    {
      unint64_t v31 = v30;
      for (juint64_t j = 0; jj != v31; ++jj)
      {
        uint64_t v33 = [(_MRContentItemProtobuf *)self remoteArtworksAtIndex:jj];
        [v38 addRemoteArtworks:v33];
      }
    }
  }
  if ([(_MRContentItemProtobuf *)self transcriptAlignmentsCount])
  {
    [v38 clearTranscriptAlignments];
    unint64_t v34 = [(_MRContentItemProtobuf *)self transcriptAlignmentsCount];
    if (v34)
    {
      unint64_t v35 = v34;
      for (kuint64_t k = 0; kk != v35; ++kk)
      {
        uint64_t v37 = [(_MRContentItemProtobuf *)self transcriptAlignmentsAtIndex:kk];
        [v38 addTranscriptAlignments:v37];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v116 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v6;

  id v8 = [(_MRContentItemMetadataProtobuf *)self->_metadata copyWithZone:a3];
  unint64_t v9 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v8;

  uint64_t v10 = [(NSData *)self->_artworkData copyWithZone:a3];
  uint64_t v11 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v10;

  uint64_t v12 = [(NSString *)self->_info copyWithZone:a3];
  unint64_t v13 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v12;

  long long v106 = 0u;
  long long v107 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  uint64_t v14 = self->_availableLanguageOptions;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v104 objects:v115 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v105;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v105 != v17) {
          objc_enumerationMutation(v14);
        }
        unint64_t v19 = (void *)[*(id *)(*((void *)&v104 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addAvailableLanguageOptions:v19];
      }
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v104 objects:v115 count:16];
    }
    while (v16);
  }

  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  uint64_t v20 = self->_currentLanguageOptions;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v100 objects:v114 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v101;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v101 != v23) {
          objc_enumerationMutation(v20);
        }
        v25 = (void *)[*(id *)(*((void *)&v100 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addCurrentLanguageOptions:v25];
      }
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v100 objects:v114 count:16];
    }
    while (v22);
  }

  id v26 = [(_MRLyricsItemProtobuf *)self->_lyrics copyWithZone:a3];
  unint64_t v27 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v26;

  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  uint64_t v28 = self->_sections;
  uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v96 objects:v113 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v97;
    do
    {
      for (uint64_t k = 0; k != v30; ++k)
      {
        if (*(void *)v97 != v31) {
          objc_enumerationMutation(v28);
        }
        uint64_t v33 = (void *)[*(id *)(*((void *)&v96 + 1) + 8 * k) copyWithZone:a3];
        [(id)v5 addSections:v33];
      }
      uint64_t v30 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v96 objects:v113 count:16];
    }
    while (v30);
  }

  uint64_t v34 = [(NSString *)self->_parentIdentifier copyWithZone:a3];
  unint64_t v35 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v34;

  uint64_t v36 = [(NSString *)self->_ancestorIdentifier copyWithZone:a3];
  uint64_t v37 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v36;

  uint64_t v38 = [(NSString *)self->_queueIdentifier copyWithZone:a3];
  uint64_t v39 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v38;

  uint64_t v40 = [(NSString *)self->_requestIdentifier copyWithZone:a3];
  v41 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v40;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_artworkDataWidth;
    *(unsigned char *)(v5 + 160) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(_DWORD *)(v5 + 24) = self->_artworkDataHeight;
    *(unsigned char *)(v5 + 160) |= 1u;
  }
  uint64_t v43 = [(NSString *)self->_associatedParticipantIdentifier copyWithZone:a3];
  uint64_t v44 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v43;

  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  uint64_t v45 = self->_availableArtworkFormats;
  uint64_t v46 = [(NSMutableArray *)v45 countByEnumeratingWithState:&v92 objects:v112 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v93;
    do
    {
      for (uint64_t m = 0; m != v47; ++m)
      {
        if (*(void *)v93 != v48) {
          objc_enumerationMutation(v45);
        }
        long long v50 = (void *)[*(id *)(*((void *)&v92 + 1) + 8 * m) copyWithZone:a3];
        [(id)v5 addAvailableArtworkFormats:v50];
      }
      uint64_t v47 = [(NSMutableArray *)v45 countByEnumeratingWithState:&v92 objects:v112 count:16];
    }
    while (v47);
  }

  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v51 = self->_availableRemoteArtworkFormats;
  uint64_t v52 = [(NSMutableArray *)v51 countByEnumeratingWithState:&v88 objects:v111 count:16];
  if (v52)
  {
    uint64_t v53 = v52;
    uint64_t v54 = *(void *)v89;
    do
    {
      for (uint64_t n = 0; n != v53; ++n)
      {
        if (*(void *)v89 != v54) {
          objc_enumerationMutation(v51);
        }
        long long v56 = (void *)[*(id *)(*((void *)&v88 + 1) + 8 * n) copyWithZone:a3];
        [(id)v5 addAvailableRemoteArtworkFormats:v56];
      }
      uint64_t v53 = [(NSMutableArray *)v51 countByEnumeratingWithState:&v88 objects:v111 count:16];
    }
    while (v53);
  }

  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v57 = self->_dataArtworks;
  uint64_t v58 = [(NSMutableArray *)v57 countByEnumeratingWithState:&v84 objects:v110 count:16];
  if (v58)
  {
    uint64_t v59 = v58;
    uint64_t v60 = *(void *)v85;
    do
    {
      for (iuint64_t i = 0; ii != v59; ++ii)
      {
        if (*(void *)v85 != v60) {
          objc_enumerationMutation(v57);
        }
        long long v62 = (void *)[*(id *)(*((void *)&v84 + 1) + 8 * ii) copyWithZone:a3];
        [(id)v5 addDataArtworks:v62];
      }
      uint64_t v59 = [(NSMutableArray *)v57 countByEnumeratingWithState:&v84 objects:v110 count:16];
    }
    while (v59);
  }

  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v63 = self->_remoteArtworks;
  uint64_t v64 = [(NSMutableArray *)v63 countByEnumeratingWithState:&v80 objects:v109 count:16];
  if (v64)
  {
    uint64_t v65 = v64;
    uint64_t v66 = *(void *)v81;
    do
    {
      for (juint64_t j = 0; jj != v65; ++jj)
      {
        if (*(void *)v81 != v66) {
          objc_enumerationMutation(v63);
        }
        long long v68 = (void *)[*(id *)(*((void *)&v80 + 1) + 8 * jj) copyWithZone:a3];
        [(id)v5 addRemoteArtworks:v68];
      }
      uint64_t v65 = [(NSMutableArray *)v63 countByEnumeratingWithState:&v80 objects:v109 count:16];
    }
    while (v65);
  }

  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v69 = self->_transcriptAlignments;
  uint64_t v70 = [(NSMutableArray *)v69 countByEnumeratingWithState:&v76 objects:v108 count:16];
  if (v70)
  {
    uint64_t v71 = v70;
    uint64_t v72 = *(void *)v77;
    do
    {
      for (kuint64_t k = 0; kk != v71; ++kk)
      {
        if (*(void *)v77 != v72) {
          objc_enumerationMutation(v69);
        }
        long long v74 = objc_msgSend(*(id *)(*((void *)&v76 + 1) + 8 * kk), "copyWithZone:", a3, (void)v76);
        [(id)v5 addTranscriptAlignments:v74];
      }
      uint64_t v71 = [(NSMutableArray *)v69 countByEnumeratingWithState:&v76 objects:v108 count:16];
    }
    while (v71);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_48;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:")) {
      goto LABEL_48;
    }
  }
  metadata = self->_metadata;
  if ((unint64_t)metadata | *((void *)v4 + 13))
  {
    if (!-[_MRContentItemMetadataProtobuf isEqual:](metadata, "isEqual:")) {
      goto LABEL_48;
    }
  }
  artworkData = self->_artworkData;
  if ((unint64_t)artworkData | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](artworkData, "isEqual:")) {
      goto LABEL_48;
    }
  }
  info = self->_info;
  if ((unint64_t)info | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](info, "isEqual:")) {
      goto LABEL_48;
    }
  }
  availableLanguageOptions = self->_availableLanguageOptions;
  if ((unint64_t)availableLanguageOptions | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](availableLanguageOptions, "isEqual:")) {
      goto LABEL_48;
    }
  }
  currentLanguageOptions = self->_currentLanguageOptions;
  if ((unint64_t)currentLanguageOptions | *((void *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](currentLanguageOptions, "isEqual:")) {
      goto LABEL_48;
    }
  }
  lyrics = self->_lyrics;
  if ((unint64_t)lyrics | *((void *)v4 + 12))
  {
    if (!-[_MRLyricsItemProtobuf isEqual:](lyrics, "isEqual:")) {
      goto LABEL_48;
    }
  }
  sections = self->_sections;
  if ((unint64_t)sections | *((void *)v4 + 18))
  {
    if (!-[NSMutableArray isEqual:](sections, "isEqual:")) {
      goto LABEL_48;
    }
  }
  parentIdentifier = self->_parentIdentifier;
  if ((unint64_t)parentIdentifier | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](parentIdentifier, "isEqual:")) {
      goto LABEL_48;
    }
  }
  ancestorIdentifier = self->_ancestorIdentifier;
  if ((unint64_t)ancestorIdentifier | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](ancestorIdentifier, "isEqual:")) {
      goto LABEL_48;
    }
  }
  queueIdentifier = self->_queueIdentifier;
  if ((unint64_t)queueIdentifier | *((void *)v4 + 15))
  {
    if (!-[NSString isEqual:](queueIdentifier, "isEqual:")) {
      goto LABEL_48;
    }
  }
  requestIdentifier = self->_requestIdentifier;
  if ((unint64_t)requestIdentifier | *((void *)v4 + 17))
  {
    if (!-[NSString isEqual:](requestIdentifier, "isEqual:")) {
      goto LABEL_48;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 160) & 2) == 0 || self->_artworkDataWidth != *((_DWORD *)v4 + 7)) {
      goto LABEL_48;
    }
  }
  else if ((*((unsigned char *)v4 + 160) & 2) != 0)
  {
LABEL_48:
    char v23 = 0;
    goto LABEL_49;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 160) & 1) == 0 || self->_artworkDataHeight != *((_DWORD *)v4 + 6)) {
      goto LABEL_48;
    }
  }
  else if (*((unsigned char *)v4 + 160))
  {
    goto LABEL_48;
  }
  associatedParticipantIdentifier = self->_associatedParticipantIdentifier;
  if ((unint64_t)associatedParticipantIdentifier | *((void *)v4 + 4)
    && !-[NSString isEqual:](associatedParticipantIdentifier, "isEqual:"))
  {
    goto LABEL_48;
  }
  availableArtworkFormats = self->_availableArtworkFormats;
  if ((unint64_t)availableArtworkFormats | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](availableArtworkFormats, "isEqual:")) {
      goto LABEL_48;
    }
  }
  availableRemoteArtworkFormats = self->_availableRemoteArtworkFormats;
  if ((unint64_t)availableRemoteArtworkFormats | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](availableRemoteArtworkFormats, "isEqual:")) {
      goto LABEL_48;
    }
  }
  dataArtworks = self->_dataArtworks;
  if ((unint64_t)dataArtworks | *((void *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](dataArtworks, "isEqual:")) {
      goto LABEL_48;
    }
  }
  remoteArtworks = self->_remoteArtworks;
  if ((unint64_t)remoteArtworks | *((void *)v4 + 16))
  {
    if (!-[NSMutableArray isEqual:](remoteArtworks, "isEqual:")) {
      goto LABEL_48;
    }
  }
  transcriptAlignments = self->_transcriptAlignments;
  if ((unint64_t)transcriptAlignments | *((void *)v4 + 19)) {
    char v23 = -[NSMutableArray isEqual:](transcriptAlignments, "isEqual:");
  }
  else {
    char v23 = 1;
  }
LABEL_49:

  return v23;
}

- (unint64_t)hash
{
  NSUInteger v23 = [(NSString *)self->_identifier hash];
  unint64_t v22 = [(_MRContentItemMetadataProtobuf *)self->_metadata hash];
  uint64_t v3 = [(NSData *)self->_artworkData hash];
  NSUInteger v4 = [(NSString *)self->_info hash];
  uint64_t v5 = [(NSMutableArray *)self->_availableLanguageOptions hash];
  uint64_t v6 = [(NSMutableArray *)self->_currentLanguageOptions hash];
  unint64_t v7 = [(_MRLyricsItemProtobuf *)self->_lyrics hash];
  uint64_t v8 = [(NSMutableArray *)self->_sections hash];
  NSUInteger v9 = [(NSString *)self->_parentIdentifier hash];
  NSUInteger v10 = [(NSString *)self->_ancestorIdentifier hash];
  NSUInteger v11 = [(NSString *)self->_queueIdentifier hash];
  NSUInteger v12 = [(NSString *)self->_requestIdentifier hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v13 = 2654435761 * self->_artworkDataWidth;
  }
  else {
    uint64_t v13 = 0;
  }
  if (*(unsigned char *)&self->_has) {
    uint64_t v14 = 2654435761 * self->_artworkDataHeight;
  }
  else {
    uint64_t v14 = 0;
  }
  unint64_t v15 = v22 ^ v23 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  NSUInteger v16 = v12 ^ v13 ^ v14 ^ [(NSString *)self->_associatedParticipantIdentifier hash];
  uint64_t v17 = v15 ^ v16 ^ [(NSMutableArray *)self->_availableArtworkFormats hash];
  uint64_t v18 = [(NSMutableArray *)self->_availableRemoteArtworkFormats hash];
  uint64_t v19 = v18 ^ [(NSMutableArray *)self->_dataArtworks hash];
  uint64_t v20 = v19 ^ [(NSMutableArray *)self->_remoteArtworks hash];
  return v17 ^ v20 ^ [(NSMutableArray *)self->_transcriptAlignments hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 10)) {
    -[_MRContentItemProtobuf setIdentifier:](self, "setIdentifier:");
  }
  metadata = self->_metadata;
  uint64_t v6 = *((void *)v4 + 13);
  if (metadata)
  {
    if (v6) {
      -[_MRContentItemMetadataProtobuf mergeFrom:](metadata, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[_MRContentItemProtobuf setMetadata:](self, "setMetadata:");
  }
  if (*((void *)v4 + 2)) {
    -[_MRContentItemProtobuf setArtworkData:](self, "setArtworkData:");
  }
  if (*((void *)v4 + 11)) {
    -[_MRContentItemProtobuf setInfo:](self, "setInfo:");
  }
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id v7 = *((id *)v4 + 6);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v78 objects:v89 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v79;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v79 != v10) {
          objc_enumerationMutation(v7);
        }
        [(_MRContentItemProtobuf *)self addAvailableLanguageOptions:*(void *)(*((void *)&v78 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v78 objects:v89 count:16];
    }
    while (v9);
  }

  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id v12 = *((id *)v4 + 8);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v74 objects:v88 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v75;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v75 != v15) {
          objc_enumerationMutation(v12);
        }
        [(_MRContentItemProtobuf *)self addCurrentLanguageOptions:*(void *)(*((void *)&v74 + 1) + 8 * j)];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v74 objects:v88 count:16];
    }
    while (v14);
  }

  lyrics = self->_lyrics;
  uint64_t v18 = *((void *)v4 + 12);
  if (lyrics)
  {
    if (v18) {
      -[_MRLyricsItemProtobuf mergeFrom:](lyrics, "mergeFrom:");
    }
  }
  else if (v18)
  {
    -[_MRContentItemProtobuf setLyrics:](self, "setLyrics:");
  }
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v19 = *((id *)v4 + 18);
  uint64_t v20 = [v19 countByEnumeratingWithState:&v70 objects:v87 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v71;
    do
    {
      for (uint64_t k = 0; k != v21; ++k)
      {
        if (*(void *)v71 != v22) {
          objc_enumerationMutation(v19);
        }
        [(_MRContentItemProtobuf *)self addSections:*(void *)(*((void *)&v70 + 1) + 8 * k)];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v70 objects:v87 count:16];
    }
    while (v21);
  }

  if (*((void *)v4 + 14)) {
    -[_MRContentItemProtobuf setParentIdentifier:](self, "setParentIdentifier:");
  }
  if (*((void *)v4 + 1)) {
    -[_MRContentItemProtobuf setAncestorIdentifier:](self, "setAncestorIdentifier:");
  }
  if (*((void *)v4 + 15)) {
    -[_MRContentItemProtobuf setQueueIdentifier:](self, "setQueueIdentifier:");
  }
  if (*((void *)v4 + 17)) {
    -[_MRContentItemProtobuf setRequestIdentifier:](self, "setRequestIdentifier:");
  }
  char v24 = *((unsigned char *)v4 + 160);
  if ((v24 & 2) != 0)
  {
    self->_artworkDataWidth = *((_DWORD *)v4 + 7);
    *(unsigned char *)&self->_has |= 2u;
    char v24 = *((unsigned char *)v4 + 160);
  }
  if (v24)
  {
    self->_artworkDataHeight = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 4)) {
    -[_MRContentItemProtobuf setAssociatedParticipantIdentifier:](self, "setAssociatedParticipantIdentifier:");
  }
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v25 = *((id *)v4 + 5);
  uint64_t v26 = [v25 countByEnumeratingWithState:&v66 objects:v86 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v67;
    do
    {
      for (uint64_t m = 0; m != v27; ++m)
      {
        if (*(void *)v67 != v28) {
          objc_enumerationMutation(v25);
        }
        [(_MRContentItemProtobuf *)self addAvailableArtworkFormats:*(void *)(*((void *)&v66 + 1) + 8 * m)];
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v66 objects:v86 count:16];
    }
    while (v27);
  }

  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v30 = *((id *)v4 + 7);
  uint64_t v31 = [v30 countByEnumeratingWithState:&v62 objects:v85 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v63;
    do
    {
      for (uint64_t n = 0; n != v32; ++n)
      {
        if (*(void *)v63 != v33) {
          objc_enumerationMutation(v30);
        }
        [(_MRContentItemProtobuf *)self addAvailableRemoteArtworkFormats:*(void *)(*((void *)&v62 + 1) + 8 * n)];
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v62 objects:v85 count:16];
    }
    while (v32);
  }

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v35 = *((id *)v4 + 9);
  uint64_t v36 = [v35 countByEnumeratingWithState:&v58 objects:v84 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v59;
    do
    {
      for (iuint64_t i = 0; ii != v37; ++ii)
      {
        if (*(void *)v59 != v38) {
          objc_enumerationMutation(v35);
        }
        [(_MRContentItemProtobuf *)self addDataArtworks:*(void *)(*((void *)&v58 + 1) + 8 * ii)];
      }
      uint64_t v37 = [v35 countByEnumeratingWithState:&v58 objects:v84 count:16];
    }
    while (v37);
  }

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v40 = *((id *)v4 + 16);
  uint64_t v41 = [v40 countByEnumeratingWithState:&v54 objects:v83 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v55;
    do
    {
      for (juint64_t j = 0; jj != v42; ++jj)
      {
        if (*(void *)v55 != v43) {
          objc_enumerationMutation(v40);
        }
        [(_MRContentItemProtobuf *)self addRemoteArtworks:*(void *)(*((void *)&v54 + 1) + 8 * jj)];
      }
      uint64_t v42 = [v40 countByEnumeratingWithState:&v54 objects:v83 count:16];
    }
    while (v42);
  }

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v45 = *((id *)v4 + 19);
  uint64_t v46 = [v45 countByEnumeratingWithState:&v50 objects:v82 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v51;
    do
    {
      for (kuint64_t k = 0; kk != v47; ++kk)
      {
        if (*(void *)v51 != v48) {
          objc_enumerationMutation(v45);
        }
        -[_MRContentItemProtobuf addTranscriptAlignments:](self, "addTranscriptAlignments:", *(void *)(*((void *)&v50 + 1) + 8 * kk), (void)v50);
      }
      uint64_t v47 = [v45 countByEnumeratingWithState:&v50 objects:v82 count:16];
    }
    while (v47);
  }
}

- (_MRLyricsItemProtobuf)lyrics
{
  return self->_lyrics;
}

- (void)setLyrics:(id)a3
{
}

- (int)artworkDataWidth
{
  return self->_artworkDataWidth;
}

- (int)artworkDataHeight
{
  return self->_artworkDataHeight;
}

- (NSMutableArray)dataArtworks
{
  return self->_dataArtworks;
}

- (void)setDataArtworks:(id)a3
{
}

- (NSMutableArray)remoteArtworks
{
  return self->_remoteArtworks;
}

- (void)setRemoteArtworks:(id)a3
{
}

@end