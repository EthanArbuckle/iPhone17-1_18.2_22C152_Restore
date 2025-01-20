@interface SSLogFileOptions
- (NSString)logDirectoryPath;
- (NSString)logFileBaseName;
- (SSLogFileOptions)init;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)maxNumberOfLogFiles;
- (unint64_t)maxLogFileSize;
- (void)dealloc;
- (void)setLogDirectoryPath:(id)a3;
- (void)setLogFileBaseName:(id)a3;
- (void)setMaxLogFileSize:(unint64_t)a3;
- (void)setMaxNumberOfLogFiles:(int64_t)a3;
@end

@implementation SSLogFileOptions

- (SSLogFileOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)SSLogFileOptions;
  result = [(SSLogFileOptions *)&v3 init];
  if (result) {
    *(_OWORD *)&result->_maxNumberOfLogFiles = xmmword_1A52F6380;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSLogFileOptions;
  [(SSLogFileOptions *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[1] = [(NSString *)self->_directoryPath copyWithZone:a3];
  v5[2] = [(NSString *)self->_fileName copyWithZone:a3];
  v5[3] = self->_maxNumberOfLogFiles;
  v5[4] = self->_maxSizeInBytes;
  return v5;
}

- (NSString)logDirectoryPath
{
  return self->_directoryPath;
}

- (void)setLogDirectoryPath:(id)a3
{
}

- (NSString)logFileBaseName
{
  return self->_fileName;
}

- (void)setLogFileBaseName:(id)a3
{
}

- (unint64_t)maxLogFileSize
{
  return self->_maxSizeInBytes;
}

- (void)setMaxLogFileSize:(unint64_t)a3
{
  self->_maxSizeInBytes = a3;
}

- (int64_t)maxNumberOfLogFiles
{
  return self->_maxNumberOfLogFiles;
}

- (void)setMaxNumberOfLogFiles:(int64_t)a3
{
  self->_maxNumberOfLogFiles = a3;
}

@end