@interface HAPAccessoryWakeTuple
- (BOOL)isEqual:(id)a3;
- (HAPAccessoryWakeTuple)initWithPort:(int64_t)a3 wakeAddress:(id)a4 wakePattern:(id)a5;
- (NSData)wakePattern;
- (NSString)wakeAddress;
- (int64_t)wakePort;
- (unint64_t)hash;
@end

@implementation HAPAccessoryWakeTuple

- (HAPAccessoryWakeTuple)initWithPort:(int64_t)a3 wakeAddress:(id)a4 wakePattern:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HAPAccessoryWakeTuple;
  v11 = [(HAPAccessoryWakeTuple *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_wakePort = a3;
    objc_storeStrong((id *)&v11->_wakeAddress, a4);
    objc_storeStrong((id *)&v12->_wakePattern, a5);
  }

  return v12;
}

- (unint64_t)hash
{
  v3 = [(HAPAccessoryWakeTuple *)self wakeAddress];
  unint64_t v4 = (unint64_t)[v3 hash];
  v5 = [(HAPAccessoryWakeTuple *)self wakePattern];
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;
  unint64_t v7 = v6 ^ [(HAPAccessoryWakeTuple *)self wakePort];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (HAPAccessoryWakeTuple *)a3;
  if (self == v4)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    unint64_t v6 = v5;
    if (!v6) {
      goto LABEL_9;
    }
    id v7 = [(HAPAccessoryWakeTuple *)self wakePort];
    if (v7 != (id)[(HAPAccessoryWakeTuple *)v6 wakePort]) {
      goto LABEL_9;
    }
    v8 = [(HAPAccessoryWakeTuple *)self wakeAddress];
    id v9 = [(HAPAccessoryWakeTuple *)v6 wakeAddress];
    int v10 = HMFEqualObjects();

    if (v10)
    {
      v11 = [(HAPAccessoryWakeTuple *)self wakePattern];
      v12 = [(HAPAccessoryWakeTuple *)v6 wakePattern];
      char v13 = HMFEqualObjects();
    }
    else
    {
LABEL_9:
      char v13 = 0;
    }
  }
  return v13;
}

- (NSString)wakeAddress
{
  return self->_wakeAddress;
}

- (int64_t)wakePort
{
  return self->_wakePort;
}

- (NSData)wakePattern
{
  return self->_wakePattern;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wakePattern, 0);

  objc_storeStrong((id *)&self->_wakeAddress, 0);
}

@end