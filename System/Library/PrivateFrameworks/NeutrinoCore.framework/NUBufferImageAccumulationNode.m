@interface NUBufferImageAccumulationNode
- (id)_newImage;
@end

@implementation NUBufferImageAccumulationNode

- (id)_newImage
{
  v3 = [(NUImageAccumulationNode *)self layout];
  v4 = [(NUImageAccumulationNode *)self pixelFormat];
  v5 = [(NUImageAccumulationNode *)self colorSpace];
  v6 = +[NUImageFactory bufferImageWithLayout:v3 format:v4 colorSpace:v5];

  return v6;
}

@end