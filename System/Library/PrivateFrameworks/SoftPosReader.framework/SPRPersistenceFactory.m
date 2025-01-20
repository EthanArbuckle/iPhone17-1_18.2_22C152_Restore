@interface SPRPersistenceFactory
- (id)makePersistingCoreDataWithEntity:(int64_t)a3 error:(id *)a4;
- (id)makePersistingCoreDataWithName:(id)a3 error:(id *)a4;
@end

@implementation SPRPersistenceFactory

- (id)makePersistingCoreDataWithEntity:(int64_t)a3 error:(id *)a4
{
  v7 = objc_msgSend_errorWithCode_(SPRError, a2, 7002, (uint64_t)a4, v4, v5);

  if (a4 && v7)
  {
    objc_msgSend_errorWithCode_(SPRError, v8, 7002, v9, v10, v11);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)makePersistingCoreDataWithName:(id)a3 error:(id *)a4
{
  v7 = objc_msgSend_errorWithCode_(SPRError, a2, 7002, (uint64_t)a4, v4, v5);

  if (a4 && v7)
  {
    objc_msgSend_errorWithCode_(SPRError, v8, 7002, v9, v10, v11);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

@end