@interface PDTransactionReceiptFileManager
- (BOOL)_isTransactionReceiptFileURL:(id)a3;
- (BOOL)deleteTransactionReceiptWithUniqueID:(id)a3;
- (NSSet)transactionReceipts;
- (NSSet)uniqueIDs;
- (PDTransactionReceiptFileManager)initWithDirectoryURL:(id)a3 delegate:(id)a4;
- (id)_fileURLForTransactionReceiptUniqueID:(id)a3;
- (id)_transactionReceiptUniqueIDFromFileURL:(id)a3;
- (id)transactionReceiptWithUniqueID:(id)a3;
- (void)_downloadImageURLsForReceipt:(id)a3 atURL:(id)a4 withCompletion:(id)a5;
- (void)registerDatabaseTransactionReceipt:(id)a3;
- (void)writeTransactionReceipt:(id)a3 completion:(id)a4;
@end

@implementation PDTransactionReceiptFileManager

- (PDTransactionReceiptFileManager)initWithDirectoryURL:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PDTransactionReceiptFileManager;
  v9 = [(PDTransactionReceiptFileManager *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_directoryURL, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    v10->_fileAccessLock._os_unfair_lock_opaque = 0;
    uint64_t v11 = +[NSFileManager defaultManager];
    fileManager = v10->_fileManager;
    v10->_fileManager = (NSFileManager *)v11;

    os_unfair_lock_lock(&v10->_fileAccessLock);
    [(NSFileManager *)v10->_fileManager createDirectoryAtURL:v10->_directoryURL withIntermediateDirectories:1 attributes:0 error:0];
    os_unfair_lock_unlock(&v10->_fileAccessLock);
  }

  return v10;
}

- (NSSet)uniqueIDs
{
  p_fileAccessLock = &self->_fileAccessLock;
  os_unfair_lock_lock(&self->_fileAccessLock);
  id v4 = objc_alloc_init((Class)NSMutableSet);
  v5 = [(NSFileManager *)self->_fileManager contentsOfDirectoryAtURL:self->_directoryURL includingPropertiesForKeys:&__NSArray0__struct options:4 error:0];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if ([(PDTransactionReceiptFileManager *)self _isTransactionReceiptFileURL:v10])
        {
          uint64_t v11 = [(PDTransactionReceiptFileManager *)self _transactionReceiptUniqueIDFromFileURL:v10];
          [v4 addObject:v11];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
  id v12 = [v4 copy];
  os_unfair_lock_unlock(p_fileAccessLock);

  return (NSSet *)v12;
}

- (NSSet)transactionReceipts
{
  p_fileAccessLock = &self->_fileAccessLock;
  os_unfair_lock_lock(&self->_fileAccessLock);
  id v4 = objc_alloc_init((Class)NSMutableSet);
  v5 = [(NSFileManager *)self->_fileManager contentsOfDirectoryAtURL:self->_directoryURL includingPropertiesForKeys:&__NSArray0__struct options:4 error:0];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if ([(PDTransactionReceiptFileManager *)self _isTransactionReceiptFileURL:v10])
        {
          id v11 = [objc_alloc((Class)PKTransactionReceipt) initWithFileURL:v10];
          if (v11) {
            [v4 addObject:v11];
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
  id v12 = [v4 copy];
  os_unfair_lock_unlock(p_fileAccessLock);

  return (NSSet *)v12;
}

- (id)transactionReceiptWithUniqueID:(id)a3
{
  id v4 = [(PDTransactionReceiptFileManager *)self _fileURLForTransactionReceiptUniqueID:a3];
  p_fileAccessLock = &self->_fileAccessLock;
  os_unfair_lock_lock(&self->_fileAccessLock);
  if (v4
    && (fileManager = self->_fileManager,
        [v4 path],
        id v7 = objc_claimAutoreleasedReturnValue(),
        LODWORD(fileManager) = [(NSFileManager *)fileManager fileExistsAtPath:v7],
        v7,
        fileManager))
  {
    id v8 = [objc_alloc((Class)PKTransactionReceipt) initWithFileURL:v4];
  }
  else
  {
    id v8 = 0;
  }
  os_unfair_lock_unlock(p_fileAccessLock);

  return v8;
}

- (void)writeTransactionReceipt:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    v9 = [v6 uniqueID];
    uint64_t v10 = [v6 fileURL];
    uint64_t v11 = [(PDTransactionReceiptFileManager *)self _fileURLForTransactionReceiptUniqueID:v9];
    id v12 = (void *)v11;
    id v13 = 0;
    if (v10 && v11)
    {
      os_unfair_lock_lock(&self->_fileAccessLock);
      id v14 = [objc_alloc((Class)PKTransactionReceipt) initWithFileURL:v12];
      if (v14)
      {
        long long v15 = PKTemporaryItemURLWithExtension();
        PKTemporaryItemPrepareDirectory();
        [(NSFileManager *)self->_fileManager moveItemAtURL:v12 toURL:v15 error:0];
      }
      else
      {
        long long v15 = 0;
      }
      [(NSFileManager *)self->_fileManager removeItemAtURL:v12 error:0];
      unsigned int v16 = [(NSFileManager *)self->_fileManager copyItemAtURL:v10 toURL:v12 error:0];
      if (v16)
      {
        id v13 = [v6 copy];
        if ((PKStoreDemoModeEnabled() & 1) == 0 && (PKUIOnlyDemoModeEnabled() & 1) == 0) {
          PKExcludeFileURLFromBackup();
        }
      }
      else
      {
        if (v15) {
          [(NSFileManager *)self->_fileManager moveItemAtURL:v15 toURL:v12 error:0];
        }
        id v13 = 0;
      }
      os_unfair_lock_unlock(&self->_fileAccessLock);

      if (v16)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained transactionReceiptFileManager:self didWriteTransactionReceipt:v13];

        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_1004A2374;
        v18[3] = &unk_10073B5A0;
        id v19 = v8;
        char v20 = 1;
        [(PDTransactionReceiptFileManager *)self _downloadImageURLsForReceipt:v6 atURL:v12 withCompletion:v18];
      }
    }
  }
  else if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (void)_downloadImageURLsForReceipt:(id)a3 atURL:(id)a4 withCompletion:(id)a5
{
  id v7 = a3;
  id v24 = a4;
  id v22 = a5;
  id v8 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
  v9 = +[NSURLSession sharedSession];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v23 = v7;
  uint64_t v10 = [v7 lineItems];
  id v11 = [v10 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v32;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v32 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v16 = [v15 iconImageURL];
        if (v16)
        {
          long long v17 = (void *)v16;
          v18 = [v15 image];

          if (!v18)
          {
            v27[0] = _NSConcreteStackBlock;
            v27[1] = 3221225472;
            v27[2] = sub_1004A2630;
            v27[3] = &unk_100733E60;
            id v28 = v9;
            v29 = v15;
            id v30 = v24;
            [v8 addOperation:v27];
          }
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v12);
  }

  id v19 = +[NSNull null];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1004A28EC;
  v25[3] = &unk_100734688;
  id v26 = v22;
  id v20 = v22;
  id v21 = [v8 evaluateWithInput:v19 completion:v25];
}

