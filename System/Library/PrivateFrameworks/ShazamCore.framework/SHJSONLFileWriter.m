@interface SHJSONLFileWriter
+ (id)dataForJSONObject:(id)a3 error:(id *)a4;
+ (id)dataForJSONObjects:(id)a3 compression:(int)a4 error:(id *)a5;
+ (int64_t)dataCompressionFromAlgorithm:(int)a3;
- (BOOL)closeWithError:(id *)a3;
- (BOOL)writeObject:(id)a3 error:(id *)a4;
- (NSURL)destination;
- (SHDataStream)outputStream;
- (SHJSONLFileWriter)initWithDestination:(id)a3 compression:(int)a4;
- (id)streamForWritingToURL:(id)a3 withCompression:(int)a4;
- (void)linkDataStream:(id)a3;
@end

@implementation SHJSONLFileWriter

- (SHJSONLFileWriter)initWithDestination:(id)a3 compression:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SHJSONLFileWriter;
  v8 = [(SHJSONLFileWriter *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_destination, a3);
    uint64_t v10 = [(SHJSONLFileWriter *)v9 streamForWritingToURL:v9->_destination withCompression:v4];
    outputStream = v9->_outputStream;
    v9->_outputStream = (SHDataStream *)v10;
  }
  return v9;
}

- (BOOL)writeObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(id)objc_opt_class() dataForJSONObject:v6 error:a4];

  if (v7)
  {
    v8 = [(SHJSONLFileWriter *)self outputStream];
    char v9 = [v8 processData:v7 error:a4];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)closeWithError:(id *)a3
{
  uint64_t v4 = [(SHJSONLFileWriter *)self outputStream];
  LOBYTE(a3) = [v4 closeWithError:a3];

  return (char)a3;
}

+ (int64_t)dataCompressionFromAlgorithm:(int)a3
{
  if (a3 <= 773)
  {
    if ((a3 - 256) < 2) {
      return 1;
    }
    if (a3 == 517) {
      return 3;
    }
LABEL_10:
    uint64_t v14 = v4;
    uint64_t v15 = v3;
    uint64_t v10 = (void *)MEMORY[0x263EFF940];
    uint64_t v11 = *MEMORY[0x263EFF498];
    v12 = objc_msgSend(NSString, "stringWithFormat:", @"The compression type is unsupported", v6, v5, v14, v15, v7, v8);
    id v13 = [v10 exceptionWithName:v11 reason:v12 userInfo:0];

    objc_exception_throw(v13);
  }
  if (a3 != 2049)
  {
    if (a3 == 774) {
      return 2;
    }
    goto LABEL_10;
  }
  return 0;
}

+ (id)dataForJSONObjects:(id)a3 compression:(int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  char v9 = [MEMORY[0x263EFF990] data];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = objc_msgSend(a1, "dataForJSONObject:error:", *(void *)(*((void *)&v19 + 1) + 8 * i), a5, (void)v19);
        if (!v15)
        {

          goto LABEL_12;
        }
        v16 = (void *)v15;
        [v9 appendData:v15];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  if (objc_msgSend(v9, "compressUsingAlgorithm:error:", objc_msgSend(a1, "dataCompressionFromAlgorithm:", v6), a5))id v17 = v9; {
  else
  }
LABEL_12:
    id v17 = 0;

  return v17;
}

+ (id)dataForJSONObject:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x263EFF990] data];
  uint64_t v7 = [MEMORY[0x263F08900] dataWithJSONObject:v5 options:8 error:a4];
  if (v7)
  {
    [v6 appendData:v7];
    id v8 = [@"\n" dataUsingEncoding:4];
    [v6 appendData:v8];

    id v9 = v6;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)streamForWritingToURL:(id)a3 withCompression:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v11[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [[SHDataStreamOutput alloc] initWithDestination:v6];

  if (v4)
  {
    id v8 = [[SHDataCompression alloc] initForCompressionWithAlgorithm:v4];
    v11[0] = v8;
    v11[1] = v7;
    id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
    [(SHJSONLFileWriter *)self linkDataStream:v9];
  }
  else
  {
    id v8 = v7;
  }

  return v8;
}

- (void)linkDataStream:(id)a3
{
  id v7 = a3;
  if ([v7 count])
  {
    unint64_t v3 = 0;
    do
    {
      if (v3 == [v7 count] - 1) {
        break;
      }
      unint64_t v4 = v3 + 1;
      id v5 = [v7 objectAtIndexedSubscript:v3 + 1];
      id v6 = [v7 objectAtIndexedSubscript:v3];
      [v6 setNext:v5];

      unint64_t v3 = v4;
    }
    while ([v7 count] > v4);
  }
}

- (NSURL)destination
{
  return self->_destination;
}

- (SHDataStream)outputStream
{
  return self->_outputStream;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputStream, 0);
  objc_storeStrong((id *)&self->_destination, 0);
}

@end