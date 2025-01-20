@interface EmojiSectionHeaderLayoutInvalidationContext
- (NSIndexSet)invalidatedSections;
- (double)preferredWidthForHeaderInSection:(int64_t)a3;
- (void)dealloc;
@end

@implementation EmojiSectionHeaderLayoutInvalidationContext

- (void)dealloc
{
  headerWidthDict = self->_headerWidthDict;
  if (headerWidthDict) {
    CFRelease(headerWidthDict);
  }
  v4.receiver = self;
  v4.super_class = (Class)EmojiSectionHeaderLayoutInvalidationContext;
  [(EmojiSectionHeaderLayoutInvalidationContext *)&v4 dealloc];
}

- (double)preferredWidthForHeaderInSection:(int64_t)a3
{
  headerWidthDict = self->_headerWidthDict;
  double v5 = 0.0;
  if (headerWidthDict && CFDictionaryContainsKey(headerWidthDict, (const void *)a3)) {
    return (double)(uint64_t)CFDictionaryGetValue(self->_headerWidthDict, (const void *)a3);
  }
  return v5;
}

- (NSIndexSet)invalidatedSections
{
  return &self->_invalidatedSections->super;
}

- (void).cxx_destruct
{
}

@end