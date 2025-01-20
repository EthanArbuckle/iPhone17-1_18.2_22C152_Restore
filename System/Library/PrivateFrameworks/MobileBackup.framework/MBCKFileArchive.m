@interface MBCKFileArchive
- (BOOL)deleted;
- (BOOL)hasAbsolutePath;
- (BOOL)hasAbsolutePathPrefix;
- (BOOL)hasBirth;
- (BOOL)hasContentCompressionMethod;
- (BOOL)hasContentEncodingMethod;
- (BOOL)hasDecodedAssetPath;
- (BOOL)hasDeleted;
- (BOOL)hasDomainName;
- (BOOL)hasEncryptionKey;
- (BOOL)hasFileID;
- (BOOL)hasFileType;
- (BOOL)hasFlags;
- (BOOL)hasGroupID;
- (BOOL)hasInode;
- (BOOL)hasIsMMCSEncryptedOnly;
- (BOOL)hasLinkTarget;
- (BOOL)hasMode;
- (BOOL)hasModified;
- (BOOL)hasProtectionClass;
- (BOOL)hasRelativePath;
- (BOOL)hasResourcesSize;
- (BOOL)hasSha256Signature;
- (BOOL)hasSignature;
- (BOOL)hasSize;
- (BOOL)hasSizeBeforeCopy;
- (BOOL)hasSizeBeforeEncoding;
- (BOOL)hasSourceDeviceInode;
- (BOOL)hasStashedAssetIsDecrypted;
- (BOOL)hasStashedAssetPath;
- (BOOL)hasStashedResourcePath;
- (BOOL)hasStatusChanged;
- (BOOL)hasSubDomain;
- (BOOL)hasUserID;
- (BOOL)hasVolumeType;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMMCSEncryptedOnly;
- (BOOL)readFrom:(id)a3;
- (BOOL)stashedAssetIsDecrypted;
- (NSData)encryptionKey;
- (NSData)sha256Signature;
- (NSData)signature;
- (NSString)absolutePath;
- (NSString)absolutePathPrefix;
- (NSString)decodedAssetPath;
- (NSString)domainName;
- (NSString)fileID;
- (NSString)linkTarget;
- (NSString)relativePath;
- (NSString)stashedAssetPath;
- (NSString)stashedResourcePath;
- (NSString)subDomain;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)birth;
- (int)contentCompressionMethod;
- (int)contentEncodingMethod;
- (int)fileType;
- (int)groupID;
- (int)mode;
- (int)modified;
- (int)protectionClass;
- (int)statusChanged;
- (int)userID;
- (int64_t)inode;
- (int64_t)resourcesSize;
- (int64_t)size;
- (int64_t)sizeBeforeCopy;
- (int64_t)sizeBeforeEncoding;
- (int64_t)sourceDeviceInode;
- (unint64_t)hash;
- (unsigned)flags;
- (unsigned)volumeType;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAbsolutePath:(id)a3;
- (void)setAbsolutePathPrefix:(id)a3;
- (void)setBirth:(int)a3;
- (void)setContentCompressionMethod:(int)a3;
- (void)setContentEncodingMethod:(int)a3;
- (void)setDecodedAssetPath:(id)a3;
- (void)setDeleted:(BOOL)a3;
- (void)setDomainName:(id)a3;
- (void)setEncryptionKey:(id)a3;
- (void)setFileID:(id)a3;
- (void)setFileType:(int)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setGroupID:(int)a3;
- (void)setHasBirth:(BOOL)a3;
- (void)setHasContentCompressionMethod:(BOOL)a3;
- (void)setHasContentEncodingMethod:(BOOL)a3;
- (void)setHasDeleted:(BOOL)a3;
- (void)setHasFileType:(BOOL)a3;
- (void)setHasFlags:(BOOL)a3;
- (void)setHasGroupID:(BOOL)a3;
- (void)setHasInode:(BOOL)a3;
- (void)setHasIsMMCSEncryptedOnly:(BOOL)a3;
- (void)setHasMode:(BOOL)a3;
- (void)setHasModified:(BOOL)a3;
- (void)setHasProtectionClass:(BOOL)a3;
- (void)setHasResourcesSize:(BOOL)a3;
- (void)setHasSize:(BOOL)a3;
- (void)setHasSizeBeforeCopy:(BOOL)a3;
- (void)setHasSizeBeforeEncoding:(BOOL)a3;
- (void)setHasSourceDeviceInode:(BOOL)a3;
- (void)setHasStashedAssetIsDecrypted:(BOOL)a3;
- (void)setHasStatusChanged:(BOOL)a3;
- (void)setHasUserID:(BOOL)a3;
- (void)setHasVolumeType:(BOOL)a3;
- (void)setInode:(int64_t)a3;
- (void)setIsMMCSEncryptedOnly:(BOOL)a3;
- (void)setLinkTarget:(id)a3;
- (void)setMode:(int)a3;
- (void)setModified:(int)a3;
- (void)setProtectionClass:(int)a3;
- (void)setRelativePath:(id)a3;
- (void)setResourcesSize:(int64_t)a3;
- (void)setSha256Signature:(id)a3;
- (void)setSignature:(id)a3;
- (void)setSize:(int64_t)a3;
- (void)setSizeBeforeCopy:(int64_t)a3;
- (void)setSizeBeforeEncoding:(int64_t)a3;
- (void)setSourceDeviceInode:(int64_t)a3;
- (void)setStashedAssetIsDecrypted:(BOOL)a3;
- (void)setStashedAssetPath:(id)a3;
- (void)setStashedResourcePath:(id)a3;
- (void)setStatusChanged:(int)a3;
- (void)setSubDomain:(id)a3;
- (void)setUserID:(int)a3;
- (void)setVolumeType:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation MBCKFileArchive

- (BOOL)hasFileID
{
  return self->_fileID != 0;
}

- (BOOL)hasDomainName
{
  return self->_domainName != 0;
}

- (BOOL)hasRelativePath
{
  return self->_relativePath != 0;
}

- (BOOL)hasAbsolutePath
{
  return self->_absolutePath != 0;
}

- (BOOL)hasLinkTarget
{
  return self->_linkTarget != 0;
}

- (BOOL)hasSignature
{
  return self->_signature != 0;
}

- (void)setBirth:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_birth = a3;
}

- (void)setHasBirth:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($183A0CAA3ED77782483E069C87FEB68C)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasBirth
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setModified:(int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_modified = a3;
}

- (void)setHasModified:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($183A0CAA3ED77782483E069C87FEB68C)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasModified
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setStatusChanged:(int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_statusChanged = a3;
}

- (void)setHasStatusChanged:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($183A0CAA3ED77782483E069C87FEB68C)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasStatusChanged
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (BOOL)hasEncryptionKey
{
  return self->_encryptionKey != 0;
}

- (void)setProtectionClass:(int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_protectionClass = a3;
}

- (void)setHasProtectionClass:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($183A0CAA3ED77782483E069C87FEB68C)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasProtectionClass
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setSize:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_size = a3;
}

- (void)setHasSize:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($183A0CAA3ED77782483E069C87FEB68C)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasSize
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setFileType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_fileType = a3;
}

- (void)setHasFileType:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($183A0CAA3ED77782483E069C87FEB68C)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasFileType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setGroupID:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_groupID = a3;
}

- (void)setHasGroupID:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($183A0CAA3ED77782483E069C87FEB68C)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasGroupID
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setUserID:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_userID = a3;
}

- (void)setHasUserID:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($183A0CAA3ED77782483E069C87FEB68C)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasUserID
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setMode:(int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_mode = a3;
}

- (void)setHasMode:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($183A0CAA3ED77782483E069C87FEB68C)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasMode
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setDeleted:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_deleted = a3;
}

- (void)setHasDeleted:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($183A0CAA3ED77782483E069C87FEB68C)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasDeleted
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (BOOL)hasAbsolutePathPrefix
{
  return self->_absolutePathPrefix != 0;
}

- (void)setSizeBeforeCopy:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_sizeBeforeCopy = a3;
}

- (void)setHasSizeBeforeCopy:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($183A0CAA3ED77782483E069C87FEB68C)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasSizeBeforeCopy
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasSubDomain
{
  return self->_subDomain != 0;
}

- (BOOL)hasStashedAssetPath
{
  return self->_stashedAssetPath != 0;
}

- (BOOL)hasStashedResourcePath
{
  return self->_stashedResourcePath != 0;
}

- (void)setStashedAssetIsDecrypted:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_stashedAssetIsDecrypted = a3;
}

- (void)setHasStashedAssetIsDecrypted:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($183A0CAA3ED77782483E069C87FEB68C)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasStashedAssetIsDecrypted
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setResourcesSize:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_resourcesSize = a3;
}

- (void)setHasResourcesSize:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($183A0CAA3ED77782483E069C87FEB68C)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasResourcesSize
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setFlags:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_flags = a3;
}

- (void)setHasFlags:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($183A0CAA3ED77782483E069C87FEB68C)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasFlags
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setContentEncodingMethod:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_contentEncodingMethod = a3;
}

- (void)setHasContentEncodingMethod:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($183A0CAA3ED77782483E069C87FEB68C)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasContentEncodingMethod
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setContentCompressionMethod:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_contentCompressionMethod = a3;
}

- (void)setHasContentCompressionMethod:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($183A0CAA3ED77782483E069C87FEB68C)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasContentCompressionMethod
{
  return *(unsigned char *)&self->_has >> 7;
}

- (BOOL)hasDecodedAssetPath
{
  return self->_decodedAssetPath != 0;
}

- (void)setSizeBeforeEncoding:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_sizeBeforeEncoding = a3;
}

- (void)setHasSizeBeforeEncoding:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($183A0CAA3ED77782483E069C87FEB68C)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasSizeBeforeEncoding
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasSha256Signature
{
  return self->_sha256Signature != 0;
}

- (void)setIsMMCSEncryptedOnly:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_isMMCSEncryptedOnly = a3;
}

- (void)setHasIsMMCSEncryptedOnly:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($183A0CAA3ED77782483E069C87FEB68C)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasIsMMCSEncryptedOnly
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setInode:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_inode = a3;
}

- (void)setHasInode:(BOOL)a3
{
  self->_has = ($183A0CAA3ED77782483E069C87FEB68C)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasInode
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setSourceDeviceInode:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_sourceDeviceInode = a3;
}

- (void)setHasSourceDeviceInode:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($183A0CAA3ED77782483E069C87FEB68C)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasSourceDeviceInode
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setVolumeType:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_volumeType = a3;
}

