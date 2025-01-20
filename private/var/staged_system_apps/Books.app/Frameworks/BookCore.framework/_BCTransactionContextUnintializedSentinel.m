@interface _BCTransactionContextUnintializedSentinel
+ (id)sharedInstance;
@end

@implementation _BCTransactionContextUnintializedSentinel

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_139678;
  block[3] = &unk_2C3BB8;
  block[4] = a1;
  if (qword_349340 != -1) {
    dispatch_once(&qword_349340, block);
  }
  v2 = (void *)qword_349348;

  return v2;
}

@end