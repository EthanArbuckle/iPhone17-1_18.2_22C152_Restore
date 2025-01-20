@interface PXGSingleViewUserData
- (PXGSingleViewUserData)initWithContentView:(id)a3;
- (UIView)contentView;
@end

@implementation PXGSingleViewUserData

- (void).cxx_destruct
{
}

- (UIView)contentView
{
  return self->_contentView;
}

- (PXGSingleViewUserData)initWithContentView:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXGSingleViewUserData;
  v6 = [(PXGSingleViewUserData *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_contentView, a3);
  }

  return v7;
}

@end