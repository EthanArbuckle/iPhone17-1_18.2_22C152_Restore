@interface AWDBiometricKitEnrollAttempt
- (BOOL)failedNoFace;
- (BOOL)hasAmbientLux;
- (BOOL)hasBioCaptureSequenceCount;
- (BOOL)hasCameraErr;
- (BOOL)hasDeviceOrientation;
- (BOOL)hasDoubleErrorCountsBinCovered;
- (BOOL)hasDoubleErrorCountsFaceOutOfFOV;
- (BOOL)hasDoubleErrorCountsFaceTooClose;
- (BOOL)hasDoubleErrorCountsFaceTooFar;
- (BOOL)hasDoubleErrorCountsLowerFaceOccluded;
- (BOOL)hasDoubleErrorCountsMoreFrames;
- (BOOL)hasDoubleErrorCountsMultipleFaces;
- (BOOL)hasDoubleErrorCountsNoFace;
- (BOOL)hasDoubleErrorCountsOK;
- (BOOL)hasDoubleErrorCountsOccluded;
- (BOOL)hasDoubleErrorCountsPoseOutRange;
- (BOOL)hasDoubleErrorCountsUpperFaceOccluded;
- (BOOL)hasEnrollFeatureVectorError;
- (BOOL)hasEnrollResult;
- (BOOL)hasEnrollType;
- (BOOL)hasEnrolledIdentityCount;
- (BOOL)hasEnrolledTemplateCountTotal;
- (BOOL)hasEnrolledTemplateCountType0;
- (BOOL)hasEnrolledTemplateCountType1;
- (BOOL)hasFaceDistance;
- (BOOL)hasFailedNoFace;
- (BOOL)hasFeatureGenerationError;
- (BOOL)hasFrameCountBin00;
- (BOOL)hasFrameCountBin01;
- (BOOL)hasFrameCountBin02;
- (BOOL)hasFrameCountBin10;
- (BOOL)hasFrameCountBin11;
- (BOOL)hasFrameCountBin12;
- (BOOL)hasFrameCountBin20;
- (BOOL)hasFrameCountBin21;
- (BOOL)hasFrameCountBin22;
- (BOOL)hasFrameErrorCountsBinCovered;
- (BOOL)hasFrameErrorCountsFaceOutOfFOV;
- (BOOL)hasFrameErrorCountsFaceTooClose;
- (BOOL)hasFrameErrorCountsFaceTooFar;
- (BOOL)hasFrameErrorCountsLowerFaceOccluded;
- (BOOL)hasFrameErrorCountsMoreFrames;
- (BOOL)hasFrameErrorCountsMultipleFaces;
- (BOOL)hasFrameErrorCountsNoFace;
- (BOOL)hasFrameErrorCountsOK;
- (BOOL)hasFrameErrorCountsOccluded;
- (BOOL)hasFrameErrorCountsPoseOutRange;
- (BOOL)hasFrameErrorCountsUpperFaceOccluded;
- (BOOL)hasNoseAndMouthOccluded;
- (BOOL)hasOverallResult;
- (BOOL)hasOverallTime;
- (BOOL)hasRfcFrameIndex;
- (BOOL)hasRfcSetIndex;
- (BOOL)hasSensorTemperature;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)noseAndMouthOccluded;
- (BOOL)overallResult;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)ambientLux;
- (int)cameraErr;
- (int)frameCountBin00;
- (int)frameCountBin01;
- (int)frameCountBin02;
- (int)frameCountBin10;
- (int)frameCountBin11;
- (int)frameCountBin12;
- (int)frameCountBin20;
- (int)frameCountBin21;
- (int)frameCountBin22;
- (int)sensorTemperature;
- (int64_t)rfcFrameIndex;
- (int64_t)rfcSetIndex;
- (unint64_t)hash;
- (unint64_t)overallTime;
- (unint64_t)timestamp;
- (unsigned)bioCaptureSequenceCount;
- (unsigned)deviceOrientation;
- (unsigned)doubleErrorCountsBinCovered;
- (unsigned)doubleErrorCountsFaceOutOfFOV;
- (unsigned)doubleErrorCountsFaceTooClose;
- (unsigned)doubleErrorCountsFaceTooFar;
- (unsigned)doubleErrorCountsLowerFaceOccluded;
- (unsigned)doubleErrorCountsMoreFrames;
- (unsigned)doubleErrorCountsMultipleFaces;
- (unsigned)doubleErrorCountsNoFace;
- (unsigned)doubleErrorCountsOK;
- (unsigned)doubleErrorCountsOccluded;
- (unsigned)doubleErrorCountsPoseOutRange;
- (unsigned)doubleErrorCountsUpperFaceOccluded;
- (unsigned)enrollFeatureVectorError;
- (unsigned)enrollResult;
- (unsigned)enrollType;
- (unsigned)enrolledIdentityCount;
- (unsigned)enrolledTemplateCountTotal;
- (unsigned)enrolledTemplateCountType0;
- (unsigned)enrolledTemplateCountType1;
- (unsigned)faceDistance;
- (unsigned)featureGenerationError;
- (unsigned)frameErrorCountsBinCovered;
- (unsigned)frameErrorCountsFaceOutOfFOV;
- (unsigned)frameErrorCountsFaceTooClose;
- (unsigned)frameErrorCountsFaceTooFar;
- (unsigned)frameErrorCountsLowerFaceOccluded;
- (unsigned)frameErrorCountsMoreFrames;
- (unsigned)frameErrorCountsMultipleFaces;
- (unsigned)frameErrorCountsNoFace;
- (unsigned)frameErrorCountsOK;
- (unsigned)frameErrorCountsOccluded;
- (unsigned)frameErrorCountsPoseOutRange;
- (unsigned)frameErrorCountsUpperFaceOccluded;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAmbientLux:(int)a3;
- (void)setBioCaptureSequenceCount:(unsigned int)a3;
- (void)setCameraErr:(int)a3;
- (void)setDeviceOrientation:(unsigned int)a3;
- (void)setDoubleErrorCountsBinCovered:(unsigned int)a3;
- (void)setDoubleErrorCountsFaceOutOfFOV:(unsigned int)a3;
- (void)setDoubleErrorCountsFaceTooClose:(unsigned int)a3;
- (void)setDoubleErrorCountsFaceTooFar:(unsigned int)a3;
- (void)setDoubleErrorCountsLowerFaceOccluded:(unsigned int)a3;
- (void)setDoubleErrorCountsMoreFrames:(unsigned int)a3;
- (void)setDoubleErrorCountsMultipleFaces:(unsigned int)a3;
- (void)setDoubleErrorCountsNoFace:(unsigned int)a3;
- (void)setDoubleErrorCountsOK:(unsigned int)a3;
- (void)setDoubleErrorCountsOccluded:(unsigned int)a3;
- (void)setDoubleErrorCountsPoseOutRange:(unsigned int)a3;
- (void)setDoubleErrorCountsUpperFaceOccluded:(unsigned int)a3;
- (void)setEnrollFeatureVectorError:(unsigned int)a3;
- (void)setEnrollResult:(unsigned int)a3;
- (void)setEnrollType:(unsigned int)a3;
- (void)setEnrolledIdentityCount:(unsigned int)a3;
- (void)setEnrolledTemplateCountTotal:(unsigned int)a3;
- (void)setEnrolledTemplateCountType0:(unsigned int)a3;
- (void)setEnrolledTemplateCountType1:(unsigned int)a3;
- (void)setFaceDistance:(unsigned int)a3;
- (void)setFailedNoFace:(BOOL)a3;
- (void)setFeatureGenerationError:(unsigned int)a3;
- (void)setFrameCountBin00:(int)a3;
- (void)setFrameCountBin01:(int)a3;
- (void)setFrameCountBin02:(int)a3;
- (void)setFrameCountBin10:(int)a3;
- (void)setFrameCountBin11:(int)a3;
- (void)setFrameCountBin12:(int)a3;
- (void)setFrameCountBin20:(int)a3;
- (void)setFrameCountBin21:(int)a3;
- (void)setFrameCountBin22:(int)a3;
- (void)setFrameErrorCountsBinCovered:(unsigned int)a3;
- (void)setFrameErrorCountsFaceOutOfFOV:(unsigned int)a3;
- (void)setFrameErrorCountsFaceTooClose:(unsigned int)a3;
- (void)setFrameErrorCountsFaceTooFar:(unsigned int)a3;
- (void)setFrameErrorCountsLowerFaceOccluded:(unsigned int)a3;
- (void)setFrameErrorCountsMoreFrames:(unsigned int)a3;
- (void)setFrameErrorCountsMultipleFaces:(unsigned int)a3;
- (void)setFrameErrorCountsNoFace:(unsigned int)a3;
- (void)setFrameErrorCountsOK:(unsigned int)a3;
- (void)setFrameErrorCountsOccluded:(unsigned int)a3;
- (void)setFrameErrorCountsPoseOutRange:(unsigned int)a3;
- (void)setFrameErrorCountsUpperFaceOccluded:(unsigned int)a3;
- (void)setHasAmbientLux:(BOOL)a3;
- (void)setHasBioCaptureSequenceCount:(BOOL)a3;
- (void)setHasCameraErr:(BOOL)a3;
- (void)setHasDeviceOrientation:(BOOL)a3;
- (void)setHasDoubleErrorCountsBinCovered:(BOOL)a3;
- (void)setHasDoubleErrorCountsFaceOutOfFOV:(BOOL)a3;
- (void)setHasDoubleErrorCountsFaceTooClose:(BOOL)a3;
- (void)setHasDoubleErrorCountsFaceTooFar:(BOOL)a3;
- (void)setHasDoubleErrorCountsLowerFaceOccluded:(BOOL)a3;
- (void)setHasDoubleErrorCountsMoreFrames:(BOOL)a3;
- (void)setHasDoubleErrorCountsMultipleFaces:(BOOL)a3;
- (void)setHasDoubleErrorCountsNoFace:(BOOL)a3;
- (void)setHasDoubleErrorCountsOK:(BOOL)a3;
- (void)setHasDoubleErrorCountsOccluded:(BOOL)a3;
- (void)setHasDoubleErrorCountsPoseOutRange:(BOOL)a3;
- (void)setHasDoubleErrorCountsUpperFaceOccluded:(BOOL)a3;
- (void)setHasEnrollFeatureVectorError:(BOOL)a3;
- (void)setHasEnrollResult:(BOOL)a3;
- (void)setHasEnrollType:(BOOL)a3;
- (void)setHasEnrolledIdentityCount:(BOOL)a3;
- (void)setHasEnrolledTemplateCountTotal:(BOOL)a3;
- (void)setHasEnrolledTemplateCountType0:(BOOL)a3;
- (void)setHasEnrolledTemplateCountType1:(BOOL)a3;
- (void)setHasFaceDistance:(BOOL)a3;
- (void)setHasFailedNoFace:(BOOL)a3;
- (void)setHasFeatureGenerationError:(BOOL)a3;
- (void)setHasFrameCountBin00:(BOOL)a3;
- (void)setHasFrameCountBin01:(BOOL)a3;
- (void)setHasFrameCountBin02:(BOOL)a3;
- (void)setHasFrameCountBin10:(BOOL)a3;
- (void)setHasFrameCountBin11:(BOOL)a3;
- (void)setHasFrameCountBin12:(BOOL)a3;
- (void)setHasFrameCountBin20:(BOOL)a3;
- (void)setHasFrameCountBin21:(BOOL)a3;
- (void)setHasFrameCountBin22:(BOOL)a3;
- (void)setHasFrameErrorCountsBinCovered:(BOOL)a3;
- (void)setHasFrameErrorCountsFaceOutOfFOV:(BOOL)a3;
- (void)setHasFrameErrorCountsFaceTooClose:(BOOL)a3;
- (void)setHasFrameErrorCountsFaceTooFar:(BOOL)a3;
- (void)setHasFrameErrorCountsLowerFaceOccluded:(BOOL)a3;
- (void)setHasFrameErrorCountsMoreFrames:(BOOL)a3;
- (void)setHasFrameErrorCountsMultipleFaces:(BOOL)a3;
- (void)setHasFrameErrorCountsNoFace:(BOOL)a3;
- (void)setHasFrameErrorCountsOK:(BOOL)a3;
- (void)setHasFrameErrorCountsOccluded:(BOOL)a3;
- (void)setHasFrameErrorCountsPoseOutRange:(BOOL)a3;
- (void)setHasFrameErrorCountsUpperFaceOccluded:(BOOL)a3;
- (void)setHasNoseAndMouthOccluded:(BOOL)a3;
- (void)setHasOverallResult:(BOOL)a3;
- (void)setHasOverallTime:(BOOL)a3;
- (void)setHasRfcFrameIndex:(BOOL)a3;
- (void)setHasRfcSetIndex:(BOOL)a3;
- (void)setHasSensorTemperature:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setNoseAndMouthOccluded:(BOOL)a3;
- (void)setOverallResult:(BOOL)a3;
- (void)setOverallTime:(unint64_t)a3;
- (void)setRfcFrameIndex:(int64_t)a3;
- (void)setRfcSetIndex:(int64_t)a3;
- (void)setSensorTemperature:(int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDBiometricKitEnrollAttempt

- (void)setTimestamp:(unint64_t)a3
{
  *(void *)&self->_has |= 8uLL;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  uint64_t v3 = 8;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($235F0C9EAE0F8725BD941307083BE7CC)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setOverallResult:(BOOL)a3
{
  *(void *)&self->_has |= 0x20000000000000uLL;
  self->_overallResult = a3;
}

- (void)setHasOverallResult:(BOOL)a3
{
  uint64_t v3 = 0x20000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($235F0C9EAE0F8725BD941307083BE7CC)(*(void *)&self->_has & 0xFFDFFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasOverallResult
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 5) & 1;
}

- (void)setOverallTime:(unint64_t)a3
{
  *(void *)&self->_has |= 1uLL;
  self->_overallTime = a3;
}

- (void)setHasOverallTime:(BOOL)a3
{
  self->_has = ($235F0C9EAE0F8725BD941307083BE7CC)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)hasOverallTime
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setDoubleErrorCountsOK:(unsigned int)a3
{
  *(void *)&self->_has |= 0x10000uLL;
  self->_doubleErrorCountsOK = a3;
}

- (void)setHasDoubleErrorCountsOK:(BOOL)a3
{
  uint64_t v3 = 0x10000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($235F0C9EAE0F8725BD941307083BE7CC)(*(void *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasDoubleErrorCountsOK
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setDoubleErrorCountsMoreFrames:(unsigned int)a3
{
  *(void *)&self->_has |= 0x2000uLL;
  self->_doubleErrorCountsMoreFrames = a3;
}

- (void)setHasDoubleErrorCountsMoreFrames:(BOOL)a3
{
  uint64_t v3 = 0x2000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($235F0C9EAE0F8725BD941307083BE7CC)(*(void *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasDoubleErrorCountsMoreFrames
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setDoubleErrorCountsNoFace:(unsigned int)a3
{
  *(void *)&self->_has |= 0x8000uLL;
  self->_doubleErrorCountsNoFace = a3;
}

- (void)setHasDoubleErrorCountsNoFace:(BOOL)a3
{
  uint64_t v3 = 0x8000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($235F0C9EAE0F8725BD941307083BE7CC)(*(void *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasDoubleErrorCountsNoFace
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setDoubleErrorCountsFaceOutOfFOV:(unsigned int)a3
{
  *(void *)&self->_has |= 0x200uLL;
  self->_doubleErrorCountsFaceOutOfFOV = a3;
}

- (void)setHasDoubleErrorCountsFaceOutOfFOV:(BOOL)a3
{
  uint64_t v3 = 512;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($235F0C9EAE0F8725BD941307083BE7CC)(*(void *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasDoubleErrorCountsFaceOutOfFOV
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setDoubleErrorCountsMultipleFaces:(unsigned int)a3
{
  *(void *)&self->_has |= 0x4000uLL;
  self->_doubleErrorCountsMultipleFaces = a3;
}

- (void)setHasDoubleErrorCountsMultipleFaces:(BOOL)a3
{
  uint64_t v3 = 0x4000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($235F0C9EAE0F8725BD941307083BE7CC)(*(void *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasDoubleErrorCountsMultipleFaces
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setDoubleErrorCountsFaceTooClose:(unsigned int)a3
{
  *(void *)&self->_has |= 0x400uLL;
  self->_doubleErrorCountsFaceTooClose = a3;
}

- (void)setHasDoubleErrorCountsFaceTooClose:(BOOL)a3
{
  uint64_t v3 = 1024;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($235F0C9EAE0F8725BD941307083BE7CC)(*(void *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasDoubleErrorCountsFaceTooClose
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setDoubleErrorCountsFaceTooFar:(unsigned int)a3
{
  *(void *)&self->_has |= 0x800uLL;
  self->_doubleErrorCountsFaceTooFar = a3;
}

- (void)setHasDoubleErrorCountsFaceTooFar:(BOOL)a3
{
  uint64_t v3 = 2048;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($235F0C9EAE0F8725BD941307083BE7CC)(*(void *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasDoubleErrorCountsFaceTooFar
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setDoubleErrorCountsPoseOutRange:(unsigned int)a3
{
  *(void *)&self->_has |= 0x40000uLL;
  self->_doubleErrorCountsPoseOutRange = a3;
}

- (void)setHasDoubleErrorCountsPoseOutRange:(BOOL)a3
{
  uint64_t v3 = 0x40000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($235F0C9EAE0F8725BD941307083BE7CC)(*(void *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasDoubleErrorCountsPoseOutRange
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setDoubleErrorCountsBinCovered:(unsigned int)a3
{
  *(void *)&self->_has |= 0x100uLL;
  self->_doubleErrorCountsBinCovered = a3;
}

- (void)setHasDoubleErrorCountsBinCovered:(BOOL)a3
{
  uint64_t v3 = 256;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($235F0C9EAE0F8725BD941307083BE7CC)(*(void *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasDoubleErrorCountsBinCovered
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setDoubleErrorCountsOccluded:(unsigned int)a3
{
  *(void *)&self->_has |= 0x20000uLL;
  self->_doubleErrorCountsOccluded = a3;
}

- (void)setHasDoubleErrorCountsOccluded:(BOOL)a3
{
  uint64_t v3 = 0x20000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($235F0C9EAE0F8725BD941307083BE7CC)(*(void *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasDoubleErrorCountsOccluded
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setFrameErrorCountsOK:(unsigned int)a3
{
  *(void *)&self->_has |= 0x400000000000uLL;
  self->_frameErrorCountsOK = a3;
}

- (void)setHasFrameErrorCountsOK:(BOOL)a3
{
  uint64_t v3 = 0x400000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($235F0C9EAE0F8725BD941307083BE7CC)(*(void *)&self->_has & 0xFFFFBFFFFFFFFFFFLL | v3);
}

- (BOOL)hasFrameErrorCountsOK
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 6) & 1;
}

- (void)setFrameErrorCountsMoreFrames:(unsigned int)a3
{
  *(void *)&self->_has |= 0x80000000000uLL;
  self->_frameErrorCountsMoreFrames = a3;
}

- (void)setHasFrameErrorCountsMoreFrames:(BOOL)a3
{
  uint64_t v3 = 0x80000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($235F0C9EAE0F8725BD941307083BE7CC)(*(void *)&self->_has & 0xFFFFF7FFFFFFFFFFLL | v3);
}

- (BOOL)hasFrameErrorCountsMoreFrames
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 3) & 1;
}

- (void)setFrameErrorCountsNoFace:(unsigned int)a3
{
  *(void *)&self->_has |= 0x200000000000uLL;
  self->_frameErrorCountsNoFace = a3;
}

- (void)setHasFrameErrorCountsNoFace:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($235F0C9EAE0F8725BD941307083BE7CC)(*(void *)&self->_has & 0xFFFFDFFFFFFFFFFFLL | v3);
}

- (BOOL)hasFrameErrorCountsNoFace
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 5) & 1;
}

- (void)setFrameErrorCountsFaceOutOfFOV:(unsigned int)a3
{
  *(void *)&self->_has |= 0x8000000000uLL;
  self->_frameErrorCountsFaceOutOfFOV = a3;
}

- (void)setHasFrameErrorCountsFaceOutOfFOV:(BOOL)a3
{
  uint64_t v3 = 0x8000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($235F0C9EAE0F8725BD941307083BE7CC)(*(void *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3);
}

- (BOOL)hasFrameErrorCountsFaceOutOfFOV
{
  return *((unsigned __int8 *)&self->_has + 4) >> 7;
}

- (void)setFrameErrorCountsMultipleFaces:(unsigned int)a3
{
  *(void *)&self->_has |= 0x100000000000uLL;
  self->_frameErrorCountsMultipleFaces = a3;
}

- (void)setHasFrameErrorCountsMultipleFaces:(BOOL)a3
{
  uint64_t v3 = 0x100000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($235F0C9EAE0F8725BD941307083BE7CC)(*(void *)&self->_has & 0xFFFFEFFFFFFFFFFFLL | v3);
}

- (BOOL)hasFrameErrorCountsMultipleFaces
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 4) & 1;
}

- (void)setFrameErrorCountsFaceTooClose:(unsigned int)a3
{
  *(void *)&self->_has |= 0x10000000000uLL;
  self->_frameErrorCountsFaceTooClose = a3;
}

- (void)setHasFrameErrorCountsFaceTooClose:(BOOL)a3
{
  uint64_t v3 = 0x10000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($235F0C9EAE0F8725BD941307083BE7CC)(*(void *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3);
}

- (BOOL)hasFrameErrorCountsFaceTooClose
{
  return *((unsigned char *)&self->_has + 5) & 1;
}

- (void)setFrameErrorCountsFaceTooFar:(unsigned int)a3
{
  *(void *)&self->_has |= 0x20000000000uLL;
  self->_frameErrorCountsFaceTooFar = a3;
}

- (void)setHasFrameErrorCountsFaceTooFar:(BOOL)a3
{
  uint64_t v3 = 0x20000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($235F0C9EAE0F8725BD941307083BE7CC)(*(void *)&self->_has & 0xFFFFFDFFFFFFFFFFLL | v3);
}

- (BOOL)hasFrameErrorCountsFaceTooFar
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 1) & 1;
}

- (void)setFrameErrorCountsPoseOutRange:(unsigned int)a3
{
  *(void *)&self->_has |= 0x1000000000000uLL;
  self->_frameErrorCountsPoseOutRange = a3;
}

- (void)setHasFrameErrorCountsPoseOutRange:(BOOL)a3
{
  uint64_t v3 = 0x1000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($235F0C9EAE0F8725BD941307083BE7CC)(*(void *)&self->_has & 0xFFFEFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasFrameErrorCountsPoseOutRange
{
  return *((unsigned char *)&self->_has + 6) & 1;
}

- (void)setFrameErrorCountsBinCovered:(unsigned int)a3
{
  *(void *)&self->_has |= 0x4000000000uLL;
  self->_frameErrorCountsBinCovered = a3;
}

- (void)setHasFrameErrorCountsBinCovered:(BOOL)a3
{
  uint64_t v3 = 0x4000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($235F0C9EAE0F8725BD941307083BE7CC)(*(void *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3);
}

- (BOOL)hasFrameErrorCountsBinCovered
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 6) & 1;
}

- (void)setFrameErrorCountsOccluded:(unsigned int)a3
{
  *(void *)&self->_has |= 0x800000000000uLL;
  self->_frameErrorCountsOccluded = a3;
}

- (void)setHasFrameErrorCountsOccluded:(BOOL)a3
{
  uint64_t v3 = 0x800000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($235F0C9EAE0F8725BD941307083BE7CC)(*(void *)&self->_has & 0xFFFF7FFFFFFFFFFFLL | v3);
}

- (BOOL)hasFrameErrorCountsOccluded
{
  return *((unsigned __int8 *)&self->_has + 5) >> 7;
}

- (void)setFrameCountBin00:(int)a3
{
  *(void *)&self->_has |= 0x20000000uLL;
  self->_frameCountBin00 = a3;
}

- (void)setHasFrameCountBin00:(BOOL)a3
{
  uint64_t v3 = 0x20000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($235F0C9EAE0F8725BD941307083BE7CC)(*(void *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasFrameCountBin00
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setFrameCountBin01:(int)a3
{
  *(void *)&self->_has |= 0x40000000uLL;
  self->_frameCountBin01 = a3;
}

- (void)setHasFrameCountBin01:(BOOL)a3
{
  uint64_t v3 = 0x40000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($235F0C9EAE0F8725BD941307083BE7CC)(*(void *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)hasFrameCountBin01
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setFrameCountBin02:(int)a3
{
  *(void *)&self->_has |= 0x80000000uLL;
  self->_frameCountBin02 = a3;
}

- (void)setHasFrameCountBin02:(BOOL)a3
{
  uint64_t v3 = 0x80000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($235F0C9EAE0F8725BD941307083BE7CC)(*(void *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (BOOL)hasFrameCountBin02
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (void)setFrameCountBin10:(int)a3
{
  *(void *)&self->_has |= 0x100000000uLL;
  self->_frameCountBin10 = a3;
}

- (void)setHasFrameCountBin10:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($235F0C9EAE0F8725BD941307083BE7CC)(*(void *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (BOOL)hasFrameCountBin10
{
  return *((unsigned char *)&self->_has + 4) & 1;
}

- (void)setFrameCountBin11:(int)a3
{
  *(void *)&self->_has |= 0x200000000uLL;
  self->_frameCountBin11 = a3;
}

- (void)setHasFrameCountBin11:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($235F0C9EAE0F8725BD941307083BE7CC)(*(void *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (BOOL)hasFrameCountBin11
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (void)setFrameCountBin12:(int)a3
{
  *(void *)&self->_has |= 0x400000000uLL;
  self->_frameCountBin12 = a3;
}

- (void)setHasFrameCountBin12:(BOOL)a3
{
  uint64_t v3 = 0x400000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($235F0C9EAE0F8725BD941307083BE7CC)(*(void *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (BOOL)hasFrameCountBin12
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (void)setFrameCountBin20:(int)a3
{
  *(void *)&self->_has |= 0x800000000uLL;
  self->_frameCountBin20 = a3;
}

- (void)setHasFrameCountBin20:(BOOL)a3
{
  uint64_t v3 = 0x800000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($235F0C9EAE0F8725BD941307083BE7CC)(*(void *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3);
}

- (BOOL)hasFrameCountBin20
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 3) & 1;
}

- (void)setFrameCountBin21:(int)a3
{
  *(void *)&self->_has |= 0x1000000000uLL;
  self->_frameCountBin21 = a3;
}

- (void)setHasFrameCountBin21:(BOOL)a3
{
  uint64_t v3 = 0x1000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($235F0C9EAE0F8725BD941307083BE7CC)(*(void *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3);
}

- (BOOL)hasFrameCountBin21
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 4) & 1;
}

- (void)setFrameCountBin22:(int)a3
{
  *(void *)&self->_has |= 0x2000000000uLL;
  self->_frameCountBin22 = a3;
}

- (void)setHasFrameCountBin22:(BOOL)a3
{
  uint64_t v3 = 0x2000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($235F0C9EAE0F8725BD941307083BE7CC)(*(void *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3);
}

- (BOOL)hasFrameCountBin22
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 5) & 1;
}

- (void)setBioCaptureSequenceCount:(unsigned int)a3
{
  *(void *)&self->_has |= 0x20uLL;
  self->_bioCaptureSequenceCount = a3;
}

- (void)setHasBioCaptureSequenceCount:(BOOL)a3
{
  uint64_t v3 = 32;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($235F0C9EAE0F8725BD941307083BE7CC)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasBioCaptureSequenceCount
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setAmbientLux:(int)a3
{
  *(void *)&self->_has |= 0x10uLL;
  self->_ambientLux = a3;
}

- (void)setHasAmbientLux:(BOOL)a3
{
  uint64_t v3 = 16;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($235F0C9EAE0F8725BD941307083BE7CC)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasAmbientLux
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setFeatureGenerationError:(unsigned int)a3
{
  *(void *)&self->_has |= 0x10000000uLL;
  self->_featureGenerationError = a3;
}

- (void)setHasFeatureGenerationError:(BOOL)a3
{
  uint64_t v3 = 0x10000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($235F0C9EAE0F8725BD941307083BE7CC)(*(void *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasFeatureGenerationError
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setEnrollFeatureVectorError:(unsigned int)a3
{
  *(void *)&self->_has |= 0x100000uLL;
  self->_enrollFeatureVectorError = a3;
}

- (void)setHasEnrollFeatureVectorError:(BOOL)a3
{
  uint64_t v3 = 0x100000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($235F0C9EAE0F8725BD941307083BE7CC)(*(void *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasEnrollFeatureVectorError
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setCameraErr:(int)a3
{
  *(void *)&self->_has |= 0x40uLL;
  self->_cameraErr = a3;
}

- (void)setHasCameraErr:(BOOL)a3
{
  uint64_t v3 = 64;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($235F0C9EAE0F8725BD941307083BE7CC)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasCameraErr
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setEnrollResult:(unsigned int)a3
{
  *(void *)&self->_has |= 0x200000uLL;
  self->_enrollResult = a3;
}

- (void)setHasEnrollResult:(BOOL)a3
{
  uint64_t v3 = 0x200000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($235F0C9EAE0F8725BD941307083BE7CC)(*(void *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasEnrollResult
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setFaceDistance:(unsigned int)a3
{
  *(void *)&self->_has |= 0x8000000uLL;
  self->_faceDistance = a3;
}

- (void)setHasFaceDistance:(BOOL)a3
{
  uint64_t v3 = 0x8000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($235F0C9EAE0F8725BD941307083BE7CC)(*(void *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasFaceDistance
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setSensorTemperature:(int)a3
{
  *(void *)&self->_has |= 0x4000000000000uLL;
  self->_sensorTemperature = a3;
}

- (void)setHasSensorTemperature:(BOOL)a3
{
  uint64_t v3 = 0x4000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($235F0C9EAE0F8725BD941307083BE7CC)(*(void *)&self->_has & 0xFFFBFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasSensorTemperature
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 2) & 1;
}

- (void)setRfcSetIndex:(int64_t)a3
{
  *(void *)&self->_has |= 4uLL;
  self->_rfcSetIndex = a3;
}

- (void)setHasRfcSetIndex:(BOOL)a3
{
  uint64_t v3 = 4;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($235F0C9EAE0F8725BD941307083BE7CC)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasRfcSetIndex
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setRfcFrameIndex:(int64_t)a3
{
  *(void *)&self->_has |= 2uLL;
  self->_rfcFrameIndex = a3;
}

- (void)setHasRfcFrameIndex:(BOOL)a3
{
  uint64_t v3 = 2;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($235F0C9EAE0F8725BD941307083BE7CC)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasRfcFrameIndex
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setFailedNoFace:(BOOL)a3
{
  *(void *)&self->_has |= 0x8000000000000uLL;
  self->_failedNoFace = a3;
}

- (void)setHasFailedNoFace:(BOOL)a3
{
  uint64_t v3 = 0x8000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($235F0C9EAE0F8725BD941307083BE7CC)(*(void *)&self->_has & 0xFFF7FFFFFFFFFFFFLL | v3);
}

- (BOOL)hasFailedNoFace
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 3) & 1;
}

- (void)setDeviceOrientation:(unsigned int)a3
{
  *(void *)&self->_has |= 0x80uLL;
  self->_deviceOrientation = a3;
}

- (void)setHasDeviceOrientation:(BOOL)a3
{
  uint64_t v3 = 128;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($235F0C9EAE0F8725BD941307083BE7CC)(*(void *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasDeviceOrientation
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setEnrolledIdentityCount:(unsigned int)a3
{
  *(void *)&self->_has |= 0x800000uLL;
  self->_enrolledIdentityCount = a3;
}

- (void)setHasEnrolledIdentityCount:(BOOL)a3
{
  uint64_t v3 = 0x800000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($235F0C9EAE0F8725BD941307083BE7CC)(*(void *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasEnrolledIdentityCount
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setNoseAndMouthOccluded:(BOOL)a3
{
  *(void *)&self->_has |= 0x10000000000000uLL;
  self->_noseAndMouthOccluded = a3;
}

- (void)setHasNoseAndMouthOccluded:(BOOL)a3
{
  uint64_t v3 = 0x10000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($235F0C9EAE0F8725BD941307083BE7CC)(*(void *)&self->_has & 0xFFEFFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasNoseAndMouthOccluded
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 4) & 1;
}

- (void)setDoubleErrorCountsUpperFaceOccluded:(unsigned int)a3
{
  *(void *)&self->_has |= 0x80000uLL;
  self->_doubleErrorCountsUpperFaceOccluded = a3;
}

- (void)setHasDoubleErrorCountsUpperFaceOccluded:(BOOL)a3
{
  uint64_t v3 = 0x80000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($235F0C9EAE0F8725BD941307083BE7CC)(*(void *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasDoubleErrorCountsUpperFaceOccluded
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setDoubleErrorCountsLowerFaceOccluded:(unsigned int)a3
{
  *(void *)&self->_has |= 0x1000uLL;
  self->_doubleErrorCountsLowerFaceOccluded = a3;
}

- (void)setHasDoubleErrorCountsLowerFaceOccluded:(BOOL)a3
{
  uint64_t v3 = 4096;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($235F0C9EAE0F8725BD941307083BE7CC)(*(void *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasDoubleErrorCountsLowerFaceOccluded
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setFrameErrorCountsUpperFaceOccluded:(unsigned int)a3
{
  *(void *)&self->_has |= 0x2000000000000uLL;
  self->_frameErrorCountsUpperFaceOccluded = a3;
}

- (void)setHasFrameErrorCountsUpperFaceOccluded:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($235F0C9EAE0F8725BD941307083BE7CC)(*(void *)&self->_has & 0xFFFDFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasFrameErrorCountsUpperFaceOccluded
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 1) & 1;
}

- (void)setFrameErrorCountsLowerFaceOccluded:(unsigned int)a3
{
  *(void *)&self->_has |= 0x40000000000uLL;
  self->_frameErrorCountsLowerFaceOccluded = a3;
}

- (void)setHasFrameErrorCountsLowerFaceOccluded:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($235F0C9EAE0F8725BD941307083BE7CC)(*(void *)&self->_has & 0xFFFFFBFFFFFFFFFFLL | v3);
}

- (BOOL)hasFrameErrorCountsLowerFaceOccluded
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 2) & 1;
}

- (void)setEnrollType:(unsigned int)a3
{
  *(void *)&self->_has |= 0x400000uLL;
  self->_enrollType = a3;
}

- (void)setHasEnrollType:(BOOL)a3
{
  uint64_t v3 = 0x400000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($235F0C9EAE0F8725BD941307083BE7CC)(*(void *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasEnrollType
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setEnrolledTemplateCountType0:(unsigned int)a3
{
  *(void *)&self->_has |= 0x2000000uLL;
  self->_enrolledTemplateCountType0 = a3;
}

- (void)setHasEnrolledTemplateCountType0:(BOOL)a3
{
  uint64_t v3 = 0x2000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($235F0C9EAE0F8725BD941307083BE7CC)(*(void *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasEnrolledTemplateCountType0
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setEnrolledTemplateCountType1:(unsigned int)a3
{
  *(void *)&self->_has |= 0x4000000uLL;
  self->_enrolledTemplateCountType1 = a3;
}

- (void)setHasEnrolledTemplateCountType1:(BOOL)a3
{
  uint64_t v3 = 0x4000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($235F0C9EAE0F8725BD941307083BE7CC)(*(void *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasEnrolledTemplateCountType1
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setEnrolledTemplateCountTotal:(unsigned int)a3
{
  *(void *)&self->_has |= 0x1000000uLL;
  self->_enrolledTemplateCountTotal = a3;
}

- (void)setHasEnrolledTemplateCountTotal:(BOOL)a3
{
  uint64_t v3 = 0x1000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($235F0C9EAE0F8725BD941307083BE7CC)(*(void *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasEnrolledTemplateCountTotal
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AWDBiometricKitEnrollAttempt;
  v4 = [(AWDBiometricKitEnrollAttempt *)&v8 description];
  v5 = [(AWDBiometricKitEnrollAttempt *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(unsigned char *)&has & 8) != 0)
  {
    objc_super v8 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v8 forKey:@"timestamp"];

    $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
    if ((*(void *)&has & 0x20000000000000) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_59;
    }
  }
  else if ((*(void *)&has & 0x20000000000000) == 0)
  {
    goto LABEL_3;
  }
  v9 = [NSNumber numberWithBool:self->_overallResult];
  [v3 setObject:v9 forKey:@"overallResult"];

  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_60;
  }
LABEL_59:
  v10 = [NSNumber numberWithUnsignedLongLong:self->_overallTime];
  [v3 setObject:v10 forKey:@"overallTime"];

  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_61;
  }
LABEL_60:
  v11 = [NSNumber numberWithUnsignedInt:self->_doubleErrorCountsOK];
  [v3 setObject:v11 forKey:@"doubleErrorCountsOK"];

  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_62;
  }
LABEL_61:
  v12 = [NSNumber numberWithUnsignedInt:self->_doubleErrorCountsMoreFrames];
  [v3 setObject:v12 forKey:@"doubleErrorCountsMoreFrames"];

  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_8;
    }
    goto LABEL_63;
  }
LABEL_62:
  v13 = [NSNumber numberWithUnsignedInt:self->_doubleErrorCountsNoFace];
  [v3 setObject:v13 forKey:@"doubleErrorCountsNoFace"];

  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_64;
  }
LABEL_63:
  v14 = [NSNumber numberWithUnsignedInt:self->_doubleErrorCountsFaceOutOfFOV];
  [v3 setObject:v14 forKey:@"doubleErrorCountsFaceOutOfFOV"];

  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_10;
    }
    goto LABEL_65;
  }
LABEL_64:
  v15 = [NSNumber numberWithUnsignedInt:self->_doubleErrorCountsMultipleFaces];
  [v3 setObject:v15 forKey:@"doubleErrorCountsMultipleFaces"];

  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_11;
    }
    goto LABEL_66;
  }
LABEL_65:
  v16 = [NSNumber numberWithUnsignedInt:self->_doubleErrorCountsFaceTooClose];
  [v3 setObject:v16 forKey:@"doubleErrorCountsFaceTooClose"];

  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_67;
  }
LABEL_66:
  v17 = [NSNumber numberWithUnsignedInt:self->_doubleErrorCountsFaceTooFar];
  [v3 setObject:v17 forKey:@"doubleErrorCountsFaceTooFar"];

  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_13;
    }
    goto LABEL_68;
  }
LABEL_67:
  v18 = [NSNumber numberWithUnsignedInt:self->_doubleErrorCountsPoseOutRange];
  [v3 setObject:v18 forKey:@"doubleErrorCountsPoseOutRange"];

  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_69;
  }
LABEL_68:
  v19 = [NSNumber numberWithUnsignedInt:self->_doubleErrorCountsBinCovered];
  [v3 setObject:v19 forKey:@"doubleErrorCountsBinCovered"];

  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_14:
    if ((*(void *)&has & 0x400000000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_70;
  }
LABEL_69:
  v20 = [NSNumber numberWithUnsignedInt:self->_doubleErrorCountsOccluded];
  [v3 setObject:v20 forKey:@"doubleErrorCountsOccluded"];

  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x400000000000) == 0)
  {
LABEL_15:
    if ((*(void *)&has & 0x80000000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_71;
  }
LABEL_70:
  v21 = [NSNumber numberWithUnsignedInt:self->_frameErrorCountsOK];
  [v3 setObject:v21 forKey:@"frameErrorCountsOK"];

  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x80000000000) == 0)
  {
LABEL_16:
    if ((*(void *)&has & 0x200000000000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_72;
  }
LABEL_71:
  v22 = [NSNumber numberWithUnsignedInt:self->_frameErrorCountsMoreFrames];
  [v3 setObject:v22 forKey:@"frameErrorCountsMoreFrames"];

  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x200000000000) == 0)
  {
LABEL_17:
    if ((*(void *)&has & 0x8000000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_73;
  }
LABEL_72:
  v23 = [NSNumber numberWithUnsignedInt:self->_frameErrorCountsNoFace];
  [v3 setObject:v23 forKey:@"frameErrorCountsNoFace"];

  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x8000000000) == 0)
  {
LABEL_18:
    if ((*(void *)&has & 0x100000000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_74;
  }
LABEL_73:
  v24 = [NSNumber numberWithUnsignedInt:self->_frameErrorCountsFaceOutOfFOV];
  [v3 setObject:v24 forKey:@"frameErrorCountsFaceOutOfFOV"];

  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x100000000000) == 0)
  {
LABEL_19:
    if ((*(void *)&has & 0x10000000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_75;
  }
LABEL_74:
  v25 = [NSNumber numberWithUnsignedInt:self->_frameErrorCountsMultipleFaces];
  [v3 setObject:v25 forKey:@"frameErrorCountsMultipleFaces"];

  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x10000000000) == 0)
  {
LABEL_20:
    if ((*(void *)&has & 0x20000000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_76;
  }
LABEL_75:
  v26 = [NSNumber numberWithUnsignedInt:self->_frameErrorCountsFaceTooClose];
  [v3 setObject:v26 forKey:@"frameErrorCountsFaceTooClose"];

  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x20000000000) == 0)
  {
LABEL_21:
    if ((*(void *)&has & 0x1000000000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_77;
  }
LABEL_76:
  v27 = [NSNumber numberWithUnsignedInt:self->_frameErrorCountsFaceTooFar];
  [v3 setObject:v27 forKey:@"frameErrorCountsFaceTooFar"];

  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x1000000000000) == 0)
  {
LABEL_22:
    if ((*(void *)&has & 0x4000000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_78;
  }
LABEL_77:
  v28 = [NSNumber numberWithUnsignedInt:self->_frameErrorCountsPoseOutRange];
  [v3 setObject:v28 forKey:@"frameErrorCountsPoseOutRange"];

  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x4000000000) == 0)
  {
LABEL_23:
    if ((*(void *)&has & 0x800000000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_79;
  }
LABEL_78:
  v29 = [NSNumber numberWithUnsignedInt:self->_frameErrorCountsBinCovered];
  [v3 setObject:v29 forKey:@"frameErrorCountsBinCovered"];

  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x800000000000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_80;
  }
LABEL_79:
  v30 = [NSNumber numberWithUnsignedInt:self->_frameErrorCountsOccluded];
  [v3 setObject:v30 forKey:@"frameErrorCountsOccluded"];

  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_81;
  }
LABEL_80:
  v31 = [NSNumber numberWithInt:self->_frameCountBin00];
  [v3 setObject:v31 forKey:@"frameCountBin00"];

  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x80000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_82;
  }
LABEL_81:
  v32 = [NSNumber numberWithInt:self->_frameCountBin01];
  [v3 setObject:v32 forKey:@"frameCountBin01"];

  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_27:
    if ((*(void *)&has & 0x100000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_83;
  }
LABEL_82:
  v33 = [NSNumber numberWithInt:self->_frameCountBin02];
  [v3 setObject:v33 forKey:@"frameCountBin02"];

  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x100000000) == 0)
  {
LABEL_28:
    if ((*(void *)&has & 0x200000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_84;
  }
LABEL_83:
  v34 = [NSNumber numberWithInt:self->_frameCountBin10];
  [v3 setObject:v34 forKey:@"frameCountBin10"];

  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x200000000) == 0)
  {
LABEL_29:
    if ((*(void *)&has & 0x400000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_85;
  }
LABEL_84:
  v35 = [NSNumber numberWithInt:self->_frameCountBin11];
  [v3 setObject:v35 forKey:@"frameCountBin11"];

  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x400000000) == 0)
  {
LABEL_30:
    if ((*(void *)&has & 0x800000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_86;
  }
LABEL_85:
  v36 = [NSNumber numberWithInt:self->_frameCountBin12];
  [v3 setObject:v36 forKey:@"frameCountBin12"];

  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x800000000) == 0)
  {
LABEL_31:
    if ((*(void *)&has & 0x1000000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_87;
  }
LABEL_86:
  v37 = [NSNumber numberWithInt:self->_frameCountBin20];
  [v3 setObject:v37 forKey:@"frameCountBin20"];

  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x1000000000) == 0)
  {
LABEL_32:
    if ((*(void *)&has & 0x2000000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_88;
  }
LABEL_87:
  v38 = [NSNumber numberWithInt:self->_frameCountBin21];
  [v3 setObject:v38 forKey:@"frameCountBin21"];

  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x2000000000) == 0)
  {
LABEL_33:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_34;
    }
    goto LABEL_89;
  }
LABEL_88:
  v39 = [NSNumber numberWithInt:self->_frameCountBin22];
  [v3 setObject:v39 forKey:@"frameCountBin22"];

  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_34:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_35;
    }
    goto LABEL_90;
  }
LABEL_89:
  v40 = [NSNumber numberWithUnsignedInt:self->_bioCaptureSequenceCount];
  [v3 setObject:v40 forKey:@"bioCaptureSequenceCount"];

  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_91;
  }
LABEL_90:
  v41 = [NSNumber numberWithInt:self->_ambientLux];
  [v3 setObject:v41 forKey:@"ambientLux"];

  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_92;
  }
LABEL_91:
  v42 = [NSNumber numberWithUnsignedInt:self->_featureGenerationError];
  [v3 setObject:v42 forKey:@"featureGenerationError"];

  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_37:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_38;
    }
    goto LABEL_93;
  }
LABEL_92:
  v43 = [NSNumber numberWithUnsignedInt:self->_enrollFeatureVectorError];
  [v3 setObject:v43 forKey:@"enrollFeatureVectorError"];

  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_38:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_94;
  }
LABEL_93:
  v44 = [NSNumber numberWithInt:self->_cameraErr];
  [v3 setObject:v44 forKey:@"cameraErr"];

  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_95;
  }
LABEL_94:
  v45 = [NSNumber numberWithUnsignedInt:self->_enrollResult];
  [v3 setObject:v45 forKey:@"enrollResult"];

  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_40:
    if ((*(void *)&has & 0x4000000000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_96;
  }
LABEL_95:
  v46 = [NSNumber numberWithUnsignedInt:self->_faceDistance];
  [v3 setObject:v46 forKey:@"faceDistance"];

  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x4000000000000) == 0)
  {
LABEL_41:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_42;
    }
    goto LABEL_97;
  }
LABEL_96:
  v47 = [NSNumber numberWithInt:self->_sensorTemperature];
  [v3 setObject:v47 forKey:@"sensorTemperature"];

  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_42:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_43;
    }
    goto LABEL_98;
  }
LABEL_97:
  v48 = [NSNumber numberWithLongLong:self->_rfcSetIndex];
  [v3 setObject:v48 forKey:@"rfcSetIndex"];

  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_43:
    if ((*(void *)&has & 0x8000000000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_99;
  }
LABEL_98:
  v49 = [NSNumber numberWithLongLong:self->_rfcFrameIndex];
  [v3 setObject:v49 forKey:@"rfcFrameIndex"];

  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x8000000000000) == 0)
  {
LABEL_44:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_45;
    }
    goto LABEL_100;
  }
LABEL_99:
  v50 = [NSNumber numberWithBool:self->_failedNoFace];
  [v3 setObject:v50 forKey:@"failedNoFace"];

  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_101;
  }
LABEL_100:
  v51 = [NSNumber numberWithUnsignedInt:self->_deviceOrientation];
  [v3 setObject:v51 forKey:@"deviceOrientation"];

  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_46:
    if ((*(void *)&has & 0x10000000000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_102;
  }
LABEL_101:
  v52 = [NSNumber numberWithUnsignedInt:self->_enrolledIdentityCount];
  [v3 setObject:v52 forKey:@"enrolledIdentityCount"];

  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x10000000000000) == 0)
  {
LABEL_47:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_103;
  }
LABEL_102:
  v53 = [NSNumber numberWithBool:self->_noseAndMouthOccluded];
  [v3 setObject:v53 forKey:@"noseAndMouthOccluded"];

  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_48:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_104;
  }
LABEL_103:
  v54 = [NSNumber numberWithUnsignedInt:self->_doubleErrorCountsUpperFaceOccluded];
  [v3 setObject:v54 forKey:@"doubleErrorCountsUpperFaceOccluded"];

  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_49:
    if ((*(void *)&has & 0x2000000000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_105;
  }
LABEL_104:
  v55 = [NSNumber numberWithUnsignedInt:self->_doubleErrorCountsLowerFaceOccluded];
  [v3 setObject:v55 forKey:@"doubleErrorCountsLowerFaceOccluded"];

  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x2000000000000) == 0)
  {
LABEL_50:
    if ((*(void *)&has & 0x40000000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_106;
  }
LABEL_105:
  v56 = [NSNumber numberWithUnsignedInt:self->_frameErrorCountsUpperFaceOccluded];
  [v3 setObject:v56 forKey:@"frameErrorCountsUpperFaceOccluded"];

  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x40000000000) == 0)
  {
LABEL_51:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_107;
  }
LABEL_106:
  v57 = [NSNumber numberWithUnsignedInt:self->_frameErrorCountsLowerFaceOccluded];
  [v3 setObject:v57 forKey:@"frameErrorCountsLowerFaceOccluded"];

  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_52:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_108;
  }
LABEL_107:
  v58 = [NSNumber numberWithUnsignedInt:self->_enrollType];
  [v3 setObject:v58 forKey:@"enrollType"];

  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_53:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_54;
    }
LABEL_109:
    v60 = [NSNumber numberWithUnsignedInt:self->_enrolledTemplateCountType1];
    [v3 setObject:v60 forKey:@"enrolledTemplateCountType1"];

    if ((*(void *)&self->_has & 0x1000000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_55;
  }
LABEL_108:
  v59 = [NSNumber numberWithUnsignedInt:self->_enrolledTemplateCountType0];
  [v3 setObject:v59 forKey:@"enrolledTemplateCountType0"];

  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) != 0) {
    goto LABEL_109;
  }
LABEL_54:
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_55:
    v5 = [NSNumber numberWithUnsignedInt:self->_enrolledTemplateCountTotal];
    [v3 setObject:v5 forKey:@"enrolledTemplateCountTotal"];
  }
LABEL_56:
  id v6 = v3;

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return AWDBiometricKitEnrollAttemptReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(unsigned char *)&has & 8) != 0)
  {
    PBDataWriterWriteUint64Field();
    $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
    if ((*(void *)&has & 0x20000000000000) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_61;
    }
  }
  else if ((*(void *)&has & 0x20000000000000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteUint64Field();
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteUint32Field();
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteUint32Field();
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_8;
    }
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteUint32Field();
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteUint32Field();
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_10;
    }
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteUint32Field();
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_11;
    }
    goto LABEL_68;
  }
LABEL_67:
  PBDataWriterWriteUint32Field();
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_69;
  }
LABEL_68:
  PBDataWriterWriteUint32Field();
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_13;
    }
    goto LABEL_70;
  }
LABEL_69:
  PBDataWriterWriteUint32Field();
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_71;
  }
LABEL_70:
  PBDataWriterWriteUint32Field();
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_14:
    if ((*(void *)&has & 0x400000000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_72;
  }
LABEL_71:
  PBDataWriterWriteUint32Field();
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x400000000000) == 0)
  {
LABEL_15:
    if ((*(void *)&has & 0x80000000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_73;
  }
LABEL_72:
  PBDataWriterWriteUint32Field();
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x80000000000) == 0)
  {
LABEL_16:
    if ((*(void *)&has & 0x200000000000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteUint32Field();
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x200000000000) == 0)
  {
LABEL_17:
    if ((*(void *)&has & 0x8000000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteUint32Field();
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x8000000000) == 0)
  {
LABEL_18:
    if ((*(void *)&has & 0x100000000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_76;
  }
LABEL_75:
  PBDataWriterWriteUint32Field();
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x100000000000) == 0)
  {
LABEL_19:
    if ((*(void *)&has & 0x10000000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_77;
  }
LABEL_76:
  PBDataWriterWriteUint32Field();
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x10000000000) == 0)
  {
LABEL_20:
    if ((*(void *)&has & 0x20000000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_78;
  }
LABEL_77:
  PBDataWriterWriteUint32Field();
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x20000000000) == 0)
  {
LABEL_21:
    if ((*(void *)&has & 0x1000000000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_79;
  }
LABEL_78:
  PBDataWriterWriteUint32Field();
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x1000000000000) == 0)
  {
LABEL_22:
    if ((*(void *)&has & 0x4000000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_80;
  }
LABEL_79:
  PBDataWriterWriteUint32Field();
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x4000000000) == 0)
  {
LABEL_23:
    if ((*(void *)&has & 0x800000000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_81;
  }
LABEL_80:
  PBDataWriterWriteUint32Field();
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x800000000000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_82;
  }
LABEL_81:
  PBDataWriterWriteUint32Field();
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_83;
  }
LABEL_82:
  PBDataWriterWriteInt32Field();
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x80000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_84;
  }
LABEL_83:
  PBDataWriterWriteInt32Field();
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_27:
    if ((*(void *)&has & 0x100000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_85;
  }
LABEL_84:
  PBDataWriterWriteInt32Field();
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x100000000) == 0)
  {
LABEL_28:
    if ((*(void *)&has & 0x200000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_86;
  }
LABEL_85:
  PBDataWriterWriteInt32Field();
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x200000000) == 0)
  {
LABEL_29:
    if ((*(void *)&has & 0x400000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_87;
  }
LABEL_86:
  PBDataWriterWriteInt32Field();
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x400000000) == 0)
  {
LABEL_30:
    if ((*(void *)&has & 0x800000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_88;
  }
LABEL_87:
  PBDataWriterWriteInt32Field();
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x800000000) == 0)
  {
LABEL_31:
    if ((*(void *)&has & 0x1000000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_89;
  }
LABEL_88:
  PBDataWriterWriteInt32Field();
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x1000000000) == 0)
  {
LABEL_32:
    if ((*(void *)&has & 0x2000000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_90;
  }
LABEL_89:
  PBDataWriterWriteInt32Field();
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x2000000000) == 0)
  {
LABEL_33:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_34;
    }
    goto LABEL_91;
  }
LABEL_90:
  PBDataWriterWriteInt32Field();
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_34:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_35;
    }
    goto LABEL_92;
  }
LABEL_91:
  PBDataWriterWriteUint32Field();
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_93;
  }
LABEL_92:
  PBDataWriterWriteInt32Field();
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_94;
  }
LABEL_93:
  PBDataWriterWriteUint32Field();
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_37:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_38;
    }
    goto LABEL_95;
  }
LABEL_94:
  PBDataWriterWriteUint32Field();
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_38:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_96;
  }
LABEL_95:
  PBDataWriterWriteInt32Field();
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_97;
  }
LABEL_96:
  PBDataWriterWriteUint32Field();
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_40:
    if ((*(void *)&has & 0x4000000000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_98;
  }
LABEL_97:
  PBDataWriterWriteUint32Field();
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x4000000000000) == 0)
  {
LABEL_41:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_42;
    }
    goto LABEL_99;
  }
LABEL_98:
  PBDataWriterWriteInt32Field();
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_42:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_43;
    }
    goto LABEL_100;
  }
LABEL_99:
  PBDataWriterWriteInt64Field();
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_43:
    if ((*(void *)&has & 0x8000000000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_101;
  }
LABEL_100:
  PBDataWriterWriteInt64Field();
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x8000000000000) == 0)
  {
LABEL_44:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_45;
    }
    goto LABEL_102;
  }
LABEL_101:
  PBDataWriterWriteBOOLField();
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_103;
  }
LABEL_102:
  PBDataWriterWriteUint32Field();
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_46:
    if ((*(void *)&has & 0x10000000000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_104;
  }
LABEL_103:
  PBDataWriterWriteUint32Field();
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x10000000000000) == 0)
  {
LABEL_47:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_105;
  }
LABEL_104:
  PBDataWriterWriteBOOLField();
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_48:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_106;
  }
LABEL_105:
  PBDataWriterWriteUint32Field();
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_49:
    if ((*(void *)&has & 0x2000000000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_107;
  }
LABEL_106:
  PBDataWriterWriteUint32Field();
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x2000000000000) == 0)
  {
LABEL_50:
    if ((*(void *)&has & 0x40000000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_108;
  }
LABEL_107:
  PBDataWriterWriteUint32Field();
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x40000000000) == 0)
  {
LABEL_51:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_109;
  }
LABEL_108:
  PBDataWriterWriteUint32Field();
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_52:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_110;
  }
LABEL_109:
  PBDataWriterWriteUint32Field();
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_53:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_111;
  }
