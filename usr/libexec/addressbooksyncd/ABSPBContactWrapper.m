@interface ABSPBContactWrapper
+ (Class)groupNameType;
+ (Class)linkToType;
- (ABSPBContact)pb;
- (ABSPBContainerAttributes)containerAttributes;
- (BOOL)containsCustomPoster;
- (BOOL)hasAccountExternalIdentifier;
- (BOOL)hasArchive;
- (BOOL)hasContainerAttributes;
- (BOOL)hasEncryptedPronounData;
- (BOOL)hasExternalGuid;
- (BOOL)hasFastEncodingData;
- (BOOL)hasGuid;
- (BOOL)hasImageData;
- (BOOL)hasImageType;
- (BOOL)hasIsMe;
- (BOOL)hasLinkGuid;
- (BOOL)hasModDate;
- (BOOL)hasPb;
- (BOOL)hasReserved1;
- (BOOL)hasReserved2;
- (BOOL)hasReserved3;
- (BOOL)hasSensitiveContentConfiguration;
- (BOOL)hasSharedPhotoDisplayPreference;
- (BOOL)hasSourceType;
- (BOOL)hasThumbnail;
- (BOOL)hasVcardData;
- (BOOL)hasWallpaperDataRepresentation;
- (BOOL)hasWallpaperImageData;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMe;
- (BOOL)readFrom:(id)a3;
- (NSData)archive;
- (NSData)encryptedPronounData;
- (NSData)fastEncodingData;
- (NSData)imageData;
- (NSData)reserved1;
- (NSData)reserved2;
- (NSData)reserved3;
- (NSData)sensitiveContentConfiguration;
- (NSData)thumbnail;
- (NSData)vcardData;
- (NSData)wallpaperDataRepresentation;
- (NSData)wallpaperImageData;
- (NSMutableArray)groupNames;
- (NSMutableArray)linkTos;
- (NSString)accountExternalIdentifier;
- (NSString)externalGuid;
- (NSString)guid;
- (NSString)imageType;
- (NSString)linkGuid;
- (double)modDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)groupNameAtIndex:(unint64_t)a3;
- (id)linkToAtIndex:(unint64_t)a3;
- (int)sourceType;
- (int64_t)sharedPhotoDisplayPreference;
- (unint64_t)groupNamesCount;
- (unint64_t)hash;
- (unint64_t)linkTosCount;
- (void)addGroupName:(id)a3;
- (void)addLinkTo:(id)a3;
- (void)clearGroupNames;
- (void)clearLinkTos;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccountExternalIdentifier:(id)a3;
- (void)setArchive:(id)a3;
- (void)setContainerAttributes:(id)a3;
- (void)setEncryptedPronounData:(id)a3;
- (void)setExternalGuid:(id)a3;
- (void)setFastEncodingData:(id)a3;
- (void)setGroupNames:(id)a3;
- (void)setGuid:(id)a3;
- (void)setHasIsMe:(BOOL)a3;
- (void)setHasModDate:(BOOL)a3;
- (void)setHasSharedPhotoDisplayPreference:(BOOL)a3;
- (void)setHasSourceType:(BOOL)a3;
- (void)setImageData:(id)a3;
- (void)setImageType:(id)a3;
- (void)setIsMe:(BOOL)a3;
- (void)setLinkGuid:(id)a3;
- (void)setLinkTos:(id)a3;
- (void)setModDate:(double)a3;
- (void)setPb:(id)a3;
- (void)setReserved1:(id)a3;
- (void)setReserved2:(id)a3;
- (void)setReserved3:(id)a3;
- (void)setSensitiveContentConfiguration:(id)a3;
- (void)setSharedPhotoDisplayPreference:(int64_t)a3;
- (void)setSourceType:(int)a3;
- (void)setThumbnail:(id)a3;
- (void)setVcardData:(id)a3;
- (void)setWallpaperDataRepresentation:(id)a3;
- (void)setWallpaperImageData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ABSPBContactWrapper

- (BOOL)hasVcardData
{
  return self->_vcardData != 0;
}

- (BOOL)hasFastEncodingData
{
  return self->_fastEncodingData != 0;
}

- (BOOL)hasArchive
{
  return self->_archive != 0;
}

- (BOOL)hasPb
{
  return self->_pb != 0;
}

- (BOOL)hasReserved1
{
  return self->_reserved1 != 0;
}

- (BOOL)hasReserved2
{
  return self->_reserved2 != 0;
}

- (BOOL)hasReserved3
{
  return self->_reserved3 != 0;
}

- (void)setSourceType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_sourceType = a3;
}

- (void)setHasSourceType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSourceType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)clearGroupNames
{
}

- (void)addGroupName:(id)a3
{
  id v4 = a3;
  groupNames = self->_groupNames;
  id v8 = v4;
  if (!groupNames)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_groupNames;
    self->_groupNames = v6;

    id v4 = v8;
    groupNames = self->_groupNames;
  }
  [(NSMutableArray *)groupNames addObject:v4];
}

