@interface NPKProtoStandalonePaymentProvisioningFlowChooseCredentialsRequest
+ (Class)chosenPaymentCredentialIdentifiersType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NPKProtoStandaloneRequestHeader)requestHeader;
- (NSMutableArray)chosenPaymentCredentialIdentifiers;
- (id)chosenPaymentCredentialIdentifiersAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)chosenPaymentCredentialIdentifiersCount;
- (unint64_t)hash;
- (void)addChosenPaymentCredentialIdentifiers:(id)a3;
- (void)clearChosenPaymentCredentialIdentifiers;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setChosenPaymentCredentialIdentifiers:(id)a3;
- (void)setRequestHeader:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoStandalonePaymentProvisioningFlowChooseCredentialsRequest

- (void)clearChosenPaymentCredentialIdentifiers
{
}

- (void)addChosenPaymentCredentialIdentifiers:(id)a3
{
  id v4 = a3;
  chosenPaymentCredentialIdentifiers = self->_chosenPaymentCredentialIdentifiers;
  id v8 = v4;
  if (!chosenPaymentCredentialIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_chosenPaymentCredentialIdentifiers;
    self->_chosenPaymentCredentialIdentifiers = v6;

    id v4 = v8;
    chosenPaymentCredentialIdentifiers = self->_chosenPaymentCredentialIdentifiers;
  }
  [(NSMutableArray *)chosenPaymentCredentialIdentifiers addObject:v4];
}

- (unint64_t)chosenPaymentCredentialIdentifiersCount
{
  return [(NSMutableArray *)self->_chosenPaymentCredentialIdentifiers count];
}

- (id)chosenPaymentCredentialIdentifiersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_chosenPaymentCredentialIdentifiers objectAtIndex:a3];
}

+ (Class)chosenPaymentCredentialIdentifiersType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoStandalonePaymentProvisioningFlowChooseCredentialsRequest;
  id v4 = [(NPKProtoStandalonePaymentProvisioningFlowChooseCredentialsRequest *)&v8 description];
  v5 = [(NPKProtoStandalonePaymentProvisioningFlowChooseCredentialsRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  requestHeader = self->_requestHeader;
  if (requestHeader)
  {
    v5 = [(NPKProtoStandaloneRequestHeader *)requestHeader dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"requestHeader"];
  }
  chosenPaymentCredentialIdentifiers = self->_chosenPaymentCredentialIdentifiers;
  if (chosenPaymentCredentialIdentifiers) {
    [v3 setObject:chosenPaymentCredentialIdentifiers forKey:@"chosenPaymentCredentialIdentifiers"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentProvisioningFlowChooseCredentialsRequestReadFrom((id *)&self->super.super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!self->_requestHeader) {
    -[NPKProtoStandalonePaymentProvisioningFlowChooseCredentialsRequest writeTo:]();
  }
  v5 = v4;
  PBDataWriterWriteSubmessage();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_chosenPaymentCredentialIdentifiers;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteStringField();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  [v8 setRequestHeader:self->_requestHeader];
  if ([(NPKProtoStandalonePaymentProvisioningFlowChooseCredentialsRequest *)self chosenPaymentCredentialIdentifiersCount])
  {
    [v8 clearChosenPaymentCredentialIdentifiers];
    unint64_t v4 = [(NPKProtoStandalonePaymentProvisioningFlowChooseCredentialsRequest *)self chosenPaymentCredentialIdentifiersCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(NPKProtoStandalonePaymentProvisioningFlowChooseCredentialsRequest *)self chosenPaymentCredentialIdentifiersAtIndex:i];
        [v8 addChosenPaymentCredentialIdentifiers:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NPKProtoStandaloneRequestHeader *)self->_requestHeader copyWithZone:a3];
  uint64_t v7 = (void *)v5[2];
  v5[2] = v6;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = self->_chosenPaymentCredentialIdentifiers;
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
        [v5 addChosenPaymentCredentialIdentifiers:v13];

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
    && ((requestHeader = self->_requestHeader, !((unint64_t)requestHeader | v4[2]))
     || -[NPKProtoStandaloneRequestHeader isEqual:](requestHeader, "isEqual:")))
  {
    chosenPaymentCredentialIdentifiers = self->_chosenPaymentCredentialIdentifiers;
    if ((unint64_t)chosenPaymentCredentialIdentifiers | v4[1]) {
      char v7 = -[NSMutableArray isEqual:](chosenPaymentCredentialIdentifiers, "isEqual:");
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
  unint64_t v3 = [(NPKProtoStandaloneRequestHeader *)self->_requestHeader hash];
  return [(NSMutableArray *)self->_chosenPaymentCredentialIdentifiers hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  requestHeader = self->_requestHeader;
  uint64_t v6 = *((void *)v4 + 2);
  if (requestHeader)
  {
    if (v6) {
      -[NPKProtoStandaloneRequestHeader mergeFrom:](requestHeader, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[NPKProtoStandalonePaymentProvisioningFlowChooseCredentialsRequest setRequestHeader:](self, "setRequestHeader:");
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *((id *)v4 + 1);
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
        -[NPKProtoStandalonePaymentProvisioningFlowChooseCredentialsRequest addChosenPaymentCredentialIdentifiers:](self, "addChosenPaymentCredentialIdentifiers:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (NPKProtoStandaloneRequestHeader)requestHeader
{
  return self->_requestHeader;
}

- (void)setRequestHeader:(id)a3
{
}

- (NSMutableArray)chosenPaymentCredentialIdentifiers
{
  return self->_chosenPaymentCredentialIdentifiers;
}

- (void)setChosenPaymentCredentialIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestHeader, 0);
  objc_storeStrong((id *)&self->_chosenPaymentCredentialIdentifiers, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoStandalonePaymentProvisioningFlowChooseCredentialsRequest writeTo:]", "NPKProtoStandalonePaymentProvisioningFlowChooseCredentialsRequest.m", 124, "self->_requestHeader != nil");
}

@end