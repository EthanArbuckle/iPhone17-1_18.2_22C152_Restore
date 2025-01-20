@interface ULServiceMetaInfo
+ (BOOL)supportsSecureCoding;
+ (id)new;
- (BOOL)isEqual:(id)a3;
- (NSNumber)numberOfBLESources;
- (NSNumber)numberOfClustersLearnedInModel;
- (NSNumber)numberOfFingerprintsAfterPruning;
- (NSNumber)numberOfFingerprintsBeforePruning;
- (NSNumber)numberOfInputValidFingerprints;
- (NSNumber)numberOfInputValidFingerprintsLabeled;
- (NSNumber)numberOfInputValidFingerprintsUnLabeled;
- (NSNumber)numberOfRecordingTriggersAtCurrentLocationOfInterest;
- (NSNumber)numberOfUWBSources;
- (NSNumber)numberOfWiFiAccessPoints;
- (ULServiceMetaInfo)init;
- (ULServiceMetaInfo)initWithCoder:(id)a3;
- (ULServiceMetaInfo)initWithNumClustersLearnedInModel:(id)a3 numRecordingTriggersAtCurrentLOI:(id)a4 numInputValidFingerprints:(id)a5 numInputValidFingerprintsLabeled:(id)a6 numInputValidFingerprintsUnlabeled:(id)a7 numFingerprintsBeforePruning:(id)a8 numFingerprintsAfterPruning:(id)a9 numWiFiAccessPoints:(id)a10 numBLESources:(id)a11 numUWBSources:(id)a12;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setNumberOfBLESources:(id)a3;
- (void)setNumberOfClustersLearnedInModel:(id)a3;
- (void)setNumberOfFingerprintsAfterPruning:(id)a3;
- (void)setNumberOfFingerprintsBeforePruning:(id)a3;
- (void)setNumberOfInputValidFingerprints:(id)a3;
- (void)setNumberOfInputValidFingerprintsLabeled:(id)a3;
- (void)setNumberOfInputValidFingerprintsUnLabeled:(id)a3;
- (void)setNumberOfRecordingTriggersAtCurrentLocationOfInterest:(id)a3;
- (void)setNumberOfUWBSources:(id)a3;
- (void)setNumberOfWiFiAccessPoints:(id)a3;
@end

@implementation ULServiceMetaInfo

