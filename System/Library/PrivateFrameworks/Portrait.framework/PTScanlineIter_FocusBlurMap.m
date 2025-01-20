@interface PTScanlineIter_FocusBlurMap
- (PTScanlineIter_FocusBlurMap)initWithMask:(id)a3;
- (PTScanlineMask_FocusBlurMap)mask;
- (_NSRange)nextRangeX;
- (_NSRange)nextRangeY;
- (unint64_t)currentTile;
- (unint64_t)currentTileRow;
- (void)_advanceToNextTile;
- (void)_advanceToNextTileRow;
- (void)reset;
- (void)resetX;
- (void)setCurrentTile:(unint64_t)a3;
- (void)setCurrentTileRow:(unint64_t)a3;
@end

@implementation PTScanlineIter_FocusBlurMap

- (PTScanlineIter_FocusBlurMap)initWithMask:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PTScanlineIter_FocusBlurMap;
  v6 = [(PTScanlineIter_FocusBlurMap *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mask, a3);
    [(PTScanlineIter_FocusBlurMap *)v7 reset];
  }

  return v7;
}

- (_NSRange)nextRangeY
{
  if (self->_currentTileRow == 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v2 = 0;
    NSUInteger v3 = 0;
  }
  else
  {
    id v5 = [(PTScanlineMask_FocusBlurMap *)self->_mask map];
    uint64_t v6 = [v5 tileYForTile:self->_currentTile];

    uint64_t v7 = -[PTScanlineMask_FocusBlurMap pixelRangeForTileRangeY:](self->_mask, "pixelRangeForTileRangeY:", v6, 1);
    NSUInteger v9 = v8;
    [(PTScanlineIter_FocusBlurMap *)self _advanceToNextTileRow];
    NSUInteger v2 = v7;
    NSUInteger v3 = v9;
  }
  result.length = v3;
  result.location = v2;
  return result;
}

- (_NSRange)nextRangeX
{
  if (self->_currentTile == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_4;
  }
  NSUInteger v3 = [(PTScanlineMask_FocusBlurMap *)self->_mask map];
  uint64_t v4 = [v3 tileYForTile:self->_currentTile];
  id v5 = [(PTScanlineMask_FocusBlurMap *)self->_mask map];
  uint64_t v6 = [v5 tileYForTile:self->_currentTileRow];

  if (v4 != v6)
  {
LABEL_4:
    NSUInteger v12 = 0;
    NSUInteger v13 = 0;
  }
  else
  {
    uint64_t v7 = [(PTScanlineMask_FocusBlurMap *)self->_mask map];
    uint64_t v8 = [v7 tileXForTile:self->_currentTile];

    uint64_t v9 = -[PTScanlineMask_FocusBlurMap pixelRangeForTileRangeX:](self->_mask, "pixelRangeForTileRangeX:", v8, 1);
    NSUInteger v11 = v10;
    [(PTScanlineIter_FocusBlurMap *)self _advanceToNextTile];
    NSUInteger v12 = v9;
    NSUInteger v13 = v11;
  }
  result.length = v13;
  result.location = v12;
  return result;
}

- (void)resetX
{
  unint64_t currentTileRow = self->_currentTileRow;
  if (currentTileRow == 0x7FFFFFFFFFFFFFFFLL)
  {
    [(PTScanlineIter_FocusBlurMap *)self reset];
    unint64_t currentTileRow = self->_currentTileRow;
  }
  self->_currentTile = currentTileRow;
}

- (void)reset
{
  NSUInteger v3 = [(PTScanlineMask_FocusBlurMap *)self->_mask region];
  self->_unint64_t currentTileRow = [v3 firstIndex];

  self->_currentTile = self->_currentTileRow;
}

- (void)_advanceToNextTileRow
{
  if (self->_currentTileRow == 0x7FFFFFFFFFFFFFFFLL)
  {
    [(PTScanlineIter_FocusBlurMap *)self reset];
  }
  else
  {
    NSUInteger v3 = [(PTScanlineMask_FocusBlurMap *)self->_mask map];
    uint64_t v4 = [v3 tileYForTile:self->_currentTileRow];

    do
    {
      id v5 = [(PTScanlineMask_FocusBlurMap *)self->_mask region];
      self->_unint64_t currentTileRow = [v5 indexGreaterThanIndex:self->_currentTileRow];

      if (self->_currentTileRow == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      uint64_t v6 = [(PTScanlineMask_FocusBlurMap *)self->_mask map];
      uint64_t v7 = [v6 tileYForTile:self->_currentTileRow];
    }
    while (v7 == v4);
  }
}

- (void)_advanceToNextTile
{
  if (self->_currentTile == 0x7FFFFFFFFFFFFFFFLL)
  {
    [(PTScanlineIter_FocusBlurMap *)self resetX];
  }
  else
  {
    NSUInteger v3 = [(PTScanlineMask_FocusBlurMap *)self->_mask map];
    uint64_t v4 = [v3 tileYForTile:self->_currentTile];
    id v5 = [(PTScanlineMask_FocusBlurMap *)self->_mask map];
    uint64_t v6 = [v5 tileYForTile:self->_currentTileRow];

    if (v4 == v6)
    {
      id v7 = [(PTScanlineMask_FocusBlurMap *)self->_mask region];
      self->_currentTile = [v7 indexGreaterThanIndex:self->_currentTile];
    }
  }
}

- (PTScanlineMask_FocusBlurMap)mask
{
  return (PTScanlineMask_FocusBlurMap *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)currentTileRow
{
  return self->_currentTileRow;
}

- (void)setCurrentTileRow:(unint64_t)a3
{
  self->_unint64_t currentTileRow = a3;
}

- (unint64_t)currentTile
{
  return self->_currentTile;
}

- (void)setCurrentTile:(unint64_t)a3
{
  self->_currentTile = a3;
}

- (void).cxx_destruct
{
}

@end