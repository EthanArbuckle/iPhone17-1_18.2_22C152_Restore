@interface NSStringDrawingTextStorageSettings
+ (NSStringDrawingTextStorageSettings)threadSpecificStringDrawingTextStorageSettings:(uint64_t)a1;
- (NSStringDrawingTextStorageSettings)init;
@end

@implementation NSStringDrawingTextStorageSettings

+ (NSStringDrawingTextStorageSettings)threadSpecificStringDrawingTextStorageSettings:(uint64_t)a1
{
  self;
  v3 = (NSStringDrawingTextStorageSettings *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29060], "currentThread"), "threadDictionary"), "objectForKey:", @"kNSStringDrawingTextStorageSettings");
  if (v3) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = a2 == 0;
  }
  if (!v4)
  {
    v3 = objc_alloc_init(NSStringDrawingTextStorageSettings);
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29060], "currentThread"), "threadDictionary"), "setObject:forKey:", v3, @"kNSStringDrawingTextStorageSettings");
  }
  return v3;
}

- (NSStringDrawingTextStorageSettings)init
{
  v4.receiver = self;
  v4.super_class = (Class)NSStringDrawingTextStorageSettings;
  v2 = [(NSStringDrawingTextStorageSettings *)&v4 init];
  if (v2) {
    *(_WORD *)&v2->_settings._flags = *(_WORD *)&v2->_settings._flags & 0xFD | ((unsigned __int16)+[NSTypesetter defaultStringDrawingTypesetterBehavior] << 8);
  }
  return v2;
}

@end