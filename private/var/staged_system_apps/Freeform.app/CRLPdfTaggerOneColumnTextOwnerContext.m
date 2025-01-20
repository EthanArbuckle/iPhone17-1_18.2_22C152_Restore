@interface CRLPdfTaggerOneColumnTextOwnerContext
- (CRLPdfTaggerOneColumnTextOwnerContext)initWithStateOfTagger:(id)a3 textColumn:(id)a4 limitSelection:(id)a5;
- (CRLWPColumn)textColumn;
- (void)setTextColumn:(id)a3;
@end

@implementation CRLPdfTaggerOneColumnTextOwnerContext

- (CRLPdfTaggerOneColumnTextOwnerContext)initWithStateOfTagger:(id)a3 textColumn:(id)a4 limitSelection:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v16 = v9;
  v11 = +[NSArray arrayWithObjects:&v16 count:1];
  v12 = [v9 storage];
  v15.receiver = self;
  v15.super_class = (Class)CRLPdfTaggerOneColumnTextOwnerContext;
  v13 = [(CRLPdfTaggerTextColumnOwnerContext *)&v15 initWithStateOfTagger:v8 columns:v11 storage:v12 limitSelection:v10];

  if (v13) {
    objc_storeStrong((id *)&v13->_textColumn, a4);
  }

  return v13;
}

- (CRLWPColumn)textColumn
{
  return (CRLWPColumn *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTextColumn:(id)a3
{
}

- (void).cxx_destruct
{
}

@end