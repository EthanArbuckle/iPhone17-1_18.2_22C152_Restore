@interface APFileSystemItemInfo
- (APStorageManager)fileManager;
- (BOOL)isEqual:(id)a3;
@end

@implementation APFileSystemItemInfo

- (BOOL)isEqual:(id)a3
{
  v4 = (id *)a3;
  if (v4)
  {
    if (self) {
      name = self->_name;
    }
    else {
      name = 0;
    }
    v6 = name;
    id v7 = v4[3];
    if ([(NSString *)v6 isEqualToString:v7])
    {
      if (self) {
        filePath = self->_filePath;
      }
      else {
        filePath = 0;
      }
      v9 = filePath;
      id v10 = v4[4];
      if ([(NSString *)v9 isEqualToString:v10]
        && ([(NSDate *)self->_createdDate timeIntervalSince1970],
            double v12 = v11,
            [v4[1] timeIntervalSince1970],
            v12 == v13))
      {
        [(NSDate *)self->_modifiedDate timeIntervalSince1970];
        double v15 = v14;
        [v4[2] timeIntervalSince1970];
        BOOL v17 = v15 == v16;
      }
      else
      {
        BOOL v17 = 0;
      }
    }
    else
    {
      BOOL v17 = 0;
    }
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (APStorageManager)fileManager
{
  return self->_fileManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_modifiedDate, 0);

  objc_storeStrong((id *)&self->_createdDate, 0);
}

@end