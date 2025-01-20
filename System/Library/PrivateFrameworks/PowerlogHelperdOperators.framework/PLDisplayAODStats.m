@interface PLDisplayAODStats
- (NSNumber)ambientCount;
- (NSNumber)aplCount;
- (NSNumber)aplSum;
- (NSNumber)awakeCount;
- (NSNumber)flipbookCount;
- (NSNumber)flipbookDelay;
- (NSNumber)llmCount;
- (NSNumber)mediaCount;
- (NSNumber)mediaScanout;
- (NSNumber)pdcRepeatCoun;
- (NSNumber)prcRepeatCoun;
- (void)setAmbientCount:(id)a3;
- (void)setAplCount:(id)a3;
- (void)setAplSum:(id)a3;
- (void)setAwakeCount:(id)a3;
- (void)setFlipbookCount:(id)a3;
- (void)setFlipbookDelay:(id)a3;
- (void)setLlmCount:(id)a3;
- (void)setMediaCount:(id)a3;
- (void)setMediaScanout:(id)a3;
- (void)setPdcRepeatCoun:(id)a3;
- (void)setPrcRepeatCoun:(id)a3;
@end

@implementation PLDisplayAODStats

- (NSNumber)awakeCount
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAwakeCount:(id)a3
{
}

- (NSNumber)mediaCount
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMediaCount:(id)a3
{
}

- (NSNumber)flipbookCount
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFlipbookCount:(id)a3
{
}

- (NSNumber)flipbookDelay
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFlipbookDelay:(id)a3
{
}

- (NSNumber)mediaScanout
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMediaScanout:(id)a3
{
}

- (NSNumber)ambientCount
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAmbientCount:(id)a3
{
}

- (NSNumber)prcRepeatCoun
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPrcRepeatCoun:(id)a3
{
}

- (NSNumber)pdcRepeatCoun
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPdcRepeatCoun:(id)a3
{
}

- (NSNumber)llmCount
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (void)setLlmCount:(id)a3
{
}

- (NSNumber)aplSum
{
  return (NSNumber *)objc_getProperty(self, a2, 80, 1);
}

- (void)setAplSum:(id)a3
{
}

- (NSNumber)aplCount
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (void)setAplCount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aplCount, 0);
  objc_storeStrong((id *)&self->_aplSum, 0);
  objc_storeStrong((id *)&self->_llmCount, 0);
  objc_storeStrong((id *)&self->_pdcRepeatCoun, 0);
  objc_storeStrong((id *)&self->_prcRepeatCoun, 0);
  objc_storeStrong((id *)&self->_ambientCount, 0);
  objc_storeStrong((id *)&self->_mediaScanout, 0);
  objc_storeStrong((id *)&self->_flipbookDelay, 0);
  objc_storeStrong((id *)&self->_flipbookCount, 0);
  objc_storeStrong((id *)&self->_mediaCount, 0);
  objc_storeStrong((id *)&self->_awakeCount, 0);
}

@end