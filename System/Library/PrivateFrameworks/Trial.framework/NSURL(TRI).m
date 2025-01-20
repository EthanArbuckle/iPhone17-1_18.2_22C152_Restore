@interface NSURL(TRI)
+ (id)triContainerURLWithPath:()TRI containerId:containerType:;
+ (id)triParseURLFromString:()TRI isDirectory:;
+ (uint64_t)triParseURLFromString:()TRI;
- (__CFString)triSaveURLToString;
- (id)triPathAsOwner:()TRI;
- (id)triURLByResolvingSymlinksInPathIncludingPrivate;
- (uint64_t)triIsContainerURL;
- (uint64_t)triIsEqual:()TRI;
@end

@implementation NSURL(TRI)

- (id)triPathAsOwner:()TRI
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = [a1 relativePath];
  if (([a1 triIsContainerURL] & 1) == 0) {
    goto LABEL_11;
  }
  uint64_t v6 = [a1 host];
  if (!v6) {
    goto LABEL_11;
  }
  v7 = (void *)v6;
  v8 = [a1 port];

  if (!v8) {
    goto LABEL_11;
  }
  v9 = [a1 port];
  uint64_t v10 = [v9 integerValue];

  if (v10)
  {
    v11 = [a1 host];
    v12 = +[TRIAppContainer containerWithIdentifier:v11 type:v10];

    if ((unint64_t)[v5 length] >= 2 && objc_msgSend(v5, "isAbsolutePath"))
    {
      uint64_t v13 = [v5 substringFromIndex:1];

      id v5 = (id)v13;
    }
    if (v5)
    {
      if (a3) {
        [v12 containerURLAsOwner];
      }
      else {
      v16 = [v12 containerURL];
      }
      v17 = [v16 path];

      if (v17)
      {
        v18 = NSString;
        v19 = [v16 path];
        v23[0] = v19;
        v23[1] = v5;
        v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
        v21 = [v18 pathWithComponents:v20];

        id v5 = v21;
        v14 = v5;
      }
      else
      {
        v22 = TRILogCategory_ClientFramework();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v25 = a1;
          _os_log_error_impl(&dword_19D909000, v22, OS_LOG_TYPE_ERROR, "triPathAsOwner: unable to resolve containerDir for URL: %@", buf, 0xCu);
        }

        v14 = 0;
      }
    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
LABEL_11:
    id v5 = v5;
    v14 = v5;
  }

  return v14;
}

+ (id)triParseURLFromString:()TRI isDirectory:
{
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F1CB10] URLWithString:v5];
  v7 = [v6 scheme];

  if (!v7)
  {
    v8 = (void *)MEMORY[0x1E4F1CB10];
    v9 = [MEMORY[0x1E4F1CB10] URLWithString:@"file:///"];
    uint64_t v10 = [v8 fileURLWithPath:v5 isDirectory:a4 relativeToURL:v9];

    uint64_t v6 = (void *)v10;
  }

  return v6;
}

