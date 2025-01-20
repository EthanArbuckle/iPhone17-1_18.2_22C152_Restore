@interface OADSound
- (BOOL)isLoaded;
- (id)description;
- (id)name;
- (id)soundData;
- (int)sizeInBytes;
- (void)setName:(id)a3;
- (void)setSizeInBytes:(int)a3;
- (void)setSoundData:(id)a3;
@end

@implementation OADSound

- (void)setName:(id)a3
{
}

- (id)soundData
{
  return self->mSoundData;
}

- (void)setSoundData:(id)a3
{
}

- (id)name
{
  return self->mName;
}

- (int)sizeInBytes
{
  return self->mSizeInBytes;
}

- (void)setSizeInBytes:(int)a3
{
  self->mSizeInBytes = a3;
}

- (BOOL)isLoaded
{
  if (!self->mSoundData) {
    return 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)OADSound;
  return [(OCDDelayedNode *)&v3 isLoaded];
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADSound;
  v2 = [(OADSound *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mName, 0);
  objc_storeStrong((id *)&self->mSoundData, 0);
}

@end