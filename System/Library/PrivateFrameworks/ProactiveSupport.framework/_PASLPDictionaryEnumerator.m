@interface _PASLPDictionaryEnumerator
- (_PASLPDictionaryEnumerator)initWithLazyPlistReader:(id)a3 context:(id)a4;
- (id)nextObject;
@end

@implementation _PASLPDictionaryEnumerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (id)nextObject
{
  v3 = (void *)MEMORY[0x1A62450A0](self, a2);
  context = self->_context;
  if (context && self->_ofs < context->_count)
  {
    v5 = -[_PASLPReaderProtocol keyAtIndex:usingDictionaryContext:](self->_reader, "keyAtIndex:usingDictionaryContext:");
    ++self->_ofs;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (_PASLPDictionaryEnumerator)initWithLazyPlistReader:(id)a3 context:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_PASLPDictionaryEnumerator;
  v9 = [(_PASLPDictionaryEnumerator *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_reader, a3);
    objc_storeStrong((id *)&v10->_context, a4);
  }

  return v10;
}

@end