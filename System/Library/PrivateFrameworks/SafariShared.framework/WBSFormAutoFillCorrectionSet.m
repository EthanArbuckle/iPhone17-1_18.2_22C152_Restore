@interface WBSFormAutoFillCorrectionSet
- (BOOL)isEqual:(id)a3;
- (NSDictionary)fingerprintsToClassifications;
- (NSDictionary)fingerprintsToCorrections;
- (NSString)domain;
- (WBSFormAutoFillCorrectionSet)initWithDomain:(id)a3 fingerprintsToClassifications:(id)a4;
- (WBSFormAutoFillCorrectionSet)initWithDomain:(id)a3 fingerprintsToCorrections:(id)a4;
- (unint64_t)hash;
@end

@implementation WBSFormAutoFillCorrectionSet

- (WBSFormAutoFillCorrectionSet)initWithDomain:(id)a3 fingerprintsToClassifications:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WBSFormAutoFillCorrectionSet;
  v8 = [(WBSFormAutoFillCorrectionSet *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    domain = v8->_domain;
    v8->_domain = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    fingerprintsToClassifications = v8->_fingerprintsToClassifications;
    v8->_fingerprintsToClassifications = (NSDictionary *)v11;

    v13 = v8;
  }

  return v8;
}

- (WBSFormAutoFillCorrectionSet)initWithDomain:(id)a3 fingerprintsToCorrections:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WBSFormAutoFillCorrectionSet;
  v8 = [(WBSFormAutoFillCorrectionSet *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    domain = v8->_domain;
    v8->_domain = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    fingerprintsToCorrections = v8->_fingerprintsToCorrections;
    v8->_fingerprintsToCorrections = (NSDictionary *)v11;

    v13 = v8;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WBSFormAutoFillCorrectionSet *)a3;
  if (v4 == self)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      domain = self->_domain;
      uint64_t v7 = [(WBSFormAutoFillCorrectionSet *)v5 domain];
      if (domain == (NSString *)v7)
      {
      }
      else
      {
        v8 = (void *)v7;
        uint64_t v9 = self->_domain;
        v10 = [(WBSFormAutoFillCorrectionSet *)v5 domain];
        LODWORD(v9) = [(NSString *)v9 isEqualToString:v10];

        if (!v9) {
          goto LABEL_11;
        }
      }
      fingerprintsToClassifications = self->_fingerprintsToClassifications;
      uint64_t v13 = [(WBSFormAutoFillCorrectionSet *)v5 fingerprintsToClassifications];
      if (fingerprintsToClassifications == (NSDictionary *)v13)
      {
      }
      else
      {
        v14 = (void *)v13;
        objc_super v15 = self->_fingerprintsToClassifications;
        v16 = [(WBSFormAutoFillCorrectionSet *)v5 fingerprintsToClassifications];
        LODWORD(v15) = [(NSDictionary *)v15 isEqualToDictionary:v16];

        if (!v15)
        {
LABEL_11:
          char v11 = 0;
LABEL_17:

          goto LABEL_18;
        }
      }
      fingerprintsToCorrections = self->_fingerprintsToCorrections;
      v18 = [(WBSFormAutoFillCorrectionSet *)v5 fingerprintsToCorrections];
      if (fingerprintsToCorrections == v18)
      {
        char v11 = 1;
      }
      else
      {
        v19 = self->_fingerprintsToCorrections;
        v20 = [(WBSFormAutoFillCorrectionSet *)v5 fingerprintsToCorrections];
        char v11 = [(NSDictionary *)v19 isEqualToDictionary:v20];
      }
      goto LABEL_17;
    }
    char v11 = 0;
  }
LABEL_18:

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSDictionary *)self->_fingerprintsToClassifications hash];
  return [(NSDictionary *)self->_fingerprintsToCorrections hash] ^ v3;
}

- (NSString)domain
{
  return self->_domain;
}

- (NSDictionary)fingerprintsToClassifications
{
  return self->_fingerprintsToClassifications;
}

- (NSDictionary)fingerprintsToCorrections
{
  return self->_fingerprintsToCorrections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fingerprintsToCorrections, 0);
  objc_storeStrong((id *)&self->_fingerprintsToClassifications, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end