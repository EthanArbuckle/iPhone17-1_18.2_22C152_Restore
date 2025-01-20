@interface SKProductsResponseInternal
@end

@implementation SKProductsResponseInternal

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_products, 0);

  objc_storeStrong((id *)&self->_invalidIdentifiers, 0);
}

@end