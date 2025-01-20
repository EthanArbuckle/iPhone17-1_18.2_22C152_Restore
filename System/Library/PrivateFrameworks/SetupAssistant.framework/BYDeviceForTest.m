@interface BYDeviceForTest
- (BOOL)hasSolidStateHomeButton;
- (BOOL)supportsTrueTone;
- (BYDeviceForTest)init;
@end

@implementation BYDeviceForTest

- (BYDeviceForTest)init
{
  v7.receiver = self;
  v7.super_class = (Class)BYDeviceForTest;
  v2 = [(BYDevice *)&v7 init];
  if (v2)
  {
    v2->_hasSolidStateHomeButton = MGGetSInt32Answer() == 1;
    BOOL v3 = 1;
    uint64_t v4 = MGGetProductType();
    if (v4 > 2311900305)
    {
      if (v4 != 2311900306 && v4 != 3242623367)
      {
        uint64_t v5 = 3402870384;
        goto LABEL_9;
      }
    }
    else if (v4 != 502329937 && v4 != 896202454)
    {
      uint64_t v5 = 2270970153;
LABEL_9:
      if (v4 != v5
        && [(BYDevice *)v2 size] != 3
        && [(BYDevice *)v2 size] != 6
        && [(BYDevice *)v2 size] != 5)
      {
        BOOL v3 = [(BYDevice *)v2 size] == 4;
      }
    }
    v2->_supportsTrueTone = v3;
  }
  return v2;
}

- (BOOL)hasSolidStateHomeButton
{
  return self->_hasSolidStateHomeButton;
}

- (BOOL)supportsTrueTone
{
  return self->_supportsTrueTone;
}

@end