@interface NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured
- (BOOL)hasConnectionInfo;
- (BOOL)hasHasIpv4;
- (BOOL)hasHasIpv6;
- (BOOL)hasIpv4;
- (BOOL)hasIpv6;
- (BOOL)hasIsConstrained;
- (BOOL)hasIsExpensive;
- (BOOL)hasStatus;
- (BOOL)isConstrained;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExpensive;
- (BOOL)readFrom:(id)a3;
- (NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured)initWithDictionary:(id)a3;
- (NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured)initWithJSON:(id)a3;
- (NSArray)pathGateways;
- (NSArray)pathInterfaces;
- (NSData)jsonData;
- (NSString)connectionInfo;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)pathGatewaysAtIndex:(unint64_t)a3;
- (id)pathInterfacesAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (int)status;
- (unint64_t)hash;
- (unint64_t)pathGatewaysCount;
- (unint64_t)pathInterfacesCount;
- (void)addPathGateways:(id)a3;
- (void)addPathInterfaces:(id)a3;
- (void)clearPathGateways;
- (void)clearPathInterfaces;
- (void)deleteConnectionInfo;
- (void)deleteHasIpv4;
- (void)deleteHasIpv6;
- (void)deleteIsConstrained;
- (void)deleteIsExpensive;
- (void)deleteStatus;
- (void)setConnectionInfo:(id)a3;
- (void)setHasConnectionInfo:(BOOL)a3;
- (void)setHasHasIpv4:(BOOL)a3;
- (void)setHasHasIpv6:(BOOL)a3;
- (void)setHasIpv4:(BOOL)a3;
- (void)setHasIpv6:(BOOL)a3;
- (void)setHasIsConstrained:(BOOL)a3;
- (void)setHasIsExpensive:(BOOL)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setIsConstrained:(BOOL)a3;
- (void)setIsExpensive:(BOOL)a3;
- (void)setPathGateways:(id)a3;
- (void)setPathInterfaces:(id)a3;
- (void)setStatus:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v11 applySensitiveConditionsPolicy:v4];
  v6 = [(NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured *)self pathGateways];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];
  [(NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured *)self setPathGateways:v7];

  v8 = [(NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured *)self pathInterfaces];
  v9 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v8 underConditions:v4];

  [(NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured *)self setPathInterfaces:v9];
  return v5;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathInterfaces, 0);
  objc_storeStrong((id *)&self->_connectionInfo, 0);
  objc_storeStrong((id *)&self->_pathGateways, 0);
}

- (void)setHasConnectionInfo:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)status
{
  return self->_status;
}

- (void)setPathInterfaces:(id)a3
{
}

- (NSArray)pathInterfaces
{
  return self->_pathInterfaces;
}

- (BOOL)isConstrained
{
  return self->_isConstrained;
}

- (BOOL)hasIpv4
{
  return self->_hasIpv4;
}

- (BOOL)hasIpv6
{
  return self->_hasIpv6;
}

- (void)setConnectionInfo:(id)a3
{
}

- (NSString)connectionInfo
{
  return self->_connectionInfo;
}

- (void)setPathGateways:(id)a3
{
}

- (NSArray)pathGateways
{
  return self->_pathGateways;
}

- (BOOL)isExpensive
{
  return self->_isExpensive;
}

- (NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured)initWithDictionary:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured;
  v5 = [(NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured *)&v46 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"isExpensive"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured setIsExpensive:](v5, "setIsExpensive:", [v6 BOOLValue]);
    }
    v37 = v6;
    v7 = [v4 objectForKeyedSubscript:@"pathGateways"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      v8 = v7;
      id v9 = v7;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v42 objects:v48 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v43;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v43 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v42 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v15 = [[NETSchemaNETEndpoint alloc] initWithDictionary:v14];
              [(NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured *)v5 addPathGateways:v15];
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v42 objects:v48 count:16];
        }
        while (v11);
      }

      v7 = v8;
    }
    v16 = [v4 objectForKeyedSubscript:@"connectionInfo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = (void *)[v16 copy];
      [(NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured *)v5 setConnectionInfo:v17];
    }
    v18 = [v4 objectForKeyedSubscript:@"hasIpv6"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured setHasIpv6:](v5, "setHasIpv6:", [v18 BOOLValue]);
    }
    v19 = [v4 objectForKeyedSubscript:@"hasIpv4"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured setHasIpv4:](v5, "setHasIpv4:", [v19 BOOLValue]);
    }
    v20 = [v4 objectForKeyedSubscript:@"isConstrained"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured setIsConstrained:](v5, "setIsConstrained:", [v20 BOOLValue]);
    }
    v36 = v20;
    v21 = [v4 objectForKeyedSubscript:@"pathInterfaces"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v32 = v19;
      v33 = v18;
      v34 = v16;
      v35 = v7;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v22 = v21;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v38 objects:v47 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v39;
        do
        {
          for (uint64_t j = 0; j != v24; ++j)
          {
            if (*(void *)v39 != v25) {
              objc_enumerationMutation(v22);
            }
            uint64_t v27 = *(void *)(*((void *)&v38 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v28 = [[NETSchemaNETPathInterface alloc] initWithDictionary:v27];
              [(NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured *)v5 addPathInterfaces:v28];
            }
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v38 objects:v47 count:16];
        }
        while (v24);
      }

      v7 = v35;
      v19 = v32;
    }
    v29 = objc_msgSend(v4, "objectForKeyedSubscript:", @"status", v32, v33, v34, v35);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured setStatus:](v5, "setStatus:", [v29 intValue]);
    }
    v30 = v5;
  }
  return v5;
}

