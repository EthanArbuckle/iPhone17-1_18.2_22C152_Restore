@interface TSUContainedZipArchive
+ (id)zipArchiveFromEntry:(id)a3 zipArchive:(id)a4 options:(unint64_t)a5 error:(id *)a6;
- (BOOL)isValid;
- (TSUContainedZipArchive)initWithEntry:(id)a3 zipArchive:(id)a4 options:(unint64_t)a5;
- (id)newArchiveReadChannel;
- (id)readChannelForEntry:(id)a3 validateCRC:(BOOL)a4;
- (id)streamReadChannelForEntry:(id)a3 validateCRC:(BOOL)a4;
- (unint64_t)archiveLength;
@end

@implementation TSUContainedZipArchive

+ (id)zipArchiveFromEntry:(id)a3 zipArchive:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__9;
  v34 = __Block_byref_object_dispose__9;
  id v35 = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__9;
  v28 = __Block_byref_object_dispose__9;
  id v29 = 0;
  v12 = (void *)[objc_alloc((Class)a1) initWithEntry:v10 zipArchive:v11 options:a5];
  if (v12)
  {
    dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
    v14 = dispatch_get_global_queue(0, 0);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __71__TSUContainedZipArchive_zipArchiveFromEntry_zipArchive_options_error___block_invoke;
    v20[3] = &unk_264D61568;
    v22 = &v30;
    v23 = &v24;
    v15 = v13;
    v21 = v15;
    [v12 readArchiveWithQueue:v14 completion:v20];
    dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
  }
  if (a6 && !v31[5])
  {
    v16 = (void *)v25[5];
    if (v16)
    {
      *a6 = v16;
    }
    else
    {
      objc_msgSend(MEMORY[0x263F087E8], "tsu_fileReadUnknownErrorWithUserInfo:", 0);
      id v17 = objc_claimAutoreleasedReturnValue();
      *a6 = v17;
    }
  }
  id v18 = (id)v31[5];

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v18;
}

void __71__TSUContainedZipArchive_zipArchiveFromEntry_zipArchive_options_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (TSUContainedZipArchive)initWithEntry:(id)a3 zipArchive:(id)a4 options:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = v10;
  id v12 = 0;
  if (v9 && v10)
  {
    v16.receiver = self;
    v16.super_class = (Class)TSUContainedZipArchive;
    dispatch_semaphore_t v13 = [(TSUZipArchive *)&v16 initWithOptions:a5];
    p_isa = (id *)&v13->super.super.isa;
    if (v13)
    {
      objc_storeStrong((id *)&v13->_zipArchive, a4);
      objc_storeStrong(p_isa + 6, a3);
    }
    self = p_isa;
    id v12 = self;
  }

  return v12;
}

- (id)readChannelForEntry:(id)a3 validateCRC:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)TSUContainedZipArchive;
  v4 = [(TSUZipArchive *)&v6 readChannelForEntry:a3 validateCRC:0];
  return v4;
}

- (id)streamReadChannelForEntry:(id)a3 validateCRC:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)TSUContainedZipArchive;
  v4 = [(TSUZipArchive *)&v6 streamReadChannelForEntry:a3 validateCRC:0];
  return v4;
}

- (unint64_t)archiveLength
{
  return [(TSUZipEntry *)self->_entry size];
}

- (id)newArchiveReadChannel
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isValid
{
  return [(TSUZipArchive *)self->_zipArchive isValid];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entry, 0);
  objc_storeStrong((id *)&self->_zipArchive, 0);
}

@end