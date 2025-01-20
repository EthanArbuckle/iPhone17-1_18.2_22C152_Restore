@interface PDPlaceholder
+ (BOOL)isNonTextType:(int)a3;
+ (BOOL)isTextType:(int)a3;
- (PDPlaceholder)init;
- (id)description;
- (int)boundsTrack;
- (int)orientation;
- (int)size;
- (int)type;
- (unsigned)index;
- (void)setBoundsTrack:(int)a3;
- (void)setIndex:(unsigned int)a3;
- (void)setOrientation:(int)a3;
- (void)setSize:(int)a3;
- (void)setType:(int)a3;
@end

@implementation PDPlaceholder

- (PDPlaceholder)init
{
  v3.receiver = self;
  v3.super_class = (Class)PDPlaceholder;
  result = [(PDPlaceholder *)&v3 init];
  if (result) {
    *(_OWORD *)&result->mType = xmmword_238EEF7A0;
  }
  return result;
}

- (void)setIndex:(unsigned int)a3
{
  self->mIndex = a3;
}

- (void)setType:(int)a3
{
  self->mType = a3;
}

- (void)setSize:(int)a3
{
  self->mSize = a3;
}

- (void)setOrientation:(int)a3
{
  self->mOrientation = a3;
}

- (int)type
{
  return self->mType;
}

- (unsigned)index
{
  return self->mIndex;
}

- (int)size
{
  return self->mSize;
}

- (void)setBoundsTrack:(int)a3
{
  self->mBoundsTrack = a3;
}

- (int)orientation
{
  return self->mOrientation;
}

- (int)boundsTrack
{
  return self->mBoundsTrack;
}

+ (BOOL)isTextType:(int)a3
{
  return a3 < 8;
}

+ (BOOL)isNonTextType:(int)a3
{
  return (a3 < 0x10) & (0xBE00u >> a3);
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)PDPlaceholder;
  v2 = [(PDPlaceholder *)&v4 description];
  return v2;
}

@end