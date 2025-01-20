@interface WFParentDirectoryUtilities
+ (id)commonRootForFileURLs:(id)a3;
@end

@implementation WFParentDirectoryUtilities

+ (id)commonRootForFileURLs:(id)a3
{
  id v3 = a3;
  v4 = [v3 firstObject];
  v5 = [v4 pathComponents];

  if (v5)
  {
    if ([v3 count] == 1)
    {
      v6 = [v3 firstObject];
      v7 = [v6 URLByDeletingLastPathComponent];
    }
    else
    {
      if ((unint64_t)[v3 count] >= 2)
      {
        unint64_t v8 = 1;
        do
        {
          v9 = [v3 objectAtIndex:v8];
          v10 = [v9 pathComponents];

          unint64_t v11 = [v5 count];
          if ([v10 count] < v11) {
            unint64_t v11 = [v10 count];
          }
          unint64_t v12 = 0;
          if (v11)
          {
            while (1)
            {
              v13 = [v5 objectAtIndex:v12];
              v14 = [v10 objectAtIndex:v12];
              int v15 = [v13 isEqualToString:v14];

              if (!v15) {
                break;
              }
              if (v11 == ++v12)
              {
                unint64_t v12 = v11;
                break;
              }
            }
          }
          if (v12 < [v5 count])
          {
            uint64_t v16 = objc_msgSend(v5, "subarrayWithRange:", 0, v12);

            v5 = (void *)v16;
          }
          uint64_t v17 = [v5 count];

          if (!v17) {
            break;
          }
          ++v8;
        }
        while (v8 < [v3 count]);
      }
      v7 = [MEMORY[0x1E4F1CB10] fileURLWithPathComponents:v5];
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end