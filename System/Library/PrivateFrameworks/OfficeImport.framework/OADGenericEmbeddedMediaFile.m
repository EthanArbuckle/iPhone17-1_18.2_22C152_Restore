@interface OADGenericEmbeddedMediaFile
- (BOOL)isAudioOnly;
- (void)setIsAudioOnly:(BOOL)a3;
@end

@implementation OADGenericEmbeddedMediaFile

- (BOOL)isAudioOnly
{
  return *(&self->super.super.loop + 1);
}

- (void)setIsAudioOnly:(BOOL)a3
{
  *(&self->super.super.loop + 1) = a3;
}

@end