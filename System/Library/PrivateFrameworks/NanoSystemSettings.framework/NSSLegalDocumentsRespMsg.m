@interface NSSLegalDocumentsRespMsg
- (BOOL)hasBuildVersion;
- (BOOL)hasBuiltinApps;
- (BOOL)hasLegalNotices;
- (BOOL)hasLicense;
- (BOOL)hasSarStatement;
- (BOOL)hasSarUrlAdded;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)sarUrlAdded;
- (NSData)builtinApps;
- (NSData)legalNotices;
- (NSData)license;
- (NSData)sarStatement;
- (NSString)buildVersion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBuildVersion:(id)a3;
- (void)setBuiltinApps:(id)a3;
- (void)setHasSarUrlAdded:(BOOL)a3;
- (void)setLegalNotices:(id)a3;
- (void)setLicense:(id)a3;
- (void)setSarStatement:(id)a3;
- (void)setSarUrlAdded:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NSSLegalDocumentsRespMsg

- (BOOL)hasLicense
{
  return self->_license != 0;
}

- (BOOL)hasSarStatement
{
  return self->_sarStatement != 0;
}

- (BOOL)hasLegalNotices
{
  return self->_legalNotices != 0;
}

- (BOOL)hasBuildVersion
{
  return self->_buildVersion != 0;
}

- (void)setSarUrlAdded:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_sarUrlAdded = a3;
}

- (void)setHasSarUrlAdded:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSarUrlAdded
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasBuiltinApps
{
  return self->_builtinApps != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NSSLegalDocumentsRespMsg;
  v4 = [(NSSLegalDocumentsRespMsg *)&v8 description];
  v5 = [(NSSLegalDocumentsRespMsg *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  license = self->_license;
  if (license) {
    [v3 setObject:license forKey:@"license"];
  }
  sarStatement = self->_sarStatement;
  if (sarStatement) {
    [v4 setObject:sarStatement forKey:@"sarStatement"];
  }
  legalNotices = self->_legalNotices;
  if (legalNotices) {
    [v4 setObject:legalNotices forKey:@"legalNotices"];
  }
  buildVersion = self->_buildVersion;
  if (buildVersion) {
    [v4 setObject:buildVersion forKey:@"buildVersion"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v9 = [NSNumber numberWithBool:self->_sarUrlAdded];
    [v4 setObject:v9 forKey:@"sarUrlAdded"];
  }
  builtinApps = self->_builtinApps;
  if (builtinApps) {
    [v4 setObject:builtinApps forKey:@"builtinApps"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NSSLegalDocumentsRespMsgReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_license)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_sarStatement)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_legalNotices)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_buildVersion)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_builtinApps)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_license)
  {
    objc_msgSend(v4, "setLicense:");
    id v4 = v5;
  }
  if (self->_sarStatement)
  {
    objc_msgSend(v5, "setSarStatement:");
    id v4 = v5;
  }
  if (self->_legalNotices)
  {
    objc_msgSend(v5, "setLegalNotices:");
    id v4 = v5;
  }
  if (self->_buildVersion)
  {
    objc_msgSend(v5, "setBuildVersion:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[48] = self->_sarUrlAdded;
    v4[52] |= 1u;
  }
  if (self->_builtinApps)
  {
    objc_msgSend(v5, "setBuiltinApps:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_license copyWithZone:a3];
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  uint64_t v8 = [(NSData *)self->_sarStatement copyWithZone:a3];
  v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  uint64_t v10 = [(NSData *)self->_legalNotices copyWithZone:a3];
  v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  uint64_t v12 = [(NSString *)self->_buildVersion copyWithZone:a3];
  v13 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v12;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 48) = self->_sarUrlAdded;
    *(unsigned char *)(v5 + 52) |= 1u;
  }
  uint64_t v14 = [(NSData *)self->_builtinApps copyWithZone:a3];
  v15 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v14;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  license = self->_license;
  if ((unint64_t)license | *((void *)v4 + 4))
  {
    if (!-[NSData isEqual:](license, "isEqual:")) {
      goto LABEL_14;
    }
  }
  sarStatement = self->_sarStatement;
  if ((unint64_t)sarStatement | *((void *)v4 + 5))
  {
    if (!-[NSData isEqual:](sarStatement, "isEqual:")) {
      goto LABEL_14;
    }
  }
  legalNotices = self->_legalNotices;
  if ((unint64_t)legalNotices | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](legalNotices, "isEqual:")) {
      goto LABEL_14;
    }
  }
  buildVersion = self->_buildVersion;
  if ((unint64_t)buildVersion | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](buildVersion, "isEqual:")) {
      goto LABEL_14;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 52))
    {
      if (self->_sarUrlAdded)
      {
        if (*((unsigned char *)v4 + 48)) {
          goto LABEL_20;
        }
      }
      else if (!*((unsigned char *)v4 + 48))
      {
        goto LABEL_20;
      }
    }
LABEL_14:
    char v9 = 0;
    goto LABEL_15;
  }
  if (*((unsigned char *)v4 + 52)) {
    goto LABEL_14;
  }
LABEL_20:
  builtinApps = self->_builtinApps;
  if ((unint64_t)builtinApps | *((void *)v4 + 2)) {
    char v9 = -[NSData isEqual:](builtinApps, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_15:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_license hash];
  uint64_t v4 = [(NSData *)self->_sarStatement hash];
  uint64_t v5 = [(NSData *)self->_legalNotices hash];
  NSUInteger v6 = [(NSString *)self->_buildVersion hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v7 = 2654435761 * self->_sarUrlAdded;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ [(NSData *)self->_builtinApps hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (BOOL *)a3;
  uint64_t v5 = v4;
  if (*((void *)v4 + 4))
  {
    -[NSSLegalDocumentsRespMsg setLicense:](self, "setLicense:");
    uint64_t v4 = v5;
  }
  if (*((void *)v4 + 5))
  {
    -[NSSLegalDocumentsRespMsg setSarStatement:](self, "setSarStatement:");
    uint64_t v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[NSSLegalDocumentsRespMsg setLegalNotices:](self, "setLegalNotices:");
    uint64_t v4 = v5;
  }
  if (*((void *)v4 + 1))
  {
    -[NSSLegalDocumentsRespMsg setBuildVersion:](self, "setBuildVersion:");
    uint64_t v4 = v5;
  }
  if (v4[52])
  {
    self->_sarUrlAdded = v4[48];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 2))
  {
    -[NSSLegalDocumentsRespMsg setBuiltinApps:](self, "setBuiltinApps:");
    uint64_t v4 = v5;
  }
}

- (NSData)license
{
  return self->_license;
}

- (void)setLicense:(id)a3
{
}

- (NSData)sarStatement
{
  return self->_sarStatement;
}

- (void)setSarStatement:(id)a3
{
}

- (NSData)legalNotices
{
  return self->_legalNotices;
}

- (void)setLegalNotices:(id)a3
{
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (void)setBuildVersion:(id)a3
{
}

- (BOOL)sarUrlAdded
{
  return self->_sarUrlAdded;
}

- (NSData)builtinApps
{
  return self->_builtinApps;
}

- (void)setBuiltinApps:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sarStatement, 0);
  objc_storeStrong((id *)&self->_license, 0);
  objc_storeStrong((id *)&self->_legalNotices, 0);
  objc_storeStrong((id *)&self->_builtinApps, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
}

@end