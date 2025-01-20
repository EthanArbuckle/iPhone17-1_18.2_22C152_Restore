@interface TCEnumerationMultiMap
- (TCEnumerationMultiMap)initWithStructs:(const TCEnumerationStruct *)a3 count:(int)a4;
- (TCEnumerationMultiMap)initWithStructs:(const TCEnumerationStruct *)a3 count:(int)a4 caseSensitive:(BOOL)a5;
- (id)stringForValue:(int)a3;
- (int64_t)valueForString:(id)a3;
- (void)dealloc;
@end

@implementation TCEnumerationMultiMap

- (TCEnumerationMultiMap)initWithStructs:(const TCEnumerationStruct *)a3 count:(int)a4
{
  return [(TCEnumerationMultiMap *)self initWithStructs:a3 count:*(void *)&a4 caseSensitive:0];
}

- (TCEnumerationMultiMap)initWithStructs:(const TCEnumerationStruct *)a3 count:(int)a4 caseSensitive:(BOOL)a5
{
  v16.receiver = self;
  v16.super_class = (Class)TCEnumerationMultiMap;
  v8 = [(TCEnumerationMultiMap *)&v16 init];
  if (v8)
  {
    v8->m_valueToString = CFDictionaryCreateMutable(0, a4, 0, MEMORY[0x263EFFF90]);
    v8->m_stringToValue = CFDictionaryCreateMutable(0, a4, MEMORY[0x263EFFB78], 0);
    v8->m_caseSensitive = a5;
    if (a4 >= 1)
    {
      uint64_t v9 = a4;
      p_var1 = &a3->var1;
      do
      {
        int v11 = *((_DWORD *)p_var1 - 2);
        id v13 = *p_var1;
        p_var1 += 2;
        v12 = v13;
        if (!v11) {
          int v11 = -130883970;
        }
        v14 = (const void *)v11;
        CFDictionaryAddValue(v8->m_valueToString, (const void *)v11, v12);
        CFDictionaryAddValue(v8->m_stringToValue, v12, v14);
        --v9;
      }
      while (v9);
    }
  }
  return v8;
}

- (void)dealloc
{
  CFRelease(self->m_valueToString);
  CFRelease(self->m_stringToValue);
  self->m_valueToString = 0;
  self->m_stringToValue = 0;
  v3.receiver = self;
  v3.super_class = (Class)TCEnumerationMultiMap;
  [(TCEnumerationMultiMap *)&v3 dealloc];
}

- (int64_t)valueForString:(id)a3
{
  id v3 = a3;
  m_stringToValue = self->m_stringToValue;
  if (!self->m_caseSensitive) {
    id v3 = (id)[a3 lowercaseString];
  }
  Value = CFDictionaryGetValue(m_stringToValue, v3);
  if (Value == (const void *)-130883970) {
    int64_t v6 = 0;
  }
  else {
    int64_t v6 = (int64_t)Value;
  }
  if (Value) {
    return v6;
  }
  else {
    return -130883970;
  }
}

- (id)stringForValue:(int)a3
{
  if (a3) {
    int v3 = a3;
  }
  else {
    int v3 = -130883970;
  }
  return (id)CFDictionaryGetValue(self->m_valueToString, (const void *)v3);
}

@end