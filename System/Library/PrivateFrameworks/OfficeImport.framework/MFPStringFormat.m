@interface MFPStringFormat
- (MFPStringFormat)init;
- (const)tabStops;
- (float)firstTabOffset;
- (int)alignment;
- (int)digitSubstitutionMethod;
- (int)hotkeyPrefix;
- (int)lineAlignment;
- (int)tabStopCount;
- (int)trimming;
- (unsigned)digitSubstitutionLanguage;
- (unsigned)formatFlags;
- (void)dealloc;
- (void)setAlignment:(int)a3;
- (void)setDigitSubstitutionLanguage:(unsigned __int16)a3;
- (void)setDigitSubstitutionMethod:(int)a3;
- (void)setFirstTabOffset:(float)a3;
- (void)setFormatFlags:(unsigned int)a3;
- (void)setHotkeyPrefix:(int)a3;
- (void)setLineAlignment:(int)a3;
- (void)setTabStops:(const float *)a3 count:(int)a4;
- (void)setTrimming:(int)a3;
@end

@implementation MFPStringFormat

- (MFPStringFormat)init
{
  v3.receiver = self;
  v3.super_class = (Class)MFPStringFormat;
  result = [(MFPStringFormat *)&v3 init];
  if (result) {
    result->mTrimming = 1;
  }
  return result;
}

- (void)dealloc
{
  mTabStops = self->mTabStops;
  if (mTabStops) {
    MEMORY[0x23EC99790](mTabStops, 0x1000C8052888210);
  }
  v4.receiver = self;
  v4.super_class = (Class)MFPStringFormat;
  [(MFPStringFormat *)&v4 dealloc];
}

- (int)alignment
{
  return self->mAlignment;
}

- (void)setAlignment:(int)a3
{
  self->mAlignment = a3;
}

- (unsigned)digitSubstitutionLanguage
{
  return self->mDigitSubstitutionLanguage;
}

- (void)setDigitSubstitutionLanguage:(unsigned __int16)a3
{
  self->mDigitSubstitutionLanguage = a3;
}

- (int)digitSubstitutionMethod
{
  return self->mDigitSubstitutionMethod;
}

- (void)setDigitSubstitutionMethod:(int)a3
{
  self->mDigitSubstitutionMethod = a3;
}

- (unsigned)formatFlags
{
  return self->mFormatFlags;
}

- (void)setFormatFlags:(unsigned int)a3
{
  self->mFormatFlags = a3;
}

- (int)hotkeyPrefix
{
  return self->mHotkeyPrefix;
}

- (void)setHotkeyPrefix:(int)a3
{
  self->mHotkeyPrefix = a3;
}

- (int)lineAlignment
{
  return self->mLineAlignment;
}

- (void)setLineAlignment:(int)a3
{
  self->mLineAlignment = a3;
}

- (float)firstTabOffset
{
  return self->mFirstTabOffset;
}

- (void)setFirstTabOffset:(float)a3
{
  self->mFirstTabOffset = a3;
}

- (int)tabStopCount
{
  return self->mTabStopCount;
}

- (const)tabStops
{
  return self->mTabStops;
}

- (void)setTabStops:(const float *)a3 count:(int)a4
{
  self->mTabStopCount = a4;
  operator new[]();
}

- (int)trimming
{
  return self->mTrimming;
}

- (void)setTrimming:(int)a3
{
  self->mTrimming = a3;
}

@end