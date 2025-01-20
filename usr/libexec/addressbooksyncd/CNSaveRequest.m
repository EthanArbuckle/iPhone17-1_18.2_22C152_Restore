@interface CNSaveRequest
+ (id)abs_new;
+ (id)abs_transactionSignature;
@end

@implementation CNSaveRequest

+ (id)abs_new
{
  id v3 = objc_alloc_init((Class)CNSaveRequest);
  [v3 setIgnoresGuardianRestrictions:1];
  v4 = [a1 abs_transactionSignature];
  [v3 setTransactionAuthor:v4];

  return v3;
}

+ (id)abs_transactionSignature
{
  if (qword_100069D08 != -1) {
    dispatch_once(&qword_100069D08, &stru_100055668);
  }
  v2 = (void *)qword_100069D10;

  return v2;
}

@end