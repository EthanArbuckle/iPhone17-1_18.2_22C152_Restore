@interface PDDepthAndImagePushResults
- (NSArray)droppedImages;
- (PDMatchedDepthAndImage)match;
- (void)setDroppedImages:(id)a3;
- (void)setMatch:(id)a3;
@end

@implementation PDDepthAndImagePushResults

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_droppedImages, 0);
  objc_storeStrong((id *)&self->_match, 0);
}

- (void)setDroppedImages:(id)a3
{
}

- (NSArray)droppedImages
{
  return self->_droppedImages;
}

- (void)setMatch:(id)a3
{
}

- (PDMatchedDepthAndImage)match
{
  return self->_match;
}

@end