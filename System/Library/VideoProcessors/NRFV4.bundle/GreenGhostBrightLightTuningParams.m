@interface GreenGhostBrightLightTuningParams
- (BrightLightTuning)tuningParams;
- (GreenGhostBrightLightTuningParams)init;
- (int)readPlist:(id)a3;
- (void)setDefaultTuningParams;
- (void)setTuningParams:(BrightLightTuning)a3;
@end

@implementation GreenGhostBrightLightTuningParams

- (void)setDefaultTuningParams
{
  long long v25 = *(_OWORD *)"fff?";
  *(_OWORD *)&v26[8] = xmmword_263480A20;
  *(void *)v26 = 0x3B03126F3CF5C28FLL;
  *(void *)&v26[56] = 0x3A03126F00000000;
  *(_OWORD *)&v26[40] = unk_2634809D8;
  *(_OWORD *)&v26[24] = xmmword_2634809C8;
  long long v21 = *(_OWORD *)&v26[16];
  long long v22 = *(_OWORD *)&v26[32];
  long long v19 = *(_OWORD *)"fff?";
  long long v20 = *(_OWORD *)v26;
  long long v23 = *(_OWORD *)&v26[48];
  long long v24 = xmmword_263480A40;
  long long v8 = xmmword_263480A30;
  long long v9 = *(_OWORD *)"fff?";
  long long v13 = *(_OWORD *)&v26[48];
  long long v12 = *(_OWORD *)&v26[32];
  long long v10 = *(_OWORD *)v26;
  long long v11 = *(_OWORD *)&v26[16];
  long long v16 = unk_263480A00;
  long long v14 = xmmword_263480A40;
  long long v15 = xmmword_2634809F0;
  v7[0] = 0x3C23D70A00000100;
  __asm { FMOV            V0.2S, #1.0 }
  v7[1] = _D0;
  int v17 = 990057071;
  int v18 = 0;
  [(GreenGhostBrightLightTuningParams *)self setTuningParams:v7];
}

- (GreenGhostBrightLightTuningParams)init
{
  v4.receiver = self;
  v4.super_class = (Class)GreenGhostBrightLightTuningParams;
  v2 = [(GreenGhostBrightLightTuningParams *)&v4 init];
  [(GreenGhostBrightLightTuningParams *)v2 setDefaultTuningParams];
  return v2;
}

- (int)readPlist:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"faceBoundaryPaddingRatio"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || [v5 count] != 2)
  {
    int v116 = -73364;
LABEL_55:
    FigDebugAssert3();
    goto LABEL_45;
  }
  v6 = [v5 objectAtIndexedSubscript:0];
  [v6 floatValue];
  LODWORD(self[1].super.isa) = v7;

  long long v8 = [v5 objectAtIndexedSubscript:1];
  [v8 floatValue];
  HIDWORD(self[1].super.isa) = v9;

  long long v10 = [v4 objectForKeyedSubscript:@"enabled"];

  if (!v10)
  {
    int v116 = -73364;
    goto LABEL_55;
  }
  long long v11 = [v4 objectForKeyedSubscript:@"enabled"];
  self->_tuningParams.enabled = [v11 BOOLValue];

  long long v12 = [v4 objectForKeyedSubscript:@"eitThreshold"];

  if (!v12)
  {
    int v116 = -73364;
    goto LABEL_55;
  }
  long long v13 = [v4 objectForKeyedSubscript:@"eitThreshold"];
  [v13 floatValue];
  self->_tuningParams.eitThreshold = v14;

  long long v15 = [v4 objectForKeyedSubscript:@"useClippingData"];

  if (!v15)
  {
    int v116 = -73364;
    goto LABEL_55;
  }
  long long v16 = [v4 objectForKeyedSubscript:@"useClippingData"];
  self->_tuningParams.useClippingData = [v16 BOOLValue];

  int v17 = [v4 objectForKeyedSubscript:@"clipping"];
  if (!v17)
  {
    int v116 = -73364;
    goto LABEL_55;
  }
  int v18 = v17;
  long long v19 = [v17 objectForKeyedSubscript:@"paddingRatio"];

  if (!v19)
  {
    int v116 = -73364;
LABEL_61:
    FigDebugAssert3();
LABEL_85:

    goto LABEL_45;
  }
  long long v20 = [v18 objectForKeyedSubscript:@"paddingRatio"];
  [v20 floatValue];
  *(_DWORD *)&self[1]._tuningParams.enabled = v21;

  long long v22 = [v18 objectForKeyedSubscript:@"minClippedPixelRatio"];

  if (!v22)
  {
    int v116 = -73364;
    goto LABEL_61;
  }
  long long v23 = [v18 objectForKeyedSubscript:@"minClippedPixelRatio"];
  [v23 floatValue];
  self[1]._tuningParams.eitThreshold = v24;

  long long v25 = [v18 objectForKeyedSubscript:@"clippedPixelRatio"];

  if (!v25)
  {
    int v116 = -73364;
    goto LABEL_61;
  }
  v26 = [v18 objectForKeyedSubscript:@"clippedPixelRatio"];
  [v26 floatValue];
  LODWORD(self[2].super.isa) = v27;

  v28 = [v18 objectForKeyedSubscript:@"maxClippedTilesCount"];

  if (!v28)
  {
    int v116 = -73364;
    goto LABEL_61;
  }
  v29 = [v18 objectForKeyedSubscript:@"maxClippedTilesCount"];
  [v29 floatValue];
  HIDWORD(self[2].super.isa) = v30;

  v31 = [v4 objectForKeyedSubscript:@"detection"];
  if (!v31)
  {
    int v116 = -73364;
    goto LABEL_61;
  }
  v32 = v31;
  v33 = [v31 objectForKeyedSubscript:@"brightness"];
  v34 = v33;
  if (!v33) {
    goto LABEL_70;
  }
  v35 = [v33 objectForKeyedSubscript:@"threshold"];

  if (!v35) {
    goto LABEL_70;
  }
  v36 = [v34 objectForKeyedSubscript:@"threshold"];
  [v36 floatValue];
  *(_DWORD *)&self[2]._tuningParams.enabled = v37;

  v38 = [v34 objectForKeyedSubscript:@"dilationNormalizedRadius"];

  if (!v38) {
    goto LABEL_70;
  }
  v39 = [v34 objectForKeyedSubscript:@"dilationNormalizedRadius"];
  [v39 floatValue];
  *(_DWORD *)&self[3]._tuningParams.enabled = v40;

  v41 = [v34 objectForKeyedSubscript:@"erosionNormalizedRadius"];

  if (!v41) {
    goto LABEL_70;
  }
  v42 = [v34 objectForKeyedSubscript:@"erosionNormalizedRadius"];
  [v42 floatValue];
  self[3]._tuningParams.eitThreshold = v43;

  v44 = [v34 objectForKeyedSubscript:@"normalizedOpticalCenter"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || [v44 count] != 2)
  {
    int v116 = -73364;
LABEL_50:
    FigDebugAssert3();

LABEL_83:
    goto LABEL_84;
  }
  v45 = [v44 objectAtIndexedSubscript:0];
  [v45 floatValue];
  LODWORD(self[3].super.isa) = v46;

  v47 = [v44 objectAtIndexedSubscript:1];
  [v47 floatValue];
  HIDWORD(self[3].super.isa) = v48;

  v49 = [v32 objectForKeyedSubscript:@"blob"];
  v34 = v49;
  if (!v49) {
    goto LABEL_70;
  }
  v50 = [v49 objectForKeyedSubscript:@"threshold"];

  if (!v50) {
    goto LABEL_70;
  }
  v51 = [v34 objectForKeyedSubscript:@"threshold"];
  [v51 floatValue];
  *(_DWORD *)&self[4]._tuningParams.enabled = v52;

  v44 = [v34 objectForKeyedSubscript:@"radius"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || [v44 count] != 2)
  {
    int v116 = -73364;
    goto LABEL_50;
  }
  v53 = [v44 objectAtIndexedSubscript:0];
  LODWORD(self[4].super.isa) = [v53 intValue];

  v54 = [v44 objectAtIndexedSubscript:1];
  HIDWORD(self[4].super.isa) = [v54 intValue];

  v55 = [v32 objectForKeyedSubscript:@"green"];
  v34 = v55;
  if (!v55)
  {
LABEL_70:
    FigDebugAssert3();
    goto LABEL_71;
  }
  v56 = [v55 objectForKeyedSubscript:@"hueThreshold"];
  [v56 floatValue];
  *(_DWORD *)&self[5]._tuningParams.enabled = v57;

  v58 = [v34 objectForKeyedSubscript:@"openingNormalizedRadius"];
  [v58 floatValue];
  LODWORD(self[7].super.isa) = v59;

  v60 = [v34 objectForKeyedSubscript:@"dilationNormalizedRadius"];
  [v60 floatValue];
  HIDWORD(self[7].super.isa) = v61;

  v62 = [v34 objectForKeyedSubscript:@"hueRange"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_69;
  }
  if ([v62 count] != 2) {
    goto LABEL_69;
  }
  v63 = [v62 objectAtIndexedSubscript:0];
  [v63 floatValue];
  LODWORD(self[5].super.isa) = v64;

  v65 = [v62 objectAtIndexedSubscript:1];
  [v65 floatValue];
  HIDWORD(self[5].super.isa) = v66;

  v62 = [v34 objectForKeyedSubscript:@"saturationThresholds"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || [v62 count] != 2)
  {
LABEL_69:
    FigDebugAssert3();

LABEL_71:
    int v116 = -73364;
    goto LABEL_83;
  }
  v67 = [v62 objectAtIndexedSubscript:0];
  [v67 floatValue];
  LODWORD(self[6].super.isa) = v68;

  v69 = [v62 objectAtIndexedSubscript:1];
  [v69 floatValue];
  HIDWORD(self[6].super.isa) = v70;

  v44 = [v34 objectForKeyedSubscript:@"valueThresholds"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || [v44 count] != 2)
  {
    int v116 = -73364;
    goto LABEL_50;
  }
  v71 = [v44 objectAtIndexedSubscript:0];
  [v71 floatValue];
  *(_DWORD *)&self[6]._tuningParams.enabled = v72;

  v73 = [v44 objectAtIndexedSubscript:1];
  [v73 floatValue];
  self[6]._tuningParams.eitThreshold = v74;

  v75 = [v32 objectForKeyedSubscript:@"refinement"];
  v34 = v75;
  if (!v75) {
    goto LABEL_70;
  }
  v76 = [v75 objectForKeyedSubscript:@"openingNormalizedRadius"];

  if (!v76) {
    goto LABEL_70;
  }
  v77 = [v34 objectForKeyedSubscript:@"openingNormalizedRadius"];
  [v77 floatValue];
  *(_DWORD *)&self[7]._tuningParams.enabled = v78;

  v79 = [v34 objectForKeyedSubscript:@"dilationNormalizedRadius"];

  if (!v79) {
    goto LABEL_70;
  }
  v80 = [v34 objectForKeyedSubscript:@"dilationNormalizedRadius"];
  [v80 floatValue];
  self[7]._tuningParams.eitThreshold = v81;

  v82 = [v34 objectForKeyedSubscript:@"threshold"];

  if (!v82) {
    goto LABEL_70;
  }
  v83 = [v34 objectForKeyedSubscript:@"threshold"];
  [v83 floatValue];
  LODWORD(self[8].super.isa) = v84;

  v85 = [v34 objectForKeyedSubscript:@"maskSurroundThreshold"];

  if (!v85) {
    goto LABEL_70;
  }
  v86 = [v34 objectForKeyedSubscript:@"maskSurroundThreshold"];
  [v86 floatValue];
  HIDWORD(self[8].super.isa) = v87;

  v88 = [v4 objectForKeyedSubscript:@"repair"];
  if (!v88)
  {
    int v116 = -73364;
    FigDebugAssert3();
LABEL_84:

    goto LABEL_85;
  }
  v34 = v88;
  v89 = [v88 objectForKeyedSubscript:@"surroundMaskDilationNormalizedRadius"];

  if (!v89)
  {
    int v116 = -73364;
LABEL_82:
    FigDebugAssert3();
    goto LABEL_83;
  }
  v90 = [v34 objectForKeyedSubscript:@"surroundMaskDilationNormalizedRadius"];
  [v90 floatValue];
  *(_DWORD *)&self[8]._tuningParams.enabled = v91;

  v92 = [v34 objectForKeyedSubscript:@"narrowSurroundMaskDilationNormalizedRadius"];

  if (!v92)
  {
    int v116 = -73364;
    goto LABEL_82;
  }
  v93 = [v34 objectForKeyedSubscript:@"narrowSurroundMaskDilationNormalizedRadius"];
  [v93 floatValue];
  self[8]._tuningParams.eitThreshold = v94;

  v95 = [v34 objectForKeyedSubscript:@"inpaintingDisplacement"];

  if (!v95)
  {
    int v116 = -73364;
    goto LABEL_82;
  }
  v96 = [v34 objectForKeyedSubscript:@"inpaintingDisplacement"];
  [v96 floatValue];
  LODWORD(self[9].super.isa) = v97;

  v98 = [v34 objectForKeyedSubscript:@"inpaintingConfidenceThreshold"];

  if (!v98)
  {
    int v116 = -73364;
    goto LABEL_82;
  }
  v99 = [v34 objectForKeyedSubscript:@"inpaintingConfidenceThreshold"];
  [v99 floatValue];
  HIDWORD(self[9].super.isa) = v100;

  v101 = [v34 objectForKeyedSubscript:@"inpaintingStrength"];

  if (!v101)
  {
    int v116 = -73364;
    goto LABEL_82;
  }
  v102 = [v34 objectForKeyedSubscript:@"inpaintingStrength"];
  [v102 floatValue];
  *(_DWORD *)&self[9]._tuningParams.enabled = v103;

  v104 = [v34 objectForKeyedSubscript:@"sharpening"];

  if (!v104)
  {
    int v116 = -73364;
    goto LABEL_82;
  }
  v105 = [v34 objectForKeyedSubscript:@"sharpening"];
  [v105 floatValue];
  self[9]._tuningParams.eitThreshold = v106;

  v107 = [v34 objectForKeyedSubscript:@"brightnessOffset"];

  if (!v107)
  {
    int v116 = -73364;
    goto LABEL_82;
  }
  v108 = [v34 objectForKeyedSubscript:@"brightnessOffset"];
  [v108 floatValue];
  LODWORD(self[10].super.isa) = v109;

  v110 = [v34 objectForKeyedSubscript:@"lumaSimilarityBoost"];

  if (!v110)
  {
    int v116 = -73364;
    goto LABEL_82;
  }
  v111 = [v34 objectForKeyedSubscript:@"lumaSimilarityBoost"];
  [v111 floatValue];
  HIDWORD(self[10].super.isa) = v112;

  v113 = [v34 objectForKeyedSubscript:@"normalizedMaxMaskSize"];

  if (!v113)
  {
    int v116 = -73364;
    goto LABEL_82;
  }
  v114 = [v34 objectForKeyedSubscript:@"normalizedMaxMaskSize"];
  [v114 floatValue];
  *(_DWORD *)&self[10]._tuningParams.enabled = v115;

  int v116 = 0;
