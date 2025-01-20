@interface ULFingerprintMetaInfo
+ (BOOL)supportsSecureCoding;
+ (id)new;
- (BOOL)isEqual:(id)a3;
- (NSArray)errors;
- (NSNumber)numberOfBLESources;
- (NSNumber)numberOfUWBSources;
- (NSNumber)numberOfWiFiAccessPoints;
- (NSUUID)requestIdentifier;
- (ULFingerprintMetaInfo)init;
- (ULFingerprintMetaInfo)initWithCoder:(id)a3;
- (ULFingerprintMetaInfo)initWithNumWiFiAccessPoints:(id)a3 numBLESources:(id)a4 numUWBSources:(id)a5 requestIdentifier:(id)a6 errors:(id)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setErrors:(id)a3;
- (void)setNumberOfBLESources:(id)a3;
- (void)setNumberOfUWBSources:(id)a3;
- (void)setNumberOfWiFiAccessPoints:(id)a3;
- (void)setRequestIdentifier:(id)a3;
@end

@implementation ULFingerprintMetaInfo

- (ULFingerprintMetaInfo)initWithNumWiFiAccessPoints:(id)a3 numBLESources:(id)a4 numUWBSources:(id)a5 requestIdentifier:(id)a6 errors:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)ULFingerprintMetaInfo;
  v17 = [(ULFingerprintMetaInfo *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_numberOfWiFiAccessPoints, a3);
    objc_storeStrong((id *)&v18->_numberOfBLESources, a4);
    objc_storeStrong((id *)&v18->_numberOfUWBSources, a5);
    objc_storeStrong((id *)&v18->_requestIdentifier, a6);
    objc_storeStrong((id *)&v18->_errors, a7);
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  v17 = [(ULFingerprintMetaInfo *)self numberOfWiFiAccessPoints];
  v6 = (void *)[v17 copyWithZone:a3];
  v7 = [(ULFingerprintMetaInfo *)self numberOfBLESources];
  v8 = (void *)[v7 copyWithZone:a3];
  v9 = [(ULFingerprintMetaInfo *)self numberOfUWBSources];
  v10 = (void *)[v9 copyWithZone:a3];
  v11 = [(ULFingerprintMetaInfo *)self requestIdentifier];
  v12 = (void *)[v11 copyWithZone:a3];
  id v13 = [(ULFingerprintMetaInfo *)self errors];
  id v14 = (void *)[v13 copyWithZone:a3];
  id v15 = (void *)[v5 initWithNumWiFiAccessPoints:v6 numBLESources:v8 numUWBSources:v10 requestIdentifier:v12 errors:v14];

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  numberOfWiFiAccessPoints = self->_numberOfWiFiAccessPoints;
  id v5 = a3;
  [v5 encodeObject:numberOfWiFiAccessPoints forKey:@"numberOfWiFiAccessPoints"];
  [v5 encodeObject:self->_numberOfBLESources forKey:@"numberOfBLESources"];
  [v5 encodeObject:self->_numberOfUWBSources forKey:@"numberOfUWBSources"];
  [v5 encodeObject:self->_requestIdentifier forKey:@"requestIdentifier"];
  [v5 encodeObject:self->_errors forKey:@"errors"];
}

