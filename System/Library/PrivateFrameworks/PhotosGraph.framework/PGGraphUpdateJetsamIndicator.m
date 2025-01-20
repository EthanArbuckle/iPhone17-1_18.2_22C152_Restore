@interface PGGraphUpdateJetsamIndicator
- (BOOL)indicatorExists;
- (BOOL)updateDidCauseJetsam;
- (NSURL)indicatorURL;
- (PGGraphUpdateJetsamIndicator)initWithIndicatorDirectoryURL:(id)a3;
- (PGGraphUpdateJetsamIndicator)initWithPhotoLibrary:(id)a3;
- (id)description;
- (int64_t)maxRetryCount;
- (int64_t)retryCount;
- (void)_readIndicator;
- (void)_removeIndicator;
- (void)clear;
- (void)markUpdate;
- (void)setIndicatorExists:(BOOL)a3;
- (void)setMaxRetryCount:(int64_t)a3;
- (void)setRetryCount:(int64_t)a3;
@end

@implementation PGGraphUpdateJetsamIndicator

- (void).cxx_destruct
{
}

- (void)setMaxRetryCount:(int64_t)a3
{
  self->_maxRetryCount = a3;
}

- (int64_t)maxRetryCount
{
  return self->_maxRetryCount;
}

- (void)setIndicatorExists:(BOOL)a3
{
  self->_indicatorExists = a3;
}

- (BOOL)indicatorExists
{
  return self->_indicatorExists;
}

- (void)setRetryCount:(int64_t)a3
{
  self->_retryCount = a3;
}

- (int64_t)retryCount
{
  return self->_retryCount;
}

- (NSURL)indicatorURL
{
  return self->_indicatorURL;
}

- (void)_removeIndicator
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = [(PGGraphUpdateJetsamIndicator *)self indicatorURL];
  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  v5 = [v3 path];
  int v6 = [v4 fileExistsAtPath:v5];

  if (v6)
  {
    id v9 = 0;
    char v7 = [v4 removeItemAtURL:v3 error:&v9];
    id v8 = v9;
    if ((v7 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v8;
      _os_log_fault_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "JetsamIndicator - removing indicator file from disk failed with error: %@", buf, 0xCu);
    }
    [(PGGraphUpdateJetsamIndicator *)self setIndicatorExists:0];
  }
  else if ([(PGGraphUpdateJetsamIndicator *)self indicatorExists] {
         && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  }
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "JetsamIndicator - no indicator file but JetsamIndicator instance believes indicator exists", buf, 2u);
  }
}

- (void)_readIndicator
{
  v3 = (void *)MEMORY[0x1E4F1C9B8];
  v4 = [(PGGraphUpdateJetsamIndicator *)self indicatorURL];
  v5 = [v3 dataWithContentsOfURL:v4];

  if (v5)
  {
    uint64_t v11 = 0;
    int v6 = [MEMORY[0x1E4F28F98] propertyListWithData:v5 options:0 format:0 error:&v11];
    char v7 = v6;
    BOOL v8 = v6 != 0;
    if (v6)
    {
      id v9 = [v6 objectForKeyedSubscript:@"retryCount"];
      uint64_t v10 = [v9 integerValue];
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
    uint64_t v10 = 0;
  }
  [(PGGraphUpdateJetsamIndicator *)self setRetryCount:v10];
  [(PGGraphUpdateJetsamIndicator *)self setIndicatorExists:v8];
}

- (void)clear
{
  [(PGGraphUpdateJetsamIndicator *)self _removeIndicator];
  [(PGGraphUpdateJetsamIndicator *)self setRetryCount:0];
}

- (void)markUpdate
{
  v16[1] = *MEMORY[0x1E4F143B8];
  [(PGGraphUpdateJetsamIndicator *)self setRetryCount:[(PGGraphUpdateJetsamIndicator *)self retryCount] + 1];
  v15 = @"retryCount";
  v3 = objc_msgSend(NSNumber, "numberWithInteger:", -[PGGraphUpdateJetsamIndicator retryCount](self, "retryCount"));
  v16[0] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];

  id v12 = 0;
  v5 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v4 format:200 options:0 error:&v12];
  id v6 = v12;
  char v7 = v6;
  if (v5)
  {
    BOOL v8 = [(PGGraphUpdateJetsamIndicator *)self indicatorURL];
    id v11 = v7;
    char v9 = [v5 writeToURL:v8 options:1073741825 error:&v11];
    id v10 = v11;

    if ((v9 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v10;
      _os_log_fault_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "JetsamIndicator - failed to write indicator to disk with error: %@", buf, 0xCu);
    }
    [(PGGraphUpdateJetsamIndicator *)self setIndicatorExists:1];
  }
  else
  {
    id v10 = v6;
  }
}

- (BOOL)updateDidCauseJetsam
{
  [(PGGraphUpdateJetsamIndicator *)self _readIndicator];
  int64_t v3 = [(PGGraphUpdateJetsamIndicator *)self retryCount];
  if (v3 < [(PGGraphUpdateJetsamIndicator *)self maxRetryCount]) {
    return 0;
  }
  return [(PGGraphUpdateJetsamIndicator *)self indicatorExists];
}

- (id)description
{
  int64_t v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)PGGraphUpdateJetsamIndicator;
  v4 = [(PGGraphUpdateJetsamIndicator *)&v11 description];
  v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[PGGraphUpdateJetsamIndicator retryCount](self, "retryCount"));
  id v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[PGGraphUpdateJetsamIndicator maxRetryCount](self, "maxRetryCount"));
  char v7 = objc_msgSend(NSNumber, "numberWithBool:", -[PGGraphUpdateJetsamIndicator indicatorExists](self, "indicatorExists"));
  BOOL v8 = [(PGGraphUpdateJetsamIndicator *)self indicatorURL];
  char v9 = [v3 stringWithFormat:@"%@ - retryCount: %@ (maxRetryCount: %@), indicatorExists: %@, indicator URL: %@", v4, v5, v6, v7, v8];

  return v9;
}

- (PGGraphUpdateJetsamIndicator)initWithIndicatorDirectoryURL:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphUpdateJetsamIndicator;
  v5 = [(PGGraphUpdateJetsamIndicator *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 URLByAppendingPathComponent:@"updatejetsam.plist"];
    indicatorURL = v5->_indicatorURL;
    v5->_indicatorURL = (NSURL *)v6;

    v5->_maxRetryCount = 1;
  }

  return v5;
}

- (PGGraphUpdateJetsamIndicator)initWithPhotoLibrary:(id)a3
{
  id v4 = objc_msgSend(a3, "pg_urlForGraphApplicationData");
  v5 = [(PGGraphUpdateJetsamIndicator *)self initWithIndicatorDirectoryURL:v4];

  return v5;
}

@end