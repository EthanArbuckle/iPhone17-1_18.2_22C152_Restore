@interface NFTagInternal
+ (BOOL)supportsSecureCoding;
- (BOOL)applicationDataCoding;
- (BOOL)isEqualToNFTag:(id)a3;
- (BOOL)isSilent;
- (NFTagA)tagA;
- (NFTagB)tagB;
- (NFTagF)tagF;
- (NFTagInternal)initWithCoder:(id)a3;
- (NFTagInternal)initWithDictionary:(id)a3;
- (NFTagInternal)initWithNFTag:(id)a3;
- (NFTagInternal)initWithNFTagForUIDOnly:(id)a3;
- (NSArray)allSystemCodes;
- (NSData)AppData;
- (NSData)IDm;
- (NSData)PMm;
- (NSData)SystemCode;
- (NSData)UID;
- (NSData)applicationData;
- (NSData)atqa;
- (NSData)historicalBytes;
- (NSData)pupi;
- (NSData)sak;
- (NSData)selectedAID;
- (NSData)tagID;
- (NSString)description;
- (double)sfgt;
- (id)_getSystemCodeListString;
- (id)asDictionary;
- (unint64_t)ndefContainerSize;
- (unint64_t)ndefMessageSize;
- (unsigned)ndefAvailability;
- (unsigned)sfgi;
- (unsigned)silentType;
- (unsigned)technology;
- (unsigned)type;
- (void)_setAppData:(id)a3;
- (void)_setAtqa:(id)a3;
- (void)_setHistoricalBytes:(id)a3;
- (void)_setIDm:(id)a3;
- (void)_setIdentifier:(id)a3;
- (void)_setNDEFAvailability:(unsigned int)a3;
- (void)_setNDEFContainerSize:(unint64_t)a3;
- (void)_setNDEFMessageSize:(unint64_t)a3;
- (void)_setPMm:(id)a3;
- (void)_setSFGI:(unsigned __int8)a3;
- (void)_setSak:(id)a3;
- (void)_setSelectedAID:(id)a3;
- (void)_setSilentType:(unsigned __int8)a3;
- (void)_setSystemCode:(id)a3;
- (void)_setSystemCodes:(id)a3;
- (void)_setTechnology:(unsigned int)a3;
- (void)_setType:(unsigned int)a3;
- (void)_setUID:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NFTagInternal

- (NSData)atqa
{
  return self->_atqa;
}

- (NSData)sak
{
  return self->_sak;
}

- (NSData)historicalBytes
{
  return self->_historicalBytes;
}

- (NSData)selectedAID
{
  return self->_appData;
}

- (double)sfgt
{
  return dbl_1CA544B08[self->_sfgi] / 13560000.0;
}

- (unsigned)sfgi
{
  return self->_sfgi;
}

- (NSData)pupi
{
  return -[NSData subdataWithRange:](self->_tagID, "subdataWithRange:", 0, 4);
}

- (NSData)applicationData
{
  return -[NSData subdataWithRange:](self->_tagID, "subdataWithRange:", 4, 4);
}

- (BOOL)applicationDataCoding
{
  return (*(unsigned char *)([(NSData *)self->_tagID bytes] + 10) & 0xC) == 4;
}

- (NSData)IDm
{
  return self->_tagID;
}

- (NSData)PMm
{
  return self->_pmm;
}

- (NSData)SystemCode
{
  return self->_appData;
}

- (NSArray)allSystemCodes
{
  return self->_allSystemCodes;
}

- (unsigned)type
{
  return self->_type;
}

- (unsigned)technology
{
  return self->_technology;
}

- (NSData)UID
{
  return self->_uid;
}

- (NSData)tagID
{
  return self->_tagID;
}

