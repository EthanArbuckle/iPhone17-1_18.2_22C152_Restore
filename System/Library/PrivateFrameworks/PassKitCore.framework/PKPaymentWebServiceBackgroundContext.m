@interface PKPaymentWebServiceBackgroundContext
+ (BOOL)supportsSecureCoding;
+ (id)contextWithArchive:(id)a3;
- (NSMutableDictionary)backgroundTaskRecordsByRecordName;
- (NSMutableDictionary)backgroundTaskRecordsByTaskIdentifier;
- (PKPaymentWebServiceBackgroundContext)init;
- (PKPaymentWebServiceBackgroundContext)initWithCoder:(id)a3;
- (id)backgroundDownloadRecordForRecordName:(id)a3;
- (id)backgroundDownloadRecordForTaskIdentifier:(unint64_t)a3;
- (id)remainingTasks;
- (void)addBackgroundDownloadRecord:(id)a3 forRecordName:(id)a4;
- (void)addBackgroundDownloadRecord:(id)a3 forTaskIdentifier:(unint64_t)a4;
- (void)archiveAtPath:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)removeBackgroundDownloadRecordForRecordName:(id)a3;
- (void)removeBackgroundDownloadRecordForTaskIdentifier:(unint64_t)a3;
- (void)setBackgroundTaskRecordsByRecordName:(id)a3;
- (void)setBackgroundTaskRecordsByTaskIdentifier:(id)a3;
@end

@implementation PKPaymentWebServiceBackgroundContext

- (PKPaymentWebServiceBackgroundContext)init
{
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentWebServiceBackgroundContext;
  v2 = [(PKPaymentWebServiceBackgroundContext *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    backgroundTaskRecordsByTaskIdentifier = v3->_backgroundTaskRecordsByTaskIdentifier;
    v3->_backgroundTaskRecordsByTaskIdentifier = v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    backgroundTaskRecordsByRecordName = v3->_backgroundTaskRecordsByRecordName;
    v3->_backgroundTaskRecordsByRecordName = v6;
  }
  return v3;
}

- (PKPaymentWebServiceBackgroundContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(PKPaymentWebServiceBackgroundContext *)self init];
  v6 = v5;
  if (v5)
  {
    os_unfair_lock_lock(&v5->_lock);
    v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v7, "setWithObjects:", v8, v9, v10, objc_opt_class(), 0);
    v12 = [v4 decodeObjectOfClasses:v11 forKey:@"backgroundTaskByTaskIdentifier"];
    v13 = (void *)[v12 mutableCopy];
    [(PKPaymentWebServiceBackgroundContext *)v6 setBackgroundTaskRecordsByTaskIdentifier:v13];

    v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v14, "setWithObjects:", v15, v16, v17, objc_opt_class(), 0);
    v19 = [v4 decodeObjectOfClasses:v18 forKey:@"backgroundTaskRecordsByRecordName"];
    v20 = (void *)[v19 mutableCopy];
    [(PKPaymentWebServiceBackgroundContext *)v6 setBackgroundTaskRecordsByRecordName:v20];

    v21 = [(PKPaymentWebServiceBackgroundContext *)v6 backgroundTaskRecordsByRecordName];

    if (!v21)
    {
      v22 = [MEMORY[0x1E4F1CA60] dictionary];
      [(PKPaymentWebServiceBackgroundContext *)v6 setBackgroundTaskRecordsByRecordName:v22];
    }
    os_unfair_lock_unlock(&v6->_lock);
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = [(PKPaymentWebServiceBackgroundContext *)self backgroundTaskRecordsByTaskIdentifier];
  [v5 encodeObject:v6 forKey:@"backgroundTaskByTaskIdentifier"];

  v7 = [(PKPaymentWebServiceBackgroundContext *)self backgroundTaskRecordsByRecordName];
  [v5 encodeObject:v7 forKey:@"backgroundTaskRecordsByRecordName"];

  os_unfair_lock_unlock(p_lock);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)contextWithArchive:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:a3 options:1 error:0];
  if (v3)
  {
    id v13 = 0;
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v3 error:&v13];
    id v5 = v13;
    id v6 = v5;
    if (v4)
    {
      if (!v5)
      {
        uint64_t v10 = objc_opt_class();
        uint64_t v11 = *MEMORY[0x1E4F284E8];
        id v12 = 0;
        v7 = [v4 decodeTopLevelObjectOfClass:v10 forKey:v11 error:&v12];
        id v6 = v12;
        [v4 finishDecoding];
        if (!v6) {
          goto LABEL_9;
        }
        goto LABEL_6;
      }
      [v4 finishDecoding];
    }
    v7 = 0;
