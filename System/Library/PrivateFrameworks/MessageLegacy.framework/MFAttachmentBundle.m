@interface MFAttachmentBundle
+ (BOOL)isFileBundleURL:(id)a3;
+ (id)_stripBundlePath:(id)a3 entryPath:(id)a4;
@end

@implementation MFAttachmentBundle

+ (BOOL)isFileBundleURL:(id)a3
{
  BOOL v4 = 0;
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:isDirectory:", objc_msgSend(a3, "path"), &v4);
  return v4;
}

+ (id)_stripBundlePath:(id)a3 entryPath:(id)a4
{
  v5 = (void *)[a3 path];
  uint64_t v6 = [v5 length];
  uint64_t v7 = v6 + ([v5 hasSuffix:@"/"] ^ 1);
  v8 = (void *)[a4 path];
  return (id)[v8 substringFromIndex:v7];
}

@end