@interface DiskImageParamsRAM_XPC
+ (BOOL)supportsSecureCoding;
- (DiskImageParamsRAM_XPC)initWithURL:(id)a3 error:(id *)a4;
- (NSString)ramSizeStr;
- (unique_ptr<DiskImage,)createSinkDiskImage;
- (void)setBlockSize:(unint64_t)a3;
@end

@implementation DiskImageParamsRAM_XPC

- (DiskImageParamsRAM_XPC)initWithURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [v6 host];

  if (v7
    && ([v6 host],
        v8 = objc_claimAutoreleasedReturnValue(),
        unint64_t v9 = +[DIHelpers numBlocksWithSizeStr:v8 blockSize:512], v8, v9))
  {
    v10 = [[RamXPC alloc] initWithSize:v9 << 9];
    v16.receiver = self;
    v16.super_class = (Class)DiskImageParamsRAM_XPC;
    v11 = [(DiskImageParamsXPC *)&v16 initWithBackendXPC:v10];
    if (v11)
    {
      uint64_t v12 = [v6 host];
      ramSizeStr = v11->_ramSizeStr;
      v11->_ramSizeStr = (NSString *)v12;
    }
    self = v11;

    v14 = self;
  }
  else
  {
    v14 = +[DIError nilWithPOSIXCode:22 description:@"Malformed ram URL, expected to be ram://<?? | ??b | ??k | ??m | ??g | ??t>" error:a4];
  }

  return v14;
}

- (unique_ptr<DiskImage,)createSinkDiskImage
{
  v3 = [(DiskImageParamsXPC *)self backendXPC];
  [v3 createRamBackend];
  v5.receiver = self;
  v5.super_class = (Class)DiskImageParamsRAM_XPC;
  [(DiskImageParamsRaw_XPC *)&v5 createSinkDiskImage];

  return v4;
}

- (void)setBlockSize:(unint64_t)a3
{
  objc_super v5 = [(DiskImageParamsRAM_XPC *)self ramSizeStr];
  unint64_t v6 = +[DIHelpers numBlocksWithSizeStr:v5 blockSize:a3];

  v7 = [[RamXPC alloc] initWithSize:v6 * a3];
  [(DiskImageParamsXPC *)self setBackendXPC:v7];

  v8.receiver = self;
  v8.super_class = (Class)DiskImageParamsRAM_XPC;
  [(DiskImageParamsXPC *)&v8 setBlockSize:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)ramSizeStr
{
  return self->_ramSizeStr;
}

- (void).cxx_destruct
{
}

@end