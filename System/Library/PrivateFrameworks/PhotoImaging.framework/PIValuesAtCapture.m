@interface PIValuesAtCapture
+ (id)valuesAtCaptureFromImageProperties:(id)a3 error:(id *)a4;
- ($2825F4736939C4A6D3AD43837233062D)depthVersionInfo;
- (NSDictionary)focusRect;
- (NSNumber)maximumAperture;
- (NSNumber)minimumAperture;
- (float)aperture;
- (float)portraitStrength;
- (id)description;
- (id)initFromMinAperture:(float)a3 maxAperture:(float)a4 aperture:(float)a5 focusRect:(id)a6 portraitStrength:(float)a7 SDOFRenderingVersion:(unint64_t)a8 depthVersionInfo:(id)a9;
- (unint64_t)SDOFRenderingVersion;
- (unint64_t)portraitMajorVersion;
- (unint64_t)portraitMinorVersion;
- (void)setAperture:(float)a3;
- (void)setDepthVersionInfo:(id)a3;
- (void)setFocusRect:(id)a3;
- (void)setMaximumAperture:(id)a3;
- (void)setMinimumAperture:(id)a3;
- (void)setPortraitMajorVersion:(unint64_t)a3;
- (void)setPortraitMinorVersion:(unint64_t)a3;
- (void)setPortraitStrength:(float)a3;
- (void)setSDOFRenderingVersion:(unint64_t)a3;
@end

@implementation PIValuesAtCapture

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumAperture, 0);
  objc_storeStrong((id *)&self->_minimumAperture, 0);
  objc_storeStrong((id *)&self->_focusRect, 0);
}

- (void)setDepthVersionInfo:(id)a3
{
  self->_depthVersionInfo = ($9E65B678CC00D971BA8859CB3A28E87B)a3;
}

- ($2825F4736939C4A6D3AD43837233062D)depthVersionInfo
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_depthVersionInfo;
}

- (void)setPortraitMinorVersion:(unint64_t)a3
{
  self->_portraitMinorVersion = a3;
}

- (unint64_t)portraitMinorVersion
{
  return self->_portraitMinorVersion;
}

- (void)setPortraitMajorVersion:(unint64_t)a3
{
  self->_portraitMajorVersion = a3;
}

- (unint64_t)portraitMajorVersion
{
  return self->_portraitMajorVersion;
}

- (void)setSDOFRenderingVersion:(unint64_t)a3
{
  self->_SDOFRenderingVersion = a3;
}

- (unint64_t)SDOFRenderingVersion
{
  return self->_SDOFRenderingVersion;
}

- (void)setMaximumAperture:(id)a3
{
}

- (NSNumber)maximumAperture
{
  return self->_maximumAperture;
}

- (void)setMinimumAperture:(id)a3
{
}

- (NSNumber)minimumAperture
{
  return self->_minimumAperture;
}

- (void)setFocusRect:(id)a3
{
}

- (NSDictionary)focusRect
{
  return self->_focusRect;
}

- (void)setPortraitStrength:(float)a3
{
  self->_portraitStrength = a3;
}

- (float)portraitStrength
{
  return self->_portraitStrength;
}

- (void)setAperture:(float)a3
{
  self->_aperture = a3;
}

- (float)aperture
{
  return self->_aperture;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(PIValuesAtCapture *)self aperture];
  double v6 = v5;
  v7 = [(PIValuesAtCapture *)self minimumAperture];
  v8 = [(PIValuesAtCapture *)self maximumAperture];
  v9 = [(PIValuesAtCapture *)self focusRect];
  [(PIValuesAtCapture *)self portraitStrength];
  v11 = [v3 stringWithFormat:@"<%@:%p \n\taperture:%f \n\tminimumAperture:%@ \n\tmaximumAperture:%@ \n\tfocusRect:%@ \n\tportraitStrength:%f \n\tSDOFRenderingVersion:%lu \n\tportraitMajorVersion:%lu \n\tportraitMinorVersion:%lu \n\tdepthInfoMajorVersion:%d \n\tdepthInfoMinorVersion:%d>", v4, self, *(void *)&v6, v7, v8, v9, v10, -[PIValuesAtCapture SDOFRenderingVersion](self, "SDOFRenderingVersion"), -[PIValuesAtCapture portraitMajorVersion](self, "portraitMajorVersion"), -[PIValuesAtCapture portraitMinorVersion](self, "portraitMinorVersion"), -[PIValuesAtCapture depthVersionInfo](self, "depthVersionInfo"), (unint64_t)-[PIValuesAtCapture depthVersionInfo](self, "depthVersionInfo") >> 32];

  return v11;
}

