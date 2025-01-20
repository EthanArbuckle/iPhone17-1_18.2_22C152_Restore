@interface _PXDetailsPlaybackRecord
- (PXTileIdentifier)tileIdentifier;
- (int64_t)desiredPlayState;
- (void)setDesiredPlayState:(int64_t)a3;
- (void)setTileIdentifier:(PXTileIdentifier *)a3;
@end

@implementation _PXDetailsPlaybackRecord

- (void)setTileIdentifier:(PXTileIdentifier *)a3
{
  long long v3 = *(_OWORD *)&a3->index[1];
  *(_OWORD *)&self->_tileIdentifier.length = *(_OWORD *)&a3->length;
  *(_OWORD *)&self->_tileIdentifier.index[1] = v3;
  long long v5 = *(_OWORD *)&a3->index[5];
  long long v4 = *(_OWORD *)&a3->index[7];
  long long v6 = *(_OWORD *)&a3->index[3];
  self->_tileIdentifier.index[9] = a3->index[9];
  *(_OWORD *)&self->_tileIdentifier.index[5] = v5;
  *(_OWORD *)&self->_tileIdentifier.index[7] = v4;
  *(_OWORD *)&self->_tileIdentifier.index[3] = v6;
}

- (PXTileIdentifier)tileIdentifier
{
  long long v3 = *(_OWORD *)&self[2].index[1];
  *(_OWORD *)&retstr->index[3] = *(_OWORD *)&self[2].length;
  *(_OWORD *)&retstr->index[5] = v3;
  *(_OWORD *)&retstr->index[7] = *(_OWORD *)&self[2].index[3];
  retstr->index[9] = self[2].index[5];
  long long v4 = *(_OWORD *)&self[1].index[8];
  *(_OWORD *)&retstr->length = *(_OWORD *)&self[1].index[6];
  *(_OWORD *)&retstr->index[1] = v4;
  return self;
}

- (int64_t)desiredPlayState
{
  v2 = [(PXGridInlinePlaybackRecord *)self geometryReference];
  uint64_t v3 = [v2 desiredPlayState];

  return v3 == 1;
}

- (void)setDesiredPlayState:(int64_t)a3
{
  if (a3 == 1)
  {
    [(PXGridInlinePlaybackRecord *)self bestVideoTimeRange];
    long long v4 = [(PXGridInlinePlaybackRecord *)self geometryReference];
    v7[0] = v7[3];
    v7[1] = v7[4];
    v7[2] = v7[5];
    [v4 setBestPlaybackTimeRange:v7];

    long long v5 = [(PXGridInlinePlaybackRecord *)self geometryReference];
    [v5 setDesiredPlayState:1];
  }
  else if (!a3)
  {
    id v6 = [(PXGridInlinePlaybackRecord *)self geometryReference];
    [v6 setDesiredPlayState:0];
  }
}

@end