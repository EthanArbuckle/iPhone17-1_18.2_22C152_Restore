@interface SUManagerScanRequest
- (NSError)error;
- (SUCoreScanResults)results;
- (SUScanOptions)options;
- (id)callback;
- (void)setCallback:(id)a3;
- (void)setError:(id)a3;
- (void)setOptions:(id)a3;
- (void)setResults:(id)a3;
@end

@implementation SUManagerScanRequest

- (SUScanOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
}

- (SUCoreScanResults)results
{
  return self->_results;
}

- (void)setResults:(id)a3
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
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end