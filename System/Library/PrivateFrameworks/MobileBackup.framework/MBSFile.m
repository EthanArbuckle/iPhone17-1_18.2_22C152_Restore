@interface MBSFile
- (BOOL)committed;
- (BOOL)hasAdded;
- (BOOL)hasAttributes;
- (BOOL)hasCommitted;
- (BOOL)hasDomain;
- (BOOL)hasDuplicateFile;
- (BOOL)hasFileID;
- (BOOL)hasRelativePath;
- (BOOL)hasSignature;
- (BOOL)hasSize;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)verifyWithError:(id *)a3;
- (MBSFileAttributes)attributes;
- (MBSFileReference)duplicateFile;
- (NSData)fileID;
- (NSData)signature;
- (NSString)domain;
- (NSString)relativePath;
- (id)MBFileWithDomainManager:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)added;
- (unint64_t)hash;
- (unint64_t)size;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAdded:(unint64_t)a3;
- (void)setAttributes:(id)a3;
- (void)setCommitted:(BOOL)a3;
- (void)setDomain:(id)a3;
- (void)setDuplicateFile:(id)a3;
- (void)setFileID:(id)a3;
- (void)setHasAdded:(BOOL)a3;
- (void)setHasCommitted:(BOOL)a3;
- (void)setHasSize:(BOOL)a3;
- (void)setRelativePath:(id)a3;
- (void)setSignature:(id)a3;
- (void)setSize:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation MBSFile

- (void)dealloc
{
  [(MBSFile *)self setFileID:0];
  [(MBSFile *)self setDomain:0];
  [(MBSFile *)self setRelativePath:0];
  [(MBSFile *)self setSignature:0];
  [(MBSFile *)self setAttributes:0];
  [(MBSFile *)self setDuplicateFile:0];
  v3.receiver = self;
  v3.super_class = (Class)MBSFile;
  [(MBSFile *)&v3 dealloc];
}

- (BOOL)hasFileID
{
  return self->_fileID != 0;
}

- (BOOL)hasDomain
{
  return self->_domain != 0;
}

- (BOOL)hasRelativePath
{
  return self->_relativePath != 0;
}

- (BOOL)hasSignature
{
  return self->_signature != 0;
}

- (void)setSize:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_size = a3;
}

- (void)setHasSize:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSize
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasAttributes
{
  return self->_attributes != 0;
}

- (void)setAdded:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_added = a3;
}

- (void)setHasAdded:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAdded
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasDuplicateFile
{
  return self->_duplicateFile != 0;
}

- (void)setCommitted:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_committed = a3;
}

- (void)setHasCommitted:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasCommitted
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)MBSFile;
  return +[NSString stringWithFormat:@"%@ %@", [(MBSFile *)&v3 description], [(MBSFile *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  fileID = self->_fileID;
  if (fileID) {
    [v3 setObject:fileID forKey:@"fileID"];
  }
  domain = self->_domain;
  if (domain) {
    [v4 setObject:domain forKey:@"domain"];
  }
  relativePath = self->_relativePath;
  if (relativePath) {
    [v4 setObject:relativePath forKey:@"relativePath"];
  }
  signature = self->_signature;
  if (signature) {
    [v4 setObject:signature forKey:@"signature"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_size), @"size");
  }
  attributes = self->_attributes;
  if (attributes) {
    objc_msgSend(v4, "setObject:forKey:", -[MBSFileAttributes dictionaryRepresentation](attributes, "dictionaryRepresentation"), @"attributes");
  }
  if (*(unsigned char *)&self->_has) {
    objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_added), @"added");
  }
  duplicateFile = self->_duplicateFile;
  if (duplicateFile) {
    objc_msgSend(v4, "setObject:forKey:", -[MBSFileReference dictionaryRepresentation](duplicateFile, "dictionaryRepresentation"), @"duplicateFile");
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_committed), @"committed");
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(void *)((char *)a3
                                                                           + OBJC_IVAR___PBDataReader__length))
  {
    while (!*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error))
    {
      char v5 = 0;
      unsigned int v6 = 0;
      uint64_t v7 = 0;
      while (1)
      {
        unint64_t v8 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
        if (v8 == -1 || v8 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v9 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v8);
        *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v8 + 1;
        v7 |= (unint64_t)(v9 & 0x7F) << v5;
        if ((v9 & 0x80) == 0) {
          goto LABEL_11;
        }
        v5 += 7;
        BOOL v10 = v6++ >= 9;
        if (v10)
        {
          LODWORD(v7) = 0;
          int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_13;
        }
      }
      *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
      int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
      if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
        LODWORD(v7) = 0;
      }