- (NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_connectionInfo)
  {
    id v4 = [(NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured *)self connectionInfo];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"connectionInfo"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v26 = objc_msgSend(NSNumber, "numberWithBool:", -[NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured hasIpv4](self, "hasIpv4"));
    [v3 setObject:v26 forKeyedSubscript:@"hasIpv4"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_37;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  uint64_t v27 = objc_msgSend(NSNumber, "numberWithBool:", -[NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured hasIpv6](self, "hasIpv6"));
  [v3 setObject:v27 forKeyedSubscript:@"hasIpv6"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_37:
  v28 = objc_msgSend(NSNumber, "numberWithBool:", -[NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured isConstrained](self, "isConstrained"));
  [v3 setObject:v28 forKeyedSubscript:@"isConstrained"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_7:
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured isExpensive](self, "isExpensive"));
    [v3 setObject:v7 forKeyedSubscript:@"isExpensive"];
  }
LABEL_8:
  if ([(NSArray *)self->_pathGateways count])
  {
    v8 = [MEMORY[0x1E4F1CA48] array];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v9 = self->_pathGateways;
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v35 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = [*(id *)(*((void *)&v34 + 1) + 8 * i) dictionaryRepresentation];
          if (v14)
          {
            [v8 addObject:v14];
          }
          else
          {
            v15 = [MEMORY[0x1E4F1CA98] null];
            [v8 addObject:v15];
          }
        }
        uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v11);
    }

    [v3 setObject:v8 forKeyedSubscript:@"pathGateways"];
  }
  if ([(NSArray *)self->_pathInterfaces count])
  {
    v16 = [MEMORY[0x1E4F1CA48] array];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v17 = self->_pathInterfaces;
    uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v31;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v31 != v20) {
            objc_enumerationMutation(v17);
          }
          id v22 = [*(id *)(*((void *)&v30 + 1) + 8 * j) dictionaryRepresentation];
          if (v22)
          {
            [v16 addObject:v22];
          }
          else
          {
            uint64_t v23 = [MEMORY[0x1E4F1CA98] null];
            [v16 addObject:v23];
          }
        }
        uint64_t v19 = [(NSArray *)v17 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v19);
    }

    [v3 setObject:v16 forKeyedSubscript:@"pathInterfaces"];
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    unsigned int v24 = [(NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured *)self status] - 1;
    if (v24 > 3) {
      uint64_t v25 = @"NETPATHSTATUS_UNKNOWN";
    }
    else {
      uint64_t v25 = off_1E5EB28B8[v24];
    }
    [v3 setObject:v25 forKeyedSubscript:@"status"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_isExpensive;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSArray *)self->_pathGateways hash];
  NSUInteger v5 = [(NSString *)self->_connectionInfo hash];
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_7;
    }
    goto LABEL_10;
  }
  uint64_t v6 = 2654435761 * self->_hasIpv6;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v7 = 2654435761 * self->_hasIpv4;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_isConstrained;
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v8 = 0;
LABEL_11:
  uint64_t v9 = [(NSArray *)self->_pathInterfaces hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v10 = 2654435761 * self->_status;
  }
  else {
    uint64_t v10 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[52] & 1)) {
    goto LABEL_31;
  }
  if (*(unsigned char *)&self->_has)
  {
    int isExpensive = self->_isExpensive;
    if (isExpensive != [v4 isExpensive]) {
      goto LABEL_31;
    }
  }
  uint64_t v6 = [(NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured *)self pathGateways];
  uint64_t v7 = [v4 pathGateways];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_30;
  }
  uint64_t v8 = [(NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured *)self pathGateways];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    uint64_t v10 = [(NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured *)self pathGateways];
    uint64_t v11 = [v4 pathGateways];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_31;
    }
  }
  else
  {
  }
  uint64_t v6 = [(NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured *)self connectionInfo];
  uint64_t v7 = [v4 connectionInfo];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_30;
  }
  uint64_t v13 = [(NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured *)self connectionInfo];
  if (v13)
  {
    uint64_t v14 = (void *)v13;
    v15 = [(NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured *)self connectionInfo];
    v16 = [v4 connectionInfo];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_31;
    }
  }
  else
  {
  }
  $2CB15FF963A334E3A0C63BFF0EB2303A has = self->_has;
  int v19 = (*(unsigned int *)&has >> 1) & 1;
  unsigned int v20 = v4[52];
  if (v19 != ((v20 >> 1) & 1)) {
    goto LABEL_31;
  }
  if (v19)
  {
    hasIpuint64_t v6 = self->_hasIpv6;
    if (hasIpv6 != [v4 hasIpv6]) {
      goto LABEL_31;
    }
    $2CB15FF963A334E3A0C63BFF0EB2303A has = self->_has;
    unsigned int v20 = v4[52];
  }
  int v22 = (*(unsigned int *)&has >> 2) & 1;
  if (v22 != ((v20 >> 2) & 1)) {
    goto LABEL_31;
  }
  if (v22)
  {
    hasIpuint64_t v4 = self->_hasIpv4;
    if (hasIpv4 != [v4 hasIpv4]) {
      goto LABEL_31;
    }
    $2CB15FF963A334E3A0C63BFF0EB2303A has = self->_has;
    unsigned int v20 = v4[52];
  }
  int v24 = (*(unsigned int *)&has >> 3) & 1;
  if (v24 != ((v20 >> 3) & 1)) {
    goto LABEL_31;
  }
  if (v24)
  {
    int isConstrained = self->_isConstrained;
    if (isConstrained != [v4 isConstrained]) {
      goto LABEL_31;
    }
  }
  uint64_t v6 = [(NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured *)self pathInterfaces];
  uint64_t v7 = [v4 pathInterfaces];
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_30:

    goto LABEL_31;
  }
  uint64_t v26 = [(NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured *)self pathInterfaces];
  if (v26)
  {
    uint64_t v27 = (void *)v26;
    v28 = [(NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured *)self pathInterfaces];
    v29 = [v4 pathInterfaces];
    int v30 = [v28 isEqual:v29];

    if (!v30) {
      goto LABEL_31;
    }
  }
  else
  {
  }
  int v33 = (*(unsigned char *)&self->_has >> 4) & 1;
  if (v33 == ((v4[52] >> 4) & 1))
  {
    if (!v33 || (int status = self->_status, status == [v4 status]))
    {
      BOOL v31 = 1;
      goto LABEL_32;
    }
  }
