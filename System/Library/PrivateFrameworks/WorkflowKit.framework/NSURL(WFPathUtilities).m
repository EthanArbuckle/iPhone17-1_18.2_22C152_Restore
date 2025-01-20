@interface NSURL(WFPathUtilities)
- (id)wf_normalizedFileURLForROSP;
@end

@implementation NSURL(WFPathUtilities)

- (id)wf_normalizedFileURLForROSP
{
  if (([a1 isFileURL] & 1) != 0
    || ([a1 scheme],
        v2 = objc_claimAutoreleasedReturnValue(),
        uint64_t v3 = [v2 length],
        v2,
        !v3))
  {
    v5 = [MEMORY[0x1E4F29088] componentsWithURL:a1 resolvingAgainstBaseURL:1];
    [v5 setScheme:@"file"];
    v6 = [v5 URL];
    v7 = v6;
    if (v6)
    {
      id v30 = 0;
      int v8 = [v6 checkResourceIsReachableAndReturnError:&v30];
      id v9 = v30;
      if (v8)
      {
        id v4 = a1;
      }
      else
      {
        v10 = [MEMORY[0x1E4F28CB8] defaultManager];
        v11 = [v10 URLsForDirectory:1 inDomains:2];
        v12 = [v11 firstObject];

        if (v12)
        {
          v13 = [v12 path];
          v14 = [v13 stringByStandardizingPath];

          v15 = [v7 path];
          v16 = [v15 stringByStandardizingPath];

          if ([v16 hasPrefix:v14])
          {
            v17 = [v7 pathComponents];
            v18 = (void *)[v17 mutableCopy];

            v28 = v18;
            [v18 insertObject:@"/System" atIndex:0];
            v19 = [MEMORY[0x1E4F29088] componentsWithURL:v7 resolvingAgainstBaseURL:1];

            v20 = [NSString pathWithComponents:v18];
            [v19 setPath:v20];

            v21 = [v19 URL];
            id v29 = v9;
            int v22 = [v21 checkResourceIsReachableAndReturnError:&v29];
            v23 = v16;
            v24 = v14;
            id v25 = v29;

            if (v22) {
              v26 = v21;
            }
            else {
              v26 = a1;
            }
            id v4 = v26;

            id v9 = v25;
            v14 = v24;
            v16 = v23;
            v5 = v19;
          }
          else
          {
            id v4 = a1;
          }
        }
        else
        {
          id v4 = a1;
        }
      }
    }
    else
    {
      id v4 = a1;
    }
  }
  else
  {
    id v4 = a1;
  }
  return v4;
}

@end