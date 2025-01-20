@interface _UIArchiveItem
- (BOOL)fileSizeIsSet;
- (BOOL)isAppleDoubleFile;
- (NSString)fileType;
- (NSString)pathInArchive;
- (NSString)pathToAppleDoubleRealFileCounterpart;
- (id)description;
- (unint64_t)fileSize;
- (void)setFileSize:(unint64_t)a3;
- (void)setFileSizeIsSet:(BOOL)a3;
- (void)setFileType:(id)a3;
- (void)setIsAppleDoubleFile:(BOOL)a3;
- (void)setPathInArchive:(id)a3;
- (void)setPathToAppleDoubleRealFileCounterpart:(id)a3;
@end

@implementation _UIArchiveItem

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p> fileName = %@", objc_opt_class(), self, self->_pathInArchive];
}

- (void)setPathInArchive:(id)a3
{
  v4 = [a3 stringByStandardizingPath];
  pathInArchive = self->_pathInArchive;
  self->_pathInArchive = v4;
}

- (NSString)pathInArchive
{
  return self->_pathInArchive;
}

- (NSString)fileType
{
  return self->_fileType;
}

- (void)setFileType:(id)a3
{
}

- (unint64_t)fileSize
{
  return self->_fileSize;
}

- (void)setFileSize:(unint64_t)a3
{
  self->_fileSize = a3;
}

- (BOOL)fileSizeIsSet
{
  return self->_fileSizeIsSet;
}

- (void)setFileSizeIsSet:(BOOL)a3
{
  self->_fileSizeIsSet = a3;
}

- (BOOL)isAppleDoubleFile
{
  return self->_isAppleDoubleFile;
}

- (void)setIsAppleDoubleFile:(BOOL)a3
{
  self->_isAppleDoubleFile = a3;
}

- (NSString)pathToAppleDoubleRealFileCounterpart
{
  return self->_pathToAppleDoubleRealFileCounterpart;
}

- (void)setPathToAppleDoubleRealFileCounterpart:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathToAppleDoubleRealFileCounterpart, 0);
  objc_storeStrong((id *)&self->_fileType, 0);
  objc_storeStrong((id *)&self->_pathInArchive, 0);
}

@end