- (NSData)AppData
{
  return self->_appData;
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

- (NSString)description
{
  uint64_t v2 = (uint64_t)self;
  unsigned int type = self->_type;
  v4 = @"Unknown";
  v5 = @"Unknown";
  if (type - 1 <= 0xF) {
    v5 = off_1E65ABFD0[type - 1];
  }
  unsigned int technology = self->_technology;
  if ((technology & 0x10) != 0) {
    v4 = @"Iso15693";
  }
  if ((technology & 4) != 0) {
    v4 = @"F";
  }
  if ((technology & 2) != 0) {
    v4 = @"B";
  }
  if (technology) {
    v7 = @"A";
  }
  else {
    v7 = v4;
  }
  BOOL v8 = type > 0x10;
  int v9 = (1 << type) & 0x1E20E;
  if (!v8 && v9 != 0)
  {
    v11 = [(NSData *)self->_historicalBytes NF_asHexString];
    v32 = v7;
    if ([v11 length]) {
      v12 = (__CFString *)[[NSString alloc] initWithFormat:@"historicalBytes=%@ ", v11];
    }
    else {
      v12 = &stru_1F24CADC0;
    }

    id v13 = [NSString alloc];
    v35.receiver = (id)v2;
    v35.super_class = (Class)NFTagInternal;
    v14 = [(NFTagInternal *)&v35 description];
    v15 = [*(id *)(v2 + 56) NF_asHexString];
    v16 = [*(id *)(v2 + 16) NF_asHexString];
    uint64_t v17 = *(unsigned __int8 *)(v2 + 112);
    v18 = [*(id *)(v2 + 96) NF_asHexString];
    v19 = [*(id *)(v2 + 88) NF_asHexString];
    v20 = (void *)[v13 initWithFormat:@"%@-%@ { Tech=%@ Type=%@ ID=%@ silentType=%d SAK=%@ ATQA=%@ sfgi=0x%X %@}", v14, v15, v32, v5, v16, v17, v18, v19, *(unsigned __int8 *)(v2 + 113), v12];

    goto LABEL_20;
  }
  if (![(__CFString *)v7 isEqualToString:@"F"])
  {
    id v22 = [NSString alloc];
    v33.receiver = (id)v2;
    v33.super_class = (Class)NFTagInternal;
    v12 = [(NFTagInternal *)&v33 description];
    v14 = [*(id *)(v2 + 56) NF_asHexString];
    v15 = [*(id *)(v2 + 16) NF_asHexString];
    v20 = (void *)[v22 initWithFormat:@"%@-%@ { Tech=%@ Type=%@ ID=%@, NDEF=%d, capacity=%lu, messageSize=%lu }", v12, v14, v7, v5, v15, *(unsigned int *)(v2 + 64), *(void *)(v2 + 80), *(void *)(v2 + 72)];
    goto LABEL_20;
  }
  if ([*(id *)(v2 + 40) count])
  {
    uint64_t v31 = [(id)v2 _getSystemCodeListString];
  }
  else
  {
    uint64_t v31 = 0;
  }
  id v29 = [NSString alloc];
  v34.receiver = (id)v2;
  v34.super_class = (Class)NFTagInternal;
  v14 = [(NFTagInternal *)&v34 description];
  v15 = [[*(id *)(v2 + 56) NF_asHexString];
  v23 = [*(id *)(v2 + 16) NF_asHexString];
  uint64_t v30 = [[*(id *)(v2 + 32) NF_asHexString];
  uint64_t v24 = *(void *)(v2 + 48);
  if (v24)
  {
    id v25 = [NSString alloc];
    uint64_t v2 = [[*(id *)(v2 + 48) NF_asHexString];
    v26 = (__CFString *)[v25 initWithFormat:@"SystemCode=%@", v2];
  }
  else
  {
    v26 = &stru_1F24CADC0;
  }
  if (!v31)
  {
    v28 = (void *)v30;
    v20 = (void *)[v29 initWithFormat:@"%@-%@ { Tech=%@ Type=%@ ID=%@ PMm=%@ %@%@}", v14, v15, v7, v5, v23, v30, v26, &stru_1F24CADC0];
    if (!v24) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
  v27 = (void *)[[NSString alloc] initWithFormat:@"SystemCodeList=%@ ", v31];
  v28 = (void *)v30;
  v20 = (void *)[v29 initWithFormat:@"%@-%@ { Tech=%@ Type=%@ ID=%@ PMm=%@ %@%@}", v14, v15, v7, v5, v23, v30, v26, v27];

  if (v24)
  {
LABEL_33:
  }
LABEL_34:

  v12 = (__CFString *)v31;
LABEL_20:

  return (NSString *)v20;
}

- (NFTagA)tagA
{
  if (self->_technology == 1) {
    uint64_t v2 = self;
  }
  else {
    uint64_t v2 = 0;
  }

  return (NFTagA *)v2;
}

- (NFTagB)tagB
{
  if (self->_technology == 2) {
    uint64_t v2 = self;
  }
  else {
    uint64_t v2 = 0;
  }

  return (NFTagB *)v2;
}

- (NFTagF)tagF
{
  if (self->_technology == 4) {
    uint64_t v2 = self;
  }
  else {
    uint64_t v2 = 0;
  }

  return (NFTagF *)v2;
}

- (NFTagInternal)initWithNFTag:(id)a3
{
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)NFTagInternal;
  v5 = [(NFTagInternal *)&v40 init];
  if (v5)
  {
    v5->_unsigned int type = [v4 type];
    v5->_unsigned int technology = [v4 technology];
    v6 = [v4 UID];
    uint64_t v7 = [v6 copy];
    uid = v5->_uid;
    v5->_uid = (NSData *)v7;

    int v9 = [v4 tagID];
    uint64_t v10 = [v9 copy];
    tagID = v5->_tagID;
    v5->_tagID = (NSData *)v10;

    v5->_ndefAvailability = [v4 ndefAvailability];
    v5->_ndefMessageSize = [v4 ndefMessageSize];
    v5->_ndefContainerSize = [v4 ndefContainerSize];
    if ([v4 technology] == 1
      && [v4 conformsToProtocol:&unk_1F24D6BC8])
    {
      id v12 = v4;
      id v13 = [v12 atqa];
      uint64_t v14 = [v13 copy];
      atqa = v5->_atqa;
      v5->_atqa = (NSData *)v14;

      v16 = [v12 sak];
      uint64_t v17 = [v16 copy];
      sak = v5->_sak;
      v5->_sak = (NSData *)v17;

      v19 = [v12 historicalBytes];
      uint64_t v20 = [v19 copy];
      historicalBytes = v5->_historicalBytes;
      v5->_historicalBytes = (NSData *)v20;

      id v22 = [v12 selectedAID];
      uint64_t v23 = [v22 copy];
      appData = v5->_appData;
      v5->_appData = (NSData *)v23;

      LOBYTE(v22) = [v12 sfgi];
      v5->_sfgi = v22;
    }
    if ([v4 technology] == 2
      && [v4 conformsToProtocol:&unk_1F24D6D98])
    {
      id v25 = v4;
      v26 = [v25 selectedAID];
      uint64_t v27 = [v26 copy];
      v28 = v5->_appData;
      v5->_appData = (NSData *)v27;

      LOBYTE(v26) = [v25 sfgi];
      v5->_sfgi = v26;
    }
    if ([v4 technology] == 4
      && [v4 conformsToProtocol:&unk_1F24D6F28])
    {
      id v29 = v4;
      uint64_t v30 = [v29 PMm];
      uint64_t v31 = [v30 copy];
      pmm = v5->_pmm;
      v5->_pmm = (NSData *)v31;

      objc_super v33 = [v29 SystemCode];
      uint64_t v34 = [v33 copy];
      objc_super v35 = v5->_appData;
      v5->_appData = (NSData *)v34;

      v36 = [v29 allSystemCodes];

      uint64_t v37 = [v36 copy];
      allSystemCodes = v5->_allSystemCodes;
      v5->_allSystemCodes = (NSArray *)v37;
    }
  }

  return v5;
}

- (NFTagInternal)initWithNFTagForUIDOnly:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NFTagInternal;
  v5 = [(NFTagInternal *)&v10 init];
  if (v5)
  {
    v6 = [v4 UID];
    uint64_t v7 = [v6 copy];
    uid = v5->_uid;
    v5->_uid = (NSData *)v7;

    v5->_ndefAvailability = [v4 ndefAvailability];
    v5->_ndefMessageSize = [v4 ndefMessageSize];
    v5->_ndefContainerSize = [v4 ndefContainerSize];
  }

  return v5;
}

- (NFTagInternal)initWithDictionary:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)NFTagInternal;
  v5 = [(NFTagInternal *)&v43 init];
  if (v5)
  {
    v6 = [v4 objectForKey:@"technology"];
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v5->_unsigned int technology = [v6 integerValue];
      }
    }
    uint64_t v7 = [v4 objectForKey:@"type"];

    if (v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v5->_unsigned int type = [v7 integerValue];
      }
    }
    BOOL v8 = [v4 objectForKey:@"silentType"];

    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v5->_silentType = [v8 intValue];
      }
    }
    int v9 = [v4 objectForKey:@"identifier"];

    if (v9)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v10 = [v9 copy];
        tagID = v5->_tagID;
        v5->_tagID = (NSData *)v10;
      }
    }
    id v12 = [v4 objectForKey:@"PMm"];

    if (v12)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v13 = [v12 copy];
        pmm = v5->_pmm;
        v5->_pmm = (NSData *)v13;
      }
    }
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v15 = [&unk_1F24D2120 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v40;
      while (2)
      {
        uint64_t v18 = 0;
        v19 = v12;
        do
        {
          if (*(void *)v40 != v17) {
            objc_enumerationMutation(&unk_1F24D2120);
          }
          id v12 = [v4 objectForKey:*(void *)(*((void *)&v39 + 1) + 8 * v18)];

          if (v12)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v20 = [v12 copy];
              appData = v5->_appData;
              v5->_appData = (NSData *)v20;

              goto LABEL_28;
            }
          }
          ++v18;
          v19 = v12;
        }
        while (v16 != v18);
        uint64_t v16 = [&unk_1F24D2120 countByEnumeratingWithState:&v39 objects:v44 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }
LABEL_28:
    id v22 = [v4 objectForKey:@"allSystemCodes"];

    if (v22)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v23 = [v22 copy];
        allSystemCodes = v5->_allSystemCodes;
        v5->_allSystemCodes = (NSArray *)v23;
      }
    }
    id v25 = [v4 objectForKey:@"UID"];

    if (v25)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v26 = [v25 copy];
        uid = v5->_uid;
        v5->_uid = (NSData *)v26;
      }
    }
    v28 = [v4 objectForKey:@"atqa"];

    if (v28)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v29 = [v28 copy];
        atqa = v5->_atqa;
        v5->_atqa = (NSData *)v29;
      }
    }
    uint64_t v31 = [v4 objectForKey:@"sak"];

    if (v31)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v32 = [v31 copy];
        sak = v5->_sak;
        v5->_sak = (NSData *)v32;
      }
    }
    uint64_t v34 = [v4 objectForKey:@"historicalBytes"];

    if (v34)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v35 = [v34 copy];
        historicalBytes = v5->_historicalBytes;
        v5->_historicalBytes = (NSData *)v35;
      }
    }
    uint64_t v37 = [v4 objectForKey:@"sfgi"];

    if (v37)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v5->_sfgi = [v37 integerValue];
      }
    }
  }
  return v5;
}