- (unint64_t)groupNamesCount
{
  return (unint64_t)[(NSMutableArray *)self->_groupNames count];
}

- (id)groupNameAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_groupNames objectAtIndex:a3];
}

+ (Class)groupNameType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasGuid
{
  return self->_guid != 0;
}

- (void)setIsMe:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_isMe = a3;
}

- (void)setHasIsMe:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsMe
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setModDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_modDate = a3;
}

- (void)setHasModDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasModDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasExternalGuid
{
  return self->_externalGuid != 0;
}

- (BOOL)hasThumbnail
{
  return self->_thumbnail != 0;
}

- (void)clearLinkTos
{
}

- (void)addLinkTo:(id)a3
{
  id v4 = a3;
  linkTos = self->_linkTos;
  id v8 = v4;
  if (!linkTos)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_linkTos;
    self->_linkTos = v6;

    id v4 = v8;
    linkTos = self->_linkTos;
  }
  [(NSMutableArray *)linkTos addObject:v4];
}

- (unint64_t)linkTosCount
{
  return (unint64_t)[(NSMutableArray *)self->_linkTos count];
}

- (id)linkToAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_linkTos objectAtIndex:a3];
}

+ (Class)linkToType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasLinkGuid
{
  return self->_linkGuid != 0;
}

- (BOOL)hasAccountExternalIdentifier
{
  return self->_accountExternalIdentifier != 0;
}

- (BOOL)hasImageData
{
  return self->_imageData != 0;
}

- (BOOL)hasImageType
{
  return self->_imageType != 0;
}

- (BOOL)hasContainerAttributes
{
  return self->_containerAttributes != 0;
}

- (BOOL)hasWallpaperImageData
{
  return self->_wallpaperImageData != 0;
}

- (void)setSharedPhotoDisplayPreference:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_sharedPhotoDisplayPreference = a3;
}

- (void)setHasSharedPhotoDisplayPreference:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSharedPhotoDisplayPreference
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasEncryptedPronounData
{
  return self->_encryptedPronounData != 0;
}

- (BOOL)hasWallpaperDataRepresentation
{
  return self->_wallpaperDataRepresentation != 0;
}

