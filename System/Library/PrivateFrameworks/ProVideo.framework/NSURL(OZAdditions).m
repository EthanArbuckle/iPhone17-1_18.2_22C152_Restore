@interface NSURL(OZAdditions)
+ (id)motionBundleURLFromMotionDocURL:()OZAdditions;
+ (uint64_t)motionDocURLFromMotionBundleURL:()OZAdditions;
- (BOOL)isEditableMotionProjectURL:()OZAdditions;
- (BOOL)isMotionBundle;
- (id)OZ_imageSequenceURLs;
- (uint64_t)OZ_isImageSequenceURL;
- (uint64_t)oz_relativePathFromURL:()OZAdditions;
@end

@implementation NSURL(OZAdditions)

- (BOOL)isEditableMotionProjectURL:()OZAdditions
{
  id v11 = 0;
  uint64_t v12 = 0;
  if (([a1 getResourceValue:&v11 forKey:*MEMORY[0x1E4F1C670] error:&v12] & 1) == 0)
  {
    if (a3)
    {
      BOOL v9 = 0;
      *a3 = v12;
      return v9;
    }
    return 0;
  }
  if (([v11 BOOLValue] & 1) == 0
    || (v5 = (void *)[a1 pathExtension]) == 0
    || (v6 = v5, ![v5 compare:@"moti" options:1])
    && ![v6 compare:@"moef" options:1]
    && ![v6 compare:@"motr" options:1]
    && ![v6 compare:@"motn" options:1]
    || (v7 = [[OZTemplateFlagXMLParser alloc] initWithContentsOfURL:a1]) == 0)
  {
    if (a3)
    {
      BOOL v9 = 0;
      *a3 = 0;
      return v9;
    }
    return 0;
  }
  v8 = v7;
  if (![(OZTemplateFlagXMLParser *)v7 parse])
  {
    if (a3) {
      *a3 = 0;
    }

    return 0;
  }
  BOOL v9 = ([(OZTemplateFlagXMLParser *)v8 templeFlags] & 8) == 0;

  return v9;
}

- (uint64_t)OZ_isImageSequenceURL
{
  PCURL::PCURL((PCURL *)&v3, cf);
  uint64_t isSequence = PCURL::isSequence(&v3);
  PCURL::~PCURL((PCURL *)&v3);
  return isSequence;
}

- (id)OZ_imageSequenceURLs
{
  PCURL::PCURL((PCURL *)&v17, cf);
  if (PCURL::isSequence(&v17))
  {
    v1 = (void *)[MEMORY[0x1E4F1CA70] orderedSet];
    int SequenceStart = PCURL::getSequenceStart(&v17);
    int SequenceEnd = PCURL::getSequenceEnd(&v17);
    int v4 = SequenceEnd - SequenceStart;
    if (SequenceEnd >= SequenceStart)
    {
      int v5 = 0;
      int v6 = v4 + 1;
      do
      {
        URLforIndex = (const __CFURL **)PCURL::getURLforIndex(&v17, v5);
        v8 = URLforIndex;
        v16 = URLforIndex;
        if (URLforIndex)
        {
          PCURL::getFilename(URLforIndex, &v15);
          PCURL::getPathAsFileSystemString(v8, (PCURL *)&v14);
          BOOL v9 = PCString::ns_str(&v14);
          uint64_t v10 = [(__CFString *)v9 stringByAppendingPathComponent:PCString::ns_str(&v15)];
          PCString::~PCString(&v14);
          uint64_t v11 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v10];
          if (v11) {
            [v1 addObject:v11];
          }
          PCString::~PCString(&v15);
          PCURL::~PCURL((PCURL *)v8);
          MEMORY[0x1BA9BFBA0]();
        }
        ++v5;
      }
      while (v6 != v5);
    }
    id v12 = (id)[v1 copy];
  }
  else
  {
    id v12 = 0;
  }
  PCURL::~PCURL((PCURL *)&v17);
  return v12;
}

- (BOOL)isMotionBundle
{
  return +[PCMotionBundle isValidBundleURL:a1];
}

+ (id)motionBundleURLFromMotionDocURL:()OZAdditions
{
  return +[PCMotionBundle bundleURLForProjectFileURL:](PCMotionBundle, "bundleURLForProjectFileURL:");
}

+ (uint64_t)motionDocURLFromMotionBundleURL:()OZAdditions
{
  CFURLRef v3 = [[PCMotionBundle alloc] initWithURL:a3];
  uint64_t v4 = [(PCMotionBundle *)v3 projectFileURL];

  return v4;
}

- (uint64_t)oz_relativePathFromURL:()OZAdditions
{
  uint64_t v4 = [a1 pathComponents];
  if (!v4) {
    return 0;
  }
  int v5 = (void *)v4;
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithArray:", objc_msgSend(a3, "pathComponents"));
  if (!v6) {
    return 0;
  }
  v7 = (void *)v6;
  if (([a3 hasDirectoryPath] & 1) == 0) {
    [v7 removeLastObject];
  }
  unint64_t v8 = [v5 count];
  unint64_t v9 = [v7 count];
  uint64_t v10 = 0;
  if (v8 >= v9) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = v8;
  }
  uint64_t v12 = v11 & ~(v11 >> 63);
  while (1)
  {
    uint64_t v13 = v10;
    if (v12 == v10) {
      break;
    }
    char v14 = objc_msgSend((id)objc_msgSend(v5, "objectAtIndexedSubscript:", v10), "isEqualToString:", objc_msgSend(v7, "objectAtIndexedSubscript:", v10));
    uint64_t v10 = v13 + 1;
    if ((v14 & 1) == 0)
    {
      uint64_t v12 = v13;
      break;
    }
  }
  uint64_t v15 = [v7 count];
  v16 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:v15 - v12];
  if (v15 - v12 >= 1)
  {
    do
    {
      [v16 addObject:@".."];
      --v15;
    }
    while (v13 != v15);
  }
  objc_msgSend(v16, "addObjectsFromArray:", objc_msgSend(v5, "subarrayWithRange:", v12, objc_msgSend(v5, "count") - v12));

  return [v16 componentsJoinedByString:@"/"];
}

@end