- (NFTagInternal)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)NFTagInternal;
  v5 = [(NFTagInternal *)&v23 init];
  if (v5)
  {
    v5->_unsigned int technology = [v4 decodeInt32ForKey:@"technology"];
    v5->_unsigned int type = [v4 decodeInt32ForKey:@"type"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    tagID = v5->_tagID;
    v5->_tagID = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PMm"];
    pmm = v5->_pmm;
    v5->_pmm = (NSData *)v8;

    uint64_t v10 = +[NFNSCheckedDecoder coder:v4 decodeArrayOfClass:objc_opt_class() forKey:@"allSystemCodes"];
    allSystemCodes = v5->_allSystemCodes;
    v5->_allSystemCodes = (NSArray *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UID"];
    uid = v5->_uid;
    v5->_uid = (NSData *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AppData"];
    appData = v5->_appData;
    v5->_appData = (NSData *)v14;

    v5->_ndefAvailability = [v4 decodeInt32ForKey:@"ndefAvailability"];
    v5->_ndefMessageSize = [v4 decodeIntegerForKey:@"ndefMessageSize"];
    v5->_ndefContainerSize = [v4 decodeIntegerForKey:@"ndefContainerSize"];
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"atqa"];
    atqa = v5->_atqa;
    v5->_atqa = (NSData *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sak"];
    sak = v5->_sak;
    v5->_sak = (NSData *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"historicalBytes"];
    historicalBytes = v5->_historicalBytes;
    v5->_historicalBytes = (NSData *)v20;

    v5->_silentType = [v4 decodeIntForKey:@"silentType"];
    v5->_sfgi = [v4 decodeIntegerForKey:@"sfgi"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t technology = self->_technology;
  id v5 = a3;
  [v5 encodeInt32:technology forKey:@"technology"];
  [v5 encodeInt32:self->_type forKey:@"type"];
  [v5 encodeObject:self->_tagID forKey:@"identifier"];
  [v5 encodeObject:self->_pmm forKey:@"PMm"];
  [v5 encodeObject:self->_allSystemCodes forKey:@"allSystemCodes"];
  [v5 encodeObject:self->_uid forKey:@"UID"];
  [v5 encodeObject:self->_appData forKey:@"AppData"];
  [v5 encodeInt32:self->_ndefAvailability forKey:@"ndefAvailability"];
  [v5 encodeInteger:self->_ndefMessageSize forKey:@"ndefMessageSize"];
  [v5 encodeInteger:self->_ndefContainerSize forKey:@"ndefContainerSize"];
  [v5 encodeObject:self->_atqa forKey:@"atqa"];
  [v5 encodeObject:self->_sak forKey:@"sak"];
  [v5 encodeObject:self->_historicalBytes forKey:@"historicalBytes"];
  [v5 encodeInt:self->_silentType forKey:@"silentType"];
  [v5 encodeInt:self->_sfgi forKey:@"sfgi"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqualToNFTag:(id)a3
{
  id v4 = (NFTagInternal *)a3;
  id v5 = v4;
  if (self == v4)
  {
    char v13 = 1;
    goto LABEL_13;
  }
  unsigned int type = self->_type;
  if (type != [(NFTagInternal *)v4 type]) {
    goto LABEL_6;
  }
  unsigned int technology = self->_technology;
  if (technology != [(NFTagInternal *)v5 technology]) {
    goto LABEL_6;
  }
  tagID = self->_tagID;
  uint64_t v9 = [(NFTagInternal *)v5 tagID];
  if (tagID == (NSData *)v9)
  {
  }
  else
  {
    uint64_t v10 = (void *)v9;
    v11 = self->_tagID;
    uint64_t v12 = [(NFTagInternal *)v5 tagID];
    LODWORD(v11) = [(NSData *)v11 isEqual:v12];

    if (!v11)
    {
LABEL_6:
      char v13 = 0;
      goto LABEL_13;
    }
  }
  uid = self->_uid;
  uint64_t v15 = [(NFTagInternal *)v5 UID];
  if (uid == (NSData *)v15)
  {
    char v13 = 1;
  }
  else
  {
    uint64_t v16 = (NSData *)v15;
    uint64_t v17 = self->_uid;
    uint64_t v18 = [(NFTagInternal *)v5 UID];
    char v13 = [(NSData *)v17 isEqual:v18];

    uid = v16;
  }

LABEL_13:
  return v13;
}

- (void)_setIDm:(id)a3
{
  self->_tagID = (NSData *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)_setPMm:(id)a3
{
  self->_pmm = (NSData *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)_setSystemCode:(id)a3
{
  self->_appData = (NSData *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)_setIdentifier:(id)a3
{
  self->_tagID = (NSData *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)_setTechnology:(unsigned int)a3
{
  self->_unsigned int technology = a3;
}

- (void)_setSilentType:(unsigned __int8)a3
{
  self->_silentType = a3;
}

- (void)_setType:(unsigned int)a3
{
  self->_unsigned int type = a3;
}

- (void)_setUID:(id)a3
{
  self->_uid = (NSData *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)_setAppData:(id)a3
{
  self->_appData = (NSData *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)_setSystemCodes:(id)a3
{
  self->_allSystemCodes = (NSArray *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (id)_getSystemCodeListString
{
  v3 = [objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"("];
  if ([(NSArray *)self->_allSystemCodes count])
  {
    NSUInteger v4 = 0;
    do
    {
      NSUInteger v5 = v4 + 1;
      uint64_t v6 = -[NSArray objectAtIndex:](self->_allSystemCodes, "objectAtIndex:");
      uint64_t v7 = [v6 description];
      [v3 appendString:v7];

      if (v5 != [(NSArray *)self->_allSystemCodes count]) {
        [v3 appendString:@", "];
      }

      NSUInteger v8 = [(NSArray *)self->_allSystemCodes count];
      NSUInteger v4 = v5;
    }
    while (v5 < v8);
  }
  [v3 appendString:@""]);

  return v3;
}

- (void)_setNDEFAvailability:(unsigned int)a3
{
  self->_ndefAvailability = a3;
}

- (void)_setNDEFMessageSize:(unint64_t)a3
{
  self->_ndefMessageSize = a3;
}

- (void)_setNDEFContainerSize:(unint64_t)a3
{
  self->_ndefContainerSize = a3;
}

- (void)_setAtqa:(id)a3
{
  self->_atqa = (NSData *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)_setSak:(id)a3
{
  self->_sak = (NSData *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)_setHistoricalBytes:(id)a3
{
  self->_historicalBytes = (NSData *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)_setSelectedAID:(id)a3
{
  self->_appData = (NSData *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)isSilent
{
  return self->_silentType != 0;
}

- (unsigned)silentType
{
  return self->_silentType;
}

- (void)_setSFGI:(unsigned __int8)a3
{
  if (a3 >= 0xFu) {
    unsigned __int8 v3 = 15;
  }
  else {
    unsigned __int8 v3 = a3;
  }
  self->_sfgi = v3;
}

- (id)asDictionary
{
  unsigned __int8 v3 = objc_opt_new();
  NSUInteger v4 = [NSNumber numberWithUnsignedInt:self->_technology];
  [v3 setObject:v4 forKeyedSubscript:@"technology"];

  NSUInteger v5 = [NSNumber numberWithUnsignedInt:self->_type];
  [v3 setObject:v5 forKeyedSubscript:@"type"];

  uint64_t v6 = [NSNumber numberWithUnsignedInt:self->_ndefAvailability];
  [v3 setObject:v6 forKeyedSubscript:@"ndefAvailability"];

  uint64_t v7 = [NSNumber numberWithUnsignedLong:self->_ndefContainerSize];
  [v3 setObject:v7 forKeyedSubscript:@"ndefContainerSize"];

  NSUInteger v8 = [NSNumber numberWithUnsignedLong:self->_ndefMessageSize];
  [v3 setObject:v8 forKeyedSubscript:@"ndefMessageSize"];

  uint64_t v9 = [NSNumber numberWithUnsignedChar:self->_silentType];
  [v3 setObject:v9 forKeyedSubscript:@"silentType"];

  uint64_t v10 = [NSNumber numberWithUnsignedChar:self->_sfgi];
  [v3 setObject:v10 forKeyedSubscript:@"sfgi"];

  tagID = self->_tagID;
  if (tagID) {
    [v3 setObject:tagID forKeyedSubscript:@"identifier"];
  }
  uid = self->_uid;
  if (uid) {
    [v3 setObject:uid forKeyedSubscript:@"UID"];
  }
  pmm = self->_pmm;
  if (pmm) {
    [v3 setObject:pmm forKeyedSubscript:@"PMm"];
  }
  allSystemCodes = self->_allSystemCodes;
  if (allSystemCodes) {
    [v3 setObject:allSystemCodes forKeyedSubscript:@"allSystemCodes"];
  }
  appData = self->_appData;
  if (appData) {
    [v3 setObject:appData forKeyedSubscript:@"allSystemCodes"];
  }
  atqa = self->_atqa;
  if (atqa) {
    [v3 setObject:atqa forKeyedSubscript:@"atqa"];
  }
  sak = self->_sak;
  if (sak) {
    [v3 setObject:sak forKeyedSubscript:@"sak"];
  }
  historicalBytes = self->_historicalBytes;
  if (historicalBytes) {
    [v3 setObject:historicalBytes forKeyedSubscript:@"historicalBytes"];
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_historicalBytes, 0);
  objc_storeStrong((id *)&self->_sak, 0);
  objc_storeStrong((id *)&self->_atqa, 0);
  objc_storeStrong((id *)&self->_uid, 0);
  objc_storeStrong((id *)&self->_appData, 0);
  objc_storeStrong((id *)&self->_allSystemCodes, 0);
  objc_storeStrong((id *)&self->_pmm, 0);
  objc_storeStrong((id *)&self->_idm, 0);

  objc_storeStrong((id *)&self->_tagID, 0);
}

@end