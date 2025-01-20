@interface AEPdfCacheObject
- (AEPdfCacheObject)initWithPdfDocument:(id)a3;
- (NSUndoManager)pdfUndoManager;
- (PDFDocument)document;
- (void)setDocument:(id)a3;
- (void)setPdfUndoManager:(id)a3;
@end

@implementation AEPdfCacheObject

- (AEPdfCacheObject)initWithPdfDocument:(id)a3
{
  id v5 = a3;
  v6 = [(AEPdfCacheObject *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_document, a3);
  }

  return v7;
}

- (NSUndoManager)pdfUndoManager
{
  pdfUndoManager = self->_pdfUndoManager;
  if (!pdfUndoManager)
  {
    v4 = (NSUndoManager *)objc_opt_new();
    id v5 = self->_pdfUndoManager;
    self->_pdfUndoManager = v4;

    pdfUndoManager = self->_pdfUndoManager;
  }

  return pdfUndoManager;
}

- (PDFDocument)document
{
  return self->_document;
}

- (void)setDocument:(id)a3
{
}

- (void)setPdfUndoManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pdfUndoManager, 0);

  objc_storeStrong((id *)&self->_document, 0);
}

@end