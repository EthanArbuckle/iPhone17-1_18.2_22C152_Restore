@interface InstanceRepresentation
- (InstanceRepresentation)initWithAID:(id)a3;
- (NSMutableArray)keys;
- (NSString)AID;
- (void)setAID:(id)a3;
- (void)setKeys:(id)a3;
@end

@implementation InstanceRepresentation

- (InstanceRepresentation)initWithAID:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)InstanceRepresentation;
  v5 = [(InstanceRepresentation *)&v14 init];
  v6 = v5;
  if (v5)
  {
    [(InstanceRepresentation *)v5 setAID:v4];
    v7 = +[NSMutableArray arrayWithCapacity:80];
    [(InstanceRepresentation *)v6 setKeys:v7];

    unsigned int v8 = 0;
    while (1)
    {
      v9 = +[KeySlot emptySlot:(unsigned __int16)v8];
      v10 = v9;
      if (v8 < 2) {
        break;
      }
      if (v8 <= 0xF)
      {
        uint64_t v11 = 5;
        goto LABEL_7;
      }
LABEL_8:
      v12 = [(InstanceRepresentation *)v6 keys];
      [v12 addObject:v10];

      if (++v8 == 80) {
        goto LABEL_9;
      }
    }
    uint64_t v11 = 4;
LABEL_7:
    [v9 setState:v11];
    goto LABEL_8;
  }
LABEL_9:

  return v6;
}

- (NSString)AID
{
  return self->_AID;
}

- (void)setAID:(id)a3
{
}

- (NSMutableArray)keys
{
  return self->_keys;
}

- (void)setKeys:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keys, 0);

  objc_storeStrong((id *)&self->_AID, 0);
}

@end