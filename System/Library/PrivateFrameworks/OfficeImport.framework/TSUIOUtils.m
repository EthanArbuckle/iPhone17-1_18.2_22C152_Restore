@interface TSUIOUtils
+ (CGDataProvider)newCGDataProviderForInputStream:(id)a3;
+ (CGDataProvider)newCGDataProviderForReadChannel:(id)a3;
+ (void)readAllFromChannel:(id)a3 offset:(int64_t)a4 length:(unint64_t)a5 completion:(id)a6;
@end

@implementation TSUIOUtils

+ (void)readAllFromChannel:(id)a3 offset:(int64_t)a4 length:(unint64_t)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  v11 = v10;
  if (!v9)
  {
    v15 = [NSString stringWithUTF8String:"+[TSUIOUtils readAllFromChannel:offset:length:completion:]"];
    v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUIOUtils.m"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 77, 0, "invalid nil value for '%{public}s'", "readChannel");

    +[OITSUAssertionHandler logBacktraceThrottled];
    if (v11) {
      goto LABEL_3;
    }
LABEL_5:
    v17 = [NSString stringWithUTF8String:"+[TSUIOUtils readAllFromChannel:offset:length:completion:]"];
    v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUIOUtils.m"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 78, 0, "invalid nil value for '%{public}s'", "completion");

    +[OITSUAssertionHandler logBacktraceThrottled];
    goto LABEL_3;
  }
  if (!v10) {
    goto LABEL_5;
  }
LABEL_3:
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__19;
  v22[4] = __Block_byref_object_dispose__19;
  v12 = (void *)MEMORY[0x263EF8388];
  id v13 = MEMORY[0x263EF8388];
  id v23 = v12;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __58__TSUIOUtils_readAllFromChannel_offset_length_completion___block_invoke;
  v19[3] = &unk_264D61F38;
  v21 = v22;
  id v14 = v11;
  id v20 = v14;
  [v9 readFromOffset:a4 length:a5 handler:v19];

  _Block_object_dispose(v22, 8);
}

void __58__TSUIOUtils_readAllFromChannel_offset_length_completion___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  data2 = a3;
  id v7 = a4;
  v8 = *(NSObject **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v8)
  {
    if (v7)
    {
      id v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_8:
      v9();
      uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
      id v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = 0;

      goto LABEL_9;
    }
    if (data2)
    {
      dispatch_data_t concat = dispatch_data_create_concat(v8, data2);
      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
      v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = concat;
    }
    if (a2)
    {
      id v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
      goto LABEL_8;
    }
  }
LABEL_9:
}

+ (CGDataProvider)newCGDataProviderForInputStream:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = a3;
  CFRetain(v3);
  Sequential = CGDataProviderCreateSequential(v3, &TSUIOUtilsCGDataProviderCallbacks);

  return Sequential;
}

+ (CGDataProvider)newCGDataProviderForReadChannel:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  v5 = [[TSUReadChannelInputStreamAdapter alloc] initWithReadChannel:v4];

  if ([(TSUReadChannelInputStreamAdapter *)v5 canSeek])
  {
    v6 = (CGDataProvider *)[a1 newCGDataProviderForInputStream:v5];
  }
  else
  {
    id v7 = [NSString stringWithUTF8String:"+[TSUIOUtils newCGDataProviderForReadChannel:]"];
    v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUIOUtils.m"];
    +[OITSUAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:117 isFatal:0 description:"Need a seekable input stream for CGDataProvider"];

    +[OITSUAssertionHandler logBacktraceThrottled];
    v6 = 0;
  }

  return v6;
}

@end