LABEL_110:
  PBDataWriterWriteUint32Field();
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_54:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_55;
  }
LABEL_111:
  PBDataWriterWriteUint32Field();
  if ((*(void *)&self->_has & 0x1000000) != 0) {
LABEL_55:
  }
    PBDataWriterWriteUint32Field();
LABEL_56:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(unsigned char *)&has & 8) != 0)
  {
    v4[4] = self->_timestamp;
    v4[29] |= 8uLL;
    $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
    if ((*(void *)&has & 0x20000000000000) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_61;
    }
  }
  else if ((*(void *)&has & 0x20000000000000) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)v4 + 230) = self->_overallResult;
  v4[29] |= 0x20000000000000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_62;
  }
LABEL_61:
  v4[1] = self->_overallTime;
  v4[29] |= 1uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_63;
  }
LABEL_62:
  *((_DWORD *)v4 + 22) = self->_doubleErrorCountsOK;
  v4[29] |= 0x10000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_64;
  }
LABEL_63:
  *((_DWORD *)v4 + 19) = self->_doubleErrorCountsMoreFrames;
  v4[29] |= 0x2000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_8;
    }
    goto LABEL_65;
  }
LABEL_64:
  *((_DWORD *)v4 + 21) = self->_doubleErrorCountsNoFace;
  v4[29] |= 0x8000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_66;
  }