LABEL_13:
      if (v11 || (v7 & 7) == 4) {
        break;
      }
      switch((unsigned __int16)(v7 >> 3))
      {
        case 1u:
          Data = (void *)PBReaderReadData();

          id v14 = Data;
          uint64_t v15 = 48;
          goto LABEL_24;
        case 2u:
          String = (void *)PBReaderReadString();

          id v14 = String;
          uint64_t v15 = 32;
          goto LABEL_24;
        case 3u:
          v18 = (void *)PBReaderReadString();

          id v14 = v18;
          uint64_t v15 = 56;
          goto LABEL_24;
        case 4u:
          v19 = (void *)PBReaderReadData();

          id v14 = v19;
          uint64_t v15 = 64;
LABEL_24:
          *(void *)&self->PBCodable_opaque[v15] = v14;
          goto LABEL_65;
        case 5u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)&self->_has |= 2u;
          while (2)
          {
            unint64_t v23 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v23 == -1 || v23 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v24 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v23);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v23 + 1;
              v22 |= (unint64_t)(v24 & 0x7F) << v20;
              if (v24 < 0)
              {
                v20 += 7;
                BOOL v10 = v21++ >= 9;
                if (v10)
                {
                  uint64_t v22 = 0;
                  goto LABEL_55;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v22 = 0;
          }
LABEL_55:
          uint64_t v36 = 16;
          goto LABEL_60;
        case 6u:
          v25 = objc_alloc_init(MBSFileAttributes);

          self->_attributes = v25;
          if (!PBReaderPlaceMark() || (MBSFileAttributesReadFrom((uint64_t)v25, (uint64_t)a3) & 1) == 0) {
            goto LABEL_67;
          }
          goto LABEL_44;
        case 7u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)&self->_has |= 1u;
          while (2)
          {
            unint64_t v28 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v28 == -1 || v28 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v29 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v28);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v28 + 1;
              v22 |= (unint64_t)(v29 & 0x7F) << v26;
              if (v29 < 0)
              {
                v26 += 7;
                BOOL v10 = v27++ >= 9;
                if (v10)
                {
                  uint64_t v22 = 0;
                  goto LABEL_59;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v22 = 0;
          }
LABEL_59:
          uint64_t v36 = 8;
LABEL_60:
          *(void *)&self->PBCodable_opaque[v36] = v22;
          goto LABEL_65;
        case 8u:
          v30 = objc_alloc_init(MBSFileReference);

          self->_duplicateFile = v30;
          if (!PBReaderPlaceMark() || (MBSFileReferenceReadFrom((uint64_t)v30, (uint64_t)a3) & 1) == 0)
          {
LABEL_67:
            LOBYTE(v16) = 0;
            return v16;
          }
LABEL_44:
          PBReaderRecallMark();
LABEL_65:
          if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(void *)((char *)a3
                                                                                    + OBJC_IVAR___PBDataReader__length))
            goto LABEL_66;
          break;
        case 9u:
          char v31 = 0;
          unsigned int v32 = 0;
          uint64_t v33 = 0;
          *(unsigned char *)&self->_has |= 4u;
          while (2)
          {
            unint64_t v34 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v34 == -1 || v34 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v35 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v34);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v34 + 1;
              v33 |= (unint64_t)(v35 & 0x7F) << v31;
              if (v35 < 0)
              {
                v31 += 7;
                BOOL v10 = v32++ >= 9;
                if (v10)
                {
                  uint64_t v33 = 0;
                  goto LABEL_64;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v33 = 0;
          }
LABEL_64:
          self->_committed = v33 != 0;
          goto LABEL_65;
        default:
          int v16 = PBReaderSkipValueWithTag();
          if (!v16) {
            return v16;
          }
          goto LABEL_65;
      }
    }
  }