- (void)setHasVolumeType:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($183A0CAA3ED77782483E069C87FEB68C)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasVolumeType
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)MBCKFileArchive;
  int v3 = [(MBCKFileArchive *)&v7 description];
  v4 = [(MBCKFileArchive *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  int v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  fileID = self->_fileID;
  if (fileID) {
    [v3 setObject:fileID forKey:@"fileID"];
  }
  domainName = self->_domainName;
  if (domainName) {
    [v4 setObject:domainName forKey:@"domainName"];
  }
  relativePath = self->_relativePath;
  if (relativePath) {
    [v4 setObject:relativePath forKey:@"relativePath"];
  }
  absolutePath = self->_absolutePath;
  if (absolutePath) {
    [v4 setObject:absolutePath forKey:@"absolutePath"];
  }
  linkTarget = self->_linkTarget;
  if (linkTarget) {
    [v4 setObject:linkTarget forKey:@"linkTarget"];
  }
  signature = self->_signature;
  if (signature) {
    [v4 setObject:signature forKey:@"signature"];
  }
  $183A0CAA3ED77782483E069C87FEB68C has = self->_has;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    v30 = +[NSNumber numberWithInt:self->_birth];
    [v4 setObject:v30 forKey:@"birth"];

    $183A0CAA3ED77782483E069C87FEB68C has = self->_has;
    if ((*(_WORD *)&has & 0x2000) == 0)
    {
LABEL_15:
      if ((*(_WORD *)&has & 0x8000) == 0) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }
  else if ((*(_WORD *)&has & 0x2000) == 0)
  {
    goto LABEL_15;
  }
  v31 = +[NSNumber numberWithInt:self->_modified];
  [v4 setObject:v31 forKey:@"modified"];

  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
  {
LABEL_16:
    v12 = +[NSNumber numberWithInt:self->_statusChanged];
    [v4 setObject:v12 forKey:@"statusChanged"];
  }
LABEL_17:
  encryptionKey = self->_encryptionKey;
  if (encryptionKey) {
    [v4 setObject:encryptionKey forKey:@"encryptionKey"];
  }
  $183A0CAA3ED77782483E069C87FEB68C v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x4000) != 0)
  {
    v32 = +[NSNumber numberWithInt:self->_protectionClass];
    [v4 setObject:v32 forKey:@"protectionClass"];

    $183A0CAA3ED77782483E069C87FEB68C v14 = self->_has;
    if ((*(unsigned char *)&v14 & 4) == 0)
    {
LABEL_21:
      if ((*(_WORD *)&v14 & 0x200) == 0) {
        goto LABEL_22;
      }
      goto LABEL_60;
    }
  }
  else if ((*(unsigned char *)&v14 & 4) == 0)
  {
    goto LABEL_21;
  }
  v33 = +[NSNumber numberWithLongLong:self->_size];
  [v4 setObject:v33 forKey:@"size"];

  $183A0CAA3ED77782483E069C87FEB68C v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x200) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v14 & 0x800) == 0) {
      goto LABEL_23;
    }
    goto LABEL_61;
  }
LABEL_60:
  v34 = +[NSNumber numberWithInt:self->_fileType];
  [v4 setObject:v34 forKey:@"fileType"];

  $183A0CAA3ED77782483E069C87FEB68C v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x800) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v14 & 0x10000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_62;
  }
LABEL_61:
  v35 = +[NSNumber numberWithInt:self->_groupID];
  [v4 setObject:v35 forKey:@"groupID"];

  $183A0CAA3ED77782483E069C87FEB68C v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x10000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v14 & 0x1000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_63;
  }
LABEL_62:
  v36 = +[NSNumber numberWithInt:self->_userID];
  [v4 setObject:v36 forKey:@"userID"];

  $183A0CAA3ED77782483E069C87FEB68C v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x1000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&v14 & 0x40000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
LABEL_63:
  v37 = +[NSNumber numberWithInt:self->_mode];
  [v4 setObject:v37 forKey:@"mode"];

  if ((*(_DWORD *)&self->_has & 0x40000) != 0)
  {
LABEL_26:
    v15 = +[NSNumber numberWithBool:self->_deleted];
    [v4 setObject:v15 forKey:@"deleted"];
  }
LABEL_27:
  absolutePathPrefix = self->_absolutePathPrefix;
  if (absolutePathPrefix) {
    [v4 setObject:absolutePathPrefix forKey:@"absolutePathPrefix"];
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v17 = +[NSNumber numberWithLongLong:self->_sizeBeforeCopy];
    [v4 setObject:v17 forKey:@"sizeBeforeCopy"];
  }
  subDomain = self->_subDomain;
  if (subDomain) {
    [v4 setObject:subDomain forKey:@"subDomain"];
  }
  stashedAssetPath = self->_stashedAssetPath;
  if (stashedAssetPath) {
    [v4 setObject:stashedAssetPath forKey:@"stashedAssetPath"];
  }
  stashedResourcePath = self->_stashedResourcePath;
  if (stashedResourcePath) {
    [v4 setObject:stashedResourcePath forKey:@"stashedResourcePath"];
  }
  $183A0CAA3ED77782483E069C87FEB68C v21 = self->_has;
  if ((*(_DWORD *)&v21 & 0x100000) != 0)
  {
    v38 = +[NSNumber numberWithBool:self->_stashedAssetIsDecrypted];
    [v4 setObject:v38 forKey:@"stashedAssetIsDecrypted"];

    $183A0CAA3ED77782483E069C87FEB68C v21 = self->_has;
    if ((*(unsigned char *)&v21 & 2) == 0)
    {
LABEL_39:
      if ((*(_WORD *)&v21 & 0x400) == 0) {
        goto LABEL_40;
      }
      goto LABEL_67;
    }
  }
  else if ((*(unsigned char *)&v21 & 2) == 0)
  {
    goto LABEL_39;
  }
  v39 = +[NSNumber numberWithLongLong:self->_resourcesSize];
  [v4 setObject:v39 forKey:@"resourcesSize"];

  $183A0CAA3ED77782483E069C87FEB68C v21 = self->_has;
  if ((*(_WORD *)&v21 & 0x400) == 0)
  {
LABEL_40:
    if ((*(_WORD *)&v21 & 0x100) == 0) {
      goto LABEL_41;
    }
    goto LABEL_68;
  }
LABEL_67:
  v40 = +[NSNumber numberWithUnsignedInt:self->_flags];
  [v4 setObject:v40 forKey:@"flags"];

  $183A0CAA3ED77782483E069C87FEB68C v21 = self->_has;
  if ((*(_WORD *)&v21 & 0x100) == 0)
  {
LABEL_41:
    if ((*(unsigned char *)&v21 & 0x80) == 0) {
      goto LABEL_43;
    }
    goto LABEL_42;
  }
LABEL_68:
  v41 = +[NSNumber numberWithInt:self->_contentEncodingMethod];
  [v4 setObject:v41 forKey:@"contentEncodingMethod"];

  if ((*(_DWORD *)&self->_has & 0x80) != 0)
  {
LABEL_42:
    v22 = +[NSNumber numberWithInt:self->_contentCompressionMethod];
    [v4 setObject:v22 forKey:@"contentCompressionMethod"];
  }
LABEL_43:
  decodedAssetPath = self->_decodedAssetPath;
  if (decodedAssetPath) {
    [v4 setObject:decodedAssetPath forKey:@"decodedAssetPath"];
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    v24 = +[NSNumber numberWithLongLong:self->_sizeBeforeEncoding];
    [v4 setObject:v24 forKey:@"sizeBeforeEncoding"];
  }
  sha256Signature = self->_sha256Signature;
  if (sha256Signature) {
    [v4 setObject:sha256Signature forKey:@"sha256Signature"];
  }
  $183A0CAA3ED77782483E069C87FEB68C v26 = self->_has;
  if ((*(_DWORD *)&v26 & 0x80000) != 0)
  {
    v42 = +[NSNumber numberWithBool:self->_isMMCSEncryptedOnly];
    [v4 setObject:v42 forKey:@"isMMCSEncryptedOnly"];

    $183A0CAA3ED77782483E069C87FEB68C v26 = self->_has;
    if ((*(unsigned char *)&v26 & 1) == 0)
    {
LABEL_51:
      if ((*(unsigned char *)&v26 & 0x20) == 0) {
        goto LABEL_52;
      }
LABEL_72:
      v44 = +[NSNumber numberWithLongLong:self->_sourceDeviceInode];
      [v4 setObject:v44 forKey:@"sourceDeviceInode"];

      if ((*(_DWORD *)&self->_has & 0x20000) == 0) {
        goto LABEL_54;
      }
      goto LABEL_53;
    }
  }
  else if ((*(unsigned char *)&v26 & 1) == 0)
  {
    goto LABEL_51;
  }
  v43 = +[NSNumber numberWithLongLong:self->_inode];
  [v4 setObject:v43 forKey:@"inode"];

  $183A0CAA3ED77782483E069C87FEB68C v26 = self->_has;
  if ((*(unsigned char *)&v26 & 0x20) != 0) {
    goto LABEL_72;
  }
LABEL_52:
  if ((*(_DWORD *)&v26 & 0x20000) != 0)
  {
LABEL_53:
    v27 = +[NSNumber numberWithUnsignedInt:self->_volumeType];
    [v4 setObject:v27 forKey:@"volumeType"];
  }
LABEL_54:
  id v28 = v4;

  return v28;
}

- (BOOL)readFrom:(id)a3
{
  while (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(void *)((char *)a3
                                                                              + OBJC_IVAR___PBDataReader__length))
  {
    if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v5 = 0;
    unsigned int v6 = 0;
    unint64_t v7 = 0;
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
        unint64_t v7 = 0;
        int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
    if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v7 = 0;
    }
LABEL_13:
    if (v11 || (v7 & 7) == 4) {
      break;
    }
    switch((v7 >> 3))
    {
      case 1u:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 112;
        goto LABEL_152;
      case 2u:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 96;
        goto LABEL_152;
      case 3u:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 160;
        goto LABEL_152;
      case 4u:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 56;
        goto LABEL_152;
      case 6u:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 136;
        goto LABEL_152;
      case 7u:
        uint64_t v13 = PBReaderReadData();
        uint64_t v14 = 176;
        goto LABEL_152;
      case 8u:
        char v16 = 0;
        unsigned int v17 = 0;
        uint64_t v18 = 0;
        *(_DWORD *)&self->_has |= 0x40u;
        while (2)
        {
          unint64_t v19 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v19 == -1 || v19 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v20 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v19);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v19 + 1;
            v18 |= (unint64_t)(v20 & 0x7F) << v16;
            if (v20 < 0)
            {
              v16 += 7;
              BOOL v10 = v17++ >= 9;
              if (v10)
              {
                LODWORD(v18) = 0;
                goto LABEL_184;
              }
              continue;
            }
          }
          break;
        }
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v18) = 0;
        }
LABEL_184:
        uint64_t v106 = 72;
        goto LABEL_267;
      case 9u:
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v18 = 0;
        *(_DWORD *)&self->_has |= 0x2000u;
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
            v18 |= (unint64_t)(v24 & 0x7F) << v21;
            if (v24 < 0)
            {
              v21 += 7;
              BOOL v10 = v22++ >= 9;
              if (v10)
              {
                LODWORD(v18) = 0;
                goto LABEL_188;
              }
              continue;
            }
          }
          break;
        }
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v18) = 0;
        }
