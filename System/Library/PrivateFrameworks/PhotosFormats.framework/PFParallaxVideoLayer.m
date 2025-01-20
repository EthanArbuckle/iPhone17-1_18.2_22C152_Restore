@interface PFParallaxVideoLayer
- (AVAsset)video;
- (BOOL)saveToURL:(id)a3 error:(id *)a4;
- (CGSize)pixelSize;
- (NSData)videoData;
- (PFParallaxVideoLayer)initWithVideoData:(id)a3 frame:(CGRect)a4 zPosition:(double)a5 identifier:(id)a6;
- (id)fileExtension;
- (id)layerByUpdatingFrame:(CGRect)a3;
@end

@implementation PFParallaxVideoLayer

- (id)fileExtension
{
  return @"MOV";
}

- (BOOL)saveToURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(PFParallaxVideoLayer *)self videoData];
  LOBYTE(a4) = [v7 writeToURL:v6 options:1 error:a4];

  return (char)a4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoData, 0);

  objc_storeStrong((id *)&self->_video, 0);
}

- (NSData)videoData
{
  return self->_videoData;
}

- (AVAsset)video
{
  return self->_video;
}

- (CGSize)pixelSize
{
  v2 = +[PFMediaUtilities tracksWithMediaType:*MEMORY[0x1E4F15C18] forAsset:self->_video];
  v3 = [v2 firstObject];
  [v3 naturalSize];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (id)layerByUpdatingFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = [PFParallaxVideoLayer alloc];
  double v9 = [(PFParallaxVideoLayer *)self videoData];
  [(PFParallaxLayer *)self zPosition];
  double v11 = v10;
  v12 = [(PFParallaxLayer *)self identifier];
  v13 = -[PFParallaxVideoLayer initWithVideoData:frame:zPosition:identifier:](v8, "initWithVideoData:frame:zPosition:identifier:", v9, v12, x, y, width, height, v11);

  return v13;
}

- (PFParallaxVideoLayer)initWithVideoData:(id)a3 frame:(CGRect)a4 zPosition:(double)a5 identifier:(id)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  v13 = (NSData *)a3;
  v20.receiver = self;
  v20.super_class = (Class)PFParallaxVideoLayer;
  v14 = -[PFParallaxLayer initWithFrame:zPosition:identifier:](&v20, sel_initWithFrame_zPosition_identifier_, a6, x, y, width, height, a5);
  videoData = v14->_videoData;
  v14->_videoData = v13;
  v16 = v13;

  uint64_t v17 = [MEMORY[0x1E4F16330] assetWithData:v16 contentType:*MEMORY[0x1E4F15AB0] options:MEMORY[0x1E4F1CC08]];
  video = v14->_video;
  v14->_video = (AVAsset *)v17;

  return v14;
}

@end