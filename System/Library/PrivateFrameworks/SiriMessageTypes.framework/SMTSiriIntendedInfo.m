@interface SMTSiriIntendedInfo
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGazeSignalPresent;
- (NSNumber)invocationType;
- (SMTSiriIntendedInfo)init;
- (SMTSiriIntendedInfo)initWithBuilder:(id)a3;
- (SMTSiriIntendedInfo)initWithCoder:(id)a3;
- (SMTSiriIntendedInfo)initWithOdldScore:(float)a3 aftmScore:(float)a4 spkrIdScore:(float)a5 lrnnScore:(float)a6 checkerScore:(float)a7 invocationType:(id)a8;
- (SMTSiriIntendedInfo)initWithOdldScore:(float)a3 aftmScore:(float)a4 spkrIdScore:(float)a5 lrnnScore:(float)a6 checkerScore:(float)a7 invocationType:(id)a8 lrnnThreshold:(float)a9 lrnnScale:(float)a10 lrnnOffset:(float)a11;
- (SMTSiriIntendedInfo)initWithOdldScore:(float)a3 aftmScore:(float)a4 spkrIdScore:(float)a5 lrnnScore:(float)a6 checkerScore:(float)a7 invocationType:(id)a8 lrnnThreshold:(float)a9 lrnnScale:(float)a10 lrnnOffset:(float)a11 conversationalOdldScore:(float)a12;
- (SMTSiriIntendedInfo)initWithOdldScore:(float)a3 aftmScore:(float)a4 spkrIdScore:(float)a5 lrnnScore:(float)a6 checkerScore:(float)a7 invocationType:(id)a8 lrnnThreshold:(float)a9 lrnnScale:(float)a10 lrnnOffset:(float)a11 gazeSignal:(BOOL)a12;
- (SMTSiriIntendedInfo)initWithOdldScore:(float)a3 aftmScore:(float)a4 spkrIdScore:(float)a5 lrnnScore:(float)a6 checkerScore:(float)a7 invocationType:(id)a8 lrnnThreshold:(float)a9 lrnnScale:(float)a10 lrnnOffset:(float)a11 isGazeSignalPresent:(float)a12 conversationalOdldScore:(float)a13;
- (float)aftmScore;
- (float)checkerScore;
- (float)conversationalOdldScore;
- (float)lrnnOffset;
- (float)lrnnScale;
- (float)lrnnScore;
- (float)lrnnThreshold;
- (float)odldScore;
- (float)spkrIdScore;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SMTSiriIntendedInfo

- (void).cxx_destruct
{
}

- (float)conversationalOdldScore
{
  return self->_conversationalOdldScore;
}

- (BOOL)isGazeSignalPresent
{
  return self->_isGazeSignalPresent;
}

- (float)lrnnOffset
{
  return self->_lrnnOffset;
}

- (float)lrnnScale
{
  return self->_lrnnScale;
}

- (float)lrnnThreshold
{
  return self->_lrnnThreshold;
}

- (NSNumber)invocationType
{
  return self->_invocationType;
}

- (float)checkerScore
{
  return self->_checkerScore;
}

- (float)lrnnScore
{
  return self->_lrnnScore;
}

- (float)spkrIdScore
{
  return self->_spkrIdScore;
}

- (float)aftmScore
{
  return self->_aftmScore;
}

