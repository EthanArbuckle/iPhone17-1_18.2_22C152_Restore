@interface SPRAttestationManager
- (BOOL)attestWithCheckpoint:(int64_t)a3 error:(id *)a4;
- (BOOL)isValidToken:(id)a3;
- (BOOL)ping;
- (BOOL)refreshAndReturnError:(id *)a3;
- (BOOL)start;
- (BOOL)stop;
- (BOOL)verify;
- (BOOL)verifyWithRenewalPeriod:(double)a3;
- (id)getToken;
- (id)requestTokenWithWarningsAndReturnError:(id *)a3;
@end

@implementation SPRAttestationManager

- (BOOL)refreshAndReturnError:(id *)a3
{
  v7 = objc_msgSend_errorWithCode_(SPRError, a2, 7002, v3, v4, v5);

  if (a3 && v7)
  {
    objc_msgSend_errorWithCode_(SPRError, v8, 7002, v9, v10, v11);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)verify
{
  return 0;
}

- (BOOL)verifyWithRenewalPeriod:(double)a3
{
  return 0;
}

- (BOOL)attestWithCheckpoint:(int64_t)a3 error:(id *)a4
{
  v7 = objc_msgSend_errorWithCode_(SPRError, a2, 7002, (uint64_t)a4, v4, v5);

  if (a4 && v7)
  {
    objc_msgSend_errorWithCode_(SPRError, v8, 7002, v9, v10, v11);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)requestTokenWithWarningsAndReturnError:(id *)a3
{
  v7 = objc_msgSend_errorWithCode_(SPRError, a2, 7002, v3, v4, v5);

  if (a3 && v7)
  {
    objc_msgSend_errorWithCode_(SPRError, v8, 7002, v9, v10, v11);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)getToken
{
  return &stru_26D31DBA0;
}

- (BOOL)isValidToken:(id)a3
{
  return 0;
}

- (BOOL)start
{
  return 0;
}

- (BOOL)stop
{
  return 0;
}

- (BOOL)ping
{
  return 0;
}

@end