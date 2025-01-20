@interface AcePDController
+ (id)createWithDeviceAddress:(unsigned __int8)a3 userClient:(id)a4;
- (AcePDController)initWithAddress:(unsigned __int8)a3 userClient:(id)a4;
- (NSDictionary)aceFWStates;
- (void)setAceFWStates:(id)a3;
@end

@implementation AcePDController

+ (id)createWithDeviceAddress:(unsigned __int8)a3 userClient:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  id v7 = [objc_alloc((Class)a1) initWithAddress:v4 userClient:v6];

  return v7;
}

- (AcePDController)initWithAddress:(unsigned __int8)a3 userClient:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)AcePDController;
  return [(PDController *)&v5 initWithAddress:a3 userClient:a4];
}

- (NSDictionary)aceFWStates
{
  return self->_aceFWStates;
}

- (void)setAceFWStates:(id)a3
{
}

- (void).cxx_destruct
{
}

@end