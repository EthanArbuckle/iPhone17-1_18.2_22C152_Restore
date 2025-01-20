@interface ALCLBodyMetrics
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (float)age;
- (float)heightM;
- (float)hrmax;
- (float)hrmin;
- (float)hronset;
- (float)pal;
- (float)vo2max;
- (float)weightKG;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)genderAsString:(int)a3;
- (int)StringAsGender:(id)a3;
- (int)gender;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAge:(float)a3;
- (void)setGender:(int)a3;
- (void)setHeightM:(float)a3;
- (void)setHrmax:(float)a3;
- (void)setHrmin:(float)a3;
- (void)setHronset:(float)a3;
- (void)setPal:(float)a3;
- (void)setVo2max:(float)a3;
- (void)setWeightKG:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALCLBodyMetrics

- (id)genderAsString:(int)a3
{
  if (!a3) {
    return @"kGenderMale";
  }
  if (a3 == 1) {
    return @"kGenderFemale";
  }
  return +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
}

- (int)StringAsGender:(id)a3
{
  if ([a3 isEqualToString:@"kGenderMale"]) {
    return 0;
  }
  else {
    return [a3 isEqualToString:@"kGenderFemale"];
  }
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)ALCLBodyMetrics;
  return +[NSString stringWithFormat:@"%@ %@", [(ALCLBodyMetrics *)&v3 description], [(ALCLBodyMetrics *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  int gender = self->_gender;
  if (gender)
  {
    if (gender == 1) {
      CFStringRef v5 = @"kGenderFemale";
    }
    else {
      CFStringRef v5 = +[NSString stringWithFormat:@"(unknown: %i)", self->_gender];
    }
  }
  else
  {
    CFStringRef v5 = @"kGenderMale";
  }
  [v3 setObject:v5 forKey:@"gender"];
  *(float *)&double v6 = self->_heightM;
  [v3 setObject:[+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v6)] forKey:@"heightM"];
  *(float *)&double v7 = self->_weightKG;
  [v3 setObject:[+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v7)] forKey:@"weightKG"];
  *(float *)&double v8 = self->_vo2max;
  [v3 setObject:[NSNumber numberWithFloat:v8] forKey:@"vo2max"];
  *(float *)&double v9 = self->_age;
  [v3 setObject:[NSNumber numberWithFloat:v9] forKey:@"age"];
  *(float *)&double v10 = self->_hrmin;
  [v3 setObject:[+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v10)] forKey:@"hrmin"];
  *(float *)&double v11 = self->_hrmax;
  [v3 setObject:[+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v11)] forKey:@"hrmax"];
  *(float *)&double v12 = self->_hronset;
  [v3 setObject:[NSNumber numberWithFloat:v12] forKey:@"hronset"];
  *(float *)&double v13 = self->_pal;
  [v3 setObject:[NSNumber numberWithFloat:v13] forKey:@"pal"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100474DF8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();

  PBDataWriterWriteFloatField();
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 3) = self->_gender;
  *((_DWORD *)a3 + 4) = LODWORD(self->_heightM);
  *((_DWORD *)a3 + 10) = LODWORD(self->_weightKG);
  *((_DWORD *)a3 + 9) = LODWORD(self->_vo2max);
  *((_DWORD *)a3 + 2) = LODWORD(self->_age);
  *((_DWORD *)a3 + 6) = LODWORD(self->_hrmin);
  *((_DWORD *)a3 + 5) = LODWORD(self->_hrmax);
  *((_DWORD *)a3 + 7) = LODWORD(self->_hronset);
  *((_DWORD *)a3 + 8) = LODWORD(self->_pal);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  *((_DWORD *)result + 3) = self->_gender;
  *((_DWORD *)result + 4) = LODWORD(self->_heightM);
  *((_DWORD *)result + 10) = LODWORD(self->_weightKG);
  *((_DWORD *)result + 9) = LODWORD(self->_vo2max);
  *((_DWORD *)result + 2) = LODWORD(self->_age);
  *((_DWORD *)result + 6) = LODWORD(self->_hrmin);
  *((_DWORD *)result + 5) = LODWORD(self->_hrmax);
  *((_DWORD *)result + 7) = LODWORD(self->_hronset);
  *((_DWORD *)result + 8) = LODWORD(self->_pal);
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5) {
    LOBYTE(v5) = self->_gender == *((_DWORD *)a3 + 3)
  }
              && self->_heightM == *((float *)a3 + 4)
              && self->_weightKG == *((float *)a3 + 10)
              && self->_vo2max == *((float *)a3 + 9)
              && self->_age == *((float *)a3 + 2)
              && self->_hrmin == *((float *)a3 + 6)
              && self->_hrmax == *((float *)a3 + 5)
              && self->_hronset == *((float *)a3 + 7)
              && self->_pal == *((float *)a3 + 8);
  return v5;
}

