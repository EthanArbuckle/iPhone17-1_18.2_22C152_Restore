@interface NNMKProtoAccountAdditionOrUpdate
+ (Class)emailType;
+ (Class)mailboxesType;
- (BOOL)hasAccountId;
- (BOOL)hasDefaultEmail;
- (BOOL)hasDisplayName;
- (BOOL)hasEmailAddressToken;
- (BOOL)hasFullSyncVersion;
- (BOOL)hasLocalId;
- (BOOL)hasParentId;
- (BOOL)hasPccEmailAddress;
- (BOOL)hasShouldArchive;
- (BOOL)hasTypeIdentifier;
- (BOOL)hasUsername;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)shouldArchive;
- (NSMutableArray)emails;
- (NSMutableArray)mailboxes;
- (NSString)accountId;
- (NSString)defaultEmail;
- (NSString)displayName;
- (NSString)emailAddressToken;
- (NSString)localId;
- (NSString)parentId;
- (NSString)pccEmailAddress;
- (NSString)typeIdentifier;
- (NSString)username;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)emailAtIndex:(unint64_t)a3;
- (id)mailboxesAtIndex:(unint64_t)a3;
- (unint64_t)emailsCount;
- (unint64_t)hash;
- (unint64_t)mailboxesCount;
- (unsigned)fullSyncVersion;
- (void)addEmail:(id)a3;
- (void)addMailboxes:(id)a3;
- (void)clearEmails;
- (void)clearMailboxes;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccountId:(id)a3;
- (void)setDefaultEmail:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setEmailAddressToken:(id)a3;
- (void)setEmails:(id)a3;
- (void)setFullSyncVersion:(unsigned int)a3;
- (void)setHasFullSyncVersion:(BOOL)a3;
- (void)setHasShouldArchive:(BOOL)a3;
- (void)setLocalId:(id)a3;
- (void)setMailboxes:(id)a3;
- (void)setParentId:(id)a3;
- (void)setPccEmailAddress:(id)a3;
- (void)setShouldArchive:(BOOL)a3;
- (void)setTypeIdentifier:(id)a3;
- (void)setUsername:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NNMKProtoAccountAdditionOrUpdate

- (BOOL)hasAccountId
{
  return self->_accountId != 0;
}

- (BOOL)hasDisplayName
{
  return self->_displayName != 0;
}

- (void)setShouldArchive:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_shouldArchive = a3;
}

- (void)setHasShouldArchive:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasShouldArchive
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)clearEmails
{
}

- (void)addEmail:(id)a3
{
  id v4 = a3;
  emails = self->_emails;
  id v8 = v4;
  if (!emails)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_emails;
    self->_emails = v6;

    id v4 = v8;
    emails = self->_emails;
  }
  [(NSMutableArray *)emails addObject:v4];
}

- (unint64_t)emailsCount
{
  return [(NSMutableArray *)self->_emails count];
}

- (id)emailAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_emails objectAtIndex:a3];
}

+ (Class)emailType
{
  return (Class)objc_opt_class();
}

- (void)clearMailboxes
{
}

- (void)addMailboxes:(id)a3
{
  id v4 = a3;
  mailboxes = self->_mailboxes;
  id v8 = v4;
  if (!mailboxes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_mailboxes;
    self->_mailboxes = v6;

    id v4 = v8;
    mailboxes = self->_mailboxes;
  }
  [(NSMutableArray *)mailboxes addObject:v4];
}

- (unint64_t)mailboxesCount
{
  return [(NSMutableArray *)self->_mailboxes count];
}

- (id)mailboxesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_mailboxes objectAtIndex:a3];
}

+ (Class)mailboxesType
{
  return (Class)objc_opt_class();
}

- (void)setFullSyncVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_fullSyncVersion = a3;
}

- (void)setHasFullSyncVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFullSyncVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasDefaultEmail
{
  return self->_defaultEmail != 0;
}

- (BOOL)hasUsername
{
  return self->_username != 0;
}

- (BOOL)hasLocalId
{
  return self->_localId != 0;
}

- (BOOL)hasParentId
{
  return self->_parentId != 0;
}

- (BOOL)hasTypeIdentifier
{
  return self->_typeIdentifier != 0;
}

- (BOOL)hasEmailAddressToken
{
  return self->_emailAddressToken != 0;
}

