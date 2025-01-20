@interface MSTMv3BandData
- (int)readPlist:(id)a3;
@end

@implementation MSTMv3BandData

- (int)readPlist:(id)a3
{
  id v4 = a3;
  v5 = [GainValueArray alloc];
  v6 = [v4 objectForKeyedSubscript:@"MaskedDetailMix"];

  v7 = [(GainValueArray *)v5 initWithArray:v6];
  maskedDetailMix = self->maskedDetailMix;
  self->maskedDetailMix = v7;

  if (self->maskedDetailMix) {
    return 0;
  }
  FigDebugAssert3();

  return FigSignalErrorAt();
}

- (void).cxx_destruct
{
}

@end