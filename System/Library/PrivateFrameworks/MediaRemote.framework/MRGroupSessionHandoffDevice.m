@interface MRGroupSessionHandoffDevice
- (BOOL)isEqual:(id)a3;
- (MRGroupSessionHandoffDevice)initWithDiscoveredSession:(id)a3;
- (NSString)bluetoothAddress;
- (NSString)identifier;
- (unint64_t)hash;
@end

@implementation MRGroupSessionHandoffDevice

- (MRGroupSessionHandoffDevice)initWithDiscoveredSession:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRGroupSessionHandoffDevice;
  v5 = [(MRGroupSessionHandoffDevice *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 identifier];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;
  }
  return v5;
}

- (unint64_t)hash
{
  v2 = [(MRGroupSessionHandoffDevice *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MRGroupSessionHandoffDevice *)a3;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id v6 = [(MRGroupSessionHandoffDevice *)self identifier];
      id v7 = [(MRGroupSessionHandoffDevice *)v5 identifier];
      if (v6 == v7)
      {
      }
      else
      {
        int v8 = [v6 isEqual:v7];

        if (!v8)
        {
          char v9 = 0;
LABEL_13:

          goto LABEL_14;
        }
      }
      v10 = [(MRGroupSessionHandoffDevice *)self bluetoothAddress];
      v11 = [(MRGroupSessionHandoffDevice *)v5 bluetoothAddress];
      if (v10 == v11) {
        char v9 = 1;
      }
      else {
        char v9 = [v10 isEqual:v11];
      }

      goto LABEL_13;
    }
    char v9 = 0;
  }
LABEL_14:

  return v9;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)bluetoothAddress
{
  return self->_bluetoothAddress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bluetoothAddress, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end