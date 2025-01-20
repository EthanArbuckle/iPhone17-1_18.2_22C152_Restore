@interface TVLALSCalibrationData
+ (id)instanceFromDictionary:(id)a3;
- (NSArray)spectrumNom;
- (NSNumber)channels;
- (NSNumber)displayID;
- (NSNumber)normalizationFactor;
- (NSNumber)version;
- (NSNumber)wavelengthEnd;
- (NSNumber)wavelengthStartNIR;
- (NSNumber)wavelengthStartVisible;
- (NSNumber)wavelengthStep;
- (id)dictionaryRepresentation;
- (void)setChannels:(id)a3;
- (void)setDisplayID:(id)a3;
- (void)setNormalizationFactor:(id)a3;
- (void)setSpectrumNom:(id)a3;
- (void)setVersion:(id)a3;
- (void)setWavelengthEnd:(id)a3;
- (void)setWavelengthStartNIR:(id)a3;
- (void)setWavelengthStartVisible:(id)a3;
- (void)setWavelengthStep:(id)a3;
@end

@implementation TVLALSCalibrationData

- (id)dictionaryRepresentation
{
  v32[10] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(TVLALSCalibrationData *)self version];
  if (!v3) {
    goto LABEL_19;
  }
  v4 = (void *)v3;
  uint64_t v5 = [(TVLALSCalibrationData *)self displayID];
  if (!v5) {
    goto LABEL_18;
  }
  v6 = (void *)v5;
  uint64_t v7 = [(TVLALSCalibrationData *)self spectrumNom];
  if (!v7)
  {
LABEL_17:

LABEL_18:
    goto LABEL_19;
  }
  v8 = (void *)v7;
  uint64_t v9 = [(TVLALSCalibrationData *)self wavelengthStartVisible];
  if (!v9)
  {
LABEL_16:

    goto LABEL_17;
  }
  v10 = (void *)v9;
  uint64_t v11 = [(TVLALSCalibrationData *)self wavelengthStartNIR];
  if (!v11)
  {
LABEL_15:

    goto LABEL_16;
  }
  v12 = (void *)v11;
  uint64_t v13 = [(TVLALSCalibrationData *)self wavelengthEnd];
  if (!v13)
  {
LABEL_14:

    goto LABEL_15;
  }
  v14 = (void *)v13;
  uint64_t v15 = [(TVLALSCalibrationData *)self wavelengthStep];
  if (!v15)
  {

    goto LABEL_14;
  }
  v16 = (void *)v15;
  v17 = [(TVLALSCalibrationData *)self channels];

  if (v17)
  {
    v32[0] = &unk_26DFE91C8;
    v18 = [(TVLALSCalibrationData *)self version];
    v32[1] = v18;
    v31[2] = @"ALS_CALIBRATION_DISPLAY_ID";
    v19 = [(TVLALSCalibrationData *)self displayID];
    v32[2] = v19;
    v31[3] = @"ALS_CALIBRATION_NCHANNELS";
    v20 = [(TVLALSCalibrationData *)self channels];
    v32[3] = v20;
    v31[4] = @"ALS_CALIBRATION_SPECTRUM_NOM";
    v21 = [(TVLALSCalibrationData *)self spectrumNom];
    v32[4] = v21;
    v31[5] = @"ALS_CALIBRATION_NARMALIZATION_FACTOR";
    uint64_t v22 = [(TVLALSCalibrationData *)self normalizationFactor];
    v23 = (void *)v22;
    if (v22) {
      v24 = (void *)v22;
    }
    else {
      v24 = &unk_26DFE91C8;
    }
    v32[5] = v24;
    v31[6] = @"ALS_CALIBRATION_WAVELENGTH_END";
    v25 = [(TVLALSCalibrationData *)self wavelengthEnd];
    v32[6] = v25;
    v31[7] = @"ALS_CALIBRATION_WAVELENGTH_STEP";
    v26 = [(TVLALSCalibrationData *)self wavelengthStep];
    v32[7] = v26;
    v31[8] = @"ALS_CALIBRATION_WAVELENGTH_START_NIR";
    v27 = [(TVLALSCalibrationData *)self wavelengthStartNIR];
    v32[8] = v27;
    v31[9] = @"ALS_CALIBRATION_WAVELENGTH_START_VISIBLE";
    v28 = [(TVLALSCalibrationData *)self wavelengthStartVisible];
    v32[9] = v28;
    v29 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:10];

    goto LABEL_20;
  }
LABEL_19:
  v29 = (void *)MEMORY[0x263EFFA78];
LABEL_20:

  return v29;
}

