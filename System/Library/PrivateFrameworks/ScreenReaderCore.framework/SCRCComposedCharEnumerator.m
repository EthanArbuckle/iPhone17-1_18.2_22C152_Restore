@interface SCRCComposedCharEnumerator
- (SCRCComposedCharEnumerator)initWithString:(id)a3;
- (id)allObjects;
- (id)nextObject;
@end

@implementation SCRCComposedCharEnumerator

- (SCRCComposedCharEnumerator)initWithString:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCRCComposedCharEnumerator;
  v6 = [(SCRCComposedCharEnumerator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_string, a3);
  }

  return v7;
}

- (id)nextObject
{
  if (self->_done)
  {
    v2 = 0;
    goto LABEL_8;
  }
  if (self->_indexOfCurrentComposedCharacter < [(NSString *)self->_string length])
  {
    v2 = -[NSString scrc_composedCharacterAtIndex:](self->_string, "scrc_composedCharacterAtIndex:");
    uint64_t v4 = [v2 originalLength];
    if (v4)
    {
      self->_indexOfCurrentComposedCharacter += v4;
      goto LABEL_8;
    }
  }
  v2 = 0;
  self->_done = 1;
LABEL_8:
  return v2;
}

- (id)allObjects
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v4 = [(SCRCComposedCharEnumerator *)self nextObject];
  if (v4)
  {
    id v5 = (void *)v4;
    do
    {
      [v3 addObject:v5];
      uint64_t v6 = [(SCRCComposedCharEnumerator *)self nextObject];

      id v5 = (void *)v6;
    }
    while (v6);
  }
  self->_done = 0;
  self->_indexOfCurrentComposedCharacter = 0;
  return v3;
}

- (void).cxx_destruct
{
}

@end