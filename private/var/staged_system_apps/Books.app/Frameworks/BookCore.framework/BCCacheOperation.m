@interface BCCacheOperation
+ (id)operationWithKind:(unsigned __int16)a3 subject:(id)a4 request:(id)a5;
+ (id)operationWithKind:(unsigned __int16)a3 subject:(id)a4 result:(id)a5 request:(id)a6;
+ (id)operationWithKind:(unsigned __int16)a3 vendedImageInterest:(id)a4 request:(id)a5;
+ (id)operationWithKind:(unsigned __int16)a3 vendedImageInterest:(id)a4 subject:(id)a5 request:(id)a6;
- (BCCacheImageInterest)vendedImageInterest;
- (BICDescribedImage)request;
- (BICDescribedImage)result;
- (BICDescribedImage)subject;
- (id)description;
- (id)descriptionForKind;
- (unsigned)operationKind;
- (void)setOperationKind:(unsigned __int16)a3;
- (void)setRequest:(id)a3;
- (void)setResult:(id)a3;
- (void)setSubject:(id)a3;
- (void)setVendedImageInterest:(id)a3;
@end

@implementation BCCacheOperation

+ (id)operationWithKind:(unsigned __int16)a3 vendedImageInterest:(id)a4 subject:(id)a5 request:(id)a6
{
  uint64_t v8 = a3;
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  v12 = objc_alloc_init(BCCacheOperation);
  [(BCCacheOperation *)v12 setOperationKind:v8];
  [(BCCacheOperation *)v12 setVendedImageInterest:v11];

  [(BCCacheOperation *)v12 setRequest:v9];
  [(BCCacheOperation *)v12 setSubject:v10];

  return v12;
}

+ (id)operationWithKind:(unsigned __int16)a3 vendedImageInterest:(id)a4 request:(id)a5
{
  uint64_t v6 = a3;
  id v7 = a5;
  id v8 = a4;
  id v9 = objc_alloc_init(BCCacheOperation);
  [(BCCacheOperation *)v9 setOperationKind:v6];
  [(BCCacheOperation *)v9 setVendedImageInterest:v8];

  [(BCCacheOperation *)v9 setRequest:v7];

  return v9;
}

+ (id)operationWithKind:(unsigned __int16)a3 subject:(id)a4 request:(id)a5
{
  uint64_t v6 = a3;
  id v7 = a5;
  id v8 = a4;
  id v9 = objc_alloc_init(BCCacheOperation);
  [(BCCacheOperation *)v9 setOperationKind:v6];
  [(BCCacheOperation *)v9 setRequest:v7];

  [(BCCacheOperation *)v9 setSubject:v8];

  return v9;
}

+ (id)operationWithKind:(unsigned __int16)a3 subject:(id)a4 result:(id)a5 request:(id)a6
{
  uint64_t v8 = a3;
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  v12 = objc_alloc_init(BCCacheOperation);
  [(BCCacheOperation *)v12 setOperationKind:v8];
  [(BCCacheOperation *)v12 setRequest:v9];

  [(BCCacheOperation *)v12 setSubject:v11];
  [(BCCacheOperation *)v12 setResult:v10];

  return v12;
}

- (id)description
{
  v2 = [(BCCacheOperation *)self descriptionForKind];
  v3 = +[NSString stringWithFormat:@"Op: %@", v2];

  return v3;
}

- (id)descriptionForKind
{
  unsigned int v2 = [(BCCacheOperation *)self operationKind];
  if (v2 > 5) {
    return 0;
  }
  else {
    return (id)*((void *)&off_2CA128 + (__int16)v2);
  }
}

- (unsigned)operationKind
{
  return self->_operationKind;
}

- (void)setOperationKind:(unsigned __int16)a3
{
  self->_operationKind = a3;
}

- (BICDescribedImage)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (BICDescribedImage)subject
{
  return self->_subject;
}

- (void)setSubject:(id)a3
{
}

- (BICDescribedImage)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (BCCacheImageInterest)vendedImageInterest
{
  return self->_vendedImageInterest;
}

- (void)setVendedImageInterest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendedImageInterest, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_subject, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

@end