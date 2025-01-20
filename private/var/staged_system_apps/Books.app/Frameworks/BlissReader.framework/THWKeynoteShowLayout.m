@interface THWKeynoteShowLayout
- (CGSize)showSize;
- (KPFDocumentProtocol)kpfDocument;
- (void)dealloc;
- (void)setKpfDocument:(id)a3;
@end

@implementation THWKeynoteShowLayout

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWKeynoteShowLayout;
  [(THWKeynoteShowLayout *)&v3 dealloc];
}

- (KPFDocumentProtocol)kpfDocument
{
  result = self->_kpfDocument;
  if (!result)
  {
    result = [KPFDocumentFactory createDocumentWithKPFBundle:[NSBundle bundleWithURL:[self info].sourceURL] drmContext:[self info].drmContext];
    self->_kpfDocument = result;
  }
  return result;
}

- (CGSize)showSize
{
  v2 = [(THWKeynoteShowLayout *)self kpfDocument];

  [(KPFDocumentProtocol *)v2 showSize];
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setKpfDocument:(id)a3
{
}

@end