LABEL_188:
        uint64_t v106 = 148;
        goto LABEL_267;
      case 0xAu:
        char v25 = 0;
        unsigned int v26 = 0;
        uint64_t v18 = 0;
        *(_DWORD *)&self->_has |= 0x8000u;
        while (2)
        {
          unint64_t v27 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v27 == -1 || v27 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v28 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v27);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v27 + 1;
            v18 |= (unint64_t)(v28 & 0x7F) << v25;
            if (v28 < 0)
            {
              v25 += 7;
              BOOL v10 = v26++ >= 9;
              if (v10)
              {
                LODWORD(v18) = 0;
                goto LABEL_192;
              }
              continue;
            }
          }
          break;
        }
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v18) = 0;
        }
LABEL_192:
        uint64_t v106 = 200;
        goto LABEL_267;
      case 0xBu:
        uint64_t v13 = PBReaderReadData();
        uint64_t v14 = 104;
        goto LABEL_152;
      case 0xCu:
        char v29 = 0;
        unsigned int v30 = 0;
        uint64_t v18 = 0;
        *(_DWORD *)&self->_has |= 0x4000u;
        while (2)
        {
          unint64_t v31 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v31 == -1 || v31 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v32 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v31);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v31 + 1;
            v18 |= (unint64_t)(v32 & 0x7F) << v29;
            if (v32 < 0)
            {
              v29 += 7;
              BOOL v10 = v30++ >= 9;
              if (v10)
              {
                LODWORD(v18) = 0;
                goto LABEL_196;
              }
              continue;
            }
          }
          break;
        }
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v18) = 0;
        }
LABEL_196:
        uint64_t v106 = 152;
        goto LABEL_267;
      case 0xDu:
        char v33 = 0;
        unsigned int v34 = 0;
        uint64_t v35 = 0;
        *(_DWORD *)&self->_has |= 4u;
        while (2)
        {
          unint64_t v36 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v36 == -1 || v36 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v37 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v36);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v36 + 1;
            v35 |= (unint64_t)(v37 & 0x7F) << v33;
            if (v37 < 0)
            {
              v33 += 7;
              BOOL v10 = v34++ >= 9;
              if (v10)
              {
                uint64_t v35 = 0;
                goto LABEL_200;
              }
              continue;
            }
          }
          break;
        }
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v35 = 0;
        }
LABEL_200:
        uint64_t v107 = 24;
        goto LABEL_262;
      case 0xEu:
        char v38 = 0;
        unsigned int v39 = 0;
        uint64_t v18 = 0;
        *(_DWORD *)&self->_has |= 0x200u;
        while (2)
        {
          unint64_t v40 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v40 == -1 || v40 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v41 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v40);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v40 + 1;
            v18 |= (unint64_t)(v41 & 0x7F) << v38;
            if (v41 < 0)
            {
              v38 += 7;
              BOOL v10 = v39++ >= 9;
              if (v10)
              {
                LODWORD(v18) = 0;
                goto LABEL_204;
              }
              continue;
            }
          }
          break;
        }
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v18) = 0;
        }
LABEL_204:
        uint64_t v106 = 120;
        goto LABEL_267;
      case 0xFu:
        char v42 = 0;
        unsigned int v43 = 0;
        uint64_t v18 = 0;
        *(_DWORD *)&self->_has |= 0x800u;
        while (2)
        {
          unint64_t v44 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v44 == -1 || v44 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v45 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v44);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v44 + 1;
            v18 |= (unint64_t)(v45 & 0x7F) << v42;
            if (v45 < 0)
            {
              v42 += 7;
              BOOL v10 = v43++ >= 9;
              if (v10)
              {
                LODWORD(v18) = 0;
                goto LABEL_208;
              }
              continue;
            }
          }
          break;
        }
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v18) = 0;
        }
LABEL_208:
        uint64_t v106 = 128;
        goto LABEL_267;
      case 0x10u:
        char v46 = 0;
        unsigned int v47 = 0;
        uint64_t v18 = 0;
        *(_DWORD *)&self->_has |= 0x10000u;
        while (2)
        {
          unint64_t v48 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v48 == -1 || v48 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v49 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v48);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v48 + 1;
            v18 |= (unint64_t)(v49 & 0x7F) << v46;
            if (v49 < 0)
            {
              v46 += 7;
              BOOL v10 = v47++ >= 9;
              if (v10)
              {
                LODWORD(v18) = 0;
                goto LABEL_212;
              }
              continue;
            }
          }
          break;
        }
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v18) = 0;
        }
LABEL_212:
        uint64_t v106 = 216;
        goto LABEL_267;
      case 0x11u:
        char v50 = 0;
        unsigned int v51 = 0;
        uint64_t v18 = 0;
        *(_DWORD *)&self->_has |= 0x1000u;
        while (2)
        {
          unint64_t v52 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v52 == -1 || v52 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v53 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v52);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v52 + 1;
            v18 |= (unint64_t)(v53 & 0x7F) << v50;
            if (v53 < 0)
            {
              v50 += 7;
              BOOL v10 = v51++ >= 9;
              if (v10)
              {
                LODWORD(v18) = 0;
                goto LABEL_216;
              }
              continue;
            }
          }
          break;
        }
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v18) = 0;
        }
LABEL_216:
        uint64_t v106 = 144;
        goto LABEL_267;
      case 0x12u:
        char v54 = 0;
        unsigned int v55 = 0;
        uint64_t v56 = 0;
        *(_DWORD *)&self->_has |= 0x40000u;
        while (2)
        {
          unint64_t v57 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v57 == -1 || v57 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v58 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v57);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v57 + 1;
            v56 |= (unint64_t)(v58 & 0x7F) << v54;
            if (v58 < 0)
            {
              v54 += 7;
              BOOL v10 = v55++ >= 9;
              if (v10)
              {
                uint64_t v56 = 0;
                goto LABEL_220;
              }
              continue;
            }
          }
          break;
        }
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v56 = 0;
        }
LABEL_220:
        BOOL v108 = v56 != 0;
        uint64_t v109 = 224;
        goto LABEL_253;
      case 0x13u:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 64;
        goto LABEL_152;
      case 0x14u:
        char v59 = 0;
        unsigned int v60 = 0;
        uint64_t v35 = 0;
        *(_DWORD *)&self->_has |= 8u;
        while (2)
        {
          unint64_t v61 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v61 == -1 || v61 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v62 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v61);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v61 + 1;
            v35 |= (unint64_t)(v62 & 0x7F) << v59;
            if (v62 < 0)
            {
              v59 += 7;
              BOOL v10 = v60++ >= 9;
              if (v10)
              {
                uint64_t v35 = 0;
                goto LABEL_224;
              }
              continue;
            }
          }
          break;
        }
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v35 = 0;
        }
LABEL_224:
        uint64_t v107 = 32;
        goto LABEL_262;
      case 0x15u:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 208;
        goto LABEL_152;
      case 0x16u:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 184;
        goto LABEL_152;
      case 0x17u:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 192;
        goto LABEL_152;
      case 0x18u:
        char v63 = 0;
        unsigned int v64 = 0;
        uint64_t v65 = 0;
        *(_DWORD *)&self->_has |= 0x100000u;
        while (2)
        {
          unint64_t v66 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v66 == -1 || v66 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v67 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v66);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v66 + 1;
            v65 |= (unint64_t)(v67 & 0x7F) << v63;
            if (v67 < 0)
            {
              v63 += 7;
              BOOL v10 = v64++ >= 9;
              if (v10)
              {
                uint64_t v65 = 0;
                goto LABEL_228;
              }
              continue;
            }
          }
          break;
        }
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v65 = 0;
        }
LABEL_228:
        BOOL v108 = v65 != 0;
        uint64_t v109 = 226;
        goto LABEL_253;
      case 0x19u:
        char v68 = 0;
        unsigned int v69 = 0;
        uint64_t v35 = 0;
        *(_DWORD *)&self->_has |= 2u;
        while (2)
        {
          unint64_t v70 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v70 == -1 || v70 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v71 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v70);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v70 + 1;
            v35 |= (unint64_t)(v71 & 0x7F) << v68;
            if (v71 < 0)
            {
              v68 += 7;
              BOOL v10 = v69++ >= 9;
              if (v10)
              {
                uint64_t v35 = 0;
                goto LABEL_232;
              }
              continue;
            }
          }
          break;
        }
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v35 = 0;
        }
LABEL_232:
        uint64_t v107 = 16;
        goto LABEL_262;
      case 0x1Au:
        char v72 = 0;
        unsigned int v73 = 0;
        uint64_t v18 = 0;
        *(_DWORD *)&self->_has |= 0x400u;
        while (2)
        {
          unint64_t v74 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v74 == -1 || v74 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v75 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v74);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v74 + 1;
            v18 |= (unint64_t)(v75 & 0x7F) << v72;
            if (v75 < 0)
            {
              v72 += 7;
              BOOL v10 = v73++ >= 9;
              if (v10)
              {
                LODWORD(v18) = 0;
                goto LABEL_236;
              }
              continue;
            }
          }
          break;
        }
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v18) = 0;
        }
LABEL_236:
        uint64_t v106 = 124;
        goto LABEL_267;
      case 0x1Bu:
        char v76 = 0;
        unsigned int v77 = 0;
        uint64_t v18 = 0;
        *(_DWORD *)&self->_has |= 0x100u;
        while (2)
        {
          unint64_t v78 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v78 == -1 || v78 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v79 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v78);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v78 + 1;
            v18 |= (unint64_t)(v79 & 0x7F) << v76;
            if (v79 < 0)
            {
              v76 += 7;
              BOOL v10 = v77++ >= 9;
              if (v10)
              {
                LODWORD(v18) = 0;
                goto LABEL_240;
              }
              continue;
            }
          }
          break;
        }
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v18) = 0;
        }
LABEL_240:
        uint64_t v106 = 80;
        goto LABEL_267;
      case 0x1Cu:
        char v80 = 0;
        unsigned int v81 = 0;
        uint64_t v18 = 0;
        *(_DWORD *)&self->_has |= 0x80u;
        while (2)
        {
          unint64_t v82 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v82 == -1 || v82 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v83 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v82);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v82 + 1;
            v18 |= (unint64_t)(v83 & 0x7F) << v80;
            if (v83 < 0)
            {
              v80 += 7;
              BOOL v10 = v81++ >= 9;
              if (v10)
              {
                LODWORD(v18) = 0;
                goto LABEL_244;
              }
              continue;
            }
          }
          break;
        }
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v18) = 0;
        }
LABEL_244:
        uint64_t v106 = 76;
        goto LABEL_267;
      case 0x1Du:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 88;
        goto LABEL_152;
      case 0x1Eu:
        char v84 = 0;
        unsigned int v85 = 0;
        uint64_t v35 = 0;
        *(_DWORD *)&self->_has |= 0x10u;
        while (2)
        {
          unint64_t v86 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v86 == -1 || v86 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v87 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v86);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v86 + 1;
            v35 |= (unint64_t)(v87 & 0x7F) << v84;
            if (v87 < 0)
            {
              v84 += 7;
              BOOL v10 = v85++ >= 9;
              if (v10)
              {
                uint64_t v35 = 0;
                goto LABEL_248;
              }
              continue;
            }
          }
          break;
        }
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v35 = 0;
        }
