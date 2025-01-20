@interface EPAdvertiserManagerCharacteristic
- (BOOL)encryptionRequired;
- (BOOL)isEqual:(id)a3;
- (CBCharacteristic)characteristic;
- (CBUUID)characteristicUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)readHandler;
- (id)writeHandler;
- (unint64_t)hash;
- (void)setCharacteristicUUID:(id)a3;
- (void)setEncryptionRequired:(BOOL)a3;
- (void)setReadHandler:(id)a3;
- (void)setWriteHandler:(id)a3;
@end

@implementation EPAdvertiserManagerCharacteristic

- (CBCharacteristic)characteristic
{
  if (self->_readHandler)
  {
    if (self->_encryptionRequired) {
      uint64_t v3 = 4;
    }
    else {
      uint64_t v3 = 1;
    }
    uint64_t v4 = 2;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v3 = 0;
  }
  if (self->_writeHandler)
  {
    v4 |= 8uLL;
    if (self->_encryptionRequired) {
      v3 |= 8uLL;
    }
    else {
      v3 |= 2uLL;
    }
  }
  id v5 = 0;
  if (v4 && v3) {
    id v5 = [objc_alloc((Class)CBMutableCharacteristic) initWithType:self->_characteristicUUID properties:v4 value:0 permissions:v3];
  }

  return (CBCharacteristic *)v5;
}

- (unint64_t)hash
{
  id v3 = [(CBUUID *)self->_characteristicUUID hash];
  uint64_t v4 = self->_encryptionRequired - (void)v3 + 32 * (void)v3;
  id v5 = (char *)[self->_readHandler hash] + 32 * v4 - v4;
  return (unsigned char *)[self->_writeHandler hash] - v5 + 32 * (void)v5 + 923521;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (EPAdvertiserManagerCharacteristic *)a3;
  if (self == v4)
  {
    unsigned __int8 v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      if ([(CBUUID *)self->_characteristicUUID isEqual:v5->_characteristicUUID]
        && self->_encryptionRequired == v5->_encryptionRequired)
      {
        id readHandler = self->_readHandler;
        id v7 = objc_retainBlock(v5->_readHandler);
        if ([readHandler isEqual:v7])
        {
          id writeHandler = self->_writeHandler;
          id v9 = objc_retainBlock(v5->_writeHandler);
          unsigned __int8 v10 = [writeHandler isEqual:v9];
        }
        else
        {
          unsigned __int8 v10 = 0;
        }
      }
      else
      {
        unsigned __int8 v10 = 0;
      }
    }
    else
    {
      unsigned __int8 v10 = 0;
    }
  }

  return v10;
}

- (id)description
{
  uint64_t v3 = [(CBUUID *)self->_characteristicUUID UUIDString];
  uint64_t v4 = (void *)v3;
  CFStringRef v5 = @"YES";
  if (self->_encryptionRequired) {
    CFStringRef v6 = @"YES";
  }
  else {
    CFStringRef v6 = @"NO";
  }
  if (self->_readHandler) {
    CFStringRef v7 = @"YES";
  }
  else {
    CFStringRef v7 = @"NO";
  }
  if (!self->_writeHandler) {
    CFStringRef v5 = @"NO";
  }
  v8 = +[NSString stringWithFormat:@"Characteristic: %@ encryptionRequired: %@ readable:%@ writeable:%@", v3, v6, v7, v5];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [+[EPAdvertiserManagerCharacteristic allocWithZone:a3] init];
  objc_storeStrong((id *)&v4->_characteristicUUID, self->_characteristicUUID);
  v4->_encryptionRequired = self->_encryptionRequired;
  id v5 = [self->_readHandler copy];
  id readHandler = v4->_readHandler;
  v4->_id readHandler = v5;

  id v7 = [self->_writeHandler copy];
  id writeHandler = v4->_writeHandler;
  v4->_id writeHandler = v7;

  return v4;
}

- (CBUUID)characteristicUUID
{
  return self->_characteristicUUID;
}

- (void)setCharacteristicUUID:(id)a3
{
}

- (BOOL)encryptionRequired
{
  return self->_encryptionRequired;
}

- (void)setEncryptionRequired:(BOOL)a3
{
  self->_encryptionRequired = a3;
}

- (id)readHandler
{
  return self->_readHandler;
}

- (void)setReadHandler:(id)a3
{
}

- (id)writeHandler
{
  return self->_writeHandler;
}

- (void)setWriteHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_writeHandler, 0);
  objc_storeStrong(&self->_readHandler, 0);

  objc_storeStrong((id *)&self->_characteristicUUID, 0);
}

@end