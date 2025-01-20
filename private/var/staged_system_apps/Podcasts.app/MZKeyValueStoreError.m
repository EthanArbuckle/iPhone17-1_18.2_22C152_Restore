@interface MZKeyValueStoreError
+ (id)clientClampErrorWithTransaction:(id)a3 retrySeconds:(double)a4 underlyingError:(id)a5;
+ (id)delegateCancelledErrorWithTransaction:(id)a3 underlyingError:(id)a4;
+ (id)keyValueStoreDisabledErrorWithTransaction:(id)a3 underlyingError:(id)a4;
+ (id)keyValueStoreErrorWithCode:(int64_t)a3 localizedDescription:(id)a4 transaction:(id)a5 underlyingError:(id)a6;
+ (id)killSwitchErrorWithTransaction:(id)a3 underlyingError:(id)a4;
+ (id)networkingBlockedErrorWithTransaction:(id)a3 underlyingError:(id)a4;
+ (id)noStoreAccountErrorWithTransaction:(id)a3 underlyingError:(id)a4;
+ (id)serverClampErrorWithTransaction:(id)a3 retrySeconds:(double)a4 underlyingError:(id)a5;
+ (id)storeAccountMismatchErrorWithPreviousStoreAccountText:(id)a3 currentStoreAccontText:(id)a4 transaction:(id)a5 underlyingError:(id)a6;
+ (id)storeAccountSessionExpiredWithTransaction:(id)a3 underlyingError:(id)a4;
+ (id)storeGenericErrorWithTransaction:(id)a3 underlyingError:(id)a4;
+ (id)storeLoggedOutErrorWithPreviousStoreAccountText:(id)a3 transaction:(id)a4 underlyingError:(id)a5;
+ (id)storeValidationErrorWithTransaction:(id)a3 underlyingError:(id)a4;
+ (id)transactionCancelledErrorWithTransaction:(id)a3 code:(int64_t)a4 underlyingError:(id)a5;
+ (id)transactionCancelledErrorWithTransaction:(id)a3 underlyingError:(id)a4;
+ (id)transactionMissingDomainErrorWithTransaction:(id)a3 underlyingError:(id)a4;
+ (id)transactionMissingURLErrorWithTransaction:(id)a3 underlyingError:(id)a4;
+ (id)transactionTimeoutErrorWithTransaction:(id)a3 underlyingError:(id)a4;
+ (id)unknownErrorWithTransaction:(id)a3 underlyingError:(id)a4;
+ (id)userCancelledSignInErrorWithTransaction:(id)a3 underlyingError:(id)a4;
+ (id)userClampErrorWithTransaction:(id)a3 retrySeconds:(double)a4 underlyingError:(id)a5;
+ (id)userEnteredWrongCredentialsErrorWithTransaction:(id)a3 underlyingError:(id)a4;
- (BOOL)isAccountsChangedError;
- (BOOL)isAuthenticationError;
- (BOOL)isClampError;
- (BOOL)isRecoverableError;
- (BOOL)isTransactionCancelledError;
- (BOOL)isTransactionMissingInformationError;
- (NSString)transactionDescription;
- (double)retrySeconds;
- (id)copyWithZone:(_NSZone *)a3;
- (id)currentStoreAccountKey;
- (id)description;
- (id)previousStoreAccountKey;
- (void)setTransactionDescription:(id)a3;
@end

@implementation MZKeyValueStoreError

- (id)description
{
  v3 = [(MZKeyValueStoreError *)self userInfo];
  v4 = [v3 objectForKey:NSUnderlyingErrorKey];

  if (v4)
  {
    +[NSString stringWithFormat:@", underlying error = \"%@\"", v4];
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &stru_10056A8A0;
  }
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = [(MZKeyValueStoreError *)self localizedDescription];
  v9 = +[NSString stringWithFormat:@"<%@:%p> \"%@\"%@", v7, self, v8, v5];

  return v9;
}

- (BOOL)isAuthenticationError
{
  return ((unint64_t)[(MZKeyValueStoreError *)self code] & 0xFFFFFFFFFFFFFFFCLL) == -1004;
}

