@interface SYPBContentItem
- (BOOL)hasDisplayTitle;
- (BOOL)hasItemURL;
- (BOOL)hasLinkPreviewMetadata;
- (BOOL)hasPreviewLoadLevel;
- (BOOL)hasSourceIdentifier;
- (BOOL)hasSourceLastKnownName;
- (BOOL)hasUserActivityData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)itemIdentifierData;
- (NSData)linkPreviewMetadata;
- (NSData)userActivityData;
- (NSString)displayTitle;
- (NSString)itemURL;
- (NSString)sourceIdentifier;
- (NSString)sourceLastKnownName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)previewLoadLevel;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDisplayTitle:(id)a3;
- (void)setHasPreviewLoadLevel:(BOOL)a3;
- (void)setItemIdentifierData:(id)a3;
- (void)setItemURL:(id)a3;
- (void)setLinkPreviewMetadata:(id)a3;
- (void)setPreviewLoadLevel:(int64_t)a3;
- (void)setSourceIdentifier:(id)a3;
- (void)setSourceLastKnownName:(id)a3;
- (void)setUserActivityData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SYPBContentItem

- (BOOL)hasDisplayTitle
{
  return self->_displayTitle != 0;
}

- (BOOL)hasSourceIdentifier
{
  return self->_sourceIdentifier != 0;
}

- (BOOL)hasSourceLastKnownName
{
  return self->_sourceLastKnownName != 0;
}

- (BOOL)hasItemURL
{
  return self->_itemURL != 0;
}

- (BOOL)hasUserActivityData
{
  return self->_userActivityData != 0;
}

- (BOOL)hasLinkPreviewMetadata
{
  return self->_linkPreviewMetadata != 0;
}

- (void)setPreviewLoadLevel:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_previewLoadLevel = a3;
}

- (void)setHasPreviewLoadLevel:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPreviewLoadLevel
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SYPBContentItem;
  v4 = [(SYPBContentItem *)&v8 description];
  v5 = [(SYPBContentItem *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  itemIdentifierData = self->_itemIdentifierData;
  if (itemIdentifierData) {
    [v3 setObject:itemIdentifierData forKey:@"itemIdentifierData"];
  }
  displayTitle = self->_displayTitle;
  if (displayTitle) {
    [v4 setObject:displayTitle forKey:@"displayTitle"];
  }
  sourceIdentifier = self->_sourceIdentifier;
  if (sourceIdentifier) {
    [v4 setObject:sourceIdentifier forKey:@"sourceIdentifier"];
  }
  sourceLastKnownName = self->_sourceLastKnownName;
  if (sourceLastKnownName) {
    [v4 setObject:sourceLastKnownName forKey:@"sourceLastKnownName"];
  }
  itemURL = self->_itemURL;
  if (itemURL) {
    [v4 setObject:itemURL forKey:@"itemURL"];
  }
  userActivityData = self->_userActivityData;
  if (userActivityData) {
    [v4 setObject:userActivityData forKey:@"userActivityData"];
  }
  linkPreviewMetadata = self->_linkPreviewMetadata;
  if (linkPreviewMetadata) {
    [v4 setObject:linkPreviewMetadata forKey:@"linkPreviewMetadata"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v12 = [MEMORY[0x1E4F28ED0] numberWithLongLong:self->_previewLoadLevel];
    [v4 setObject:v12 forKey:@"previewLoadLevel"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SYPBContentItemReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_itemIdentifierData) {
    -[SYPBContentItem writeTo:]();
  }
  id v6 = v4;
  PBDataWriterWriteDataField();
  if (self->_displayTitle) {
    PBDataWriterWriteStringField();
  }
  if (self->_sourceIdentifier) {
    PBDataWriterWriteStringField();
  }
  v5 = v6;
  if (self->_sourceLastKnownName)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }
  if (self->_itemURL)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }
  if (self->_userActivityData)
  {
    PBDataWriterWriteDataField();
    v5 = v6;
  }
  if (self->_linkPreviewMetadata)
  {
    PBDataWriterWriteDataField();
    v5 = v6;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    v5 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [v5 setItemIdentifierData:self->_itemIdentifierData];
  if (self->_displayTitle) {
    objc_msgSend(v5, "setDisplayTitle:");
  }
  if (self->_sourceIdentifier) {
    objc_msgSend(v5, "setSourceIdentifier:");
  }
  id v4 = v5;
  if (self->_sourceLastKnownName)
  {
    objc_msgSend(v5, "setSourceLastKnownName:");
    id v4 = v5;
  }
  if (self->_itemURL)
  {
    objc_msgSend(v5, "setItemURL:");
    id v4 = v5;
  }
  if (self->_userActivityData)
  {
    objc_msgSend(v5, "setUserActivityData:");
    id v4 = v5;
  }
  if (self->_linkPreviewMetadata)
  {
    objc_msgSend(v5, "setLinkPreviewMetadata:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_previewLoadLevel;
    *((unsigned char *)v4 + 72) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_itemIdentifierData copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSString *)self->_displayTitle copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  uint64_t v10 = [(NSString *)self->_sourceIdentifier copyWithZone:a3];
  v11 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v10;

  uint64_t v12 = [(NSString *)self->_sourceLastKnownName copyWithZone:a3];
  v13 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v12;

  uint64_t v14 = [(NSString *)self->_itemURL copyWithZone:a3];
  v15 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v14;

  uint64_t v16 = [(NSData *)self->_userActivityData copyWithZone:a3];
  v17 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v16;

  uint64_t v18 = [(NSData *)self->_linkPreviewMetadata copyWithZone:a3];
  v19 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v18;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_previewLoadLevel;
    *(unsigned char *)(v5 + 72) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  itemIdentifierData = self->_itemIdentifierData;
  if ((unint64_t)itemIdentifierData | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](itemIdentifierData, "isEqual:")) {
      goto LABEL_20;
    }
  }
  displayTitle = self->_displayTitle;
  if ((unint64_t)displayTitle | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](displayTitle, "isEqual:")) {
      goto LABEL_20;
    }
  }
  sourceIdentifier = self->_sourceIdentifier;
  if ((unint64_t)sourceIdentifier | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](sourceIdentifier, "isEqual:")) {
      goto LABEL_20;
    }
  }
  sourceLastKnownName = self->_sourceLastKnownName;
  if ((unint64_t)sourceLastKnownName | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](sourceLastKnownName, "isEqual:")) {
      goto LABEL_20;
    }
  }
  itemURL = self->_itemURL;
  if ((unint64_t)itemURL | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](itemURL, "isEqual:")) {
      goto LABEL_20;
    }
  }
  userActivityData = self->_userActivityData;
  if ((unint64_t)userActivityData | *((void *)v4 + 8))
  {
    if (!-[NSData isEqual:](userActivityData, "isEqual:")) {
      goto LABEL_20;
    }
  }
  linkPreviewMetadata = self->_linkPreviewMetadata;
  if ((unint64_t)linkPreviewMetadata | *((void *)v4 + 5))
  {
    if (!-[NSData isEqual:](linkPreviewMetadata, "isEqual:")) {
      goto LABEL_20;
    }
  }
  BOOL v12 = (*((unsigned char *)v4 + 72) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 72) & 1) != 0 && self->_previewLoadLevel == *((void *)v4 + 1))
    {
      BOOL v12 = 1;
      goto LABEL_21;
    }