+ (id)instanceFromDictionary:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(TVLALSCalibrationData);
  uint64_t v5 = [v3 objectForKey:@"ALS_CALIBRATION_VERSION"];
  v6 = (void *)v5;
  if (v5) {
    uint64_t v7 = (void *)v5;
  }
  else {
    uint64_t v7 = &unk_26DFE91C8;
  }
  [(TVLALSCalibrationData *)v4 setVersion:v7];

  uint64_t v8 = [v3 objectForKey:@"ALS_CALIBRATION_DISPLAY_ID"];
  uint64_t v9 = (void *)v8;
  if (v8) {
    v10 = (void *)v8;
  }
  else {
    v10 = &unk_26DFE91C8;
  }
  [(TVLALSCalibrationData *)v4 setDisplayID:v10];

  uint64_t v11 = [v3 objectForKey:@"ALS_CALIBRATION_NCHANNELS"];
  [(TVLALSCalibrationData *)v4 setChannels:v11];

  v12 = [v3 objectForKey:@"ALS_CALIBRATION_SPECTRUM_NOM"];
  [(TVLALSCalibrationData *)v4 setSpectrumNom:v12];

  uint64_t v13 = [v3 objectForKey:@"ALS_CALIBRATION_WAVELENGTH_START_VISIBLE"];
  [(TVLALSCalibrationData *)v4 setWavelengthStartVisible:v13];

  v14 = [v3 objectForKey:@"ALS_CALIBRATION_WAVELENGTH_START_NIR"];
  [(TVLALSCalibrationData *)v4 setWavelengthStartNIR:v14];

  uint64_t v15 = [v3 objectForKey:@"ALS_CALIBRATION_WAVELENGTH_END"];
  [(TVLALSCalibrationData *)v4 setWavelengthEnd:v15];

  v16 = [v3 objectForKey:@"ALS_CALIBRATION_WAVELENGTH_STEP"];
  [(TVLALSCalibrationData *)v4 setWavelengthStep:v16];

  v17 = [v3 objectForKey:@"ALS_CALIBRATION_NARMALIZATION_FACTOR"];

  [(TVLALSCalibrationData *)v4 setNormalizationFactor:v17];
  v18 = [(TVLALSCalibrationData *)v4 version];
  if (v18)
  {
    uint64_t v19 = [(TVLALSCalibrationData *)v4 displayID];
    if (v19)
    {
      v20 = (void *)v19;
      uint64_t v21 = [(TVLALSCalibrationData *)v4 spectrumNom];
      if (v21)
      {
        uint64_t v22 = (void *)v21;
        uint64_t v23 = [(TVLALSCalibrationData *)v4 wavelengthStartVisible];
        if (v23)
        {
          v24 = (void *)v23;
          uint64_t v25 = [(TVLALSCalibrationData *)v4 wavelengthStartNIR];
          if (v25)
          {
            v26 = (void *)v25;
            uint64_t v27 = [(TVLALSCalibrationData *)v4 wavelengthEnd];
            if (v27)
            {
              v28 = (void *)v27;
              uint64_t v29 = [(TVLALSCalibrationData *)v4 wavelengthStep];
              if (v29)
              {
                v30 = (void *)v29;
                v31 = [(TVLALSCalibrationData *)v4 channels];

                if (v31)
                {
                  v18 = v4;
                  goto LABEL_23;
                }
                goto LABEL_22;
              }
            }
          }
        }
      }
    }
LABEL_22:
    v18 = 0;
  }
LABEL_23:

  return v18;
}

- (NSNumber)channels
{
  return self->_channels;
}

- (void)setChannels:(id)a3
{
}

- (NSNumber)wavelengthStartVisible
{
  return self->_wavelengthStartVisible;
}

- (void)setWavelengthStartVisible:(id)a3
{
}

- (NSNumber)wavelengthStartNIR
{
  return self->_wavelengthStartNIR;
}

- (void)setWavelengthStartNIR:(id)a3
{
}

- (NSNumber)wavelengthEnd
{
  return self->_wavelengthEnd;
}

- (void)setWavelengthEnd:(id)a3
{
}

- (NSNumber)wavelengthStep
{
  return self->_wavelengthStep;
}

- (void)setWavelengthStep:(id)a3
{
}

- (NSNumber)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (NSNumber)displayID
{
  return self->_displayID;
}

- (void)setDisplayID:(id)a3
{
}

- (NSNumber)normalizationFactor
{
  return self->_normalizationFactor;
}

- (void)setNormalizationFactor:(id)a3
{
}

- (NSArray)spectrumNom
{
  return self->_spectrumNom;
}

- (void)setSpectrumNom:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spectrumNom, 0);
  objc_storeStrong((id *)&self->_normalizationFactor, 0);
  objc_storeStrong((id *)&self->_displayID, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_wavelengthStep, 0);
  objc_storeStrong((id *)&self->_wavelengthEnd, 0);
  objc_storeStrong((id *)&self->_wavelengthStartNIR, 0);
  objc_storeStrong((id *)&self->_wavelengthStartVisible, 0);

  objc_storeStrong((id *)&self->_channels, 0);
}

@end