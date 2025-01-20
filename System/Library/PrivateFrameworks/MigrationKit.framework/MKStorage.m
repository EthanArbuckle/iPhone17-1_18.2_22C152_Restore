@interface MKStorage
- (MKStorage)init;
- (unint64_t)availableSpaceInBytes;
- (unint64_t)availableSpaceInGigabytes;
- (unint64_t)availableSpaceInMegabytes;
- (unint64_t)availableSpaceInTerabytes;
- (void)setAvailableSpaceInBytes:(unint64_t)a3;
- (void)setAvailableSpaceInGigabytes:(unint64_t)a3;
- (void)setAvailableSpaceInMegabytes:(unint64_t)a3;
- (void)setAvailableSpaceInTerabytes:(unint64_t)a3;
@end

@implementation MKStorage

- (MKStorage)init
{
  v7.receiver = self;
  v7.super_class = (Class)MKStorage;
  v2 = [(MKStorage *)&v7 init];
  if (v2)
  {
    v3 = (void *)MGCopyAnswer();
    objc_opt_class();
    unint64_t v4 = 0;
    if (objc_opt_isKindOfClass())
    {
      v5 = [v3 objectForKey:*MEMORY[0x263F8BD10]];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        unint64_t v4 = [v5 unsignedLongLongValue];
      }
      else {
        unint64_t v4 = 0;
      }
    }
    [(MKStorage *)v2 setAvailableSpaceInBytes:v4];
    [(MKStorage *)v2 setAvailableSpaceInMegabytes:v4 >> 20];
    [(MKStorage *)v2 setAvailableSpaceInGigabytes:v2->_availableSpaceInMegabytes >> 10];
    [(MKStorage *)v2 setAvailableSpaceInTerabytes:v2->_availableSpaceInGigabytes >> 10];
  }
  return v2;
}

- (unint64_t)availableSpaceInBytes
{
  return self->_availableSpaceInBytes;
}

- (void)setAvailableSpaceInBytes:(unint64_t)a3
{
  self->_availableSpaceInBytes = a3;
}

- (unint64_t)availableSpaceInMegabytes
{
  return self->_availableSpaceInMegabytes;
}

- (void)setAvailableSpaceInMegabytes:(unint64_t)a3
{
  self->_availableSpaceInMegabytes = a3;
}

- (unint64_t)availableSpaceInGigabytes
{
  return self->_availableSpaceInGigabytes;
}

- (void)setAvailableSpaceInGigabytes:(unint64_t)a3
{
  self->_availableSpaceInGigabytes = a3;
}

- (unint64_t)availableSpaceInTerabytes
{
  return self->_availableSpaceInTerabytes;
}

- (void)setAvailableSpaceInTerabytes:(unint64_t)a3
{
  self->_availableSpaceInTerabytes = a3;
}

@end