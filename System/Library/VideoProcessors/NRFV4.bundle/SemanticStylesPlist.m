@interface SemanticStylesPlist
- (const)bgTuningForSceneType:(unsigned int)a3;
- (const)fgTuning;
- (const)toneBiasRemap;
- (int)readBackgroundTuning:(id)a3 forSceneType:(unsigned int)a4;
- (int)readForegroundTuning:(id)a3;
- (int)readPlist:(id)a3;
- (int)readToneBiasRemap:(id)a3;
@end

@implementation SemanticStylesPlist

- (int)readPlist:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SemanticStylesPlist;
  [(CMITuningPlist *)&v12 readPlist:v4];
  v5 = [v4 objectForKeyedSubscript:@"ToneBiasRemap"];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(SemanticStylesPlist *)self readToneBiasRemap:v5];
    }
  }
  int v6 = -73271;
  v7 = [v4 objectForKeyedSubscript:@"Background"];

  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = 0;
      do
      {
        int v9 = [(SemanticStylesPlist *)self readBackgroundTuning:v7 forSceneType:v8];
        if (v9)
        {
          int v6 = v9;
          goto LABEL_14;
        }
        uint64_t v8 = (v8 + 1);
      }
      while (v8 != 4);
      uint64_t v10 = [v4 objectForKeyedSubscript:@"Foreground"];

      if (v10)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          int v6 = [(SemanticStylesPlist *)self readForegroundTuning:v10];
        }
        v7 = (void *)v10;
      }
      else
      {
        v7 = 0;
      }
    }
  }
LABEL_14:

  return v6;
}

- (const)toneBiasRemap
{
  return (const $E2C29196C7A5C696474C6955C5A9CE06 *)&self->_toneBiasRemap;
}

- (const)bgTuningForSceneType:(unsigned int)a3
{
  if (a3 <= 4) {
    unsigned int v3 = a3;
  }
  else {
    unsigned int v3 = 0;
  }
  return (const $9EFE1A171E29ECCB389D081B67F5D391 *)&self->_bgTuning[v3];
}

- (const)fgTuning
{
  return (const $36266249127D2833275D384328B2FAF2 *)&self->_fgTuning;
}

- (int)readToneBiasRemap:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"ZeroPoint"];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    int v6 = 0;
  }
  else {
    int v6 = -73271;
  }
  [v5 floatValue];
  float v8 = v7;

  p_toneBiasRemap = &self->_toneBiasRemap;
  self->_toneBiasRemap.zeroPoint = v8;
  uint64_t v10 = [v4 objectForKeyedSubscript:@"NegCutoff"];
  if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
    int v6 = -73271;
  }
  [v10 floatValue];
  float v12 = v11;

  p_toneBiasRemap->negCutoff = v12;
  v13 = [v4 objectForKeyedSubscript:@"PosCutoff"];
  if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
    int v6 = -73271;
  }
  [v13 floatValue];
  float v15 = v14;

  p_toneBiasRemap->posCutoff = v15;
  return v6;
}

