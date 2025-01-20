@interface _NUVideoRenderResult
- (AVAsset)video;
- (AVAudioMix)audioMix;
- (AVVideoComposition)videoComposition;
- (NSString)description;
- (NUImageGeometry)geometry;
- (void)setAudioMix:(id)a3;
- (void)setGeometry:(id)a3;
- (void)setVideo:(id)a3;
- (void)setVideoComposition:(id)a3;
@end

@implementation _NUVideoRenderResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geometry, 0);
  objc_storeStrong((id *)&self->_audioMix, 0);
  objc_storeStrong((id *)&self->_videoComposition, 0);

  objc_storeStrong((id *)&self->_video, 0);
}

- (void)setGeometry:(id)a3
{
}

- (NUImageGeometry)geometry
{
  return (NUImageGeometry *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAudioMix:(id)a3
{
}

- (AVAudioMix)audioMix
{
  return (AVAudioMix *)objc_getProperty(self, a2, 32, 1);
}

- (void)setVideoComposition:(id)a3
{
}

- (AVVideoComposition)videoComposition
{
  return (AVVideoComposition *)objc_getProperty(self, a2, 24, 1);
}

- (void)setVideo:(id)a3
{
}

- (AVAsset)video
{
  return (AVAsset *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(_NUVideoRenderResult *)self video];
  v6 = [(_NUVideoRenderResult *)self videoComposition];
  v7 = [v3 stringWithFormat:@"<%@:%p video=%@ composition=%@>", v4, self, v5, v6];

  return (NSString *)v7;
}

@end