LABEL_45:

  return v116;
}

- (BrightLightTuning)tuningParams
{
  long long v3 = *(_OWORD *)&self[7]._tuningParams.enabled;
  long long v4 = *(_OWORD *)&self[9]._tuningParams.enabled;
  *(GreenGhostBrightLightTuningParams *)(v2 + 128) = *(GreenGhostBrightLightTuningParams *)((char *)self + 136);
  *(_OWORD *)(v2 + 144) = v4;
  *(BrightLightTuning *)(v2 + 160) = self[10]._tuningParams;
  long long v5 = *(_OWORD *)&self[3]._tuningParams.enabled;
  long long v6 = *(_OWORD *)&self[5]._tuningParams.enabled;
  *(GreenGhostBrightLightTuningParams *)(v2 + 64) = *(GreenGhostBrightLightTuningParams *)((char *)self + 72);
  *(_OWORD *)(v2 + 80) = v6;
  *(GreenGhostBrightLightTuningParams *)(v2 + 96) = *(GreenGhostBrightLightTuningParams *)((char *)self + 104);
  *(_OWORD *)(v2 + 112) = v3;
  long long v7 = *(_OWORD *)&self[1]._tuningParams.enabled;
  *(GreenGhostBrightLightTuningParams *)uint64_t v2 = *(GreenGhostBrightLightTuningParams *)&self->_tuningParams.enabled;
  *(_OWORD *)(v2 + 16) = v7;
  *(GreenGhostBrightLightTuningParams *)(v2 + 32) = *(GreenGhostBrightLightTuningParams *)((char *)self + 40);
  *(_OWORD *)(v2 + 48) = v5;
  return (BrightLightTuning)self;
}