- (unint64_t)hash
{
  uint64_t gender = self->_gender;
  float heightM = self->_heightM;
  float v5 = -heightM;
  if (heightM >= 0.0) {
    float v5 = self->_heightM;
  }
  float v6 = floorf(v5 + 0.5);
  float v7 = (float)(v5 - v6) * 1.8447e19;
  float v8 = fmodf(v6, 1.8447e19);
  unint64_t v9 = 2654435761u * (unint64_t)v8;
  unint64_t v10 = v9 + (unint64_t)v7;
  if (v7 <= 0.0) {
    unint64_t v10 = 2654435761u * (unint64_t)v8;
  }
  unint64_t v11 = v9 - (unint64_t)fabsf(v7);
  if (v7 < 0.0) {
    unint64_t v12 = v11;
  }
  else {
    unint64_t v12 = v10;
  }
  float weightKG = self->_weightKG;
  float v14 = -weightKG;
  if (weightKG >= 0.0) {
    float v14 = self->_weightKG;
  }
  float v15 = floorf(v14 + 0.5);
  float v16 = (float)(v14 - v15) * 1.8447e19;
  float v17 = fmodf(v15, 1.8447e19);
  unint64_t v18 = 2654435761u * (unint64_t)v17;
  unint64_t v19 = v18 + (unint64_t)v16;
  if (v16 <= 0.0) {
    unint64_t v19 = 2654435761u * (unint64_t)v17;
  }
  unint64_t v20 = v18 - (unint64_t)fabsf(v16);
  if (v16 < 0.0) {
    unint64_t v21 = v20;
  }
  else {
    unint64_t v21 = v19;
  }
  float vo2max = self->_vo2max;
  float v23 = -vo2max;
  if (vo2max >= 0.0) {
    float v23 = self->_vo2max;
  }
  float v24 = floorf(v23 + 0.5);
  float v25 = (float)(v23 - v24) * 1.8447e19;
  float v26 = fmodf(v24, 1.8447e19);
  unint64_t v27 = 2654435761u * (unint64_t)v26;
  unint64_t v28 = v27 + (unint64_t)v25;
  if (v25 <= 0.0) {
    unint64_t v28 = 2654435761u * (unint64_t)v26;
  }
  unint64_t v29 = v27 - (unint64_t)fabsf(v25);
  if (v25 < 0.0) {
    unint64_t v30 = v29;
  }
  else {
    unint64_t v30 = v28;
  }
  float age = self->_age;
  float v32 = -age;
  if (age >= 0.0) {
    float v32 = self->_age;
  }
  float v33 = floorf(v32 + 0.5);
  float v34 = (float)(v32 - v33) * 1.8447e19;
  float v35 = fmodf(v33, 1.8447e19);
  unint64_t v36 = 2654435761u * (unint64_t)v35;
  unint64_t v37 = v36 + (unint64_t)v34;
  if (v34 <= 0.0) {
    unint64_t v37 = 2654435761u * (unint64_t)v35;
  }
  unint64_t v38 = v36 - (unint64_t)fabsf(v34);
  if (v34 < 0.0) {
    unint64_t v39 = v38;
  }
  else {
    unint64_t v39 = v37;
  }
  float hrmin = self->_hrmin;
  float v41 = -hrmin;
  if (hrmin >= 0.0) {
    float v41 = self->_hrmin;
  }
  float v42 = floorf(v41 + 0.5);
  float v43 = (float)(v41 - v42) * 1.8447e19;
  float v44 = fmodf(v42, 1.8447e19);
  unint64_t v45 = 2654435761u * (unint64_t)v44;
  unint64_t v46 = v45 + (unint64_t)v43;
  if (v43 <= 0.0) {
    unint64_t v46 = 2654435761u * (unint64_t)v44;
  }
  unint64_t v47 = v45 - (unint64_t)fabsf(v43);
  if (v43 < 0.0) {
    unint64_t v48 = v47;
  }
  else {
    unint64_t v48 = v46;
  }
  float hrmax = self->_hrmax;
  float v50 = -hrmax;
  if (hrmax >= 0.0) {
    float v50 = self->_hrmax;
  }
  float v51 = floorf(v50 + 0.5);
  float v52 = (float)(v50 - v51) * 1.8447e19;
  float v53 = fmodf(v51, 1.8447e19);
  unint64_t v54 = 2654435761u * (unint64_t)v53;
  unint64_t v55 = v54 + (unint64_t)v52;
  if (v52 <= 0.0) {
    unint64_t v55 = 2654435761u * (unint64_t)v53;
  }
  unint64_t v56 = v54 - (unint64_t)fabsf(v52);
  if (v52 < 0.0) {
    unint64_t v57 = v56;
  }
  else {
    unint64_t v57 = v55;
  }
  float hronset = self->_hronset;
  float v59 = -hronset;
  if (hronset >= 0.0) {
    float v59 = self->_hronset;
  }
  float v60 = floorf(v59 + 0.5);
  float v61 = (float)(v59 - v60) * 1.8447e19;
  float v62 = fmodf(v60, 1.8447e19);
  unint64_t v63 = 2654435761u * (unint64_t)v62;
  unint64_t v64 = v63 + (unint64_t)v61;
  if (v61 <= 0.0) {
    unint64_t v64 = 2654435761u * (unint64_t)v62;
  }
  unint64_t v65 = v63 - (unint64_t)fabsf(v61);
  if (v61 < 0.0) {
    unint64_t v66 = v65;
  }
  else {
    unint64_t v66 = v64;
  }
  float pal = self->_pal;
  float v68 = -pal;
  if (pal >= 0.0) {
    float v68 = self->_pal;
  }
  float v69 = floorf(v68 + 0.5);
  float v70 = (float)(v68 - v69) * 1.8447e19;
  float v71 = fmodf(v69, 1.8447e19);
  unint64_t v72 = 2654435761u * (unint64_t)v71;
  unint64_t v73 = v72 + (unint64_t)v70;
  if (v70 <= 0.0) {
    unint64_t v73 = 2654435761u * (unint64_t)v71;
  }
  unint64_t v74 = v72 - (unint64_t)fabsf(v70);
  if (v70 >= 0.0) {
    unint64_t v74 = v73;
  }
  return v12 ^ v30 ^ (2654435761 * gender) ^ v21 ^ v39 ^ v48 ^ v57 ^ v66 ^ v74;
}