- (id)initFromMinAperture:(float)a3 maxAperture:(float)a4 aperture:(float)a5 focusRect:(id)a6 portraitStrength:(float)a7 SDOFRenderingVersion:(unint64_t)a8 depthVersionInfo:(id)a9
{
  v31.receiver = self;
  v31.super_class = (Class)PIValuesAtCapture;
  id v15 = a6;
  v16 = [(PIValuesAtCapture *)&v31 init];
  v17 = v16;
  BOOL v18 = a3 > 0.0;
  if (a4 <= 0.0) {
    BOOL v18 = 0;
  }
  BOOL v19 = a7 <= 1.0 && a7 >= 0.0;
  if (a8 >= 4)
  {
    long long v20 = xmmword_1A980BA30;
LABEL_10:
    *(_OWORD *)&v16->_portraitMajorVersion = v20;
    goto LABEL_11;
  }
  if (v19)
  {
    long long v20 = xmmword_1A980BA20;
    goto LABEL_10;
  }
  v16->_portraitMajorVersion = 1;
  v16->_portraitMinorVersion = v18;
LABEL_11:
  float v21 = 5.9;
  if (a5 > 0.0) {
    float v21 = a5;
  }
  v16->_aperture = v21;
  uint64_t v22 = objc_msgSend(v15, "copy", v31.receiver, v31.super_class);

  focusRect = v17->_focusRect;
  v17->_focusRect = (NSDictionary *)v22;

  LODWORD(v24) = 0.5;
  if (v19) {
    *(float *)&double v24 = a7;
  }
  v17->_portraitStrength = *(float *)&v24;
  if (a3 <= 0.0)
  {
    minimumAperture = v17->_minimumAperture;
    v17->_minimumAperture = 0;
  }
  else
  {
    *(float *)&double v24 = a3;
    uint64_t v25 = [NSNumber numberWithFloat:v24];
    minimumAperture = v17->_minimumAperture;
    v17->_minimumAperture = (NSNumber *)v25;
  }

  if (a4 <= 0.0)
  {
    maximumAperture = v17->_maximumAperture;
    v17->_maximumAperture = 0;
  }
  else
  {
    *(float *)&double v27 = a4;
    uint64_t v28 = [NSNumber numberWithFloat:v27];
    maximumAperture = v17->_maximumAperture;
    v17->_maximumAperture = (NSNumber *)v28;
  }

  v17->_depthVersionInfo = ($9E65B678CC00D971BA8859CB3A28E87B)a9;
  v17->_SDOFRenderingVersion = a8;
  return v17;
}