- (ULServiceMetaInfo)initWithNumClustersLearnedInModel:(id)a3 numRecordingTriggersAtCurrentLOI:(id)a4 numInputValidFingerprints:(id)a5 numInputValidFingerprintsLabeled:(id)a6 numInputValidFingerprintsUnlabeled:(id)a7 numFingerprintsBeforePruning:(id)a8 numFingerprintsAfterPruning:(id)a9 numWiFiAccessPoints:(id)a10 numBLESources:(id)a11 numUWBSources:(id)a12
{
  id v17 = a3;
  id v30 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  id v25 = a12;
  v31.receiver = self;
  v31.super_class = (Class)ULServiceMetaInfo;
  v26 = [(ULServiceMetaInfo *)&v31 init];
  v27 = v26;
  if (v26)
  {
    [(ULServiceMetaInfo *)v26 setNumberOfClustersLearnedInModel:v17];
    [(ULServiceMetaInfo *)v27 setNumberOfRecordingTriggersAtCurrentLocationOfInterest:v30];
    [(ULServiceMetaInfo *)v27 setNumberOfInputValidFingerprints:v18];
    [(ULServiceMetaInfo *)v27 setNumberOfInputValidFingerprintsLabeled:v19];
    [(ULServiceMetaInfo *)v27 setNumberOfInputValidFingerprintsUnLabeled:v20];
    [(ULServiceMetaInfo *)v27 setNumberOfFingerprintsBeforePruning:v21];
    [(ULServiceMetaInfo *)v27 setNumberOfFingerprintsAfterPruning:v22];
    [(ULServiceMetaInfo *)v27 setNumberOfWiFiAccessPoints:v23];
    [(ULServiceMetaInfo *)v27 setNumberOfBLESources:v24];
    [(ULServiceMetaInfo *)v27 setNumberOfUWBSources:v25];
  }

  return v27;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  v6 = (void *)[(NSNumber *)self->_numberOfClustersLearnedInModel copyWithZone:a3];
  v7 = (void *)[(NSNumber *)self->_numberOfRecordingTriggersAtCurrentLocationOfInterest copyWithZone:a3];
  id v17 = (void *)[(NSNumber *)self->_numberOfInputValidFingerprints copyWithZone:a3];
  v16 = (void *)[(NSNumber *)self->_numberOfInputValidFingerprintsLabeled copyWithZone:a3];
  v8 = (void *)[(NSNumber *)self->_numberOfInputValidFingerprintsUnLabeled copyWithZone:a3];
  v9 = (void *)[(NSNumber *)self->_numberOfFingerprintsBeforePruning copyWithZone:a3];
  v10 = (void *)[(NSNumber *)self->_numberOfFingerprintsAfterPruning copyWithZone:a3];
  v11 = (void *)[(NSNumber *)self->_numberOfWiFiAccessPoints copyWithZone:a3];
  v12 = (void *)[(NSNumber *)self->_numberOfBLESources copyWithZone:a3];
  v13 = (void *)[(NSNumber *)self->_numberOfUWBSources copyWithZone:a3];
  v15 = (void *)[v5 initWithNumClustersLearnedInModel:v6 numRecordingTriggersAtCurrentLOI:v7 numInputValidFingerprints:v17 numInputValidFingerprintsLabeled:v16 numInputValidFingerprintsUnlabeled:v8 numFingerprintsBeforePruning:v9 numFingerprintsAfterPruning:v10 numWiFiAccessPoints:v11 numBLESources:v12 numUWBSources:v13];

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  numberOfClustersLearnedInModel = self->_numberOfClustersLearnedInModel;
  id v5 = a3;
  [v5 encodeObject:numberOfClustersLearnedInModel forKey:@"numberOfClustersLearnedInModel"];
  [v5 encodeObject:self->_numberOfRecordingTriggersAtCurrentLocationOfInterest forKey:@"numberOfRecordingTriggersAtCurrentLocationOfInterest"];
  [v5 encodeObject:self->_numberOfInputValidFingerprints forKey:@"numberOfInputValidFingerprints"];
  [v5 encodeObject:self->_numberOfInputValidFingerprintsLabeled forKey:@"numberOfInputValidFingerprintsLabeled"];
  [v5 encodeObject:self->_numberOfInputValidFingerprintsUnLabeled forKey:@"numberOfInputValidFingerprintsUnLabeled"];
  [v5 encodeObject:self->_numberOfFingerprintsBeforePruning forKey:@"numberOfFingerprintsBeforePruning"];
  [v5 encodeObject:self->_numberOfFingerprintsAfterPruning forKey:@"numberOfFingerprintsAfterPruning"];
  [v5 encodeObject:self->_numberOfWiFiAccessPoints forKey:@"numberOfWiFiAccessPoints"];
  [v5 encodeObject:self->_numberOfBLESources forKey:@"numberOfBLESources"];
  [v5 encodeObject:self->_numberOfUWBSources forKey:@"numberOfUWBSources"];
}