LABEL_65:
  *((_DWORD *)v4 + 15) = self->_doubleErrorCountsFaceOutOfFOV;
  v4[29] |= 0x200uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_10;
    }
    goto LABEL_67;
  }
LABEL_66:
  *((_DWORD *)v4 + 20) = self->_doubleErrorCountsMultipleFaces;
  v4[29] |= 0x4000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_11;
    }
    goto LABEL_68;
  }
LABEL_67:
  *((_DWORD *)v4 + 16) = self->_doubleErrorCountsFaceTooClose;
  v4[29] |= 0x400uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_69;
  }
LABEL_68:
  *((_DWORD *)v4 + 17) = self->_doubleErrorCountsFaceTooFar;
  v4[29] |= 0x800uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_13;
    }
    goto LABEL_70;
  }
LABEL_69:
  *((_DWORD *)v4 + 24) = self->_doubleErrorCountsPoseOutRange;
  v4[29] |= 0x40000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_71;
  }
LABEL_70:
  *((_DWORD *)v4 + 14) = self->_doubleErrorCountsBinCovered;
  v4[29] |= 0x100uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_14:
    if ((*(void *)&has & 0x400000000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_72;
  }
LABEL_71:
  *((_DWORD *)v4 + 23) = self->_doubleErrorCountsOccluded;
  v4[29] |= 0x20000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x400000000000) == 0)
  {
LABEL_15:
    if ((*(void *)&has & 0x80000000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_73;
  }
LABEL_72:
  *((_DWORD *)v4 + 52) = self->_frameErrorCountsOK;
  v4[29] |= 0x400000000000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x80000000000) == 0)
  {
LABEL_16:
    if ((*(void *)&has & 0x200000000000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_74;
  }
LABEL_73:
  *((_DWORD *)v4 + 49) = self->_frameErrorCountsMoreFrames;
  v4[29] |= 0x80000000000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x200000000000) == 0)
  {
LABEL_17:
    if ((*(void *)&has & 0x8000000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_75;
  }
LABEL_74:
  *((_DWORD *)v4 + 51) = self->_frameErrorCountsNoFace;
  v4[29] |= 0x200000000000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x8000000000) == 0)
  {
LABEL_18:
    if ((*(void *)&has & 0x100000000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_76;
  }
LABEL_75:
  *((_DWORD *)v4 + 45) = self->_frameErrorCountsFaceOutOfFOV;
  v4[29] |= 0x8000000000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x100000000000) == 0)
  {
LABEL_19:
    if ((*(void *)&has & 0x10000000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_77;
  }
LABEL_76:
  *((_DWORD *)v4 + 50) = self->_frameErrorCountsMultipleFaces;
  v4[29] |= 0x100000000000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x10000000000) == 0)
  {
LABEL_20:
    if ((*(void *)&has & 0x20000000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_78;
  }
LABEL_77:
  *((_DWORD *)v4 + 46) = self->_frameErrorCountsFaceTooClose;
  v4[29] |= 0x10000000000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x20000000000) == 0)
  {
LABEL_21:
    if ((*(void *)&has & 0x1000000000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_79;
  }
LABEL_78:
  *((_DWORD *)v4 + 47) = self->_frameErrorCountsFaceTooFar;
  v4[29] |= 0x20000000000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x1000000000000) == 0)
  {
LABEL_22:
    if ((*(void *)&has & 0x4000000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_80;
  }
LABEL_79:
  *((_DWORD *)v4 + 54) = self->_frameErrorCountsPoseOutRange;
  v4[29] |= 0x1000000000000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x4000000000) == 0)
  {
LABEL_23:
    if ((*(void *)&has & 0x800000000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_81;
  }
LABEL_80:
  *((_DWORD *)v4 + 44) = self->_frameErrorCountsBinCovered;
  v4[29] |= 0x4000000000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x800000000000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_82;
  }
LABEL_81:
  *((_DWORD *)v4 + 53) = self->_frameErrorCountsOccluded;
  v4[29] |= 0x800000000000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_83;
  }
