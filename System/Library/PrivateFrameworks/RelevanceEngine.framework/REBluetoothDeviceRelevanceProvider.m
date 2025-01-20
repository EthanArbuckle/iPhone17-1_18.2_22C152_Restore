@interface REBluetoothDeviceRelevanceProvider
+ (id)relevanceSimulatorID;
- (BOOL)connectedToCar;
- (BOOL)connectedToSpeaker;
- (BOOL)isEqual:(id)a3;
- (REBluetoothDeviceRelevanceProvider)initWithConnectionToCar:(BOOL)a3 connectionToSpeaker:(BOOL)a4;
- (REBluetoothDeviceRelevanceProvider)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryEncoding;
- (unint64_t)_hash;
@end

@implementation REBluetoothDeviceRelevanceProvider

+ (id)relevanceSimulatorID
{
  return @"bluetooth";
}

- (REBluetoothDeviceRelevanceProvider)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"car"];
  v6 = [v4 objectForKeyedSubscript:@"speaker"];

  v7 = -[REBluetoothDeviceRelevanceProvider initWithConnectionToCar:connectionToSpeaker:](self, "initWithConnectionToCar:connectionToSpeaker:", [v5 BOOLValue], objc_msgSend(v6, "BOOLValue"));
  return v7;
}

- (id)dictionaryEncoding
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [NSNumber numberWithBool:self->_connectedToCar];
  [v3 setObject:v4 forKeyedSubscript:@"car"];

  v5 = [NSNumber numberWithBool:self->_connectedToSpeaker];
  [v3 setObject:v5 forKeyedSubscript:@"speaker"];

  v6 = (void *)[v3 copy];
  return v6;
}

- (REBluetoothDeviceRelevanceProvider)initWithConnectionToCar:(BOOL)a3 connectionToSpeaker:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)REBluetoothDeviceRelevanceProvider;
  result = [(RERelevanceProvider *)&v7 init];
  if (result)
  {
    result->_connectedToCar = a3;
    result->_connectedToSpeaker = a4;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  BOOL connectedToCar = self->_connectedToCar;
  BOOL connectedToSpeaker = self->_connectedToSpeaker;
  return (id)[v4 initWithConnectionToCar:connectedToCar connectionToSpeaker:connectedToSpeaker];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (REBluetoothDeviceRelevanceProvider *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)REBluetoothDeviceRelevanceProvider;
    BOOL v5 = [(RERelevanceProvider *)&v7 isEqual:v4]
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && self->_connectedToSpeaker == v4->_connectedToSpeaker
      && self->_connectedToCar == v4->_connectedToCar;
  }

  return v5;
}

- (unint64_t)_hash
{
  return self->_connectedToSpeaker | ((unint64_t)self->_connectedToCar << 8);
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)REBluetoothDeviceRelevanceProvider;
  v3 = [(REBluetoothDeviceRelevanceProvider *)&v8 description];
  id v4 = [NSNumber numberWithBool:self->_connectedToSpeaker];
  BOOL v5 = [NSNumber numberWithBool:self->_connectedToCar];
  v6 = [v3 stringByAppendingFormat:@" speaker=%@, car=%@", v4, v5];

  return v6;
}

- (BOOL)connectedToCar
{
  return self->_connectedToCar;
}

- (BOOL)connectedToSpeaker
{
  return self->_connectedToSpeaker;
}

@end