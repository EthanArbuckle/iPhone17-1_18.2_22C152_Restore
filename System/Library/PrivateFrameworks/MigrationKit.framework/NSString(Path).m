@interface NSString(Path)
- (BOOL)mk_isValidFilename;
- (BOOL)mk_isValidPath;
- (id)mk_validatePath;
@end

@implementation NSString(Path)

- (id)mk_validatePath
{
  if (objc_msgSend(a1, "mk_isValidPath"))
  {
    if (objc_msgSend(a1, "mk_isValidFilename"))
    {
      v2 = 0;
      goto LABEL_7;
    }
    uint64_t v3 = 2;
  }
  else
  {
    uint64_t v3 = 1;
  }
  v2 = [MEMORY[0x263F087E8] errorWithDomain:@"MKFileURLError" code:v3 userInfo:0];
LABEL_7:
  return v2;
}

- (BOOL)mk_isValidPath
{
  v1 = [a1 dataUsingEncoding:4];
  BOOL v2 = (unint64_t)[v1 length] < 0x401;

  return v2;
}

- (BOOL)mk_isValidFilename
{
  v1 = [a1 lastPathComponent];
  BOOL v2 = [v1 dataUsingEncoding:4];
  BOOL v3 = (unint64_t)[v2 length] < 0x100;

  return v3;
}

@end