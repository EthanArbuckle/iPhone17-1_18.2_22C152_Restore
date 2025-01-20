@interface PKOpaqueDataServiceProviderOrder
- (void)setServiceProviderData:(id)a3;
@end

@implementation PKOpaqueDataServiceProviderOrder

- (void)setServiceProviderData:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PKOpaqueDataServiceProviderOrder;
  [(PKServiceProviderOrder *)&v3 setServiceProviderData:a3];
}

@end