LABEL_248:
        uint64_t v107 = 40;
        goto LABEL_262;
      case 0x1Fu:
        uint64_t v13 = PBReaderReadData();
        uint64_t v14 = 168;
LABEL_152:
        v88 = *(void **)&self->PBCodable_opaque[v14];
        *(void *)&self->PBCodable_opaque[v14] = v13;

        continue;
      case 0x20u:
        char v89 = 0;
        unsigned int v90 = 0;
        uint64_t v91 = 0;
        *(_DWORD *)&self->_has |= 0x80000u;
        while (2)
        {
          unint64_t v92 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v92 == -1 || v92 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v93 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v92);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v92 + 1;
            v91 |= (unint64_t)(v93 & 0x7F) << v89;
            if (v93 < 0)
            {
              v89 += 7;
              BOOL v10 = v90++ >= 9;
              if (v10)
              {
                uint64_t v91 = 0;
                goto LABEL_252;
              }
              continue;
            }
          }
          break;
        }
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v91 = 0;
        }
LABEL_252:
        BOOL v108 = v91 != 0;
        uint64_t v109 = 225;
LABEL_253:
        self->PBCodable_opaque[v109] = v108;
        continue;
      case 0x21u:
        char v94 = 0;
        unsigned int v95 = 0;
        uint64_t v35 = 0;
        *(_DWORD *)&self->_has |= 1u;
        while (2)
        {
          unint64_t v96 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v96 == -1 || v96 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v97 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v96);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v96 + 1;
            v35 |= (unint64_t)(v97 & 0x7F) << v94;
            if (v97 < 0)
            {
              v94 += 7;
              BOOL v10 = v95++ >= 9;
              if (v10)
              {
                uint64_t v35 = 0;
                goto LABEL_257;
              }
              continue;
            }
          }
          break;
        }
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v35 = 0;
        }
LABEL_257:
        uint64_t v107 = 8;
        goto LABEL_262;
      case 0x22u:
        char v98 = 0;
        unsigned int v99 = 0;
        uint64_t v35 = 0;
        *(_DWORD *)&self->_has |= 0x20u;
        while (2)
        {
          unint64_t v100 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v100 == -1 || v100 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v101 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v100);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v100 + 1;
            v35 |= (unint64_t)(v101 & 0x7F) << v98;
            if (v101 < 0)
            {
              v98 += 7;
              BOOL v10 = v99++ >= 9;
              if (v10)
              {
                uint64_t v35 = 0;
                goto LABEL_261;
              }
              continue;
            }
          }
          break;
        }
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v35 = 0;
        }
LABEL_261:
        uint64_t v107 = 48;
LABEL_262:
        *(void *)&self->PBCodable_opaque[v107] = v35;
        continue;
      case 0x23u:
        char v102 = 0;
        unsigned int v103 = 0;
        uint64_t v18 = 0;
        *(_DWORD *)&self->_has |= 0x20000u;
        break;
      default:
        int v15 = PBReaderSkipValueWithTag();
        if (!v15) {
          return v15;
        }
        continue;
    }
    while (1)
    {
      unint64_t v104 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      if (v104 == -1 || v104 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v105 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v104);
      *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v104 + 1;
      v18 |= (unint64_t)(v105 & 0x7F) << v102;
      if ((v105 & 0x80) == 0) {
        goto LABEL_264;
      }
      v102 += 7;
      BOOL v10 = v103++ >= 9;
      if (v10)
      {
        LODWORD(v18) = 0;
        goto LABEL_266;
      }
    }
    *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_264:
    if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
      LODWORD(v18) = 0;
    }
LABEL_266:
    uint64_t v106 = 220;
LABEL_267:
    *(_DWORD *)&self->PBCodable_opaque[v106] = v18;
  }
  LOBYTE(v15) = *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v15;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (self->_fileID)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  if (self->_domainName)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  if (self->_relativePath)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  if (self->_absolutePath)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  if (self->_linkTarget)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  if (self->_signature)
  {
    PBDataWriterWriteDataField();
    id v4 = v9;
  }
  $183A0CAA3ED77782483E069C87FEB68C has = self->_has;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v9;
    $183A0CAA3ED77782483E069C87FEB68C has = self->_has;
    if ((*(_WORD *)&has & 0x2000) == 0)
    {
LABEL_15:
      if ((*(_WORD *)&has & 0x8000) == 0) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }
  else if ((*(_WORD *)&has & 0x2000) == 0)
  {
    goto LABEL_15;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v9;
  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
  {
LABEL_16:
    PBDataWriterWriteInt32Field();
    id v4 = v9;
  }
LABEL_17:
  if (self->_encryptionKey)
  {
    PBDataWriterWriteDataField();
    id v4 = v9;
  }
  $183A0CAA3ED77782483E069C87FEB68C v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x4000) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v9;
    $183A0CAA3ED77782483E069C87FEB68C v6 = self->_has;
    if ((*(unsigned char *)&v6 & 4) == 0)
    {
LABEL_21:
      if ((*(_WORD *)&v6 & 0x200) == 0) {
        goto LABEL_22;
      }
      goto LABEL_62;
    }
  }
  else if ((*(unsigned char *)&v6 & 4) == 0)
  {
    goto LABEL_21;
  }
  PBDataWriterWriteInt64Field();
  id v4 = v9;
  $183A0CAA3ED77782483E069C87FEB68C v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x200) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v6 & 0x800) == 0) {
      goto LABEL_23;
    }
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteInt32Field();
  id v4 = v9;
  $183A0CAA3ED77782483E069C87FEB68C v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x800) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v6 & 0x10000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteInt32Field();
  id v4 = v9;
  $183A0CAA3ED77782483E069C87FEB68C v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x10000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v6 & 0x1000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteInt32Field();
  id v4 = v9;
  $183A0CAA3ED77782483E069C87FEB68C v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x1000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&v6 & 0x40000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
LABEL_65:
  PBDataWriterWriteInt32Field();
  id v4 = v9;
  if ((*(_DWORD *)&self->_has & 0x40000) != 0)
  {
LABEL_26:
    PBDataWriterWriteBOOLField();
    id v4 = v9;
  }
LABEL_27:
  if (self->_absolutePathPrefix)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v9;
  }
  if (self->_subDomain)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  if (self->_stashedAssetPath)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  if (self->_stashedResourcePath)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  $183A0CAA3ED77782483E069C87FEB68C v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x100000) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v9;
    $183A0CAA3ED77782483E069C87FEB68C v7 = self->_has;
    if ((*(unsigned char *)&v7 & 2) == 0)
    {
LABEL_39:
      if ((*(_WORD *)&v7 & 0x400) == 0) {
        goto LABEL_40;
      }
      goto LABEL_69;
    }
  }
  else if ((*(unsigned char *)&v7 & 2) == 0)
  {
    goto LABEL_39;
  }
  PBDataWriterWriteInt64Field();
  id v4 = v9;
  $183A0CAA3ED77782483E069C87FEB68C v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x400) == 0)
  {
LABEL_40:
    if ((*(_WORD *)&v7 & 0x100) == 0) {
      goto LABEL_41;
    }
    goto LABEL_70;
  }
LABEL_69:
  PBDataWriterWriteUint32Field();
  id v4 = v9;
  $183A0CAA3ED77782483E069C87FEB68C v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x100) == 0)
  {
LABEL_41:
    if ((*(unsigned char *)&v7 & 0x80) == 0) {
      goto LABEL_43;
    }
    goto LABEL_42;
  }
LABEL_70:
  PBDataWriterWriteInt32Field();
  id v4 = v9;
  if ((*(_DWORD *)&self->_has & 0x80) != 0)
  {
LABEL_42:
    PBDataWriterWriteInt32Field();
    id v4 = v9;
  }
LABEL_43:
  if (self->_decodedAssetPath)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v9;
  }
  if (self->_sha256Signature)
  {
    PBDataWriterWriteDataField();
    id v4 = v9;
  }
  $183A0CAA3ED77782483E069C87FEB68C v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x80000) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v9;
    $183A0CAA3ED77782483E069C87FEB68C v8 = self->_has;
    if ((*(unsigned char *)&v8 & 1) == 0)
    {
LABEL_51:
      if ((*(unsigned char *)&v8 & 0x20) == 0) {
        goto LABEL_52;
      }
      goto LABEL_74;
    }
  }
  else if ((*(unsigned char *)&v8 & 1) == 0)
  {
    goto LABEL_51;
  }
  PBDataWriterWriteInt64Field();
  id v4 = v9;
  $183A0CAA3ED77782483E069C87FEB68C v8 = self->_has;
  if ((*(unsigned char *)&v8 & 0x20) == 0)
  {
LABEL_52:
    if ((*(_DWORD *)&v8 & 0x20000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_53;
  }
LABEL_74:
  PBDataWriterWriteInt64Field();
  id v4 = v9;
  if ((*(_DWORD *)&self->_has & 0x20000) != 0)
  {
LABEL_53:
    PBDataWriterWriteUint32Field();
    id v4 = v9;
  }
LABEL_54:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (self->_fileID)
  {
    objc_msgSend(v4, "setFileID:");
    id v4 = v9;
  }
  if (self->_domainName)
  {
    objc_msgSend(v9, "setDomainName:");
    id v4 = v9;
  }
  if (self->_relativePath)
  {
    objc_msgSend(v9, "setRelativePath:");
    id v4 = v9;
  }
  if (self->_absolutePath)
  {
    objc_msgSend(v9, "setAbsolutePath:");
    id v4 = v9;
  }
  if (self->_linkTarget)
  {
    objc_msgSend(v9, "setLinkTarget:");
    id v4 = v9;
  }
  if (self->_signature)
  {
    objc_msgSend(v9, "setSignature:");
    id v4 = v9;
  }
  $183A0CAA3ED77782483E069C87FEB68C has = self->_has;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    *((_DWORD *)v4 + 18) = self->_birth;
    *((_DWORD *)v4 + 57) |= 0x40u;
    $183A0CAA3ED77782483E069C87FEB68C has = self->_has;
    if ((*(_WORD *)&has & 0x2000) == 0)
    {
LABEL_15:
      if ((*(_WORD *)&has & 0x8000) == 0) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }
  else if ((*(_WORD *)&has & 0x2000) == 0)
  {
    goto LABEL_15;
  }
  *((_DWORD *)v4 + 37) = self->_modified;
  *((_DWORD *)v4 + 57) |= 0x2000u;
  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
  {
LABEL_16:
    *((_DWORD *)v4 + 50) = self->_statusChanged;
    *((_DWORD *)v4 + 57) |= 0x8000u;
  }
LABEL_17:
  if (self->_encryptionKey)
  {
    objc_msgSend(v9, "setEncryptionKey:");
    id v4 = v9;
  }
  $183A0CAA3ED77782483E069C87FEB68C v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x4000) != 0)
  {
    *((_DWORD *)v4 + 38) = self->_protectionClass;
    *((_DWORD *)v4 + 57) |= 0x4000u;
    $183A0CAA3ED77782483E069C87FEB68C v6 = self->_has;
    if ((*(unsigned char *)&v6 & 4) == 0)
    {
LABEL_21:
      if ((*(_WORD *)&v6 & 0x200) == 0) {
        goto LABEL_22;
      }
      goto LABEL_62;
    }
  }
  else if ((*(unsigned char *)&v6 & 4) == 0)
  {
    goto LABEL_21;
  }
  *((void *)v4 + 3) = self->_size;
  *((_DWORD *)v4 + 57) |= 4u;
  $183A0CAA3ED77782483E069C87FEB68C v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x200) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v6 & 0x800) == 0) {
      goto LABEL_23;
    }
    goto LABEL_63;
  }
