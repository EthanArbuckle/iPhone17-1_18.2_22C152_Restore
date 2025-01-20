@interface TypistArabicSyllable
+ (BOOL)isArabicCharacter:(unsigned __int16)a3;
+ (BOOL)isArabicPresentationFormBCharacter:(unsigned __int16)a3;
@end

@implementation TypistArabicSyllable

+ (BOOL)isArabicPresentationFormBCharacter:(unsigned __int16)a3
{
  return (unsigned __int16)(a3 + 400) < 0x91u;
}

+ (BOOL)isArabicCharacter:(unsigned __int16)a3
{
  return (a3 - 1536) < 0x101;
}

@end