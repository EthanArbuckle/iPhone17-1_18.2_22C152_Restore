@interface NSPinyinString(AlternativesImpl)
+ (uint64_t)_alternativesForInputString:()AlternativesImpl;
+ (uint64_t)_correctionsForInputString:()AlternativesImpl;
+ (uint64_t)_prefixesForInputString:()AlternativesImpl;
@end

@implementation NSPinyinString(AlternativesImpl)

+ (uint64_t)_alternativesForInputString:()AlternativesImpl
{
  v4 = (AppleSpell *)_sharedChecker;
  if (!_sharedChecker)
  {
    v4 = objc_alloc_init(AppleSpell);
    _sharedChecker = (uint64_t)v4;
  }
  return (uint64_t)[(AppleSpell *)v4 spellServer:0 alternativesForPinyinInputString:a3];
}

+ (uint64_t)_prefixesForInputString:()AlternativesImpl
{
  v4 = (AppleSpell *)_sharedChecker;
  if (!_sharedChecker)
  {
    v4 = objc_alloc_init(AppleSpell);
    _sharedChecker = (uint64_t)v4;
  }
  return (uint64_t)[(AppleSpell *)v4 spellServer:0 prefixesForPinyinInputString:a3];
}

+ (uint64_t)_correctionsForInputString:()AlternativesImpl
{
  v4 = (AppleSpell *)_sharedChecker;
  if (!_sharedChecker)
  {
    v4 = objc_alloc_init(AppleSpell);
    _sharedChecker = (uint64_t)v4;
  }
  return (uint64_t)[(AppleSpell *)v4 spellServer:0 correctionsForPinyinInputString:a3];
}

@end