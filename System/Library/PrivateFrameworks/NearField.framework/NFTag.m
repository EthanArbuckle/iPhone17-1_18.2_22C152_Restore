@interface NFTag
+ (BOOL)supportsSecureCoding;
- (BOOL)applicationDataCoding;
- (BOOL)isEqualToNFTag:(id)a3;
- (NFTag)initWithCoder:(id)a3;
- (NFTag)initWithNFTag:(id)a3;
- (NFTagA)tagA;
- (NFTagB)tagB;
- (NFTagF)tagF;
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
- (unint64_t)ndefContainerSize;
- (unint64_t)ndefMessageSize;
- (unsigned)ndefAvailability;
- (unsigned)sfgi;
- (unsigned)technology;
- (unsigned)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NFTag

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
  return dbl_19D6E6360[self->_sfgi] / 13560000.0;
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
  return self->_description;
}

- (NFTagA)tagA
{
  if (self->_technology == 1) {
    v2 = self;
  }
  else {
    v2 = 0;
  }
  return (NFTagA *)v2;
}

- (NFTagB)tagB
{
  if (self->_technology == 2) {
    v2 = self;
  }
  else {
    v2 = 0;
  }
  return (NFTagB *)v2;
}

- (NFTagF)tagF
{
  if (self->_technology == 4) {
    v2 = self;
  }
  else {
    v2 = 0;
  }
  return (NFTagF *)v2;
}

- (NFTag)initWithNFTag:(id)a3
{
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)NFTag;
  v5 = [(NFTag *)&v43 init];
  if (v5)
  {
    v5->_type = [v4 type];
    v5->_technology = [v4 technology];
    v6 = [v4 UID];
    uint64_t v7 = [v6 copy];
    uid = v5->_uid;
    v5->_uid = (NSData *)v7;

    v9 = [v4 tagID];
    uint64_t v10 = [v9 copy];
    tagID = v5->_tagID;
    v5->_tagID = (NSData *)v10;

    v12 = [v4 description];
    uint64_t v13 = [v12 copy];
    description = v5->_description;
    v5->_description = (NSString *)v13;

    v5->_ndefAvailability = [v4 ndefAvailability];
    v5->_ndefMessageSize = [v4 ndefMessageSize];
    v5->_ndefContainerSize = [v4 ndefContainerSize];
    if ([v4 technology] == 1
      && [v4 conformsToProtocol:&unk_1EEF3C6D8])
    {
      id v15 = v4;
      v16 = [v15 atqa];
      uint64_t v17 = [v16 copy];
      atqa = v5->_atqa;
      v5->_atqa = (NSData *)v17;

      v19 = [v15 sak];
      uint64_t v20 = [v19 copy];
      sak = v5->_sak;
      v5->_sak = (NSData *)v20;

      v22 = [v15 historicalBytes];
      uint64_t v23 = [v22 copy];
      historicalBytes = v5->_historicalBytes;
      v5->_historicalBytes = (NSData *)v23;

      v25 = [v15 selectedAID];
      uint64_t v26 = [v25 copy];
      appData = v5->_appData;
      v5->_appData = (NSData *)v26;

      LOBYTE(v25) = [v15 sfgi];
      v5->_sfgi = v25;
    }
    if ([v4 technology] == 2
      && [v4 conformsToProtocol:&unk_1EEF3C768])
    {
      id v28 = v4;
      v29 = [v28 selectedAID];
      uint64_t v30 = [v29 copy];
      v31 = v5->_appData;
      v5->_appData = (NSData *)v30;

      LOBYTE(v29) = [v28 sfgi];
      v5->_sfgi = v29;
    }
    if ([v4 technology] == 4
      && [v4 conformsToProtocol:&unk_1EEF3C7F8])
    {
      id v32 = v4;
      v33 = [v32 PMm];
      uint64_t v34 = [v33 copy];
      pmm = v5->_pmm;
      v5->_pmm = (NSData *)v34;

      v36 = [v32 SystemCode];
      uint64_t v37 = [v36 copy];
      v38 = v5->_appData;
      v5->_appData = (NSData *)v37;

      v39 = [v32 allSystemCodes];

      uint64_t v40 = [v39 copy];
      allSystemCodes = v5->_allSystemCodes;
      v5->_allSystemCodes = (NSArray *)v40;
    }
  }

  return v5;
}

