@interface SHJSONLFileReader
- (BOOL)loadData:(id)a3 withCompression:(int)a4 error:(id *)a5;
- (BOOL)loadDataFromURL:(id)a3 error:(id *)a4;
- (BOOL)loadDataFromURL:(id)a3 withCompression:(int)a4 error:(id *)a5;
- (SHJSONLDataDetokenizerDelegate)delegate;
- (id)inputForAlgorithm:(int)a3 error:(id *)a4;
- (void)setDelegate:(id)a3;
@end

@implementation SHJSONLFileReader

- (BOOL)loadDataFromURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  LOBYTE(a4) = [(SHJSONLFileReader *)self loadDataFromURL:v6 withCompression:+[SHDataCompression supportedCompressionTypeFromFileURL:v6] error:a4];

  return (char)a4;
}

- (BOOL)loadData:(id)a3 withCompression:(int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  v9 = [(SHJSONLFileReader *)self inputForAlgorithm:v6 error:a5];
  LOBYTE(a5) = [v9 processData:v8 error:a5];

  [v9 closeWithError:0];
  return (char)a5;
}

- (BOOL)loadDataFromURL:(id)a3 withCompression:(int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  v9 = [(SHJSONLFileReader *)self inputForAlgorithm:v6 error:a5];
  LOBYTE(a5) = [v9 loadDataFromURL:v8 error:a5];

  [v9 closeWithError:0];
  return (char)a5;
}

- (id)inputForAlgorithm:(int)a3 error:(id *)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v6 = objc_alloc_init(SHDataStreamInput);
  v7 = objc_alloc_init(SHJSONLDataDetokenizer);
  id v8 = [(SHJSONLFileReader *)self delegate];
  [(SHJSONLDataDetokenizer *)v7 setDelegate:v8];

  if (v4)
  {
    id v9 = [[SHDataCompression alloc] initForDecompressionWithAlgorithm:v4];
    [v9 setNext:v7];
    [(SHDataStreamInput *)v6 setNext:v9];
  }
  else
  {
    [(SHDataStreamInput *)v6 setNext:v7];
  }

  return v6;
}

- (SHJSONLDataDetokenizerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SHJSONLDataDetokenizerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end