LABEL_6:
    uint64_t v8 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = v6;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "PKPaymentWebServiceContext: error occurred while trying to unarchive Payment Web Service Background context. We should discard the data. %{public}@.", buf, 0xCu);
    }

LABEL_9:
    if (v7) {
      goto LABEL_11;
    }
  }
  v7 = objc_alloc_init(PKPaymentWebServiceBackgroundContext);
LABEL_11:

  return v7;
}

- (void)archiveAtPath:(id)a3
{
  id v4 = a3;
  id v5 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Archiving PKPaymentWebServiceBackgroundContext", v7, 2u);
  }

  id v6 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
  [v6 writeToFile:v4 atomically:1];

  PKExcludePathFromBackup((uint64_t)v4);
}

- (void)addBackgroundDownloadRecord:(id)a3 forTaskIdentifier:(unint64_t)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  id v7 = a3;
  os_unfair_lock_lock(p_lock);
  uint64_t v8 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134217984;
    unint64_t v12 = a4;
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Adding background download record for task %lu", (uint8_t *)&v11, 0xCu);
  }

  uint64_t v9 = [(PKPaymentWebServiceBackgroundContext *)self backgroundTaskRecordsByTaskIdentifier];
  uint64_t v10 = [NSNumber numberWithUnsignedInteger:a4];
  [v9 setObject:v7 forKey:v10];

  os_unfair_lock_unlock(p_lock);
}

- (void)addBackgroundDownloadRecord:(id)a3 forRecordName:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  p_lock = &self->_lock;
  id v8 = a3;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v9 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Adding background download record for recordName %@", (uint8_t *)&v11, 0xCu);
  }

  uint64_t v10 = [(PKPaymentWebServiceBackgroundContext *)self backgroundTaskRecordsByRecordName];
  [v10 setObject:v8 forKey:v6];

  os_unfair_lock_unlock(p_lock);
}

- (id)backgroundDownloadRecordForTaskIdentifier:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = [(PKPaymentWebServiceBackgroundContext *)self backgroundTaskRecordsByTaskIdentifier];
  id v7 = [NSNumber numberWithUnsignedInteger:a3];
  id v8 = [v6 objectForKey:v7];

  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (id)backgroundDownloadRecordForRecordName:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [(PKPaymentWebServiceBackgroundContext *)self backgroundTaskRecordsByRecordName];
  id v7 = [v6 objectForKey:v5];

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (void)removeBackgroundDownloadRecordForTaskIdentifier:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    unint64_t v10 = a3;
    _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Removing background download record for task %lu", (uint8_t *)&v9, 0xCu);
  }

  id v7 = [(PKPaymentWebServiceBackgroundContext *)self backgroundTaskRecordsByTaskIdentifier];
  id v8 = [NSNumber numberWithUnsignedInteger:a3];
  [v7 removeObjectForKey:v8];

  os_unfair_lock_unlock(p_lock);
}

- (void)removeBackgroundDownloadRecordForRecordName:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Removing background download record for recordName %@", (uint8_t *)&v8, 0xCu);
  }

  id v7 = [(PKPaymentWebServiceBackgroundContext *)self backgroundTaskRecordsByRecordName];
  [v7 removeObjectForKey:v4];
  os_unfair_lock_unlock(p_lock);
}

- (id)remainingTasks
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v5 = [(PKPaymentWebServiceBackgroundContext *)self backgroundTaskRecordsByTaskIdentifier];
  id v6 = [v5 allKeys];
  [v3 addObjectsFromArray:v6];

  id v7 = [(PKPaymentWebServiceBackgroundContext *)self backgroundTaskRecordsByRecordName];
  int v8 = [v7 allKeys];
  [v3 addObjectsFromArray:v8];

  os_unfair_lock_unlock(p_lock);
  return v3;
}

- (NSMutableDictionary)backgroundTaskRecordsByTaskIdentifier
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBackgroundTaskRecordsByTaskIdentifier:(id)a3
{
}

- (NSMutableDictionary)backgroundTaskRecordsByRecordName
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBackgroundTaskRecordsByRecordName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundTaskRecordsByRecordName, 0);
  objc_storeStrong((id *)&self->_backgroundTaskRecordsByTaskIdentifier, 0);
}

@end