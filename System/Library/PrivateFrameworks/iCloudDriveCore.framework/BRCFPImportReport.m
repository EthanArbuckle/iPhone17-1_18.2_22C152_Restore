@interface BRCFPImportReport
- (BRCFPImportReport)init;
- (FPImportProgressReport)fpReport;
- (NSError)importError;
- (void)setFpReport:(id)a3;
- (void)setImportError:(id)a3;
@end

@implementation BRCFPImportReport

- (BRCFPImportReport)init
{
  v7.receiver = self;
  v7.super_class = (Class)BRCFPImportReport;
  v2 = [(BRCFPImportReport *)&v7 init];
  v3 = v2;
  if (v2)
  {
    importError = v2->_importError;
    v2->_importError = 0;

    fpReport = v3->_fpReport;
    v3->_fpReport = 0;
  }
  return v3;
}

- (NSError)importError
{
  return self->_importError;
}

- (void)setImportError:(id)a3
{
}

- (FPImportProgressReport)fpReport
{
  return self->_fpReport;
}

- (void)setFpReport:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fpReport, 0);
  objc_storeStrong((id *)&self->_importError, 0);
}

@end