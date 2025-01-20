@interface KtraceLoggingDataSource
- (BOOL)_skipFirst;
- (KtraceLoggingDataSource)initWithKtraceFile:(ktrace_file *)a3;
- (NSData)_metadata;
- (id)metadataChunk;
- (id)nextEventDataChunk;
- (ktrace_chunk)_nextChunk;
- (ktrace_file)_ktfile;
- (void)dealloc;
- (void)set_ktfile:(ktrace_file *)a3;
- (void)set_metadata:(id)a3;
- (void)set_nextChunk:(ktrace_chunk *)a3;
- (void)set_skipFirst:(BOOL)a3;
@end

@implementation KtraceLoggingDataSource

- (void)dealloc
{
  [(KtraceLoggingDataSource *)self set_metadata:0];
  v3.receiver = self;
  v3.super_class = (Class)KtraceLoggingDataSource;
  [(KtraceLoggingDataSource *)&v3 dealloc];
}

- (KtraceLoggingDataSource)initWithKtraceFile:(ktrace_file *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)KtraceLoggingDataSource;
  v4 = [(KtraceLoggingDataSource *)&v13 init];
  v10 = v4;
  if (v4)
  {
    v4->_ktfile = a3;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __46__KtraceLoggingDataSource_initWithKtraceFile___block_invoke;
    v12[3] = &unk_1E6061E20;
    v12[4] = v4;
    if (ktrace_file_iterate((uint64_t)a3, 0, (uint64_t)v12, v5, v6, v7, v8, v9) || !v10->_metadata)
    {
      [(KtraceLoggingDataSource *)v10 set_metadata:0];
      return 0;
    }
  }
  return v10;
}

BOOL __46__KtraceLoggingDataSource_initWithKtraceFile___block_invoke(uint64_t a1, uint64_t *a2)
{
  int v5 = ktrace_chunk_tag((uint64_t)a2);
  if (v5 == 32786)
  {
    size_t v6 = ktrace_chunk_size_t(a2, v4);
    uint64_t v7 = malloc_type_malloc(v6, 0x21B70593uLL);
    if (!v7) {
      ktrace_postprocess_file_internal_cold_1();
    }
    uint64_t v8 = v7;
    if (ktrace_chunk_copy_data(a2, 0, v7, v6)) {
      free(v8);
    }
    else {
      objc_msgSend(*(id *)(a1 + 32), "set_metadata:", objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:", v8, v6));
    }
  }
  return v5 != 32786;
}

- (id)nextEventDataChunk
{
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3052000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  uint64_t v18 = 0;
  ktfile = self->_ktfile;
  nextChunk = self->_nextChunk;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __45__KtraceLoggingDataSource_nextEventDataChunk__block_invoke;
  v12[3] = &unk_1E6061E48;
  v12[4] = self;
  void v12[5] = &v13;
  int v9 = ktrace_file_iterate((uint64_t)ktfile, nextChunk, (uint64_t)v12, v2, v3, v4, v5, v6);
  v10 = (void *)v14[5];
  if (v9)
  {

    v10 = 0;
    v14[5] = 0;
  }
  _Block_object_dispose(&v13, 8);
  return v10;
}

uint64_t __45__KtraceLoggingDataSource_nextEventDataChunk__block_invoke(uint64_t a1, uint64_t *a2)
{
  *(void *)(*(void *)(a1 + 32) + 24) = a2;
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 8))
  {
    *(unsigned char *)(v2 + 8) = 0;
    return 1;
  }
  if (ktrace_chunk_tag((uint64_t)a2) != 32785) {
    return 1;
  }
  size_t v6 = ktrace_chunk_size_t(a2, v5);
  uint64_t v7 = malloc_type_malloc(v6, 0x20EE61B2uLL);
  if (!v7) {
    ktrace_postprocess_file_internal_cold_1();
  }
  uint64_t v8 = v7;
  if (ktrace_chunk_copy_data(a2, 0, v7, v6))
  {
    free(v8);
    return 0;
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v8 length:v6];
    uint64_t result = 0;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v10;
    *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  }
  return result;
}

- (id)metadataChunk
{
  return self->_metadata;
}

- (ktrace_file)_ktfile
{
  return self->_ktfile;
}

- (void)set_ktfile:(ktrace_file *)a3
{
  self->_ktfile = a3;
}

- (ktrace_chunk)_nextChunk
{
  return self->_nextChunk;
}

- (void)set_nextChunk:(ktrace_chunk *)a3
{
  self->_nextChunk = a3;
}

- (NSData)_metadata
{
  return self->_metadata;
}

- (void)set_metadata:(id)a3
{
}

- (BOOL)_skipFirst
{
  return self->_skipFirst;
}

- (void)set_skipFirst:(BOOL)a3
{
  self->_skipFirst = a3;
}

@end