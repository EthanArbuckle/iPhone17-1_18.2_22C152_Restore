@interface STSCHNfcAlternativeCarrier
+ (BOOL)supportsSecureCoding;
+ (id)connectionHandoverAlternativeCarrierWithBundle:(id)a3;
- (STSCHNfcAlternativeCarrier)initWithCoder:(id)a3;
- (STSCHNfcAlternativeCarrier)initWithMaxLcField:(int64_t)a3 maxLeField:(int64_t)a4 auxiliaryRecords:(id)a5;
- (STSCHNfcAlternativeCarrier)initWithNdefRecordBundle:(id)a3;
- (id)_createCarrierConfigurationRecord;
- (id)description;
- (int64_t)maxLc;
- (int64_t)maxLe;
- (void)encodeWithCoder:(id)a3;
- (void)setMaxLc:(int64_t)a3;
- (void)setMaxLe:(int64_t)a3;
@end

@implementation STSCHNfcAlternativeCarrier

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STSCHNfcAlternativeCarrier;
  id v4 = a3;
  [(STSCHAlternativeCarrier *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_maxLc, @"maxLc", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_maxLe forKey:@"maxLe"];
}

- (STSCHNfcAlternativeCarrier)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)STSCHNfcAlternativeCarrier;
  objc_super v5 = [(STSCHAlternativeCarrier *)&v7 initWithCoder:v4];
  if (v5)
  {
    v5->_maxLc = (int64_t)[v4 decodeIntegerForKey:@"maxLc"];
    v5->_maxLe = (int64_t)[v4 decodeIntegerForKey:@"maxLe"];
  }

  return v5;
}

- (STSCHNfcAlternativeCarrier)initWithMaxLcField:(int64_t)a3 maxLeField:(int64_t)a4 auxiliaryRecords:(id)a5
{
  id v8 = a5;
  v15.receiver = self;
  v15.super_class = (Class)STSCHNfcAlternativeCarrier;
  v9 = [(STSCHNfcAlternativeCarrier *)&v15 init];
  v10 = v9;
  if (v9)
  {
    int64_t v11 = 4096;
    if (a3 >= 1) {
      int64_t v12 = a3;
    }
    else {
      int64_t v12 = 4096;
    }
    v9->_maxLc = v12;
    if (a4 >= 1) {
      int64_t v11 = a4;
    }
    v9->_maxLe = v11;
    [(STSCHAlternativeCarrier *)v9 setType:3];
    [(STSCHAlternativeCarrier *)v10 setPowerState:1];
    [(STSCHAlternativeCarrier *)v10 setAuxiliaryRecords:v8];
    v13 = [(STSCHNfcAlternativeCarrier *)v10 _createCarrierConfigurationRecord];
    [(STSCHAlternativeCarrier *)v10 setCarrierRecord:v13];
  }
  return v10;
}

