@interface OADMovie
- (BOOL)isAudioOnly;
- (BOOL)loop;
- (NSData)data;
- (NSString)name;
- (float)movieEndPoint;
- (float)movieStartPoint;
- (id)description;
- (void)setData:(id)a3;
- (void)setIsAudioOnly:(BOOL)a3;
- (void)setLoop:(BOOL)a3;
- (void)setMovieEndPoint:(float)a3;
- (void)setMovieStartPoint:(float)a3;
- (void)setName:(id)a3;
@end

@implementation OADMovie

- (void)setName:(id)a3
{
}

- (void)setData:(id)a3
{
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADMovie;
  v2 = [(OADMovie *)&v4 description];
  return v2;
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)isAudioOnly
{
  return self->mIsAudioOnly;
}

- (void)setIsAudioOnly:(BOOL)a3
{
  self->mIsAudioOnly = a3;
}

- (float)movieStartPoint
{
  return self->mStart;
}

- (void)setMovieStartPoint:(float)a3
{
  self->mStart = a3;
}

- (float)movieEndPoint
{
  return self->mEnd;
}

- (void)setMovieEndPoint:(float)a3
{
  self->mEnd = a3;
}

- (BOOL)loop
{
  return self->loop;
}

- (void)setLoop:(BOOL)a3
{
  self->loop = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mName, 0);
  objc_storeStrong((id *)&self->mData, 0);
}

@end