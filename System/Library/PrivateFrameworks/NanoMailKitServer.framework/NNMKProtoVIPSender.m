@interface NNMKProtoVIPSender
+ (Class)emailAddressesType;
+ (id)protoVIP:(id)a3;
- (BOOL)hasDisplayName;
- (BOOL)hasName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)emailAddresses;
- (NSString)displayName;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)emailAddressesAtIndex:(unint64_t)a3;
- (id)vipSender;
- (unint64_t)emailAddressesCount;
- (unint64_t)hash;
- (void)addEmailAddresses:(id)a3;
- (void)clearEmailAddresses;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setEmailAddresses:(id)a3;
- (void)setName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NNMKProtoVIPSender

- (id)vipSender
{
  v3 = objc_alloc_init(NNMKVIPSender);
  v4 = [(NNMKProtoVIPSender *)self name];
  [(NNMKVIPSender *)v3 setName:v4];

  v5 = [(NNMKProtoVIPSender *)self displayName];
  [(NNMKVIPSender *)v3 setDisplayName:v5];

  v6 = (void *)MEMORY[0x263EFFA08];
  v7 = [(NNMKProtoVIPSender *)self emailAddresses];
  v8 = [v6 setWithArray:v7];
  [(NNMKVIPSender *)v3 setEmailAddresses:v8];

  return v3;
}

+ (id)protoVIP:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(NNMKProtoVIPSender);
  v5 = [v3 name];
  [(NNMKProtoVIPSender *)v4 setName:v5];

  v6 = [v3 displayName];
  [(NNMKProtoVIPSender *)v4 setDisplayName:v6];

  v7 = [v3 emailAddresses];

  v8 = [v7 allObjects];
  v9 = (void *)[v8 mutableCopy];
  [(NNMKProtoVIPSender *)v4 setEmailAddresses:v9];

  return v4;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasDisplayName
{
  return self->_displayName != 0;
}

- (void)clearEmailAddresses
{
}

- (void)addEmailAddresses:(id)a3
{
  id v4 = a3;
  emailAddresses = self->_emailAddresses;
  id v8 = v4;
  if (!emailAddresses)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_emailAddresses;
    self->_emailAddresses = v6;

    id v4 = v8;
    emailAddresses = self->_emailAddresses;
  }
  [(NSMutableArray *)emailAddresses addObject:v4];
}

- (unint64_t)emailAddressesCount
{
  return [(NSMutableArray *)self->_emailAddresses count];
}

- (id)emailAddressesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_emailAddresses objectAtIndex:a3];
}

+ (Class)emailAddressesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NNMKProtoVIPSender;
  id v4 = [(NNMKProtoVIPSender *)&v8 description];
  v5 = [(NNMKProtoVIPSender *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  displayName = self->_displayName;
  if (displayName) {
    [v4 setObject:displayName forKey:@"displayName"];
  }
  emailAddresses = self->_emailAddresses;
  if (emailAddresses) {
    [v4 setObject:emailAddresses forKey:@"emailAddresses"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NNMKProtoVIPSenderReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_name) {
    PBDataWriterWriteStringField();
  }
  if (self->_displayName) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_emailAddresses;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (self->_name) {
    objc_msgSend(v8, "setName:");
  }
  if (self->_displayName) {
    objc_msgSend(v8, "setDisplayName:");
  }
  if ([(NNMKProtoVIPSender *)self emailAddressesCount])
  {
    [v8 clearEmailAddresses];
    unint64_t v4 = [(NNMKProtoVIPSender *)self emailAddressesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(NNMKProtoVIPSender *)self emailAddressesAtIndex:i];
        [v8 addEmailAddresses:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_name copyWithZone:a3];
  uint64_t v7 = (void *)v5[3];
  v5[3] = v6;

  uint64_t v8 = [(NSString *)self->_displayName copyWithZone:a3];
  uint64_t v9 = (void *)v5[1];
  v5[1] = v8;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v10 = self->_emailAddresses;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v14), "copyWithZone:", a3, (void)v17);
        [v5 addEmailAddresses:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((name = self->_name, !((unint64_t)name | v4[3])) || -[NSString isEqual:](name, "isEqual:"))
    && ((displayName = self->_displayName, !((unint64_t)displayName | v4[1]))
     || -[NSString isEqual:](displayName, "isEqual:")))
  {
    emailAddresses = self->_emailAddresses;
    if ((unint64_t)emailAddresses | v4[2]) {
      char v8 = -[NSMutableArray isEqual:](emailAddresses, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  NSUInteger v4 = [(NSString *)self->_displayName hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_emailAddresses hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 3)) {
    -[NNMKProtoVIPSender setName:](self, "setName:");
  }
  if (*((void *)v4 + 1)) {
    -[NNMKProtoVIPSender setDisplayName:](self, "setDisplayName:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 2);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[NNMKProtoVIPSender addEmailAddresses:](self, "addEmailAddresses:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSMutableArray)emailAddresses
{
  return self->_emailAddresses;
}

- (void)setEmailAddresses:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end