- (ULServiceMetaInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)ULServiceMetaInfo;
  id v5 = [(ULServiceMetaInfo *)&v38 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"numberOfClustersLearnedInModel"];
    uint64_t v7 = self;

    numberOfClustersLearnedInModel = v5->_numberOfClustersLearnedInModel;
    v5->_numberOfClustersLearnedInModel = (NSNumber *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"numberOfRecordingTriggersAtCurrentLocationOfInterest"];
    uint64_t v10 = self;

    numberOfRecordingTriggersAtCurrentLocationOfInterest = v5->_numberOfRecordingTriggersAtCurrentLocationOfInterest;
    v5->_numberOfRecordingTriggersAtCurrentLocationOfInterest = (NSNumber *)v10;

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"numberOfInputValidFingerprints"];
    uint64_t v13 = self;

    numberOfInputValidFingerprints = v5->_numberOfInputValidFingerprints;
    v5->_numberOfInputValidFingerprints = (NSNumber *)v13;

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"numberOfInputValidFingerprintsLabeled"];
    uint64_t v16 = self;

    numberOfInputValidFingerprintsLabeled = v5->_numberOfInputValidFingerprintsLabeled;
    v5->_numberOfInputValidFingerprintsLabeled = (NSNumber *)v16;

    id v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"numberOfInputValidFingerprintsUnLabeled"];
    uint64_t v19 = self;

    numberOfInputValidFingerprintsUnLabeled = v5->_numberOfInputValidFingerprintsUnLabeled;
    v5->_numberOfInputValidFingerprintsUnLabeled = (NSNumber *)v19;

    id v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"numberOfFingerprintsBeforePruning"];
    uint64_t v22 = self;

    numberOfFingerprintsBeforePruning = v5->_numberOfFingerprintsBeforePruning;
    v5->_numberOfFingerprintsBeforePruning = (NSNumber *)v22;

    id v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"numberOfFingerprintsAfterPruning"];
    uint64_t v25 = self;

    numberOfFingerprintsAfterPruning = v5->_numberOfFingerprintsAfterPruning;
    v5->_numberOfFingerprintsAfterPruning = (NSNumber *)v25;

    v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"numberOfWiFiAccessPoints"];
    uint64_t v28 = self;

    numberOfWiFiAccessPoints = v5->_numberOfWiFiAccessPoints;
    v5->_numberOfWiFiAccessPoints = (NSNumber *)v28;

    id v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"numberOfBLESources"];
    uint64_t v31 = self;

    numberOfBLESources = v5->_numberOfBLESources;
    v5->_numberOfBLESources = (NSNumber *)v31;

    v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"numberOfUWBSources"];
    uint64_t v34 = self;

    numberOfUWBSources = v5->_numberOfUWBSources;
    v5->_numberOfUWBSources = (NSNumber *)v34;

    v36 = v5;
  }

  return v5;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x263F089D8]);
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = (void *)[v3 initWithFormat:@"<%@: ", v5];

  [v6 appendFormat:@", numberOfClustersLearnedInModel: %@", self->_numberOfClustersLearnedInModel];
  [v6 appendFormat:@", numberOfRecordingTriggersAtCurrentLocationOfInterest: %@", self->_numberOfRecordingTriggersAtCurrentLocationOfInterest];
  [v6 appendFormat:@", numberOfInputValidFingerprints: %@", self->_numberOfInputValidFingerprints];
  [v6 appendFormat:@", numberOfInputValidFingerprintsLabeled: %@", self->_numberOfInputValidFingerprintsLabeled];
  [v6 appendFormat:@", numberOfInputValidFingerprintsUnLabeled: %@", self->_numberOfInputValidFingerprintsUnLabeled];
  [v6 appendFormat:@", numberOfFingerprintsBeforePruning: %@", self->_numberOfFingerprintsBeforePruning];
  [v6 appendFormat:@", numberOfFingerprintsAfterPruning: %@", self->_numberOfFingerprintsAfterPruning];
  [v6 appendFormat:@", numberOfWiFiAccessPoints: %@", self->_numberOfWiFiAccessPoints];
  [v6 appendFormat:@", numberOfBLESources: %@", self->_numberOfBLESources];
  [v6 appendFormat:@", numberOfUWBSources: %@", self->_numberOfUWBSources];
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
    v6 = [(ULServiceMetaInfo *)self numberOfClustersLearnedInModel];
    uint64_t v7 = [v5 numberOfClustersLearnedInModel];
    if ([v6 isEqual:v7])
    {
    }
    else
    {
      v9 = [(ULServiceMetaInfo *)self numberOfClustersLearnedInModel];
      uint64_t v10 = [v5 numberOfClustersLearnedInModel];

      if (v9 != v10) {
        goto LABEL_30;
      }
    }
    v11 = [(ULServiceMetaInfo *)self numberOfRecordingTriggersAtCurrentLocationOfInterest];
    v12 = [v5 numberOfRecordingTriggersAtCurrentLocationOfInterest];
    if ([v11 isEqual:v12])
    {
    }
    else
    {
      uint64_t v13 = [(ULServiceMetaInfo *)self numberOfRecordingTriggersAtCurrentLocationOfInterest];
      v14 = [v5 numberOfRecordingTriggersAtCurrentLocationOfInterest];

      if (v13 != v14) {
        goto LABEL_30;
      }
    }
    v15 = [(ULServiceMetaInfo *)self numberOfInputValidFingerprints];
    uint64_t v16 = [v5 numberOfInputValidFingerprints];
    if ([v15 isEqual:v16])
    {
    }
    else
    {
      id v17 = [(ULServiceMetaInfo *)self numberOfInputValidFingerprints];
      id v18 = [v5 numberOfInputValidFingerprints];

      if (v17 != v18) {
        goto LABEL_30;
      }
    }
    uint64_t v19 = [(ULServiceMetaInfo *)self numberOfInputValidFingerprintsLabeled];
    id v20 = [v5 numberOfInputValidFingerprintsLabeled];
    if ([v19 isEqual:v20])
    {
    }
    else
    {
      id v21 = [(ULServiceMetaInfo *)self numberOfInputValidFingerprintsLabeled];
      uint64_t v22 = [v5 numberOfInputValidFingerprintsLabeled];

      if (v21 != v22) {
        goto LABEL_30;
      }
    }
    id v23 = [(ULServiceMetaInfo *)self numberOfInputValidFingerprintsUnLabeled];
    id v24 = [v5 numberOfInputValidFingerprintsUnLabeled];
    if ([v23 isEqual:v24])
    {
    }
    else
    {
      uint64_t v25 = [(ULServiceMetaInfo *)self numberOfInputValidFingerprintsUnLabeled];
      v26 = [v5 numberOfInputValidFingerprintsUnLabeled];

      if (v25 != v26) {
        goto LABEL_30;
      }
    }
    v27 = [(ULServiceMetaInfo *)self numberOfFingerprintsBeforePruning];
    uint64_t v28 = [v5 numberOfFingerprintsBeforePruning];
    if ([v27 isEqual:v28])
    {
    }
    else
    {
      v29 = [(ULServiceMetaInfo *)self numberOfFingerprintsBeforePruning];
      id v30 = [v5 numberOfFingerprintsBeforePruning];

      if (v29 != v30) {
        goto LABEL_30;
      }
    }
    uint64_t v31 = [(ULServiceMetaInfo *)self numberOfFingerprintsAfterPruning];
    v32 = [v5 numberOfFingerprintsAfterPruning];
    if ([v31 isEqual:v32])
    {
    }
    else
    {
      v33 = [(ULServiceMetaInfo *)self numberOfFingerprintsAfterPruning];
      uint64_t v34 = [v5 numberOfFingerprintsAfterPruning];

      if (v33 != v34) {
        goto LABEL_30;
      }
    }
    v35 = [(ULServiceMetaInfo *)self numberOfWiFiAccessPoints];
    v36 = [v5 numberOfWiFiAccessPoints];
    if ([v35 isEqual:v36])
    {
    }
    else
    {
      v37 = [(ULServiceMetaInfo *)self numberOfWiFiAccessPoints];
      objc_super v38 = [v5 numberOfWiFiAccessPoints];

      if (v37 != v38) {
        goto LABEL_30;
      }
    }
    v39 = [(ULServiceMetaInfo *)self numberOfBLESources];
    v40 = [v5 numberOfBLESources];
    if ([v39 isEqual:v40])
    {

      goto LABEL_33;
    }
    v41 = [(ULServiceMetaInfo *)self numberOfBLESources];
    v42 = [v5 numberOfBLESources];

    if (v41 == v42)
    {
LABEL_33:
      v44 = [(ULServiceMetaInfo *)self numberOfUWBSources];
      v45 = [v5 numberOfUWBSources];
      if ([v44 isEqual:v45])
      {

        char v8 = 1;
      }
      else
      {
        v46 = [(ULServiceMetaInfo *)self numberOfUWBSources];
        v47 = [v5 numberOfUWBSources];
        BOOL v48 = v46 != v47;

        char v8 = !v48;
      }
      goto LABEL_31;
    }
