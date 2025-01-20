@interface PUTransitionSectionInfo
- (NSArray)visualRowStartMarkers;
- (NSIndexPath)anchorRealPath;
- (NSIndexSet)visualSections;
- (PUGridCoordinates)anchorShiftOffset;
- (PUTransitionSectionInfo)init;
- (id)description;
- (int64_t)contiguousRows;
- (int64_t)transitionSection;
- (void)setAnchorRealPath:(id)a3;
- (void)setAnchorShiftOffset:(PUGridCoordinates)a3;
- (void)setContiguousRows:(int64_t)a3;
- (void)setTransitionSection:(int64_t)a3;
- (void)setVisualRowStartMarkers:(id)a3;
- (void)setVisualSections:(id)a3;
@end

@implementation PUTransitionSectionInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchorRealPath, 0);
  objc_storeStrong((id *)&self->_visualRowStartMarkers, 0);
  objc_storeStrong((id *)&self->_visualSections, 0);
}

- (void)setAnchorShiftOffset:(PUGridCoordinates)a3
{
  self->_anchorShiftOffset = a3;
}

- (PUGridCoordinates)anchorShiftOffset
{
  int64_t column = self->_anchorShiftOffset.column;
  int64_t row = self->_anchorShiftOffset.row;
  result.int64_t column = column;
  result.int64_t row = row;
  return result;
}

- (void)setAnchorRealPath:(id)a3
{
}

- (NSIndexPath)anchorRealPath
{
  return self->_anchorRealPath;
}

- (void)setContiguousRows:(int64_t)a3
{
  self->_contiguousRows = a3;
}

- (int64_t)contiguousRows
{
  return self->_contiguousRows;
}

- (void)setVisualRowStartMarkers:(id)a3
{
}

- (NSArray)visualRowStartMarkers
{
  return self->_visualRowStartMarkers;
}

- (void)setVisualSections:(id)a3
{
}

- (NSIndexSet)visualSections
{
  return self->_visualSections;
}

- (void)setTransitionSection:(int64_t)a3
{
  self->_transitionSection = a3;
}

- (int64_t)transitionSection
{
  return self->_transitionSection;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)PUTransitionSectionInfo;
  v4 = [(PUTransitionSectionInfo *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ \n  transitionSection: %ld\n  visualSections: %@\n  contiguousRows: %ld\n  anchorRealPath: %@\n  anchorShiftOffset: %ld,%ld\n  rowStartMarkers: %@", v4, self->_transitionSection, self->_visualSections, self->_contiguousRows, self->_anchorRealPath, self->_anchorShiftOffset.row, self->_anchorShiftOffset.column, self->_visualRowStartMarkers];

  return v5;
}

- (PUTransitionSectionInfo)init
{
  v3.receiver = self;
  v3.super_class = (Class)PUTransitionSectionInfo;
  PUGridCoordinates result = [(PUTransitionSectionInfo *)&v3 init];
  if (result) {
    result->_anchorShiftOffset = (PUGridCoordinates)vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  }
  return result;
}

@end