- (BOOL)hasSensitiveContentConfiguration
{
  return self->_sensitiveContentConfiguration != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)ABSPBContactWrapper;
  char v3 = [(ABSPBContactWrapper *)&v7 description];
  id v4 = [(ABSPBContactWrapper *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  vcardData = self->_vcardData;
  if (vcardData) {
    [v3 setObject:vcardData forKey:@"vcardData"];
  }
  fastEncodingData = self->_fastEncodingData;
  if (fastEncodingData) {
    [v4 setObject:fastEncodingData forKey:@"fastEncodingData"];
  }
  archive = self->_archive;
  if (archive) {
    [v4 setObject:archive forKey:@"archive"];
  }
  pb = self->_pb;
  if (pb)
  {
    v9 = [(ABSPBContact *)pb dictionaryRepresentation];
    [v4 setObject:v9 forKey:@"pb"];
  }
  reserved1 = self->_reserved1;
  if (reserved1) {
    [v4 setObject:reserved1 forKey:@"reserved1"];
  }
  reserved2 = self->_reserved2;
  if (reserved2) {
    [v4 setObject:reserved2 forKey:@"reserved2"];
  }
  reserved3 = self->_reserved3;
  if (reserved3) {
    [v4 setObject:reserved3 forKey:@"reserved3"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v13 = +[NSNumber numberWithInt:self->_sourceType];
    [v4 setObject:v13 forKey:@"sourceType"];
  }
  groupNames = self->_groupNames;
  if (groupNames) {
    [v4 setObject:groupNames forKey:@"groupName"];
  }
  guid = self->_guid;
  if (guid) {
    [v4 setObject:guid forKey:@"guid"];
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v17 = +[NSNumber numberWithBool:self->_isMe];
    [v4 setObject:v17 forKey:@"isMe"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v18 = +[NSNumber numberWithDouble:self->_modDate];
    [v4 setObject:v18 forKey:@"modDate"];
  }
  externalGuid = self->_externalGuid;
  if (externalGuid) {
    [v4 setObject:externalGuid forKey:@"externalGuid"];
  }
  thumbnail = self->_thumbnail;
  if (thumbnail) {
    [v4 setObject:thumbnail forKey:@"thumbnail"];
  }
  if ([(NSMutableArray *)self->_linkTos count])
  {
    id v21 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_linkTos, "count")];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v22 = self->_linkTos;
    id v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v41;
      do
      {
        for (i = 0; i != v24; i = (char *)i + 1)
        {
          if (*(void *)v41 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = [*(id *)(*((void *)&v40 + 1) + 8 * i) dictionaryRepresentation:v40];
          [v21 addObject:v27];
        }
        id v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v40 objects:v44 count:16];
      }
      while (v24);
    }

    [v4 setObject:v21 forKey:@"linkTo"];
  }
  linkGuid = self->_linkGuid;
  if (linkGuid) {
    [v4 setObject:linkGuid forKey:@"linkGuid"];
  }
  accountExternalIdentifier = self->_accountExternalIdentifier;
  if (accountExternalIdentifier) {
    [v4 setObject:accountExternalIdentifier forKey:@"accountExternalIdentifier"];
  }
  imageData = self->_imageData;
  if (imageData) {
    [v4 setObject:imageData forKey:@"imageData"];
  }
  imageType = self->_imageType;
  if (imageType) {
    [v4 setObject:imageType forKey:@"imageType"];
  }
  containerAttributes = self->_containerAttributes;
  if (containerAttributes)
  {
    v33 = [(ABSPBContainerAttributes *)containerAttributes dictionaryRepresentation];
    [v4 setObject:v33 forKey:@"containerAttributes"];
  }
  wallpaperImageData = self->_wallpaperImageData;
  if (wallpaperImageData) {
    [v4 setObject:wallpaperImageData forKey:@"wallpaperImageData"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v35 = +[NSNumber numberWithLongLong:self->_sharedPhotoDisplayPreference];
    [v4 setObject:v35 forKey:@"sharedPhotoDisplayPreference"];
  }
  encryptedPronounData = self->_encryptedPronounData;
  if (encryptedPronounData) {
    [v4 setObject:encryptedPronounData forKey:@"encryptedPronounData"];
  }
  wallpaperDataRepresentation = self->_wallpaperDataRepresentation;
  if (wallpaperDataRepresentation) {
    [v4 setObject:wallpaperDataRepresentation forKey:@"wallpaperDataRepresentation"];
  }
  sensitiveContentConfiguration = self->_sensitiveContentConfiguration;
  if (sensitiveContentConfiguration) {
    [v4 setObject:sensitiveContentConfiguration forKey:@"sensitiveContentConfiguration"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ABSPBContactWrapperReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v5 = self->_groupNames;
  v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    objc_super v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
      }
      objc_super v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }

  if (self->_vcardData) {
    PBDataWriterWriteDataField();
  }
  if (self->_guid) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_externalGuid) {
    PBDataWriterWriteStringField();
  }
  if (self->_thumbnail) {
    PBDataWriterWriteDataField();
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v11 = self->_linkTos;
  v12 = (char *)[(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
      }
      v13 = (char *)[(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }

  if (self->_fastEncodingData) {
    PBDataWriterWriteDataField();
  }
  if (self->_linkGuid) {
    PBDataWriterWriteStringField();
  }
  if (self->_archive) {
    PBDataWriterWriteDataField();
  }
  if (self->_pb) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_accountExternalIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_imageData) {
    PBDataWriterWriteDataField();
  }
  if (self->_imageType) {
    PBDataWriterWriteStringField();
  }
  if (self->_reserved1) {
    PBDataWriterWriteDataField();
  }
  if (self->_reserved2) {
    PBDataWriterWriteDataField();
  }
  if (self->_reserved3) {
    PBDataWriterWriteDataField();
  }
  if (self->_containerAttributes) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_wallpaperImageData) {
    PBDataWriterWriteDataField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_encryptedPronounData) {
    PBDataWriterWriteDataField();
  }
  if (self->_wallpaperDataRepresentation) {
    PBDataWriterWriteDataField();
  }
  if (self->_sensitiveContentConfiguration) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v4[40] = self->_sourceType;
    *((unsigned char *)v4 + 204) |= 4u;
  }
  id v16 = v4;
  if ([(ABSPBContactWrapper *)self groupNamesCount])
  {
    [v16 clearGroupNames];
    unint64_t v5 = [(ABSPBContactWrapper *)self groupNamesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(ABSPBContactWrapper *)self groupNameAtIndex:i];
        [v16 addGroupName:v8];
      }
    }
  }
  if (self->_vcardData) {
    [v16 setVcardData:];
  }
  v9 = v16;
  if (self->_guid)
  {
    [v16 setGuid:];
    v9 = v16;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v9[200] = self->_isMe;
    v9[204] |= 8u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v9 + 1) = *(void *)&self->_modDate;
    v9[204] |= 1u;
  }
  if (self->_externalGuid) {
    [v16 setExternalGuid:];
  }
  if (self->_thumbnail) {
    [v16 setThumbnail:];
  }
  if ([(ABSPBContactWrapper *)self linkTosCount])
  {
    [v16 clearLinkTos];
    unint64_t v11 = [(ABSPBContactWrapper *)self linkTosCount];
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t j = 0; j != v12; ++j)
      {
        uint64_t v14 = [(ABSPBContactWrapper *)self linkToAtIndex:j];
        [v16 addLinkTo:v14];
      }
    }
  }
  if (self->_fastEncodingData) {
    [v16 setFastEncodingData:];
  }
  v15 = v16;
  if (self->_linkGuid)
  {
    [v16 setLinkGuid:];
    v15 = v16;
  }
  if (self->_archive)
  {
    [v16 setArchive:];
    v15 = v16;
  }
  if (self->_pb)
  {
    [v16 setPb:];
    v15 = v16;
  }
  if (self->_accountExternalIdentifier)
  {
    [v16 setAccountExternalIdentifier:];
    v15 = v16;
  }
  if (self->_imageData)
  {
    [v16 setImageData:];
    v15 = v16;
  }
  if (self->_imageType)
  {
    [v16 setImageType:];
    v15 = v16;
  }
  if (self->_reserved1)
  {
    [v16 setReserved1:];
    v15 = v16;
  }
  if (self->_reserved2)
  {
    [v16 setReserved2:];
    v15 = v16;
  }
  if (self->_reserved3)
  {
    [v16 setReserved3:];
    v15 = v16;
  }
  if (self->_containerAttributes)
  {
    [v16 setContainerAttributes:];
    v15 = v16;
  }
  if (self->_wallpaperImageData)
  {
    [v16 setWallpaperImageData:];
    v15 = v16;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v15[2] = self->_sharedPhotoDisplayPreference;
    *((unsigned char *)v15 + 204) |= 2u;
  }
  if (self->_encryptedPronounData)
  {
    [v16 setEncryptedPronounData:];
    v15 = v16;
  }
  if (self->_wallpaperDataRepresentation)
  {
    [v16 setWallpaperDataRepresentation:];
    v15 = v16;
  }
  if (self->_sensitiveContentConfiguration)
  {
    [v16 setSensitiveContentConfiguration:];
    v15 = v16;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = v5;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v5[40] = self->_sourceType;
    *((unsigned char *)v5 + 204) |= 4u;
  }
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  objc_super v7 = self->_groupNames;
  id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v63 objects:v68 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v64;
    do
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v64 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [*(id *)(*((void *)&v63 + 1) + 8 * i) copyWithZone:a3];
        [v6 addGroupName:v12];
      }
      id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v63 objects:v68 count:16];
    }
    while (v9);
  }

  id v13 = [(NSData *)self->_vcardData copyWithZone:a3];
  uint64_t v14 = (void *)*((void *)v6 + 22);
  *((void *)v6 + 22) = v13;

  id v15 = [(NSString *)self->_guid copyWithZone:a3];
  id v16 = (void *)*((void *)v6 + 10);
  *((void *)v6 + 10) = v15;

  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((unsigned char *)v6 + 200) = self->_isMe;
    *((unsigned char *)v6 + 204) |= 8u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v6 + 1) = *(void *)&self->_modDate;
    *((unsigned char *)v6 + 204) |= 1u;
  }
  id v18 = [(NSString *)self->_externalGuid copyWithZone:a3];
  long long v19 = (void *)*((void *)v6 + 7);
  *((void *)v6 + 7) = v18;

  id v20 = [(NSData *)self->_thumbnail copyWithZone:a3];
  long long v21 = (void *)*((void *)v6 + 21);
  *((void *)v6 + 21) = v20;

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v22 = self->_linkTos;
  id v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v59 objects:v67 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v60;
    do
    {
      for (uint64_t j = 0; j != v24; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v60 != v25) {
          objc_enumerationMutation(v22);
        }
        id v27 = [*(id *)(*((void *)&v59 + 1) + 8 * (void)j) copyWithZone:a3];
        [v6 addLinkTo:v27];
      }
      id v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v59 objects:v67 count:16];
    }
    while (v24);
  }

  id v28 = [(NSData *)self->_fastEncodingData copyWithZone:a3];
  v29 = (void *)*((void *)v6 + 8);
  *((void *)v6 + 8) = v28;

  id v30 = [(NSString *)self->_linkGuid copyWithZone:a3];
  v31 = (void *)*((void *)v6 + 13);
  *((void *)v6 + 13) = v30;

  id v32 = [(NSData *)self->_archive copyWithZone:a3];
  v33 = (void *)*((void *)v6 + 4);
  *((void *)v6 + 4) = v32;

  id v34 = [(ABSPBContact *)self->_pb copyWithZone:a3];
  v35 = (void *)*((void *)v6 + 15);
  *((void *)v6 + 15) = v34;

  id v36 = [(NSString *)self->_accountExternalIdentifier copyWithZone:a3];
  v37 = (void *)*((void *)v6 + 3);
  *((void *)v6 + 3) = v36;

  id v38 = [(NSData *)self->_imageData copyWithZone:a3];
  v39 = (void *)*((void *)v6 + 11);
  *((void *)v6 + 11) = v38;

  id v40 = [(NSString *)self->_imageType copyWithZone:a3];
  long long v41 = (void *)*((void *)v6 + 12);
  *((void *)v6 + 12) = v40;

  id v42 = [(NSData *)self->_reserved1 copyWithZone:a3];
  long long v43 = (void *)*((void *)v6 + 16);
  *((void *)v6 + 16) = v42;

  id v44 = [(NSData *)self->_reserved2 copyWithZone:a3];
  v45 = (void *)*((void *)v6 + 17);
  *((void *)v6 + 17) = v44;

  id v46 = [(NSData *)self->_reserved3 copyWithZone:a3];
  v47 = (void *)*((void *)v6 + 18);
  *((void *)v6 + 18) = v46;

  id v48 = [(ABSPBContainerAttributes *)self->_containerAttributes copyWithZone:a3];
  v49 = (void *)*((void *)v6 + 5);
  *((void *)v6 + 5) = v48;

  id v50 = [(NSData *)self->_wallpaperImageData copyWithZone:a3];
  v51 = (void *)*((void *)v6 + 24);
  *((void *)v6 + 24) = v50;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((void *)v6 + 2) = self->_sharedPhotoDisplayPreference;
    *((unsigned char *)v6 + 204) |= 2u;
  }
  id v52 = -[NSData copyWithZone:](self->_encryptedPronounData, "copyWithZone:", a3, (void)v59);
  v53 = (void *)*((void *)v6 + 6);
  *((void *)v6 + 6) = v52;

  id v54 = [(NSData *)self->_wallpaperDataRepresentation copyWithZone:a3];
  v55 = (void *)*((void *)v6 + 23);
  *((void *)v6 + 23) = v54;

  id v56 = [(NSData *)self->_sensitiveContentConfiguration copyWithZone:a3];
  v57 = (void *)*((void *)v6 + 19);
  *((void *)v6 + 19) = v56;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_67;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 204) & 4) == 0 || self->_sourceType != *((_DWORD *)v4 + 40)) {
      goto LABEL_67;
    }
  }
  else if ((*((unsigned char *)v4 + 204) & 4) != 0)
  {
    goto LABEL_67;
  }
  groupNames = self->_groupNames;
  if ((unint64_t)groupNames | *((void *)v4 + 9)
    && !-[NSMutableArray isEqual:](groupNames, "isEqual:"))
  {
    goto LABEL_67;
  }
  vcardData = self->_vcardData;
  if ((unint64_t)vcardData | *((void *)v4 + 22))
  {
    if (!-[NSData isEqual:](vcardData, "isEqual:")) {
      goto LABEL_67;
    }
  }
  guid = self->_guid;
  if ((unint64_t)guid | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](guid, "isEqual:")) {
      goto LABEL_67;
    }
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 204) & 8) != 0)
    {
      if (self->_isMe)
      {
        if (!*((unsigned char *)v4 + 200)) {
          goto LABEL_67;
        }
        goto LABEL_21;
      }
      if (!*((unsigned char *)v4 + 200)) {
        goto LABEL_21;
      }
    }
