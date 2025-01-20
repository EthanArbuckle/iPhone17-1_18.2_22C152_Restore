@interface SKDiskImageSizeLimits
+ (BOOL)isSupportedWholeDisk:(id)a3;
- (unint64_t)currentBytes;
- (unint64_t)maxBytes;
- (unint64_t)minBytes;
- (unint64_t)physicalStoreMinimumSizeFromStore:(id)a3;
- (void)setCurrentBytes:(unint64_t)a3;
- (void)setMaxBytes:(unint64_t)a3;
- (void)setMinBytes:(unint64_t)a3;
@end

@implementation SKDiskImageSizeLimits

+ (BOOL)isSupportedWholeDisk:(id)a3
{
  v7[4] = *MEMORY[0x263EF8340];
  v7[0] = kSKDiskTypeGPTWholeDisk[0];
  v7[1] = kSKDiskTypeMBRWholeDisk[0];
  v7[2] = kSKDiskTypeAPMWholeDisk[0];
  v7[3] = kSKDiskTypeUninitalized[0];
  v3 = (void *)MEMORY[0x263EFF8C0];
  id v4 = a3;
  v5 = [v3 arrayWithObjects:v7 count:4];
  LOBYTE(v3) = [v5 containsObject:v4];

  return (char)v3;
}

- (unint64_t)physicalStoreMinimumSizeFromStore:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 container];
  v5 = v4;
  if (v4)
  {
    id v6 = [v4 diskIdentifier];
    [v6 UTF8String];
    int MinimalSize = APFSContainerGetMinimalSize();

    if (!MinimalSize)
    {
      unint64_t v9 = 0;
      goto LABEL_8;
    }
    v8 = SKGetOSLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v12 = "-[SKDiskImageSizeLimits physicalStoreMinimumSizeFromStore:]";
      __int16 v13 = 2112;
      id v14 = v3;
      __int16 v15 = 1024;
      int v16 = MinimalSize;
      _os_log_impl(&dword_23F40C000, v8, OS_LOG_TYPE_ERROR, "%s: Failed to get size from %@, %d", buf, 0x1Cu);
    }
  }
  unint64_t v9 = [v3 totalSpace];
LABEL_8:

  return v9;
}

- (unint64_t)currentBytes
{
  return self->_currentBytes;
}

- (void)setCurrentBytes:(unint64_t)a3
{
  self->_currentBytes = a3;
}

- (unint64_t)maxBytes
{
  return self->_maxBytes;
}

- (void)setMaxBytes:(unint64_t)a3
{
  self->_maxBytes = a3;
}

- (unint64_t)minBytes
{
  return self->_minBytes;
}

- (void)setMinBytes:(unint64_t)a3
{
  self->_minBytes = a3;
}

@end