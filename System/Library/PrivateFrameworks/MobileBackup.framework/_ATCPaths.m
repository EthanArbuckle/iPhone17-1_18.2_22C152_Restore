@interface _ATCPaths
- (NSMutableArray)assetFiles;
- (NSMutableArray)directories;
- (NSMutableArray)symlinks;
- (NSMutableArray)zeroByteFiles;
- (_ATCPaths)init;
@end

@implementation _ATCPaths

- (_ATCPaths)init
{
  v12.receiver = self;
  v12.super_class = (Class)_ATCPaths;
  v2 = [(_ATCPaths *)&v12 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableArray array];
    directories = v2->_directories;
    v2->_directories = (NSMutableArray *)v3;

    uint64_t v5 = +[NSMutableArray array];
    symlinks = v2->_symlinks;
    v2->_symlinks = (NSMutableArray *)v5;

    uint64_t v7 = +[NSMutableArray array];
    zeroByteFiles = v2->_zeroByteFiles;
    v2->_zeroByteFiles = (NSMutableArray *)v7;

    uint64_t v9 = +[NSMutableArray array];
    assetFiles = v2->_assetFiles;
    v2->_assetFiles = (NSMutableArray *)v9;
  }
  return v2;
}

- (NSMutableArray)directories
{
  return self->_directories;
}

- (NSMutableArray)symlinks
{
  return self->_symlinks;
}

- (NSMutableArray)zeroByteFiles
{
  return self->_zeroByteFiles;
}

- (NSMutableArray)assetFiles
{
  return self->_assetFiles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetFiles, 0);
  objc_storeStrong((id *)&self->_zeroByteFiles, 0);
  objc_storeStrong((id *)&self->_symlinks, 0);
  objc_storeStrong((id *)&self->_directories, 0);
}

@end