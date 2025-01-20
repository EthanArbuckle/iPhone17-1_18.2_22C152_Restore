@interface ITEpubXmlParseDelegate
- (void)dealloc;
- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6;
- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7;
- (void)parser:(id)a3 foundCDATA:(id)a4;
- (void)parser:(id)a3 foundCharacters:(id)a4;
- (void)setDecoder:(void *)a3;
@end

@implementation ITEpubXmlParseDelegate

- (void)dealloc
{
  decoder = (atomic_uint *)self->decoder;
  if (decoder)
  {
    ITRetain::release(decoder);
    self->decoder = 0;
  }
  foundCharacters = self->foundCharacters;
  self->foundCharacters = 0;

  v5.receiver = self;
  v5.super_class = (Class)ITEpubXmlParseDelegate;
  [(ITEpubXmlParseDelegate *)&v5 dealloc];
}

- (void)setDecoder:(void *)a3
{
  decoder = (atomic_uint *)self->decoder;
  if (decoder) {
    ITRetain::release(decoder);
  }
  self->decoder = a3;
  if (a3)
  {
    ITRetain::retain((atomic_uint *)a3);
  }
}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  foundCharacters = (__CFString *)self->foundCharacters;
  if (!foundCharacters) {
    foundCharacters = &stru_3D7B70;
  }
  v8 = foundCharacters;
  v9 = [(__CFString *)v8 stringByAppendingString:v6];
  v10 = self->foundCharacters;
  self->foundCharacters = v9;

  if ([(NSString *)self->foundCharacters length])
  {
    decoder = self->decoder;
    if (decoder) {
      (*(void (**)(void *, NSString *))(*(void *)decoder + 24))(decoder, self->foundCharacters);
    }
  }
  v12 = self->foundCharacters;
  self->foundCharacters = 0;
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  id v17 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  decoder = self->decoder;
  if (decoder)
  {
    (*(void (**)(void *, id))(*(void *)decoder + 40))(decoder, v13);
    (*(void (**)(void *, id, id))(*(void *)self->decoder + 16))(self->decoder, v12, v15);
  }
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  id v14 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  decoder = self->decoder;
  if (decoder)
  {
    (*(void (**)(void *, id))(*(void *)decoder + 40))(decoder, v11);
    (*(void (**)(void *, id))(*(void *)self->decoder + 32))(self->decoder, v10);
  }
}

- (void)parser:(id)a3 foundCDATA:(id)a4
{
}

- (void).cxx_destruct
{
}

@end