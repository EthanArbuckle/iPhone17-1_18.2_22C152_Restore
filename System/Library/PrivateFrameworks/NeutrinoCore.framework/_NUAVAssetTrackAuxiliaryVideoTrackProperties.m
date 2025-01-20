@interface _NUAVAssetTrackAuxiliaryVideoTrackProperties
- ($0AC6E346AE4835514AAA8AC86D8F4844)size;
- (_NUAVAssetTrackAuxiliaryVideoTrackProperties)init;
- (int)trackID;
- (void)setSize:(id)a3;
- (void)setTrackID:(int)a3;
@end

@implementation _NUAVAssetTrackAuxiliaryVideoTrackProperties

- (void)setSize:(id)a3
{
  self->_size = ($5BB7312FFE32F1AB3F1F5957C99A58B3)a3;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)size
{
  int64_t height = self->_size.height;
  int64_t width = self->_size.width;
  result.var1 = height;
  result.var0 = width;
  return result;
}

- (void)setTrackID:(int)a3
{
  self->_trackID = a3;
}

- (int)trackID
{
  return self->_trackID;
}

- (_NUAVAssetTrackAuxiliaryVideoTrackProperties)init
{
  v3.receiver = self;
  v3.super_class = (Class)_NUAVAssetTrackAuxiliaryVideoTrackProperties;
  return [(_NUAVAssetTrackAuxiliaryVideoTrackProperties *)&v3 init];
}

@end