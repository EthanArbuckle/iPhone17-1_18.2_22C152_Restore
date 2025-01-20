@interface DeepFusionFusionBandData
- (int)readPlist:(id)a3;
@end

@implementation DeepFusionFusionBandData

- (int)readPlist:(id)a3
{
  id v4 = a3;
  v5 = [GainValueArray alloc];
  v6 = [v4 objectForKeyedSubscript:@"ChromaGlobal"];
  v7 = [(GainValueArray *)v5 initWithArray:v6];
  chromaGlobal = self->chromaGlobal;
  self->chromaGlobal = v7;

  if (![(GainValueArray *)self->chromaGlobal isValid])
  {
    int v29 = -73424;
LABEL_15:
    FigDebugAssert3();
    goto LABEL_8;
  }
  v9 = [GainValueArray alloc];
  v10 = [v4 objectForKeyedSubscript:@"LSCAmp"];
  v11 = [(GainValueArray *)v9 initWithArray:v10];
  lscAmp = self->lscAmp;
  self->lscAmp = v11;

  if (![(GainValueArray *)self->lscAmp isValid])
  {
    int v29 = -73424;
    goto LABEL_15;
  }
  v13 = [GainValueArray alloc];
  v14 = [v4 objectForKeyedSubscript:@"LSCOffset"];
  v15 = [(GainValueArray *)v13 initWithArray:v14];
  lscOffset = self->lscOffset;
  self->lscOffset = v15;

  if (![(GainValueArray *)self->lscOffset isValid])
  {
    int v29 = -73424;
    goto LABEL_15;
  }
  v17 = [GainValueArray alloc];
  v18 = [v4 objectForKeyedSubscript:@"LumaMid"];
  v19 = [(GainValueArray *)v17 initWithArray:v18];
  lumaMid = self->lumaMid;
  self->lumaMid = v19;

  if (![(GainValueArray *)self->lumaMid isValid])
  {
    int v29 = -73424;
    goto LABEL_15;
  }
  v21 = [GainValueArray alloc];
  v22 = [v4 objectForKeyedSubscript:@"LumaSlope"];
  v23 = [(GainValueArray *)v21 initWithArray:v22];
  lumaSlope = self->lumaSlope;
  self->lumaSlope = v23;

  if (![(GainValueArray *)self->lumaSlope isValid])
  {
    int v29 = -73424;
    goto LABEL_15;
  }
  v25 = [GainValueArray alloc];
  v26 = [v4 objectForKeyedSubscript:@"HighlightFusionAlpha"];
  v27 = [(GainValueArray *)v25 initWithArray:v26];
  highlightFusionAlpha = self->highlightFusionAlpha;
  self->highlightFusionAlpha = v27;

  if (![(GainValueArray *)self->highlightFusionAlpha isValid])
  {
    int v29 = -73424;
    goto LABEL_15;
  }
  int v29 = 0;
LABEL_8:

  return v29;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->highlightFusionAlpha, 0);
  objc_storeStrong((id *)&self->lumaSlope, 0);
  objc_storeStrong((id *)&self->lumaMid, 0);
  objc_storeStrong((id *)&self->lscOffset, 0);
  objc_storeStrong((id *)&self->lscAmp, 0);

  objc_storeStrong((id *)&self->chromaGlobal, 0);
}

@end