LABEL_67:
    unsigned __int8 v26 = 0;
    goto LABEL_68;
  }
  if ((*((unsigned char *)v4 + 204) & 8) != 0) {
    goto LABEL_67;
  }
LABEL_21:
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 204) & 1) == 0 || self->_modDate != *((double *)v4 + 1)) {
      goto LABEL_67;
    }
  }
  else if (*((unsigned char *)v4 + 204))
  {
    goto LABEL_67;
  }
  externalGuid = self->_externalGuid;
  if ((unint64_t)externalGuid | *((void *)v4 + 7)
    && !-[NSString isEqual:](externalGuid, "isEqual:"))
  {
    goto LABEL_67;
  }
  thumbnail = self->_thumbnail;
  if ((unint64_t)thumbnail | *((void *)v4 + 21))
  {
    if (!-[NSData isEqual:](thumbnail, "isEqual:")) {
      goto LABEL_67;
    }
  }
  linkTos = self->_linkTos;
  if ((unint64_t)linkTos | *((void *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](linkTos, "isEqual:")) {
      goto LABEL_67;
    }
  }
  fastEncodingData = self->_fastEncodingData;
  if ((unint64_t)fastEncodingData | *((void *)v4 + 8))
  {
    if (!-[NSData isEqual:](fastEncodingData, "isEqual:")) {
      goto LABEL_67;
    }
  }
  linkGuid = self->_linkGuid;
  if ((unint64_t)linkGuid | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](linkGuid, "isEqual:")) {
      goto LABEL_67;
    }
  }
  archive = self->_archive;
  if ((unint64_t)archive | *((void *)v4 + 4))
  {
    if (!-[NSData isEqual:](archive, "isEqual:")) {
      goto LABEL_67;
    }
  }
  pb = self->_pb;
  if ((unint64_t)pb | *((void *)v4 + 15))
  {
    if (!-[ABSPBContact isEqual:](pb, "isEqual:")) {
      goto LABEL_67;
    }
  }
  accountExternalIdentifier = self->_accountExternalIdentifier;
  if ((unint64_t)accountExternalIdentifier | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](accountExternalIdentifier, "isEqual:")) {
      goto LABEL_67;
    }
  }
  imageData = self->_imageData;
  if ((unint64_t)imageData | *((void *)v4 + 11))
  {
    if (!-[NSData isEqual:](imageData, "isEqual:")) {
      goto LABEL_67;
    }
  }
  imageType = self->_imageType;
  if ((unint64_t)imageType | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](imageType, "isEqual:")) {
      goto LABEL_67;
    }
  }
  reserved1 = self->_reserved1;
  if ((unint64_t)reserved1 | *((void *)v4 + 16))
  {
    if (!-[NSData isEqual:](reserved1, "isEqual:")) {
      goto LABEL_67;
    }
  }
  reserved2 = self->_reserved2;
  if ((unint64_t)reserved2 | *((void *)v4 + 17))
  {
    if (!-[NSData isEqual:](reserved2, "isEqual:")) {
      goto LABEL_67;
    }
  }
  reserved3 = self->_reserved3;
  if ((unint64_t)reserved3 | *((void *)v4 + 18))
  {
    if (!-[NSData isEqual:](reserved3, "isEqual:")) {
      goto LABEL_67;
    }
  }
  containerAttributes = self->_containerAttributes;
  if ((unint64_t)containerAttributes | *((void *)v4 + 5))
  {
    if (!-[ABSPBContainerAttributes isEqual:](containerAttributes, "isEqual:")) {
      goto LABEL_67;
    }
  }
  wallpaperImageData = self->_wallpaperImageData;
  if ((unint64_t)wallpaperImageData | *((void *)v4 + 24))
  {
    if (!-[NSData isEqual:](wallpaperImageData, "isEqual:")) {
      goto LABEL_67;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 204) & 2) == 0 || self->_sharedPhotoDisplayPreference != *((void *)v4 + 2)) {
      goto LABEL_67;
    }
  }
  else if ((*((unsigned char *)v4 + 204) & 2) != 0)
  {
    goto LABEL_67;
  }
  encryptedPronounData = self->_encryptedPronounData;
  if ((unint64_t)encryptedPronounData | *((void *)v4 + 6)
    && !-[NSData isEqual:](encryptedPronounData, "isEqual:"))
  {
    goto LABEL_67;
  }
  wallpaperDataRepresentation = self->_wallpaperDataRepresentation;
  if ((unint64_t)wallpaperDataRepresentation | *((void *)v4 + 23))
  {
    if (!-[NSData isEqual:](wallpaperDataRepresentation, "isEqual:")) {
      goto LABEL_67;
    }
  }
  sensitiveContentConfiguration = self->_sensitiveContentConfiguration;
  if ((unint64_t)sensitiveContentConfiguration | *((void *)v4 + 19)) {
    unsigned __int8 v26 = -[NSData isEqual:](sensitiveContentConfiguration, "isEqual:");
  }
  else {
    unsigned __int8 v26 = 1;
  }