- (BOOL)isAccountsChangedError
{
  return (((unint64_t)[(MZKeyValueStoreError *)self code] + 1003) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (BOOL)isRecoverableError
{
  uint64_t v2 = (uint64_t)[(MZKeyValueStoreError *)self code];
  BOOL result = 1;
  if (v2 > -2007)
  {
    if ((unint64_t)(v2 + 1008) >= 4 && (unint64_t)(v2 + 2006) >= 2 && v2 != -1) {
      return result;
    }
    return 0;
  }
  if ((unint64_t)(v2 + 4003) < 3 || (unint64_t)(v2 + 3002) < 2) {
    return 0;
  }
  return result;
}

- (BOOL)isClampError
{
  id v2 = [(MZKeyValueStoreError *)self code];
  return (unint64_t)v2 + 2004 < 4 || v2 == (id)-1009;
}

- (BOOL)isTransactionCancelledError
{
  return ((unint64_t)[(MZKeyValueStoreError *)self code] & 0xFFFFFFFFFFFFFFFELL) == -4002;
}

- (BOOL)isTransactionMissingInformationError
{
  return ((unint64_t)[(MZKeyValueStoreError *)self code] & 0xFFFFFFFFFFFFFFFELL) == -3002;
}

- (id)previousStoreAccountKey
{
  id v2 = [(MZKeyValueStoreError *)self userInfo];
  v3 = [v2 valueForKey:@"MZKeyValueStorePreviousStoreAccountKey"];

  return v3;
}

- (id)currentStoreAccountKey
{
  id v2 = [(MZKeyValueStoreError *)self userInfo];
  v3 = [v2 valueForKey:@"MZKeyValueStoreCurrentStoreAccountKey"];

  return v3;
}

- (double)retrySeconds
{
  id v2 = [(MZKeyValueStoreError *)self userInfo];
  v3 = [v2 valueForKey:@"MZKeyValueStoreRetrySecondsKey"];

  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MZKeyValueStoreError;
  id v4 = [(MZKeyValueStoreError *)&v7 copyWithZone:a3];
  double v5 = [(MZKeyValueStoreError *)self transactionDescription];
  [v4 setTransactionDescription:v5];

  return v4;
}

+ (id)keyValueStoreErrorWithCode:(int64_t)a3 localizedDescription:(id)a4 transaction:(id)a5 underlyingError:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  v11 = +[NSDictionary dictionaryWithObject:a4 forKey:NSLocalizedDescriptionKey];
  v12 = sub_1000ADD54(v11, v9);

  v13 = +[MZKeyValueStoreError errorWithDomain:@"MZKeyValueStoreErrorDomain" code:a3 userInfo:v12];

  v14 = [v10 description];

  [v13 setTransactionDescription:v14];

  return v13;
}

+ (id)unknownErrorWithTransaction:(id)a3 underlyingError:(id)a4
{
  id v4 = a4;
  double v5 = +[NSString stringWithFormat:@"MZKeyValueStoreErrorGeneric: An unknown server error occurred.  Please %@", @"submit a bug to PEP Podcasts with console logs attached"];
  v6 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v5, NSLocalizedDescriptionKey, 0);

  objc_super v7 = sub_1000ADD54(v6, v4);

  v8 = +[MZKeyValueStoreError errorWithDomain:@"MZKeyValueStoreErrorDomain" code:-1 userInfo:v7];

  return v8;
}

+ (id)keyValueStoreDisabledErrorWithTransaction:(id)a3 underlyingError:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_super v7 = sub_1000ADF88(-2006);
  v8 = +[MZKeyValueStoreError keyValueStoreErrorWithCode:-2006 localizedDescription:v7 transaction:v6 underlyingError:v5];

  return v8;
}

+ (id)networkingBlockedErrorWithTransaction:(id)a3 underlyingError:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_super v7 = sub_1000ADF88(-2004);
  v8 = +[MZKeyValueStoreError keyValueStoreErrorWithCode:-2004 localizedDescription:v7 transaction:v6 underlyingError:v5];

  return v8;
}

+ (id)killSwitchErrorWithTransaction:(id)a3 underlyingError:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_super v7 = sub_1000ADF88(-2005);
  v8 = +[MZKeyValueStoreError keyValueStoreErrorWithCode:-2005 localizedDescription:v7 transaction:v6 underlyingError:v5];

  return v8;
}