LABEL_20:
    BOOL v12 = 0;
  }
LABEL_21:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_itemIdentifierData hash];
  NSUInteger v4 = [(NSString *)self->_displayTitle hash];
  NSUInteger v5 = [(NSString *)self->_sourceIdentifier hash];
  NSUInteger v6 = [(NSString *)self->_sourceLastKnownName hash];
  NSUInteger v7 = [(NSString *)self->_itemURL hash];
  uint64_t v8 = [(NSData *)self->_userActivityData hash];
  uint64_t v9 = [(NSData *)self->_linkPreviewMetadata hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v10 = 2654435761 * self->_previewLoadLevel;
  }
  else {
    uint64_t v10 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (int64_t *)a3;
  NSUInteger v5 = v4;
  if (v4[3])
  {
    -[SYPBContentItem setItemIdentifierData:](self, "setItemIdentifierData:");
    NSUInteger v4 = v5;
  }
  if (v4[2])
  {
    -[SYPBContentItem setDisplayTitle:](self, "setDisplayTitle:");
    NSUInteger v4 = v5;
  }
  if (v4[6])
  {
    -[SYPBContentItem setSourceIdentifier:](self, "setSourceIdentifier:");
    NSUInteger v4 = v5;
  }
  if (v4[7])
  {
    -[SYPBContentItem setSourceLastKnownName:](self, "setSourceLastKnownName:");
    NSUInteger v4 = v5;
  }
  if (v4[4])
  {
    -[SYPBContentItem setItemURL:](self, "setItemURL:");
    NSUInteger v4 = v5;
  }
  if (v4[8])
  {
    -[SYPBContentItem setUserActivityData:](self, "setUserActivityData:");
    NSUInteger v4 = v5;
  }
  if (v4[5])
  {
    -[SYPBContentItem setLinkPreviewMetadata:](self, "setLinkPreviewMetadata:");
    NSUInteger v4 = v5;
  }
  if (v4[9])
  {
    self->_previewLoadLevel = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSData)itemIdentifierData
{
  return self->_itemIdentifierData;
}

- (void)setItemIdentifierData:(id)a3
{
}

- (NSString)displayTitle
{
  return self->_displayTitle;
}

- (void)setDisplayTitle:(id)a3
{
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (void)setSourceIdentifier:(id)a3
{
}

- (NSString)sourceLastKnownName
{
  return self->_sourceLastKnownName;
}

- (void)setSourceLastKnownName:(id)a3
{
}

- (NSString)itemURL
{
  return self->_itemURL;
}

- (void)setItemURL:(id)a3
{
}

- (NSData)userActivityData
{
  return self->_userActivityData;
}

- (void)setUserActivityData:(id)a3
{
}

- (NSData)linkPreviewMetadata
{
  return self->_linkPreviewMetadata;
}

- (void)setLinkPreviewMetadata:(id)a3
{
}

- (int64_t)previewLoadLevel
{
  return self->_previewLoadLevel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userActivityData, 0);
  objc_storeStrong((id *)&self->_sourceLastKnownName, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_linkPreviewMetadata, 0);
  objc_storeStrong((id *)&self->_itemURL, 0);
  objc_storeStrong((id *)&self->_itemIdentifierData, 0);
  objc_storeStrong((id *)&self->_displayTitle, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[SYPBContentItem writeTo:]", "SYPBContentItem.m", 186, "nil != self->_itemIdentifierData");
}

@end