@interface PTAssetReaderCompositionInstruction
- ($69C59A32909E13F94AB58097350E6BB9)timeRange;
- (BOOL)containsTweening;
- (BOOL)enablePostProcessing;
- (NSArray)requiredSourceTrackIDs;
- (PTAssetReader)assetReader;
- (int)auxvTrackID;
- (int)passthroughTrackID;
- (int)videTrackID;
- (void)setAssetReader:(id)a3;
- (void)setAuxvTrackID:(int)a3;
- (void)setTimeRange:(id *)a3;
- (void)setVideTrackID:(int)a3;
@end

@implementation PTAssetReaderCompositionInstruction

- (BOOL)enablePostProcessing
{
  return 0;
}

- (BOOL)containsTweening
{
  return 1;
}

- (int)passthroughTrackID
{
  return 0;
}

- (NSArray)requiredSourceTrackIDs
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(NSNumber, "numberWithInt:", -[PTAssetReaderCompositionInstruction videTrackID](self, "videTrackID"));
  v7[0] = v3;
  v4 = objc_msgSend(NSNumber, "numberWithInt:", -[PTAssetReaderCompositionInstruction auxvTrackID](self, "auxvTrackID"));
  v7[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];

  return (NSArray *)v5;
}

- ($69C59A32909E13F94AB58097350E6BB9)timeRange
{
  long long v3 = *(_OWORD *)&self->var1.var3;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var1.var0;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var0.var1;
  return self;
}

- (void)setTimeRange:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0.var0;
  long long v4 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_timeRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_timeRange.start.epoch = v4;
  *(_OWORD *)&self->_timeRange.start.value = v3;
}

- (int)videTrackID
{
  return self->_videTrackID;
}

- (void)setVideTrackID:(int)a3
{
  self->_videTrackID = a3;
}

- (int)auxvTrackID
{
  return self->_auxvTrackID;
}

- (void)setAuxvTrackID:(int)a3
{
  self->_auxvTrackID = a3;
}

- (PTAssetReader)assetReader
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_assetReader);

  return (PTAssetReader *)WeakRetained;
}

- (void)setAssetReader:(id)a3
{
}

- (void).cxx_destruct
{
}

@end