LABEL_82:
  *((_DWORD *)v4 + 35) = self->_frameCountBin00;
  v4[29] |= 0x20000000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x80000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_84;
  }
LABEL_83:
  *((_DWORD *)v4 + 36) = self->_frameCountBin01;
  v4[29] |= 0x40000000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_27:
    if ((*(void *)&has & 0x100000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_85;
  }
LABEL_84:
  *((_DWORD *)v4 + 37) = self->_frameCountBin02;
  v4[29] |= 0x80000000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x100000000) == 0)
  {
LABEL_28:
    if ((*(void *)&has & 0x200000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_86;
  }
LABEL_85:
  *((_DWORD *)v4 + 38) = self->_frameCountBin10;
  v4[29] |= 0x100000000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x200000000) == 0)
  {
LABEL_29:
    if ((*(void *)&has & 0x400000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_87;
  }
LABEL_86:
  *((_DWORD *)v4 + 39) = self->_frameCountBin11;
  v4[29] |= 0x200000000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x400000000) == 0)
  {
LABEL_30:
    if ((*(void *)&has & 0x800000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_88;
  }
LABEL_87:
  *((_DWORD *)v4 + 40) = self->_frameCountBin12;
  v4[29] |= 0x400000000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x800000000) == 0)
  {
LABEL_31:
    if ((*(void *)&has & 0x1000000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_89;
  }
LABEL_88:
  *((_DWORD *)v4 + 41) = self->_frameCountBin20;
  v4[29] |= 0x800000000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x1000000000) == 0)
  {
LABEL_32:
    if ((*(void *)&has & 0x2000000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_90;
  }
LABEL_89:
  *((_DWORD *)v4 + 42) = self->_frameCountBin21;
  v4[29] |= 0x1000000000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x2000000000) == 0)
  {
LABEL_33:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_34;
    }
    goto LABEL_91;
  }
LABEL_90:
  *((_DWORD *)v4 + 43) = self->_frameCountBin22;
  v4[29] |= 0x2000000000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_34:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_35;
    }
    goto LABEL_92;
  }
LABEL_91:
  *((_DWORD *)v4 + 11) = self->_bioCaptureSequenceCount;
  v4[29] |= 0x20uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_93;
  }
LABEL_92:
  *((_DWORD *)v4 + 10) = self->_ambientLux;
  v4[29] |= 0x10uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_94;
  }
LABEL_93:
  *((_DWORD *)v4 + 34) = self->_featureGenerationError;
  v4[29] |= 0x10000000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_37:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_38;
    }
    goto LABEL_95;
  }
LABEL_94:
  *((_DWORD *)v4 + 26) = self->_enrollFeatureVectorError;
  v4[29] |= 0x100000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_38:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_96;
  }
LABEL_95:
  *((_DWORD *)v4 + 12) = self->_cameraErr;
  v4[29] |= 0x40uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_97;
  }
LABEL_96:
  *((_DWORD *)v4 + 27) = self->_enrollResult;
  v4[29] |= 0x200000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_40:
    if ((*(void *)&has & 0x4000000000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_98;
  }
LABEL_97:
  *((_DWORD *)v4 + 33) = self->_faceDistance;
  v4[29] |= 0x8000000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x4000000000000) == 0)
  {
LABEL_41:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_42;
    }
    goto LABEL_99;
  }
LABEL_98:
  *((_DWORD *)v4 + 56) = self->_sensorTemperature;
  v4[29] |= 0x4000000000000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_42:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_43;
    }
    goto LABEL_100;
  }
LABEL_99:
  v4[3] = self->_rfcSetIndex;
  v4[29] |= 4uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_43:
    if ((*(void *)&has & 0x8000000000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_101;
  }
LABEL_100:
  v4[2] = self->_rfcFrameIndex;
  v4[29] |= 2uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x8000000000000) == 0)
  {
LABEL_44:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_45;
    }
    goto LABEL_102;
  }
LABEL_101:
  *((unsigned char *)v4 + 228) = self->_failedNoFace;
  v4[29] |= 0x8000000000000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_103;
  }
LABEL_102:
  *((_DWORD *)v4 + 13) = self->_deviceOrientation;
  v4[29] |= 0x80uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_46:
    if ((*(void *)&has & 0x10000000000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_104;
  }
LABEL_103:
  *((_DWORD *)v4 + 29) = self->_enrolledIdentityCount;
  v4[29] |= 0x800000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x10000000000000) == 0)
  {
LABEL_47:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_105;
  }
LABEL_104:
  *((unsigned char *)v4 + 229) = self->_noseAndMouthOccluded;
  v4[29] |= 0x10000000000000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_48:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_106;
  }
LABEL_105:
  *((_DWORD *)v4 + 25) = self->_doubleErrorCountsUpperFaceOccluded;
  v4[29] |= 0x80000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_49:
    if ((*(void *)&has & 0x2000000000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_107;
  }
LABEL_106:
  *((_DWORD *)v4 + 18) = self->_doubleErrorCountsLowerFaceOccluded;
  v4[29] |= 0x1000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x2000000000000) == 0)
  {
LABEL_50:
    if ((*(void *)&has & 0x40000000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_108;
  }
LABEL_107:
  *((_DWORD *)v4 + 55) = self->_frameErrorCountsUpperFaceOccluded;
  v4[29] |= 0x2000000000000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x40000000000) == 0)
  {
LABEL_51:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_109;
  }
LABEL_108:
  *((_DWORD *)v4 + 48) = self->_frameErrorCountsLowerFaceOccluded;
  v4[29] |= 0x40000000000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_52:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_110;
  }
LABEL_109:
  *((_DWORD *)v4 + 28) = self->_enrollType;
  v4[29] |= 0x400000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_53:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_111;
  }
LABEL_110:
  *((_DWORD *)v4 + 31) = self->_enrolledTemplateCountType0;
  v4[29] |= 0x2000000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_54:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_55;
  }