- (BOOL)hasPccEmailAddress
{
  return self->_pccEmailAddress != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NNMKProtoAccountAdditionOrUpdate;
  id v4 = [(NNMKProtoAccountAdditionOrUpdate *)&v8 description];
  v5 = [(NNMKProtoAccountAdditionOrUpdate *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  accountId = self->_accountId;
  if (accountId) {
    [v3 setObject:accountId forKey:@"accountId"];
  }
  displayName = self->_displayName;
  if (displayName) {
    [v4 setObject:displayName forKey:@"displayName"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v7 = [NSNumber numberWithBool:self->_shouldArchive];
    [v4 setObject:v7 forKey:@"shouldArchive"];
  }
  emails = self->_emails;
  if (emails) {
    [v4 setObject:emails forKey:@"email"];
  }
  if ([(NSMutableArray *)self->_mailboxes count])
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_mailboxes, "count"));
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v10 = self->_mailboxes;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v26 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * i), "dictionaryRepresentation", (void)v25);
          [v9 addObject:v15];
        }
        uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v12);
    }

    [v4 setObject:v9 forKey:@"mailboxes"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v16 = [NSNumber numberWithUnsignedInt:self->_fullSyncVersion];
    [v4 setObject:v16 forKey:@"fullSyncVersion"];
  }
  defaultEmail = self->_defaultEmail;
  if (defaultEmail) {
    [v4 setObject:defaultEmail forKey:@"defaultEmail"];
  }
  username = self->_username;
  if (username) {
    [v4 setObject:username forKey:@"username"];
  }
  localId = self->_localId;
  if (localId) {
    [v4 setObject:localId forKey:@"localId"];
  }
  parentId = self->_parentId;
  if (parentId) {
    [v4 setObject:parentId forKey:@"parentId"];
  }
  typeIdentifier = self->_typeIdentifier;
  if (typeIdentifier) {
    [v4 setObject:typeIdentifier forKey:@"typeIdentifier"];
  }
  emailAddressToken = self->_emailAddressToken;
  if (emailAddressToken) {
    [v4 setObject:emailAddressToken forKey:@"emailAddressToken"];
  }
  pccEmailAddress = self->_pccEmailAddress;
  if (pccEmailAddress) {
    [v4 setObject:pccEmailAddress forKey:@"pccEmailAddress"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NNMKProtoAccountAdditionOrUpdateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_accountId) {
    PBDataWriterWriteStringField();
  }
  if (self->_displayName) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = self->_emails;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v10 = self->_mailboxes;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_defaultEmail) {
    PBDataWriterWriteStringField();
  }
  if (self->_username) {
    PBDataWriterWriteStringField();
  }
  if (self->_localId) {
    PBDataWriterWriteStringField();
  }
  if (self->_parentId) {
    PBDataWriterWriteStringField();
  }
  if (self->_typeIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_emailAddressToken) {
    PBDataWriterWriteStringField();
  }
  if (self->_pccEmailAddress) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  uint64_t v14 = v4;
  if (self->_accountId)
  {
    objc_msgSend(v4, "setAccountId:");
    id v4 = v14;
  }
  if (self->_displayName)
  {
    objc_msgSend(v14, "setDisplayName:");
    id v4 = v14;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[104] = self->_shouldArchive;
    v4[108] |= 2u;
  }
  if ([(NNMKProtoAccountAdditionOrUpdate *)self emailsCount])
  {
    [v14 clearEmails];
    unint64_t v5 = [(NNMKProtoAccountAdditionOrUpdate *)self emailsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(NNMKProtoAccountAdditionOrUpdate *)self emailAtIndex:i];
        [v14 addEmail:v8];
      }
    }
  }
  if ([(NNMKProtoAccountAdditionOrUpdate *)self mailboxesCount])
  {
    [v14 clearMailboxes];
    unint64_t v9 = [(NNMKProtoAccountAdditionOrUpdate *)self mailboxesCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        uint64_t v12 = [(NNMKProtoAccountAdditionOrUpdate *)self mailboxesAtIndex:j];
        [v14 addMailboxes:v12];
      }
    }
  }
  uint64_t v13 = v14;
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v14 + 12) = self->_fullSyncVersion;
    v14[108] |= 1u;
  }
  if (self->_defaultEmail)
  {
    objc_msgSend(v14, "setDefaultEmail:");
    uint64_t v13 = v14;
  }
  if (self->_username)
  {
    objc_msgSend(v14, "setUsername:");
    uint64_t v13 = v14;
  }
  if (self->_localId)
  {
    objc_msgSend(v14, "setLocalId:");
    uint64_t v13 = v14;
  }
  if (self->_parentId)
  {
    objc_msgSend(v14, "setParentId:");
    uint64_t v13 = v14;
  }
  if (self->_typeIdentifier)
  {
    objc_msgSend(v14, "setTypeIdentifier:");
    uint64_t v13 = v14;
  }
  if (self->_emailAddressToken)
  {
    objc_msgSend(v14, "setEmailAddressToken:");
    uint64_t v13 = v14;
  }
  if (self->_pccEmailAddress)
  {
    objc_msgSend(v14, "setPccEmailAddress:");
    uint64_t v13 = v14;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_accountId copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  uint64_t v8 = [(NSString *)self->_displayName copyWithZone:a3];
  unint64_t v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(unsigned char *)(v5 + 104) = self->_shouldArchive;
    *(unsigned char *)(v5 + 108) |= 2u;
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  unint64_t v10 = self->_emails;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v42;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v42 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = (void *)[*(id *)(*((void *)&v41 + 1) + 8 * v14) copyWithZone:a3];
        [(id)v5 addEmail:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v12);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v16 = self->_mailboxes;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v38;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v38 != v19) {
          objc_enumerationMutation(v16);
        }
        long long v21 = objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * v20), "copyWithZone:", a3, (void)v37);
        [(id)v5 addMailboxes:v21];

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v37 objects:v45 count:16];
    }
    while (v18);
  }

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 48) = self->_fullSyncVersion;
    *(unsigned char *)(v5 + 108) |= 1u;
  }
  uint64_t v22 = -[NSString copyWithZone:](self->_defaultEmail, "copyWithZone:", a3, (void)v37);
  v23 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v22;

  uint64_t v24 = [(NSString *)self->_username copyWithZone:a3];
  uint64_t v25 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v24;

  uint64_t v26 = [(NSString *)self->_localId copyWithZone:a3];
  long long v27 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v26;

  uint64_t v28 = [(NSString *)self->_parentId copyWithZone:a3];
  v29 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v28;

  uint64_t v30 = [(NSString *)self->_typeIdentifier copyWithZone:a3];
  v31 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v30;

  uint64_t v32 = [(NSString *)self->_emailAddressToken copyWithZone:a3];
  v33 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v32;

  uint64_t v34 = [(NSString *)self->_pccEmailAddress copyWithZone:a3];
  v35 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v34;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_37;
  }
  accountId = self->_accountId;
  if ((unint64_t)accountId | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](accountId, "isEqual:")) {
      goto LABEL_37;
    }
  }
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:")) {
      goto LABEL_37;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 108) & 2) != 0)
    {
      if (self->_shouldArchive)
      {
        if (!*((unsigned char *)v4 + 104)) {
          goto LABEL_37;
        }
        goto LABEL_14;
      }
      if (!*((unsigned char *)v4 + 104)) {
        goto LABEL_14;
      }
    }