LABEL_66:
  LOBYTE(v16) = *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v16;
}

- (void)writeTo:(id)a3
{
  if (self->_fileID) {
    PBDataWriterWriteDataField();
  }
  if (self->_domain) {
    PBDataWriterWriteStringField();
  }
  if (self->_relativePath) {
    PBDataWriterWriteStringField();
  }
  if (self->_signature) {
    PBDataWriterWriteDataField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_attributes) {
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_duplicateFile) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  if (self->_fileID) {
    objc_msgSend(a3, "setFileID:");
  }
  if (self->_domain) {
    objc_msgSend(a3, "setDomain:");
  }
  if (self->_relativePath) {
    objc_msgSend(a3, "setRelativePath:");
  }
  if (self->_signature) {
    objc_msgSend(a3, "setSignature:");
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((void *)a3 + 2) = self->_size;
    *((unsigned char *)a3 + 76) |= 2u;
  }
  if (self->_attributes) {
    objc_msgSend(a3, "setAttributes:");
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_added;
    *((unsigned char *)a3 + 76) |= 1u;
  }
  if (self->_duplicateFile) {
    objc_msgSend(a3, "setDuplicateFile:");
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((unsigned char *)a3 + 72) = self->_committed;
    *((unsigned char *)a3 + 76) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  char v5 = (id *)objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  v5[6] = [(NSData *)self->_fileID copyWithZone:a3];
  v5[4] = [(NSString *)self->_domain copyWithZone:a3];

  v5[7] = [(NSString *)self->_relativePath copyWithZone:a3];
  v5[8] = [(NSData *)self->_signature copyWithZone:a3];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v5[2] = self->_size;
    *((unsigned char *)v5 + 76) |= 2u;
  }

  v5[3] = [(MBSFileAttributes *)self->_attributes copyWithZone:a3];
  if (*(unsigned char *)&self->_has)
  {
    v5[1] = self->_added;
    *((unsigned char *)v5 + 76) |= 1u;
  }

  v5[5] = [(MBSFileReference *)self->_duplicateFile copyWithZone:a3];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((unsigned char *)v5 + 72) = self->_committed;
    *((unsigned char *)v5 + 76) |= 4u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    fileID = self->_fileID;
    if (!((unint64_t)fileID | *((void *)a3 + 6))
      || (unsigned int v5 = -[NSData isEqual:](fileID, "isEqual:")) != 0)
    {
      domain = self->_domain;
      if (!((unint64_t)domain | *((void *)a3 + 4))
        || (unsigned int v5 = -[NSString isEqual:](domain, "isEqual:")) != 0)
      {
        relativePath = self->_relativePath;
        if (!((unint64_t)relativePath | *((void *)a3 + 7))
          || (unsigned int v5 = -[NSString isEqual:](relativePath, "isEqual:")) != 0)
        {
          signature = self->_signature;
          if (!((unint64_t)signature | *((void *)a3 + 8))
            || (unsigned int v5 = -[NSData isEqual:](signature, "isEqual:")) != 0)
          {
            char has = (char)self->_has;
            char v11 = *((unsigned char *)a3 + 76);
            if ((has & 2) != 0)
            {
              if ((*((unsigned char *)a3 + 76) & 2) == 0 || self->_size != *((void *)a3 + 2)) {
                goto LABEL_30;
              }
            }
            else if ((*((unsigned char *)a3 + 76) & 2) != 0)
            {
LABEL_30:
              LOBYTE(v5) = 0;
              return v5;
            }
            attributes = self->_attributes;
            if ((unint64_t)attributes | *((void *)a3 + 3))
            {
              unsigned int v5 = -[MBSFileAttributes isEqual:](attributes, "isEqual:");
              if (!v5) {
                return v5;
              }
              char has = (char)self->_has;
              char v11 = *((unsigned char *)a3 + 76);
            }
            if (has)
            {
              if ((v11 & 1) == 0 || self->_added != *((void *)a3 + 1)) {
                goto LABEL_30;
              }
            }
            else if (v11)
            {
              goto LABEL_30;
            }
            duplicateFile = self->_duplicateFile;
            if ((unint64_t)duplicateFile | *((void *)a3 + 5))
            {
              unsigned int v5 = -[MBSFileReference isEqual:](duplicateFile, "isEqual:");
              if (!v5) {
                return v5;
              }
              char has = (char)self->_has;
              char v11 = *((unsigned char *)a3 + 76);
            }
            LOBYTE(v5) = (v11 & 4) == 0;
            if ((has & 4) != 0)
            {
              if ((v11 & 4) == 0 || self->_committed != *((unsigned __int8 *)a3 + 72)) {
                goto LABEL_30;
              }
              LOBYTE(v5) = 1;
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
  unint64_t v3 = (unint64_t)[(NSData *)self->_fileID hash];
  NSUInteger v4 = [(NSString *)self->_domain hash];
  NSUInteger v5 = [(NSString *)self->_relativePath hash];
  unint64_t v6 = (unint64_t)[(NSData *)self->_signature hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    unint64_t v7 = 2654435761u * self->_size;
  }
  else {
    unint64_t v7 = 0;
  }
  unint64_t v8 = [(MBSFileAttributes *)self->_attributes hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v9 = 2654435761u * self->_added;
  }
  else {
    unint64_t v9 = 0;
  }
  unint64_t v10 = [(MBSFileReference *)self->_duplicateFile hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v11 = 2654435761 * self->_committed;
  }
  else {
    uint64_t v11 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 6)) {
    -[MBSFile setFileID:](self, "setFileID:");
  }
  if (*((void *)a3 + 4)) {
    -[MBSFile setDomain:](self, "setDomain:");
  }
  if (*((void *)a3 + 7)) {
    -[MBSFile setRelativePath:](self, "setRelativePath:");
  }
  if (*((void *)a3 + 8)) {
    -[MBSFile setSignature:](self, "setSignature:");
  }
  if ((*((unsigned char *)a3 + 76) & 2) != 0)
  {
    self->_size = *((void *)a3 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  attributes = self->_attributes;
  uint64_t v6 = *((void *)a3 + 3);
  if (attributes)
  {
    if (v6) {
      -[MBSFileAttributes mergeFrom:](attributes, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[MBSFile setAttributes:](self, "setAttributes:");
  }
  if (*((unsigned char *)a3 + 76))
  {
    self->_added = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  duplicateFile = self->_duplicateFile;
  uint64_t v8 = *((void *)a3 + 5);
  if (duplicateFile)
  {
    if (v8) {
      -[MBSFileReference mergeFrom:](duplicateFile, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[MBSFile setDuplicateFile:](self, "setDuplicateFile:");
  }
  if ((*((unsigned char *)a3 + 76) & 4) != 0)
  {
    self->_committed = *((unsigned char *)a3 + 72);
    *(unsigned char *)&self->_has |= 4u;
  }
}

- (NSData)fileID
{
  return self->_fileID;
}

- (void)setFileID:(id)a3
{
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (NSString)relativePath
{
  return self->_relativePath;
}

- (void)setRelativePath:(id)a3
{
}

- (NSData)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
}

- (unint64_t)size
{
  return self->_size;
}

- (MBSFileAttributes)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
}

- (unint64_t)added
{
  return self->_added;
}

- (MBSFileReference)duplicateFile
{
  return self->_duplicateFile;
}

- (void)setDuplicateFile:(id)a3
{
}

- (BOOL)committed
{
  return self->_committed;
}

- (BOOL)verifyWithError:(id *)a3
{
  if (![(MBSFile *)self hasFileID])
  {
    CFStringRef v16 = @"File.fileID missing";
    goto LABEL_19;
  }
  NSUInteger v5 = [(MBSFile *)self fileID];
  id v6 = [v5 length];

  if (v6 != (id)20)
  {
    CFStringRef v16 = @"Invalid File.fileID length";
    goto LABEL_19;
  }
  if (![(MBSFile *)self hasDomain])
  {
    CFStringRef v16 = @"File.domain missing";
    goto LABEL_19;
  }
  unint64_t v7 = [(MBSFile *)self domain];
  id v8 = [v7 length];

  if (!v8)
  {
    CFStringRef v16 = @"File.domain empty";
    goto LABEL_19;
  }
  if ([(MBSFile *)self hasRelativePath])
  {
    unint64_t v9 = [(MBSFile *)self relativePath];
    int valid = MBIsValidRelativePath();

    if (!valid)
    {
      CFStringRef v16 = @"File.relativePath invalid";
      goto LABEL_19;
    }
  }
  if ([(MBSFile *)self hasAttributes])
  {
    uint64_t v11 = [(MBSFile *)self attributes];
    unsigned int v12 = [v11 verifyWithFile:self error:a3];

    if (!v12) {
      return 0;
    }
    v13 = [(MBSFile *)self attributes];
    int v14 = (unsigned __int16)[v13 mode] & 0xF000;

    unsigned int v15 = [(MBSFile *)self hasSize];
    if (v14 == 0x8000)
    {
      if (v15)
      {
        if (![(MBSFile *)self hasSignature] && [(MBSFile *)self size])
        {
          CFStringRef v16 = @"File.signature missing for non-empty regular file";
          goto LABEL_19;
        }
        v19 = [(MBSFile *)self signature];
        if ([v19 length])
        {

          return 1;
        }
        unint64_t v20 = [(MBSFile *)self size];

        if (!v20) {
          return 1;
        }
        CFStringRef v16 = @"File.signature empty for non-empty regular file";
      }
      else
      {
        CFStringRef v16 = @"File.size missing for regular file";
      }
    }
    else
    {
      if (!v15 || ![(MBSFile *)self size]) {
        return 1;
      }
      CFStringRef v16 = @"File.size non-zero for non-regular file";
    }
LABEL_19:
    if (a3)
    {
      id v17 = +[MBError errorWithCode:205, @"%@", v16 format];
      BOOL result = 0;
      *a3 = v17;
      return result;
    }
    return 0;
  }
  return 1;
}

- (id)MBFileWithDomainManager:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [(MBSFile *)self domain];
  id v6 = [v4 domainForName:v5];

  if (!v6)
  {
    id v29 = objc_alloc((Class)MBException);
    v30 = [(MBSFile *)self domain];
    id v31 = [v29 initWithCode:205, @"Domain not found: %@", v30 format];

    objc_exception_throw(v31);
  }
  unint64_t v7 = [(MBSFile *)self attributes];
  id v8 = [v7 extendedAttributes];
  unint64_t v9 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v8 count]);

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  unint64_t v10 = [(MBSFile *)self attributes];
  uint64_t v11 = [v10 extendedAttributes];

  id v12 = [v11 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v37;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v37 != v14) {
          objc_enumerationMutation(v11);
        }
        CFStringRef v16 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        id v17 = [v16 value];
        v18 = [v16 name];
        [v9 setObject:v17 forKeyedSubscript:v18];
      }
      id v13 = [v11 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v13);
  }

  v19 = [(MBSFile *)self relativePath];
  unint64_t v20 = +[MBFile fileWithDomain:v6 relativePath:v19];

  unsigned int v21 = [(MBSFile *)self attributes];
  uint64_t v22 = [v21 target];
  [v20 setTarget:v22];

  unint64_t v23 = [(MBSFile *)self signature];
  [v20 setDigest:v23];

  char v24 = [(MBSFile *)self attributes];
  v25 = [v24 encryptionKey];
  [v20 setEncryptionKey:v25];

  char v26 = [(MBSFile *)self attributes];
  objc_msgSend(v20, "setEncryptionKeyVersion:", objc_msgSend(v26, "encryptionKeyVersion"));

  [v20 setExtendedAttributes:v9];
  uint64_t v35 = 0;
  long long v33 = 0u;
  long long v34 = 0u;
  memset(v32, 0, sizeof(v32));
  unsigned int v27 = [(MBSFile *)self attributes];
  [v27 getNode:v32];

  *((void *)&v33 + 1) = [(MBSFile *)self size];
  [v20 setNode:v32];

  return v20;
}

@end