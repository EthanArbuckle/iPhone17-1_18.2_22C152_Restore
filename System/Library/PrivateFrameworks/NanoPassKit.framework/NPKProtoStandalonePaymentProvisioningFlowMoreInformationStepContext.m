@interface NPKProtoStandalonePaymentProvisioningFlowMoreInformationStepContext
+ (Class)moreInfoItemsType;
- (BOOL)hasPaymentPass;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NPKProtoStandalonePaymentPass)paymentPass;
- (NSMutableArray)moreInfoItems;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)moreInfoItemsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)moreInfoItemsCount;
- (void)addMoreInfoItems:(id)a3;
- (void)clearMoreInfoItems;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setMoreInfoItems:(id)a3;
- (void)setPaymentPass:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoStandalonePaymentProvisioningFlowMoreInformationStepContext

- (void)clearMoreInfoItems
{
}

- (void)addMoreInfoItems:(id)a3
{
  id v4 = a3;
  moreInfoItems = self->_moreInfoItems;
  id v8 = v4;
  if (!moreInfoItems)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_moreInfoItems;
    self->_moreInfoItems = v6;

    id v4 = v8;
    moreInfoItems = self->_moreInfoItems;
  }
  [(NSMutableArray *)moreInfoItems addObject:v4];
}

- (unint64_t)moreInfoItemsCount
{
  return [(NSMutableArray *)self->_moreInfoItems count];
}

- (id)moreInfoItemsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_moreInfoItems objectAtIndex:a3];
}

+ (Class)moreInfoItemsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasPaymentPass
{
  return self->_paymentPass != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoStandalonePaymentProvisioningFlowMoreInformationStepContext;
  id v4 = [(NPKProtoStandalonePaymentProvisioningFlowMoreInformationStepContext *)&v8 description];
  v5 = [(NPKProtoStandalonePaymentProvisioningFlowMoreInformationStepContext *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ([(NSMutableArray *)self->_moreInfoItems count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_moreInfoItems, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v5 = self->_moreInfoItems;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "dictionaryRepresentation", (void)v14);
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"moreInfoItems"];
  }
  paymentPass = self->_paymentPass;
  if (paymentPass)
  {
    v12 = [(NPKProtoStandalonePaymentPass *)paymentPass dictionaryRepresentation];
    [v3 setObject:v12 forKey:@"paymentPass"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentProvisioningFlowMoreInformationStepContextReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_moreInfoItems;
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
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_paymentPass) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if ([(NPKProtoStandalonePaymentProvisioningFlowMoreInformationStepContext *)self moreInfoItemsCount])
  {
    [v8 clearMoreInfoItems];
    unint64_t v4 = [(NPKProtoStandalonePaymentProvisioningFlowMoreInformationStepContext *)self moreInfoItemsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(NPKProtoStandalonePaymentProvisioningFlowMoreInformationStepContext *)self moreInfoItemsAtIndex:i];
        [v8 addMoreInfoItems:v7];
      }
    }
  }
  if (self->_paymentPass) {
    objc_msgSend(v8, "setPaymentPass:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = self->_moreInfoItems;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v10), "copyWithZone:", a3, (void)v15);
        [v5 addMoreInfoItems:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  id v12 = [(NPKProtoStandalonePaymentPass *)self->_paymentPass copyWithZone:a3];
  long long v13 = (void *)v5[2];
  v5[2] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((moreInfoItems = self->_moreInfoItems, !((unint64_t)moreInfoItems | v4[1]))
     || -[NSMutableArray isEqual:](moreInfoItems, "isEqual:")))
  {
    paymentPass = self->_paymentPass;
    if ((unint64_t)paymentPass | v4[2]) {
      char v7 = -[NPKProtoStandalonePaymentPass isEqual:](paymentPass, "isEqual:");
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
  uint64_t v3 = [(NSMutableArray *)self->_moreInfoItems hash];
  return [(NPKProtoStandalonePaymentPass *)self->_paymentPass hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  unint64_t v4 = (id *)a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v4[1];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        -[NPKProtoStandalonePaymentProvisioningFlowMoreInformationStepContext addMoreInfoItems:](self, "addMoreInfoItems:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  paymentPass = self->_paymentPass;
  id v11 = v4[2];
  if (paymentPass)
  {
    if (v11) {
      -[NPKProtoStandalonePaymentPass mergeFrom:](paymentPass, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[NPKProtoStandalonePaymentProvisioningFlowMoreInformationStepContext setPaymentPass:](self, "setPaymentPass:");
  }
}

- (NSMutableArray)moreInfoItems
{
  return self->_moreInfoItems;
}

- (void)setMoreInfoItems:(id)a3
{
}

- (NPKProtoStandalonePaymentPass)paymentPass
{
  return self->_paymentPass;
}

- (void)setPaymentPass:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentPass, 0);
  objc_storeStrong((id *)&self->_moreInfoItems, 0);
}

@end