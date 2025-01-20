@interface AVAudioSession(PhotosMediaFoundation)
- (uint64_t)photosAudioSessionCategory;
- (uint64_t)setPhotosAudioSessionCategory:()PhotosMediaFoundation error:;
@end

@implementation AVAudioSession(PhotosMediaFoundation)

- (uint64_t)photosAudioSessionCategory
{
  v1 = [a1 category];
  if ([v1 isEqualToString:*MEMORY[0x263EF9048]])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:*MEMORY[0x263EF9060]])
  {
    uint64_t v2 = 2;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

- (uint64_t)setPhotosAudioSessionCategory:()PhotosMediaFoundation error:
{
  if (a3 == 1)
  {
    v6 = (id *)MEMORY[0x263EF9048];
  }
  else
  {
    if (a3 != 2)
    {
      id v7 = 0;
      goto LABEL_7;
    }
    v6 = (id *)MEMORY[0x263EF9060];
  }
  id v7 = *v6;
LABEL_7:
  uint64_t v8 = [a1 setCategory:v7 error:a4];

  return v8;
}

@end