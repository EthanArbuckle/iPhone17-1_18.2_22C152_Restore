@interface ULDiagnosticsDatabaseExportResponse
- (NSArray)exportedURLs;
- (NSError)error;
- (void)setError:(id)a3;
- (void)setExportedURLs:(id)a3;
@end

@implementation ULDiagnosticsDatabaseExportResponse

- (NSArray)exportedURLs
{
  return self->_exportedURLs;
}

- (void)setExportedURLs:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_exportedURLs, 0);
}

@end