- (ULFingerprintMetaInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)ULFingerprintMetaInfo;
  id v5 = [(ULFingerprintMetaInfo *)&v22 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"numberOfWiFiAccessPoints"];
    uint64_t v7 = self;

    numberOfWiFiAccessPoints = v5->_numberOfWiFiAccessPoints;
    v5->_numberOfWiFiAccessPoints = (NSNumber *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"numberOfBLESources"];
    uint64_t v10 = self;

    numberOfBLESources = v5->_numberOfBLESources;
    v5->_numberOfBLESources = (NSNumber *)v10;

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"numberOfUWBSources"];
    uint64_t v13 = self;

    numberOfUWBSources = v5->_numberOfUWBSources;
    v5->_numberOfUWBSources = (NSNumber *)v13;

    id v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestIdentifier"];
    uint64_t v16 = self;

    requestIdentifier = v5->_requestIdentifier;
    v5->_requestIdentifier = (NSUUID *)v16;

    v18 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"errors"];
    if (v18)
    {
      uint64_t v19 = self;

      errors = v5->_errors;
      v5->_errors = (NSArray *)v19;

      v18 = v5;
    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x263F089D8]);
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = (void *)[v3 initWithFormat:@"<%@: ", v5];

  uint64_t v7 = [(ULFingerprintMetaInfo *)self numberOfWiFiAccessPoints];
  [v6 appendFormat:@", numberOfWiFiAccessPoints: %@", v7];

  v8 = [(ULFingerprintMetaInfo *)self numberOfBLESources];
  [v6 appendFormat:@", numberOfBLESources: %@", v8];

  v9 = [(ULFingerprintMetaInfo *)self numberOfUWBSources];
  [v6 appendFormat:@", numberOfUWBSources: %@", v9];

  uint64_t v10 = [(ULFingerprintMetaInfo *)self requestIdentifier];
  [v6 appendFormat:@", requestIdentifier: %@", v10];

  v11 = [(ULFingerprintMetaInfo *)self errors];
  [v6 appendFormat:@", errors: %@", v11];

  [v6 appendString:@">"];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(ULFingerprintMetaInfo *)self numberOfWiFiAccessPoints];
    uint64_t v7 = [v5 numberOfWiFiAccessPoints];
    if ([v6 isEqual:v7])
    {
    }
    else
    {
      v9 = [(ULFingerprintMetaInfo *)self numberOfWiFiAccessPoints];
      uint64_t v10 = [v5 numberOfWiFiAccessPoints];

      if (v9 != v10) {
        goto LABEL_15;
      }
    }
    v11 = [(ULFingerprintMetaInfo *)self numberOfBLESources];
    v12 = [v5 numberOfBLESources];
    if ([v11 isEqual:v12])
    {
    }
    else
    {
      uint64_t v13 = [(ULFingerprintMetaInfo *)self numberOfBLESources];
      id v14 = [v5 numberOfBLESources];

      if (v13 != v14) {
        goto LABEL_15;
      }
    }
    id v15 = [(ULFingerprintMetaInfo *)self numberOfUWBSources];
    uint64_t v16 = [v5 numberOfUWBSources];
    if ([v15 isEqual:v16])
    {
    }
    else
    {
      v17 = [(ULFingerprintMetaInfo *)self numberOfUWBSources];
      v18 = [v5 numberOfUWBSources];

      if (v17 != v18) {
        goto LABEL_15;
      }
    }
    uint64_t v19 = [(ULFingerprintMetaInfo *)self requestIdentifier];
    id v20 = [v5 requestIdentifier];
    if ([v19 isEqual:v20])
    {

      goto LABEL_18;
    }
    objc_super v21 = [(ULFingerprintMetaInfo *)self requestIdentifier];
    objc_super v22 = [v5 requestIdentifier];

    if (v21 == v22)
    {
LABEL_18:
      v24 = [(ULFingerprintMetaInfo *)self errors];
      v25 = [v5 errors];
      if ([v24 isEqual:v25])
      {

        char v8 = 1;
      }
      else
      {
        v26 = [(ULFingerprintMetaInfo *)self errors];
        v27 = [v5 errors];
        BOOL v28 = v26 != v27;

        char v8 = !v28;
      }
      goto LABEL_16;
    }
LABEL_15:
    char v8 = 0;
LABEL_16:

    goto LABEL_17;
  }
  char v8 = 0;
LABEL_17:

  return v8 & 1;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSNumber *)self->_numberOfWiFiAccessPoints hash];
  uint64_t v4 = [(NSNumber *)self->_numberOfBLESources hash] ^ v3;
  uint64_t v5 = [(NSNumber *)self->_numberOfUWBSources hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSUUID *)self->_requestIdentifier hash];
  return v6 ^ [(NSArray *)self->_errors hash];
}

- (ULFingerprintMetaInfo)init
{
}

+ (id)new
{
}

- (NSNumber)numberOfWiFiAccessPoints
{
  return self->_numberOfWiFiAccessPoints;
}

- (void)setNumberOfWiFiAccessPoints:(id)a3
{
}

- (NSNumber)numberOfBLESources
{
  return self->_numberOfBLESources;
}

- (void)setNumberOfBLESources:(id)a3
{
}

- (NSNumber)numberOfUWBSources
{
  return self->_numberOfUWBSources;
}

- (void)setNumberOfUWBSources:(id)a3
{
}

- (NSUUID)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
}

- (NSArray)errors
{
  return self->_errors;
}

- (void)setErrors:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_numberOfUWBSources, 0);
  objc_storeStrong((id *)&self->_numberOfBLESources, 0);

  objc_storeStrong((id *)&self->_numberOfWiFiAccessPoints, 0);
}

@end