@interface NSPPrivacyProxyAuxiliaryAuthInfo
+ (Class)contentListType;
- (BOOL)hasLabel;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)contentLists;
- (NSString)label;
- (id)authTypeAsString:(int)a3;
- (id)contentListAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsAuthType:(id)a3;
- (int)authType;
- (unint64_t)contentListsCount;
- (unint64_t)hash;
- (void)addContentList:(id)a3;
- (void)clearContentLists;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAuthType:(int)a3;
- (void)setContentLists:(id)a3;
- (void)setLabel:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NSPPrivacyProxyAuxiliaryAuthInfo

- (id)authTypeAsString:(int)a3
{
  if (a3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = @"HPKE";
  }
  return v4;
}

- (int)StringAsAuthType:(id)a3
{
  return 0;
}

- (BOOL)hasLabel
{
  return self->_label != 0;
}

- (void)clearContentLists
{
}

- (void)addContentList:(id)a3
{
  id v4 = a3;
  contentLists = self->_contentLists;
  id v8 = v4;
  if (!contentLists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_contentLists;
    self->_contentLists = v6;

    id v4 = v8;
    contentLists = self->_contentLists;
  }
  [(NSMutableArray *)contentLists addObject:v4];
}

- (unint64_t)contentListsCount
{
  return [(NSMutableArray *)self->_contentLists count];
}

- (id)contentListAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_contentLists objectAtIndex:a3];
}

+ (Class)contentListType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NSPPrivacyProxyAuxiliaryAuthInfo;
  id v4 = [(NSPPrivacyProxyAuxiliaryAuthInfo *)&v8 description];
  v5 = [(NSPPrivacyProxyAuxiliaryAuthInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_authType)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_authType);
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = @"HPKE";
  }
  [v3 setObject:v4 forKey:@"authType"];

  label = self->_label;
  if (label) {
    [v3 setObject:label forKey:@"label"];
  }
  contentLists = self->_contentLists;
  if (contentLists) {
    [v3 setObject:contentLists forKey:@"contentList"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NSPPrivacyProxyAuxiliaryAuthInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  PBDataWriterWriteInt32Field();
  if (self->_label) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_contentLists;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteDataField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v8 = a3;
  v8[2] = self->_authType;
  if (self->_label) {
    objc_msgSend(v8, "setLabel:");
  }
  if ([(NSPPrivacyProxyAuxiliaryAuthInfo *)self contentListsCount])
  {
    [v8 clearContentLists];
    unint64_t v4 = [(NSPPrivacyProxyAuxiliaryAuthInfo *)self contentListsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(NSPPrivacyProxyAuxiliaryAuthInfo *)self contentListAtIndex:i];
        [v8 addContentList:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 8) = self->_authType;
  uint64_t v6 = [(NSString *)self->_label copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = self->_contentLists;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12), "copyWithZone:", a3, (void)v15);
        [(id)v5 addContentList:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && self->_authType == *((_DWORD *)v4 + 2)
    && ((label = self->_label, !((unint64_t)label | v4[3]))
     || -[NSString isEqual:](label, "isEqual:")))
  {
    contentLists = self->_contentLists;
    if ((unint64_t)contentLists | v4[2]) {
      char v7 = -[NSMutableArray isEqual:](contentLists, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = 2654435761 * self->_authType;
  NSUInteger v4 = [(NSString *)self->_label hash];
  return v4 ^ [(NSMutableArray *)self->_contentLists hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self->_authType = *((_DWORD *)v4 + 2);
  if (*((void *)v4 + 3)) {
    -[NSPPrivacyProxyAuxiliaryAuthInfo setLabel:](self, "setLabel:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 2);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[NSPPrivacyProxyAuxiliaryAuthInfo addContentList:](self, "addContentList:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (int)authType
{
  return self->_authType;
}

- (void)setAuthType:(int)a3
{
  self->_authType = a3;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (NSMutableArray)contentLists
{
  return self->_contentLists;
}

- (void)setContentLists:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_contentLists, 0);
}

@end