- (float)odldScore
{
  return self->_odldScore;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  float odldScore = self->_odldScore;
  id v6 = a3;
  *(float *)&double v7 = odldScore;
  v8 = [v4 numberWithFloat:v7];
  [v6 encodeObject:v8 forKey:@"SMTSiriIntendedInfo::odldScore"];

  *(float *)&double v9 = self->_aftmScore;
  v10 = [NSNumber numberWithFloat:v9];
  [v6 encodeObject:v10 forKey:@"SMTSiriIntendedInfo::aftmScore"];

  *(float *)&double v11 = self->_spkrIdScore;
  v12 = [NSNumber numberWithFloat:v11];
  [v6 encodeObject:v12 forKey:@"SMTSiriIntendedInfo::spkrIdScore"];

  *(float *)&double v13 = self->_lrnnScore;
  v14 = [NSNumber numberWithFloat:v13];
  [v6 encodeObject:v14 forKey:@"SMTSiriIntendedInfo::lrnnScore"];

  *(float *)&double v15 = self->_checkerScore;
  v16 = [NSNumber numberWithFloat:v15];
  [v6 encodeObject:v16 forKey:@"SMTSiriIntendedInfo::checkerScore"];

  [v6 encodeObject:self->_invocationType forKey:@"SMTSiriIntendedInfo::invocationType"];
  *(float *)&double v17 = self->_lrnnThreshold;
  v18 = [NSNumber numberWithFloat:v17];
  [v6 encodeObject:v18 forKey:@"SMTSiriIntendedInfo::lrnnThreshold"];

  *(float *)&double v19 = self->_lrnnScale;
  v20 = [NSNumber numberWithFloat:v19];
  [v6 encodeObject:v20 forKey:@"SMTSiriIntendedInfo::lrnnScale"];

  *(float *)&double v21 = self->_lrnnOffset;
  v22 = [NSNumber numberWithFloat:v21];
  [v6 encodeObject:v22 forKey:@"SMTSiriIntendedInfo::lrnnOffset"];

  v23 = [NSNumber numberWithBool:self->_isGazeSignalPresent];
  [v6 encodeObject:v23 forKey:@"SMTSiriIntendedInfo::isGazeSignalPresent"];

  *(float *)&double v24 = self->_conversationalOdldScore;
  id v25 = [NSNumber numberWithFloat:v24];
  [v6 encodeObject:v25 forKey:@"SMTSiriIntendedInfo::conversationalOdldScore"];
}

- (SMTSiriIntendedInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SMTSiriIntendedInfo::odldScore"];
  [v5 floatValue];
  int v45 = v6;

  double v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SMTSiriIntendedInfo::aftmScore"];
  [v7 floatValue];
  int v9 = v8;

  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SMTSiriIntendedInfo::spkrIdScore"];
  [v10 floatValue];
  int v12 = v11;

  double v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SMTSiriIntendedInfo::lrnnScore"];
  [v13 floatValue];
  int v15 = v14;

  v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SMTSiriIntendedInfo::checkerScore"];
  [v16 floatValue];
  int v18 = v17;

  double v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SMTSiriIntendedInfo::invocationType"];
  v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SMTSiriIntendedInfo::lrnnThreshold"];
  [v20 floatValue];
  int v22 = v21;

  v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SMTSiriIntendedInfo::lrnnScale"];
  [v23 floatValue];
  int v25 = v24;

  v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SMTSiriIntendedInfo::lrnnOffset"];
  [v26 floatValue];
  int v28 = v27;

  v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SMTSiriIntendedInfo::isGazeSignalPresent"];
  unsigned int v30 = [v29 BOOLValue];

  v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SMTSiriIntendedInfo::conversationalOdldScore"];

  [v31 floatValue];
  int v33 = v32;

  *(float *)&uint64_t v44 = (float)v30;
  HIDWORD(v44) = v33;
  LODWORD(v34) = v45;
  LODWORD(v35) = v9;
  LODWORD(v36) = v12;
  LODWORD(v37) = v15;
  LODWORD(v38) = v18;
  LODWORD(v39) = v22;
  LODWORD(v40) = v25;
  LODWORD(v41) = v28;
  v42 = -[SMTSiriIntendedInfo initWithOdldScore:aftmScore:spkrIdScore:lrnnScore:checkerScore:invocationType:lrnnThreshold:lrnnScale:lrnnOffset:isGazeSignalPresent:conversationalOdldScore:](self, "initWithOdldScore:aftmScore:spkrIdScore:lrnnScore:checkerScore:invocationType:lrnnThreshold:lrnnScale:lrnnOffset:isGazeSignalPresent:conversationalOdldScore:", v19, v34, v35, v36, v37, v38, v39, v40, v41, v44);

  return v42;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SMTSiriIntendedInfo *)a3;
  if (self == v4)
  {
    BOOL v27 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      float odldScore = self->_odldScore;
      [(SMTSiriIntendedInfo *)v5 odldScore];
      if (odldScore != v7) {
        goto LABEL_16;
      }
      float aftmScore = self->_aftmScore;
      [(SMTSiriIntendedInfo *)v5 aftmScore];
      if (aftmScore != v9) {
        goto LABEL_16;
      }
      float spkrIdScore = self->_spkrIdScore;
      [(SMTSiriIntendedInfo *)v5 spkrIdScore];
      if (spkrIdScore != v11) {
        goto LABEL_16;
      }
      float lrnnScore = self->_lrnnScore;
      [(SMTSiriIntendedInfo *)v5 lrnnScore];
      if (lrnnScore != v13) {
        goto LABEL_16;
      }
      float checkerScore = self->_checkerScore;
      [(SMTSiriIntendedInfo *)v5 checkerScore];
      if (checkerScore != v15) {
        goto LABEL_16;
      }
      invocationType = self->_invocationType;
      int v17 = [(SMTSiriIntendedInfo *)v5 invocationType];

      if (invocationType != v17) {
        goto LABEL_16;
      }
      float lrnnThreshold = self->_lrnnThreshold;
      [(SMTSiriIntendedInfo *)v5 lrnnThreshold];
      if (lrnnThreshold == v19
        && (float lrnnScale = self->_lrnnScale, [(SMTSiriIntendedInfo *)v5 lrnnScale], lrnnScale == v21)
        && (float lrnnOffset = self->_lrnnOffset, [(SMTSiriIntendedInfo *)v5 lrnnOffset], lrnnOffset == v23)
        && (BOOL isGazeSignalPresent = self->_isGazeSignalPresent,
            isGazeSignalPresent == [(SMTSiriIntendedInfo *)v5 isGazeSignalPresent]))
      {
        float conversationalOdldScore = self->_conversationalOdldScore;
        [(SMTSiriIntendedInfo *)v5 conversationalOdldScore];
        BOOL v27 = conversationalOdldScore == v26;
      }
      else
      {
LABEL_16:
        BOOL v27 = 0;
      }
    }
    else
    {
      BOOL v27 = 0;
    }
  }

  return v27;
}

