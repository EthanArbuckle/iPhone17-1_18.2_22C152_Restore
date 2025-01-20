@interface ObjectCacheByCString
- (ObjectCacheByCString)init;
- (id)getObjectForCStringKey:(char *)a3;
- (void)dealloc;
- (void)setObject:(id)a3 forCStringKey:(char *)a4;
@end

@implementation ObjectCacheByCString

- (ObjectCacheByCString)init
{
  self->_dictionary = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, &kCStringDictionaryKeyCallBacks, MEMORY[0x263EFFF90]);
  v4.receiver = self;
  v4.super_class = (Class)ObjectCacheByCString;
  return [(ObjectCacheByCString *)&v4 init];
}

- (void)dealloc
{
  dictionary = self->_dictionary;
  if (dictionary) {
    CFRelease(dictionary);
  }
  v4.receiver = self;
  v4.super_class = (Class)ObjectCacheByCString;
  [(ObjectCacheByCString *)&v4 dealloc];
}

- (void)setObject:(id)a3 forCStringKey:(char *)a4
{
}

- (id)getObjectForCStringKey:(char *)a3
{
  return (id)CFDictionaryGetValue(self->_dictionary, a3);
}

@end