+ (id)valuesAtCaptureFromImageProperties:(id)a3 error:(id *)a4
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!a4)
  {
    v48 = NUAssertLogger_25708();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      v49 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      *(void *)v68 = v49;
      _os_log_error_impl(&dword_1A9680000, v48, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v50 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v52 = NUAssertLogger_25708();
    BOOL v53 = os_log_type_enabled(v52, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v53)
      {
        v56 = dispatch_get_specific(*v50);
        v57 = (void *)MEMORY[0x1E4F29060];
        id v58 = v56;
        v59 = [v57 callStackSymbols];
        v60 = [v59 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)v68 = v56;
        *(_WORD *)&v68[8] = 2114;
        *(void *)&v68[10] = v60;
        _os_log_error_impl(&dword_1A9680000, v52, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v53)
    {
      v54 = [MEMORY[0x1E4F29060] callStackSymbols];
      v55 = [v54 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)v68 = v55;
      _os_log_error_impl(&dword_1A9680000, v52, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  double v6 = v5;
  v7 = [v5 metadata];
  v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F2FC20]];

  v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F15578]];
  char v10 = [v9 unsignedIntValue];

  if ((v10 & 0x40) != 0)
  {
    [MEMORY[0x1E4F7A438] invalidError:@"Portrait was previously applied." object:0];
    id v25 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  v11 = [v6 auxiliaryImagePropertiesForType:2];
  id v66 = 0;
  v12 = [v11 auxiliaryImage:&v66];
  id v13 = v66;
  if (v12)
  {
    v14 = [v12 underlyingAVDepthData];
    if ([v14 isDepthDataFiltered])
    {
      if ([v14 depthDataQuality])
      {
        id v15 = [v14 cameraCalibrationData];

        if (v15)
        {
          id v65 = 0;
          v16 = [v11 auxiliaryCoreGraphicsInfoDictionary:&v65];
          id v17 = v65;

          if (v16)
          {
            BOOL v18 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F2F380]];

            if (v18)
            {
              v62 = v16;
              BOOL v19 = (__CFString *)CGImageMetadataCopyStringValueWithPath((CGImageMetadataRef)v18, 0, @"depthData:DepthDataVersion");
              unsigned int v20 = [(__CFString *)v19 intValue];
              uint64_t v21 = HIWORD(v20);
              unsigned __int16 v61 = [(__CFString *)v19 intValue];

              if (v20 < 0x20000)
              {
                uint64_t v64 = 0;
                float v63 = 0.0;
                objc_super v31 = (void *)MEMORY[0x1E4F1E040];
                v32 = [v14 depthBlurEffectRenderingParameters];
                int v33 = [v31 getMinMaxSimulatedApertureFrom:v32 minValue:&v64 maxValue:&v63 version:(char *)&v64 + 4];

                if (v33)
                {
                  v34 = NULogger_25825();
                  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 67109888;
                    *(_DWORD *)v68 = v33;
                    *(_WORD *)&v68[4] = 2048;
                    *(double *)&v68[6] = *(float *)&v64;
                    *(_WORD *)&v68[14] = 2048;
                    *(double *)&v68[16] = v63;
                    __int16 v69 = 1024;
                    int v70 = HIDWORD(v64);
                    _os_log_error_impl(&dword_1A9680000, v34, OS_LOG_TYPE_ERROR, "PIPortraitAutoCalculator getMinMaxSimulatedAperture returned error:%i (minAperture:%f maxAperture:%f version:%d)", buf, 0x22u);
                  }
                }
                uint64_t v35 = [MEMORY[0x1E4F1E040] maxSDOFRenderingVersionSupported];
                if (SHIDWORD(v64) <= (int)v35)
                {
                  [v14 depthBlurEffectSimulatedAperture];
                  int v38 = v37;
                  [v14 portraitLightingEffectStrength];
                  int v40 = v39;
                  uint64_t v41 = SHIDWORD(v64);
                  v42 = [v6 metadata];
                  v36 = +[PIPortraitAutoCalculator focusRectDictionaryFromMetadata:v42];

                  v43 = [PIValuesAtCapture alloc];
                  *(float *)&double v45 = v63;
                  LODWORD(v44) = v64;
                  LODWORD(v46) = v38;
                  LODWORD(v47) = v40;
                  id v25 = [(PIValuesAtCapture *)v43 initFromMinAperture:v36 maxAperture:v41 aperture:v21 | ((unint64_t)v61 << 32) focusRect:v44 portraitStrength:v45 SDOFRenderingVersion:v46 depthVersionInfo:v47];
                }
                else
                {
                  v36 = objc_msgSend(NSString, "stringWithFormat:", @"We only know up to sDOF version %d. Found: %d", v35, HIDWORD(v64));
                  [MEMORY[0x1E4F7A438] unsupportedError:v36 object:0];
                  id v25 = 0;
                  *a4 = (id)objc_claimAutoreleasedReturnValue();
                }
                v16 = v62;
              }
              else
              {
                uint64_t v22 = NSString;
                v23 = [NSNumber numberWithInt:v21];
                double v24 = [v22 stringWithFormat:@"Depth data version mismatch, asset has %@ but we can only handle %@", v23, &unk_1F000A0B8];

                v16 = v62;
                *a4 = [MEMORY[0x1E4F7A438] unsupportedError:v24 object:v62];

                id v25 = 0;
              }
              goto LABEL_34;
            }
            v30 = [MEMORY[0x1E4F7A438] missingError:@"Missing auxiliary metadata" object:v16];
          }
          else
          {
            v30 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to load auxiliary data" object:v11 underlyingError:v17];
          }
          id v25 = 0;
          *a4 = v30;
LABEL_34:

          goto LABEL_17;
        }
        uint64_t v28 = [MEMORY[0x1E4F7A438] missingError:@"Missing camera calibration data" object:v14];
LABEL_16:
        id v25 = 0;
        *a4 = v28;
        id v17 = v13;
LABEL_17:

        id v13 = v17;
        goto LABEL_18;
      }
      v26 = (void *)MEMORY[0x1E4F7A438];
      double v27 = @"Low quality depth data is not supported";
    }
    else
    {
      v26 = (void *)MEMORY[0x1E4F7A438];
      double v27 = @"Unfiltered depth data is not supported";
    }
    uint64_t v28 = [v26 unsupportedError:v27 object:v14];
    goto LABEL_16;
  }
  [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to load depth data" object:v11 underlyingError:v13];
  id v25 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:

LABEL_19:
  return v25;
}

@end