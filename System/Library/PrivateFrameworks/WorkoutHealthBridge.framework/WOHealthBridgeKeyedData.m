@interface WOHealthBridgeKeyedData
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)ourData;
- (NSString)key;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setKey:(id)a3;
- (void)setOurData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation WOHealthBridgeKeyedData

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WOHealthBridgeKeyedData;
  v4 = [(WOHealthBridgeKeyedData *)&v8 description];
  v5 = [(WOHealthBridgeKeyedData *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  ourData = self->_ourData;
  if (ourData) {
    [v4 setObject:ourData forKey:@"ourData"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return WOHealthBridgeKeyedDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_key) {
    -[WOHealthBridgeKeyedData writeTo:]();
  }
  id v5 = v4;
  PBDataWriterWriteStringField();
  if (!self->_ourData) {
    -[WOHealthBridgeKeyedData writeTo:]();
  }
  PBDataWriterWriteDataField();
}

- (void)copyTo:(id)a3
{
  key = self->_key;
  id v5 = a3;
  [v5 setKey:key];
  [v5 setOurData:self->_ourData];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_key copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSData *)self->_ourData copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((key = self->_key, !((unint64_t)key | v4[1])) || -[NSString isEqual:](key, "isEqual:")))
  {
    ourData = self->_ourData;
    if ((unint64_t)ourData | v4[2]) {
      char v7 = -[NSData isEqual:](ourData, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  return [(NSData *)self->_ourData hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[1])
  {
    -[WOHealthBridgeKeyedData setKey:](self, "setKey:");
    id v4 = v5;
  }
  if (v4[2])
  {
    -[WOHealthBridgeKeyedData setOurData:](self, "setOurData:");
    id v4 = v5;
  }
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (NSData)ourData
{
  return self->_ourData;
}

- (void)setOurData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ourData, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[WOHealthBridgeKeyedData writeTo:]", "WOHealthBridgeKeyedData.m", 83, "nil != self->_key");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[WOHealthBridgeKeyedData writeTo:]", "WOHealthBridgeKeyedData.m", 88, "nil != self->_ourData");
}

@end