LABEL_62:
  *((_DWORD *)v4 + 30) = self->_fileType;
  *((_DWORD *)v4 + 57) |= 0x200u;
  $183A0CAA3ED77782483E069C87FEB68C v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x800) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v6 & 0x10000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_64;
  }
LABEL_63:
  *((_DWORD *)v4 + 32) = self->_groupID;
  *((_DWORD *)v4 + 57) |= 0x800u;
  $183A0CAA3ED77782483E069C87FEB68C v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x10000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v6 & 0x1000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_65;
  }
LABEL_64:
  *((_DWORD *)v4 + 54) = self->_userID;
  *((_DWORD *)v4 + 57) |= 0x10000u;
  $183A0CAA3ED77782483E069C87FEB68C v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x1000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&v6 & 0x40000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
LABEL_65:
  *((_DWORD *)v4 + 36) = self->_mode;
  *((_DWORD *)v4 + 57) |= 0x1000u;
  if ((*(_DWORD *)&self->_has & 0x40000) != 0)
  {
LABEL_26:
    *((unsigned char *)v4 + 224) = self->_deleted;
    *((_DWORD *)v4 + 57) |= 0x40000u;
  }
LABEL_27:
  if (self->_absolutePathPrefix)
  {
    objc_msgSend(v9, "setAbsolutePathPrefix:");
    id v4 = v9;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *((void *)v4 + 4) = self->_sizeBeforeCopy;
    *((_DWORD *)v4 + 57) |= 8u;
  }
  if (self->_subDomain)
  {
    objc_msgSend(v9, "setSubDomain:");
    id v4 = v9;
  }
  if (self->_stashedAssetPath)
  {
    objc_msgSend(v9, "setStashedAssetPath:");
    id v4 = v9;
  }
  if (self->_stashedResourcePath)
  {
    objc_msgSend(v9, "setStashedResourcePath:");
    id v4 = v9;
  }
  $183A0CAA3ED77782483E069C87FEB68C v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x100000) != 0)
  {
    *((unsigned char *)v4 + 226) = self->_stashedAssetIsDecrypted;
    *((_DWORD *)v4 + 57) |= 0x100000u;
    $183A0CAA3ED77782483E069C87FEB68C v7 = self->_has;
    if ((*(unsigned char *)&v7 & 2) == 0)
    {
LABEL_39:
      if ((*(_WORD *)&v7 & 0x400) == 0) {
        goto LABEL_40;
      }
      goto LABEL_69;
    }
  }
  else if ((*(unsigned char *)&v7 & 2) == 0)
  {
    goto LABEL_39;
  }
  *((void *)v4 + 2) = self->_resourcesSize;
  *((_DWORD *)v4 + 57) |= 2u;
  $183A0CAA3ED77782483E069C87FEB68C v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x400) == 0)
  {
LABEL_40:
    if ((*(_WORD *)&v7 & 0x100) == 0) {
      goto LABEL_41;
    }
    goto LABEL_70;
  }
LABEL_69:
  *((_DWORD *)v4 + 31) = self->_flags;
  *((_DWORD *)v4 + 57) |= 0x400u;
  $183A0CAA3ED77782483E069C87FEB68C v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x100) == 0)
  {
LABEL_41:
    if ((*(unsigned char *)&v7 & 0x80) == 0) {
      goto LABEL_43;
    }
    goto LABEL_42;
  }
LABEL_70:
  *((_DWORD *)v4 + 20) = self->_contentEncodingMethod;
  *((_DWORD *)v4 + 57) |= 0x100u;
  if ((*(_DWORD *)&self->_has & 0x80) != 0)
  {
LABEL_42:
    *((_DWORD *)v4 + 19) = self->_contentCompressionMethod;
    *((_DWORD *)v4 + 57) |= 0x80u;
  }
LABEL_43:
  if (self->_decodedAssetPath)
  {
    objc_msgSend(v9, "setDecodedAssetPath:");
    id v4 = v9;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *((void *)v4 + 5) = self->_sizeBeforeEncoding;
    *((_DWORD *)v4 + 57) |= 0x10u;
  }
  if (self->_sha256Signature)
  {
    objc_msgSend(v9, "setSha256Signature:");
    id v4 = v9;
  }
  $183A0CAA3ED77782483E069C87FEB68C v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x80000) != 0)
  {
    *((unsigned char *)v4 + 225) = self->_isMMCSEncryptedOnly;
    *((_DWORD *)v4 + 57) |= 0x80000u;
    $183A0CAA3ED77782483E069C87FEB68C v8 = self->_has;
    if ((*(unsigned char *)&v8 & 1) == 0)
    {
LABEL_51:
      if ((*(unsigned char *)&v8 & 0x20) == 0) {
        goto LABEL_52;
      }
      goto LABEL_74;
    }
  }
  else if ((*(unsigned char *)&v8 & 1) == 0)
  {
    goto LABEL_51;
  }
  *((void *)v4 + 1) = self->_inode;
  *((_DWORD *)v4 + 57) |= 1u;
  $183A0CAA3ED77782483E069C87FEB68C v8 = self->_has;
  if ((*(unsigned char *)&v8 & 0x20) == 0)
  {
LABEL_52:
    if ((*(_DWORD *)&v8 & 0x20000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_53;
  }
LABEL_74:
  *((void *)v4 + 6) = self->_sourceDeviceInode;
  *((_DWORD *)v4 + 57) |= 0x20u;
  if ((*(_DWORD *)&self->_has & 0x20000) != 0)
  {
LABEL_53:
    *((_DWORD *)v4 + 55) = self->_volumeType;
    *((_DWORD *)v4 + 57) |= 0x20000u;
  }
LABEL_54:
}

- (id)copyWithZone:(_NSZone *)a3
{
  char v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_fileID copyWithZone:a3];
  $183A0CAA3ED77782483E069C87FEB68C v7 = (void *)v5[14];
  v5[14] = v6;

  id v8 = [(NSString *)self->_domainName copyWithZone:a3];
  id v9 = (void *)v5[12];
  v5[12] = v8;

  id v10 = [(NSString *)self->_relativePath copyWithZone:a3];
  int v11 = (void *)v5[20];
  v5[20] = v10;

  id v12 = [(NSString *)self->_absolutePath copyWithZone:a3];
  uint64_t v13 = (void *)v5[7];
  v5[7] = v12;

  id v14 = [(NSString *)self->_linkTarget copyWithZone:a3];
  int v15 = (void *)v5[17];
  v5[17] = v14;

  id v16 = [(NSData *)self->_signature copyWithZone:a3];
  unsigned int v17 = (void *)v5[22];
  v5[22] = v16;

  $183A0CAA3ED77782483E069C87FEB68C has = self->_has;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    *((_DWORD *)v5 + 18) = self->_birth;
    *((_DWORD *)v5 + 57) |= 0x40u;
    $183A0CAA3ED77782483E069C87FEB68C has = self->_has;
    if ((*(_WORD *)&has & 0x2000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x8000) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(_WORD *)&has & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 37) = self->_modified;
  *((_DWORD *)v5 + 57) |= 0x2000u;
  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
  {
LABEL_4:
    *((_DWORD *)v5 + 50) = self->_statusChanged;
    *((_DWORD *)v5 + 57) |= 0x8000u;
  }
LABEL_5:
  id v19 = [(NSData *)self->_encryptionKey copyWithZone:a3];
  char v20 = (void *)v5[13];
  v5[13] = v19;

  $183A0CAA3ED77782483E069C87FEB68C v21 = self->_has;
  if ((*(_WORD *)&v21 & 0x4000) != 0)
  {
    *((_DWORD *)v5 + 38) = self->_protectionClass;
    *((_DWORD *)v5 + 57) |= 0x4000u;
    $183A0CAA3ED77782483E069C87FEB68C v21 = self->_has;
    if ((*(unsigned char *)&v21 & 4) == 0)
    {
LABEL_7:
      if ((*(_WORD *)&v21 & 0x200) == 0) {
        goto LABEL_8;
      }
      goto LABEL_34;
    }
  }
  else if ((*(unsigned char *)&v21 & 4) == 0)
  {
    goto LABEL_7;
  }
  v5[3] = self->_size;
  *((_DWORD *)v5 + 57) |= 4u;
  $183A0CAA3ED77782483E069C87FEB68C v21 = self->_has;
  if ((*(_WORD *)&v21 & 0x200) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&v21 & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)v5 + 30) = self->_fileType;
  *((_DWORD *)v5 + 57) |= 0x200u;
  $183A0CAA3ED77782483E069C87FEB68C v21 = self->_has;
  if ((*(_WORD *)&v21 & 0x800) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&v21 & 0x10000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)v5 + 32) = self->_groupID;
  *((_DWORD *)v5 + 57) |= 0x800u;
  $183A0CAA3ED77782483E069C87FEB68C v21 = self->_has;
  if ((*(_DWORD *)&v21 & 0x10000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&v21 & 0x1000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)v5 + 54) = self->_userID;
  *((_DWORD *)v5 + 57) |= 0x10000u;
  $183A0CAA3ED77782483E069C87FEB68C v21 = self->_has;
  if ((*(_WORD *)&v21 & 0x1000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&v21 & 0x40000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_37:
  *((_DWORD *)v5 + 36) = self->_mode;
  *((_DWORD *)v5 + 57) |= 0x1000u;
  if ((*(_DWORD *)&self->_has & 0x40000) != 0)
  {
LABEL_12:
    *((unsigned char *)v5 + 224) = self->_deleted;
    *((_DWORD *)v5 + 57) |= 0x40000u;
  }
LABEL_13:
  id v22 = [(NSString *)self->_absolutePathPrefix copyWithZone:a3];
  unint64_t v23 = (void *)v5[8];
  v5[8] = v22;

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v5[4] = self->_sizeBeforeCopy;
    *((_DWORD *)v5 + 57) |= 8u;
  }
  id v24 = [(NSString *)self->_subDomain copyWithZone:a3];
  char v25 = (void *)v5[26];
  v5[26] = v24;

  id v26 = [(NSString *)self->_stashedAssetPath copyWithZone:a3];
  unint64_t v27 = (void *)v5[23];
  v5[23] = v26;

  id v28 = [(NSString *)self->_stashedResourcePath copyWithZone:a3];
  char v29 = (void *)v5[24];
  v5[24] = v28;

  $183A0CAA3ED77782483E069C87FEB68C v30 = self->_has;
  if ((*(_DWORD *)&v30 & 0x100000) != 0)
  {
    *((unsigned char *)v5 + 226) = self->_stashedAssetIsDecrypted;
    *((_DWORD *)v5 + 57) |= 0x100000u;
    $183A0CAA3ED77782483E069C87FEB68C v30 = self->_has;
    if ((*(unsigned char *)&v30 & 2) == 0)
    {
LABEL_17:
      if ((*(_WORD *)&v30 & 0x400) == 0) {
        goto LABEL_18;
      }
      goto LABEL_41;
    }
  }
  else if ((*(unsigned char *)&v30 & 2) == 0)
  {
    goto LABEL_17;
  }
  v5[2] = self->_resourcesSize;
  *((_DWORD *)v5 + 57) |= 2u;
  $183A0CAA3ED77782483E069C87FEB68C v30 = self->_has;
  if ((*(_WORD *)&v30 & 0x400) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v30 & 0x100) == 0) {
      goto LABEL_19;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)v5 + 31) = self->_flags;
  *((_DWORD *)v5 + 57) |= 0x400u;
  $183A0CAA3ED77782483E069C87FEB68C v30 = self->_has;
  if ((*(_WORD *)&v30 & 0x100) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&v30 & 0x80) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_42:
  *((_DWORD *)v5 + 20) = self->_contentEncodingMethod;
  *((_DWORD *)v5 + 57) |= 0x100u;
  if ((*(_DWORD *)&self->_has & 0x80) != 0)
  {
LABEL_20:
    *((_DWORD *)v5 + 19) = self->_contentCompressionMethod;
    *((_DWORD *)v5 + 57) |= 0x80u;
  }
