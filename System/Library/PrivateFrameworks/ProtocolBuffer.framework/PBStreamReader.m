@interface PBStreamReader
+ (id)readProtoBuffersOfClass:(Class)a3 fromFile:(id)a4 error:(id *)a5;
@end

@implementation PBStreamReader

+ (id)readProtoBuffersOfClass:(Class)a3 fromFile:(id)a4 error:(id *)a5
{
  id v7 = a4;
  v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  if ([v8 fileExistsAtPath:v7])
  {
    v9 = [MEMORY[0x1E4F1CA48] array];
    v10 = (void *)MEMORY[0x1AD0EB790]();
    v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v7 options:0 error:a5];
    v12 = v11;
    if (*a5)
    {

      id v13 = 0;
    }
    else
    {
      context = v10;
      v14 = [[PBDataReader alloc] initWithData:v11];
      if ([(PBDataReader *)v14 hasMoreData])
      {
        do
        {
          v15 = (void *)MEMORY[0x1AD0EB790]();
          v16 = [(PBDataReader *)v14 readProtoBuffer];
          if (v16)
          {
            v17 = (void *)[[a3 alloc] initWithData:v16];
            if (v17) {
              [v9 addObject:v17];
            }
          }
        }
        while ([(PBDataReader *)v14 hasMoreData]);
      }
      if ([(PBDataReader *)v14 hasError])
      {
        *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PBRequesterErrorDomain" code:6005 userInfo:0];
      }

      id v13 = v9;
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

@end