- (int)readBackgroundTuning:(id)a3 forSceneType:(unsigned int)a4
{
  int v69 = 0;
  id v6 = a3;
  float v7 = nameOfSceneType(a4);
  float v8 = [@"Background" stringByAppendingPathComponent:v7];
  int v9 = getSubDict(v6, (uint64_t)v7, &v69);

  if (v9)
  {
    bgTuning = self->_bgTuning;
    unsigned int v11 = a4;
    float v12 = [v8 stringByAppendingPathComponent:@"Positive"];

    v13 = getSubDict(v9, @"Positive", &v69);
    float v14 = v13;
    if (v13)
    {
      p_tide = (_DWORD *)&bgTuning[v11].pos.tide;
      v16 = [v13 objectForKeyedSubscript:@"Tide"];
      if (!v16 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
        int v69 = -73271;
      }
      [v16 floatValue];
      int v18 = v17;

      _DWORD *p_tide = v18;
      v19 = [v14 objectForKeyedSubscript:@"Light"];
      if (!v19 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
        int v69 = -73271;
      }
      [v19 floatValue];
      int v21 = v20;

      p_tide[1] = v21;
      v22 = [v14 objectForKeyedSubscript:@"Shadow"];
      if (!v22 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
        int v69 = -73271;
      }
      [v22 floatValue];
      int v24 = v23;

      p_tide[2] = v24;
      v25 = [v14 objectForKeyedSubscript:@"BrightSat"];
      if (!v25 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
        int v69 = -73271;
      }
      [v25 floatValue];
      int v27 = v26;

      p_tide[3] = v27;
      v28 = [v14 objectForKeyedSubscript:@"Sat"];
      if (!v28 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
        int v69 = -73271;
      }
      [v28 floatValue];
      int v30 = v29;

      p_tide[4] = v30;
      v31 = [v14 objectForKeyedSubscript:@"Exposure"];
      if (!v31 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
        int v69 = -73271;
      }
      [v31 floatValue];
      int v33 = v32;

      p_tide[5] = v33;
      v34 = [v14 objectForKeyedSubscript:@"Brightness"];
      if (!v34 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
        int v69 = -73271;
      }
      [v34 floatValue];
      int v36 = v35;

      p_tide[6] = v36;
      v37 = [v14 objectForKeyedSubscript:@"Contrast"];
      if (!v37 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
        int v69 = -73271;
      }
      [v37 floatValue];
      int v39 = v38;

      p_tide[7] = v39;
    }
    v40 = [v12 stringByDeletingLastPathComponent];

    float v8 = [v40 stringByAppendingPathComponent:@"Negative"];

    v41 = getSubDict(v9, @"Negative", &v69);
    v42 = v41;
    if (v41)
    {
      v43 = [v41 objectForKeyedSubscript:@"Tide"];
      if (!v43 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
        int v69 = -73271;
      }
      [v43 floatValue];
      float v45 = v44;

      bgTuning[v11].neg.tide = v45;
      v46 = [v42 objectForKeyedSubscript:@"Light"];
      if (!v46 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
        int v69 = -73271;
      }
      [v46 floatValue];
      float v48 = v47;

      bgTuning[v11].neg.light = v48;
      v49 = [v42 objectForKeyedSubscript:@"Shadow"];
      if (!v49 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
        int v69 = -73271;
      }
      [v49 floatValue];
      float v51 = v50;

      bgTuning[v11].neg.shadow = v51;
      v52 = [v42 objectForKeyedSubscript:@"BrightSat"];
      if (!v52 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
        int v69 = -73271;
      }
      [v52 floatValue];
      float v54 = v53;

      bgTuning[v11].neg.brightSat = v54;
      v55 = [v42 objectForKeyedSubscript:@"Sat"];
      if (!v55 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
        int v69 = -73271;
      }
      [v55 floatValue];
      float v57 = v56;

      bgTuning[v11].neg.sat = v57;
      v58 = [v42 objectForKeyedSubscript:@"Exposure"];
      if (!v58 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
        int v69 = -73271;
      }
      [v58 floatValue];
      float v60 = v59;

      bgTuning[v11].neg.exposure = v60;
      v61 = [v42 objectForKeyedSubscript:@"Brightness"];
      if (!v61 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
        int v69 = -73271;
      }
      [v61 floatValue];
      float v63 = v62;

      bgTuning[v11].neg.brightness = v63;
      v64 = [v42 objectForKeyedSubscript:@"Contrast"];
      if (!v64 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
        int v69 = -73271;
      }
      [v64 floatValue];
      float v66 = v65;

      bgTuning[v11].neg.contrast = v66;
    }
    int v67 = v69;
  }
  else
  {
    int v67 = v69;
  }

  return v67;
}

- (int)readForegroundTuning:(id)a3
{
  id v4 = a3;
  int v39 = 0;
  v5 = [v4 objectForKeyedSubscript:@"PersonMix"];
  if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
    int v39 = -73271;
  }
  [v5 floatValue];
  float v7 = v6;

  p_fgTuning = &self->_fgTuning;
  self->_fgTuning.personMix = v7;
  int v9 = [v4 objectForKeyedSubscript:@"SkinMix"];
  if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
    int v39 = -73271;
  }
  [v9 floatValue];
  float v11 = v10;

  p_fgTuning->skinMix = v11;
  float v12 = [@"Foreground" stringByAppendingPathComponent:@"Warm"];
  v13 = getSubDict(v4, @"Warm", &v39);
  float v14 = v13;
  if (v13)
  {
    float v15 = [v13 objectForKeyedSubscript:@"FaceI"];
    if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
      int v39 = -73271;
    }
    [v15 floatValue];
    float v17 = v16;

    p_fgTuning->warm.faceI = v17;
    int v18 = [v14 objectForKeyedSubscript:@"FaceQ"];
    if (!v18 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
      int v39 = -73271;
    }
    [v18 floatValue];
    float v20 = v19;

    p_fgTuning->warm.faceQ = v20;
    int v21 = [v14 objectForKeyedSubscript:@"UnderTone"];
    if (!v21 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
      int v39 = -73271;
    }
    [v21 floatValue];
    float v23 = v22;

    p_fgTuning->warm.underTone = v23;
  }
  int v24 = [v12 stringByDeletingLastPathComponent];

  v25 = [v24 stringByAppendingPathComponent:@"Cool"];

  int v26 = getSubDict(v4, @"Cool", &v39);
  int v27 = v26;
  if (v26)
  {
    v28 = [v26 objectForKeyedSubscript:@"FaceI"];
    if (!v28 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
      int v39 = -73271;
    }
    [v28 floatValue];
    float v30 = v29;

    p_fgTuning->cool.faceI = v30;
    v31 = [v27 objectForKeyedSubscript:@"FaceQ"];
    if (!v31 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
      int v39 = -73271;
    }
    [v31 floatValue];
    float v33 = v32;

    p_fgTuning->cool.faceQ = v33;
    v34 = [v27 objectForKeyedSubscript:@"UnderTone"];
    if (!v34 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
      int v39 = -73271;
    }
    [v34 floatValue];
    float v36 = v35;

    p_fgTuning->cool.underTone = v36;
  }
  int v37 = v39;

  return v37;
}

@end