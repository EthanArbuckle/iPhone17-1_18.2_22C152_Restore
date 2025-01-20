@interface CLPAccessoryMeta
- (CLPAccessoryMeta)initWithAccessory:(id)a3;
@end

@implementation CLPAccessoryMeta

- (CLPAccessoryMeta)initWithAccessory:(id)a3
{
  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)CLPAccessoryMeta;
    v4 = [(CLPAccessoryMeta *)&v6 init];
    if (v4)
    {
      -[CLPAccessoryMeta setMake:](v4, "setMake:", [a3 manufacturer]);
      -[CLPAccessoryMeta setModel:](v4, "setModel:", [a3 modelNumber]);
      -[CLPAccessoryMeta setVersion:](v4, "setVersion:", [a3 firmwareRevision]);
    }
  }
  else
  {

    return 0;
  }
  return v4;
}

@end