- (STSCHNfcAlternativeCarrier)initWithNdefRecordBundle:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)STSCHNfcAlternativeCarrier;
  objc_super v5 = [(STSCHAlternativeCarrier *)&v32 initWithNdefRecordBundle:v4];
  if (!v5) {
    goto LABEL_19;
  }
  v6 = [v4 configurationRecord];
  id v7 = [v6 payload];
  id v8 = [v7 bytes];

  v9 = [v4 configurationRecord];
  v10 = [v9 payload];
  int64_t v11 = (char *)[v10 length];

  v5->_maxLc = -1;
  v5->_maxLe = -1;
  if ((uint64_t)v11 <= 0)
  {
    v28 = @"Invalid payload length";
    uint64_t v29 = 67;
    goto LABEL_23;
  }
  if (*v8 != 1)
  {
    v28 = @"Invalid version";
    uint64_t v29 = 72;
    goto LABEL_23;
  }
  if ((unint64_t)v11 < 2)
  {
LABEL_19:
    v27 = v5;
    goto LABEL_24;
  }
  v14 = v11 - 1;
  objc_super v15 = v8 + 1;
  v16 = v8 + 1;
  while (1)
  {
    unsigned int v18 = *v16;
    v16 += 2;
    uint64_t v17 = v18;
    uint64_t v19 = (uint64_t)(v14 - 2);
    uint64_t v20 = (uint64_t)&v14[-v18 - 2];
    if ((uint64_t)(v14 - 2) < v18) {
      break;
    }
    uint64_t v21 = v15[1];
    if (v21 == 2)
    {
      v5->_maxLe = 0;
      if (v17)
      {
        unint64_t v25 = 0;
        unsigned __int8 v23 = v17 - 1;
        do
        {
          v5->_maxLe = v25 << 8;
          unsigned __int8 v26 = *v16++;
          v5->_maxLe = v26 | (v25 << 8);
          LODWORD(v17) = v17 - 1;
          unint64_t v25 = v26 | (v25 << 8);
        }
        while ((_BYTE)v17);
        goto LABEL_16;
      }
    }
    else
    {
      if (v21 != 1)
      {
        sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSCHNfcAlternativeCarrier initWithNdefRecordBundle:]", 101, v5, @"Unrecognized tag: 0x%X", v12, v13, v21);
        v16 += v17;
        uint64_t v19 = v20;
        goto LABEL_18;
      }
      v5->_maxLc = 0;
      if (v17)
      {
        unint64_t v22 = 0;
        unsigned __int8 v23 = v17 - 1;
        do
        {
          v5->_maxLc = v22 << 8;
          unsigned __int8 v24 = *v16++;
          v5->_maxLc = v24 | (v22 << 8);
          LODWORD(v17) = v17 - 1;
          unint64_t v22 = v24 | (v22 << 8);
        }
        while ((_BYTE)v17);
LABEL_16:
        uint64_t v19 = (uint64_t)&v14[-v23 - 3];
      }
    }
LABEL_18:
    v14 = (char *)v19;
    objc_super v15 = v16;
    if (v19 <= 0) {
      goto LABEL_19;
    }
  }
  v28 = @"Invalid tag length";
  uint64_t v29 = 86;
LABEL_23:
  sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSCHNfcAlternativeCarrier initWithNdefRecordBundle:]", v29, v5, v28, v12, v13, v31);
  v27 = 0;
LABEL_24:

  return v27;
}

+ (id)connectionHandoverAlternativeCarrierWithBundle:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 configurationRecord];
  unsigned int v6 = [v5 isNfcConfigurationRecord];

  if (v6) {
    id v7 = [objc_alloc((Class)a1) initWithNdefRecordBundle:v4];
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (id)_createCarrierConfigurationRecord
{
  v3 = +[NSData dataWithBytes:"iso.org:18013:nfc" length:17];
  id v4 = [@"nfc" dataUsingEncoding:4];
  __int16 v9 = 769;
  char v10 = 1;
  char v11 = (unsigned __int16)[(STSCHNfcAlternativeCarrier *)self maxLc] >> 8;
  unsigned __int8 v12 = [(STSCHNfcAlternativeCarrier *)self maxLc];
  __int16 v13 = 515;
  char v14 = (unsigned __int16)[(STSCHNfcAlternativeCarrier *)self maxLe] >> 8;
  unsigned __int8 v15 = [(STSCHNfcAlternativeCarrier *)self maxLe];
  objc_super v5 = [STSNDEFRecord alloc];
  unsigned int v6 = +[NSData dataWithBytes:&v9 length:9];
  id v7 = [(STSNDEFRecord *)v5 initWithFormat:4 type:v3 identifier:v4 payload:v6];

  return v7;
}

- (id)description
{
  unint64_t v3 = [(STSCHAlternativeCarrier *)self powerState];
  int64_t v4 = [(STSCHNfcAlternativeCarrier *)self maxLc];
  int64_t v5 = [(STSCHNfcAlternativeCarrier *)self maxLe];
  unsigned int v6 = [(STSCHAlternativeCarrier *)self auxiliaryRecords];
  id v7 = +[NSString stringWithFormat:@"{ type=nfc,powerState=%lu,maxLc=%ld,maxLe=%ld,aux=%@ }", v3, v4, v5, v6];

  return v7;
}

- (int64_t)maxLc
{
  return self->_maxLc;
}

- (void)setMaxLc:(int64_t)a3
{
  self->_maxLc = a3;
}

- (int64_t)maxLe
{
  return self->_maxLe;
}

- (void)setMaxLe:(int64_t)a3
{
  self->_maxLe = a3;
}

@end