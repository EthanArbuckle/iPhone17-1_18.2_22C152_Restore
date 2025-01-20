@interface BRFieldUserIdentity
+ (id)unknownPersonNameComponents;
- (BOOL)hasSerializedNameComponents;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BRFieldUserIdentity)initWithCKUserIdentity:(id)a3;
- (NSData)serializedNameComponents;
- (NSPersonNameComponents)nameComponents;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)nameComponentsAcceptUnknownUser:(BOOL)a3;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setNameComponents:(id)a3;
- (void)setSerializedNameComponents:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BRFieldUserIdentity

- (BOOL)hasSerializedNameComponents
{
  return self->_serializedNameComponents != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BRFieldUserIdentity;
  v4 = [(BRFieldUserIdentity *)&v8 description];
  v5 = [(BRFieldUserIdentity *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  serializedNameComponents = self->_serializedNameComponents;
  if (serializedNameComponents) {
    [v3 setObject:serializedNameComponents forKey:@"serializedNameComponents"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BRFieldUserIdentityReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_serializedNameComponents) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  serializedNameComponents = self->_serializedNameComponents;
  if (serializedNameComponents) {
    [a3 setSerializedNameComponents:serializedNameComponents];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_serializedNameComponents copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    serializedNameComponents = self->_serializedNameComponents;
    if ((unint64_t)serializedNameComponents | v4[1]) {
      char v6 = -[NSData isEqual:](serializedNameComponents, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSData *)self->_serializedNameComponents hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[BRFieldUserIdentity setSerializedNameComponents:](self, "setSerializedNameComponents:");
  }
}

- (NSData)serializedNameComponents
{
  return self->_serializedNameComponents;
}

- (void)setSerializedNameComponents:(id)a3
{
}

- (void).cxx_destruct
{
}

- (BRFieldUserIdentity)initWithCKUserIdentity:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BRFieldUserIdentity;
  v5 = [(BRFieldUserIdentity *)&v8 init];
  if (v5)
  {
    char v6 = [v4 nameComponents];
    [(BRFieldUserIdentity *)v5 setNameComponents:v6];
  }
  return v5;
}

- (void)setNameComponents:(id)a3
{
  id v4 = [MEMORY[0x263F08910] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
  [(BRFieldUserIdentity *)self setSerializedNameComponents:v4];
}

- (NSPersonNameComponents)nameComponents
{
  return (NSPersonNameComponents *)[(BRFieldUserIdentity *)self nameComponentsAcceptUnknownUser:0];
}

+ (id)unknownPersonNameComponents
{
  id v2 = objc_alloc_init(MEMORY[0x263F08A68]);
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v4 = _BRLocalizedStringWithFormat();
  [v2 setGivenName:v4];

  return v2;
}

- (id)nameComponentsAcceptUnknownUser:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(BRFieldUserIdentity *)self hasSerializedNameComponents])
  {
    v5 = [(BRFieldUserIdentity *)self serializedNameComponents];
    char v6 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:0];
  }
  else if (v3)
  {
    char v6 = +[BRFieldUserIdentity unknownPersonNameComponents];
  }
  else
  {
    char v6 = 0;
  }
  return v6;
}

@end