- (unint64_t)hash
{
  *(float *)&double v2 = self->_odldScore;
  int v33 = [NSNumber numberWithFloat:v2];
  uint64_t v4 = [v33 hash];
  *(float *)&double v5 = self->_aftmScore;
  int v32 = [NSNumber numberWithFloat:v5];
  uint64_t v6 = [v32 hash] ^ v4;
  *(float *)&double v7 = self->_spkrIdScore;
  v31 = [NSNumber numberWithFloat:v7];
  uint64_t v8 = [v31 hash];
  *(float *)&double v9 = self->_lrnnScore;
  v10 = [NSNumber numberWithFloat:v9];
  uint64_t v11 = v6 ^ v8 ^ [v10 hash];
  *(float *)&double v12 = self->_checkerScore;
  float v13 = [NSNumber numberWithFloat:v12];
  uint64_t v14 = [v13 hash];
  uint64_t v15 = v14 ^ [(NSNumber *)self->_invocationType hash];
  *(float *)&double v16 = self->_lrnnThreshold;
  int v17 = [NSNumber numberWithFloat:v16];
  uint64_t v18 = v11 ^ v15 ^ [v17 hash];
  *(float *)&double v19 = self->_lrnnScale;
  v20 = [NSNumber numberWithFloat:v19];
  uint64_t v21 = [v20 hash];
  *(float *)&double v22 = self->_lrnnOffset;
  float v23 = [NSNumber numberWithFloat:v22];
  uint64_t v24 = v21 ^ [v23 hash];
  int v25 = [NSNumber numberWithBool:self->_isGazeSignalPresent];
  uint64_t v26 = v24 ^ [v25 hash];
  *(float *)&double v27 = self->_conversationalOdldScore;
  int v28 = [NSNumber numberWithFloat:v27];
  unint64_t v29 = v18 ^ v26 ^ [v28 hash];

  return v29;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)SMTSiriIntendedInfo;
  double v5 = [(SMTSiriIntendedInfo *)&v8 description];
  v6 = (void *)[v4 initWithFormat:@"%@ {float odldScore = %f, aftmScore = %f, spkrIdScore = %f, lrnnScore = %f, checkerScore = %f, invocationType = %@, lrnnThreshold = %f, lrnnScale = %f, lrnnOffset = %f, gazeSignalPresent = %u, conversationalOdldScore = %f}", v5, self->_odldScore, self->_aftmScore, self->_spkrIdScore, self->_lrnnScore, self->_checkerScore, self->_invocationType, self->_lrnnThreshold, self->_lrnnScale, self->_lrnnOffset, self->_isGazeSignalPresent, self->_conversationalOdldScore];

  return v6;
}

