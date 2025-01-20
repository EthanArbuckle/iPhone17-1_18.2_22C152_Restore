@interface UADebugAdvertisableItem
- (UADebugAdvertisableItem)initWithType:(unint64_t)a3 manager:(id)a4;
- (id)advertisingBytes;
- (unint64_t)debugType;
- (void)setDebugType:(unint64_t)a3;
@end

@implementation UADebugAdvertisableItem

- (UADebugAdvertisableItem)initWithType:(unint64_t)a3 manager:(id)a4
{
  id v6 = a4;
  if (!a3)
  {
    CFStringRef v7 = @"AAAAAAAA-BBBB-CCCC-DDDD-EEEEEEEEEEEE";
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    CFStringRef v7 = @"EEEEEEEE-DDDD-CCCC-BBBB-AAAAAAAAAAAA";
LABEL_5:
    id v8 = [objc_alloc((Class)NSUUID) initWithUUIDString:v7];
    goto LABEL_7;
  }
  id v8 = 0;
LABEL_7:
  v12.receiver = self;
  v12.super_class = (Class)UADebugAdvertisableItem;
  v9 = [(UADebugAdvertisableItem *)&v12 initWithUUID:v8 type:1 options:0];
  v10 = v9;
  if (v9)
  {
    [(UADebugAdvertisableItem *)v9 setType:5];
    [(UADebugAdvertisableItem *)v10 setDebugType:a3];
  }

  return v10;
}

- (id)advertisingBytes
{
  if ([(UADebugAdvertisableItem *)self debugType] > 1)
  {
    v3 = 0;
  }
  else
  {
    [(UADebugAdvertisableItem *)self type];
    v3 = (void *)_LSCreateHashedBytesForAdvertisingFromString();
  }

  return v3;
}

- (unint64_t)debugType
{
  return self->_debugType;
}

- (void)setDebugType:(unint64_t)a3
{
  self->_debugType = a3;
}

@end