@interface NFACTag
+ (BOOL)supportsSecureCoding;
- (BOOL)applicationDataCoding;
- (BOOL)isSilent;
- (NFACTag)initWithCoder:(id)a3;
- (NFACTag)initWithInternalTag:(id)a3;
- (NSData)UID;
- (NSData)tagID;
- (NSString)description;
- (id)IDm;
- (id)PMm;
- (id)SystemCode;
- (id)allSystemCodes;
- (id)applicationData;
- (id)asDictionary;
- (id)atqa;
- (id)historicalBytes;
- (id)pupi;
- (id)sak;
- (id)selectedAID;
- (unint64_t)ndefContainerSize;
- (unint64_t)ndefMessageSize;
- (unsigned)ndefAvailability;
- (unsigned)silentType;
- (unsigned)technology;
- (unsigned)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NFACTag

- (id)atqa
{
  return self->_atqa;
}

- (id)sak
{
  return self->_sak;
}

- (id)historicalBytes
{
  return self->_historicalBytes;
}

- (id)selectedAID
{
  return self->_appData;
}

- (id)pupi
{
  return -[NSData subdataWithRange:](self->_tagID, "subdataWithRange:", 0, 4);
}

- (id)applicationData
{
  return -[NSData subdataWithRange:](self->_tagID, "subdataWithRange:", 4, 4);
}

- (unsigned)technology
{
  return self->_technology;
}

- (BOOL)applicationDataCoding
{
  return (*(unsigned char *)([(NSData *)self->_tagID bytes] + 10) & 0xC) == 4;
}

- (BOOL)isSilent
{
  return self->_silentType != 0;
}

- (unsigned)silentType
{
  return self->_silentType;
}

- (id)IDm
{
  return self->_tagID;
}

- (id)PMm
{
  return self->_pmm;
}

- (id)SystemCode
{
  return self->_appData;
}

- (id)allSystemCodes
{
  return self->_allSystemCodes;
}

- (unsigned)type
{
  return self->_type;
}

- (NSData)UID
{
  return self->_uid;
}

- (NSData)tagID
{
  return self->_tagID;
}

- (unsigned)ndefAvailability
{
  return self->_ndefAvailability;
}

- (unint64_t)ndefMessageSize
{
  return self->_ndefMessageSize;
}

- (unint64_t)ndefContainerSize
{
  return self->_ndefContainerSize;
}

- (NFACTag)initWithInternalTag:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)NFACTag;
  v5 = [(NFACTag *)&v22 init];
  if (!v5) {
    goto LABEL_14;
  }
  v5->_type = [v4 type];
  uint64_t v6 = [v4 tagID];
  tagID = v5->_tagID;
  v5->_tagID = (NSData *)v6;

  uint64_t v8 = [v4 UID];
  uid = v5->_uid;
  v5->_uid = (NSData *)v8;

  v5->_ndefAvailability = [v4 ndefAvailability];
  v5->_ndefMessageSize = [v4 ndefMessageSize];
  v5->_ndefContainerSize = [v4 ndefContainerSize];
  uint64_t v10 = [v4 atqa];
  atqa = v5->_atqa;
  v5->_atqa = (NSData *)v10;

  uint64_t v12 = [v4 sak];
  sak = v5->_sak;
  v5->_sak = (NSData *)v12;

  uint64_t v14 = [v4 historicalBytes];
  historicalBytes = v5->_historicalBytes;
  v5->_historicalBytes = (NSData *)v14;

  uint64_t v16 = [v4 PMm];
  pmm = v5->_pmm;
  v5->_pmm = (NSData *)v16;

  int v18 = [v4 technology];
  if (v18 > 3)
  {
    if (v18 != 4)
    {
      if (v18 == 16)
      {
        int v19 = 16;
        goto LABEL_12;
      }
      goto LABEL_9;
    }
    int v19 = 8;
  }
  else
  {
    if (v18 != 1)
    {
      if (v18 == 2)
      {
        int v19 = 4;
        goto LABEL_12;
      }
LABEL_9:
      int v19 = 0;
      goto LABEL_12;
    }
    int v19 = 2;
  }