- (id)description
{
  return [(SMTSiriIntendedInfo *)self _descriptionWithIndent:0];
}

- (SMTSiriIntendedInfo)initWithOdldScore:(float)a3 aftmScore:(float)a4 spkrIdScore:(float)a5 lrnnScore:(float)a6 checkerScore:(float)a7 invocationType:(id)a8 lrnnThreshold:(float)a9 lrnnScale:(float)a10 lrnnOffset:(float)a11 isGazeSignalPresent:(float)a12 conversationalOdldScore:(float)a13
{
  id v20 = a8;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __180__SMTSiriIntendedInfo_initWithOdldScore_aftmScore_spkrIdScore_lrnnScore_checkerScore_invocationType_lrnnThreshold_lrnnScale_lrnnOffset_isGazeSignalPresent_conversationalOdldScore___block_invoke;
  v26[3] = &unk_265503D90;
  float v28 = a3;
  float v29 = a4;
  float v30 = a5;
  float v31 = a6;
  id v27 = v20;
  float v32 = a7;
  float v33 = a9;
  float v34 = a10;
  float v35 = a11;
  float v36 = a12;
  float v37 = a13;
  id v21 = v20;
  double v22 = [(SMTSiriIntendedInfo *)self initWithBuilder:v26];

  return v22;
}

void __180__SMTSiriIntendedInfo_initWithOdldScore_aftmScore_spkrIdScore_lrnnScore_checkerScore_invocationType_lrnnThreshold_lrnnScale_lrnnOffset_isGazeSignalPresent_conversationalOdldScore___block_invoke(uint64_t a1, void *a2)
{
  int v3 = *(_DWORD *)(a1 + 40);
  id v13 = a2;
  LODWORD(v4) = v3;
  [v13 setOdldScore:v4];
  LODWORD(v5) = *(_DWORD *)(a1 + 44);
  [v13 setAftmScore:v5];
  LODWORD(v6) = *(_DWORD *)(a1 + 48);
  [v13 setSpkrIdScore:v6];
  LODWORD(v7) = *(_DWORD *)(a1 + 52);
  [v13 setLrnnScore:v7];
  LODWORD(v8) = *(_DWORD *)(a1 + 56);
  [v13 setCheckerScore:v8];
  [v13 setInvocationType:*(void *)(a1 + 32)];
  LODWORD(v9) = *(_DWORD *)(a1 + 60);
  [v13 setLrnnThreshold:v9];
  LODWORD(v10) = *(_DWORD *)(a1 + 64);
  [v13 setLrnnScale:v10];
  LODWORD(v11) = *(_DWORD *)(a1 + 68);
  [v13 setLrnnOffset:v11];
  [v13 setGazeSignal:*(float *)(a1 + 72) != 0.0];
  LODWORD(v12) = *(_DWORD *)(a1 + 76);
  [v13 setConversationalOdldScore:v12];
}

- (SMTSiriIntendedInfo)initWithOdldScore:(float)a3 aftmScore:(float)a4 spkrIdScore:(float)a5 lrnnScore:(float)a6 checkerScore:(float)a7 invocationType:(id)a8 lrnnThreshold:(float)a9 lrnnScale:(float)a10 lrnnOffset:(float)a11 conversationalOdldScore:(float)a12
{
  id v20 = a8;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __160__SMTSiriIntendedInfo_initWithOdldScore_aftmScore_spkrIdScore_lrnnScore_checkerScore_invocationType_lrnnThreshold_lrnnScale_lrnnOffset_conversationalOdldScore___block_invoke;
  v25[3] = &unk_265503D68;
  float v27 = a3;
  float v28 = a4;
  float v29 = a5;
  float v30 = a6;
  id v26 = v20;
  float v31 = a7;
  float v32 = a9;
  float v33 = a10;
  float v34 = a11;
  float v35 = a12;
  id v21 = v20;
  double v22 = [(SMTSiriIntendedInfo *)self initWithBuilder:v25];

  return v22;
}

