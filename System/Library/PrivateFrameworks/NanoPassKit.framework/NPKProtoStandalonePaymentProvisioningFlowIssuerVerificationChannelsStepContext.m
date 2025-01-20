@interface NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationChannelsStepContext
+ (Class)verificationChannelsType;
- (BOOL)hasPaymentPass;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NPKProtoStandalonePaymentPass)paymentPass;
- (NSMutableArray)verificationChannels;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)verificationChannelsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)verificationChannelsCount;
- (void)addVerificationChannels:(id)a3;
- (void)clearVerificationChannels;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPaymentPass:(id)a3;
- (void)setVerificationChannels:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationChannelsStepContext

- (BOOL)hasPaymentPass
{
  return self->_paymentPass != 0;
}

- (void)clearVerificationChannels
{
}

- (void)addVerificationChannels:(id)a3
{
  id v4 = a3;
  verificationChannels = self->_verificationChannels;
  id v8 = v4;
  if (!verificationChannels)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_verificationChannels;
    self->_verificationChannels = v6;

    id v4 = v8;
    verificationChannels = self->_verificationChannels;
  }
  [(NSMutableArray *)verificationChannels addObject:v4];
}

- (unint64_t)verificationChannelsCount
{
  return [(NSMutableArray *)self->_verificationChannels count];
}

- (id)verificationChannelsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_verificationChannels objectAtIndex:a3];
}

+ (Class)verificationChannelsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationChannelsStepContext;
  id v4 = [(NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationChannelsStepContext *)&v8 description];
  v5 = [(NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationChannelsStepContext *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  paymentPass = self->_paymentPass;
  if (paymentPass)
  {
    v5 = [(NPKProtoStandalonePaymentPass *)paymentPass dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"paymentPass"];
  }
  if ([(NSMutableArray *)self->_verificationChannels count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_verificationChannels, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v7 = self->_verificationChannels;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "dictionaryRepresentation", (void)v14);
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"verificationChannels"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationChannelsStepContextReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_paymentPass) {
    PBDataWriterWriteSubmessage();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_verificationChannels;
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
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (self->_paymentPass) {
    objc_msgSend(v8, "setPaymentPass:");
  }
  if ([(NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationChannelsStepContext *)self verificationChannelsCount])
  {
    [v8 clearVerificationChannels];
    unint64_t v4 = [(NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationChannelsStepContext *)self verificationChannelsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationChannelsStepContext *)self verificationChannelsAtIndex:i];
        [v8 addVerificationChannels:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NPKProtoStandalonePaymentPass *)self->_paymentPass copyWithZone:a3];
  uint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = self->_verificationChannels;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12), "copyWithZone:", a3, (void)v15);
        [v5 addVerificationChannels:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((paymentPass = self->_paymentPass, !((unint64_t)paymentPass | v4[1]))
     || -[NPKProtoStandalonePaymentPass isEqual:](paymentPass, "isEqual:")))
  {
    verificationChannels = self->_verificationChannels;
    if ((unint64_t)verificationChannels | v4[2]) {
      char v7 = -[NSMutableArray isEqual:](verificationChannels, "isEqual:");
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
  unint64_t v3 = [(NPKProtoStandalonePaymentPass *)self->_paymentPass hash];
  return [(NSMutableArray *)self->_verificationChannels hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  paymentPass = self->_paymentPass;
  uint64_t v6 = *((void *)v4 + 1);
  if (paymentPass)
  {
    if (v6) {
      -[NPKProtoStandalonePaymentPass mergeFrom:](paymentPass, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationChannelsStepContext setPaymentPass:](self, "setPaymentPass:");
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *((id *)v4 + 2);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationChannelsStepContext addVerificationChannels:](self, "addVerificationChannels:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (NPKProtoStandalonePaymentPass)paymentPass
{
  return self->_paymentPass;
}

- (void)setPaymentPass:(id)a3
{
}

- (NSMutableArray)verificationChannels
{
  return self->_verificationChannels;
}

- (void)setVerificationChannels:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verificationChannels, 0);
  objc_storeStrong((id *)&self->_paymentPass, 0);
}

@end