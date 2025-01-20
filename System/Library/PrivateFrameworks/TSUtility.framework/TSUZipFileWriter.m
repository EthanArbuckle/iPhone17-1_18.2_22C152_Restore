@interface TSUZipFileWriter
+ (void)zipDirectoryAtURL:(id)a3 toURL:(id)a4 queue:(id)a5 completion:(id)a6;
- (TSUZipFileWriter)initWithURL:(id)a3;
- (id)writeChannel;
@end

@implementation TSUZipFileWriter

- (TSUZipFileWriter)initWithURL:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TSUZipFileWriter;
  v5 = [(TSUZipWriter *)&v10 init];
  if (v5)
  {
    v6 = [[TSUFileIOChannel alloc] initForRandomWritingURL:v4];
    writeChannel = v5->_writeChannel;
    v5->_writeChannel = v6;

    v8 = v5->_writeChannel;
    if (v8)
    {
      [(TSURandomWriteChannel *)v8 setLowWater:-1];
    }
    else
    {

      v5 = 0;
    }
  }

  return v5;
}

+ (void)zipDirectoryAtURL:(id)a3 toURL:(id)a4 queue:(id)a5 completion:(id)a6
{
  v62[1] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v45 = a5;
  id v43 = a6;
  v44 = v10;
  v46 = v9;
  if (v9)
  {
    if (v10) {
      goto LABEL_6;
    }
  }
  else
  {
    v11 = +[TSUAssertionHandler currentHandler];
    v12 = [NSString stringWithUTF8String:"+[TSUZipFileWriter zipDirectoryAtURL:toURL:queue:completion:]"];
    v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipFileWriter.m"];
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, v13, 45, @"invalid nil value for '%s'", "directoryURL");

    id v10 = v44;
    if (v44) {
      goto LABEL_6;
    }
  }
  v14 = +[TSUAssertionHandler currentHandler];
  v15 = [NSString stringWithUTF8String:"+[TSUZipFileWriter zipDirectoryAtURL:toURL:queue:completion:]"];
  v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipFileWriter.m"];
  objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, v16, 46, @"invalid nil value for '%s'", "URL");

  id v10 = v44;
LABEL_6:
  if (!v45)
  {
    v17 = +[TSUAssertionHandler currentHandler];
    v18 = [NSString stringWithUTF8String:"+[TSUZipFileWriter zipDirectoryAtURL:toURL:queue:completion:]"];
    v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipFileWriter.m"];
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, v19, 47, @"invalid nil value for '%s'", "queue");

    id v10 = v44;
  }
  if (!v43)
  {
    v20 = +[TSUAssertionHandler currentHandler];
    v21 = [NSString stringWithUTF8String:"+[TSUZipFileWriter zipDirectoryAtURL:toURL:queue:completion:]"];
    v22 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipFileWriter.m"];
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, v22, 48, @"invalid nil value for '%s'", "completion");

    id v10 = v44;
  }
  v48 = [[TSUZipFileWriter alloc] initWithURL:v10];
  v23 = [v9 path];
  v24 = [v23 stringByDeletingLastPathComponent];
  v42 = [v24 stringByStandardizingPath];

  uint64_t v25 = [v42 length];
  v26 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v27 = *MEMORY[0x263EFF6A8];
  v62[0] = *MEMORY[0x263EFF6A8];
  v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v62 count:1];
  v29 = [v26 enumeratorAtURL:v46 includingPropertiesForKeys:v28 options:0 errorHandler:0];

  v59[0] = 0;
  v59[1] = v59;
  v59[2] = 0x2020000000;
  char v60 = 1;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id obj = v29;
  uint64_t v30 = [obj countByEnumeratingWithState:&v55 objects:v61 count:16];
  if (v30)
  {
    uint64_t v31 = *(void *)v56;
    uint64_t v47 = v25 + 1;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v56 != v31) {
          objc_enumerationMutation(obj);
        }
        v33 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        id v54 = 0;
        int v34 = [v33 getResourceValue:&v54 forKey:v27 error:0];
        id v35 = v54;
        v36 = v35;
        if (v34)
        {
          if ([v35 BOOLValue]) {
            goto LABEL_20;
          }
          v37 = [v33 path];
          v38 = [v37 stringByStandardizingPath];

          v39 = [v38 substringFromIndex:v47];
          id v40 = [[TSUFileIOChannel alloc] initForReadingURL:v33];
          v53[0] = MEMORY[0x263EF8330];
          v53[1] = 3221225472;
          v53[2] = __61__TSUZipFileWriter_zipDirectoryAtURL_toURL_queue_completion___block_invoke;
          v53[3] = &unk_26462A9D0;
          v53[4] = v59;
          [(TSUZipWriter *)v48 writeEntryWithName:v39 fromReadChannel:v40 completion:v53];
        }
        else
        {
          v38 = +[TSUAssertionHandler currentHandler];
          v39 = [NSString stringWithUTF8String:"+[TSUZipFileWriter zipDirectoryAtURL:toURL:queue:completion:]"];
          id v40 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipFileWriter.m"];
          [v38 handleFailureInFunction:v39, v40, 80, @"Failed to obtain resource value for %@", v33 file lineNumber description];
        }

LABEL_20:
      }
      uint64_t v30 = [obj countByEnumeratingWithState:&v55 objects:v61 count:16];
    }
    while (v30);
  }

  v50[0] = MEMORY[0x263EF8330];
  v50[1] = 3221225472;
  v50[2] = __61__TSUZipFileWriter_zipDirectoryAtURL_toURL_queue_completion___block_invoke_2;
  v50[3] = &unk_26462A9F8;
  id v41 = v43;
  id v51 = v41;
  v52 = v59;
  [(TSUZipWriter *)v48 closeWithQueue:v45 completion:v50];

  _Block_object_dispose(v59, 8);
}

uint64_t __61__TSUZipFileWriter_zipDirectoryAtURL_toURL_queue_completion___block_invoke(uint64_t result, char a2)
{
  if ((a2 & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
  }
  return result;
}

uint64_t __61__TSUZipFileWriter_zipDirectoryAtURL_toURL_queue_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == 0;
  }
  uint64_t v4 = !v3;
  return (*(uint64_t (**)(void, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v4, a2);
}

- (id)writeChannel
{
  return self->_writeChannel;
}

- (void).cxx_destruct
{
}

@end