void __160__SMTSiriIntendedInfo_initWithOdldScore_aftmScore_spkrIdScore_lrnnScore_checkerScore_invocationType_lrnnThreshold_lrnnScale_lrnnOffset_conversationalOdldScore___block_invoke(uint64_t a1, void *a2)
{
  int v3 = *(_DWORD *)(a1 + 40);
  id v13 = a2;
  LODWORD(v4) = v3;
  [v13 setOdldScore:v4];
  LODWORD(v5) = *(_DWORD *)(a1 + 44);
  [v13 setAftmScore:v5];
  LODWORD(v6) = *(_DWORD *)(a1 + 48);
  [v13 setSpkrIdScore:v6];
  LODWORD(v7) = *(_DWORD *)(a1 + 52);
  [v13 setLrnnScore:v7];
  LODWORD(v8) = *(_DWORD *)(a1 + 56);
  [v13 setCheckerScore:v8];
  [v13 setInvocationType:*(void *)(a1 + 32)];
  LODWORD(v9) = *(_DWORD *)(a1 + 60);
  [v13 setLrnnThreshold:v9];
  LODWORD(v10) = *(_DWORD *)(a1 + 64);
  [v13 setLrnnScale:v10];
  LODWORD(v11) = *(_DWORD *)(a1 + 68);
  [v13 setLrnnOffset:v11];
  LODWORD(v12) = *(_DWORD *)(a1 + 72);
  [v13 setConversationalOdldScore:v12];
}

- (SMTSiriIntendedInfo)initWithOdldScore:(float)a3 aftmScore:(float)a4 spkrIdScore:(float)a5 lrnnScore:(float)a6 checkerScore:(float)a7 invocationType:(id)a8 lrnnThreshold:(float)a9 lrnnScale:(float)a10 lrnnOffset:(float)a11 gazeSignal:(BOOL)a12
{
  id v22 = a8;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __147__SMTSiriIntendedInfo_initWithOdldScore_aftmScore_spkrIdScore_lrnnScore_checkerScore_invocationType_lrnnThreshold_lrnnScale_lrnnOffset_gazeSignal___block_invoke;
  v26[3] = &unk_265503D40;
  float v28 = a3;
  float v29 = a4;
  float v30 = a5;
  float v31 = a6;
  id v27 = v22;
  float v32 = a7;
  float v33 = a9;
  float v34 = a10;
  float v35 = a11;
  BOOL v36 = a12;
  id v23 = v22;
  uint64_t v24 = [(SMTSiriIntendedInfo *)self initWithBuilder:v26];

  return v24;
}

void __147__SMTSiriIntendedInfo_initWithOdldScore_aftmScore_spkrIdScore_lrnnScore_checkerScore_invocationType_lrnnThreshold_lrnnScale_lrnnOffset_gazeSignal___block_invoke(uint64_t a1, void *a2)
{
  int v3 = *(_DWORD *)(a1 + 40);
  id v12 = a2;
  LODWORD(v4) = v3;
  [v12 setOdldScore:v4];
  LODWORD(v5) = *(_DWORD *)(a1 + 44);
  [v12 setAftmScore:v5];
  LODWORD(v6) = *(_DWORD *)(a1 + 48);
  [v12 setSpkrIdScore:v6];
  LODWORD(v7) = *(_DWORD *)(a1 + 52);
  [v12 setLrnnScore:v7];
  LODWORD(v8) = *(_DWORD *)(a1 + 56);
  [v12 setCheckerScore:v8];
  [v12 setInvocationType:*(void *)(a1 + 32)];
  LODWORD(v9) = *(_DWORD *)(a1 + 60);
  [v12 setLrnnThreshold:v9];
  LODWORD(v10) = *(_DWORD *)(a1 + 64);
  [v12 setLrnnScale:v10];
  LODWORD(v11) = *(_DWORD *)(a1 + 68);
  [v12 setLrnnOffset:v11];
  [v12 setGazeSignal:*(unsigned __int8 *)(a1 + 72)];
}

