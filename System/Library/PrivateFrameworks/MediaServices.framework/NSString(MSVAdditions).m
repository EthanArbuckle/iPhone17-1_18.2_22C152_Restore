@interface NSString(MSVAdditions)
- (id)msv_stringByResolvingRealPath;
- (unint64_t)msv_unsignedLongLongValue;
@end

@implementation NSString(MSVAdditions)

- (id)msv_stringByResolvingRealPath
{
  v2 = (void *)[a1 copy];
  v3 = realpath_DARWIN_EXTSN((const char *)[a1 fileSystemRepresentation], 0);
  if (v3)
  {
    v4 = v3;
    uint64_t v5 = [NSString stringWithUTF8String:v3];

    free(v4);
    v2 = (void *)v5;
  }
  else
  {
    v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
    v7 = (void *)[v2 copy];
    v8 = v7;
    while ([v7 length])
    {
      v9 = v8;
      v10 = [v8 lastPathComponent];
      v8 = [v8 stringByDeletingLastPathComponent];

      [v6 addObject:v10];
      if ([v8 length])
      {
        id v11 = v8;
        v12 = realpath_DARWIN_EXTSN((const char *)[v11 fileSystemRepresentation], 0);
        if (v12)
        {
          v13 = v12;
          uint64_t v17 = 0;
          v18 = &v17;
          uint64_t v19 = 0x3032000000;
          v20 = __Block_byref_object_copy__3651;
          v21 = __Block_byref_object_dispose__3652;
          id v22 = [NSString stringWithUTF8String:v12];
          v16[0] = MEMORY[0x1E4F143A8];
          v16[1] = 3221225472;
          v16[2] = __55__NSString_MSVAdditions__msv_stringByResolvingRealPath__block_invoke;
          v16[3] = &unk_1E5ADA1B8;
          v16[4] = &v17;
          [v6 enumerateObjectsWithOptions:2 usingBlock:v16];
          id v14 = (id)v18[5];

          free(v13);
          _Block_object_dispose(&v17, 8);

          v8 = v11;
          v2 = v14;
          break;
        }
      }

      v7 = v8;
    }
  }
  return v2;
}

- (unint64_t)msv_unsignedLongLongValue
{
  v1 = (const char *)[a1 UTF8String];
  return strtoull(v1, 0, 0);
}

@end