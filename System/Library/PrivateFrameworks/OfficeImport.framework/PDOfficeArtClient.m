@interface PDOfficeArtClient
- (BOOL)hasAnimationInfo;
- (BOOL)hasBounds;
- (BOOL)hasOleChart;
- (BOOL)hasPlaceholder;
- (BOOL)isComment;
- (CGRect)bounds;
- (NSString)description;
- (PDOfficeArtClient)init;
- (id)animationInfo;
- (id)imageRecolorInfo;
- (id)placeholder;
- (int)inheritedTextStylePlaceholderType;
- (void)setAnimationInfo:(id)a3;
- (void)setHasOleChart:(BOOL)a3;
- (void)setImageRecolorInfo:(id)a3;
- (void)setInheritedTextStylePlaceholderType:(int)a3;
- (void)setIsComment:(BOOL)a3;
- (void)setPlaceholder:(id)a3;
@end

@implementation PDOfficeArtClient

- (PDOfficeArtClient)init
{
  v3.receiver = self;
  v3.super_class = (Class)PDOfficeArtClient;
  result = [(PDOfficeArtClient *)&v3 init];
  if (result) {
    result->mInheritedTextStylePlaceholderType = -1;
  }
  return result;
}

- (BOOL)hasPlaceholder
{
  return self->mPlaceholder != 0;
}

- (void)setPlaceholder:(id)a3
{
}

- (id)placeholder
{
  return self->mPlaceholder;
}

- (BOOL)hasBounds
{
  return 0;
}

- (int)inheritedTextStylePlaceholderType
{
  return self->mInheritedTextStylePlaceholderType;
}

- (void)setInheritedTextStylePlaceholderType:(int)a3
{
  self->mInheritedTextStylePlaceholderType = a3;
}

- (void)setImageRecolorInfo:(id)a3
{
}

- (void)setHasOleChart:(BOOL)a3
{
  self->mHasOleChart = a3;
}

- (void)setIsComment:(BOOL)a3
{
  self->mIsComment = a3;
}

- (CGRect)bounds
{
  double v2 = *MEMORY[0x263F001A8];
  double v3 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v4 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v5 = *(double *)(MEMORY[0x263F001A8] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)imageRecolorInfo
{
  return self->mImageRecolorInfo;
}

- (BOOL)isComment
{
  return self->mIsComment;
}

- (BOOL)hasAnimationInfo
{
  return self->mAnimationInfo != 0;
}

- (void)setAnimationInfo:(id)a3
{
}

- (id)animationInfo
{
  return self->mAnimationInfo;
}

- (BOOL)hasOleChart
{
  return self->mHasOleChart;
}

- (NSString)description
{
  v4.receiver = self;
  v4.super_class = (Class)PDOfficeArtClient;
  double v2 = [(PDOfficeArtClient *)&v4 description];
  return (NSString *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mAnimationInfo, 0);
  objc_storeStrong((id *)&self->mPlaceholder, 0);
  objc_storeStrong((id *)&self->mImageRecolorInfo, 0);
}

@end