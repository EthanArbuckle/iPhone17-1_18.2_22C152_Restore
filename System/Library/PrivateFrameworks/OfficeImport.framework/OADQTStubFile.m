@interface OADQTStubFile
- (BOOL)isAudioOnly;
- (id)description;
- (void)setIsAudioOnly:(BOOL)a3;
@end

@implementation OADQTStubFile

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADQTStubFile;
  v2 = [(OADMovie *)&v4 description];
  return v2;
}

- (BOOL)isAudioOnly
{
  return *(&self->super.super.loop + 1);
}

- (void)setIsAudioOnly:(BOOL)a3
{
  *(&self->super.super.loop + 1) = a3;
}

@end