LABEL_30:
    char v8 = 0;
LABEL_31:

    goto LABEL_32;
  }
  char v8 = 0;
LABEL_32:

  return v8 & 1;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSNumber *)self->_numberOfClustersLearnedInModel hash];
  uint64_t v4 = [(NSNumber *)self->_numberOfRecordingTriggersAtCurrentLocationOfInterest hash] ^ v3;
  uint64_t v5 = [(NSNumber *)self->_numberOfInputValidFingerprints hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSNumber *)self->_numberOfInputValidFingerprintsLabeled hash];
  uint64_t v7 = [(NSNumber *)self->_numberOfInputValidFingerprintsUnLabeled hash];
  uint64_t v8 = v7 ^ [(NSNumber *)self->_numberOfFingerprintsBeforePruning hash];
  uint64_t v9 = v6 ^ v8 ^ [(NSNumber *)self->_numberOfFingerprintsAfterPruning hash];
  uint64_t v10 = [(NSNumber *)self->_numberOfWiFiAccessPoints hash];
  uint64_t v11 = v10 ^ [(NSNumber *)self->_numberOfBLESources hash];
  return v9 ^ v11 ^ [(NSNumber *)self->_numberOfUWBSources hash];
}

- (ULServiceMetaInfo)init
{
}

+ (id)new
{
}

