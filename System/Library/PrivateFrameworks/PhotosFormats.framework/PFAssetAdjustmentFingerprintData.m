@interface PFAssetAdjustmentFingerprintData
- (NSData)baseImage;
- (NSData)largeAdjustmentData;
- (NSData)secondaryAdjustmentData;
- (NSData)simpleAdjustmentData;
- (NSString)adjustmentCompoundVersion;
- (NSString)adjustmentCreatorCode;
- (NSString)adjustmentType;
- (NSString)baseImageFingerprint;
- (NSString)largeAdjustmentDataFingerprint;
- (unint64_t)adjustmentSourceType;
- (void)setAdjustmentCompoundVersion:(id)a3;
- (void)setAdjustmentCreatorCode:(id)a3;
- (void)setAdjustmentSourceType:(unint64_t)a3;
- (void)setAdjustmentType:(id)a3;
- (void)setBaseImage:(id)a3;
- (void)setBaseImageFingerprint:(id)a3;
- (void)setLargeAdjustmentData:(id)a3;
- (void)setLargeAdjustmentDataFingerprint:(id)a3;
- (void)setSecondaryAdjustmentData:(id)a3;
- (void)setSimpleAdjustmentData:(id)a3;
@end

@implementation PFAssetAdjustmentFingerprintData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryAdjustmentData, 0);
  objc_storeStrong((id *)&self->_largeAdjustmentDataFingerprint, 0);
  objc_storeStrong((id *)&self->_largeAdjustmentData, 0);
  objc_storeStrong((id *)&self->_baseImageFingerprint, 0);
  objc_storeStrong((id *)&self->_baseImage, 0);
  objc_storeStrong((id *)&self->_simpleAdjustmentData, 0);
  objc_storeStrong((id *)&self->_adjustmentCreatorCode, 0);
  objc_storeStrong((id *)&self->_adjustmentCompoundVersion, 0);

  objc_storeStrong((id *)&self->_adjustmentType, 0);
}

- (void)setSecondaryAdjustmentData:(id)a3
{
}

- (NSData)secondaryAdjustmentData
{
  return self->_secondaryAdjustmentData;
}

- (void)setLargeAdjustmentDataFingerprint:(id)a3
{
}

- (NSString)largeAdjustmentDataFingerprint
{
  return self->_largeAdjustmentDataFingerprint;
}

- (void)setLargeAdjustmentData:(id)a3
{
}

- (NSData)largeAdjustmentData
{
  return self->_largeAdjustmentData;
}

- (void)setBaseImageFingerprint:(id)a3
{
}

- (NSString)baseImageFingerprint
{
  return self->_baseImageFingerprint;
}

- (void)setBaseImage:(id)a3
{
}

- (NSData)baseImage
{
  return self->_baseImage;
}

- (void)setSimpleAdjustmentData:(id)a3
{
}

- (NSData)simpleAdjustmentData
{
  return self->_simpleAdjustmentData;
}

- (void)setAdjustmentSourceType:(unint64_t)a3
{
  self->_adjustmentSourceType = a3;
}

- (unint64_t)adjustmentSourceType
{
  return self->_adjustmentSourceType;
}

- (void)setAdjustmentCreatorCode:(id)a3
{
}

- (NSString)adjustmentCreatorCode
{
  return self->_adjustmentCreatorCode;
}

- (void)setAdjustmentCompoundVersion:(id)a3
{
}

- (NSString)adjustmentCompoundVersion
{
  return self->_adjustmentCompoundVersion;
}

- (void)setAdjustmentType:(id)a3
{
}

- (NSString)adjustmentType
{
  return self->_adjustmentType;
}

@end