LABEL_68:

  return v26;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v35 = 2654435761 * self->_sourceType;
  }
  else {
    uint64_t v35 = 0;
  }
  unint64_t v34 = (unint64_t)[(NSMutableArray *)self->_groupNames hash];
  unint64_t v33 = (unint64_t)[(NSData *)self->_vcardData hash];
  NSUInteger v32 = [(NSString *)self->_guid hash];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v31 = 2654435761 * self->_isMe;
  }
  else {
    uint64_t v31 = 0;
  }
  if (*(unsigned char *)&self->_has)
  {
    double modDate = self->_modDate;
    double v4 = -modDate;
    if (modDate >= 0.0) {
      double v4 = self->_modDate;
    }
    long double v5 = floor(v4 + 0.5);
    double v6 = (v4 - v5) * 1.84467441e19;
    double v7 = fmod(v5, 1.84467441e19);
    unint64_t v8 = 2654435761u * (unint64_t)v7;
    unint64_t v9 = v8 + (unint64_t)v6;
    if (v6 <= 0.0) {
      unint64_t v9 = 2654435761u * (unint64_t)v7;
    }
    unint64_t v10 = v8 - (unint64_t)fabs(v6);
    if (v6 >= 0.0) {
      unint64_t v10 = v9;
    }
    unint64_t v30 = v10;
  }
  else
  {
    unint64_t v30 = 0;
  }
  NSUInteger v29 = [(NSString *)self->_externalGuid hash];
  unint64_t v28 = (unint64_t)[(NSData *)self->_thumbnail hash];
  unint64_t v27 = (unint64_t)[(NSMutableArray *)self->_linkTos hash];
  unint64_t v26 = (unint64_t)[(NSData *)self->_fastEncodingData hash];
  NSUInteger v25 = [(NSString *)self->_linkGuid hash];
  unint64_t v11 = (unint64_t)[(NSData *)self->_archive hash];
  unint64_t v12 = [(ABSPBContact *)self->_pb hash];
  NSUInteger v13 = [(NSString *)self->_accountExternalIdentifier hash];
  unint64_t v14 = (unint64_t)[(NSData *)self->_imageData hash];
  NSUInteger v15 = [(NSString *)self->_imageType hash];
  unint64_t v16 = (unint64_t)[(NSData *)self->_reserved1 hash];
  unint64_t v17 = (unint64_t)[(NSData *)self->_reserved2 hash];
  unint64_t v18 = (unint64_t)[(NSData *)self->_reserved3 hash];
  unint64_t v19 = [(ABSPBContainerAttributes *)self->_containerAttributes hash];
  unint64_t v20 = (unint64_t)[(NSData *)self->_wallpaperImageData hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v21 = 2654435761 * self->_sharedPhotoDisplayPreference;
  }
  else {
    uint64_t v21 = 0;
  }
  unint64_t v22 = v34 ^ v35 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ (unint64_t)[(NSData *)self->_encryptedPronounData hash];
  unint64_t v23 = (unint64_t)[(NSData *)self->_wallpaperDataRepresentation hash];
  return v22 ^ v23 ^ (unint64_t)[(NSData *)self->_sensitiveContentConfiguration hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if ((*((unsigned char *)v4 + 204) & 4) != 0)
  {
    self->_sourceType = *((_DWORD *)v4 + 40);
    *(unsigned char *)&self->_has |= 4u;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v6 = *((id *)v4 + 9);
  id v7 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        [(ABSPBContactWrapper *)self addGroupName:*(void *)(*((void *)&v25 + 1) + 8 * i)];
      }
      id v8 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v8);
  }

  if (*((void *)v5 + 22)) {
    -[ABSPBContactWrapper setVcardData:](self, "setVcardData:");
  }
  if (*((void *)v5 + 10)) {
    -[ABSPBContactWrapper setGuid:](self, "setGuid:");
  }
  char v11 = *((unsigned char *)v5 + 204);
  if ((v11 & 8) != 0)
  {
    self->_isMe = *((unsigned char *)v5 + 200);
    *(unsigned char *)&self->_has |= 8u;
    char v11 = *((unsigned char *)v5 + 204);
  }
  if (v11)
  {
    self->_double modDate = *((double *)v5 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v5 + 7)) {
    -[ABSPBContactWrapper setExternalGuid:](self, "setExternalGuid:");
  }
  if (*((void *)v5 + 21)) {
    -[ABSPBContactWrapper setThumbnail:](self, "setThumbnail:");
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v12 = *((id *)v5 + 14);
  id v13 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v14; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        -[ABSPBContactWrapper addLinkTo:](self, "addLinkTo:", *(void *)(*((void *)&v21 + 1) + 8 * (void)j), (void)v21);
      }
      id v14 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v14);
  }

  if (*((void *)v5 + 8)) {
    -[ABSPBContactWrapper setFastEncodingData:](self, "setFastEncodingData:");
  }
  if (*((void *)v5 + 13)) {
    -[ABSPBContactWrapper setLinkGuid:](self, "setLinkGuid:");
  }
  if (*((void *)v5 + 4)) {
    -[ABSPBContactWrapper setArchive:](self, "setArchive:");
  }
  pb = self->_pb;
  uint64_t v18 = *((void *)v5 + 15);
  if (pb)
  {
    if (v18) {
      -[ABSPBContact mergeFrom:](pb, "mergeFrom:");
    }
  }
  else if (v18)
  {
    -[ABSPBContactWrapper setPb:](self, "setPb:");
  }
  if (*((void *)v5 + 3)) {
    -[ABSPBContactWrapper setAccountExternalIdentifier:](self, "setAccountExternalIdentifier:");
  }
  if (*((void *)v5 + 11)) {
    -[ABSPBContactWrapper setImageData:](self, "setImageData:");
  }
  if (*((void *)v5 + 12)) {
    -[ABSPBContactWrapper setImageType:](self, "setImageType:");
  }
  if (*((void *)v5 + 16)) {
    -[ABSPBContactWrapper setReserved1:](self, "setReserved1:");
  }
  if (*((void *)v5 + 17)) {
    -[ABSPBContactWrapper setReserved2:](self, "setReserved2:");
  }
  if (*((void *)v5 + 18)) {
    -[ABSPBContactWrapper setReserved3:](self, "setReserved3:");
  }
  containerAttributes = self->_containerAttributes;
  uint64_t v20 = *((void *)v5 + 5);
  if (containerAttributes)
  {
    if (v20) {
      -[ABSPBContainerAttributes mergeFrom:](containerAttributes, "mergeFrom:");
    }
  }
  else if (v20)
  {
    -[ABSPBContactWrapper setContainerAttributes:](self, "setContainerAttributes:");
  }
  if (*((void *)v5 + 24)) {
    -[ABSPBContactWrapper setWallpaperImageData:](self, "setWallpaperImageData:");
  }
  if ((*((unsigned char *)v5 + 204) & 2) != 0)
  {
    self->_sharedPhotoDisplayPreference = *((void *)v5 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v5 + 6)) {
    -[ABSPBContactWrapper setEncryptedPronounData:](self, "setEncryptedPronounData:");
  }
  if (*((void *)v5 + 23)) {
    -[ABSPBContactWrapper setWallpaperDataRepresentation:](self, "setWallpaperDataRepresentation:");
  }
  if (*((void *)v5 + 19)) {
    -[ABSPBContactWrapper setSensitiveContentConfiguration:](self, "setSensitiveContentConfiguration:");
  }
}