LABEL_12:
  v5->_technology = v19;
  unsigned int v20 = [v4 silentType];
  if (v20 <= 3) {
    v5->_silentType = v20;
  }
LABEL_14:

  return v5;
}

- (id)asDictionary
{
  v3 = objc_opt_new();
  id v4 = v3;
  signed int technology = self->_technology;
  if (technology > 15)
  {
    if (technology > 63)
    {
      if (technology == 64)
      {
        uint64_t v6 = &unk_26D0553D0;
        goto LABEL_18;
      }
      if (technology == 128)
      {
        uint64_t v6 = &unk_26D0553E8;
        goto LABEL_18;
      }
    }
    else
    {
      if (technology == 16)
      {
        uint64_t v6 = &unk_26D0553A0;
        goto LABEL_18;
      }
      if (technology == 32)
      {
        uint64_t v6 = &unk_26D0553B8;
        goto LABEL_18;
      }
    }
    goto LABEL_16;
  }
  if (technology == 2)
  {
    uint64_t v6 = &unk_26D055358;
    goto LABEL_18;
  }
  if (technology != 4)
  {
    if (technology == 8)
    {
      uint64_t v6 = &unk_26D055388;
      goto LABEL_18;
    }
LABEL_16:
    uint64_t v6 = &unk_26D055400;
    goto LABEL_18;
  }
  uint64_t v6 = &unk_26D055370;
LABEL_18:
  [v3 setObject:v6 forKeyedSubscript:@"technology"];
  v7 = [NSNumber numberWithUnsignedInt:self->_type];
  [v4 setObject:v7 forKeyedSubscript:@"type"];

  uint64_t v8 = [NSNumber numberWithUnsignedInt:self->_ndefAvailability];
  [v4 setObject:v8 forKeyedSubscript:@"ndefAvailability"];

  v9 = [NSNumber numberWithUnsignedLong:self->_ndefContainerSize];
  [v4 setObject:v9 forKeyedSubscript:@"ndefContainerSize"];

  uint64_t v10 = [NSNumber numberWithUnsignedLong:self->_ndefMessageSize];
  [v4 setObject:v10 forKeyedSubscript:@"ndefMessageSize"];

  v11 = [NSNumber numberWithUnsignedChar:self->_silentType];
  [v4 setObject:v11 forKeyedSubscript:@"silentType"];

  tagID = self->_tagID;
  if (tagID) {
    [v4 setObject:tagID forKeyedSubscript:@"identifier"];
  }
  uid = self->_uid;
  if (uid) {
    [v4 setObject:uid forKeyedSubscript:@"UID"];
  }
  pmm = self->_pmm;
  if (pmm) {
    [v4 setObject:pmm forKeyedSubscript:@"PMm"];
  }
  allSystemCodes = self->_allSystemCodes;
  if (allSystemCodes) {
    [v4 setObject:allSystemCodes forKeyedSubscript:@"allSystemCodes"];
  }
  appData = self->_appData;
  if (appData) {
    [v4 setObject:appData forKeyedSubscript:@"allSystemCodes"];
  }
  atqa = self->_atqa;
  if (atqa) {
    [v4 setObject:atqa forKeyedSubscript:@"atqa"];
  }
  sak = self->_sak;
  if (sak) {
    [v4 setObject:sak forKeyedSubscript:@"sak"];
  }
  historicalBytes = self->_historicalBytes;
  if (historicalBytes) {
    [v4 setObject:historicalBytes forKeyedSubscript:@"historicalBytes"];
  }
  return v4;
}

