@interface AWDHoneybeeSignature
+ (Class)keywordsType;
+ (Class)radarAttachmentTypesType;
- (BOOL)hasInstances;
- (BOOL)hasRadarAttachmentFilename;
- (BOOL)hasRadarAttachmentUUID;
- (BOOL)hasRadarComponent;
- (BOOL)hasRadarDescription;
- (BOOL)hasRadarSignature;
- (BOOL)hasRadarTitle;
- (BOOL)hasRadarVersion;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)keywords;
- (NSMutableArray)radarAttachmentTypes;
- (NSString)radarAttachmentFilename;
- (NSString)radarAttachmentUUID;
- (NSString)radarComponent;
- (NSString)radarDescription;
- (NSString)radarSignature;
- (NSString)radarTitle;
- (NSString)radarVersion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)keywordsAtIndex:(unint64_t)a3;
- (id)radarAttachmentTypesAtIndex:(unint64_t)a3;
- (int)instances;
- (unint64_t)hash;
- (unint64_t)keywordsCount;
- (unint64_t)radarAttachmentTypesCount;
- (unint64_t)timestamp;
- (void)addKeywords:(id)a3;
- (void)addRadarAttachmentTypes:(id)a3;
- (void)clearKeywords;
- (void)clearRadarAttachmentTypes;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasInstances:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setInstances:(int)a3;
- (void)setKeywords:(id)a3;
- (void)setRadarAttachmentFilename:(id)a3;
- (void)setRadarAttachmentTypes:(id)a3;
- (void)setRadarAttachmentUUID:(id)a3;
- (void)setRadarComponent:(id)a3;
- (void)setRadarDescription:(id)a3;
- (void)setRadarSignature:(id)a3;
- (void)setRadarTitle:(id)a3;
- (void)setRadarVersion:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDHoneybeeSignature

- (void)dealloc
{
  [(AWDHoneybeeSignature *)self setRadarTitle:0];
  [(AWDHoneybeeSignature *)self setRadarSignature:0];
  [(AWDHoneybeeSignature *)self setRadarDescription:0];
  [(AWDHoneybeeSignature *)self setRadarComponent:0];
  [(AWDHoneybeeSignature *)self setRadarVersion:0];
  [(AWDHoneybeeSignature *)self setRadarAttachmentUUID:0];
  [(AWDHoneybeeSignature *)self setRadarAttachmentTypes:0];
  [(AWDHoneybeeSignature *)self setRadarAttachmentFilename:0];
  [(AWDHoneybeeSignature *)self setKeywords:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDHoneybeeSignature;
  [(AWDHoneybeeSignature *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasRadarTitle
{
  return self->_radarTitle != 0;
}

- (BOOL)hasRadarSignature
{
  return self->_radarSignature != 0;
}

- (BOOL)hasRadarDescription
{
  return self->_radarDescription != 0;
}

- (BOOL)hasRadarComponent
{
  return self->_radarComponent != 0;
}

- (BOOL)hasRadarVersion
{
  return self->_radarVersion != 0;
}

- (BOOL)hasRadarAttachmentUUID
{
  return self->_radarAttachmentUUID != 0;
}

- (void)clearRadarAttachmentTypes
{
}

- (void)addRadarAttachmentTypes:(id)a3
{
  radarAttachmentTypes = self->_radarAttachmentTypes;
  if (!radarAttachmentTypes)
  {
    radarAttachmentTypes = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_radarAttachmentTypes = radarAttachmentTypes;
  }

  [(NSMutableArray *)radarAttachmentTypes addObject:a3];
}

- (unint64_t)radarAttachmentTypesCount
{
  return [(NSMutableArray *)self->_radarAttachmentTypes count];
}

- (id)radarAttachmentTypesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_radarAttachmentTypes objectAtIndex:a3];
}

+ (Class)radarAttachmentTypesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasRadarAttachmentFilename
{
  return self->_radarAttachmentFilename != 0;
}

- (void)clearKeywords
{
}

- (void)addKeywords:(id)a3
{
  keywords = self->_keywords;
  if (!keywords)
  {
    keywords = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_keywords = keywords;
  }

  [(NSMutableArray *)keywords addObject:a3];
}

- (unint64_t)keywordsCount
{
  return [(NSMutableArray *)self->_keywords count];
}

- (id)keywordsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_keywords objectAtIndex:a3];
}

