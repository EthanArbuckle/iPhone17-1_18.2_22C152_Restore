@interface _NSLineBreakerNodeDictionary
- (void)dealloc;
- (void)enumerateClassesAndNodesUsingBlock:(void *)a1;
- (void)setNode:(void *)key forClass:;
@end

@implementation _NSLineBreakerNodeDictionary

- (void)enumerateClassesAndNodesUsingBlock:(void *)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (a1[2]) {
      (*((void (**)(id, void))v3 + 2))(v3, a1[1]);
    }
    CFDictionaryRef v5 = (const __CFDictionary *)a1[3];
    if (v5)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __67___NSLineBreakerNodeDictionary_enumerateClassesAndNodesUsingBlock___block_invoke;
      v6[3] = &unk_1E55C5640;
      id v7 = v4;
      _CFDictionaryApplyBlock(v5, v6);
    }
  }
}

- (void)dealloc
{
  dict = self->_dict;
  if (dict) {
    CFRelease(dict);
  }
  v4.receiver = self;
  v4.super_class = (Class)_NSLineBreakerNodeDictionary;
  [(_NSLineBreakerNodeDictionary *)&v4 dealloc];
}

- (void)setNode:(void *)key forClass:
{
  if (a1)
  {
    if (!value || value[32]) {
      -[_NSLineBreakerNodeDictionary setNode:forClass:]();
    }
    if (a1[2] && (void *)a1[1] != key)
    {
      Mutable = (__CFDictionary *)a1[3];
      if (!Mutable)
      {
        Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0);
        a1[3] = Mutable;
      }
      CFDictionarySetValue(Mutable, key, value);
    }
    else
    {
      a1[1] = key;
      a1[2] = value;
    }
  }
}

- (void)setNode:forClass:.cold.1()
{
}

@end