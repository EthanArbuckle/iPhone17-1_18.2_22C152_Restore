@interface __NSImmutableTextStorage
+ (__NSImmutableTextStorage)allocWithZone:(_NSZone *)a3;
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (NSLayoutManager)layoutManager;
- (NSTextContainer)textContainer;
- (__NSImmutableTextStorage)initWithAttributedString:(id)a3;
- (id)attribute:(id)a3 atIndex:(unint64_t)a4 effectiveRange:(_NSRange *)a5;
- (id)attribute:(id)a3 atIndex:(unint64_t)a4 longestEffectiveRange:(_NSRange *)a5 inRange:(_NSRange)a6;
- (id)attributesAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)attributesAtIndex:(unint64_t)a3 longestEffectiveRange:(_NSRange *)a4 inRange:(_NSRange)a5;
- (id)string;
- (void)dealloc;
- (void)release;
- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4;
- (void)setAttributes:(id)a3 range:(_NSRange)a4;
@end

@implementation __NSImmutableTextStorage

- (BOOL)_tryRetain
{
  return 0;
}

- (BOOL)_isDeallocating
{
  return 1;
}

+ (__NSImmutableTextStorage)allocWithZone:(_NSZone *)a3
{
  os_unfair_lock_lock_with_options();
  int v5 = __NSImmutableTextStorageCacheNextIndex;
  if (!__NSImmutableTextStorageCacheNextIndex)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&__NSImmutableTextStorageLock);
LABEL_5:
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS_____NSImmutableTextStorage;
    return (__NSImmutableTextStorage *)objc_msgSendSuper2(&v8, sel_allocWithZone_, a3);
  }
  --__NSImmutableTextStorageCacheNextIndex;
  v6 = (__NSImmutableTextStorage *)__NSImmutableTextStorageCache[v5 - 1];
  os_unfair_lock_unlock((os_unfair_lock_t)&__NSImmutableTextStorageLock);
  if (!v6) {
    goto LABEL_5;
  }
  return v6;
}

- (void)release
{
  os_unfair_lock_lock_with_options();
  if ([(__NSImmutableTextStorage *)self retainCount] == 1
    && (uint64_t v3 = __NSImmutableTextStorageCacheNextIndex,
        __NSImmutableTextStorageCacheNextIndex <= 4))
  {
    ++__NSImmutableTextStorageCacheNextIndex;
    __NSImmutableTextStorageCache[v3] = self;

    self->_contents = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)&__NSImmutableTextStorageLock);
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&__NSImmutableTextStorageLock);
    v4.receiver = self;
    v4.super_class = (Class)__NSImmutableTextStorage;
    [(__NSImmutableTextStorage *)&v4 release];
  }
}

- (__NSImmutableTextStorage)initWithAttributedString:(id)a3
{
  objc_super v4 = self;
  if (!self->_layoutManager)
  {
    v10.receiver = self;
    v10.super_class = (Class)__NSImmutableTextStorage;
    v6 = [(NSTextStorage *)&v10 init];
    objc_super v4 = v6;
    if (!v6) {
      return v4;
    }
    if (!v6->_layoutManager)
    {
      v7 = objc_alloc_init(NSLayoutManager);
      v4->_layoutManager = v7;
      [(NSLayoutManager *)v7 setAllowsNonContiguousLayout:0];
      [(NSLayoutManager *)v4->_layoutManager setBackgroundLayoutEnabled:0];
      [(NSLayoutManager *)v4->_layoutManager setLimitsLayoutForSuspiciousContents:1];
      [(NSTextStorage *)v4 addLayoutManager:v4->_layoutManager];
      objc_super v8 = [NSTextContainer alloc];
      v9 = -[NSTextContainer initWithSize:](v8, "initWithSize:", *MEMORY[0x1E4F28AE0], *(double *)(MEMORY[0x1E4F28AE0] + 8));
      v4->_textContainer = v9;
      [(NSTextContainer *)v9 setLineFragmentPadding:0.0];
      [(NSLayoutManager *)v4->_layoutManager addTextContainer:v4->_textContainer];
    }
  }
  v4->_contents = (NSAttributedString *)a3;
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)__NSImmutableTextStorage;
  [(NSTextStorage *)&v3 dealloc];
}

- (NSTextContainer)textContainer
{
  return self->_textContainer;
}

- (NSLayoutManager)layoutManager
{
  return self->_layoutManager;
}

- (id)string
{
  return [(NSAttributedString *)self->_contents string];
}

- (id)attributesAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  return [(NSAttributedString *)self->_contents attributesAtIndex:a3 effectiveRange:a4];
}

- (id)attribute:(id)a3 atIndex:(unint64_t)a4 effectiveRange:(_NSRange *)a5
{
  return [(NSAttributedString *)self->_contents attribute:a3 atIndex:a4 effectiveRange:a5];
}

- (id)attributesAtIndex:(unint64_t)a3 longestEffectiveRange:(_NSRange *)a4 inRange:(_NSRange)a5
{
  return -[NSAttributedString attributesAtIndex:longestEffectiveRange:inRange:](self->_contents, "attributesAtIndex:longestEffectiveRange:inRange:", a3, a4, a5.location, a5.length);
}

- (id)attribute:(id)a3 atIndex:(unint64_t)a4 longestEffectiveRange:(_NSRange *)a5 inRange:(_NSRange)a6
{
  return -[NSAttributedString attribute:atIndex:longestEffectiveRange:inRange:](self->_contents, "attribute:atIndex:longestEffectiveRange:inRange:", a3, a4, a5, a6.location, a6.length);
}

- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4
{
}

- (void)setAttributes:(id)a3 range:(_NSRange)a4
{
}

@end