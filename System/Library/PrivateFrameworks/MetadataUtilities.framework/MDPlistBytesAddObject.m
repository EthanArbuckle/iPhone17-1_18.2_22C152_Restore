@interface MDPlistBytesAddObject
@end

@implementation MDPlistBytesAddObject

uint64_t ____MDPlistBytesAddObject_block_invoke()
{
  qword_1E95CA330 = CFArrayGetTypeID();
  qword_1E95CA338 = CFDictionaryGetTypeID();
  qword_1E95CA340 = CFBooleanGetTypeID();
  qword_1E95CA350 = CFDataGetTypeID();
  qword_1E95CA348 = CFDateGetTypeID();
  qword_1E95CA358 = CFNullGetTypeID();
  qword_1E95CA360 = CFNumberGetTypeID();
  qword_1E95CA328 = CFStringGetTypeID();
  qword_1E95CA368 = CFUUIDGetTypeID();
  qword_1E95CA370 = CFURLGetTypeID();
  if (qword_1E95CA310 != -1) {
    dispatch_once(&qword_1E95CA310, &__block_literal_global_12);
  }
  qword_1E95CA378 = qword_1E95CA318;
  uint64_t result = _MDStoreOIDArrayGetTypeID();
  qword_1E95CA380 = result;
  return result;
}

@end