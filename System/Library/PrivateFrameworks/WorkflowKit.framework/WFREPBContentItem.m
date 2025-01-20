@interface WFREPBContentItem
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)item;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)encodingTypeAsString:(int)a3;
- (int)StringAsEncodingType:(id)a3;
- (int)encodingType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEncodingType:(int)a3;
- (void)setItem:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation WFREPBContentItem

- (void).cxx_destruct
{
}

- (void)setEncodingType:(int)a3
{
  self->_encodingType = a3;
}

- (int)encodingType
{
  return self->_encodingType;
}

- (void)setItem:(id)a3
{
}

- (NSData)item
{
  return self->_item;
}

- (void)mergeFrom:(id)a3
{
  v4 = (int *)a3;
  if (*((void *)v4 + 2))
  {
    v5 = v4;
    -[WFREPBContentItem setItem:](self, "setItem:");
    v4 = v5;
  }
  self->_encodingType = v4[2];
}

- (unint64_t)hash
{
  return (2654435761 * self->_encodingType) ^ [(NSData *)self->_item hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v6 = [v4 isMemberOfClass:objc_opt_class()]
    && ((item = self->_item, !((unint64_t)item | *((void *)v4 + 2)))
     || -[NSData isEqual:](item, "isEqual:"))
    && self->_encodingType == *((_DWORD *)v4 + 2);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_item copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  *(_DWORD *)(v5 + 8) = self->_encodingType;
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  item = self->_item;
  uint64_t v5 = a3;
  [v5 setItem:item];
  v5[2] = self->_encodingType;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_item) {
    __assert_rtn("-[WFREPBContentItem writeTo:]", "WFREPBContentItem.m", 87, "nil != self->_item");
  }
  id v5 = v4;
  PBDataWriterWriteDataField();
  PBDataWriterWriteInt32Field();
}

- (BOOL)readFrom:(id)a3
{
  return WFREPBContentItemReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  item = self->_item;
  if (item) {
    [v3 setObject:item forKey:@"item"];
  }
  int encodingType = self->_encodingType;
  if (encodingType == 1)
  {
    v7 = @"Protobuf";
  }
  else if (encodingType == 2)
  {
    v7 = @"NSSecureCoding";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_encodingType);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  [v4 setObject:v7 forKey:@"encodingType"];

  return v4;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WFREPBContentItem;
  id v4 = [(WFREPBContentItem *)&v8 description];
  id v5 = [(WFREPBContentItem *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (int)StringAsEncodingType:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"Protobuf"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"NSSecureCoding"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (id)encodingTypeAsString:(int)a3
{
  if (a3 == 1)
  {
    int v4 = @"Protobuf";
  }
  else if (a3 == 2)
  {
    int v4 = @"NSSecureCoding";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

@end