LABEL_111:
  *((_DWORD *)v4 + 32) = self->_enrolledTemplateCountType1;
  v4[29] |= 0x4000000uLL;
  if ((*(void *)&self->_has & 0x1000000) != 0)
  {
LABEL_55:
    *((_DWORD *)v4 + 30) = self->_enrolledTemplateCountTotal;
    v4[29] |= 0x1000000uLL;
  }
LABEL_56:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [objc_opt_class() allocWithZone:a3];
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(unsigned char *)&has & 8) != 0)
  {
    *(void *)(v4 + 32) = self->_timestamp;
    *(void *)(v4 + 232) |= 8uLL;
    $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
    if ((*(void *)&has & 0x20000000000000) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_59;
    }
  }
  else if ((*(void *)&has & 0x20000000000000) == 0)
  {
    goto LABEL_3;
  }
  *(unsigned char *)(v4 + 230) = self->_overallResult;
  *(void *)(v4 + 232) |= 0x20000000000000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_60;
  }
LABEL_59:
  *(void *)(v4 + 8) = self->_overallTime;
  *(void *)(v4 + 232) |= 1uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_61;
  }
LABEL_60:
  *(_DWORD *)(v4 + 88) = self->_doubleErrorCountsOK;
  *(void *)(v4 + 232) |= 0x10000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_62;
  }
LABEL_61:
  *(_DWORD *)(v4 + 76) = self->_doubleErrorCountsMoreFrames;
  *(void *)(v4 + 232) |= 0x2000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_8;
    }
    goto LABEL_63;
  }
LABEL_62:
  *(_DWORD *)(v4 + 84) = self->_doubleErrorCountsNoFace;
  *(void *)(v4 + 232) |= 0x8000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_64;
  }
LABEL_63:
  *(_DWORD *)(v4 + 60) = self->_doubleErrorCountsFaceOutOfFOV;
  *(void *)(v4 + 232) |= 0x200uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_10;
    }
    goto LABEL_65;
  }
LABEL_64:
  *(_DWORD *)(v4 + 80) = self->_doubleErrorCountsMultipleFaces;
  *(void *)(v4 + 232) |= 0x4000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_11;
    }
    goto LABEL_66;
  }
LABEL_65:
  *(_DWORD *)(v4 + 64) = self->_doubleErrorCountsFaceTooClose;
  *(void *)(v4 + 232) |= 0x400uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_67;
  }
LABEL_66:
  *(_DWORD *)(v4 + 68) = self->_doubleErrorCountsFaceTooFar;
  *(void *)(v4 + 232) |= 0x800uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_13;
    }
    goto LABEL_68;
  }
LABEL_67:
  *(_DWORD *)(v4 + 96) = self->_doubleErrorCountsPoseOutRange;
  *(void *)(v4 + 232) |= 0x40000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_69;
  }
LABEL_68:
  *(_DWORD *)(v4 + 56) = self->_doubleErrorCountsBinCovered;
  *(void *)(v4 + 232) |= 0x100uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_14:
    if ((*(void *)&has & 0x400000000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_70;
  }
LABEL_69:
  *(_DWORD *)(v4 + 92) = self->_doubleErrorCountsOccluded;
  *(void *)(v4 + 232) |= 0x20000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x400000000000) == 0)
  {
LABEL_15:
    if ((*(void *)&has & 0x80000000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_71;
  }
LABEL_70:
  *(_DWORD *)(v4 + 208) = self->_frameErrorCountsOK;
  *(void *)(v4 + 232) |= 0x400000000000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x80000000000) == 0)
  {
LABEL_16:
    if ((*(void *)&has & 0x200000000000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_72;
  }
LABEL_71:
  *(_DWORD *)(v4 + 196) = self->_frameErrorCountsMoreFrames;
  *(void *)(v4 + 232) |= 0x80000000000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x200000000000) == 0)
  {
LABEL_17:
    if ((*(void *)&has & 0x8000000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_73;
  }
LABEL_72:
  *(_DWORD *)(v4 + 204) = self->_frameErrorCountsNoFace;
  *(void *)(v4 + 232) |= 0x200000000000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x8000000000) == 0)
  {
LABEL_18:
    if ((*(void *)&has & 0x100000000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_74;
  }
LABEL_73:
  *(_DWORD *)(v4 + 180) = self->_frameErrorCountsFaceOutOfFOV;
  *(void *)(v4 + 232) |= 0x8000000000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x100000000000) == 0)
  {
LABEL_19:
    if ((*(void *)&has & 0x10000000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_75;
  }
LABEL_74:
  *(_DWORD *)(v4 + 200) = self->_frameErrorCountsMultipleFaces;
  *(void *)(v4 + 232) |= 0x100000000000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x10000000000) == 0)
  {
LABEL_20:
    if ((*(void *)&has & 0x20000000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_76;
  }
LABEL_75:
  *(_DWORD *)(v4 + 184) = self->_frameErrorCountsFaceTooClose;
  *(void *)(v4 + 232) |= 0x10000000000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x20000000000) == 0)
  {
LABEL_21:
    if ((*(void *)&has & 0x1000000000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_77;
  }
LABEL_76:
  *(_DWORD *)(v4 + 188) = self->_frameErrorCountsFaceTooFar;
  *(void *)(v4 + 232) |= 0x20000000000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x1000000000000) == 0)
  {
LABEL_22:
    if ((*(void *)&has & 0x4000000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_78;
  }
LABEL_77:
  *(_DWORD *)(v4 + 216) = self->_frameErrorCountsPoseOutRange;
  *(void *)(v4 + 232) |= 0x1000000000000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x4000000000) == 0)
  {
LABEL_23:
    if ((*(void *)&has & 0x800000000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_79;
  }
LABEL_78:
  *(_DWORD *)(v4 + 176) = self->_frameErrorCountsBinCovered;
  *(void *)(v4 + 232) |= 0x4000000000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x800000000000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_80;
  }
LABEL_79:
  *(_DWORD *)(v4 + 212) = self->_frameErrorCountsOccluded;
  *(void *)(v4 + 232) |= 0x800000000000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_81;
  }
LABEL_80:
  *(_DWORD *)(v4 + 140) = self->_frameCountBin00;
  *(void *)(v4 + 232) |= 0x20000000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x80000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_82;
  }
LABEL_81:
  *(_DWORD *)(v4 + 144) = self->_frameCountBin01;
  *(void *)(v4 + 232) |= 0x40000000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_27:
    if ((*(void *)&has & 0x100000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_83;
  }
LABEL_82:
  *(_DWORD *)(v4 + 148) = self->_frameCountBin02;
  *(void *)(v4 + 232) |= 0x80000000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x100000000) == 0)
  {
LABEL_28:
    if ((*(void *)&has & 0x200000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_84;
  }
LABEL_83:
  *(_DWORD *)(v4 + 152) = self->_frameCountBin10;
  *(void *)(v4 + 232) |= 0x100000000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x200000000) == 0)
  {
LABEL_29:
    if ((*(void *)&has & 0x400000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_85;
  }
LABEL_84:
  *(_DWORD *)(v4 + 156) = self->_frameCountBin11;
  *(void *)(v4 + 232) |= 0x200000000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x400000000) == 0)
  {
LABEL_30:
    if ((*(void *)&has & 0x800000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_86;
  }
LABEL_85:
  *(_DWORD *)(v4 + 160) = self->_frameCountBin12;
  *(void *)(v4 + 232) |= 0x400000000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x800000000) == 0)
  {
LABEL_31:
    if ((*(void *)&has & 0x1000000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_87;
  }
LABEL_86:
  *(_DWORD *)(v4 + 164) = self->_frameCountBin20;
  *(void *)(v4 + 232) |= 0x800000000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x1000000000) == 0)
  {
LABEL_32:
    if ((*(void *)&has & 0x2000000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_88;
  }
LABEL_87:
  *(_DWORD *)(v4 + 168) = self->_frameCountBin21;
  *(void *)(v4 + 232) |= 0x1000000000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x2000000000) == 0)
  {
LABEL_33:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_34;
    }
    goto LABEL_89;
  }
LABEL_88:
  *(_DWORD *)(v4 + 172) = self->_frameCountBin22;
  *(void *)(v4 + 232) |= 0x2000000000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_34:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_35;
    }
    goto LABEL_90;
  }
LABEL_89:
  *(_DWORD *)(v4 + 44) = self->_bioCaptureSequenceCount;
  *(void *)(v4 + 232) |= 0x20uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_91;
  }
LABEL_90:
  *(_DWORD *)(v4 + 40) = self->_ambientLux;
  *(void *)(v4 + 232) |= 0x10uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_92;
  }
LABEL_91:
  *(_DWORD *)(v4 + 136) = self->_featureGenerationError;
  *(void *)(v4 + 232) |= 0x10000000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_37:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_38;
    }
    goto LABEL_93;
  }
LABEL_92:
  *(_DWORD *)(v4 + 104) = self->_enrollFeatureVectorError;
  *(void *)(v4 + 232) |= 0x100000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_38:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_94;
  }
LABEL_93:
  *(_DWORD *)(v4 + 48) = self->_cameraErr;
  *(void *)(v4 + 232) |= 0x40uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_95;
  }
LABEL_94:
  *(_DWORD *)(v4 + 108) = self->_enrollResult;
  *(void *)(v4 + 232) |= 0x200000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_40:
    if ((*(void *)&has & 0x4000000000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_96;
  }
LABEL_95:
  *(_DWORD *)(v4 + 132) = self->_faceDistance;
  *(void *)(v4 + 232) |= 0x8000000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x4000000000000) == 0)
  {
LABEL_41:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_42;
    }
    goto LABEL_97;
  }
LABEL_96:
  *(_DWORD *)(v4 + 224) = self->_sensorTemperature;
  *(void *)(v4 + 232) |= 0x4000000000000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_42:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_43;
    }
    goto LABEL_98;
  }
LABEL_97:
  *(void *)(v4 + 24) = self->_rfcSetIndex;
  *(void *)(v4 + 232) |= 4uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_43:
    if ((*(void *)&has & 0x8000000000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_99;
  }
LABEL_98:
  *(void *)(v4 + 16) = self->_rfcFrameIndex;
  *(void *)(v4 + 232) |= 2uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x8000000000000) == 0)
  {
LABEL_44:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_45;
    }
    goto LABEL_100;
  }
LABEL_99:
  *(unsigned char *)(v4 + 228) = self->_failedNoFace;
  *(void *)(v4 + 232) |= 0x8000000000000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_101;
  }
LABEL_100:
  *(_DWORD *)(v4 + 52) = self->_deviceOrientation;
  *(void *)(v4 + 232) |= 0x80uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_46:
    if ((*(void *)&has & 0x10000000000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_102;
  }
LABEL_101:
  *(_DWORD *)(v4 + 116) = self->_enrolledIdentityCount;
  *(void *)(v4 + 232) |= 0x800000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x10000000000000) == 0)
  {
LABEL_47:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_103;
  }
LABEL_102:
  *(unsigned char *)(v4 + 229) = self->_noseAndMouthOccluded;
  *(void *)(v4 + 232) |= 0x10000000000000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_48:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_104;
  }
LABEL_103:
  *(_DWORD *)(v4 + 100) = self->_doubleErrorCountsUpperFaceOccluded;
  *(void *)(v4 + 232) |= 0x80000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_49:
    if ((*(void *)&has & 0x2000000000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_105;
  }
LABEL_104:
  *(_DWORD *)(v4 + 72) = self->_doubleErrorCountsLowerFaceOccluded;
  *(void *)(v4 + 232) |= 0x1000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x2000000000000) == 0)
  {
LABEL_50:
    if ((*(void *)&has & 0x40000000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_106;
  }
LABEL_105:
  *(_DWORD *)(v4 + 220) = self->_frameErrorCountsUpperFaceOccluded;
  *(void *)(v4 + 232) |= 0x2000000000000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(void *)&has & 0x40000000000) == 0)
  {
LABEL_51:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_107;
  }
LABEL_106:
  *(_DWORD *)(v4 + 192) = self->_frameErrorCountsLowerFaceOccluded;
  *(void *)(v4 + 232) |= 0x40000000000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_52:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_108;
  }
LABEL_107:
  *(_DWORD *)(v4 + 112) = self->_enrollType;
  *(void *)(v4 + 232) |= 0x400000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_53:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_54;
    }
LABEL_109:
    *(_DWORD *)(v4 + 128) = self->_enrolledTemplateCountType1;
    *(void *)(v4 + 232) |= 0x4000000uLL;
    if ((*(void *)&self->_has & 0x1000000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_55;
  }
LABEL_108:
  *(_DWORD *)(v4 + 124) = self->_enrolledTemplateCountType0;
  *(void *)(v4 + 232) |= 0x2000000uLL;
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) != 0) {
    goto LABEL_109;
  }
LABEL_54:
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_55:
    *(_DWORD *)(v4 + 120) = self->_enrolledTemplateCountTotal;
    *(void *)(v4 + 232) |= 0x1000000uLL;
  }
