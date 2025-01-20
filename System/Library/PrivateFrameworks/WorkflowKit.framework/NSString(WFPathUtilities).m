@interface NSString(WFPathUtilities)
- (const)wf_bestGuessURL;
- (id)wf_expandingTildeInPath;
- (id)wf_normalizedPathForROSP;
@end

@implementation NSString(WFPathUtilities)

- (id)wf_expandingTildeInPath
{
  v2 = objc_msgSend(MEMORY[0x1E4F1CB10], "wf_realHomeDirectoryURL");
  v3 = [v2 path];
  v4 = [a1 stringByReplacingOccurrencesOfString:@"~" withString:v3];

  return v4;
}

- (id)wf_normalizedPathForROSP
{
  if ([a1 length])
  {
    v2 = objc_msgSend(a1, "wf_bestGuessURL");
    v3 = v2;
    if (v2)
    {
      v4 = objc_msgSend(v2, "wf_normalizedFileURLForROSP");
      if ([v4 isEqual:v3])
      {
        id v5 = a1;
      }
      else
      {
        v6 = (void *)[a1 mutableCopy];
        uint64_t v7 = [v6 rangeOfString:@"/Applications"];
        if (v7 != 0x7FFFFFFFFFFFFFFFLL && v8) {
          objc_msgSend(v6, "replaceCharactersInRange:withString:", v7, v8, @"/System/Applications");
        }
        v9 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v6];
        v10 = v9;
        if (v9 && (uint64_t v13 = 0, [v9 checkResourceIsReachableAndReturnError:&v13])) {
          id v11 = (id)[v6 copy];
        }
        else {
          id v11 = a1;
        }
        id v5 = v11;
      }
    }
    else
    {
      id v5 = a1;
    }
  }
  else
  {
    id v5 = a1;
  }
  return v5;
}

- (const)wf_bestGuessURL
{
  v29[6] = *MEMORY[0x1E4F143B8];
  v1 = (__CFString *)[a1 copy];
  if ([(__CFString *)v1 hasPrefix:@"~"])
  {
    uint64_t v2 = [(__CFString *)v1 stringByExpandingTildeInPath];

    v1 = (__CFString *)v2;
  }
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v4 = [v3 fileExistsAtPath:v1];

  if (v4)
  {
    CFURLRef v5 = CFURLCreateWithFileSystemPath(0, v1, kCFURLPOSIXPathStyle, [(__CFString *)v1 hasSuffix:@"/"]);
    CFURLRef v6 = v5;
    if (v5 && CFURLCanBeDecomposed(v5)) {
      goto LABEL_18;
    }
  }
  if ([(__CFString *)v1 hasPrefix:@"feeds:"])
  {
    CFURLRef v6 = [MEMORY[0x1E4F1CB10] URLWithString:v1];
  }
  else
  {
    CFURLRef v7 = CFURLCreateWithString(0, v1, 0);
    CFURLRef v8 = v7;
    if (v7 && CFURLCanBeDecomposed(v7))
    {
      CFURLRef v6 = v8;
    }
    else
    {
      v9 = [MEMORY[0x1E4F28B88] URLHostAllowedCharacterSet];
      v29[0] = v9;
      v10 = [MEMORY[0x1E4F28B88] URLPathAllowedCharacterSet];
      v29[1] = v10;
      id v11 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
      v29[2] = v11;
      v12 = [MEMORY[0x1E4F28B88] URLFragmentAllowedCharacterSet];
      v29[3] = v12;
      uint64_t v13 = [MEMORY[0x1E4F28B88] URLPasswordAllowedCharacterSet];
      v29[4] = v13;
      v14 = [MEMORY[0x1E4F28B88] URLUserAllowedCharacterSet];
      v29[5] = v14;
      v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:6];

      v16 = [v15 firstObject];
      v17 = (void *)[v16 mutableCopy];

      uint64_t v24 = MEMORY[0x1E4F143A8];
      uint64_t v25 = 3221225472;
      v26 = __44__NSString_WFPathUtilities__wf_bestGuessURL__block_invoke;
      v27 = &unk_1E654ED38;
      id v18 = v17;
      id v28 = v18;
      [v15 enumerateObjectsUsingBlock:&v24];
      objc_msgSend(v18, "addCharactersInString:", @":/", v24, v25, v26, v27);
      v19 = (void *)[v18 copy];
      v20 = [(__CFString *)v1 stringByAddingPercentEncodingWithAllowedCharacters:v19];

      CFURLRef v21 = [MEMORY[0x1E4F1CB10] URLWithString:v20];
      CFURLRef v22 = v21;
      if (v21 && CFURLCanBeDecomposed(v21)) {
        CFURLRef v6 = v22;
      }
      else {
        CFURLRef v6 = 0;
      }
    }
  }
LABEL_18:

  return v6;
}

@end