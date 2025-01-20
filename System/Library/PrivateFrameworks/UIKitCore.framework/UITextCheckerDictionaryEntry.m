@interface UITextCheckerDictionaryEntry
- (void)dealloc;
@end

@implementation UITextCheckerDictionaryEntry

- (void)dealloc
{
  dictionary = self->dictionary;
  if (dictionary) {
    CFRelease(dictionary);
  }
  v4.receiver = self;
  v4.super_class = (Class)UITextCheckerDictionaryEntry;
  [(UITextCheckerDictionaryEntry *)&v4 dealloc];
}

- (void).cxx_destruct
{
}

@end