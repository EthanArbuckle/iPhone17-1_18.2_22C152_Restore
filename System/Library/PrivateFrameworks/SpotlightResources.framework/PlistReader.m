@interface PlistReader
+ (id)plistReaderWithResourcePath:(id)a3;
- (NSDictionary)plist;
- (PlistReader)initWithPlist:(id)a3;
@end

@implementation PlistReader

+ (id)plistReaderWithResourcePath:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F08850] defaultManager];
  if (![v4 fileExistsAtPath:v3]) {
    goto LABEL_9;
  }
  if ([v3 hasSuffix:@".mdplist"])
  {

LABEL_5:
    v6 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v3];
    id v4 = v6;
    if (v6)
    {
      id v4 = v6;
      [v4 bytes];
      [v4 length];
      uint64_t v7 = _MDPlistContainerCreateWithBytes();
      if (v7)
      {
        v8 = (const void *)v7;
        v9 = (void *)_MDPlistContainerCopyRootObject();
        CFRelease(v8);
        if (v9)
        {
          v10 = [[PlistReader alloc] initWithPlist:v9];

LABEL_10:
          goto LABEL_11;
        }
      }
    }
LABEL_9:
    v10 = 0;
    goto LABEL_10;
  }
  char v5 = [v3 hasSuffix:@".factors"];

  if (v5) {
    goto LABEL_5;
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (PlistReader)initWithPlist:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PlistReader;
  v6 = [(PlistReader *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_plist, a3);
  }

  return v7;
}

- (NSDictionary)plist
{
  return self->_plist;
}

- (void).cxx_destruct
{
}

@end