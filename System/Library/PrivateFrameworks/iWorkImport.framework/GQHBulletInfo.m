@interface GQHBulletInfo
- (BOOL)hasNumber;
- (__CFString)bulletChar;
- (__CFString)createTierStringNumber;
- (id)style;
- (int)bulletIndent;
- (int)labelType;
- (int)number;
- (int)textIndent;
- (int)type;
- (void)dealloc;
- (void)setBulletChar:(__CFString *)a3;
- (void)setBulletIndent:(int)a3;
- (void)setHasNumber:(BOOL)a3;
- (void)setLabelType:(int)a3;
- (void)setNumber:(int)a3;
- (void)setStyle:(id)a3;
- (void)setTextIndent:(int)a3;
- (void)setType:(int)a3;
@end

@implementation GQHBulletInfo

- (void)dealloc
{
  mChar = self->mChar;
  if (mChar) {
    CFRelease(mChar);
  }

  v4.receiver = self;
  v4.super_class = (Class)GQHBulletInfo;
  [(GQHBulletInfo *)&v4 dealloc];
}

- (void)setNumber:(int)a3
{
  self->mNumber = a3;
}

- (int)number
{
  return self->mNumber;
}

- (BOOL)hasNumber
{
  return self->mHasNumber;
}

- (void)setHasNumber:(BOOL)a3
{
  self->mHasNumber = a3;
}

- (void)setLabelType:(int)a3
{
  self->mLabelType = a3;
}

- (int)labelType
{
  return self->mLabelType;
}

- (void)setType:(int)a3
{
  self->mType = a3;
}

- (int)type
{
  return self->mType;
}

- (void)setBulletChar:(__CFString *)a3
{
  if (a3) {
    CFRetain(a3);
  }
  mChar = self->mChar;
  if (mChar) {
    CFRelease(mChar);
  }
  self->mChar = a3;
}

- (__CFString)bulletChar
{
  return self->mChar;
}

- (__CFString)createTierStringNumber
{
  return +[GQHBulletState createLabelStr:self->mLabelType number:self->mNumber];
}

- (void)setBulletIndent:(int)a3
{
  self->mBulletIndent = a3;
}

- (int)bulletIndent
{
  return self->mBulletIndent;
}

- (void)setTextIndent:(int)a3
{
  self->mTextIndent = a3;
}

- (int)textIndent
{
  return self->mTextIndent;
}

- (void)setStyle:(id)a3
{
  id v5 = a3;

  self->mStyle = (GQDSStyle *)a3;
}

- (id)style
{
  return self->mStyle;
}

@end