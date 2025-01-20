@interface NameAndPrinters
- (NSArray)printers;
- (NSString)networkName;
- (void)setNetworkName:(id)a3;
- (void)setPrinters:(id)a3;
@end

@implementation NameAndPrinters

- (NSString)networkName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setNetworkName:(id)a3
{
}

- (NSArray)printers
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPrinters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_printers, 0);

  objc_storeStrong((id *)&self->_networkName, 0);
}

@end