LABEL_31:
  BOOL v31 = 0;
LABEL_32:

  return v31;
}

- (void)writeTo:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  NSUInteger v5 = self->_pathGateways;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }

  uint64_t v10 = [(NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCaptured *)self connectionInfo];

  if (v10) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_14:
      if ((has & 8) == 0) {
        goto LABEL_16;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_14;
  }
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_15:
  }
    PBDataWriterWriteBOOLField();
LABEL_16:
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  int v12 = self->_pathInterfaces;
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }

  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return NETSchemaNETDebugNetworkConnectionStatePreparationSnapshotCapturedReadFrom(self, (uint64_t)a3);
}

- (void)deleteStatus
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasStatus
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_int status = a3;
}

- (id)pathInterfacesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_pathInterfaces objectAtIndexedSubscript:a3];
}

- (unint64_t)pathInterfacesCount
{
  return [(NSArray *)self->_pathInterfaces count];
}

- (void)addPathInterfaces:(id)a3
{
  id v4 = a3;
  pathInterfaces = self->_pathInterfaces;
  id v8 = v4;
  if (!pathInterfaces)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_pathInterfaces;
    self->_pathInterfaces = v6;

    id v4 = v8;
    pathInterfaces = self->_pathInterfaces;
  }
  [(NSArray *)pathInterfaces addObject:v4];
}

- (void)clearPathInterfaces
{
}

- (void)deleteIsConstrained
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasIsConstrained:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsConstrained
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setIsConstrained:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int isConstrained = a3;
}

- (void)deleteHasIpv4
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasHasIpv4:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasHasIpv4
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasIpv4:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_hasIpid v4 = a3;
}

- (void)deleteHasIpv6
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasHasIpv6:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasHasIpv6
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasIpv6:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_hasIpuint64_t v6 = a3;
}

- (void)deleteConnectionInfo
{
}

- (BOOL)hasConnectionInfo
{
  return self->_connectionInfo != 0;
}

- (id)pathGatewaysAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_pathGateways objectAtIndexedSubscript:a3];
}

- (unint64_t)pathGatewaysCount
{
  return [(NSArray *)self->_pathGateways count];
}

- (void)addPathGateways:(id)a3
{
  id v4 = a3;
  pathGateways = self->_pathGateways;
  id v8 = v4;
  if (!pathGateways)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_pathGateways;
    self->_pathGateways = v6;

    id v4 = v8;
    pathGateways = self->_pathGateways;
  }
  [(NSArray *)pathGateways addObject:v4];
}

- (void)clearPathGateways
{
}

- (void)deleteIsExpensive
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasIsExpensive:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsExpensive
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsExpensive:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int isExpensive = a3;
}

@end