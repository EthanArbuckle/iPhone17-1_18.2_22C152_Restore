@interface NTKOneColumnModularSmallLayoutAttributes
+ (id)attributesForTemplate:(id)a3 forDevice:(id)a4;
- (CLKFont)subtitleFont;
- (CLKFont)titleFont;
- (double)imageHeight;
- (double)imageOriginY;
- (double)marginWidth;
- (double)minimumFontSize;
- (double)subtitleBaselineOffset;
- (double)titleBaselineOffset;
- (void)setImageHeight:(double)a3;
- (void)setImageOriginY:(double)a3;
- (void)setMarginWidth:(double)a3;
- (void)setMinimumFontSize:(double)a3;
- (void)setSubtitleBaselineOffset:(double)a3;
- (void)setSubtitleFont:(id)a3;
- (void)setTitleBaselineOffset:(double)a3;
- (void)setTitleFont:(id)a3;
@end

@implementation NTKOneColumnModularSmallLayoutAttributes

+ (id)attributesForTemplate:(id)a3 forDevice:(id)a4
{
  v69[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!v5)
  {
    v10 = 0;
    goto LABEL_21;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&attributesForTemplate_forDevice____lock);
  id WeakRetained = objc_loadWeakRetained(&attributesForTemplate_forDevice____cachedDevice);
  if (WeakRetained)
  {
    v8 = WeakRetained;
    id v9 = objc_loadWeakRetained(&attributesForTemplate_forDevice____cachedDevice);
    if (v9 == v6)
    {
      uint64_t v11 = [v6 version];
      uint64_t v12 = attributesForTemplate_forDevice____previousCLKDeviceVersion;

      if (v11 == v12) {
        goto LABEL_8;
      }
    }
    else
    {
    }
  }
  id v13 = objc_storeWeak(&attributesForTemplate_forDevice____cachedDevice, v6);
  attributesForTemplate_forDevice____previousCLKDeviceVersion = [v6 version];

  uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
  v15 = (void *)attributesForTemplate_forDevice____classToAttributes;
  attributesForTemplate_forDevice____classToAttributes = v14;

LABEL_8:
  os_unfair_lock_unlock((os_unfair_lock_t)&attributesForTemplate_forDevice____lock);
  v16 = (objc_class *)objc_opt_class();
  v17 = NSStringFromClass(v16);
  v10 = [(id)attributesForTemplate_forDevice____classToAttributes objectForKeyedSubscript:v17];
  if (!v10)
  {
    v10 = objc_opt_new();
    [(id)attributesForTemplate_forDevice____classToAttributes setObject:v10 forKeyedSubscript:v17];
    v18 = [MEMORY[0x1E4F19A40] metricsWithDevice:v6 identitySizeClass:2];
    v68[0] = &unk_1F16E0438;
    v68[1] = &unk_1F16E0450;
    v69[0] = &unk_1F16E5880;
    v69[1] = &unk_1F16E5890;
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v69 forKeys:v68 count:2];
    [v18 scaledValue:v19 withOverrides:39.0];
    double v21 = v20;

    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
      double v21 = v21 * 3.0;
    }
    [v10 setSubtitleBaselineOffset:v21];
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      [v18 scaledValue:16.5];
      double v23 = v22;
      v66[0] = &unk_1F16E0438;
      v66[1] = &unk_1F16E0450;
      v67[0] = &unk_1F16E5880;
      v67[1] = &unk_1F16E5890;
      v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v67 forKeys:v66 count:2];
      [v18 scaledValue:v24 withOverrides:39.0];
      double v26 = v25;

      v64[0] = &unk_1F16E0438;
      v64[1] = &unk_1F16E0450;
      v65[0] = &unk_1F16E58A0;
      v65[1] = &unk_1F16E58B0;
      v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:v64 count:2];
      [v18 scaledValue:v27 withOverrides:22.0];
      double v29 = v28;

      v62[0] = &unk_1F16E0450;
      v62[1] = &unk_1F16E0468;
      v63[0] = &unk_1F16E58C0;
      v63[1] = &unk_1F16E58C0;
      v62[2] = &unk_1F16E0480;
      v63[2] = &unk_1F16E58C0;
      v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:v62 count:3];
      [v18 constantValue:v30 withOverrides:0.0];
      double v32 = v31;

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        double v23 = v23 * 3.0;
        double v26 = v26 * 3.0;
        double v29 = v29 * 3.0;
        double v32 = v32 * 3.0;
        double v33 = 25.5;
      }
      else
      {
        double v33 = 8.5;
      }
      [v10 setMinimumFontSize:v33];
      v34 = [MEMORY[0x1E4F19A50] systemFontOfSize:v23];
      [v10 setSubtitleFont:v34];

      [v10 setSubtitleBaselineOffset:v26];
      v35 = [MEMORY[0x1E4F19A50] systemFontOfSize:v23 weight:*MEMORY[0x1E4FB09D0]];
      [v10 setTitleFont:v35];

      [v10 setTitleBaselineOffset:v29];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_19;
        }
      }
      [v18 scaledValue:0 withOverride:14.0 forSizeClass:11.0];
      double v38 = v37;
      v60[0] = &unk_1F16E0438;
      v60[1] = &unk_1F16E0450;
      v61[0] = &unk_1F16E58D0;
      v61[1] = &unk_1F16E58E0;
      v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:v60 count:2];
      [v18 scaledValue:v39 withOverrides:10.5];
      double v41 = v40;

      v58[0] = &unk_1F16E0438;
      v58[1] = &unk_1F16E0450;
      v59[0] = &unk_1F16E58F0;
      v59[1] = &unk_1F16E5900;
      v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:v58 count:2];
      [v18 scaledValue:v42 withOverrides:14.0];
      double v44 = v43;

      v56[0] = &unk_1F16E0450;
      v56[1] = &unk_1F16E0468;
      v57[0] = &unk_1F16E58C0;
      v57[1] = &unk_1F16E58C0;
      v56[2] = &unk_1F16E0480;
      v57[2] = &unk_1F16E58C0;
      v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:3];
      [v18 constantValue:v45 withOverrides:0.0];
      double v47 = v46;

      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      double v49 = v38 * 3.0;
      double v50 = v41 * 3.0;
      double v51 = v44 * 3.0;
      if (isKindOfClass) {
        double v52 = v38 * 3.0;
      }
      else {
        double v52 = v38;
      }
      if (isKindOfClass) {
        double v53 = v41 * 3.0;
      }
      else {
        double v53 = v41;
      }
      if (isKindOfClass) {
        double v54 = v44 * 3.0;
      }
      else {
        double v54 = v44;
      }
      if (isKindOfClass) {
        double v32 = v47 * 3.0;
      }
      else {
        double v32 = v47;
      }
      v55 = objc_msgSend(MEMORY[0x1E4F19A50], "systemFontOfSize:", v52, v49, v50, v51, v47 * 3.0);
      [v10 setSubtitleFont:v55];

      [v10 setImageOriginY:v53];
      [v10 setImageHeight:v54];
    }
    [v10 setMarginWidth:v32];