- (SMTSiriIntendedInfo)initWithOdldScore:(float)a3 aftmScore:(float)a4 spkrIdScore:(float)a5 lrnnScore:(float)a6 checkerScore:(float)a7 invocationType:(id)a8 lrnnThreshold:(float)a9 lrnnScale:(float)a10 lrnnOffset:(float)a11
{
  id v20 = a8;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __136__SMTSiriIntendedInfo_initWithOdldScore_aftmScore_spkrIdScore_lrnnScore_checkerScore_invocationType_lrnnThreshold_lrnnScale_lrnnOffset___block_invoke;
  v24[3] = &unk_265503D18;
  float v26 = a3;
  float v27 = a4;
  float v28 = a5;
  float v29 = a6;
  id v25 = v20;
  float v30 = a7;
  float v31 = a9;
  float v32 = a10;
  float v33 = a11;
  id v21 = v20;
  id v22 = [(SMTSiriIntendedInfo *)self initWithBuilder:v24];

  return v22;
}

void __136__SMTSiriIntendedInfo_initWithOdldScore_aftmScore_spkrIdScore_lrnnScore_checkerScore_invocationType_lrnnThreshold_lrnnScale_lrnnOffset___block_invoke(uint64_t a1, void *a2)
{
  int v3 = *(_DWORD *)(a1 + 40);
  id v12 = a2;
  LODWORD(v4) = v3;
  [v12 setOdldScore:v4];
  LODWORD(v5) = *(_DWORD *)(a1 + 44);
  [v12 setAftmScore:v5];
  LODWORD(v6) = *(_DWORD *)(a1 + 48);
  [v12 setSpkrIdScore:v6];
  LODWORD(v7) = *(_DWORD *)(a1 + 52);
  [v12 setLrnnScore:v7];
  LODWORD(v8) = *(_DWORD *)(a1 + 56);
  [v12 setCheckerScore:v8];
  [v12 setInvocationType:*(void *)(a1 + 32)];
  LODWORD(v9) = *(_DWORD *)(a1 + 60);
  [v12 setLrnnThreshold:v9];
  LODWORD(v10) = *(_DWORD *)(a1 + 64);
  [v12 setLrnnScale:v10];
  LODWORD(v11) = *(_DWORD *)(a1 + 68);
  [v12 setLrnnOffset:v11];
}

- (SMTSiriIntendedInfo)initWithOdldScore:(float)a3 aftmScore:(float)a4 spkrIdScore:(float)a5 lrnnScore:(float)a6 checkerScore:(float)a7 invocationType:(id)a8
{
  id v14 = a8;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __101__SMTSiriIntendedInfo_initWithOdldScore_aftmScore_spkrIdScore_lrnnScore_checkerScore_invocationType___block_invoke;
  v18[3] = &unk_265503CF0;
  float v20 = a3;
  float v21 = a4;
  float v22 = a5;
  float v23 = a6;
  float v24 = a7;
  id v19 = v14;
  id v15 = v14;
  double v16 = [(SMTSiriIntendedInfo *)self initWithBuilder:v18];

  return v16;
}

void __101__SMTSiriIntendedInfo_initWithOdldScore_aftmScore_spkrIdScore_lrnnScore_checkerScore_invocationType___block_invoke(uint64_t a1, void *a2)
{
  int v3 = *(_DWORD *)(a1 + 40);
  id v10 = a2;
  LODWORD(v4) = v3;
  [v10 setOdldScore:v4];
  LODWORD(v5) = *(_DWORD *)(a1 + 44);
  [v10 setAftmScore:v5];
  LODWORD(v6) = *(_DWORD *)(a1 + 48);
  [v10 setSpkrIdScore:v6];
  LODWORD(v7) = *(_DWORD *)(a1 + 52);
  [v10 setLrnnScore:v7];
  LODWORD(v8) = *(_DWORD *)(a1 + 56);
  [v10 setCheckerScore:v8];
  [v10 setInvocationType:*(void *)(a1 + 32)];
  [v10 setLrnnThreshold:0.0];
  LODWORD(v9) = 1.0;
  [v10 setLrnnScale:v9];
  [v10 setLrnnOffset:0.0];
}

- (SMTSiriIntendedInfo)init
{
  return [(SMTSiriIntendedInfo *)self initWithBuilder:0];
}

