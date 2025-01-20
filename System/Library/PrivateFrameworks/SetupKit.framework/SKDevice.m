@interface SKDevice
- (NSString)identifier;
- (id)description;
- (unsigned)blePSM;
- (void)setBlePSM:(unsigned __int16)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation SKDevice

- (void).cxx_destruct
{
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setBlePSM:(unsigned __int16)a3
{
  self->_blePSM = a3;
}

- (unsigned)blePSM
{
  return self->_blePSM;
}

- (id)description
{
  v2 = [(id)objc_opt_class() description];
  v3 = NSPrintF();

  return v3;
}

@end