LABEL_37:
    char v16 = 0;
    goto LABEL_38;
  }
  if ((*((unsigned char *)v4 + 108) & 2) != 0) {
    goto LABEL_37;
  }
LABEL_14:
  emails = self->_emails;
  if ((unint64_t)emails | *((void *)v4 + 5) && !-[NSMutableArray isEqual:](emails, "isEqual:")) {
    goto LABEL_37;
  }
  mailboxes = self->_mailboxes;
  if ((unint64_t)mailboxes | *((void *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](mailboxes, "isEqual:")) {
      goto LABEL_37;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 108) & 1) == 0 || self->_fullSyncVersion != *((_DWORD *)v4 + 12)) {
      goto LABEL_37;
    }
  }
  else if (*((unsigned char *)v4 + 108))
  {
    goto LABEL_37;
  }
  defaultEmail = self->_defaultEmail;
  if ((unint64_t)defaultEmail | *((void *)v4 + 2)
    && !-[NSString isEqual:](defaultEmail, "isEqual:"))
  {
    goto LABEL_37;
  }
  username = self->_username;
  if ((unint64_t)username | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](username, "isEqual:")) {
      goto LABEL_37;
    }
  }
  localId = self->_localId;
  if ((unint64_t)localId | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](localId, "isEqual:")) {
      goto LABEL_37;
    }
  }
  parentId = self->_parentId;
  if ((unint64_t)parentId | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](parentId, "isEqual:")) {
      goto LABEL_37;
    }
  }
  typeIdentifier = self->_typeIdentifier;
  if ((unint64_t)typeIdentifier | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](typeIdentifier, "isEqual:")) {
      goto LABEL_37;
    }
  }
  emailAddressToken = self->_emailAddressToken;
  if ((unint64_t)emailAddressToken | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](emailAddressToken, "isEqual:")) {
      goto LABEL_37;
    }
  }
  pccEmailAddress = self->_pccEmailAddress;
  if ((unint64_t)pccEmailAddress | *((void *)v4 + 10)) {
    char v16 = -[NSString isEqual:](pccEmailAddress, "isEqual:");
  }
  else {
    char v16 = 1;
  }