- (NSString)description
{
  unsigned int v3 = self->_type - 1;
  if (v3 > 0xF) {
    id v4 = @"Unknown";
  }
  else {
    id v4 = off_2644EC6A8[v3];
  }
  HIDWORD(v6) = self->_technology;
  LODWORD(v6) = HIDWORD(v6) - 2;
  unsigned int v5 = v6 >> 1;
  if (v5 > 7) {
    v7 = @"Unknown";
  }
  else {
    v7 = off_2644EC728[v5];
  }
  id v8 = [NSString alloc];
  v15.receiver = self;
  v15.super_class = (Class)NFACTag;
  v9 = [(NFACTag *)&v15 description];
  uint64_t v10 = [(NSData *)self->_uid NF_asHexString];
  uint64_t silentType = self->_silentType;
  uint64_t v12 = [(NSData *)self->_tagID NF_asHexString];
  v13 = (void *)[v8 initWithFormat:@"%@-%@ { Tech=%@ Type=%@ silentType=%d ID=%@}", v9, v10, v7, v4, silentType, v12];

  return (NSString *)v13;
}

- (NFACTag)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)NFACTag;
  unsigned int v5 = [(NFACTag *)&v25 init];
  if (v5)
  {
    v5->_type = [v4 decodeInt32ForKey:@"type"];
    v5->_uint64_t silentType = [v4 decodeIntForKey:@"silentType"];
    v5->_signed int technology = [v4 decodeInt32ForKey:@"technology"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    tagID = v5->_tagID;
    v5->_tagID = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PMm"];
    pmm = v5->_pmm;
    v5->_pmm = (NSData *)v8;

    uint64_t v10 = [MEMORY[0x263F8C688] coder:v4 decodeArrayOfClass:objc_opt_class() forKey:@"allSystemCodes"];
    allSystemCodes = v5->_allSystemCodes;
    v5->_allSystemCodes = (NSArray *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AppData"];
    appData = v5->_appData;
    v5->_appData = (NSData *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UID"];
    uid = v5->_uid;
    v5->_uid = (NSData *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"description"];
    description = v5->_description;
    v5->_description = (NSString *)v16;

    v5->_ndefAvailability = [v4 decodeInt32ForKey:@"ndefAvailability"];
    v5->_ndefMessageSize = [v4 decodeIntegerForKey:@"ndefMessageSize"];
    v5->_ndefContainerSize = [v4 decodeIntegerForKey:@"ndefContainerSize"];
    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"atqa"];
    atqa = v5->_atqa;
    v5->_atqa = (NSData *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sak"];
    sak = v5->_sak;
    v5->_sak = (NSData *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"historicalBytes"];
    historicalBytes = v5->_historicalBytes;
    v5->_historicalBytes = (NSData *)v22;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInt32:type forKey:@"type"];
  [v5 encodeInt:self->_silentType forKey:@"silentType"];
  [v5 encodeInt32:self->_technology forKey:@"technology"];
  [v5 encodeObject:self->_tagID forKey:@"identifier"];
  [v5 encodeObject:self->_pmm forKey:@"PMm"];
  [v5 encodeObject:self->_allSystemCodes forKey:@"allSystemCodes"];
  [v5 encodeObject:self->_appData forKey:@"AppData"];
  [v5 encodeObject:self->_uid forKey:@"UID"];
  [v5 encodeObject:self->_description forKey:@"description"];
  [v5 encodeInt32:self->_ndefAvailability forKey:@"ndefAvailability"];
  [v5 encodeInteger:self->_ndefMessageSize forKey:@"ndefMessageSize"];
  [v5 encodeInteger:self->_ndefContainerSize forKey:@"ndefContainerSize"];
  [v5 encodeObject:self->_atqa forKey:@"atqa"];
  [v5 encodeObject:self->_sak forKey:@"sak"];
  [v5 encodeObject:self->_historicalBytes forKey:@"historicalBytes"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_historicalBytes, 0);
  objc_storeStrong((id *)&self->_sak, 0);
  objc_storeStrong((id *)&self->_atqa, 0);
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_uid, 0);
  objc_storeStrong((id *)&self->_appData, 0);
  objc_storeStrong((id *)&self->_allSystemCodes, 0);
  objc_storeStrong((id *)&self->_pmm, 0);
  objc_storeStrong((id *)&self->_tagID, 0);
}

@end