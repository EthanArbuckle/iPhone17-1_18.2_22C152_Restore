@interface PTRow(PhotosPlayer)
- (void)is_increment:()PhotosPlayer;
@end

@implementation PTRow(PhotosPlayer)

- (void)is_increment:()PhotosPlayer
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__PTRow_PhotosPlayer__is_increment___block_invoke;
  v4[3] = &__block_descriptor_40_e11__24__0_8_16l;
  *(double *)&v4[4] = a2;
  [a1 setValueValidatator:v4];
  return a1;
}

@end