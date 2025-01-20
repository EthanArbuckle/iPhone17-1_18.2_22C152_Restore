@interface NSAttributeDictionaryEnumerator
- (NSAttributeDictionaryEnumerator)initWithAttributeDictionary:(id)a3;
- (id)nextObject;
- (void)dealloc;
@end

@implementation NSAttributeDictionaryEnumerator

- (id)nextObject
{
  unint64_t nextElement = self->nextElement;
  dictionary = self->dictionary;
  if (nextElement == dictionary->numElements) {
    return 0;
  }
  self->unint64_t nextElement = nextElement + 1;
  return dictionary->elements[nextElement].key;
}

- (NSAttributeDictionaryEnumerator)initWithAttributeDictionary:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NSAttributeDictionaryEnumerator;
  v4 = [(NSAttributeDictionaryEnumerator *)&v6 init];
  if (v4)
  {
    v4->dictionary = (NSAttributeDictionary *)a3;
    v4->unint64_t nextElement = 0;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSAttributeDictionaryEnumerator;
  [(NSAttributeDictionaryEnumerator *)&v3 dealloc];
}

@end