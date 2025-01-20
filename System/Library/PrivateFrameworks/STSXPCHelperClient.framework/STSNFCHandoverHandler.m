@interface STSNFCHandoverHandler
- (STSNFCHandoverHandler)init;
@end

@implementation STSNFCHandoverHandler

- (STSNFCHandoverHandler)init
{
  v6.receiver = self;
  v6.super_class = (Class)STSNFCHandoverHandler;
  v2 = [(STSNFCHandoverHandler *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableData *)objc_alloc_init(MEMORY[0x263EFF990]);
    apduBuffer = v2->_apduBuffer;
    v2->_apduBuffer = v3;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseBuffer, 0);

  objc_storeStrong((id *)&self->_apduBuffer, 0);
}

@end