- (uint64_t)triIsContainerURL
{
  v2 = [a1 scheme];
  if (v2)
  {
    v3 = [a1 scheme];
    uint64_t v4 = [v3 isEqualToString:@"container"];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

+ (uint64_t)triParseURLFromString:()TRI
{
  return [a1 triParseURLFromString:a3 isDirectory:0];
}

- (__CFString)triSaveURLToString
{
  v22[2] = *MEMORY[0x1E4F143B8];
  if ([a1 isFileURL])
  {
    uint64_t v4 = [a1 relativePath];
    id v5 = (void *)v4;
    uint64_t v6 = &stru_1EEFB6D68;
    if (v4) {
      uint64_t v6 = (__CFString *)v4;
    }
    v7 = v6;

    if (([(__CFString *)v7 isAbsolutePath] & 1) == 0)
    {
      uint64_t v8 = [a1 baseURL];
      if (v8)
      {
        v9 = (void *)v8;
        uint64_t v10 = [a1 baseURL];
        if ([v10 isFileURL])
        {
          v11 = [a1 baseURL];
          v12 = [v11 relativePath];
          char v13 = [v12 isEqualToString:@"/"];

          if (v13) {
            goto LABEL_11;
          }
        }
        else
        {
        }
        v16 = NSString;
        v17 = [a1 baseURL];
        v18 = [v17 triSaveURLToString];
        v22[0] = v18;
        v22[1] = v7;
        v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
        uint64_t v20 = [v16 pathWithComponents:v19];

        v7 = (__CFString *)v20;
      }
    }
  }
  else
  {
    v7 = [a1 absoluteString];
    if (!v7)
    {
      v21 = [MEMORY[0x1E4F28B00] currentHandler];
      [v21 handleFailureInMethod:a2, a1, @"NSURL+TRI.m", 43, @"Failed to compute absolute string for URL: %@", a1 object file lineNumber description];

      v7 = 0;
    }
  }
LABEL_11:
  if ([(__CFString *)v7 hasPrefix:@"./"])
  {
    uint64_t v14 = [(__CFString *)v7 substringFromIndex:2];

    v7 = (__CFString *)v14;
  }
  return v7;
}

- (uint64_t)triIsEqual:()TRI
{
  id v4 = a3;
  if ([a1 isEqual:v4])
  {
    uint64_t v5 = 1;
  }
  else
  {
    id v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v7 = [a1 triSaveURLToString];
      uint64_t v8 = [v6 triSaveURLToString];
      uint64_t v5 = [v7 isEqualToString:v8];
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  return v5;
}

+ (id)triContainerURLWithPath:()TRI containerId:containerType:
{
  id v7 = a4;
  id v8 = a3;
  int v9 = [v8 isAbsolutePath];
  if (a5 && v7 && !v9)
  {
    uint64_t v10 = [NSString stringWithFormat:@"%@://%@:%d/%@", @"container", v7, a5, v8];

    v11 = [MEMORY[0x1E4F1CB10] URLWithString:v10];
    id v8 = (id)v10;
  }
  else
  {
    v11 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v8];
  }

  return v11;
}

- (id)triURLByResolvingSymlinksInPathIncludingPrivate
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v5 = [a1 URLByResolvingSymlinksInPath];
  id v6 = v5;
  if (!v5)
  {
    id v20 = 0;
    goto LABEL_14;
  }
  id v7 = [v5 pathComponents];
  id v8 = [v7 firstObject];
  if ([v8 isEqualToString:@"/"])
  {
    unint64_t v9 = [v7 count];

    if (v9 >= 2)
    {
      uint64_t v10 = objc_msgSend(v7, "subarrayWithRange:", 2, objc_msgSend(v7, "count") - 2);
      v11 = (void *)MEMORY[0x1E4F1CB10];
      v12 = [v7 objectAtIndexedSubscript:0];
      v24[0] = v12;
      char v13 = [v7 objectAtIndexedSubscript:1];
      v24[1] = v13;
      uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
      v15 = [v11 fileURLWithPathComponents:v14];

      v16 = [v15 path];
      if (!v16)
      {
        v22 = [MEMORY[0x1E4F28B00] currentHandler];
        [v22 handleFailureInMethod:a2, a1, @"NSURL+TRI.m", 132, @"Invalid parameter not satisfying: %@", @"level1Path" object file lineNumber description];
      }
      uint64_t v23 = 0;
      v17 = [v4 destinationOfSymbolicLinkAtPath:v16 error:&v23];
      if (v17)
      {
        v18 = (void *)[&unk_1EEFCBDE0 mutableCopy];
        v19 = [v17 pathComponents];
        [v18 addObjectsFromArray:v19];

        [v18 addObjectsFromArray:v10];
        id v20 = [MEMORY[0x1E4F1CB10] fileURLWithPathComponents:v18];
      }
      else
      {
        id v20 = v6;
      }

      goto LABEL_13;
    }
  }
  else
  {
  }
  id v20 = v6;
LABEL_13:

LABEL_14:
  return v20;
}

@end