- (SMTSiriIntendedInfo)initWithBuilder:(id)a3
{
  double v4 = (void (**)(id, _SMTSiriIntendedInfoMutation *))a3;
  v20.receiver = self;
  v20.super_class = (Class)SMTSiriIntendedInfo;
  double v5 = [(SMTSiriIntendedInfo *)&v20 init];
  double v6 = v5;
  if (v4 && v5)
  {
    double v7 = [[_SMTSiriIntendedInfoMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_SMTSiriIntendedInfoMutation *)v7 isDirty])
    {
      [(_SMTSiriIntendedInfoMutation *)v7 getOdldScore];
      v6->_float odldScore = v8;
      [(_SMTSiriIntendedInfoMutation *)v7 getAftmScore];
      v6->_float aftmScore = v9;
      [(_SMTSiriIntendedInfoMutation *)v7 getSpkrIdScore];
      v6->_float spkrIdScore = v10;
      [(_SMTSiriIntendedInfoMutation *)v7 getLrnnScore];
      v6->_float lrnnScore = v11;
      [(_SMTSiriIntendedInfoMutation *)v7 getCheckerScore];
      v6->_float checkerScore = v12;
      uint64_t v13 = [(_SMTSiriIntendedInfoMutation *)v7 getInvocationType];
      invocationType = v6->_invocationType;
      v6->_invocationType = (NSNumber *)v13;

      [(_SMTSiriIntendedInfoMutation *)v7 getLrnnThreshold];
      v6->_float lrnnThreshold = v15;
      [(_SMTSiriIntendedInfoMutation *)v7 getLrnnScale];
      v6->_float lrnnScale = v16;
      [(_SMTSiriIntendedInfoMutation *)v7 getLrnnOffset];
      v6->_float lrnnOffset = v17;
      v6->_BOOL isGazeSignalPresent = [(_SMTSiriIntendedInfoMutation *)v7 getGazeSignal];
      [(_SMTSiriIntendedInfoMutation *)v7 getConversationalOdldScore];
      v6->_float conversationalOdldScore = v18;
    }
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)newWithBuilder:(id)a3
{
  id v3 = a3;
  double v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBuilder:v3];

  return v4;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  double v4 = (void (**)(id, _SMTSiriIntendedInfoMutation *))a3;
  if (v4)
  {
    double v5 = [[_SMTSiriIntendedInfoMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_SMTSiriIntendedInfoMutation *)v5 isDirty])
    {
      double v6 = objc_alloc_init(SMTSiriIntendedInfo);
      [(_SMTSiriIntendedInfoMutation *)v5 getOdldScore];
      v6->_float odldScore = v7;
      [(_SMTSiriIntendedInfoMutation *)v5 getAftmScore];
      v6->_float aftmScore = v8;
      [(_SMTSiriIntendedInfoMutation *)v5 getSpkrIdScore];
      v6->_float spkrIdScore = v9;
      [(_SMTSiriIntendedInfoMutation *)v5 getLrnnScore];
      v6->_float lrnnScore = v10;
      [(_SMTSiriIntendedInfoMutation *)v5 getCheckerScore];
      v6->_float checkerScore = v11;
      uint64_t v12 = [(_SMTSiriIntendedInfoMutation *)v5 getInvocationType];
      invocationType = v6->_invocationType;
      v6->_invocationType = (NSNumber *)v12;

      [(_SMTSiriIntendedInfoMutation *)v5 getLrnnThreshold];
      v6->_float lrnnThreshold = v14;
      [(_SMTSiriIntendedInfoMutation *)v5 getLrnnScale];
      v6->_float lrnnScale = v15;
      [(_SMTSiriIntendedInfoMutation *)v5 getLrnnOffset];
      v6->_float lrnnOffset = v16;
      v6->_BOOL isGazeSignalPresent = [(_SMTSiriIntendedInfoMutation *)v5 getGazeSignal];
      [(_SMTSiriIntendedInfoMutation *)v5 getConversationalOdldScore];
      v6->_float conversationalOdldScore = v17;
    }
    else
    {
      double v6 = (SMTSiriIntendedInfo *)[(SMTSiriIntendedInfo *)self copy];
    }
  }
  else
  {
    double v6 = (SMTSiriIntendedInfo *)[(SMTSiriIntendedInfo *)self copy];
  }

  return v6;
}

@end