- (void)mergeFrom:(id)a3
{
  self->_uint64_t gender = *((_DWORD *)a3 + 3);
  self->_float heightM = *((float *)a3 + 4);
  self->_float weightKG = *((float *)a3 + 10);
  self->_float vo2max = *((float *)a3 + 9);
  self->_float age = *((float *)a3 + 2);
  self->_float hrmin = *((float *)a3 + 6);
  self->_float hrmax = *((float *)a3 + 5);
  self->_float hronset = *((float *)a3 + 7);
  self->_float pal = *((float *)a3 + 8);
}

- (int)gender
{
  return self->_gender;
}

- (void)setGender:(int)a3
{
  self->_uint64_t gender = a3;
}

- (float)heightM
{
  return self->_heightM;
}

- (void)setHeightM:(float)a3
{
  self->_float heightM = a3;
}

- (float)weightKG
{
  return self->_weightKG;
}

- (void)setWeightKG:(float)a3
{
  self->_float weightKG = a3;
}

- (float)vo2max
{
  return self->_vo2max;
}

- (void)setVo2max:(float)a3
{
  self->_float vo2max = a3;
}

- (float)age
{
  return self->_age;
}

- (void)setAge:(float)a3
{
  self->_float age = a3;
}

- (float)hrmin
{
  return self->_hrmin;
}

- (void)setHrmin:(float)a3
{
  self->_float hrmin = a3;
}

- (float)hrmax
{
  return self->_hrmax;
}

- (void)setHrmax:(float)a3
{
  self->_float hrmax = a3;
}

- (float)hronset
{
  return self->_hronset;
}

- (void)setHronset:(float)a3
{
  self->_float hronset = a3;
}

- (float)pal
{
  return self->_pal;
}

- (void)setPal:(float)a3
{
  self->_float pal = a3;
}

@end