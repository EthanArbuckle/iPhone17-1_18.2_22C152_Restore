@interface NPKProtoGenerateAuxiliaryCapabilitiesResponse
+ (Class)keyMaterialValuesType;
+ (Class)requirementKeysType;
- (BOOL)hasErrorData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)errorData;
- (NSMutableArray)keyMaterialValues;
- (NSMutableArray)requirementKeys;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)keyMaterialValuesAtIndex:(unint64_t)a3;
- (id)requirementKeysAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)keyMaterialValuesCount;
- (unint64_t)requirementKeysCount;
- (void)addKeyMaterialValues:(id)a3;
- (void)addRequirementKeys:(id)a3;
- (void)clearKeyMaterialValues;
- (void)clearRequirementKeys;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setErrorData:(id)a3;
- (void)setKeyMaterialValues:(id)a3;
- (void)setRequirementKeys:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoGenerateAuxiliaryCapabilitiesResponse

- (void)clearRequirementKeys
{
}

- (void)addRequirementKeys:(id)a3
{
  id v4 = a3;
  requirementKeys = self->_requirementKeys;
  id v8 = v4;
  if (!requirementKeys)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_requirementKeys;
    self->_requirementKeys = v6;

    id v4 = v8;
    requirementKeys = self->_requirementKeys;
  }
  [(NSMutableArray *)requirementKeys addObject:v4];
}

- (unint64_t)requirementKeysCount
{
  return [(NSMutableArray *)self->_requirementKeys count];
}

- (id)requirementKeysAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_requirementKeys objectAtIndex:a3];
}

+ (Class)requirementKeysType
{
  return (Class)objc_opt_class();
}

- (void)clearKeyMaterialValues
{
}

- (void)addKeyMaterialValues:(id)a3
{
  id v4 = a3;
  keyMaterialValues = self->_keyMaterialValues;
  id v8 = v4;
  if (!keyMaterialValues)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_keyMaterialValues;
    self->_keyMaterialValues = v6;

    id v4 = v8;
    keyMaterialValues = self->_keyMaterialValues;
  }
  [(NSMutableArray *)keyMaterialValues addObject:v4];
}

- (unint64_t)keyMaterialValuesCount
{
  return [(NSMutableArray *)self->_keyMaterialValues count];
}

- (id)keyMaterialValuesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_keyMaterialValues objectAtIndex:a3];
}

+ (Class)keyMaterialValuesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasErrorData
{
  return self->_errorData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoGenerateAuxiliaryCapabilitiesResponse;
  id v4 = [(NPKProtoGenerateAuxiliaryCapabilitiesResponse *)&v8 description];
  v5 = [(NPKProtoGenerateAuxiliaryCapabilitiesResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  requirementKeys = self->_requirementKeys;
  if (requirementKeys) {
    [v3 setObject:requirementKeys forKey:@"requirementKeys"];
  }
  keyMaterialValues = self->_keyMaterialValues;
  if (keyMaterialValues) {
    [v4 setObject:keyMaterialValues forKey:@"keyMaterialValues"];
  }
  errorData = self->_errorData;
  if (errorData) {
    [v4 setObject:errorData forKey:@"errorData"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoGenerateAuxiliaryCapabilitiesResponseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v5 = self->_requirementKeys;
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

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v10 = self->_keyMaterialValues;
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

  if (self->_errorData) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  id v12 = a3;
  if ([(NPKProtoGenerateAuxiliaryCapabilitiesResponse *)self requirementKeysCount])
  {
    [v12 clearRequirementKeys];
    unint64_t v4 = [(NPKProtoGenerateAuxiliaryCapabilitiesResponse *)self requirementKeysCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(NPKProtoGenerateAuxiliaryCapabilitiesResponse *)self requirementKeysAtIndex:i];
        [v12 addRequirementKeys:v7];
      }
    }
  }
  if ([(NPKProtoGenerateAuxiliaryCapabilitiesResponse *)self keyMaterialValuesCount])
  {
    [v12 clearKeyMaterialValues];
    unint64_t v8 = [(NPKProtoGenerateAuxiliaryCapabilitiesResponse *)self keyMaterialValuesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(NPKProtoGenerateAuxiliaryCapabilitiesResponse *)self keyMaterialValuesAtIndex:j];
        [v12 addKeyMaterialValues:v11];
      }
    }
  }
  if (self->_errorData) {
    objc_msgSend(v12, "setErrorData:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v6 = self->_requirementKeys;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v25 + 1) + 8 * v10) copyWithZone:a3];
        [v5 addRequirementKeys:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v8);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v12 = self->_keyMaterialValues;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v16), "copyWithZone:", a3, (void)v21);
        [v5 addKeyMaterialValues:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v14);
  }

  uint64_t v18 = [(NSData *)self->_errorData copyWithZone:a3];
  long long v19 = (void *)v5[1];
  v5[1] = v18;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((requirementKeys = self->_requirementKeys, !((unint64_t)requirementKeys | v4[3]))
     || -[NSMutableArray isEqual:](requirementKeys, "isEqual:"))
    && ((keyMaterialValues = self->_keyMaterialValues, !((unint64_t)keyMaterialValues | v4[2]))
     || -[NSMutableArray isEqual:](keyMaterialValues, "isEqual:")))
  {
    errorData = self->_errorData;
    if ((unint64_t)errorData | v4[1]) {
      char v8 = -[NSData isEqual:](errorData, "isEqual:");
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
  uint64_t v3 = [(NSMutableArray *)self->_requirementKeys hash];
  uint64_t v4 = [(NSMutableArray *)self->_keyMaterialValues hash] ^ v3;
  return v4 ^ [(NSData *)self->_errorData hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v4 = (id *)a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v4[3];
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
        [(NPKProtoGenerateAuxiliaryCapabilitiesResponse *)self addRequirementKeys:*(void *)(*((void *)&v19 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = v4[2];
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
        -[NPKProtoGenerateAuxiliaryCapabilitiesResponse addKeyMaterialValues:](self, "addKeyMaterialValues:", *(void *)(*((void *)&v15 + 1) + 8 * j), (void)v15);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }

  if (v4[1]) {
    -[NPKProtoGenerateAuxiliaryCapabilitiesResponse setErrorData:](self, "setErrorData:");
  }
}

- (NSMutableArray)requirementKeys
{
  return self->_requirementKeys;
}

- (void)setRequirementKeys:(id)a3
{
}

- (NSMutableArray)keyMaterialValues
{
  return self->_keyMaterialValues;
}

- (void)setKeyMaterialValues:(id)a3
{
}

- (NSData)errorData
{
  return self->_errorData;
}

- (void)setErrorData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requirementKeys, 0);
  objc_storeStrong((id *)&self->_keyMaterialValues, 0);
  objc_storeStrong((id *)&self->_errorData, 0);
}

@end