- (NSData)vcardData
{
  return self->_vcardData;
}

- (void)setVcardData:(id)a3
{
}

- (NSData)fastEncodingData
{
  return self->_fastEncodingData;
}

- (void)setFastEncodingData:(id)a3
{
}

- (NSData)archive
{
  return self->_archive;
}

- (void)setArchive:(id)a3
{
}

- (ABSPBContact)pb
{
  return self->_pb;
}

- (void)setPb:(id)a3
{
}

- (NSData)reserved1
{
  return self->_reserved1;
}

- (void)setReserved1:(id)a3
{
}

- (NSData)reserved2
{
  return self->_reserved2;
}

- (void)setReserved2:(id)a3
{
}

- (NSData)reserved3
{
  return self->_reserved3;
}

- (void)setReserved3:(id)a3
{
}

- (int)sourceType
{
  return self->_sourceType;
}

- (NSMutableArray)groupNames
{
  return self->_groupNames;
}

- (void)setGroupNames:(id)a3
{
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
}

- (BOOL)isMe
{
  return self->_isMe;
}

- (double)modDate
{
  return self->_modDate;
}

- (NSString)externalGuid
{
  return self->_externalGuid;
}

- (void)setExternalGuid:(id)a3
{
}

- (NSData)thumbnail
{
  return self->_thumbnail;
}