- (BOOL)deleteTransactionReceiptWithUniqueID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(PDTransactionReceiptFileManager *)self _fileURLForTransactionReceiptUniqueID:v4];
    if (v5
      && (os_unfair_lock_lock(&self->_fileAccessLock),
          unsigned int v6 = [(NSFileManager *)self->_fileManager removeItemAtURL:v5 error:0],
          os_unfair_lock_unlock(&self->_fileAccessLock),
          v6))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained transactionReceiptFileManager:self didDeleteTransactionReceiptWithUniqueID:v4];

      BOOL v8 = 1;
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)registerDatabaseTransactionReceipt:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    v5 = [v4 uniqueID];
    unsigned int v6 = [(PDTransactionReceiptFileManager *)self _fileURLForTransactionReceiptUniqueID:v5];
    if (v6)
    {
      id v7 = +[NSBundle bundleWithURL:v6];
      [v8 updateWithBundle:v7];
    }
    id v4 = v8;
  }
}

- (id)_fileURLForTransactionReceiptUniqueID:(id)a3
{
  if (a3)
  {
    v3 = -[NSURL URLByAppendingPathComponent:](self->_directoryURL, "URLByAppendingPathComponent:");
    id v4 = [v3 URLByAppendingPathExtension:PKRawTransactionReceiptExtension];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (BOOL)_isTransactionReceiptFileURL:(id)a3
{
  v3 = (void *)PKRawTransactionReceiptExtension;
  id v4 = [a3 lastPathComponent];
  v5 = [v4 pathExtension];
  id v6 = v3;
  id v7 = v5;
  id v8 = v7;
  if (v6 == v7)
  {
    unsigned __int8 v10 = 1;
  }
  else
  {
    if (v6) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9) {
      unsigned __int8 v10 = 0;
    }
    else {
      unsigned __int8 v10 = [v6 isEqualToString:v7];
    }
  }

  return v10;
}

- (id)_transactionReceiptUniqueIDFromFileURL:(id)a3
{
  if (a3)
  {
    v3 = [a3 lastPathComponent];
    id v4 = [v3 stringByDeletingPathExtension];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_directoryURL, 0);
}

@end