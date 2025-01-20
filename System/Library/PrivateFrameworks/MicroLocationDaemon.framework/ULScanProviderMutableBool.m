@interface ULScanProviderMutableBool
- (BOOL)BOOLValue;
- (ULScanProviderMutableBool)initWithBool:(BOOL)a3;
- (void)setBoolValue:(BOOL)a3;
@end

@implementation ULScanProviderMutableBool

- (ULScanProviderMutableBool)initWithBool:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ULScanProviderMutableBool;
  v4 = [(ULScanProviderMutableBool *)&v7 init];
  v5 = v4;
  if (v4) {
    [(ULScanProviderMutableBool *)v4 setBoolValue:v3];
  }
  return v5;
}

- (BOOL)BOOLValue
{
  return self->_BOOLValue;
}

- (void)setBoolValue:(BOOL)a3
{
  self->_BOOLValue = a3;
}

@end