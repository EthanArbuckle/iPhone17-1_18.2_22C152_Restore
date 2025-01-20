@interface PVDocumentWrapper
- (PVDocumentWrapper)initWithOZXDocument:(void *)a3 forKey:(id)a4;
- (void)dealloc;
- (void)ozxDocument;
@end

@implementation PVDocumentWrapper

- (PVDocumentWrapper)initWithOZXDocument:(void *)a3 forKey:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)PVDocumentWrapper;
  result = [(PVDocumentWrapper *)&v6 init];
  if (result) {
    result->_ozxDocument = a3;
  }
  return result;
}

- (void)dealloc
{
  if (self->_ozxDocument)
  {
    v3 = (PVDocumentAccessController *)PVDocumentAccessController::INSTANCE((PVDocumentAccessController *)self);
    PVDocumentAccessController::ReleaseOZXDocument(v3, self->_ozxDocument);
  }
  v4.receiver = self;
  v4.super_class = (Class)PVDocumentWrapper;
  [(PVDocumentWrapper *)&v4 dealloc];
}

- (void)ozxDocument
{
  return self->_ozxDocument;
}

@end