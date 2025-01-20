@interface NSCachedDecimalTabAttribute
@end

@implementation NSCachedDecimalTabAttribute

uint64_t ____NSCachedDecimalTabAttribute_block_invoke()
{
  v1 = +[NSTextTab columnTerminatorsForLocale:](NSTextTab, "columnTerminatorsForLocale:", [MEMORY[0x1E4F1CA20] currentLocale]);
  __NSCachedDecimalTabAttribute___NSDefaultDecimalTabOptions = [objc_allocWithZone(MEMORY[0x1E4F1C9E8]) initWithObjects:&v1 forKeys:&NSTabColumnTerminatorsAttributeName count:1];
  uint64_t result = _CFExecutableLinkedOnOrAfter();
  if (!result)
  {
    uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "BOOLForKey:", @"NSDecimalTabUsesNaturalAlignment");
    if ((result & 1) == 0) {
      __NSDecimalTabAlignment = 1;
    }
  }
  return result;
}

@end