LABEL_56:
  id v6 = (id)v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_281;
  }
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  uint64_t v6 = *((void *)v4 + 29);
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_timestamp != *((void *)v4 + 4)) {
      goto LABEL_281;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_281;
  }
  if ((*(void *)&has & 0x20000000000000) != 0)
  {
    if ((v6 & 0x20000000000000) == 0) {
      goto LABEL_281;
    }
    if (self->_overallResult)
    {
      if (!*((unsigned char *)v4 + 230)) {
        goto LABEL_281;
      }
    }
    else if (*((unsigned char *)v4 + 230))
    {
      goto LABEL_281;
    }
  }
  else if ((v6 & 0x20000000000000) != 0)
  {
    goto LABEL_281;
  }
  if (*(unsigned char *)&has)
  {
    if ((v6 & 1) == 0 || self->_overallTime != *((void *)v4 + 1)) {
      goto LABEL_281;
    }
  }
  else if (v6)
  {
    goto LABEL_281;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v6 & 0x10000) == 0 || self->_doubleErrorCountsOK != *((_DWORD *)v4 + 22)) {
      goto LABEL_281;
    }
  }
  else if ((v6 & 0x10000) != 0)
  {
    goto LABEL_281;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0 || self->_doubleErrorCountsMoreFrames != *((_DWORD *)v4 + 19)) {
      goto LABEL_281;
    }
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_281;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v6 & 0x8000) == 0 || self->_doubleErrorCountsNoFace != *((_DWORD *)v4 + 21)) {
      goto LABEL_281;
    }
  }
  else if ((v6 & 0x8000) != 0)
  {
    goto LABEL_281;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_doubleErrorCountsFaceOutOfFOV != *((_DWORD *)v4 + 15)) {
      goto LABEL_281;
    }
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_281;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0 || self->_doubleErrorCountsMultipleFaces != *((_DWORD *)v4 + 20)) {
      goto LABEL_281;
    }
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_281;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_doubleErrorCountsFaceTooClose != *((_DWORD *)v4 + 16)) {
      goto LABEL_281;
    }
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_281;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_doubleErrorCountsFaceTooFar != *((_DWORD *)v4 + 17)) {
      goto LABEL_281;
    }
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_281;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v6 & 0x40000) == 0 || self->_doubleErrorCountsPoseOutRange != *((_DWORD *)v4 + 24)) {
      goto LABEL_281;
    }
  }
  else if ((v6 & 0x40000) != 0)
  {
    goto LABEL_281;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_doubleErrorCountsBinCovered != *((_DWORD *)v4 + 14)) {
      goto LABEL_281;
    }
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_281;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0 || self->_doubleErrorCountsOccluded != *((_DWORD *)v4 + 23)) {
      goto LABEL_281;
    }
  }
  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_281;
  }
  if ((*(void *)&has & 0x400000000000) != 0)
  {
    if ((v6 & 0x400000000000) == 0 || self->_frameErrorCountsOK != *((_DWORD *)v4 + 52)) {
      goto LABEL_281;
    }
  }
  else if ((v6 & 0x400000000000) != 0)
  {
    goto LABEL_281;
  }
  if ((*(void *)&has & 0x80000000000) != 0)
  {
    if ((v6 & 0x80000000000) == 0 || self->_frameErrorCountsMoreFrames != *((_DWORD *)v4 + 49)) {
      goto LABEL_281;
    }
  }
  else if ((v6 & 0x80000000000) != 0)
  {
    goto LABEL_281;
  }
  if ((*(void *)&has & 0x200000000000) != 0)
  {
    if ((v6 & 0x200000000000) == 0 || self->_frameErrorCountsNoFace != *((_DWORD *)v4 + 51)) {
      goto LABEL_281;
    }
  }
  else if ((v6 & 0x200000000000) != 0)
  {
    goto LABEL_281;
  }
  if ((*(void *)&has & 0x8000000000) != 0)
  {
    if ((v6 & 0x8000000000) == 0 || self->_frameErrorCountsFaceOutOfFOV != *((_DWORD *)v4 + 45)) {
      goto LABEL_281;
    }
  }
  else if ((v6 & 0x8000000000) != 0)
  {
    goto LABEL_281;
  }
  if ((*(void *)&has & 0x100000000000) != 0)
  {
    if ((v6 & 0x100000000000) == 0 || self->_frameErrorCountsMultipleFaces != *((_DWORD *)v4 + 50)) {
      goto LABEL_281;
    }
  }
  else if ((v6 & 0x100000000000) != 0)
  {
    goto LABEL_281;
  }
  if ((*(void *)&has & 0x10000000000) != 0)
  {
    if ((v6 & 0x10000000000) == 0 || self->_frameErrorCountsFaceTooClose != *((_DWORD *)v4 + 46)) {
      goto LABEL_281;
    }
  }
  else if ((v6 & 0x10000000000) != 0)
  {
    goto LABEL_281;
  }
  if ((*(void *)&has & 0x20000000000) != 0)
  {
    if ((v6 & 0x20000000000) == 0 || self->_frameErrorCountsFaceTooFar != *((_DWORD *)v4 + 47)) {
      goto LABEL_281;
    }
  }
  else if ((v6 & 0x20000000000) != 0)
  {
    goto LABEL_281;
  }
  if ((*(void *)&has & 0x1000000000000) != 0)
  {
    if ((v6 & 0x1000000000000) == 0 || self->_frameErrorCountsPoseOutRange != *((_DWORD *)v4 + 54)) {
      goto LABEL_281;
    }
  }
  else if ((v6 & 0x1000000000000) != 0)
  {
    goto LABEL_281;
  }
  if ((*(void *)&has & 0x4000000000) != 0)
  {
    if ((v6 & 0x4000000000) == 0 || self->_frameErrorCountsBinCovered != *((_DWORD *)v4 + 44)) {
      goto LABEL_281;
    }
  }
  else if ((v6 & 0x4000000000) != 0)
  {
    goto LABEL_281;
  }
  if ((*(void *)&has & 0x800000000000) != 0)
  {
    if ((v6 & 0x800000000000) == 0 || self->_frameErrorCountsOccluded != *((_DWORD *)v4 + 53)) {
      goto LABEL_281;
    }
  }
  else if ((v6 & 0x800000000000) != 0)
  {
    goto LABEL_281;
  }
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    if ((v6 & 0x20000000) == 0 || self->_frameCountBin00 != *((_DWORD *)v4 + 35)) {
      goto LABEL_281;
    }
  }
  else if ((v6 & 0x20000000) != 0)
  {
    goto LABEL_281;
  }
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
    if ((v6 & 0x40000000) == 0 || self->_frameCountBin01 != *((_DWORD *)v4 + 36)) {
      goto LABEL_281;
    }
  }
  else if ((v6 & 0x40000000) != 0)
  {
    goto LABEL_281;
  }
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    if ((v6 & 0x80000000) == 0 || self->_frameCountBin02 != *((_DWORD *)v4 + 37)) {
      goto LABEL_281;
    }
  }
  else if ((v6 & 0x80000000) != 0)
  {
    goto LABEL_281;
  }
  if ((*(void *)&has & 0x100000000) != 0)
  {
    if ((v6 & 0x100000000) == 0 || self->_frameCountBin10 != *((_DWORD *)v4 + 38)) {
      goto LABEL_281;
    }
  }
  else if ((v6 & 0x100000000) != 0)
  {
    goto LABEL_281;
  }
  if ((*(void *)&has & 0x200000000) != 0)
  {
    if ((v6 & 0x200000000) == 0 || self->_frameCountBin11 != *((_DWORD *)v4 + 39)) {
      goto LABEL_281;
    }
  }
  else if ((v6 & 0x200000000) != 0)
  {
    goto LABEL_281;
  }
  if ((*(void *)&has & 0x400000000) != 0)
  {
    if ((v6 & 0x400000000) == 0 || self->_frameCountBin12 != *((_DWORD *)v4 + 40)) {
      goto LABEL_281;
    }
  }
  else if ((v6 & 0x400000000) != 0)
  {
    goto LABEL_281;
  }
  if ((*(void *)&has & 0x800000000) != 0)
  {
    if ((v6 & 0x800000000) == 0 || self->_frameCountBin20 != *((_DWORD *)v4 + 41)) {
      goto LABEL_281;
    }
  }
  else if ((v6 & 0x800000000) != 0)
  {
    goto LABEL_281;
  }
  if ((*(void *)&has & 0x1000000000) != 0)
  {
    if ((v6 & 0x1000000000) == 0 || self->_frameCountBin21 != *((_DWORD *)v4 + 42)) {
      goto LABEL_281;
    }
  }
  else if ((v6 & 0x1000000000) != 0)
  {
    goto LABEL_281;
  }
  if ((*(void *)&has & 0x2000000000) != 0)
  {
    if ((v6 & 0x2000000000) == 0 || self->_frameCountBin22 != *((_DWORD *)v4 + 43)) {
      goto LABEL_281;
    }
  }
  else if ((v6 & 0x2000000000) != 0)
  {
    goto LABEL_281;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_bioCaptureSequenceCount != *((_DWORD *)v4 + 11)) {
      goto LABEL_281;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_281;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_ambientLux != *((_DWORD *)v4 + 10)) {
      goto LABEL_281;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_281;
  }
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    if ((v6 & 0x10000000) == 0 || self->_featureGenerationError != *((_DWORD *)v4 + 34)) {
      goto LABEL_281;
    }
  }
  else if ((v6 & 0x10000000) != 0)
  {
    goto LABEL_281;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v6 & 0x100000) == 0 || self->_enrollFeatureVectorError != *((_DWORD *)v4 + 26)) {
      goto LABEL_281;
    }
  }
  else if ((v6 & 0x100000) != 0)
  {
    goto LABEL_281;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_cameraErr != *((_DWORD *)v4 + 12)) {
      goto LABEL_281;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_281;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v6 & 0x200000) == 0 || self->_enrollResult != *((_DWORD *)v4 + 27)) {
      goto LABEL_281;
    }
  }
  else if ((v6 & 0x200000) != 0)
  {
    goto LABEL_281;
  }
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    if ((v6 & 0x8000000) == 0 || self->_faceDistance != *((_DWORD *)v4 + 33)) {
      goto LABEL_281;
    }
  }
  else if ((v6 & 0x8000000) != 0)
  {
    goto LABEL_281;
  }
  if ((*(void *)&has & 0x4000000000000) != 0)
  {
    if ((v6 & 0x4000000000000) == 0 || self->_sensorTemperature != *((_DWORD *)v4 + 56)) {
      goto LABEL_281;
    }
  }
  else if ((v6 & 0x4000000000000) != 0)
  {
    goto LABEL_281;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_rfcSetIndex != *((void *)v4 + 3)) {
      goto LABEL_281;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_281;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_rfcFrameIndex != *((void *)v4 + 2)) {
      goto LABEL_281;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_281;
  }
  if ((*(void *)&has & 0x8000000000000) != 0)
  {
    if ((v6 & 0x8000000000000) == 0) {
      goto LABEL_281;
    }
    if (self->_failedNoFace)
    {
      if (!*((unsigned char *)v4 + 228)) {
        goto LABEL_281;
      }
    }
    else if (*((unsigned char *)v4 + 228))
    {
      goto LABEL_281;
    }
  }
  else if ((v6 & 0x8000000000000) != 0)
  {
    goto LABEL_281;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_deviceOrientation != *((_DWORD *)v4 + 13)) {
      goto LABEL_281;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_281;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v6 & 0x800000) == 0 || self->_enrolledIdentityCount != *((_DWORD *)v4 + 29)) {
      goto LABEL_281;
    }
  }
  else if ((v6 & 0x800000) != 0)
  {
    goto LABEL_281;
  }
  if ((*(void *)&has & 0x10000000000000) != 0)
  {
    if ((v6 & 0x10000000000000) == 0) {
      goto LABEL_281;
    }
    if (self->_noseAndMouthOccluded)
    {
      if (!*((unsigned char *)v4 + 229)) {
        goto LABEL_281;
      }
    }
    else if (*((unsigned char *)v4 + 229))
    {
      goto LABEL_281;
    }
  }
  else if ((v6 & 0x10000000000000) != 0)
  {
    goto LABEL_281;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v6 & 0x80000) == 0 || self->_doubleErrorCountsUpperFaceOccluded != *((_DWORD *)v4 + 25)) {
      goto LABEL_281;
    }
  }
  else if ((v6 & 0x80000) != 0)
  {
    goto LABEL_281;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0 || self->_doubleErrorCountsLowerFaceOccluded != *((_DWORD *)v4 + 18)) {
      goto LABEL_281;
    }
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_281;
  }
  if ((*(void *)&has & 0x2000000000000) != 0)
  {
    if ((v6 & 0x2000000000000) == 0 || self->_frameErrorCountsUpperFaceOccluded != *((_DWORD *)v4 + 55)) {
      goto LABEL_281;
    }
  }
  else if ((v6 & 0x2000000000000) != 0)
  {
    goto LABEL_281;
  }
  uint64_t v7 = *((void *)v4 + 29);
  if ((*(void *)&has & 0x40000000000) != 0)
  {
    if ((v7 & 0x40000000000) == 0 || self->_frameErrorCountsLowerFaceOccluded != *((_DWORD *)v4 + 48)) {
      goto LABEL_281;
    }
  }
  else if ((v7 & 0x40000000000) != 0)
  {
    goto LABEL_281;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v7 & 0x400000) == 0 || self->_enrollType != *((_DWORD *)v4 + 28)) {
      goto LABEL_281;
    }
  }
  else if ((v7 & 0x400000) != 0)
  {
    goto LABEL_281;
  }
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v7 & 0x2000000) == 0 || self->_enrolledTemplateCountType0 != *((_DWORD *)v4 + 31)) {
      goto LABEL_281;
    }
  }
  else if ((v7 & 0x2000000) != 0)
  {
    goto LABEL_281;
  }
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
    if ((v7 & 0x4000000) == 0) {
      goto LABEL_276;
    }
LABEL_281:
    BOOL v8 = 0;
    goto LABEL_282;
  }
  if ((v7 & 0x4000000) == 0 || self->_enrolledTemplateCountType1 != *((_DWORD *)v4 + 32)) {
    goto LABEL_281;
  }
LABEL_276:
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v7 & 0x1000000) == 0 || self->_enrolledTemplateCountTotal != *((_DWORD *)v4 + 30)) {
      goto LABEL_281;
    }
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = (*((void *)v4 + 29) & 0x1000000) == 0;
  }
LABEL_282:

  return v8;
}

- (unint64_t)hash
{
  $235F0C9EAE0F8725BD941307083BE7CC has = self->_has;
  if ((*(unsigned char *)&has & 8) != 0)
  {
    unint64_t v57 = 2654435761u * self->_timestamp;
    if ((*(void *)&has & 0x20000000000000) != 0)
    {
LABEL_3:
      uint64_t v56 = 2654435761 * self->_overallResult;
      if (*(unsigned char *)&has) {
        goto LABEL_4;
      }
      goto LABEL_58;
    }
  }
  else
  {
    unint64_t v57 = 0;
    if ((*(void *)&has & 0x20000000000000) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v56 = 0;
  if (*(unsigned char *)&has)
  {
LABEL_4:
    unint64_t v55 = 2654435761u * self->_overallTime;
    if ((*(_DWORD *)&has & 0x10000) != 0) {
      goto LABEL_5;
    }
    goto LABEL_59;
  }
LABEL_58:
  unint64_t v55 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_5:
    uint64_t v54 = 2654435761 * self->_doubleErrorCountsOK;
    if ((*(_WORD *)&has & 0x2000) != 0) {
      goto LABEL_6;
    }
    goto LABEL_60;
  }
LABEL_59:
  uint64_t v54 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_6:
    uint64_t v53 = 2654435761 * self->_doubleErrorCountsMoreFrames;
    if ((*(_WORD *)&has & 0x8000) != 0) {
      goto LABEL_7;
    }
    goto LABEL_61;
  }
LABEL_60:
  uint64_t v53 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_7:
    uint64_t v52 = 2654435761 * self->_doubleErrorCountsNoFace;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_8;
    }
    goto LABEL_62;
  }
LABEL_61:
  uint64_t v52 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_8:
    uint64_t v51 = 2654435761 * self->_doubleErrorCountsFaceOutOfFOV;
    if ((*(_WORD *)&has & 0x4000) != 0) {
      goto LABEL_9;
    }
    goto LABEL_63;
  }
LABEL_62:
  uint64_t v51 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_9:
    uint64_t v50 = 2654435761 * self->_doubleErrorCountsMultipleFaces;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_10;
    }
    goto LABEL_64;
  }
LABEL_63:
  uint64_t v50 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_10:
    uint64_t v49 = 2654435761 * self->_doubleErrorCountsFaceTooClose;
    if ((*(_WORD *)&has & 0x800) != 0) {
      goto LABEL_11;
    }
    goto LABEL_65;
  }
LABEL_64:
  uint64_t v49 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_11:
    uint64_t v48 = 2654435761 * self->_doubleErrorCountsFaceTooFar;
    if ((*(_DWORD *)&has & 0x40000) != 0) {
      goto LABEL_12;
    }
    goto LABEL_66;
  }
LABEL_65:
  uint64_t v48 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_12:
    uint64_t v47 = 2654435761 * self->_doubleErrorCountsPoseOutRange;
    if ((*(_WORD *)&has & 0x100) != 0) {
      goto LABEL_13;
    }
    goto LABEL_67;
  }
LABEL_66:
  uint64_t v47 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_13:
    uint64_t v46 = 2654435761 * self->_doubleErrorCountsBinCovered;
    if ((*(_DWORD *)&has & 0x20000) != 0) {
      goto LABEL_14;
    }
    goto LABEL_68;
  }
LABEL_67:
  uint64_t v46 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_14:
    uint64_t v45 = 2654435761 * self->_doubleErrorCountsOccluded;
    if ((*(void *)&has & 0x400000000000) != 0) {
      goto LABEL_15;
    }
    goto LABEL_69;
  }
LABEL_68:
  uint64_t v45 = 0;
  if ((*(void *)&has & 0x400000000000) != 0)
  {
LABEL_15:
    uint64_t v44 = 2654435761 * self->_frameErrorCountsOK;
    if ((*(void *)&has & 0x80000000000) != 0) {
      goto LABEL_16;
    }
    goto LABEL_70;
  }
LABEL_69:
  uint64_t v44 = 0;
  if ((*(void *)&has & 0x80000000000) != 0)
  {
LABEL_16:
    uint64_t v43 = 2654435761 * self->_frameErrorCountsMoreFrames;
    if ((*(void *)&has & 0x200000000000) != 0) {
      goto LABEL_17;
    }
    goto LABEL_71;
  }
LABEL_70:
  uint64_t v43 = 0;
  if ((*(void *)&has & 0x200000000000) != 0)
  {
LABEL_17:
    uint64_t v42 = 2654435761 * self->_frameErrorCountsNoFace;
    if ((*(void *)&has & 0x8000000000) != 0) {
      goto LABEL_18;
    }
    goto LABEL_72;
  }
LABEL_71:
  uint64_t v42 = 0;
  if ((*(void *)&has & 0x8000000000) != 0)
  {
LABEL_18:
    uint64_t v41 = 2654435761 * self->_frameErrorCountsFaceOutOfFOV;
    if ((*(void *)&has & 0x100000000000) != 0) {
      goto LABEL_19;
    }
    goto LABEL_73;
  }
LABEL_72:
  uint64_t v41 = 0;
  if ((*(void *)&has & 0x100000000000) != 0)
  {
LABEL_19:
    uint64_t v40 = 2654435761 * self->_frameErrorCountsMultipleFaces;
    if ((*(void *)&has & 0x10000000000) != 0) {
      goto LABEL_20;
    }
    goto LABEL_74;
  }
LABEL_73:
  uint64_t v40 = 0;
  if ((*(void *)&has & 0x10000000000) != 0)
  {
LABEL_20:
    uint64_t v39 = 2654435761 * self->_frameErrorCountsFaceTooClose;
    if ((*(void *)&has & 0x20000000000) != 0) {
      goto LABEL_21;
    }
    goto LABEL_75;
  }
LABEL_74:
  uint64_t v39 = 0;
  if ((*(void *)&has & 0x20000000000) != 0)
  {
LABEL_21:
    uint64_t v38 = 2654435761 * self->_frameErrorCountsFaceTooFar;
    if ((*(void *)&has & 0x1000000000000) != 0) {
      goto LABEL_22;
    }
    goto LABEL_76;
  }
LABEL_75:
  uint64_t v38 = 0;
  if ((*(void *)&has & 0x1000000000000) != 0)
  {
LABEL_22:
    uint64_t v37 = 2654435761 * self->_frameErrorCountsPoseOutRange;
    if ((*(void *)&has & 0x4000000000) != 0) {
      goto LABEL_23;
    }
    goto LABEL_77;
  }
LABEL_76:
  uint64_t v37 = 0;
  if ((*(void *)&has & 0x4000000000) != 0)
  {
LABEL_23:
    uint64_t v36 = 2654435761 * self->_frameErrorCountsBinCovered;
    if ((*(void *)&has & 0x800000000000) != 0) {
      goto LABEL_24;
    }
    goto LABEL_78;
  }