LABEL_21:
  id v31 = [(NSString *)self->_decodedAssetPath copyWithZone:a3];
  char v32 = (void *)v5[11];
  v5[11] = v31;

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    v5[5] = self->_sizeBeforeEncoding;
    *((_DWORD *)v5 + 57) |= 0x10u;
  }
  id v33 = [(NSData *)self->_sha256Signature copyWithZone:a3];
  unsigned int v34 = (void *)v5[21];
  v5[21] = v33;

  $183A0CAA3ED77782483E069C87FEB68C v35 = self->_has;
  if ((*(_DWORD *)&v35 & 0x80000) != 0)
  {
    *((unsigned char *)v5 + 225) = self->_isMMCSEncryptedOnly;
    *((_DWORD *)v5 + 57) |= 0x80000u;
    $183A0CAA3ED77782483E069C87FEB68C v35 = self->_has;
    if ((*(unsigned char *)&v35 & 1) == 0)
    {
LABEL_25:
      if ((*(unsigned char *)&v35 & 0x20) == 0) {
        goto LABEL_26;
      }
LABEL_46:
      v5[6] = self->_sourceDeviceInode;
      *((_DWORD *)v5 + 57) |= 0x20u;
      if ((*(_DWORD *)&self->_has & 0x20000) == 0) {
        return v5;
      }
      goto LABEL_27;
    }
  }
  else if ((*(unsigned char *)&v35 & 1) == 0)
  {
    goto LABEL_25;
  }
  v5[1] = self->_inode;
  *((_DWORD *)v5 + 57) |= 1u;
  $183A0CAA3ED77782483E069C87FEB68C v35 = self->_has;
  if ((*(unsigned char *)&v35 & 0x20) != 0) {
    goto LABEL_46;
  }
LABEL_26:
  if ((*(_DWORD *)&v35 & 0x20000) != 0)
  {
LABEL_27:
    *((_DWORD *)v5 + 55) = self->_volumeType;
    *((_DWORD *)v5 + 57) |= 0x20000u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_146;
  }
  fileID = self->_fileID;
  if ((unint64_t)fileID | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](fileID, "isEqual:")) {
      goto LABEL_146;
    }
  }
  domainName = self->_domainName;
  if ((unint64_t)domainName | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](domainName, "isEqual:")) {
      goto LABEL_146;
    }
  }
  relativePath = self->_relativePath;
  if ((unint64_t)relativePath | *((void *)v4 + 20))
  {
    if (!-[NSString isEqual:](relativePath, "isEqual:")) {
      goto LABEL_146;
    }
  }
  absolutePath = self->_absolutePath;
  if ((unint64_t)absolutePath | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](absolutePath, "isEqual:")) {
      goto LABEL_146;
    }
  }
  linkTarget = self->_linkTarget;
  if ((unint64_t)linkTarget | *((void *)v4 + 17))
  {
    if (!-[NSString isEqual:](linkTarget, "isEqual:")) {
      goto LABEL_146;
    }
  }
  signature = self->_signature;
  if ((unint64_t)signature | *((void *)v4 + 22))
  {
    if (!-[NSData isEqual:](signature, "isEqual:")) {
      goto LABEL_146;
    }
  }
  $183A0CAA3ED77782483E069C87FEB68C has = self->_has;
  int v12 = *((_DWORD *)v4 + 57);
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v12 & 0x40) == 0 || self->_birth != *((_DWORD *)v4 + 18)) {
      goto LABEL_146;
    }
  }
  else if ((v12 & 0x40) != 0)
  {
    goto LABEL_146;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v12 & 0x2000) == 0 || self->_modified != *((_DWORD *)v4 + 37)) {
      goto LABEL_146;
    }
  }
  else if ((v12 & 0x2000) != 0)
  {
    goto LABEL_146;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v12 & 0x8000) == 0 || self->_statusChanged != *((_DWORD *)v4 + 50)) {
      goto LABEL_146;
    }
  }
  else if ((v12 & 0x8000) != 0)
  {
    goto LABEL_146;
  }
  encryptionKey = self->_encryptionKey;
  if ((unint64_t)encryptionKey | *((void *)v4 + 13))
  {
    if (!-[NSData isEqual:](encryptionKey, "isEqual:")) {
      goto LABEL_146;
    }
    $183A0CAA3ED77782483E069C87FEB68C has = self->_has;
    int v12 = *((_DWORD *)v4 + 57);
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v12 & 0x4000) == 0 || self->_protectionClass != *((_DWORD *)v4 + 38)) {
      goto LABEL_146;
    }
  }
  else if ((v12 & 0x4000) != 0)
  {
    goto LABEL_146;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v12 & 4) == 0 || self->_size != *((void *)v4 + 3)) {
      goto LABEL_146;
    }
  }
  else if ((v12 & 4) != 0)
  {
    goto LABEL_146;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v12 & 0x200) == 0 || self->_fileType != *((_DWORD *)v4 + 30)) {
      goto LABEL_146;
    }
  }
  else if ((v12 & 0x200) != 0)
  {
    goto LABEL_146;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v12 & 0x800) == 0 || self->_groupID != *((_DWORD *)v4 + 32)) {
      goto LABEL_146;
    }
  }
  else if ((v12 & 0x800) != 0)
  {
    goto LABEL_146;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v12 & 0x10000) == 0 || self->_userID != *((_DWORD *)v4 + 54)) {
      goto LABEL_146;
    }
  }
  else if ((v12 & 0x10000) != 0)
  {
    goto LABEL_146;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v12 & 0x1000) == 0 || self->_mode != *((_DWORD *)v4 + 36)) {
      goto LABEL_146;
    }
  }
  else if ((v12 & 0x1000) != 0)
  {
    goto LABEL_146;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v12 & 0x40000) == 0) {
      goto LABEL_146;
    }
    if (self->_deleted)
    {
      if (!*((unsigned char *)v4 + 224)) {
        goto LABEL_146;
      }
    }
    else if (*((unsigned char *)v4 + 224))
    {
      goto LABEL_146;
    }
  }
  else if ((v12 & 0x40000) != 0)
  {
    goto LABEL_146;
  }
  absolutePathPrefix = self->_absolutePathPrefix;
  if ((unint64_t)absolutePathPrefix | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](absolutePathPrefix, "isEqual:")) {
      goto LABEL_146;
    }
    $183A0CAA3ED77782483E069C87FEB68C has = self->_has;
    int v12 = *((_DWORD *)v4 + 57);
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v12 & 8) == 0 || self->_sizeBeforeCopy != *((void *)v4 + 4)) {
      goto LABEL_146;
    }
  }
  else if ((v12 & 8) != 0)
  {
    goto LABEL_146;
  }
  subDomain = self->_subDomain;
  if ((unint64_t)subDomain | *((void *)v4 + 26) && !-[NSString isEqual:](subDomain, "isEqual:")) {
    goto LABEL_146;
  }
  stashedAssetPath = self->_stashedAssetPath;
  if ((unint64_t)stashedAssetPath | *((void *)v4 + 23))
  {
    if (!-[NSString isEqual:](stashedAssetPath, "isEqual:")) {
      goto LABEL_146;
    }
  }
  stashedResourcePath = self->_stashedResourcePath;
  if ((unint64_t)stashedResourcePath | *((void *)v4 + 24))
  {
    if (!-[NSString isEqual:](stashedResourcePath, "isEqual:")) {
      goto LABEL_146;
    }
  }
  $183A0CAA3ED77782483E069C87FEB68C v18 = self->_has;
  int v19 = *((_DWORD *)v4 + 57);
  if ((*(_DWORD *)&v18 & 0x100000) != 0)
  {
    if ((v19 & 0x100000) == 0) {
      goto LABEL_146;
    }
    if (self->_stashedAssetIsDecrypted)
    {
      if (!*((unsigned char *)v4 + 226)) {
        goto LABEL_146;
      }
    }
    else if (*((unsigned char *)v4 + 226))
    {
      goto LABEL_146;
    }
  }
  else if ((v19 & 0x100000) != 0)
  {
    goto LABEL_146;
  }
  if ((*(unsigned char *)&v18 & 2) != 0)
  {
    if ((v19 & 2) == 0 || self->_resourcesSize != *((void *)v4 + 2)) {
      goto LABEL_146;
    }
  }
  else if ((v19 & 2) != 0)
  {
    goto LABEL_146;
  }
  if ((*(_WORD *)&v18 & 0x400) != 0)
  {
    if ((v19 & 0x400) == 0 || self->_flags != *((_DWORD *)v4 + 31)) {
      goto LABEL_146;
    }
  }
  else if ((v19 & 0x400) != 0)
  {
    goto LABEL_146;
  }
  if ((*(_WORD *)&v18 & 0x100) != 0)
  {
    if ((v19 & 0x100) == 0 || self->_contentEncodingMethod != *((_DWORD *)v4 + 20)) {
      goto LABEL_146;
    }
  }
  else if ((v19 & 0x100) != 0)
  {
    goto LABEL_146;
  }
  if ((*(unsigned char *)&v18 & 0x80) != 0)
  {
    if ((v19 & 0x80) == 0 || self->_contentCompressionMethod != *((_DWORD *)v4 + 19)) {
      goto LABEL_146;
    }
  }
  else if ((v19 & 0x80) != 0)
  {
    goto LABEL_146;
  }
  decodedAssetPath = self->_decodedAssetPath;
  if ((unint64_t)decodedAssetPath | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](decodedAssetPath, "isEqual:")) {
      goto LABEL_146;
    }
    $183A0CAA3ED77782483E069C87FEB68C v18 = self->_has;
    int v19 = *((_DWORD *)v4 + 57);
  }
  if ((*(unsigned char *)&v18 & 0x10) != 0)
  {
    if ((v19 & 0x10) == 0 || self->_sizeBeforeEncoding != *((void *)v4 + 5)) {
      goto LABEL_146;
    }
  }
  else if ((v19 & 0x10) != 0)
  {
    goto LABEL_146;
  }
  sha256Signature = self->_sha256Signature;
  if ((unint64_t)sha256Signature | *((void *)v4 + 21))
  {
    if (!-[NSData isEqual:](sha256Signature, "isEqual:")) {
      goto LABEL_146;
    }
    $183A0CAA3ED77782483E069C87FEB68C v18 = self->_has;
    int v19 = *((_DWORD *)v4 + 57);
  }
  if ((*(_DWORD *)&v18 & 0x80000) != 0)
  {
    if ((v19 & 0x80000) != 0)
    {
      if (self->_isMMCSEncryptedOnly)
      {
        if (!*((unsigned char *)v4 + 225)) {
          goto LABEL_146;
        }
        goto LABEL_131;
      }
      if (!*((unsigned char *)v4 + 225)) {
        goto LABEL_131;
      }
    }
LABEL_146:
    BOOL v22 = 0;
    goto LABEL_147;
  }
  if ((v19 & 0x80000) != 0) {
    goto LABEL_146;
  }
