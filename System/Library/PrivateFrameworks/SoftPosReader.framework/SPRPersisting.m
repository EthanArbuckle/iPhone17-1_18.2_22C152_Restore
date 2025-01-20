@interface SPRPersisting
- (BOOL)deleteAll:(id *)a3;
- (BOOL)deleteWithKey:(id)a3 error:(id *)a4;
- (BOOL)insertWithKey:(id)a3 value:(id)a4 error:(id *)a5;
- (BOOL)updateWithKey:(id)a3 value:(id)a4 error:(id *)a5;
- (id)retrieveAll:(id *)a3;
- (id)retrieveWithKey:(id)a3 error:(id *)a4;
@end

@implementation SPRPersisting

- (BOOL)insertWithKey:(id)a3 value:(id)a4 error:(id *)a5
{
  v7 = objc_msgSend_errorWithCode_(SPRError, a2, 7002, (uint64_t)a4, (uint64_t)a5, v5);

  if (a5 && v7)
  {
    objc_msgSend_errorWithCode_(SPRError, v8, 7002, v9, v10, v11);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)retrieveWithKey:(id)a3 error:(id *)a4
{
  v7 = objc_msgSend_errorWithCode_(SPRError, a2, 7002, (uint64_t)a4, v4, v5);

  if (a4 && v7)
  {
    objc_msgSend_errorWithCode_(SPRError, v8, 7002, v9, v10, v11);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)updateWithKey:(id)a3 value:(id)a4 error:(id *)a5
{
  v7 = objc_msgSend_errorWithCode_(SPRError, a2, 7002, (uint64_t)a4, (uint64_t)a5, v5);

  if (a5 && v7)
  {
    objc_msgSend_errorWithCode_(SPRError, v8, 7002, v9, v10, v11);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)deleteWithKey:(id)a3 error:(id *)a4
{
  v7 = objc_msgSend_errorWithCode_(SPRError, a2, 7002, (uint64_t)a4, v4, v5);

  if (a4 && v7)
  {
    objc_msgSend_errorWithCode_(SPRError, v8, 7002, v9, v10, v11);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)deleteAll:(id *)a3
{
  v7 = objc_msgSend_errorWithCode_(SPRError, a2, 7002, v3, v4, v5);

  if (a3 && v7)
  {
    objc_msgSend_errorWithCode_(SPRError, v8, 7002, v9, v10, v11);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)retrieveAll:(id *)a3
{
  v7 = objc_msgSend_errorWithCode_(SPRError, a2, 7002, v3, v4, v5);

  if (a3 && v7)
  {
    objc_msgSend_errorWithCode_(SPRError, v8, 7002, v9, v10, v11);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

@end