LABEL_77:
  uint64_t v36 = 0;
  if ((*(void *)&has & 0x800000000000) != 0)
  {
LABEL_24:
    uint64_t v35 = 2654435761 * self->_frameErrorCountsOccluded;
    if ((*(_DWORD *)&has & 0x20000000) != 0) {
      goto LABEL_25;
    }
    goto LABEL_79;
  }
LABEL_78:
  uint64_t v35 = 0;
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
LABEL_25:
    uint64_t v34 = 2654435761 * self->_frameCountBin00;
    if ((*(_DWORD *)&has & 0x40000000) != 0) {
      goto LABEL_26;
    }
    goto LABEL_80;
  }
LABEL_79:
  uint64_t v34 = 0;
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
LABEL_26:
    uint64_t v33 = 2654435761 * self->_frameCountBin01;
    if ((*(_DWORD *)&has & 0x80000000) != 0) {
      goto LABEL_27;
    }
    goto LABEL_81;
  }
LABEL_80:
  uint64_t v33 = 0;
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
LABEL_27:
    uint64_t v32 = 2654435761 * self->_frameCountBin02;
    if ((*(void *)&has & 0x100000000) != 0) {
      goto LABEL_28;
    }
    goto LABEL_82;
  }
LABEL_81:
  uint64_t v32 = 0;
  if ((*(void *)&has & 0x100000000) != 0)
  {
LABEL_28:
    uint64_t v31 = 2654435761 * self->_frameCountBin10;
    if ((*(void *)&has & 0x200000000) != 0) {
      goto LABEL_29;
    }
    goto LABEL_83;
  }
LABEL_82:
  uint64_t v31 = 0;
  if ((*(void *)&has & 0x200000000) != 0)
  {
LABEL_29:
    uint64_t v30 = 2654435761 * self->_frameCountBin11;
    if ((*(void *)&has & 0x400000000) != 0) {
      goto LABEL_30;
    }
    goto LABEL_84;
  }
LABEL_83:
  uint64_t v30 = 0;
  if ((*(void *)&has & 0x400000000) != 0)
  {
LABEL_30:
    uint64_t v3 = 2654435761 * self->_frameCountBin12;
    if ((*(void *)&has & 0x800000000) != 0) {
      goto LABEL_31;
    }
    goto LABEL_85;
  }
LABEL_84:
  uint64_t v3 = 0;
  if ((*(void *)&has & 0x800000000) != 0)
  {
LABEL_31:
    uint64_t v4 = 2654435761 * self->_frameCountBin20;
    if ((*(void *)&has & 0x1000000000) != 0) {
      goto LABEL_32;
    }
    goto LABEL_86;
  }
LABEL_85:
  uint64_t v4 = 0;
  if ((*(void *)&has & 0x1000000000) != 0)
  {
LABEL_32:
    uint64_t v5 = 2654435761 * self->_frameCountBin21;
    if ((*(void *)&has & 0x2000000000) != 0) {
      goto LABEL_33;
    }
    goto LABEL_87;
  }
LABEL_86:
  uint64_t v5 = 0;
  if ((*(void *)&has & 0x2000000000) != 0)
  {
LABEL_33:
    uint64_t v6 = 2654435761 * self->_frameCountBin22;
    if ((*(unsigned char *)&has & 0x20) != 0) {
      goto LABEL_34;
    }
    goto LABEL_88;
  }
LABEL_87:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
LABEL_34:
    uint64_t v7 = 2654435761 * self->_bioCaptureSequenceCount;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_35;
    }
    goto LABEL_89;
  }
LABEL_88:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
LABEL_35:
    uint64_t v8 = 2654435761 * self->_ambientLux;
    if ((*(_DWORD *)&has & 0x10000000) != 0) {
      goto LABEL_36;
    }
    goto LABEL_90;
  }
LABEL_89:
  uint64_t v8 = 0;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
LABEL_36:
    uint64_t v9 = 2654435761 * self->_featureGenerationError;
    if ((*(_DWORD *)&has & 0x100000) != 0) {
      goto LABEL_37;
    }
    goto LABEL_91;
  }
LABEL_90:
  uint64_t v9 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_37:
    uint64_t v10 = 2654435761 * self->_enrollFeatureVectorError;
    if ((*(unsigned char *)&has & 0x40) != 0) {
      goto LABEL_38;
    }
    goto LABEL_92;
  }
LABEL_91:
  uint64_t v10 = 0;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
LABEL_38:
    uint64_t v11 = 2654435761 * self->_cameraErr;
    if ((*(_DWORD *)&has & 0x200000) != 0) {
      goto LABEL_39;
    }
    goto LABEL_93;
  }
LABEL_92:
  uint64_t v11 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_39:
    uint64_t v12 = 2654435761 * self->_enrollResult;
    if ((*(_DWORD *)&has & 0x8000000) != 0) {
      goto LABEL_40;
    }
    goto LABEL_94;
  }
LABEL_93:
  uint64_t v12 = 0;
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
LABEL_40:
    uint64_t v13 = 2654435761 * self->_faceDistance;
    if ((*(void *)&has & 0x4000000000000) != 0) {
      goto LABEL_41;
    }
    goto LABEL_95;
  }
LABEL_94:
  uint64_t v13 = 0;
  if ((*(void *)&has & 0x4000000000000) != 0)
  {
LABEL_41:
    uint64_t v14 = 2654435761 * self->_sensorTemperature;
    if ((*(unsigned char *)&has & 4) != 0) {
      goto LABEL_42;
    }
    goto LABEL_96;
  }
LABEL_95:
  uint64_t v14 = 0;
  if ((*(unsigned char *)&has & 4) != 0)
  {
LABEL_42:
    uint64_t v15 = 2654435761 * self->_rfcSetIndex;
    if ((*(unsigned char *)&has & 2) != 0) {
      goto LABEL_43;
    }
    goto LABEL_97;
  }
LABEL_96:
  uint64_t v15 = 0;
  if ((*(unsigned char *)&has & 2) != 0)
  {
LABEL_43:
    uint64_t v16 = 2654435761 * self->_rfcFrameIndex;
    if ((*(void *)&has & 0x8000000000000) != 0) {
      goto LABEL_44;
    }
    goto LABEL_98;
  }
LABEL_97:
  uint64_t v16 = 0;
  if ((*(void *)&has & 0x8000000000000) != 0)
  {
LABEL_44:
    uint64_t v17 = 2654435761 * self->_failedNoFace;
    if ((*(unsigned char *)&has & 0x80) != 0) {
      goto LABEL_45;
    }
    goto LABEL_99;
  }
LABEL_98:
  uint64_t v17 = 0;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
LABEL_45:
    uint64_t v18 = 2654435761 * self->_deviceOrientation;
    if ((*(_DWORD *)&has & 0x800000) != 0) {
      goto LABEL_46;
    }
    goto LABEL_100;
  }
LABEL_99:
  uint64_t v18 = 0;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
LABEL_46:
    uint64_t v19 = 2654435761 * self->_enrolledIdentityCount;
    if ((*(void *)&has & 0x10000000000000) != 0) {
      goto LABEL_47;
    }
    goto LABEL_101;
  }
LABEL_100:
  uint64_t v19 = 0;
  if ((*(void *)&has & 0x10000000000000) != 0)
  {
LABEL_47:
    uint64_t v20 = 2654435761 * self->_noseAndMouthOccluded;
    if ((*(_DWORD *)&has & 0x80000) != 0) {
      goto LABEL_48;
    }
    goto LABEL_102;
  }
LABEL_101:
  uint64_t v20 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_48:
    uint64_t v21 = 2654435761 * self->_doubleErrorCountsUpperFaceOccluded;
    if ((*(_WORD *)&has & 0x1000) != 0) {
      goto LABEL_49;
    }
    goto LABEL_103;
  }
LABEL_102:
  uint64_t v21 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_49:
    uint64_t v22 = 2654435761 * self->_doubleErrorCountsLowerFaceOccluded;
    if ((*(void *)&has & 0x2000000000000) != 0) {
      goto LABEL_50;
    }
    goto LABEL_104;
  }
LABEL_103:
  uint64_t v22 = 0;
  if ((*(void *)&has & 0x2000000000000) != 0)
  {
LABEL_50:
    uint64_t v23 = 2654435761 * self->_frameErrorCountsUpperFaceOccluded;
    if ((*(void *)&has & 0x40000000000) != 0) {
      goto LABEL_51;
    }
    goto LABEL_105;
  }
LABEL_104:
  uint64_t v23 = 0;
  if ((*(void *)&has & 0x40000000000) != 0)
  {
LABEL_51:
    uint64_t v24 = 2654435761 * self->_frameErrorCountsLowerFaceOccluded;
    if ((*(_DWORD *)&has & 0x400000) != 0) {
      goto LABEL_52;
    }
    goto LABEL_106;
  }
LABEL_105:
  uint64_t v24 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_52:
    uint64_t v25 = 2654435761 * self->_enrollType;
    if ((*(_DWORD *)&has & 0x2000000) != 0) {
      goto LABEL_53;
    }
    goto LABEL_107;
  }
LABEL_106:
  uint64_t v25 = 0;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
LABEL_53:
    uint64_t v26 = 2654435761 * self->_enrolledTemplateCountType0;
    if ((*(_DWORD *)&has & 0x4000000) != 0) {
      goto LABEL_54;
    }
LABEL_108:
    uint64_t v27 = 0;
    if ((*(_DWORD *)&has & 0x1000000) != 0) {
      goto LABEL_55;
    }
LABEL_109:
    uint64_t v28 = 0;
    return v56 ^ v57 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28;
  }
LABEL_107:
  uint64_t v26 = 0;
  if ((*(_DWORD *)&has & 0x4000000) == 0) {
    goto LABEL_108;
  }
LABEL_54:
  uint64_t v27 = 2654435761 * self->_enrolledTemplateCountType1;
  if ((*(_DWORD *)&has & 0x1000000) == 0) {
    goto LABEL_109;
  }
