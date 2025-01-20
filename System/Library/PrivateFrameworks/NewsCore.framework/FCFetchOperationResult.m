@interface FCFetchOperationResult
+ (FCFetchOperationResult)resultWithStatus:(unint64_t)a3 fetchedObject:(id)a4 error:(id)a5;
- (BOOL)anyMissingObjects;
- (FCFetchOperationResult)initWithStatus:(unint64_t)a3 fetchedObject:(id)a4 fetchResult:(unint64_t)a5 error:(id)a6;
- (NSError)error;
- (NSSet)missingObjectDescriptions;
- (id)fetchedObject;
- (unint64_t)fetchResult;
- (unint64_t)status;
- (void)setMissingObjectDescriptions:(id)a3;
@end

@implementation FCFetchOperationResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_missingObjectDescriptions, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_fetchedObject, 0);
}

+ (FCFetchOperationResult)resultWithStatus:(unint64_t)a3 fetchedObject:(id)a4 error:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  v9 = [[FCFetchOperationResult alloc] initWithStatus:a3 fetchedObject:v8 fetchResult:1 error:v7];

  return v9;
}

- (FCFetchOperationResult)initWithStatus:(unint64_t)a3 fetchedObject:(id)a4 fetchResult:(unint64_t)a5 error:(id)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a6;
  if (a3 && v11)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    v13 = (void *)[[NSString alloc] initWithFormat:@"fetchedObject must be nil if the operation wasn't successful"];
    *(_DWORD *)buf = 136315906;
    v20 = "-[FCFetchOperationResult initWithStatus:fetchedObject:fetchResult:error:]";
    __int16 v21 = 2080;
    v22 = "FCFetchOperation.m";
    __int16 v23 = 1024;
    int v24 = 173;
    __int16 v25 = 2114;
    v26 = v13;
    v14 = MEMORY[0x1E4F14500];
    goto LABEL_12;
  }
  if (!a3 && !v11 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v13 = (void *)[[NSString alloc] initWithFormat:@"fetchedObject must not be nil if the operation was successful"];
    *(_DWORD *)buf = 136315906;
    v20 = "-[FCFetchOperationResult initWithStatus:fetchedObject:fetchResult:error:]";
    __int16 v21 = 2080;
    v22 = "FCFetchOperation.m";
    __int16 v23 = 1024;
    int v24 = 174;
    __int16 v25 = 2114;
    v26 = v13;
    v14 = MEMORY[0x1E4F14500];
LABEL_12:
    _os_log_error_impl(&dword_1A460D000, v14, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_8:
  v18.receiver = self;
  v18.super_class = (Class)FCFetchOperationResult;
  v15 = [(FCFetchOperationResult *)&v18 init];
  v16 = v15;
  if (v15)
  {
    v15->_status = a3;
    objc_storeStrong(&v15->_fetchedObject, a4);
    v16->_fetchResult = a5;
    objc_storeStrong((id *)&v16->_error, a6);
  }

  return v16;
}

- (void)setMissingObjectDescriptions:(id)a3
{
}

- (unint64_t)status
{
  return self->_status;
}

- (id)fetchedObject
{
  return self->_fetchedObject;
}

- (NSError)error
{
  return self->_error;
}

- (NSSet)missingObjectDescriptions
{
  return self->_missingObjectDescriptions;
}

- (BOOL)anyMissingObjects
{
  v2 = [(FCFetchOperationResult *)self missingObjectDescriptions];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (unint64_t)fetchResult
{
  return self->_fetchResult;
}

@end