LABEL_131:
  if (*(unsigned char *)&v18)
  {
    if ((v19 & 1) == 0 || self->_inode != *((void *)v4 + 1)) {
      goto LABEL_146;
    }
  }
  else if (v19)
  {
    goto LABEL_146;
  }
  if ((*(unsigned char *)&v18 & 0x20) != 0)
  {
    if ((v19 & 0x20) == 0 || self->_sourceDeviceInode != *((void *)v4 + 6)) {
      goto LABEL_146;
    }
  }
  else if ((v19 & 0x20) != 0)
  {
    goto LABEL_146;
  }
  if ((*(_DWORD *)&v18 & 0x20000) != 0)
  {
    if ((v19 & 0x20000) == 0 || self->_volumeType != *((_DWORD *)v4 + 55)) {
      goto LABEL_146;
    }
    BOOL v22 = 1;
  }
  else
  {
    BOOL v22 = (v19 & 0x20000) == 0;
  }
LABEL_147:

  return v22;
}

- (unint64_t)hash
{
  NSUInteger v41 = [(NSString *)self->_fileID hash];
  NSUInteger v40 = [(NSString *)self->_domainName hash];
  NSUInteger v39 = [(NSString *)self->_relativePath hash];
  NSUInteger v38 = [(NSString *)self->_absolutePath hash];
  NSUInteger v37 = [(NSString *)self->_linkTarget hash];
  unint64_t v36 = (unint64_t)[(NSData *)self->_signature hash];
  $183A0CAA3ED77782483E069C87FEB68C has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
    uint64_t v35 = 0;
    if ((*(_WORD *)&has & 0x2000) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v34 = 0;
    if ((*(_WORD *)&has & 0x8000) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v35 = 2654435761 * self->_birth;
  if ((*(_WORD *)&has & 0x2000) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v34 = 2654435761 * self->_modified;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_4:
    uint64_t v33 = 2654435761 * self->_statusChanged;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v33 = 0;
LABEL_8:
  unint64_t v32 = (unint64_t)[(NSData *)self->_encryptionKey hash];
  $183A0CAA3ED77782483E069C87FEB68C v4 = self->_has;
  if ((*(_WORD *)&v4 & 0x4000) != 0)
  {
    uint64_t v31 = 2654435761 * self->_protectionClass;
    if ((*(unsigned char *)&v4 & 4) != 0)
    {
LABEL_10:
      uint64_t v30 = 2654435761 * self->_size;
      if ((*(_WORD *)&v4 & 0x200) != 0) {
        goto LABEL_11;
      }
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v31 = 0;
    if ((*(unsigned char *)&v4 & 4) != 0) {
      goto LABEL_10;
    }
  }
  uint64_t v30 = 0;
  if ((*(_WORD *)&v4 & 0x200) != 0)
  {
LABEL_11:
    uint64_t v29 = 2654435761 * self->_fileType;
    if ((*(_WORD *)&v4 & 0x800) != 0) {
      goto LABEL_12;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v29 = 0;
  if ((*(_WORD *)&v4 & 0x800) != 0)
  {
LABEL_12:
    uint64_t v28 = 2654435761 * self->_groupID;
    if ((*(_DWORD *)&v4 & 0x10000) != 0) {
      goto LABEL_13;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v28 = 0;
  if ((*(_DWORD *)&v4 & 0x10000) != 0)
  {
LABEL_13:
    uint64_t v27 = 2654435761 * self->_userID;
    if ((*(_WORD *)&v4 & 0x1000) != 0) {
      goto LABEL_14;
    }
LABEL_21:
    uint64_t v26 = 0;
    if ((*(_DWORD *)&v4 & 0x40000) != 0) {
      goto LABEL_15;
    }
    goto LABEL_22;
  }
LABEL_20:
  uint64_t v27 = 0;
  if ((*(_WORD *)&v4 & 0x1000) == 0) {
    goto LABEL_21;
  }
LABEL_14:
  uint64_t v26 = 2654435761 * self->_mode;
  if ((*(_DWORD *)&v4 & 0x40000) != 0)
  {
LABEL_15:
    uint64_t v25 = 2654435761 * self->_deleted;
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v25 = 0;
LABEL_23:
  NSUInteger v24 = [(NSString *)self->_absolutePathPrefix hash];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v23 = 2654435761 * self->_sizeBeforeCopy;
  }
  else {
    uint64_t v23 = 0;
  }
  NSUInteger v22 = [(NSString *)self->_subDomain hash];
  NSUInteger v21 = [(NSString *)self->_stashedAssetPath hash];
  NSUInteger v20 = [(NSString *)self->_stashedResourcePath hash];
  $183A0CAA3ED77782483E069C87FEB68C v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x100000) != 0)
  {
    uint64_t v6 = 2654435761 * self->_stashedAssetIsDecrypted;
    if ((*(unsigned char *)&v5 & 2) != 0)
    {
LABEL_28:
      uint64_t v7 = 2654435761 * self->_resourcesSize;
      if ((*(_WORD *)&v5 & 0x400) != 0) {
        goto LABEL_29;
      }
      goto LABEL_34;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if ((*(unsigned char *)&v5 & 2) != 0) {
      goto LABEL_28;
    }
  }
  uint64_t v7 = 0;
  if ((*(_WORD *)&v5 & 0x400) != 0)
  {
LABEL_29:
    uint64_t v8 = 2654435761 * self->_flags;
    if ((*(_WORD *)&v5 & 0x100) != 0) {
      goto LABEL_30;
    }
LABEL_35:
    uint64_t v9 = 0;
    if ((*(unsigned char *)&v5 & 0x80) != 0) {
      goto LABEL_31;
    }
    goto LABEL_36;
  }
LABEL_34:
  uint64_t v8 = 0;
  if ((*(_WORD *)&v5 & 0x100) == 0) {
    goto LABEL_35;
  }
LABEL_30:
  uint64_t v9 = 2654435761 * self->_contentEncodingMethod;
  if ((*(unsigned char *)&v5 & 0x80) != 0)
  {
LABEL_31:
    uint64_t v10 = 2654435761 * self->_contentCompressionMethod;
    goto LABEL_37;
  }
LABEL_36:
  uint64_t v10 = 0;
LABEL_37:
  NSUInteger v11 = [(NSString *)self->_decodedAssetPath hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v12 = 2654435761 * self->_sizeBeforeEncoding;
  }
  else {
    uint64_t v12 = 0;
  }
  unint64_t v13 = (unint64_t)[(NSData *)self->_sha256Signature hash];
  $183A0CAA3ED77782483E069C87FEB68C v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x80000) != 0)
  {
    uint64_t v15 = 2654435761 * self->_isMMCSEncryptedOnly;
    if (*(unsigned char *)&v14)
    {
LABEL_42:
      uint64_t v16 = 2654435761 * self->_inode;
      if ((*(unsigned char *)&v14 & 0x20) != 0) {
        goto LABEL_43;
      }
LABEL_47:
      uint64_t v17 = 0;
      if ((*(_DWORD *)&v14 & 0x20000) != 0) {
        goto LABEL_44;
      }
LABEL_48:
      uint64_t v18 = 0;
      return v40 ^ v41 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v15 ^ v16 ^ v17 ^ v18;
    }
  }
  else
  {
    uint64_t v15 = 0;
    if (*(unsigned char *)&v14) {
      goto LABEL_42;
    }
  }
  uint64_t v16 = 0;
  if ((*(unsigned char *)&v14 & 0x20) == 0) {
    goto LABEL_47;
  }
LABEL_43:
  uint64_t v17 = 2654435761 * self->_sourceDeviceInode;
  if ((*(_DWORD *)&v14 & 0x20000) == 0) {
    goto LABEL_48;
  }
LABEL_44:
  uint64_t v18 = 2654435761 * self->_volumeType;
  return v40 ^ v41 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v15 ^ v16 ^ v17 ^ v18;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (*((void *)v4 + 14))
  {
    -[MBCKFileArchive setFileID:](self, "setFileID:");
    id v4 = v9;
  }
  if (*((void *)v4 + 12))
  {
    -[MBCKFileArchive setDomainName:](self, "setDomainName:");
    id v4 = v9;
  }
  if (*((void *)v4 + 20))
  {
    -[MBCKFileArchive setRelativePath:](self, "setRelativePath:");
    id v4 = v9;
  }
  if (*((void *)v4 + 7))
  {
    -[MBCKFileArchive setAbsolutePath:](self, "setAbsolutePath:");
    id v4 = v9;
  }
  if (*((void *)v4 + 17))
  {
    -[MBCKFileArchive setLinkTarget:](self, "setLinkTarget:");
    id v4 = v9;
  }
  if (*((void *)v4 + 22))
  {
    -[MBCKFileArchive setSignature:](self, "setSignature:");
    id v4 = v9;
  }
  int v5 = *((_DWORD *)v4 + 57);
  if ((v5 & 0x40) != 0)
  {
    self->_birth = *((_DWORD *)v4 + 18);
    *(_DWORD *)&self->_has |= 0x40u;
    int v5 = *((_DWORD *)v4 + 57);
    if ((v5 & 0x2000) == 0)
    {
LABEL_15:
      if ((v5 & 0x8000) == 0) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }
  else if ((v5 & 0x2000) == 0)
  {
    goto LABEL_15;
  }
  self->_modified = *((_DWORD *)v4 + 37);
  *(_DWORD *)&self->_has |= 0x2000u;
  if ((*((_DWORD *)v4 + 57) & 0x8000) != 0)
  {
LABEL_16:
    self->_statusChanged = *((_DWORD *)v4 + 50);
    *(_DWORD *)&self->_has |= 0x8000u;
  }
LABEL_17:
  if (*((void *)v4 + 13))
  {
    -[MBCKFileArchive setEncryptionKey:](self, "setEncryptionKey:");
    id v4 = v9;
  }
  int v6 = *((_DWORD *)v4 + 57);
  if ((v6 & 0x4000) != 0)
  {
    self->_protectionClass = *((_DWORD *)v4 + 38);
    *(_DWORD *)&self->_has |= 0x4000u;
    int v6 = *((_DWORD *)v4 + 57);
    if ((v6 & 4) == 0)
    {
LABEL_21:
      if ((v6 & 0x200) == 0) {
        goto LABEL_22;
      }
      goto LABEL_62;
    }
  }
  else if ((v6 & 4) == 0)
  {
    goto LABEL_21;
  }
  self->_size = *((void *)v4 + 3);
  *(_DWORD *)&self->_has |= 4u;
  int v6 = *((_DWORD *)v4 + 57);
  if ((v6 & 0x200) == 0)
  {
LABEL_22:
    if ((v6 & 0x800) == 0) {
      goto LABEL_23;
    }
    goto LABEL_63;
  }
LABEL_62:
  self->_fileType = *((_DWORD *)v4 + 30);
  *(_DWORD *)&self->_has |= 0x200u;
  int v6 = *((_DWORD *)v4 + 57);
  if ((v6 & 0x800) == 0)
  {
LABEL_23:
    if ((v6 & 0x10000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_64;
  }
LABEL_63:
  self->_groupID = *((_DWORD *)v4 + 32);
  *(_DWORD *)&self->_has |= 0x800u;
  int v6 = *((_DWORD *)v4 + 57);
  if ((v6 & 0x10000) == 0)
  {
LABEL_24:
    if ((v6 & 0x1000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_65;
  }
LABEL_64:
  self->_userID = *((_DWORD *)v4 + 54);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v6 = *((_DWORD *)v4 + 57);
  if ((v6 & 0x1000) == 0)
  {
LABEL_25:
    if ((v6 & 0x40000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
LABEL_65:
  self->_mode = *((_DWORD *)v4 + 36);
  *(_DWORD *)&self->_has |= 0x1000u;
  if ((*((_DWORD *)v4 + 57) & 0x40000) != 0)
  {
LABEL_26:
    self->_deleted = *((unsigned char *)v4 + 224);
    *(_DWORD *)&self->_has |= 0x40000u;
  }
LABEL_27:
  if (*((void *)v4 + 8))
  {
    -[MBCKFileArchive setAbsolutePathPrefix:](self, "setAbsolutePathPrefix:");
    id v4 = v9;
  }
  if ((*((unsigned char *)v4 + 228) & 8) != 0)
  {
    self->_sizeBeforeCopy = *((void *)v4 + 4);
    *(_DWORD *)&self->_has |= 8u;
  }
  if (*((void *)v4 + 26))
  {
    -[MBCKFileArchive setSubDomain:](self, "setSubDomain:");
    id v4 = v9;
  }
  if (*((void *)v4 + 23))
  {
    -[MBCKFileArchive setStashedAssetPath:](self, "setStashedAssetPath:");
    id v4 = v9;
  }
  if (*((void *)v4 + 24))
  {
    -[MBCKFileArchive setStashedResourcePath:](self, "setStashedResourcePath:");
    id v4 = v9;
  }
  int v7 = *((_DWORD *)v4 + 57);
  if ((v7 & 0x100000) != 0)
  {
    self->_stashedAssetIsDecrypted = *((unsigned char *)v4 + 226);
    *(_DWORD *)&self->_has |= 0x100000u;
    int v7 = *((_DWORD *)v4 + 57);
    if ((v7 & 2) == 0)
    {
LABEL_39:
      if ((v7 & 0x400) == 0) {
        goto LABEL_40;
      }
      goto LABEL_69;
    }
  }
  else if ((v7 & 2) == 0)
  {
    goto LABEL_39;
  }
  self->_resourcesSize = *((void *)v4 + 2);
  *(_DWORD *)&self->_has |= 2u;
  int v7 = *((_DWORD *)v4 + 57);
  if ((v7 & 0x400) == 0)
  {
LABEL_40:
    if ((v7 & 0x100) == 0) {
      goto LABEL_41;
    }
    goto LABEL_70;
  }
LABEL_69:
  self->_flags = *((_DWORD *)v4 + 31);
  *(_DWORD *)&self->_has |= 0x400u;
  int v7 = *((_DWORD *)v4 + 57);
  if ((v7 & 0x100) == 0)
  {
LABEL_41:
    if ((v7 & 0x80) == 0) {
      goto LABEL_43;
    }
    goto LABEL_42;
  }
LABEL_70:
  self->_contentEncodingMethod = *((_DWORD *)v4 + 20);
  *(_DWORD *)&self->_has |= 0x100u;
  if ((*((_DWORD *)v4 + 57) & 0x80) != 0)
  {
LABEL_42:
    self->_contentCompressionMethod = *((_DWORD *)v4 + 19);
    *(_DWORD *)&self->_has |= 0x80u;
  }
LABEL_43:
  if (*((void *)v4 + 11))
  {
    -[MBCKFileArchive setDecodedAssetPath:](self, "setDecodedAssetPath:");
    id v4 = v9;
  }
  if ((*((unsigned char *)v4 + 228) & 0x10) != 0)
  {
    self->_sizeBeforeEncoding = *((void *)v4 + 5);
    *(_DWORD *)&self->_has |= 0x10u;
  }
  if (*((void *)v4 + 21))
  {
    -[MBCKFileArchive setSha256Signature:](self, "setSha256Signature:");
    id v4 = v9;
  }
  int v8 = *((_DWORD *)v4 + 57);
  if ((v8 & 0x80000) != 0)
  {
    self->_isMMCSEncryptedOnly = *((unsigned char *)v4 + 225);
    *(_DWORD *)&self->_has |= 0x80000u;
    int v8 = *((_DWORD *)v4 + 57);
    if ((v8 & 1) == 0)
    {
LABEL_51:
      if ((v8 & 0x20) == 0) {
        goto LABEL_52;
      }
      goto LABEL_74;
    }
  }
  else if ((v8 & 1) == 0)
  {
    goto LABEL_51;
  }
  self->_inode = *((void *)v4 + 1);
  *(_DWORD *)&self->_has |= 1u;
  int v8 = *((_DWORD *)v4 + 57);
  if ((v8 & 0x20) == 0)
  {
LABEL_52:
    if ((v8 & 0x20000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_53;
  }
LABEL_74:
  self->_sourceDeviceInode = *((void *)v4 + 6);
  *(_DWORD *)&self->_has |= 0x20u;
  if ((*((_DWORD *)v4 + 57) & 0x20000) != 0)
  {
LABEL_53:
    self->_volumeType = *((_DWORD *)v4 + 55);
    *(_DWORD *)&self->_has |= 0x20000u;
  }
LABEL_54:
}

- (NSString)fileID
{
  return self->_fileID;
}

- (void)setFileID:(id)a3
{
}

- (NSString)domainName
{
  return self->_domainName;
}

- (void)setDomainName:(id)a3
{
}

- (NSString)relativePath
{
  return self->_relativePath;
}

- (void)setRelativePath:(id)a3
{
}

- (NSString)absolutePath
{
  return self->_absolutePath;
}

- (void)setAbsolutePath:(id)a3
{
}

- (NSString)linkTarget
{
  return self->_linkTarget;
}

- (void)setLinkTarget:(id)a3
{
}

- (NSData)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
}

- (int)birth
{
  return self->_birth;
}

- (int)modified
{
  return self->_modified;
}

- (int)statusChanged
{
  return self->_statusChanged;
}

- (NSData)encryptionKey
{
  return self->_encryptionKey;
}

- (void)setEncryptionKey:(id)a3
{
}

- (int)protectionClass
{
  return self->_protectionClass;
}

- (int64_t)size
{
  return self->_size;
}

- (int)fileType
{
  return self->_fileType;
}

- (int)groupID
{
  return self->_groupID;
}

- (int)userID
{
  return self->_userID;
}

- (int)mode
{
  return self->_mode;
}

- (BOOL)deleted
{
  return self->_deleted;
}

- (NSString)absolutePathPrefix
{
  return self->_absolutePathPrefix;
}

- (void)setAbsolutePathPrefix:(id)a3
{
}

- (int64_t)sizeBeforeCopy
{
  return self->_sizeBeforeCopy;
}

- (NSString)subDomain
{
  return self->_subDomain;
}

- (void)setSubDomain:(id)a3
{
}

- (NSString)stashedAssetPath
{
  return self->_stashedAssetPath;
}

- (void)setStashedAssetPath:(id)a3
{
}

- (NSString)stashedResourcePath
{
  return self->_stashedResourcePath;
}

- (void)setStashedResourcePath:(id)a3
{
}

- (BOOL)stashedAssetIsDecrypted
{
  return self->_stashedAssetIsDecrypted;
}

- (int64_t)resourcesSize
{
  return self->_resourcesSize;
}

- (unsigned)flags
{
  return self->_flags;
}

- (int)contentEncodingMethod
{
  return self->_contentEncodingMethod;
}

- (int)contentCompressionMethod
{
  return self->_contentCompressionMethod;
}

- (NSString)decodedAssetPath
{
  return self->_decodedAssetPath;
}

- (void)setDecodedAssetPath:(id)a3
{
}

- (int64_t)sizeBeforeEncoding
{
  return self->_sizeBeforeEncoding;
}

- (NSData)sha256Signature
{
  return self->_sha256Signature;
}

- (void)setSha256Signature:(id)a3
{
}

- (BOOL)isMMCSEncryptedOnly
{
  return self->_isMMCSEncryptedOnly;
}

- (int64_t)inode
{
  return self->_inode;
}

- (int64_t)sourceDeviceInode
{
  return self->_sourceDeviceInode;
}

- (unsigned)volumeType
{
  return self->_volumeType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subDomain, 0);
  objc_storeStrong((id *)&self->_stashedResourcePath, 0);
  objc_storeStrong((id *)&self->_stashedAssetPath, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_sha256Signature, 0);
  objc_storeStrong((id *)&self->_relativePath, 0);
  objc_storeStrong((id *)&self->_linkTarget, 0);
  objc_storeStrong((id *)&self->_fileID, 0);
  objc_storeStrong((id *)&self->_encryptionKey, 0);
  objc_storeStrong((id *)&self->_domainName, 0);
  objc_storeStrong((id *)&self->_decodedAssetPath, 0);
  objc_storeStrong((id *)&self->_absolutePathPrefix, 0);
  objc_storeStrong((id *)&self->_absolutePath, 0);
}

@end