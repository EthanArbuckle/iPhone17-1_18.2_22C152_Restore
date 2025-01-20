@interface MessageListCellHelperMobileMailProxy
+ (id)addressListFormatter;
+ (id)sharedApplicationProxy;
- (BOOL)isMessageListCellObject:(id)a3;
- (BOOL)showToCCIndicators;
- (MUIAddressListFormatter)addressListFormatter;
@end

@implementation MessageListCellHelperMobileMailProxy

+ (id)addressListFormatter
{
  if (qword_100699878 != -1) {
    dispatch_once(&qword_100699878, &stru_100609220);
  }
  v2 = (void *)qword_100699870;

  return v2;
}

- (BOOL)isMessageListCellObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (id)sharedApplicationProxy
{
  if (qword_100699888 != -1) {
    dispatch_once(&qword_100699888, &stru_100609240);
  }
  v2 = (void *)qword_100699880;

  return v2;
}

- (BOOL)showToCCIndicators
{
  return sub_100057180(0);
}

- (MUIAddressListFormatter)addressListFormatter
{
  return (MUIAddressListFormatter *)+[MessageListCellHelperMobileMailProxy addressListFormatter];
}

@end