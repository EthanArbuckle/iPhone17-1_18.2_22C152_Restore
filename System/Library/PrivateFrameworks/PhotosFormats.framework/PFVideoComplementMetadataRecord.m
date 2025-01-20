@interface PFVideoComplementMetadataRecord
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)imageDisplayTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)videoDuration;
- (BOOL)hasValidImageDisplayTime;
- (BOOL)hasValidPairingIdentifier;
- (BOOL)hasValidVideoDuration;
- (NSString)pairingIdentifier;
- (void)setImageDisplayTime:(id *)a3;
- (void)setPairingIdentifier:(id)a3;
- (void)setVideoDuration:(id *)a3;
@end

@implementation PFVideoComplementMetadataRecord

- (void).cxx_destruct
{
}

- (void)setImageDisplayTime:(id *)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)imageDisplayTime
{
  objc_copyStruct(retstr, &self->_imageDisplayTime, 24, 1, 0);
  return result;
}

- (void)setVideoDuration:(id *)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)videoDuration
{
  objc_copyStruct(retstr, &self->_videoDuration, 24, 1, 0);
  return result;
}

- (void)setPairingIdentifier:(id)a3
{
}

- (NSString)pairingIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)hasValidImageDisplayTime
{
  return (self->_imageDisplayTime.flags & 0x1D) == 1;
}

- (BOOL)hasValidVideoDuration
{
  return (self->_videoDuration.flags & 0x1D) == 1;
}

- (BOOL)hasValidPairingIdentifier
{
  return self->_pairingIdentifier != 0;
}

@end