- (NSNumber)numberOfClustersLearnedInModel
{
  return self->_numberOfClustersLearnedInModel;
}

- (void)setNumberOfClustersLearnedInModel:(id)a3
{
}

- (NSNumber)numberOfRecordingTriggersAtCurrentLocationOfInterest
{
  return self->_numberOfRecordingTriggersAtCurrentLocationOfInterest;
}

- (void)setNumberOfRecordingTriggersAtCurrentLocationOfInterest:(id)a3
{
}

- (NSNumber)numberOfInputValidFingerprints
{
  return self->_numberOfInputValidFingerprints;
}

- (void)setNumberOfInputValidFingerprints:(id)a3
{
}

- (NSNumber)numberOfInputValidFingerprintsLabeled
{
  return self->_numberOfInputValidFingerprintsLabeled;
}

- (void)setNumberOfInputValidFingerprintsLabeled:(id)a3
{
}

- (NSNumber)numberOfInputValidFingerprintsUnLabeled
{
  return self->_numberOfInputValidFingerprintsUnLabeled;
}

- (void)setNumberOfInputValidFingerprintsUnLabeled:(id)a3
{
}

- (NSNumber)numberOfFingerprintsBeforePruning
{
  return self->_numberOfFingerprintsBeforePruning;
}

- (void)setNumberOfFingerprintsBeforePruning:(id)a3
{
}

- (NSNumber)numberOfFingerprintsAfterPruning
{
  return self->_numberOfFingerprintsAfterPruning;
}

- (void)setNumberOfFingerprintsAfterPruning:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberOfUWBSources, 0);
  objc_storeStrong((id *)&self->_numberOfBLESources, 0);
  objc_storeStrong((id *)&self->_numberOfWiFiAccessPoints, 0);
  objc_storeStrong((id *)&self->_numberOfFingerprintsAfterPruning, 0);
  objc_storeStrong((id *)&self->_numberOfFingerprintsBeforePruning, 0);
  objc_storeStrong((id *)&self->_numberOfInputValidFingerprintsUnLabeled, 0);
  objc_storeStrong((id *)&self->_numberOfInputValidFingerprintsLabeled, 0);
  objc_storeStrong((id *)&self->_numberOfInputValidFingerprints, 0);
  objc_storeStrong((id *)&self->_numberOfRecordingTriggersAtCurrentLocationOfInterest, 0);

  objc_storeStrong((id *)&self->_numberOfClustersLearnedInModel, 0);
}

@end