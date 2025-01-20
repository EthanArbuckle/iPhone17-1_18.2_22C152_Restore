@interface SSUCompressionUtils
+ (BOOL)_compressArchiveForData:(id)a3 outputFileURL:(id)a4 error:(id *)a5;
+ (BOOL)compressArchiveForSSUFile:(id)a3 outputFileURL:(id)a4 error:(id *)a5;
+ (BOOL)compressArchiveForSSUFileURL:(id)a3 outputFileURL:(id)a4 error:(id *)a5;
+ (BOOL)decompressFromCompressedSSUFilePath:(id)a3 outputFileURL:(id)a4 error:(id *)a5;
+ (id)SSUFileFromCompressedSSUFilePath:(id)a3 error:(id *)a4;
+ (id)_dataFromCompressedSSUFilePath:(id)a3 error:(id *)a4;
@end

@implementation SSUCompressionUtils

+ (id)SSUFileFromCompressedSSUFilePath:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [(id)objc_opt_class() _dataFromCompressedSSUFilePath:v5 error:a4];

  id v7 = [[FLTSSUFile alloc] initAndVerifyWithFlatbuffData:v6];
  return v7;
}

+ (BOOL)decompressFromCompressedSSUFilePath:(id)a3 outputFileURL:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  id v17 = 0;
  v9 = [(id)objc_opt_class() _dataFromCompressedSSUFilePath:v8 error:&v17];

  id v10 = v17;
  v11 = v10;
  if (v9)
  {
    id v16 = 0;
    char v12 = [v9 writeToURL:v7 options:1 error:&v16];
    id v13 = v16;
    v14 = v13;
    if (a5 && (v12 & 1) == 0) {
      *a5 = v13;
    }
  }
  else
  {
    char v12 = 0;
    if (a5) {
      *a5 = v10;
    }
  }

  return v12;
}

+ (id)_dataFromCompressedSSUFilePath:(id)a3 error:(id *)a4
{
  id v14 = 0;
  id v5 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:a3 options:1 error:&v14];
  id v6 = v14;
  id v7 = v6;
  if (v5)
  {
    id v13 = 0;
    id v8 = [v5 decompressedDataUsingAlgorithm:0 error:&v13];
    id v9 = v13;
    id v10 = v9;
    if (v8)
    {
      id v11 = v8;
    }
    else if (a4)
    {
      *a4 = v9;
    }
  }
  else
  {
    id v8 = 0;
    if (a4) {
      *a4 = v6;
    }
  }

  return v8;
}

+ (BOOL)compressArchiveForSSUFileURL:(id)a3 outputFileURL:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v13 = 0;
  id v8 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:a3 options:1 error:&v13];
  id v9 = v13;
  id v10 = v9;
  if (v8)
  {
    char v11 = [(id)objc_opt_class() _compressArchiveForData:v8 outputFileURL:v7 error:a5];
  }
  else
  {
    char v11 = 0;
    if (v9) {
      *a5 = v9;
    }
  }

  return v11;
}

+ (BOOL)compressArchiveForSSUFile:(id)a3 outputFileURL:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_opt_class();
  id v10 = [v8 flatbuffData];

  LOBYTE(a5) = [v9 _compressArchiveForData:v10 outputFileURL:v7 error:a5];
  return (char)a5;
}

+ (BOOL)_compressArchiveForData:(id)a3 outputFileURL:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v16 = 0;
  id v8 = [a3 compressedDataUsingAlgorithm:0 error:&v16];
  id v9 = v16;
  id v10 = v9;
  if (v8)
  {
    id v15 = 0;
    char v11 = [v8 writeToURL:v7 options:1 error:&v15];
    id v12 = v15;
    id v13 = v12;
    if (a5 && (v11 & 1) == 0) {
      *a5 = v12;
    }
  }
  else
  {
    char v11 = 0;
    if (a5) {
      *a5 = v9;
    }
  }

  return v11;
}

@end