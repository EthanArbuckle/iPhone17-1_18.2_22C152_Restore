@interface CHPhoneIconParameters
- (int)appIconFormat;
- (void)setAppIconFormat:(int)a3;
@end

@implementation CHPhoneIconParameters

- (int)appIconFormat
{
  return self->_appIconFormat;
}

- (void)setAppIconFormat:(int)a3
{
  self->_appIconFormat = a3;
}

@end