- (void)setTuningParams:(BrightLightTuning)a3
{
  long long v3 = *(_OWORD *)*(void *)&a3;
  long long v4 = *(_OWORD *)(*(void *)&a3 + 16);
  *(GreenGhostBrightLightTuningParams *)((char *)self + 40) = *(GreenGhostBrightLightTuningParams *)(*(void *)&a3 + 32);
  *(_OWORD *)&self[1]._tuningParams.enabled = v4;
  *(_OWORD *)&self->_tuningParams.enabled = v3;
  long long v5 = *(_OWORD *)(*(void *)&a3 + 48);
  long long v6 = *(_OWORD *)(*(void *)&a3 + 64);
  long long v7 = *(_OWORD *)(*(void *)&a3 + 80);
  *(GreenGhostBrightLightTuningParams *)((char *)self + 104) = *(GreenGhostBrightLightTuningParams *)(*(void *)&a3 + 96);
  *(_OWORD *)&self[5]._tuningParams.enabled = v7;
  *(_OWORD *)&self[4]._tuningParams.enabled = v6;
  *(_OWORD *)&self[3]._tuningParams.enabled = v5;
  long long v8 = *(_OWORD *)(*(void *)&a3 + 112);
  long long v9 = *(_OWORD *)(*(void *)&a3 + 128);
  long long v10 = *(_OWORD *)(*(void *)&a3 + 144);
  self[10]._tuningParams = *(BrightLightTuning *)(*(void *)&a3 + 160);
  *(_OWORD *)&self[9]._tuningParams.enabled = v10;
  *(_OWORD *)&self[8]._tuningParams.enabled = v9;
  *(_OWORD *)&self[7]._tuningParams.enabled = v8;
}

@end