@interface TUIWPService
- (TUIWPDocument)document;
- (TUIWPService)init;
- (id)context;
- (id)stylesheet;
- (void)setDocument:(id)a3;
@end

@implementation TUIWPService

- (TUIWPService)init
{
  v6.receiver = self;
  v6.super_class = (Class)TUIWPService;
  v2 = [(TUIWPService *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(TUIWPDocument);
    document = v2->_document;
    v2->_document = v3;
  }
  return v2;
}

- (id)context
{
  return [(TUIWPDocument *)self->_document context];
}

- (id)stylesheet
{
  return [(TUIWPDocument *)self->_document stylesheet];
}

- (TUIWPDocument)document
{
  return self->_document;
}

- (void)setDocument:(id)a3
{
}

- (void).cxx_destruct
{
}

@end