+ (id)storeLoggedOutErrorWithPreviousStoreAccountText:(id)a3 transaction:(id)a4 underlyingError:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[NSMutableDictionary dictionary];
  [v10 setValue:@"MZKeyValueStoreErrorStoreAccountLoggedOut" forKey:NSLocalizedDescriptionKey];
  [v10 setValue:v9 forKey:@"MZKeyValueStorePreviousStoreAccountKey"];

  v11 = sub_1000ADD54(v10, v7);

  v12 = +[MZKeyValueStoreError errorWithDomain:@"MZKeyValueStoreErrorDomain" code:-1002 userInfo:v11];

  v13 = [v8 description];

  [v12 setTransactionDescription:v13];

  return v12;
}

+ (id)storeAccountMismatchErrorWithPreviousStoreAccountText:(id)a3 currentStoreAccontText:(id)a4 transaction:(id)a5 underlyingError:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = +[NSMutableDictionary dictionary];
  [v13 setValue:@"MZKeyValueStoreErrorStoreAccountMismatch" forKey:NSLocalizedDescriptionKey];
  [v13 setValue:v12 forKey:@"MZKeyValueStorePreviousStoreAccountKey"];

  [v13 setValue:v11 forKey:@"MZKeyValueStoreCurrentStoreAccountKey"];
  v14 = sub_1000ADD54(v13, v9);

  v15 = +[MZKeyValueStoreError errorWithDomain:@"MZKeyValueStoreErrorDomain" code:-1003 userInfo:v14];

  v16 = [v10 description];

  [v15 setTransactionDescription:v16];

  return v15;
}

+ (id)storeGenericErrorWithTransaction:(id)a3 underlyingError:(id)a4
{
  id v4 = a4;
  id v5 = +[NSDictionary dictionaryWithObject:@"MZKeyValueStoreErrorGeneric: This usually means your format is wrong. Turn on MZ_KVSTORE_SERIALIZER_LOG and MZ_KVSTORE_LOG for debugging." forKey:NSLocalizedDescriptionKey];
  id v6 = sub_1000ADD54(v5, v4);

  id v7 = +[MZKeyValueStoreError errorWithDomain:@"MZKeyValueStoreErrorDomain" code:-1007 userInfo:v6];

  return v7;
}

+ (id)storeValidationErrorWithTransaction:(id)a3 underlyingError:(id)a4
{
  id v4 = a4;
  id v5 = +[NSDictionary dictionaryWithObject:@"MZKeyValueStoreErrorValidation: Your request is invalid, maybe referenced a non-existent Domain. Turn on MZ_KVSTORE_SERIALIZER_LOG and MZ_KVSTORE_LOG for debugging" forKey:NSLocalizedDescriptionKey];
  id v6 = sub_1000ADD54(v5, v4);

  id v7 = +[MZKeyValueStoreError errorWithDomain:@"MZKeyValueStoreErrorDomain" code:-1007 userInfo:v6];

  return v7;
}

+ (id)userCancelledSignInErrorWithTransaction:(id)a3 underlyingError:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = sub_1000ADF88(-1005);
  id v8 = +[MZKeyValueStoreError keyValueStoreErrorWithCode:-1005 localizedDescription:v7 transaction:v6 underlyingError:v5];

  return v8;
}

+ (id)userEnteredWrongCredentialsErrorWithTransaction:(id)a3 underlyingError:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = sub_1000ADF88(-1006);
  id v8 = +[MZKeyValueStoreError keyValueStoreErrorWithCode:-1006 localizedDescription:v7 transaction:v6 underlyingError:v5];

  return v8;
}

+ (id)noStoreAccountErrorWithTransaction:(id)a3 underlyingError:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = sub_1000ADF88(-1001);
  id v8 = +[MZKeyValueStoreError keyValueStoreErrorWithCode:-1001 localizedDescription:v7 transaction:v6 underlyingError:v5];

  return v8;
}

+ (id)storeAccountSessionExpiredWithTransaction:(id)a3 underlyingError:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = sub_1000ADF88(-1004);
  id v8 = +[MZKeyValueStoreError keyValueStoreErrorWithCode:-1004 localizedDescription:v7 transaction:v6 underlyingError:v5];

  return v8;
}