LABEL_55:
  uint64_t v28 = 2654435761 * self->_enrolledTemplateCountTotal;
  return v56 ^ v57 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = *((void *)v4 + 29);
  if ((v5 & 8) != 0)
  {
    self->_timestamp = *((void *)v4 + 4);
    *(void *)&self->_has |= 8uLL;
    uint64_t v5 = *((void *)v4 + 29);
    if ((v5 & 0x20000000000000) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_61;
    }
  }
  else if ((v5 & 0x20000000000000) == 0)
  {
    goto LABEL_3;
  }
  self->_overallResult = *((unsigned char *)v4 + 230);
  *(void *)&self->_has |= 0x20000000000000uLL;
  uint64_t v5 = *((void *)v4 + 29);
  if ((v5 & 1) == 0)
  {
LABEL_4:
    if ((v5 & 0x10000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_62;
  }
LABEL_61:
  self->_overallTime = *((void *)v4 + 1);
  *(void *)&self->_has |= 1uLL;
  uint64_t v5 = *((void *)v4 + 29);
  if ((v5 & 0x10000) == 0)
  {
LABEL_5:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_63;
  }
LABEL_62:
  self->_doubleErrorCountsOK = *((_DWORD *)v4 + 22);
  *(void *)&self->_has |= 0x10000uLL;
  uint64_t v5 = *((void *)v4 + 29);
  if ((v5 & 0x2000) == 0)
  {
LABEL_6:
    if ((v5 & 0x8000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_64;
  }
LABEL_63:
  self->_doubleErrorCountsMoreFrames = *((_DWORD *)v4 + 19);
  *(void *)&self->_has |= 0x2000uLL;
  uint64_t v5 = *((void *)v4 + 29);
  if ((v5 & 0x8000) == 0)
  {
LABEL_7:
    if ((v5 & 0x200) == 0) {
      goto LABEL_8;
    }
    goto LABEL_65;
  }
LABEL_64:
  self->_doubleErrorCountsNoFace = *((_DWORD *)v4 + 21);
  *(void *)&self->_has |= 0x8000uLL;
  uint64_t v5 = *((void *)v4 + 29);
  if ((v5 & 0x200) == 0)
  {
LABEL_8:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_66;
  }
LABEL_65:
  self->_doubleErrorCountsFaceOutOfFOV = *((_DWORD *)v4 + 15);
  *(void *)&self->_has |= 0x200uLL;
  uint64_t v5 = *((void *)v4 + 29);
  if ((v5 & 0x4000) == 0)
  {
LABEL_9:
    if ((v5 & 0x400) == 0) {
      goto LABEL_10;
    }
    goto LABEL_67;
  }
LABEL_66:
  self->_doubleErrorCountsMultipleFaces = *((_DWORD *)v4 + 20);
  *(void *)&self->_has |= 0x4000uLL;
  uint64_t v5 = *((void *)v4 + 29);
  if ((v5 & 0x400) == 0)
  {
LABEL_10:
    if ((v5 & 0x800) == 0) {
      goto LABEL_11;
    }
    goto LABEL_68;
  }
LABEL_67:
  self->_doubleErrorCountsFaceTooClose = *((_DWORD *)v4 + 16);
  *(void *)&self->_has |= 0x400uLL;
  uint64_t v5 = *((void *)v4 + 29);
  if ((v5 & 0x800) == 0)
  {
LABEL_11:
    if ((v5 & 0x40000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_69;
  }
LABEL_68:
  self->_doubleErrorCountsFaceTooFar = *((_DWORD *)v4 + 17);
  *(void *)&self->_has |= 0x800uLL;
  uint64_t v5 = *((void *)v4 + 29);
  if ((v5 & 0x40000) == 0)
  {
LABEL_12:
    if ((v5 & 0x100) == 0) {
      goto LABEL_13;
    }
    goto LABEL_70;
  }
LABEL_69:
  self->_doubleErrorCountsPoseOutRange = *((_DWORD *)v4 + 24);
  *(void *)&self->_has |= 0x40000uLL;
  uint64_t v5 = *((void *)v4 + 29);
  if ((v5 & 0x100) == 0)
  {
LABEL_13:
    if ((v5 & 0x20000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_71;
  }
LABEL_70:
  self->_doubleErrorCountsBinCovered = *((_DWORD *)v4 + 14);
  *(void *)&self->_has |= 0x100uLL;
  uint64_t v5 = *((void *)v4 + 29);
  if ((v5 & 0x20000) == 0)
  {
LABEL_14:
    if ((v5 & 0x400000000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_72;
  }
LABEL_71:
  self->_doubleErrorCountsOccluded = *((_DWORD *)v4 + 23);
  *(void *)&self->_has |= 0x20000uLL;
  uint64_t v5 = *((void *)v4 + 29);
  if ((v5 & 0x400000000000) == 0)
  {
LABEL_15:
    if ((v5 & 0x80000000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_73;
  }
LABEL_72:
  self->_frameErrorCountsOK = *((_DWORD *)v4 + 52);
  *(void *)&self->_has |= 0x400000000000uLL;
  uint64_t v5 = *((void *)v4 + 29);
  if ((v5 & 0x80000000000) == 0)
  {
LABEL_16:
    if ((v5 & 0x200000000000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_74;
  }
LABEL_73:
  self->_frameErrorCountsMoreFrames = *((_DWORD *)v4 + 49);
  *(void *)&self->_has |= 0x80000000000uLL;
  uint64_t v5 = *((void *)v4 + 29);
  if ((v5 & 0x200000000000) == 0)
  {
LABEL_17:
    if ((v5 & 0x8000000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_75;
  }
LABEL_74:
  self->_frameErrorCountsNoFace = *((_DWORD *)v4 + 51);
  *(void *)&self->_has |= 0x200000000000uLL;
  uint64_t v5 = *((void *)v4 + 29);
  if ((v5 & 0x8000000000) == 0)
  {
LABEL_18:
    if ((v5 & 0x100000000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_76;
  }
LABEL_75:
  self->_frameErrorCountsFaceOutOfFOV = *((_DWORD *)v4 + 45);
  *(void *)&self->_has |= 0x8000000000uLL;
  uint64_t v5 = *((void *)v4 + 29);
  if ((v5 & 0x100000000000) == 0)
  {
LABEL_19:
    if ((v5 & 0x10000000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_77;
  }
LABEL_76:
  self->_frameErrorCountsMultipleFaces = *((_DWORD *)v4 + 50);
  *(void *)&self->_has |= 0x100000000000uLL;
  uint64_t v5 = *((void *)v4 + 29);
  if ((v5 & 0x10000000000) == 0)
  {
LABEL_20:
    if ((v5 & 0x20000000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_78;
  }
LABEL_77:
  self->_frameErrorCountsFaceTooClose = *((_DWORD *)v4 + 46);
  *(void *)&self->_has |= 0x10000000000uLL;
  uint64_t v5 = *((void *)v4 + 29);
  if ((v5 & 0x20000000000) == 0)
  {
LABEL_21:
    if ((v5 & 0x1000000000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_79;
  }
LABEL_78:
  self->_frameErrorCountsFaceTooFar = *((_DWORD *)v4 + 47);
  *(void *)&self->_has |= 0x20000000000uLL;
  uint64_t v5 = *((void *)v4 + 29);
  if ((v5 & 0x1000000000000) == 0)
  {
LABEL_22:
    if ((v5 & 0x4000000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_80;
  }
LABEL_79:
  self->_frameErrorCountsPoseOutRange = *((_DWORD *)v4 + 54);
  *(void *)&self->_has |= 0x1000000000000uLL;
  uint64_t v5 = *((void *)v4 + 29);
  if ((v5 & 0x4000000000) == 0)
  {
LABEL_23:
    if ((v5 & 0x800000000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_81;
  }
LABEL_80:
  self->_frameErrorCountsBinCovered = *((_DWORD *)v4 + 44);
  *(void *)&self->_has |= 0x4000000000uLL;
  uint64_t v5 = *((void *)v4 + 29);
  if ((v5 & 0x800000000000) == 0)
  {
LABEL_24:
    if ((v5 & 0x20000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_82;
  }
LABEL_81:
  self->_frameErrorCountsOccluded = *((_DWORD *)v4 + 53);
  *(void *)&self->_has |= 0x800000000000uLL;
  uint64_t v5 = *((void *)v4 + 29);
  if ((v5 & 0x20000000) == 0)
  {
LABEL_25:
    if ((v5 & 0x40000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_83;
  }
LABEL_82:
  self->_frameCountBin00 = *((_DWORD *)v4 + 35);
  *(void *)&self->_has |= 0x20000000uLL;
  uint64_t v5 = *((void *)v4 + 29);
  if ((v5 & 0x40000000) == 0)
  {
LABEL_26:
    if ((v5 & 0x80000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_84;
  }
LABEL_83:
  self->_frameCountBin01 = *((_DWORD *)v4 + 36);
  *(void *)&self->_has |= 0x40000000uLL;
  uint64_t v5 = *((void *)v4 + 29);
  if ((v5 & 0x80000000) == 0)
  {
LABEL_27:
    if ((v5 & 0x100000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_85;
  }
LABEL_84:
  self->_frameCountBin02 = *((_DWORD *)v4 + 37);
  *(void *)&self->_has |= 0x80000000uLL;
  uint64_t v5 = *((void *)v4 + 29);
  if ((v5 & 0x100000000) == 0)
  {
LABEL_28:
    if ((v5 & 0x200000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_86;
  }
LABEL_85:
  self->_frameCountBin10 = *((_DWORD *)v4 + 38);
  *(void *)&self->_has |= 0x100000000uLL;
  uint64_t v5 = *((void *)v4 + 29);
  if ((v5 & 0x200000000) == 0)
  {
LABEL_29:
    if ((v5 & 0x400000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_87;
  }
LABEL_86:
  self->_frameCountBin11 = *((_DWORD *)v4 + 39);
  *(void *)&self->_has |= 0x200000000uLL;
  uint64_t v5 = *((void *)v4 + 29);
  if ((v5 & 0x400000000) == 0)
  {
LABEL_30:
    if ((v5 & 0x800000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_88;
  }
LABEL_87:
  self->_frameCountBin12 = *((_DWORD *)v4 + 40);
  *(void *)&self->_has |= 0x400000000uLL;
  uint64_t v5 = *((void *)v4 + 29);
  if ((v5 & 0x800000000) == 0)
  {
LABEL_31:
    if ((v5 & 0x1000000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_89;
  }
LABEL_88:
  self->_frameCountBin20 = *((_DWORD *)v4 + 41);
  *(void *)&self->_has |= 0x800000000uLL;
  uint64_t v5 = *((void *)v4 + 29);
  if ((v5 & 0x1000000000) == 0)
  {
LABEL_32:
    if ((v5 & 0x2000000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_90;
  }
LABEL_89:
  self->_frameCountBin21 = *((_DWORD *)v4 + 42);
  *(void *)&self->_has |= 0x1000000000uLL;
  uint64_t v5 = *((void *)v4 + 29);
  if ((v5 & 0x2000000000) == 0)
  {
LABEL_33:
    if ((v5 & 0x20) == 0) {
      goto LABEL_34;
    }
    goto LABEL_91;
  }
LABEL_90:
  self->_frameCountBin22 = *((_DWORD *)v4 + 43);
  *(void *)&self->_has |= 0x2000000000uLL;
  uint64_t v5 = *((void *)v4 + 29);
  if ((v5 & 0x20) == 0)
  {
LABEL_34:
    if ((v5 & 0x10) == 0) {
      goto LABEL_35;
    }
    goto LABEL_92;
  }
LABEL_91:
  self->_bioCaptureSequenceCount = *((_DWORD *)v4 + 11);
  *(void *)&self->_has |= 0x20uLL;
  uint64_t v5 = *((void *)v4 + 29);
  if ((v5 & 0x10) == 0)
  {
LABEL_35:
    if ((v5 & 0x10000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_93;
  }
LABEL_92:
  self->_ambientLux = *((_DWORD *)v4 + 10);
  *(void *)&self->_has |= 0x10uLL;
  uint64_t v5 = *((void *)v4 + 29);
  if ((v5 & 0x10000000) == 0)
  {
LABEL_36:
    if ((v5 & 0x100000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_94;
  }
LABEL_93:
  self->_featureGenerationError = *((_DWORD *)v4 + 34);
  *(void *)&self->_has |= 0x10000000uLL;
  uint64_t v5 = *((void *)v4 + 29);
  if ((v5 & 0x100000) == 0)
  {
LABEL_37:
    if ((v5 & 0x40) == 0) {
      goto LABEL_38;
    }
    goto LABEL_95;
  }
LABEL_94:
  self->_enrollFeatureVectorError = *((_DWORD *)v4 + 26);
  *(void *)&self->_has |= 0x100000uLL;
  uint64_t v5 = *((void *)v4 + 29);
  if ((v5 & 0x40) == 0)
  {
LABEL_38:
    if ((v5 & 0x200000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_96;
  }
LABEL_95:
  self->_cameraErr = *((_DWORD *)v4 + 12);
  *(void *)&self->_has |= 0x40uLL;
  uint64_t v5 = *((void *)v4 + 29);
  if ((v5 & 0x200000) == 0)
  {
LABEL_39:
    if ((v5 & 0x8000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_97;
  }
LABEL_96:
  self->_enrollResult = *((_DWORD *)v4 + 27);
  *(void *)&self->_has |= 0x200000uLL;
  uint64_t v5 = *((void *)v4 + 29);
  if ((v5 & 0x8000000) == 0)
  {
LABEL_40:
    if ((v5 & 0x4000000000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_98;
  }
LABEL_97:
  self->_faceDistance = *((_DWORD *)v4 + 33);
  *(void *)&self->_has |= 0x8000000uLL;
  uint64_t v5 = *((void *)v4 + 29);
  if ((v5 & 0x4000000000000) == 0)
  {
LABEL_41:
    if ((v5 & 4) == 0) {
      goto LABEL_42;
    }
    goto LABEL_99;
  }
LABEL_98:
  self->_sensorTemperature = *((_DWORD *)v4 + 56);
  *(void *)&self->_has |= 0x4000000000000uLL;
  uint64_t v5 = *((void *)v4 + 29);
  if ((v5 & 4) == 0)
  {
LABEL_42:
    if ((v5 & 2) == 0) {
      goto LABEL_43;
    }
    goto LABEL_100;
  }
LABEL_99:
  self->_rfcSetIndex = *((void *)v4 + 3);
  *(void *)&self->_has |= 4uLL;
  uint64_t v5 = *((void *)v4 + 29);
  if ((v5 & 2) == 0)
  {
LABEL_43:
    if ((v5 & 0x8000000000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_101;
  }
LABEL_100:
  self->_rfcFrameIndex = *((void *)v4 + 2);
  *(void *)&self->_has |= 2uLL;
  uint64_t v5 = *((void *)v4 + 29);
  if ((v5 & 0x8000000000000) == 0)
  {
LABEL_44:
    if ((v5 & 0x80) == 0) {
      goto LABEL_45;
    }
    goto LABEL_102;
  }
LABEL_101:
  self->_failedNoFace = *((unsigned char *)v4 + 228);
  *(void *)&self->_has |= 0x8000000000000uLL;
  uint64_t v5 = *((void *)v4 + 29);
  if ((v5 & 0x80) == 0)
  {
LABEL_45:
    if ((v5 & 0x800000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_103;
  }
LABEL_102:
  self->_deviceOrientation = *((_DWORD *)v4 + 13);
  *(void *)&self->_has |= 0x80uLL;
  uint64_t v5 = *((void *)v4 + 29);
  if ((v5 & 0x800000) == 0)
  {
LABEL_46:
    if ((v5 & 0x10000000000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_104;
  }
LABEL_103:
  self->_enrolledIdentityCount = *((_DWORD *)v4 + 29);
  *(void *)&self->_has |= 0x800000uLL;
  uint64_t v5 = *((void *)v4 + 29);
  if ((v5 & 0x10000000000000) == 0)
  {
LABEL_47:
    if ((v5 & 0x80000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_105;
  }
LABEL_104:
  self->_noseAndMouthOccluded = *((unsigned char *)v4 + 229);
  *(void *)&self->_has |= 0x10000000000000uLL;
  uint64_t v5 = *((void *)v4 + 29);
  if ((v5 & 0x80000) == 0)
  {
LABEL_48:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_106;
  }
LABEL_105:
  self->_doubleErrorCountsUpperFaceOccluded = *((_DWORD *)v4 + 25);
  *(void *)&self->_has |= 0x80000uLL;
  uint64_t v5 = *((void *)v4 + 29);
  if ((v5 & 0x1000) == 0)
  {
LABEL_49:
    if ((v5 & 0x2000000000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_107;
  }
LABEL_106:
  self->_doubleErrorCountsLowerFaceOccluded = *((_DWORD *)v4 + 18);
  *(void *)&self->_has |= 0x1000uLL;
  uint64_t v5 = *((void *)v4 + 29);
  if ((v5 & 0x2000000000000) == 0)
  {
LABEL_50:
    if ((v5 & 0x40000000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_108;
  }
LABEL_107:
  self->_frameErrorCountsUpperFaceOccluded = *((_DWORD *)v4 + 55);
  *(void *)&self->_has |= 0x2000000000000uLL;
  uint64_t v5 = *((void *)v4 + 29);
  if ((v5 & 0x40000000000) == 0)
  {
LABEL_51:
    if ((v5 & 0x400000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_109;
  }
LABEL_108:
  self->_frameErrorCountsLowerFaceOccluded = *((_DWORD *)v4 + 48);
  *(void *)&self->_has |= 0x40000000000uLL;
  uint64_t v5 = *((void *)v4 + 29);
  if ((v5 & 0x400000) == 0)
  {
LABEL_52:
    if ((v5 & 0x2000000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_110;
  }
LABEL_109:
  self->_enrollType = *((_DWORD *)v4 + 28);
  *(void *)&self->_has |= 0x400000uLL;
  uint64_t v5 = *((void *)v4 + 29);
  if ((v5 & 0x2000000) == 0)
  {
LABEL_53:
    if ((v5 & 0x4000000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_111;
  }
LABEL_110:
  self->_enrolledTemplateCountType0 = *((_DWORD *)v4 + 31);
  *(void *)&self->_has |= 0x2000000uLL;
  uint64_t v5 = *((void *)v4 + 29);
  if ((v5 & 0x4000000) == 0)
  {
LABEL_54:
    if ((v5 & 0x1000000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_55;
  }
LABEL_111:
  self->_enrolledTemplateCountType1 = *((_DWORD *)v4 + 32);
  *(void *)&self->_has |= 0x4000000uLL;
  if ((*((void *)v4 + 29) & 0x1000000) != 0)
  {
LABEL_55:
    self->_enrolledTemplateCountTotal = *((_DWORD *)v4 + 30);
    *(void *)&self->_has |= 0x1000000uLL;
  }
LABEL_56:
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)overallResult
{
  return self->_overallResult;
}

- (unint64_t)overallTime
{
  return self->_overallTime;
}

- (unsigned)doubleErrorCountsOK
{
  return self->_doubleErrorCountsOK;
}

- (unsigned)doubleErrorCountsMoreFrames
{
  return self->_doubleErrorCountsMoreFrames;
}

- (unsigned)doubleErrorCountsNoFace
{
  return self->_doubleErrorCountsNoFace;
}

- (unsigned)doubleErrorCountsFaceOutOfFOV
{
  return self->_doubleErrorCountsFaceOutOfFOV;
}

- (unsigned)doubleErrorCountsMultipleFaces
{
  return self->_doubleErrorCountsMultipleFaces;
}

- (unsigned)doubleErrorCountsFaceTooClose
{
  return self->_doubleErrorCountsFaceTooClose;
}

- (unsigned)doubleErrorCountsFaceTooFar
{
  return self->_doubleErrorCountsFaceTooFar;
}

- (unsigned)doubleErrorCountsPoseOutRange
{
  return self->_doubleErrorCountsPoseOutRange;
}

- (unsigned)doubleErrorCountsBinCovered
{
  return self->_doubleErrorCountsBinCovered;
}

- (unsigned)doubleErrorCountsOccluded
{
  return self->_doubleErrorCountsOccluded;
}

- (unsigned)frameErrorCountsOK
{
  return self->_frameErrorCountsOK;
}

- (unsigned)frameErrorCountsMoreFrames
{
  return self->_frameErrorCountsMoreFrames;
}

- (unsigned)frameErrorCountsNoFace
{
  return self->_frameErrorCountsNoFace;
}

- (unsigned)frameErrorCountsFaceOutOfFOV
{
  return self->_frameErrorCountsFaceOutOfFOV;
}

- (unsigned)frameErrorCountsMultipleFaces
{
  return self->_frameErrorCountsMultipleFaces;
}

- (unsigned)frameErrorCountsFaceTooClose
{
  return self->_frameErrorCountsFaceTooClose;
}

- (unsigned)frameErrorCountsFaceTooFar
{
  return self->_frameErrorCountsFaceTooFar;
}

- (unsigned)frameErrorCountsPoseOutRange
{
  return self->_frameErrorCountsPoseOutRange;
}

- (unsigned)frameErrorCountsBinCovered
{
  return self->_frameErrorCountsBinCovered;
}

- (unsigned)frameErrorCountsOccluded
{
  return self->_frameErrorCountsOccluded;
}

- (int)frameCountBin00
{
  return self->_frameCountBin00;
}

- (int)frameCountBin01
{
  return self->_frameCountBin01;
}

- (int)frameCountBin02
{
  return self->_frameCountBin02;
}

- (int)frameCountBin10
{
  return self->_frameCountBin10;
}

- (int)frameCountBin11
{
  return self->_frameCountBin11;
}

- (int)frameCountBin12
{
  return self->_frameCountBin12;
}

- (int)frameCountBin20
{
  return self->_frameCountBin20;
}

- (int)frameCountBin21
{
  return self->_frameCountBin21;
}

- (int)frameCountBin22
{
  return self->_frameCountBin22;
}

- (unsigned)bioCaptureSequenceCount
{
  return self->_bioCaptureSequenceCount;
}

- (int)ambientLux
{
  return self->_ambientLux;
}

- (unsigned)featureGenerationError
{
  return self->_featureGenerationError;
}

- (unsigned)enrollFeatureVectorError
{
  return self->_enrollFeatureVectorError;
}

- (int)cameraErr
{
  return self->_cameraErr;
}

- (unsigned)enrollResult
{
  return self->_enrollResult;
}

- (unsigned)faceDistance
{
  return self->_faceDistance;
}

- (int)sensorTemperature
{
  return self->_sensorTemperature;
}

- (int64_t)rfcSetIndex
{
  return self->_rfcSetIndex;
}

- (int64_t)rfcFrameIndex
{
  return self->_rfcFrameIndex;
}

- (BOOL)failedNoFace
{
  return self->_failedNoFace;
}

- (unsigned)deviceOrientation
{
  return self->_deviceOrientation;
}

- (unsigned)enrolledIdentityCount
{
  return self->_enrolledIdentityCount;
}

- (BOOL)noseAndMouthOccluded
{
  return self->_noseAndMouthOccluded;
}

- (unsigned)doubleErrorCountsUpperFaceOccluded
{
  return self->_doubleErrorCountsUpperFaceOccluded;
}

- (unsigned)doubleErrorCountsLowerFaceOccluded
{
  return self->_doubleErrorCountsLowerFaceOccluded;
}

- (unsigned)frameErrorCountsUpperFaceOccluded
{
  return self->_frameErrorCountsUpperFaceOccluded;
}

- (unsigned)frameErrorCountsLowerFaceOccluded
{
  return self->_frameErrorCountsLowerFaceOccluded;
}

- (unsigned)enrollType
{
  return self->_enrollType;
}

- (unsigned)enrolledTemplateCountType0
{
  return self->_enrolledTemplateCountType0;
}

- (unsigned)enrolledTemplateCountType1
{
  return self->_enrolledTemplateCountType1;
}

- (unsigned)enrolledTemplateCountTotal
{
  return self->_enrolledTemplateCountTotal;
}

@end