@interface ToneMapSmoothingBandData
- (int)readPlist:(id)a3;
@end

@implementation ToneMapSmoothingBandData

- (int)readPlist:(id)a3
{
  id v4 = a3;
  v5 = [GainValueArray alloc];
  v6 = [v4 objectForKeyedSubscript:@"MaskedDetailMix"];
  v7 = [(GainValueArray *)v5 initWithArray:v6];
  maskedDetailMix = self->maskedDetailMix;
  self->maskedDetailMix = v7;

  if (!self->maskedDetailMix) {
    goto LABEL_10;
  }
  v9 = [GainValueArray alloc];
  v10 = [v4 objectForKeyedSubscript:@"UnmaskedDetailMix"];
  v11 = [(GainValueArray *)v9 initWithArray:v10];
  unmaskedDetailMix = self->unmaskedDetailMix;
  self->unmaskedDetailMix = v11;

  if (!self->unmaskedDetailMix) {
    goto LABEL_10;
  }
  v13 = [v4 objectForKeyedSubscript:@"SkyMaskedDetailMix"];

  if (v13)
  {
    v14 = [GainValueArray alloc];
    v15 = [v4 objectForKeyedSubscript:@"SkyMaskedDetailMix"];
    v16 = [(GainValueArray *)v14 initWithArray:v15];
    skyMaskedDetailMix = self->skyMaskedDetailMix;
    self->skyMaskedDetailMix = v16;
  }
  v18 = [v4 objectForKeyedSubscript:@"Feature1MaskedDetailMix"];

  if (v18)
  {
    v19 = [GainValueArray alloc];
    v20 = [v4 objectForKeyedSubscript:@"Feature1MaskedDetailMix"];
    v21 = [(GainValueArray *)v19 initWithArray:v20];
    v22 = self->skyMaskedDetailMix;
    self->skyMaskedDetailMix = v21;
  }
  if (self->skyMaskedDetailMix)
  {
    int v23 = 0;
  }
  else
  {
LABEL_10:
    FigDebugAssert3();
    int v23 = FigSignalErrorAt();
  }

  return v23;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->skyMaskedDetailMix, 0);
  objc_storeStrong((id *)&self->unmaskedDetailMix, 0);

  objc_storeStrong((id *)&self->maskedDetailMix, 0);
}

@end