@interface CXLabeledHandle
- (TULabeledHandle)tuLabeledHandle;
@end

@implementation CXLabeledHandle

- (TULabeledHandle)tuLabeledHandle
{
  v3 = [(CXLabeledHandle *)self handle];
  v4 = [v3 tuHandle];

  if (v4)
  {
    id v5 = objc_alloc((Class)TULabeledHandle);
    v6 = [(CXLabeledHandle *)self label];
    id v7 = [v5 initWithHandle:v4 label:v6 isSuggested:0];
  }
  else
  {
    id v7 = 0;
  }

  return (TULabeledHandle *)v7;
}

@end