- (void)setThumbnail:(id)a3
{
}

- (NSMutableArray)linkTos
{
  return self->_linkTos;
}

- (void)setLinkTos:(id)a3
{
}

- (NSString)linkGuid
{
  return self->_linkGuid;
}

- (void)setLinkGuid:(id)a3
{
}

- (NSString)accountExternalIdentifier
{
  return self->_accountExternalIdentifier;
}

- (void)setAccountExternalIdentifier:(id)a3
{
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
}

- (NSString)imageType
{
  return self->_imageType;
}

- (void)setImageType:(id)a3
{
}

- (ABSPBContainerAttributes)containerAttributes
{
  return self->_containerAttributes;
}

- (void)setContainerAttributes:(id)a3
{
}

- (NSData)wallpaperImageData
{
  return self->_wallpaperImageData;
}

- (void)setWallpaperImageData:(id)a3
{
}

- (int64_t)sharedPhotoDisplayPreference
{
  return self->_sharedPhotoDisplayPreference;
}

- (NSData)encryptedPronounData
{
  return self->_encryptedPronounData;
}

- (void)setEncryptedPronounData:(id)a3
{
}

- (NSData)wallpaperDataRepresentation
{
  return self->_wallpaperDataRepresentation;
}

- (void)setWallpaperDataRepresentation:(id)a3
{
}