+ (id)transactionMissingDomainErrorWithTransaction:(id)a3 underlyingError:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = sub_1000ADF88(-3002);
  id v8 = +[MZKeyValueStoreError keyValueStoreErrorWithCode:-3002 localizedDescription:v7 transaction:v6 underlyingError:v5];

  return v8;
}

+ (id)transactionMissingURLErrorWithTransaction:(id)a3 underlyingError:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = sub_1000ADF88(-3001);
  id v8 = +[MZKeyValueStoreError keyValueStoreErrorWithCode:-3001 localizedDescription:v7 transaction:v6 underlyingError:v5];

  return v8;
}

+ (id)transactionCancelledErrorWithTransaction:(id)a3 code:(int64_t)a4 underlyingError:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = sub_1000ADF88(a4);
  id v10 = +[MZKeyValueStoreError keyValueStoreErrorWithCode:a4 localizedDescription:v9 transaction:v8 underlyingError:v7];

  return v10;
}

+ (id)transactionTimeoutErrorWithTransaction:(id)a3 underlyingError:(id)a4
{
  return [a1 transactionCancelledErrorWithTransaction:a3 code:-4003 underlyingError:a4];
}

+ (id)transactionCancelledErrorWithTransaction:(id)a3 underlyingError:(id)a4
{
  return [a1 transactionCancelledErrorWithTransaction:a3 code:-4001 underlyingError:a4];
}

+ (id)delegateCancelledErrorWithTransaction:(id)a3 underlyingError:(id)a4
{
  return [a1 transactionCancelledErrorWithTransaction:a3 code:-4002 underlyingError:a4];
}

+ (id)userClampErrorWithTransaction:(id)a3 retrySeconds:(double)a4 underlyingError:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = +[NSMutableDictionary dictionary];
  [v9 setValue:@"MZKeyValueStoreErrorUserClamp" forKey:NSLocalizedDescriptionKey];
  if (fabs(a4) > 2.22044605e-16)
  {
    id v10 = +[NSNumber numberWithDouble:a4];
    [v9 setValue:v10 forKey:@"MZKeyValueStoreRetrySecondsKey"];
  }
  id v11 = sub_1000ADD54(v9, v7);
  id v12 = +[MZKeyValueStoreError errorWithDomain:@"MZKeyValueStoreErrorDomain" code:-2003 userInfo:v11];

  v13 = [v8 description];

  [v12 setTransactionDescription:v13];

  return v12;
}

+ (id)clientClampErrorWithTransaction:(id)a3 retrySeconds:(double)a4 underlyingError:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = +[NSMutableDictionary dictionary];
  [v9 setValue:@"MZKeyValueStoreErrorClientClamp" forKey:NSLocalizedDescriptionKey];
  if (fabs(a4) > 2.22044605e-16)
  {
    id v10 = +[NSNumber numberWithDouble:a4];
    [v9 setValue:v10 forKey:@"MZKeyValueStoreRetrySecondsKey"];
  }
  id v11 = sub_1000ADD54(v9, v7);
  id v12 = +[MZKeyValueStoreError errorWithDomain:@"MZKeyValueStoreErrorDomain" code:-1009 userInfo:v11];

  v13 = [v8 description];

  [v12 setTransactionDescription:v13];

  return v12;
}

+ (id)serverClampErrorWithTransaction:(id)a3 retrySeconds:(double)a4 underlyingError:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = +[NSMutableDictionary dictionary];
  [v9 setValue:@"MZKeyValueStoreErrorServerClamp" forKey:NSLocalizedDescriptionKey];
  if (fabs(a4) > 2.22044605e-16)
  {
    id v10 = +[NSNumber numberWithDouble:a4];
    [v9 setValue:v10 forKey:@"MZKeyValueStoreRetrySecondsKey"];
  }
  id v11 = sub_1000ADD54(v9, v7);
  id v12 = +[MZKeyValueStoreError errorWithDomain:@"MZKeyValueStoreErrorDomain" code:-2002 userInfo:v11];

  v13 = [v8 description];

  [v12 setTransactionDescription:v13];

  return v12;
}

- (NSString)transactionDescription
{
  return self->_transactionDescription;
}

- (void)setTransactionDescription:(id)a3
{
}

- (void).cxx_destruct
{
}

@end