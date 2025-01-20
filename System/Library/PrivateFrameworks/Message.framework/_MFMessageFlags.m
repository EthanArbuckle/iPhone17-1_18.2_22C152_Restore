@interface _MFMessageFlags
- (_MFMessageFlags)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _MFMessageFlags

- (_MFMessageFlags)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v7 = 0xAAAAAAAAAAAAAAAALL;
  id v8 = 0;
  int v6 = -1431655766;
  [v4 decodeValueOfObjCType:"@" at:&v8];
  [v4 decodeValueOfObjCType:"Q" at:&v7];
  [v4 decodeValueOfObjCType:"I" at:&v6];
  self->realFlags = (v7 ^ 1) & 0x1BDDDB7FFFFLL | ((unint64_t)(v6 & 7) << 16);

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t realFlags = self->realFlags;
  unsigned int v6 = WORD1(realFlags) & 7;
  uint64_t v7 = realFlags & 0x1BDDDB7FFFFLL ^ 1;
  id v8 = 0;
  [v4 encodeValueOfObjCType:"@" at:&v8];
  [v4 encodeValueOfObjCType:"Q" at:&v7];
  [v4 encodeValueOfObjCType:"I" at:&v6];
}

@end