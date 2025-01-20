@interface PLTableThumbnailVirtualResource
- (int64_t)dataLength;
@end

@implementation PLTableThumbnailVirtualResource

- (int64_t)dataLength
{
  int v3 = [(PLVirtualResource *)self unorientedWidth];
  int64_t v4 = [(PLVirtualResource *)self unorientedHeight];
  unsigned __int16 v5 = [(PLVirtualResource *)self recipeID];
  v6 = [MEMORY[0x1E4F8B938] formatWithID:v5 >> 1];
  int64_t v7 = [v6 tableFormatBytesPerRowForWidth:v4] * v3 + 28;

  return v7;
}

@end