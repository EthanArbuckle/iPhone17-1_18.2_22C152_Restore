@interface CXCallDTMFUpdate
- (id)tuCallDTMFUpdate;
@end

@implementation CXCallDTMFUpdate

- (id)tuCallDTMFUpdate
{
  id v3 = objc_alloc((Class)TUCallDTMFUpdate);
  v4 = [(CXCallDTMFUpdate *)self digits];
  id v5 = [v3 initWithDigits:v4];

  v6 = [(CXCallDTMFUpdate *)self UUID];
  [v5 setUUID:v6];

  return v5;
}

@end