@interface NSMutableArray(OSABinaryImageListExtension)
- (void)addImage:()OSABinaryImageListExtension address:size:;
- (void)addImageLegacy:()OSABinaryImageListExtension address:size:name:path:arch:;
- (void)sortByAddressAndSetInferredSizes;
@end

@implementation NSMutableArray(OSABinaryImageListExtension)

- (void)addImage:()OSABinaryImageListExtension address:size:
{
  v6 = [[OSABinaryImageSegment alloc] initWithAddress:a4 size:a5 for:a3];
  [a1 addObject:v6];
}

- (void)addImageLegacy:()OSABinaryImageListExtension address:size:name:path:arch:
{
  v21 = [[OSABinaryImageSegment alloc] initWithAddress:a4 size:a5 for:a3];
  if (a6)
  {
    v12 = [NSString stringWithUTF8String:a6];
    v13 = [(OSABinaryImageSegment *)v21 symbolInfo];
    [v13 setName:v12];
  }
  if (a7)
  {
    v14 = [(OSABinaryImageSegment *)v21 symbolInfo];
    v15 = [NSString stringWithUTF8String:a7];
    [v14 setPath:v15];
  }
  if (a8)
  {
    uint64_t v16 = [NSString stringWithUTF8String:a8];
    v17 = [(OSABinaryImageSegment *)v21 symbolInfo];
    v18 = (void *)v17[3];
    v17[3] = v16;

    v19 = [NSString stringWithUTF8String:a8];
    v20 = [(OSABinaryImageSegment *)v21 symbolInfo];
    [v20 setCpuArch:v19];
  }
  [a1 addObject:v21];
}

- (void)sortByAddressAndSetInferredSizes
{
  uint64_t v2 = [a1 count];
  if (v2)
  {
    uint64_t v3 = v2;
    [a1 sortUsingComparator:&__block_literal_global_8];
    v4 = [a1 firstObject];
    v5 = v4;
    if (v3 == 1)
    {
      id v18 = v4;
      [v4 symbolInfo];
    }
    else
    {
      for (uint64_t i = 1; i != v3; ++i)
      {
        id v18 = [a1 objectAtIndexedSubscript:i];
        v7 = [v5 symbolInfo];
        uint64_t v8 = [v7 size];

        if (!v8)
        {
          v9 = [v18 symbolInfo];
          uint64_t v10 = [v9 start];
          v11 = [v5 symbolInfo];
          unint64_t v12 = v10 - [v11 start];

          if (v12 >= 0x40000000) {
            uint64_t v13 = 0x40000000;
          }
          else {
            uint64_t v13 = v12;
          }
          v14 = [v5 symbolInfo];
          [v14 setSize:v13];
        }
        v5 = v18;
      }
      [v18 symbolInfo];
    v15 = };
    uint64_t v16 = [v15 size];

    if (!v16)
    {
      v17 = [v18 symbolInfo];
      [v17 setSize:0x40000000];
    }
  }
}

@end