+ (Class)keywordsType
{
  return (Class)objc_opt_class();
}

- (void)setInstances:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_instances = a3;
}

- (void)setHasInstances:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasInstances
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDHoneybeeSignature;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDHoneybeeSignature description](&v3, sel_description), -[AWDHoneybeeSignature dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  radarTitle = self->_radarTitle;
  if (radarTitle) {
    [v3 setObject:radarTitle forKey:@"radarTitle"];
  }
  radarSignature = self->_radarSignature;
  if (radarSignature) {
    [v3 setObject:radarSignature forKey:@"radarSignature"];
  }
  radarDescription = self->_radarDescription;
  if (radarDescription) {
    [v3 setObject:radarDescription forKey:@"radarDescription"];
  }
  radarComponent = self->_radarComponent;
  if (radarComponent) {
    [v3 setObject:radarComponent forKey:@"radarComponent"];
  }
  radarVersion = self->_radarVersion;
  if (radarVersion) {
    [v3 setObject:radarVersion forKey:@"radarVersion"];
  }
  radarAttachmentUUID = self->_radarAttachmentUUID;
  if (radarAttachmentUUID) {
    [v3 setObject:radarAttachmentUUID forKey:@"radarAttachmentUUID"];
  }
  radarAttachmentTypes = self->_radarAttachmentTypes;
  if (radarAttachmentTypes) {
    [v3 setObject:radarAttachmentTypes forKey:@"radarAttachmentTypes"];
  }
  radarAttachmentFilename = self->_radarAttachmentFilename;
  if (radarAttachmentFilename) {
    [v3 setObject:radarAttachmentFilename forKey:@"radarAttachmentFilename"];
  }
  keywords = self->_keywords;
  if (keywords) {
    [v3 setObject:keywords forKey:@"keywords"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    [v3 setObject:[NSNumber numberWithInt:self->_instances] forKey:@"instances"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDHoneybeeSignatureReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_radarTitle) {
    PBDataWriterWriteStringField();
  }
  if (self->_radarSignature) {
    PBDataWriterWriteStringField();
  }
  if (self->_radarDescription) {
    PBDataWriterWriteStringField();
  }
  if (self->_radarComponent) {
    PBDataWriterWriteStringField();
  }
  if (self->_radarVersion) {
    PBDataWriterWriteStringField();
  }
  if (self->_radarAttachmentUUID) {
    PBDataWriterWriteStringField();
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  radarAttachmentTypes = self->_radarAttachmentTypes;
  uint64_t v5 = [(NSMutableArray *)radarAttachmentTypes countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(radarAttachmentTypes);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v6 = [(NSMutableArray *)radarAttachmentTypes countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v6);
  }
  if (self->_radarAttachmentFilename) {
    PBDataWriterWriteStringField();
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  keywords = self->_keywords;
  uint64_t v10 = [(NSMutableArray *)keywords countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(keywords);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v11 = [(NSMutableArray *)keywords countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v11);
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 96) |= 1u;
  }
  if (self->_radarTitle) {
    [a3 setRadarTitle:];
  }
  if (self->_radarSignature) {
    [a3 setRadarSignature:];
  }
  if (self->_radarDescription) {
    [a3 setRadarDescription:];
  }
  if (self->_radarComponent) {
    [a3 setRadarComponent:];
  }
  if (self->_radarVersion) {
    [a3 setRadarVersion:];
  }
  if (self->_radarAttachmentUUID) {
    [a3 setRadarAttachmentUUID:];
  }
  if ([(AWDHoneybeeSignature *)self radarAttachmentTypesCount])
  {
    [a3 clearRadarAttachmentTypes];
    unint64_t v5 = [(AWDHoneybeeSignature *)self radarAttachmentTypesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        [a3 addRadarAttachmentTypes:-[AWDHoneybeeSignature radarAttachmentTypesAtIndex:](self, "radarAttachmentTypesAtIndex:", i)];
    }
  }
  if (self->_radarAttachmentFilename) {
    [a3 setRadarAttachmentFilename:];
  }
  if ([(AWDHoneybeeSignature *)self keywordsCount])
  {
    [a3 clearKeywords];
    unint64_t v8 = [(AWDHoneybeeSignature *)self keywordsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
        [a3 addKeywords:-[AWDHoneybeeSignature keywordsAtIndex:](self, "keywordsAtIndex:", j)];
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_instances;
    *((unsigned char *)a3 + 96) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v5 = [[[objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 96) |= 1u;
  }

  *(void *)(v6 + 80) = [(NSString *)self->_radarTitle copyWithZone:a3];
  *(void *)(v6 + 72) = [(NSString *)self->_radarSignature copyWithZone:a3];

  *(void *)(v6 + 64) = [(NSString *)self->_radarDescription copyWithZone:a3];
  *(void *)(v6 + 56) = [(NSString *)self->_radarComponent copyWithZone:a3];

  *(void *)(v6 + 88) = [(NSString *)self->_radarVersion copyWithZone:a3];
  *(void *)(v6 + 48) = [(NSString *)self->_radarAttachmentUUID copyWithZone:a3];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  radarAttachmentTypes = self->_radarAttachmentTypes;
  uint64_t v8 = [(NSMutableArray *)radarAttachmentTypes countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(radarAttachmentTypes);
        }
        uint64_t v12 = (void *)[*(id *)(*((void *)&v24 + 1) + 8 * i) copyWithZone:a3];
        [(id)v6 addRadarAttachmentTypes:v12];
      }
      uint64_t v9 = [(NSMutableArray *)radarAttachmentTypes countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v9);
  }

  *(void *)(v6 + 32) = [(NSString *)self->_radarAttachmentFilename copyWithZone:a3];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  keywords = self->_keywords;
  uint64_t v14 = [(NSMutableArray *)keywords countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(keywords);
        }
        long long v18 = (void *)[*(id *)(*((void *)&v20 + 1) + 8 * j) copyWithZone:a3];
        [(id)v6 addKeywords:v18];
      }
      uint64_t v15 = [(NSMutableArray *)keywords countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v15);
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 16) = self->_instances;
    *(unsigned char *)(v6 + 96) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 96) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_29;
      }
    }
    else if (*((unsigned char *)a3 + 96))
    {
LABEL_29:
      LOBYTE(v5) = 0;
      return v5;
    }
    radarTitle = self->_radarTitle;
    if (!((unint64_t)radarTitle | *((void *)a3 + 10))
      || (int v5 = -[NSString isEqual:](radarTitle, "isEqual:")) != 0)
    {
      radarSignature = self->_radarSignature;
      if (!((unint64_t)radarSignature | *((void *)a3 + 9))
        || (int v5 = -[NSString isEqual:](radarSignature, "isEqual:")) != 0)
      {
        radarDescription = self->_radarDescription;
        if (!((unint64_t)radarDescription | *((void *)a3 + 8))
          || (int v5 = -[NSString isEqual:](radarDescription, "isEqual:")) != 0)
        {
          radarComponent = self->_radarComponent;
          if (!((unint64_t)radarComponent | *((void *)a3 + 7))
            || (int v5 = -[NSString isEqual:](radarComponent, "isEqual:")) != 0)
          {
            radarVersion = self->_radarVersion;
            if (!((unint64_t)radarVersion | *((void *)a3 + 11))
              || (int v5 = -[NSString isEqual:](radarVersion, "isEqual:")) != 0)
            {
              radarAttachmentUUID = self->_radarAttachmentUUID;
              if (!((unint64_t)radarAttachmentUUID | *((void *)a3 + 6))
                || (int v5 = -[NSString isEqual:](radarAttachmentUUID, "isEqual:")) != 0)
              {
                radarAttachmentTypes = self->_radarAttachmentTypes;
                if (!((unint64_t)radarAttachmentTypes | *((void *)a3 + 5))
                  || (int v5 = -[NSMutableArray isEqual:](radarAttachmentTypes, "isEqual:")) != 0)
                {
                  radarAttachmentFilename = self->_radarAttachmentFilename;
                  if (!((unint64_t)radarAttachmentFilename | *((void *)a3 + 4))
                    || (int v5 = -[NSString isEqual:](radarAttachmentFilename, "isEqual:")) != 0)
                  {
                    keywords = self->_keywords;
                    if (!((unint64_t)keywords | *((void *)a3 + 3))
                      || (int v5 = -[NSMutableArray isEqual:](keywords, "isEqual:")) != 0)
                    {
                      LOBYTE(v5) = (*((unsigned char *)a3 + 96) & 2) == 0;
                      if ((*(unsigned char *)&self->_has & 2) != 0)
                      {
                        if ((*((unsigned char *)a3 + 96) & 2) == 0 || self->_instances != *((_DWORD *)a3 + 4)) {
                          goto LABEL_29;
                        }
                        LOBYTE(v5) = 1;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v14 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v14 = 0;
  }
  NSUInteger v3 = [(NSString *)self->_radarTitle hash];
  NSUInteger v4 = [(NSString *)self->_radarSignature hash];
  NSUInteger v5 = [(NSString *)self->_radarDescription hash];
  NSUInteger v6 = [(NSString *)self->_radarComponent hash];
  NSUInteger v7 = [(NSString *)self->_radarVersion hash];
  NSUInteger v8 = [(NSString *)self->_radarAttachmentUUID hash];
  uint64_t v9 = [(NSMutableArray *)self->_radarAttachmentTypes hash];
  NSUInteger v10 = [(NSString *)self->_radarAttachmentFilename hash];
  uint64_t v11 = [(NSMutableArray *)self->_keywords hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v12 = 2654435761 * self->_instances;
  }
  else {
    uint64_t v12 = 0;
  }
  return v3 ^ v14 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (*((unsigned char *)a3 + 96))
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 10)) {
    -[AWDHoneybeeSignature setRadarTitle:](self, "setRadarTitle:");
  }
  if (*((void *)a3 + 9)) {
    -[AWDHoneybeeSignature setRadarSignature:](self, "setRadarSignature:");
  }
  if (*((void *)a3 + 8)) {
    -[AWDHoneybeeSignature setRadarDescription:](self, "setRadarDescription:");
  }
  if (*((void *)a3 + 7)) {
    -[AWDHoneybeeSignature setRadarComponent:](self, "setRadarComponent:");
  }
  if (*((void *)a3 + 11)) {
    -[AWDHoneybeeSignature setRadarVersion:](self, "setRadarVersion:");
  }
  if (*((void *)a3 + 6)) {
    -[AWDHoneybeeSignature setRadarAttachmentUUID:](self, "setRadarAttachmentUUID:");
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  NSUInteger v5 = (void *)*((void *)a3 + 5);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [(AWDHoneybeeSignature *)self addRadarAttachmentTypes:*(void *)(*((void *)&v19 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }
  if (*((void *)a3 + 4)) {
    -[AWDHoneybeeSignature setRadarAttachmentFilename:](self, "setRadarAttachmentFilename:");
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  NSUInteger v10 = (void *)*((void *)a3 + 3);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [(AWDHoneybeeSignature *)self addKeywords:*(void *)(*((void *)&v15 + 1) + 8 * j)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
  if ((*((unsigned char *)a3 + 96) & 2) != 0)
  {
    self->_instances = *((_DWORD *)a3 + 4);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)radarTitle
{
  return self->_radarTitle;
}

- (void)setRadarTitle:(id)a3
{
}

- (NSString)radarSignature
{
  return self->_radarSignature;
}

- (void)setRadarSignature:(id)a3
{
}

- (NSString)radarDescription
{
  return self->_radarDescription;
}

- (void)setRadarDescription:(id)a3
{
}

- (NSString)radarComponent
{
  return self->_radarComponent;
}

- (void)setRadarComponent:(id)a3
{
}

- (NSString)radarVersion
{
  return self->_radarVersion;
}

- (void)setRadarVersion:(id)a3
{
}

- (NSString)radarAttachmentUUID
{
  return self->_radarAttachmentUUID;
}

- (void)setRadarAttachmentUUID:(id)a3
{
}

- (NSMutableArray)radarAttachmentTypes
{
  return self->_radarAttachmentTypes;
}

- (void)setRadarAttachmentTypes:(id)a3
{
}

- (NSString)radarAttachmentFilename
{
  return self->_radarAttachmentFilename;
}

- (void)setRadarAttachmentFilename:(id)a3
{
}

- (NSMutableArray)keywords
{
  return self->_keywords;
}

- (void)setKeywords:(id)a3
{
}

- (int)instances
{
  return self->_instances;
}

@end