- (NFTag)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)NFTag;
  v5 = [(NFTag *)&v25 init];
  if (v5)
  {
    v5->_type = [v4 decodeInt32ForKey:@"type"];
    v5->_technology = [v4 decodeInt32ForKey:@"technology"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    tagID = v5->_tagID;
    v5->_tagID = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PMm"];
    pmm = v5->_pmm;
    v5->_pmm = (NSData *)v8;

    uint64_t v10 = [MEMORY[0x1E4FBA858] coder:v4 decodeArrayOfClass:objc_opt_class() forKey:@"allSystemCodes"];
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

    v5->_sfgi = [v4 decodeIntegerForKey:@"sfgi"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInt32:type forKey:@"type"];
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
  [v5 encodeInt:self->_sfgi forKey:@"sfgi"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqualToNFTag:(id)a3
{
  id v4 = (NFTag *)a3;
  id v5 = v4;
  if (self == v4) {
    goto LABEL_43;
  }
  unsigned int type = self->_type;
  if (type != [(NFTag *)v4 type]) {
    goto LABEL_10;
  }
  unsigned int technology = self->_technology;
  if (technology != [(NFTag *)v5 technology]) {
    goto LABEL_10;
  }
  tagID = self->_tagID;
  uint64_t v9 = [(NFTag *)v5 tagID];
  if (tagID == (NSData *)v9)
  {
  }
  else
  {
    uint64_t v10 = (void *)v9;
    v11 = self->_tagID;
    uint64_t v12 = [(NFTag *)v5 tagID];
    LODWORD(v11) = [(NSData *)v11 isEqual:v12];

    if (!v11) {
      goto LABEL_10;
    }
  }
  uid = self->_uid;
  uint64_t v14 = [(NFTag *)v5 UID];
  if (uid == (NSData *)v14)
  {

    goto LABEL_12;
  }
  id v15 = (void *)v14;
  uint64_t v16 = self->_uid;
  uint64_t v17 = [(NFTag *)v5 UID];
  LODWORD(v16) = [(NSData *)v16 isEqual:v17];

  if (v16)
  {
LABEL_12:
    unsigned int v19 = self->_technology;
    if (v19 == 1)
    {
      if ([(NFTag *)v5 conformsToProtocol:&unk_1EEF3C6D8])
      {
        uint64_t v20 = v5;
        atqa = self->_atqa;
        uint64_t v22 = [(NFTag *)v20 atqa];
        if (atqa == (NSData *)v22)
        {
        }
        else
        {
          uint64_t v23 = (void *)v22;
          v24 = self->_atqa;
          objc_super v25 = [(NFTag *)v20 atqa];
          LODWORD(v24) = [(NSData *)v24 isEqual:v25];

          if (!v24) {
            goto LABEL_48;
          }
        }
        sak = self->_sak;
        uint64_t v27 = [(NFTag *)v20 sak];
        if (sak == (NSData *)v27)
        {
        }
        else
        {
          id v28 = (void *)v27;
          v29 = self->_sak;
          uint64_t v30 = [(NFTag *)v20 sak];
          LODWORD(v29) = [(NSData *)v29 isEqual:v30];

          if (!v29) {
            goto LABEL_48;
          }
        }
        historicalBytes = self->_historicalBytes;
        uint64_t v32 = [(NFTag *)v20 historicalBytes];
        if (historicalBytes == (NSData *)v32)
        {
        }
        else
        {
          v33 = (void *)v32;
          uint64_t v34 = self->_historicalBytes;
          v35 = [(NFTag *)v20 historicalBytes];
          LODWORD(v34) = [(NSData *)v34 isEqual:v35];

          if (!v34) {
            goto LABEL_48;
          }
        }
        appData = self->_appData;
        uint64_t v37 = [(NFTag *)v20 selectedAID];
        if (appData == (NSData *)v37)
        {
        }
        else
        {
          v38 = (void *)v37;
          v39 = self->_appData;
          uint64_t v40 = [(NFTag *)v20 selectedAID];
          LODWORD(v39) = [(NSData *)v39 isEqual:v40];

          if (!v39) {
            goto LABEL_48;
          }
        }
      }
      unsigned int v19 = self->_technology;
    }
    if (v19 == 2 && [(NFTag *)v5 conformsToProtocol:&unk_1EEF3C768])
    {
      v41 = v5;
      v42 = self->_appData;
      uint64_t v43 = [(NFTag *)v41 selectedAID];
      if (v42 == (NSData *)v43)
      {
      }
      else
      {
        v44 = (void *)v43;
        v45 = self->_appData;
        v46 = [(NFTag *)v41 selectedAID];
        LODWORD(v45) = [(NSData *)v45 isEqual:v46];

        if (!v45) {
          goto LABEL_10;
        }
      }
    }
    if (self->_technology == 4 && [(NFTag *)v5 conformsToProtocol:&unk_1EEF3C7F8])
    {
      v47 = v5;
      pmm = self->_pmm;
      uint64_t v49 = [(NFTag *)v47 PMm];
      if (pmm == (NSData *)v49)
      {
      }
      else
      {
        v50 = (void *)v49;
        v51 = self->_pmm;
        v52 = [(NFTag *)v47 PMm];
        LODWORD(v51) = [(NSData *)v51 isEqual:v52];

        if (!v51) {
          goto LABEL_48;
        }
      }
      v54 = self->_appData;
      uint64_t v55 = [(NFTag *)v47 SystemCode];
      if (v54 == (NSData *)v55)
      {
      }
      else
      {
        v56 = (void *)v55;
        v57 = self->_appData;
        v58 = [(NFTag *)v47 SystemCode];
        LODWORD(v57) = [(NSData *)v57 isEqual:v58];

        if (!v57)
        {
LABEL_48:
          char v18 = 0;
LABEL_54:

          goto LABEL_44;
        }
      }
      allSystemCodes = self->_allSystemCodes;
      uint64_t v60 = [(NFTag *)v47 allSystemCodes];
      if (allSystemCodes == (NSArray *)v60)
      {
        char v18 = 1;
      }
      else
      {
        v61 = (NSArray *)v60;
        v62 = self->_allSystemCodes;
        v63 = [(NFTag *)v47 allSystemCodes];
        char v18 = [(NSArray *)v62 isEqual:v63];

        allSystemCodes = v61;
      }

      goto LABEL_54;
    }
LABEL_43:
    char v18 = 1;
    goto LABEL_44;
  }
LABEL_10:
  char v18 = 0;
LABEL_44:

  return v18;
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