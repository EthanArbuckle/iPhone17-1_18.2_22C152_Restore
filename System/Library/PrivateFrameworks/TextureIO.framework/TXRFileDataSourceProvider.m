@interface TXRFileDataSourceProvider
- (TXRFileDataSourceProvider)initWithData:(id)a3 bufferAllocator:(id)a4 options:(id)a5 error:(id *)a6;
- (TXRFileDataSourceProvider)initWithURL:(id)a3 bufferAllocator:(id)a4 options:(id)a5 error:(id *)a6;
- (id)provideImageInfoAtLevel:(unint64_t)a3 element:(unint64_t)a4 face:(unint64_t)a5;
- (id)provideTextureInfo;
- (unint64_t)_determineFileType:(id)a3;
- (void)_parseData:(id)a3 bufferAllocator:(id)a4 options:(id)a5 error:(id *)a6;
@end

@implementation TXRFileDataSourceProvider

- (TXRFileDataSourceProvider)initWithURL:(id)a3 bufferAllocator:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v28.receiver = self;
  v28.super_class = (Class)TXRFileDataSourceProvider;
  v13 = [(TXRFileDataSourceProvider *)&v28 init];
  if (v13)
  {
    if ([v10 checkResourceIsReachableAndReturnError:0])
    {
      v14 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E4F14430], QOS_CLASS_DEFAULT, 0);
      dispatch_queue_t v15 = dispatch_queue_create("com.apple.txrtextureloaderfileio", v14);
      fileIOQueue = v13->_fileIOQueue;
      v13->_fileIOQueue = (OS_dispatch_queue *)v15;

      dispatch_semaphore_t v17 = dispatch_semaphore_create(0);
      infoLoaded = v13->_infoLoaded;
      v13->_infoLoaded = (OS_dispatch_semaphore *)v17;

      v19 = v13->_fileIOQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __71__TXRFileDataSourceProvider_initWithURL_bufferAllocator_options_error___block_invoke;
      block[3] = &unk_1E6CA2AC8;
      id v24 = v10;
      v25 = v13;
      id v26 = v11;
      id v27 = v12;
      dispatch_async(v19, block);

      v20 = v24;
LABEL_6:

      goto LABEL_7;
    }
    if (a6)
    {
      v21 = NSString;
      v14 = [v10 lastPathComponent];
      v20 = [v21 stringWithFormat:@"Could not find resource %@ at specified location.", v14];
      _newTXRErrorWithCodeAndErrorString(1, (uint64_t)v20);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
LABEL_7:

  return v13;
}

void __71__TXRFileDataSourceProvider_initWithURL_bufferAllocator_options_error___block_invoke(void *a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  uint64_t v3 = a1[4];
  id v11 = 0;
  v4 = (void *)[v2 initWithContentsOfURL:v3 options:1 error:&v11];
  id v5 = v11;
  v6 = (void *)a1[5];
  uint64_t v7 = a1[6];
  uint64_t v8 = a1[7];
  id v10 = 0;
  [v6 _parseData:v4 bufferAllocator:v7 options:v8 error:&v10];
  id v9 = v10;
}

- (TXRFileDataSourceProvider)initWithData:(id)a3 bufferAllocator:(id)a4 options:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)TXRFileDataSourceProvider;
  id v12 = [(TXRFileDataSourceProvider *)&v23 init];
  if (v12)
  {
    v13 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E4F14430], QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.txrtextureloaderfileio", v13);
    fileIOQueue = v12->_fileIOQueue;
    v12->_fileIOQueue = (OS_dispatch_queue *)v14;

    v16 = v12->_fileIOQueue;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __72__TXRFileDataSourceProvider_initWithData_bufferAllocator_options_error___block_invoke;
    v18[3] = &unk_1E6CA2AC8;
    v19 = v12;
    id v20 = v9;
    id v21 = v10;
    id v22 = v11;
    dispatch_async(v16, v18);
  }
  return v12;
}

id __72__TXRFileDataSourceProvider_initWithData_bufferAllocator_options_error___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v1 = a1[5];
  uint64_t v3 = a1[6];
  uint64_t v4 = a1[7];
  id v6 = 0;
  [v2 _parseData:v1 bufferAllocator:v3 options:v4 error:&v6];
  id result = v6;
  if (result) {
    __72__TXRFileDataSourceProvider_initWithData_bufferAllocator_options_error___block_invoke_cold_1();
  }
  return result;
}

- (unint64_t)_determineFileType:(id)a3
{
  if (+[TXRParserKTX handlesData:a3]) {
    return 1;
  }
  else {
    return 5;
  }
}

- (void)_parseData:(id)a3 bufferAllocator:(id)a4 options:(id)a5 error:(id *)a6
{
  id v18 = a3;
  id v10 = a4;
  id v11 = a5;
  unint64_t v12 = [(TXRFileDataSourceProvider *)self _determineFileType:v18];
  if (v12 == 5)
  {
    v13 = TXRParserImageIO;
  }
  else
  {
    if (v12 != 1) {
      -[TXRFileDataSourceProvider _parseData:bufferAllocator:options:error:]();
    }
    v13 = TXRParserKTX;
  }
  dispatch_queue_t v14 = (TXRParser *)objc_alloc_init(v13);
  parser = self->_parser;
  self->_parser = v14;

  if ([(TXRParser *)self->_parser parseData:v18 bufferAllocator:v10 options:v11 error:a6])
  {
    v16 = [(TXRParser *)self->_parser textureInfo];
    textureInfo = self->_textureInfo;
    self->_textureInfo = v16;

    dispatch_semaphore_signal((dispatch_semaphore_t)self->_infoLoaded);
  }
}

- (id)provideImageInfoAtLevel:(unint64_t)a3 element:(unint64_t)a4 face:(unint64_t)a5
{
  return (id)[(TXRParser *)self->_parser parsedImageAtLevel:a3 element:a4 face:a5];
}

- (id)provideTextureInfo
{
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_infoLoaded, 0xFFFFFFFFFFFFFFFFLL);
  textureInfo = self->_textureInfo;
  return textureInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textureInfo, 0);
  objc_storeStrong((id *)&self->_parser, 0);
  objc_storeStrong((id *)&self->_infoLoaded, 0);
  objc_storeStrong((id *)&self->_fileIOQueue, 0);
  objc_storeStrong((id *)&self->_bufferAllocator, 0);
}

void __72__TXRFileDataSourceProvider_initWithData_bufferAllocator_options_error___block_invoke_cold_1()
{
  __assert_rtn("-[TXRFileDataSourceProvider initWithData:bufferAllocator:options:error:]_block_invoke", "TXRFileDataSourceProvider.m", 91, "!\"TODO: Must be able to return error to dipatching thread\"");
}

- (void)_parseData:bufferAllocator:options:error:.cold.1()
{
}

@end