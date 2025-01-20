@interface _SFKeychainFetchResult
+ (id)fetchResultWithError:(id)a3;
+ (id)fetchResultWithValue:(id)a3;
- (NSError)error;
- (_SFKeychainFetchResult)initWithError:(id)a3;
- (_SFKeychainFetchResult)initWithValue:(id)a3;
- (id)value;
- (int64_t)resultType;
@end

@implementation _SFKeychainFetchResult

+ (id)fetchResultWithValue:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithValue:v4];

  return v5;
}

+ (id)fetchResultWithError:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithError:v4];

  return v5;
}

- (_SFKeychainFetchResult)initWithValue:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_SFKeychainFetchResult;
  v6 = [(_SFKeychainFetchResult *)&v10 init];
  if (v6)
  {
    v7 = objc_alloc_init(SFKeychainFetchResult_Ivars);
    id keychainFetchResultInternal = v6->_keychainFetchResultInternal;
    v6->_id keychainFetchResultInternal = v7;

    objc_storeStrong((id *)v6->_keychainFetchResultInternal + 2, a3);
    *((void *)v6->_keychainFetchResultInternal + 1) = 0;
  }

  return v6;
}

- (_SFKeychainFetchResult)initWithError:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_SFKeychainFetchResult;
  v6 = [(_SFKeychainFetchResult *)&v10 init];
  if (v6)
  {
    v7 = objc_alloc_init(SFKeychainFetchResult_Ivars);
    id keychainFetchResultInternal = v6->_keychainFetchResultInternal;
    v6->_id keychainFetchResultInternal = v7;

    objc_storeStrong((id *)v6->_keychainFetchResultInternal + 3, a3);
    *((void *)v6->_keychainFetchResultInternal + 1) = 2;
  }

  return v6;
}

- (int64_t)resultType
{
  return *((void *)self->_keychainFetchResultInternal + 1);
}

- (id)value
{
  return *((id *)self->_keychainFetchResultInternal + 2);
}

- (NSError)error
{
  return (NSError *)*((id *)self->_keychainFetchResultInternal + 3);
}

- (void).cxx_destruct
{
}

@end