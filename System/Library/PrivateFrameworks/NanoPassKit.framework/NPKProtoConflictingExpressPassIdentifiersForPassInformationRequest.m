@interface NPKProtoConflictingExpressPassIdentifiersForPassInformationRequest
+ (Class)referenceExpressPassConfigurationsType;
+ (Class)referenceExpressPassesInformationType;
- (BOOL)hasExpressPassConfiguration;
- (BOOL)hasExpressPassInformation;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)expressPassConfiguration;
- (NSData)expressPassInformation;
- (NSMutableArray)referenceExpressPassConfigurations;
- (NSMutableArray)referenceExpressPassesInformations;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)referenceExpressPassConfigurationsAtIndex:(unint64_t)a3;
- (id)referenceExpressPassesInformationAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)referenceExpressPassConfigurationsCount;
- (unint64_t)referenceExpressPassesInformationsCount;
- (void)addReferenceExpressPassConfigurations:(id)a3;
- (void)addReferenceExpressPassesInformation:(id)a3;
- (void)clearReferenceExpressPassConfigurations;
- (void)clearReferenceExpressPassesInformations;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setExpressPassConfiguration:(id)a3;
- (void)setExpressPassInformation:(id)a3;
- (void)setReferenceExpressPassConfigurations:(id)a3;
- (void)setReferenceExpressPassesInformations:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoConflictingExpressPassIdentifiersForPassInformationRequest

- (BOOL)hasExpressPassInformation
{
  return self->_expressPassInformation != 0;
}

- (void)clearReferenceExpressPassesInformations
{
}

- (void)addReferenceExpressPassesInformation:(id)a3
{
  id v4 = a3;
  referenceExpressPassesInformations = self->_referenceExpressPassesInformations;
  id v8 = v4;
  if (!referenceExpressPassesInformations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_referenceExpressPassesInformations;
    self->_referenceExpressPassesInformations = v6;

    id v4 = v8;
    referenceExpressPassesInformations = self->_referenceExpressPassesInformations;
  }
  [(NSMutableArray *)referenceExpressPassesInformations addObject:v4];
}

- (unint64_t)referenceExpressPassesInformationsCount
{
  return [(NSMutableArray *)self->_referenceExpressPassesInformations count];
}

- (id)referenceExpressPassesInformationAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_referenceExpressPassesInformations objectAtIndex:a3];
}

+ (Class)referenceExpressPassesInformationType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasExpressPassConfiguration
{
  return self->_expressPassConfiguration != 0;
}

- (void)clearReferenceExpressPassConfigurations
{
}

- (void)addReferenceExpressPassConfigurations:(id)a3
{
  id v4 = a3;
  referenceExpressPassConfigurations = self->_referenceExpressPassConfigurations;
  id v8 = v4;
  if (!referenceExpressPassConfigurations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_referenceExpressPassConfigurations;
    self->_referenceExpressPassConfigurations = v6;

    id v4 = v8;
    referenceExpressPassConfigurations = self->_referenceExpressPassConfigurations;
  }
  [(NSMutableArray *)referenceExpressPassConfigurations addObject:v4];
}

- (unint64_t)referenceExpressPassConfigurationsCount
{
  return [(NSMutableArray *)self->_referenceExpressPassConfigurations count];
}

- (id)referenceExpressPassConfigurationsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_referenceExpressPassConfigurations objectAtIndex:a3];
}

+ (Class)referenceExpressPassConfigurationsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoConflictingExpressPassIdentifiersForPassInformationRequest;
  id v4 = [(NPKProtoConflictingExpressPassIdentifiersForPassInformationRequest *)&v8 description];
  v5 = [(NPKProtoConflictingExpressPassIdentifiersForPassInformationRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  expressPassInformation = self->_expressPassInformation;
  if (expressPassInformation) {
    [v3 setObject:expressPassInformation forKey:@"expressPassInformation"];
  }
  referenceExpressPassesInformations = self->_referenceExpressPassesInformations;
  if (referenceExpressPassesInformations) {
    [v4 setObject:referenceExpressPassesInformations forKey:@"referenceExpressPassesInformation"];
  }
  expressPassConfiguration = self->_expressPassConfiguration;
  if (expressPassConfiguration) {
    [v4 setObject:expressPassConfiguration forKey:@"expressPassConfiguration"];
  }
  referenceExpressPassConfigurations = self->_referenceExpressPassConfigurations;
  if (referenceExpressPassConfigurations) {
    [v4 setObject:referenceExpressPassConfigurations forKey:@"referenceExpressPassConfigurations"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoConflictingExpressPassIdentifiersForPassInformationRequestReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_expressPassInformation) {
    PBDataWriterWriteDataField();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = self->_referenceExpressPassesInformations;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteDataField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  if (self->_expressPassConfiguration) {
    PBDataWriterWriteDataField();
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v10 = self->_referenceExpressPassConfigurations;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteDataField();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void)copyTo:(id)a3
{
  id v12 = a3;
  if (self->_expressPassInformation) {
    objc_msgSend(v12, "setExpressPassInformation:");
  }
  if ([(NPKProtoConflictingExpressPassIdentifiersForPassInformationRequest *)self referenceExpressPassesInformationsCount])
  {
    [v12 clearReferenceExpressPassesInformations];
    unint64_t v4 = [(NPKProtoConflictingExpressPassIdentifiersForPassInformationRequest *)self referenceExpressPassesInformationsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(NPKProtoConflictingExpressPassIdentifiersForPassInformationRequest *)self referenceExpressPassesInformationAtIndex:i];
        [v12 addReferenceExpressPassesInformation:v7];
      }
    }
  }
  if (self->_expressPassConfiguration) {
    objc_msgSend(v12, "setExpressPassConfiguration:");
  }
  if ([(NPKProtoConflictingExpressPassIdentifiersForPassInformationRequest *)self referenceExpressPassConfigurationsCount])
  {
    [v12 clearReferenceExpressPassConfigurations];
    unint64_t v8 = [(NPKProtoConflictingExpressPassIdentifiersForPassInformationRequest *)self referenceExpressPassConfigurationsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(NPKProtoConflictingExpressPassIdentifiersForPassInformationRequest *)self referenceExpressPassConfigurationsAtIndex:j];
        [v12 addReferenceExpressPassConfigurations:v11];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_expressPassInformation copyWithZone:a3];
  uint64_t v7 = (void *)v5[2];
  v5[2] = v6;

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  unint64_t v8 = self->_referenceExpressPassesInformations;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v28;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = (void *)[*(id *)(*((void *)&v27 + 1) + 8 * v12) copyWithZone:a3];
        [v5 addReferenceExpressPassesInformation:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v10);
  }

  uint64_t v14 = [(NSData *)self->_expressPassConfiguration copyWithZone:a3];
  long long v15 = (void *)v5[1];
  v5[1] = v14;

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v16 = self->_referenceExpressPassConfigurations;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v24;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        long long v21 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v20), "copyWithZone:", a3, (void)v23);
        [v5 addReferenceExpressPassConfigurations:v21];

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v18);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((expressPassInformation = self->_expressPassInformation, !((unint64_t)expressPassInformation | v4[2]))
     || -[NSData isEqual:](expressPassInformation, "isEqual:"))
    && ((referenceExpressPassesInformations = self->_referenceExpressPassesInformations,
         !((unint64_t)referenceExpressPassesInformations | v4[4]))
     || -[NSMutableArray isEqual:](referenceExpressPassesInformations, "isEqual:"))
    && ((expressPassConfiguration = self->_expressPassConfiguration,
         !((unint64_t)expressPassConfiguration | v4[1]))
     || -[NSData isEqual:](expressPassConfiguration, "isEqual:")))
  {
    referenceExpressPassConfigurations = self->_referenceExpressPassConfigurations;
    if ((unint64_t)referenceExpressPassConfigurations | v4[3]) {
      char v9 = -[NSMutableArray isEqual:](referenceExpressPassConfigurations, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_expressPassInformation hash];
  uint64_t v4 = [(NSMutableArray *)self->_referenceExpressPassesInformations hash] ^ v3;
  uint64_t v5 = [(NSData *)self->_expressPassConfiguration hash];
  return v4 ^ v5 ^ [(NSMutableArray *)self->_referenceExpressPassConfigurations hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 2)) {
    -[NPKProtoConflictingExpressPassIdentifiersForPassInformationRequest setExpressPassInformation:](self, "setExpressPassInformation:");
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = *((id *)v4 + 4);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [(NPKProtoConflictingExpressPassIdentifiersForPassInformationRequest *)self addReferenceExpressPassesInformation:*(void *)(*((void *)&v19 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  if (*((void *)v4 + 1)) {
    -[NPKProtoConflictingExpressPassIdentifiersForPassInformationRequest setExpressPassConfiguration:](self, "setExpressPassConfiguration:");
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = *((id *)v4 + 3);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[NPKProtoConflictingExpressPassIdentifiersForPassInformationRequest addReferenceExpressPassConfigurations:](self, "addReferenceExpressPassConfigurations:", *(void *)(*((void *)&v15 + 1) + 8 * j), (void)v15);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (NSData)expressPassInformation
{
  return self->_expressPassInformation;
}

- (void)setExpressPassInformation:(id)a3
{
}

- (NSMutableArray)referenceExpressPassesInformations
{
  return self->_referenceExpressPassesInformations;
}

- (void)setReferenceExpressPassesInformations:(id)a3
{
}

- (NSData)expressPassConfiguration
{
  return self->_expressPassConfiguration;
}

- (void)setExpressPassConfiguration:(id)a3
{
}

- (NSMutableArray)referenceExpressPassConfigurations
{
  return self->_referenceExpressPassConfigurations;
}

- (void)setReferenceExpressPassConfigurations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceExpressPassesInformations, 0);
  objc_storeStrong((id *)&self->_referenceExpressPassConfigurations, 0);
  objc_storeStrong((id *)&self->_expressPassInformation, 0);
  objc_storeStrong((id *)&self->_expressPassConfiguration, 0);
}

@end