LABEL_19:
  }
LABEL_21:

  return v10;
}

- (CLKFont)subtitleFont
{
  return self->_subtitleFont;
}

- (void)setSubtitleFont:(id)a3
{
}

- (double)subtitleBaselineOffset
{
  return self->_subtitleBaselineOffset;
}

- (void)setSubtitleBaselineOffset:(double)a3
{
  self->_subtitleBaselineOffset = a3;
}

- (double)marginWidth
{
  return self->_marginWidth;
}

- (void)setMarginWidth:(double)a3
{
  self->_marginWidth = a3;
}

- (double)imageOriginY
{
  return self->_imageOriginY;
}

- (void)setImageOriginY:(double)a3
{
  self->_imageOriginY = a3;
}

- (double)imageHeight
{
  return self->_imageHeight;
}

- (void)setImageHeight:(double)a3
{
  self->_imageHeight = a3;
}

- (double)minimumFontSize
{
  return self->_minimumFontSize;
}

- (void)setMinimumFontSize:(double)a3
{
  self->_minimumFontSize = a3;
}

- (CLKFont)titleFont
{
  return self->_titleFont;
}

- (void)setTitleFont:(id)a3
{
}

- (double)titleBaselineOffset
{
  return self->_titleBaselineOffset;
}

- (void)setTitleBaselineOffset:(double)a3
{
  self->_titleBaselineOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleFont, 0);

  objc_storeStrong((id *)&self->_subtitleFont, 0);
}

@end