@interface CMIVideoDeghostingBrightLightTuningParamsV1
- (BrightLightTuning)tuningParams;
- (CMIVideoDeghostingBrightLightTuningParamsV1)init;
- (int)readPlist:(id)a3;
- (void)setDefaultTuningParams;
- (void)setTuningParams:(BrightLightTuning *)a3;
@end

@implementation CMIVideoDeghostingBrightLightTuningParamsV1

- (void)setDefaultTuningParams
{
  long long v18 = xmmword_22A68;
  *(void *)v19 = 0x3B03126F3CF5C28FLL;
  *(_OWORD *)&v19[24] = unk_22A90;
  *(_OWORD *)&v19[8] = xmmword_22A80;
  *(_OWORD *)&v19[56] = unk_22AB0;
  *(_OWORD *)&v19[40] = xmmword_22AA0;
  long long v14 = *(_OWORD *)&v19[16];
  long long v15 = *(_OWORD *)&v19[32];
  long long v16 = *(_OWORD *)&v19[48];
  *(void *)v17 = unk_22AB8;
  long long v12 = xmmword_22A68;
  long long v13 = *(_OWORD *)v19;
  *(_OWORD *)&v17[8] = xmmword_22AD0;
  long long v24 = *(_OWORD *)&v19[48];
  long long v25 = *(_OWORD *)v17;
  uint64_t v26 = 0x3DCCCCCD3E800000;
  long long v20 = xmmword_22A68;
  long long v21 = *(_OWORD *)v19;
  long long v22 = *(_OWORD *)&v19[16];
  long long v23 = *(_OWORD *)&v19[32];
  v2[1] = 0;
  long long v3 = xmmword_22AC0;
  int v4 = 0;
  long long v7 = *(_OWORD *)&v19[16];
  long long v6 = *(_OWORD *)v19;
  long long v5 = xmmword_22A68;
  uint64_t v11 = 0x3DCCCCCD3E800000;
  long long v10 = *(_OWORD *)v17;
  long long v9 = *(_OWORD *)&v19[48];
  long long v8 = *(_OWORD *)&v19[32];
  v2[0] = 256;
  [(CMIVideoDeghostingBrightLightTuningParamsV1 *)self setTuningParams:v2];
}

- (CMIVideoDeghostingBrightLightTuningParamsV1)init
{
  v4.receiver = self;
  v4.super_class = (Class)CMIVideoDeghostingBrightLightTuningParamsV1;
  v2 = [(CMIVideoDeghostingBrightLightTuningParamsV1 *)&v4 init];
  [(CMIVideoDeghostingBrightLightTuningParamsV1 *)v2 setDefaultTuningParams];
  return v2;
}