- (NSData)sensitiveContentConfiguration
{
  return self->_sensitiveContentConfiguration;
}

- (void)setSensitiveContentConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaperImageData, 0);
  objc_storeStrong((id *)&self->_wallpaperDataRepresentation, 0);
  objc_storeStrong((id *)&self->_vcardData, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_sensitiveContentConfiguration, 0);
  objc_storeStrong((id *)&self->_reserved3, 0);
  objc_storeStrong((id *)&self->_reserved2, 0);
  objc_storeStrong((id *)&self->_reserved1, 0);
  objc_storeStrong((id *)&self->_pb, 0);
  objc_storeStrong((id *)&self->_linkTos, 0);
  objc_storeStrong((id *)&self->_linkGuid, 0);
  objc_storeStrong((id *)&self->_imageType, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_guid, 0);
  objc_storeStrong((id *)&self->_groupNames, 0);
  objc_storeStrong((id *)&self->_fastEncodingData, 0);
  objc_storeStrong((id *)&self->_externalGuid, 0);
  objc_storeStrong((id *)&self->_encryptedPronounData, 0);
  objc_storeStrong((id *)&self->_containerAttributes, 0);
  objc_storeStrong((id *)&self->_archive, 0);

  objc_storeStrong((id *)&self->_accountExternalIdentifier, 0);
}

- (BOOL)containsCustomPoster
{
  if ([(ABSPBContactWrapper *)self sharedPhotoDisplayPreference]
    && (id)[(ABSPBContactWrapper *)self sharedPhotoDisplayPreference] != (id)2)
  {
    BOOL v3 = [(ABSPBContactWrapper *)self isMe];
  }
  else
  {
    BOOL v3 = 1;
  }
  id v4 = *(NSObject **)(qword_100069D78 + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v5 = @"shared";
    if (v3) {
      CFStringRef v5 = @"custom";
    }
    int v7 = 138412290;
    CFStringRef v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CNContactSharedPhotoDisplayPreference indicates a %@ poster", (uint8_t *)&v7, 0xCu);
  }
  return v3;
}

@end