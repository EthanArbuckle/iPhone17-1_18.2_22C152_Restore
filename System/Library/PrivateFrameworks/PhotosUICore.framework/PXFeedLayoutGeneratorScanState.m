@interface PXFeedLayoutGeneratorScanState
- (BOOL)scannedBatchHasCaption;
- (id)scannedBatchID;
- (int64_t)scanLocation;
- (int64_t)scanSpecialSequenceCount;
- (void)setScanLocation:(int64_t)a3;
- (void)setScanSpecialSequenceCount:(int64_t)a3;
- (void)setScannedBatchHasCaption:(BOOL)a3;
- (void)setScannedBatchID:(id)a3;
@end

@implementation PXFeedLayoutGeneratorScanState

- (void).cxx_destruct
{
}

- (void)setScanSpecialSequenceCount:(int64_t)a3
{
  self->_scanSpecialSequenceCount = a3;
}

- (int64_t)scanSpecialSequenceCount
{
  return self->_scanSpecialSequenceCount;
}

- (void)setScannedBatchHasCaption:(BOOL)a3
{
  self->_scannedBatchHasCaption = a3;
}

- (BOOL)scannedBatchHasCaption
{
  return self->_scannedBatchHasCaption;
}

- (void)setScannedBatchID:(id)a3
{
}

- (id)scannedBatchID
{
  return self->_scannedBatchID;
}

- (void)setScanLocation:(int64_t)a3
{
  self->_scanLocation = a3;
}

- (int64_t)scanLocation
{
  return self->_scanLocation;
}

@end