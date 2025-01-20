@interface ALCLNatalieFeatures
- (BOOL)fStanding;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (float)fIQRX;
- (float)fIQRY;
- (float)fIQRZ;
- (float)fMachineFrequency;
- (float)fVectorMagnitude;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)fEpochTypeAsString:(int)a3;
- (int)StringAsFEpochType:(id)a3;
- (int)fEpochType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFEpochType:(int)a3;
- (void)setFIQRX:(float)a3;
- (void)setFIQRY:(float)a3;
- (void)setFIQRZ:(float)a3;
- (void)setFMachineFrequency:(float)a3;
- (void)setFStanding:(BOOL)a3;
- (void)setFVectorMagnitude:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALCLNatalieFeatures

- (id)fEpochTypeAsString:(int)a3
{
  if (a3 >= 3) {
    return +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return *(&off_1022B3918 + a3);
  }
}

- (int)StringAsFEpochType:(id)a3
{
  if ([a3 isEqualToString:@"kInvalidEpoch"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"K2560MsType"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"k10240MsType"]) {
    return 2;
  }
  return 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)ALCLNatalieFeatures;
  return +[NSString stringWithFormat:@"%@ %@", [(ALCLNatalieFeatures *)&v3 description], [(ALCLNatalieFeatures *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  *(float *)&double v4 = self->_fVectorMagnitude;
  [v3 setObject:[+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4)] forKey:@"fVectorMagnitude"];
  *(float *)&double v5 = self->_fIQRX;
  [v3 setObject:[+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v5)] forKey:@"fIQRX"];
  *(float *)&double v6 = self->_fIQRY;
  [v3 setObject:[+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v6)] forKey:@"fIQRY"];
  *(float *)&double v7 = self->_fIQRZ;
  [v3 setObject:[+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v7)] forKey:@"fIQRZ"];
  *(float *)&double v8 = self->_fMachineFrequency;
  [v3 setObject:[+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v8)] forKey:@"fMachineFrequency"];
  uint64_t fEpochType = self->_fEpochType;
  if (fEpochType >= 3) {
    v10 = +[NSString stringWithFormat:@"(unknown: %i)", self->_fEpochType];
  }
  else {
    v10 = (NSString *)*(&off_1022B3918 + fEpochType);
  }
  [v3 setObject:v10 forKey:@"fEpochType"];
  [v3 setObject:[NSNumber numberWithBool:self->_fStanding] forKey:@"fStanding"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10046BE44((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteInt32Field();

  PBDataWriterWriteBOOLField();
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 7) = LODWORD(self->_fVectorMagnitude);
  *((_DWORD *)a3 + 3) = LODWORD(self->_fIQRX);
  *((_DWORD *)a3 + 4) = LODWORD(self->_fIQRY);
  *((_DWORD *)a3 + 5) = LODWORD(self->_fIQRZ);
  *((_DWORD *)a3 + 6) = LODWORD(self->_fMachineFrequency);
  *((_DWORD *)a3 + 2) = self->_fEpochType;
  *((unsigned char *)a3 + 32) = self->_fStanding;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  *((_DWORD *)result + 7) = LODWORD(self->_fVectorMagnitude);
  *((_DWORD *)result + 3) = LODWORD(self->_fIQRX);
  *((_DWORD *)result + 4) = LODWORD(self->_fIQRY);
  *((_DWORD *)result + 5) = LODWORD(self->_fIQRZ);
  *((_DWORD *)result + 6) = LODWORD(self->_fMachineFrequency);
  *((_DWORD *)result + 2) = self->_fEpochType;
  *((unsigned char *)result + 32) = self->_fStanding;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (self->_fVectorMagnitude == *((float *)a3 + 7)
      && self->_fIQRX == *((float *)a3 + 3)
      && self->_fIQRY == *((float *)a3 + 4)
      && self->_fIQRZ == *((float *)a3 + 5)
      && self->_fMachineFrequency == *((float *)a3 + 6)
      && self->_fEpochType == *((_DWORD *)a3 + 2))
    {
      int v6 = *((unsigned __int8 *)a3 + 32);
      if (self->_fStanding) {
        LOBYTE(v5) = v6 != 0;
      }
      else {
        LOBYTE(v5) = v6 == 0;
      }
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  float fVectorMagnitude = self->_fVectorMagnitude;
  float v4 = -fVectorMagnitude;
  if (fVectorMagnitude >= 0.0) {
    float v4 = self->_fVectorMagnitude;
  }
  float v5 = floorf(v4 + 0.5);
  float v6 = (float)(v4 - v5) * 1.8447e19;
  float v7 = fmodf(v5, 1.8447e19);
  unint64_t v8 = 2654435761u * (unint64_t)v7;
  unint64_t v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0) {
    unint64_t v9 = 2654435761u * (unint64_t)v7;
  }
  unint64_t v10 = v8 - (unint64_t)fabsf(v6);
  if (v6 < 0.0) {
    unint64_t v11 = v10;
  }
  else {
    unint64_t v11 = v9;
  }
  float fIQRX = self->_fIQRX;
  float v13 = -fIQRX;
  if (fIQRX >= 0.0) {
    float v13 = self->_fIQRX;
  }
  float v14 = floorf(v13 + 0.5);
  float v15 = (float)(v13 - v14) * 1.8447e19;
  float v16 = fmodf(v14, 1.8447e19);
  unint64_t v17 = 2654435761u * (unint64_t)v16;
  unint64_t v18 = v17 + (unint64_t)v15;
  if (v15 <= 0.0) {
    unint64_t v18 = 2654435761u * (unint64_t)v16;
  }
  unint64_t v19 = v17 - (unint64_t)fabsf(v15);
  if (v15 < 0.0) {
    unint64_t v20 = v19;
  }
  else {
    unint64_t v20 = v18;
  }
  float fIQRY = self->_fIQRY;
  float v22 = -fIQRY;
  if (fIQRY >= 0.0) {
    float v22 = self->_fIQRY;
  }
  float v23 = floorf(v22 + 0.5);
  float v24 = (float)(v22 - v23) * 1.8447e19;
  float v25 = fmodf(v23, 1.8447e19);
  unint64_t v26 = 2654435761u * (unint64_t)v25;
  unint64_t v27 = v26 + (unint64_t)v24;
  if (v24 <= 0.0) {
    unint64_t v27 = 2654435761u * (unint64_t)v25;
  }
  unint64_t v28 = v26 - (unint64_t)fabsf(v24);
  if (v24 < 0.0) {
    unint64_t v29 = v28;
  }
  else {
    unint64_t v29 = v27;
  }
  float fIQRZ = self->_fIQRZ;
  float v31 = -fIQRZ;
  if (fIQRZ >= 0.0) {
    float v31 = self->_fIQRZ;
  }
  float v32 = floorf(v31 + 0.5);
  float v33 = (float)(v31 - v32) * 1.8447e19;
  float v34 = fmodf(v32, 1.8447e19);
  unint64_t v35 = 2654435761u * (unint64_t)v34;
  unint64_t v36 = v35 + (unint64_t)v33;
  if (v33 <= 0.0) {
    unint64_t v36 = 2654435761u * (unint64_t)v34;
  }
  unint64_t v37 = v35 - (unint64_t)fabsf(v33);
  if (v33 < 0.0) {
    unint64_t v38 = v37;
  }
  else {
    unint64_t v38 = v36;
  }
  float fMachineFrequency = self->_fMachineFrequency;
  float v40 = -fMachineFrequency;
  if (fMachineFrequency >= 0.0) {
    float v40 = self->_fMachineFrequency;
  }
  float v41 = floorf(v40 + 0.5);
  float v42 = (float)(v40 - v41) * 1.8447e19;
  float v43 = fmodf(v41, 1.8447e19);
  unint64_t v44 = 2654435761u * (unint64_t)v43;
  unint64_t v45 = v44 + (unint64_t)v42;
  if (v42 <= 0.0) {
    unint64_t v45 = 2654435761u * (unint64_t)v43;
  }
  unint64_t v46 = v44 - (unint64_t)fabsf(v42);
  if (v42 >= 0.0) {
    unint64_t v46 = v45;
  }
  return v20 ^ v11 ^ v29 ^ v38 ^ v46 ^ (2654435761 * self->_fEpochType) ^ (2654435761 * self->_fStanding);
}

- (void)mergeFrom:(id)a3
{
  self->_float fVectorMagnitude = *((float *)a3 + 7);
  self->_float fIQRX = *((float *)a3 + 3);
  self->_float fIQRY = *((float *)a3 + 4);
  self->_float fIQRZ = *((float *)a3 + 5);
  self->_float fMachineFrequency = *((float *)a3 + 6);
  self->_uint64_t fEpochType = *((_DWORD *)a3 + 2);
  self->_fStanding = *((unsigned char *)a3 + 32);
}

- (float)fVectorMagnitude
{
  return self->_fVectorMagnitude;
}

- (void)setFVectorMagnitude:(float)a3
{
  self->_float fVectorMagnitude = a3;
}

- (float)fIQRX
{
  return self->_fIQRX;
}

- (void)setFIQRX:(float)a3
{
  self->_float fIQRX = a3;
}

- (float)fIQRY
{
  return self->_fIQRY;
}

- (void)setFIQRY:(float)a3
{
  self->_float fIQRY = a3;
}

- (float)fIQRZ
{
  return self->_fIQRZ;
}

- (void)setFIQRZ:(float)a3
{
  self->_float fIQRZ = a3;
}

- (float)fMachineFrequency
{
  return self->_fMachineFrequency;
}

- (void)setFMachineFrequency:(float)a3
{
  self->_float fMachineFrequency = a3;
}

- (int)fEpochType
{
  return self->_fEpochType;
}

- (void)setFEpochType:(int)a3
{
  self->_uint64_t fEpochType = a3;
}

- (BOOL)fStanding
{
  return self->_fStanding;
}

- (void)setFStanding:(BOOL)a3
{
  self->_fStanding = a3;
}

@end