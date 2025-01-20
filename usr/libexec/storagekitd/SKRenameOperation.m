@interface SKRenameOperation
- (SKRenameOperation)initWithDisk:(id)a3 name:(id)a4 withCompletionBlock:(id)a5;
- (id)description;
- (id)newPerformOperation;
- (int64_t)defaultErrorCode;
@end

@implementation SKRenameOperation

- (SKRenameOperation)initWithDisk:(id)a3 name:(id)a4 withCompletionBlock:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = (void (**)(id, id))a5;
  v24.receiver = self;
  v24.super_class = (Class)SKRenameOperation;
  v12 = [(SKBaseDiskArbOperation *)&v24 initWithTarget:v9 options:&__NSDictionary0__struct callbackBlock:v11];
  if (v12)
  {
    uint64_t v13 = [v9 filesystemType];
    if (v13)
    {
      v14 = (void *)v13;
      v15 = [v9 filesystemType];
      unsigned int v16 = [v15 isEqualToString:kSKDiskFileSystemFAT];

      if (v16)
      {
        uint64_t v17 = [v10 uppercaseString];

        id v10 = (id)v17;
      }
    }
    v18 = [v9 filesystem];
    id v23 = 0;
    unsigned __int8 v19 = [v18 isValidName:v10 error:&v23];
    id v20 = v23;

    if (v19)
    {
      objc_storeStrong((id *)&v12->_diskToRename, a3);
      objc_storeStrong((id *)&v12->_name, v10);
      v21 = v12;
    }
    else
    {
      v11[2](v11, v20);
      v21 = 0;
    }
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)newPerformOperation
{
  v3 = [(SKDisk *)self->_diskToRename daDisk];
  DADiskRename(v3, (CFStringRef)self->_name, 0, (DADiskRenameCallback)sub_100019AEC, self);

  if ([(SKBaseDiskArbOperation *)self completeDiskArbOp])
  {
    v4 = +[SKDaemonManager sharedManager];
    id v5 = [v4 _recacheSyncDisk:self->_diskToRename];

    return 0;
  }
  else
  {
    return [(SKBaseDiskArbOperation *)self newDAError];
  }
}

- (id)description
{
  return +[NSString stringWithFormat:@"Rename Operation for %@", self->_diskToRename];
}

- (int64_t)defaultErrorCode
{
  return 402;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_diskToRename, 0);

  objc_storeStrong(&self->_callbackBlock, 0);
}

@end