LABEL_38:

  return v16;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_accountId hash];
  NSUInteger v4 = [(NSString *)self->_displayName hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_shouldArchive;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = [(NSMutableArray *)self->_emails hash];
  uint64_t v7 = [(NSMutableArray *)self->_mailboxes hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v8 = 2654435761 * self->_fullSyncVersion;
  }
  else {
    uint64_t v8 = 0;
  }
  NSUInteger v9 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ [(NSString *)self->_defaultEmail hash];
  NSUInteger v10 = [(NSString *)self->_username hash];
  NSUInteger v11 = v10 ^ [(NSString *)self->_localId hash];
  NSUInteger v12 = v11 ^ [(NSString *)self->_parentId hash];
  NSUInteger v13 = v9 ^ v12 ^ [(NSString *)self->_typeIdentifier hash];
  NSUInteger v14 = [(NSString *)self->_emailAddressToken hash];
  return v13 ^ v14 ^ [(NSString *)self->_pccEmailAddress hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 1)) {
    -[NNMKProtoAccountAdditionOrUpdate setAccountId:](self, "setAccountId:");
  }
  if (*((void *)v4 + 3)) {
    -[NNMKProtoAccountAdditionOrUpdate setDisplayName:](self, "setDisplayName:");
  }
  if ((*((unsigned char *)v4 + 108) & 2) != 0)
  {
    self->_shouldArchive = *((unsigned char *)v4 + 104);
    *(unsigned char *)&self->_has |= 2u;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = *((id *)v4 + 5);
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
        [(NNMKProtoAccountAdditionOrUpdate *)self addEmail:*(void *)(*((void *)&v19 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = *((id *)v4 + 8);
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
        -[NNMKProtoAccountAdditionOrUpdate addMailboxes:](self, "addMailboxes:", *(void *)(*((void *)&v15 + 1) + 8 * j), (void)v15);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }

  if (*((unsigned char *)v4 + 108))
  {
    self->_fullSyncVersion = *((_DWORD *)v4 + 12);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 2)) {
    -[NNMKProtoAccountAdditionOrUpdate setDefaultEmail:](self, "setDefaultEmail:");
  }
  if (*((void *)v4 + 12)) {
    -[NNMKProtoAccountAdditionOrUpdate setUsername:](self, "setUsername:");
  }
  if (*((void *)v4 + 7)) {
    -[NNMKProtoAccountAdditionOrUpdate setLocalId:](self, "setLocalId:");
  }
  if (*((void *)v4 + 9)) {
    -[NNMKProtoAccountAdditionOrUpdate setParentId:](self, "setParentId:");
  }
  if (*((void *)v4 + 11)) {
    -[NNMKProtoAccountAdditionOrUpdate setTypeIdentifier:](self, "setTypeIdentifier:");
  }
  if (*((void *)v4 + 4)) {
    -[NNMKProtoAccountAdditionOrUpdate setEmailAddressToken:](self, "setEmailAddressToken:");
  }
  if (*((void *)v4 + 10)) {
    -[NNMKProtoAccountAdditionOrUpdate setPccEmailAddress:](self, "setPccEmailAddress:");
  }
}

- (NSString)accountId
{
  return self->_accountId;
}

- (void)setAccountId:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (BOOL)shouldArchive
{
  return self->_shouldArchive;
}

- (NSMutableArray)emails
{
  return self->_emails;
}

- (void)setEmails:(id)a3
{
}

- (NSMutableArray)mailboxes
{
  return self->_mailboxes;
}

- (void)setMailboxes:(id)a3
{
}

- (unsigned)fullSyncVersion
{
  return self->_fullSyncVersion;
}

- (NSString)defaultEmail
{
  return self->_defaultEmail;
}

- (void)setDefaultEmail:(id)a3
{
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
}

- (NSString)localId
{
  return self->_localId;
}

- (void)setLocalId:(id)a3
{
}

- (NSString)parentId
{
  return self->_parentId;
}

- (void)setParentId:(id)a3
{
}

- (NSString)typeIdentifier
{
  return self->_typeIdentifier;
}

- (void)setTypeIdentifier:(id)a3
{
}

- (NSString)emailAddressToken
{
  return self->_emailAddressToken;
}

- (void)setEmailAddressToken:(id)a3
{
}

- (NSString)pccEmailAddress
{
  return self->_pccEmailAddress;
}

- (void)setPccEmailAddress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_typeIdentifier, 0);
  objc_storeStrong((id *)&self->_pccEmailAddress, 0);
  objc_storeStrong((id *)&self->_parentId, 0);
  objc_storeStrong((id *)&self->_mailboxes, 0);
  objc_storeStrong((id *)&self->_localId, 0);
  objc_storeStrong((id *)&self->_emails, 0);
  objc_storeStrong((id *)&self->_emailAddressToken, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_defaultEmail, 0);
  objc_storeStrong((id *)&self->_accountId, 0);
}

@end