- (int)readPlist:(id)a3
{
  id v4 = a3;
  long long v5 = [v4 objectForKeyedSubscript:@"enabled"];

  if (!v5) {
    goto LABEL_35;
  }
  long long v6 = [v4 objectForKeyedSubscript:@"enabled"];
  self->_tuningParams.enabled = [v6 BOOLValue];

  long long v7 = [v4 objectForKeyedSubscript:@"useClippingData"];

  if (!v7
    || ([v4 objectForKeyedSubscript:@"useClippingData"],
        long long v8 = objc_claimAutoreleasedReturnValue(),
        self->_tuningParams.useClippingData = [v8 BOOLValue],
        v8,
        [v4 objectForKeyedSubscript:@"clipping"],
        (long long v9 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_35:
    FigDebugAssert3();
LABEL_48:
    int v84 = -1;
    goto LABEL_31;
  }
  long long v10 = v9;
  uint64_t v11 = [v9 objectForKeyedSubscript:@"paddingRatio"];

  if (!v11) {
    goto LABEL_36;
  }
  long long v12 = [v10 objectForKeyedSubscript:@"paddingRatio"];
  [v12 floatValue];
  self->_tuningParams.clippingDataParams.paddingRatio = v13;

  long long v14 = [v10 objectForKeyedSubscript:@"minClippedPixelRatio"];

  if (!v14) {
    goto LABEL_36;
  }
  long long v15 = [v10 objectForKeyedSubscript:@"minClippedPixelRatio"];
  [v15 floatValue];
  self->_tuningParams.clippingDataParams.minClippedPixelRatio = v16;

  v17 = [v10 objectForKeyedSubscript:@"clippedPixelRatio"];

  if (!v17) {
    goto LABEL_36;
  }
  long long v18 = [v10 objectForKeyedSubscript:@"clippedPixelRatio"];
  [v18 floatValue];
  self->_tuningParams.clippingDataParams.clippedPixelRatio = v19;

  long long v20 = [v10 objectForKeyedSubscript:@"maxClippedTilesCount"];

  if (!v20
    || ([v10 objectForKeyedSubscript:@"maxClippedTilesCount"],
        long long v21 = objc_claimAutoreleasedReturnValue(),
        [v21 floatValue],
        self->_tuningParams.clippingDataParams.maxClippedTilesCount = v22,
        v21,
        [v4 objectForKeyedSubscript:@"detection"],
        (long long v23 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_36:
    FigDebugAssert3();
LABEL_47:

    goto LABEL_48;
  }
  long long v24 = v23;
  long long v25 = [v23 objectForKeyedSubscript:@"brightness"];
  uint64_t v26 = v25;
  if (!v25) {
    goto LABEL_45;
  }
  v27 = [v25 objectForKeyedSubscript:@"threshold"];

  if (!v27) {
    goto LABEL_45;
  }
  v28 = [v26 objectForKeyedSubscript:@"threshold"];
  [v28 floatValue];
  self->_tuningParams.blDetectionParams.detectionParams.brightParams.threshold = v29;

  v30 = [v26 objectForKeyedSubscript:@"dilationNormalizedRadius"];

  if (!v30) {
    goto LABEL_45;
  }
  v31 = [v26 objectForKeyedSubscript:@"dilationNormalizedRadius"];
  [v31 floatValue];
  self->_tuningParams.blDetectionParams.detectionParams.var1 = v32;

  v33 = [v26 objectForKeyedSubscript:@"erosionNormalizedRadius"];

  if (!v33) {
    goto LABEL_45;
  }
  v34 = [v26 objectForKeyedSubscript:@"erosionNormalizedRadius"];
  [v34 floatValue];
  *(&self->_tuningParams.blDetectionParams.detectionParams.var1 + 1) = v35;

  v36 = [v26 objectForKeyedSubscript:@"normalizedOpticalCenter"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || [v36 count] != (char *)&dword_0 + 2) {
    goto LABEL_44;
  }
  v37 = [v36 objectAtIndexedSubscript:0];
  [v37 floatValue];
  LODWORD(self->_tuningParams.blDetectionParams.detectionParams.var0) = v38;

  v39 = [v36 objectAtIndexedSubscript:1];
  [v39 floatValue];
  HIDWORD(self->_tuningParams.blDetectionParams.detectionParams.var0) = v40;

  v41 = [v24 objectForKeyedSubscript:@"greenSDR"];
  uint64_t v26 = v41;
  if (!v41) {
    goto LABEL_45;
  }
  v42 = [v41 objectForKeyedSubscript:@"hueThreshold"];
  [v42 floatValue];
  self->_tuningParams.var0 = v43;

  v44 = [v26 objectForKeyedSubscript:@"openingNormalizedRadius"];
  [v44 floatValue];
  *(_DWORD *)&self[1]._tuningParams.enabled = v45;

  v46 = [v26 objectForKeyedSubscript:@"dilationNormalizedRadius"];
  [v46 floatValue];
  self[1]._tuningParams.clippingDataParams.paddingRatio = v47;

  v36 = [v26 objectForKeyedSubscript:@"hueRange"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_44;
  }
  if ([v36 count] != (char *)&dword_0 + 2) {
    goto LABEL_44;
  }
  v48 = [v36 objectAtIndexedSubscript:0];
  [v48 floatValue];
  LODWORD(self->_tuningParams.blDetectionParams.detectionParams.var2) = v49;

  v50 = [v36 objectAtIndexedSubscript:1];
  [v50 floatValue];
  HIDWORD(self->_tuningParams.blDetectionParams.detectionParams.var2) = v51;

  v36 = [v26 objectForKeyedSubscript:@"valueThresholds"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || [v36 count] != (char *)&dword_0 + 2) {
    goto LABEL_44;
  }
  v52 = [v36 objectAtIndexedSubscript:0];
  [v52 floatValue];
  LODWORD(self[1].super.isa) = v53;

  v54 = [v36 objectAtIndexedSubscript:1];
  [v54 floatValue];
  HIDWORD(self[1].super.isa) = v55;

  v56 = [v24 objectForKeyedSubscript:@"greenHDR"];
  uint64_t v26 = v56;
  if (!v56)
  {
LABEL_45:
    FigDebugAssert3();
    goto LABEL_46;
  }
  v57 = [v56 objectForKeyedSubscript:@"hueThreshold"];
  [v57 floatValue];
  self[1]._tuningParams.clippingDataParams.maxClippedTilesCount = v58;

  v59 = [v26 objectForKeyedSubscript:@"openingNormalizedRadius"];
  [v59 floatValue];
  LODWORD(self[1]._tuningParams.blDetectionParams.detectionParams.var0) = v60;

  v61 = [v26 objectForKeyedSubscript:@"dilationNormalizedRadius"];
  [v61 floatValue];
  HIDWORD(self[1]._tuningParams.blDetectionParams.detectionParams.var0) = v62;

  v36 = [v26 objectForKeyedSubscript:@"hueRange"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_44;
  }
  if ([v36 count] != (char *)&dword_0 + 2) {
    goto LABEL_44;
  }
  v63 = [v36 objectAtIndexedSubscript:0];
  [v63 floatValue];
  self[1]._tuningParams.clippingDataParams.minClippedPixelRatio = v64;

  v65 = [v36 objectAtIndexedSubscript:1];
  [v65 floatValue];
  self[1]._tuningParams.clippingDataParams.clippedPixelRatio = v66;

  v36 = [v26 objectForKeyedSubscript:@"valueThresholds"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || [v36 count] != (char *)&dword_0 + 2)
  {
LABEL_44:
    FigDebugAssert3();

LABEL_46:
    goto LABEL_47;
  }
  v67 = [v36 objectAtIndexedSubscript:0];
  [v67 floatValue];
  self[1]._tuningParams.blDetectionParams.detectionParams.brightParams.threshold = v68;

  v69 = [v36 objectAtIndexedSubscript:1];
  [v69 floatValue];
  *((_DWORD *)&self[1]._tuningParams.blDetectionParams.detectionParams.brightParams + 1) = v70;

  v71 = [v24 objectForKeyedSubscript:@"refinement"];
  uint64_t v26 = v71;
  if (!v71) {
    goto LABEL_45;
  }
  v72 = [v71 objectForKeyedSubscript:@"openingNormalizedRadius"];

  if (!v72) {
    goto LABEL_45;
  }
  v73 = [v26 objectForKeyedSubscript:@"openingNormalizedRadius"];
  [v73 floatValue];
  self[1]._tuningParams.blDetectionParams.detectionParams.var1 = v74;

  v75 = [v26 objectForKeyedSubscript:@"dilationNormalizedRadius"];

  if (!v75) {
    goto LABEL_45;
  }
  v76 = [v26 objectForKeyedSubscript:@"dilationNormalizedRadius"];
  [v76 floatValue];
  *(&self[1]._tuningParams.blDetectionParams.detectionParams.var1 + 1) = v77;

  v78 = [v26 objectForKeyedSubscript:@"threshold"];

  if (!v78) {
    goto LABEL_45;
  }
  v79 = [v26 objectForKeyedSubscript:@"threshold"];
  [v79 floatValue];
  LODWORD(self[1]._tuningParams.blDetectionParams.detectionParams.var2) = v80;

  v81 = [v26 objectForKeyedSubscript:@"maskSurroundThreshold"];

  if (!v81) {
    goto LABEL_45;
  }
  v82 = [v26 objectForKeyedSubscript:@"maskSurroundThreshold"];
  [v82 floatValue];
  HIDWORD(self[1]._tuningParams.blDetectionParams.detectionParams.var2) = v83;

  int v84 = 0;
LABEL_31:

  return v84;
}

- (BrightLightTuning)tuningParams
{
  long long v3 = *(_OWORD *)&self[1].blDetectionParams.detectionParams.brightParams.threshold;
  *(_OWORD *)&retstr[1].enabled = *(_OWORD *)&self[1].clippingDataParams.minClippedPixelRatio;
  *(_OWORD *)&retstr[1].clippingDataParams.maxClippedTilesCount = v3;
  long long v4 = *(_OWORD *)&self[1].var0;
  *(_OWORD *)&retstr[1].blDetectionParams.detectionParams.var0 = *(_OWORD *)&self[1].blDetectionParams.detectionParams.var1;
  *(_OWORD *)&retstr[1].blDetectionParams.detectionParams.var2 = v4;
  long long v5 = *(_OWORD *)&self->blDetectionParams.detectionParams.brightParams.threshold;
  *(_OWORD *)&retstr->enabled = *(_OWORD *)&self->clippingDataParams.minClippedPixelRatio;
  *(_OWORD *)&retstr->clippingDataParams.maxClippedTilesCount = v5;
  long long v6 = *(_OWORD *)&self->var0;
  *(_OWORD *)&retstr->blDetectionParams.detectionParams.var0 = *(_OWORD *)&self->blDetectionParams.detectionParams.var1;
  *(_OWORD *)&retstr->blDetectionParams.detectionParams.var2 = v6;
  return self;
}

- (void)setTuningParams:(BrightLightTuning *)a3
{
  long long v3 = *(_OWORD *)&a3->enabled;
  long long v4 = *(_OWORD *)&a3->clippingDataParams.maxClippedTilesCount;
  long long v5 = *(_OWORD *)&a3->blDetectionParams.detectionParams.var0;
  *(_OWORD *)&self->_tuningParams.blDetectionParams.detectionParams.var2 = *(_OWORD *)&a3->blDetectionParams.detectionParams.var2;
  *(_OWORD *)&self->_tuningParams.blDetectionParams.detectionParams.var0 = v5;
  *(_OWORD *)&self->_tuningParams.clippingDataParams.maxClippedTilesCount = v4;
  *(_OWORD *)&self->_tuningParams.enabled = v3;
  long long v6 = *(_OWORD *)&a3[1].enabled;
  long long v7 = *(_OWORD *)&a3[1].clippingDataParams.maxClippedTilesCount;
  long long v8 = *(_OWORD *)&a3[1].blDetectionParams.detectionParams.var0;
  *(_OWORD *)&self[1]._tuningParams.blDetectionParams.detectionParams.var1 = *(_OWORD *)&a3[1].blDetectionParams.detectionParams.var2;
  *(_OWORD *)&self[1]._tuningParams.blDetectionParams.detectionParams.brightParams.threshold = v8;
  *(_OWORD *)&self[1]._tuningParams.clippingDataParams.minClippedPixelRatio = v7;
  *(_OWORD *)&self[1].super.isa = v6;
}

@end