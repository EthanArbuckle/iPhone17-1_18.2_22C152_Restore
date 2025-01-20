@interface SISchemaActiveStatus
- (BOOL)carPlayActiveWithin24Hours;
- (BOOL)hasCarPlayActiveWithin24Hours;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)audioDevicesActiveWithin24Hours;
- (NSArray)carBluetoothHeadUnitsActiveWithinLast24Hours;
- (NSData)jsonData;
- (SISchemaActiveStatus)initWithDictionary:(id)a3;
- (SISchemaActiveStatus)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)audioDevicesActiveWithin24HoursAtIndex:(unint64_t)a3;
- (id)carBluetoothHeadUnitsActiveWithinLast24HoursAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)audioDevicesActiveWithin24HoursCount;
- (unint64_t)carBluetoothHeadUnitsActiveWithinLast24HoursCount;
- (unint64_t)hash;
- (void)addAudioDevicesActiveWithin24Hours:(id)a3;
- (void)addCarBluetoothHeadUnitsActiveWithinLast24Hours:(id)a3;
- (void)clearAudioDevicesActiveWithin24Hours;
- (void)clearCarBluetoothHeadUnitsActiveWithinLast24Hours;
- (void)deleteCarPlayActiveWithin24Hours;
- (void)setAudioDevicesActiveWithin24Hours:(id)a3;
- (void)setCarBluetoothHeadUnitsActiveWithinLast24Hours:(id)a3;
- (void)setCarPlayActiveWithin24Hours:(BOOL)a3;
- (void)setHasCarPlayActiveWithin24Hours:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaActiveStatus

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SISchemaActiveStatus;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v11 applySensitiveConditionsPolicy:v4];
  v6 = [(SISchemaActiveStatus *)self audioDevicesActiveWithin24Hours];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];
  [(SISchemaActiveStatus *)self setAudioDevicesActiveWithin24Hours:v7];

  v8 = [(SISchemaActiveStatus *)self carBluetoothHeadUnitsActiveWithinLast24Hours];
  v9 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v8 underConditions:v4];

  [(SISchemaActiveStatus *)self setCarBluetoothHeadUnitsActiveWithinLast24Hours:v9];
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
  objc_storeStrong((id *)&self->_carBluetoothHeadUnitsActiveWithinLast24Hours, 0);
  objc_storeStrong((id *)&self->_audioDevicesActiveWithin24Hours, 0);
}

- (void)setCarBluetoothHeadUnitsActiveWithinLast24Hours:(id)a3
{
}

- (NSArray)carBluetoothHeadUnitsActiveWithinLast24Hours
{
  return self->_carBluetoothHeadUnitsActiveWithinLast24Hours;
}

- (BOOL)carPlayActiveWithin24Hours
{
  return self->_carPlayActiveWithin24Hours;
}

- (void)setAudioDevicesActiveWithin24Hours:(id)a3
{
}

- (NSArray)audioDevicesActiveWithin24Hours
{
  return self->_audioDevicesActiveWithin24Hours;
}

- (SISchemaActiveStatus)initWithDictionary:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)SISchemaActiveStatus;
  v5 = [(SISchemaActiveStatus *)&v35 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"audioDevicesActiveWithin24Hours"];
    objc_opt_class();
    v26 = v6;
    if (objc_opt_isKindOfClass())
    {
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v31 objects:v37 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v32;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v32 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v31 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = [[SISchemaActiveAudioDevice alloc] initWithDictionary:v12];
              [(SISchemaActiveStatus *)v5 addAudioDevicesActiveWithin24Hours:v13];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v31 objects:v37 count:16];
        }
        while (v9);
      }

      v6 = v26;
    }
    v14 = [v4 objectForKeyedSubscript:@"carPlayActiveWithin24Hours"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaActiveStatus setCarPlayActiveWithin24Hours:](v5, "setCarPlayActiveWithin24Hours:", [v14 BOOLValue]);
    }
    v15 = [v4 objectForKeyedSubscript:@"carBluetoothHeadUnitsActiveWithinLast24Hours"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v25 = v4;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v16 = v15;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v36 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v28;
        do
        {
          uint64_t v20 = 0;
          do
          {
            if (*(void *)v28 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v21 = *(void *)(*((void *)&v27 + 1) + 8 * v20);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v22 = [[SISchemaCarBluetoothHeadUnit alloc] initWithDictionary:v21];
              [(SISchemaActiveStatus *)v5 addCarBluetoothHeadUnitsActiveWithinLast24Hours:v22];
            }
            ++v20;
          }
          while (v18 != v20);
          uint64_t v18 = [v16 countByEnumeratingWithState:&v27 objects:v36 count:16];
        }
        while (v18);
      }

      id v4 = v25;
      v6 = v26;
    }
    v23 = v5;
  }
  return v5;
}

- (SISchemaActiveStatus)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaActiveStatus *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaActiveStatus *)self dictionaryRepresentation];
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
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_audioDevicesActiveWithin24Hours count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v5 = self->_audioDevicesActiveWithin24Hours;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v27 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [*(id *)(*((void *)&v26 + 1) + 8 * i) dictionaryRepresentation];
          if (v10)
          {
            [v4 addObject:v10];
          }
          else
          {
            uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
            [v4 addObject:v11];
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"audioDevicesActiveWithin24Hours"];
  }
  if ([(NSArray *)self->_carBluetoothHeadUnitsActiveWithinLast24Hours count])
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v13 = self->_carBluetoothHeadUnitsActiveWithinLast24Hours;
    uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v23;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * j), "dictionaryRepresentation", (void)v22);
          if (v18)
          {
            [v12 addObject:v18];
          }
          else
          {
            uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
            [v12 addObject:v19];
          }
        }
        uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v15);
    }

    [v3 setObject:v12 forKeyedSubscript:@"carBluetoothHeadUnitsActiveWithinLast24Hours"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v20 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaActiveStatus carPlayActiveWithin24Hours](self, "carPlayActiveWithin24Hours"));
    [v3 setObject:v20 forKeyedSubscript:@"carPlayActiveWithin24Hours"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v22);
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_audioDevicesActiveWithin24Hours hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_carPlayActiveWithin24Hours;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(NSArray *)self->_carBluetoothHeadUnitsActiveWithinLast24Hours hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  v5 = [(SISchemaActiveStatus *)self audioDevicesActiveWithin24Hours];
  uint64_t v6 = [v4 audioDevicesActiveWithin24Hours];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_14;
  }
  uint64_t v7 = [(SISchemaActiveStatus *)self audioDevicesActiveWithin24Hours];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(SISchemaActiveStatus *)self audioDevicesActiveWithin24Hours];
    uint64_t v10 = [v4 audioDevicesActiveWithin24Hours];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[32] & 1)) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    int carPlayActiveWithin24Hours = self->_carPlayActiveWithin24Hours;
    if (carPlayActiveWithin24Hours != [v4 carPlayActiveWithin24Hours]) {
      goto LABEL_15;
    }
  }
  v5 = [(SISchemaActiveStatus *)self carBluetoothHeadUnitsActiveWithinLast24Hours];
  uint64_t v6 = [v4 carBluetoothHeadUnitsActiveWithinLast24Hours];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v13 = [(SISchemaActiveStatus *)self carBluetoothHeadUnitsActiveWithinLast24Hours];
    if (!v13)
    {

LABEL_18:
      BOOL v18 = 1;
      goto LABEL_16;
    }
    uint64_t v14 = (void *)v13;
    uint64_t v15 = [(SISchemaActiveStatus *)self carBluetoothHeadUnitsActiveWithinLast24Hours];
    uint64_t v16 = [v4 carBluetoothHeadUnitsActiveWithinLast24Hours];
    char v17 = [v15 isEqual:v16];

    if (v17) {
      goto LABEL_18;
    }
  }
  else
  {
LABEL_14:
  }
LABEL_15:
  BOOL v18 = 0;
LABEL_16:

  return v18;
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v5 = self->_audioDevicesActiveWithin24Hours;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
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
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v10 = self->_carBluetoothHeadUnitsActiveWithinLast24Hours;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
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
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaActiveStatusReadFrom(self, (uint64_t)a3);
}

- (id)carBluetoothHeadUnitsActiveWithinLast24HoursAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_carBluetoothHeadUnitsActiveWithinLast24Hours objectAtIndexedSubscript:a3];
}

- (unint64_t)carBluetoothHeadUnitsActiveWithinLast24HoursCount
{
  return [(NSArray *)self->_carBluetoothHeadUnitsActiveWithinLast24Hours count];
}

- (void)addCarBluetoothHeadUnitsActiveWithinLast24Hours:(id)a3
{
  id v4 = a3;
  carBluetoothHeadUnitsActiveWithinLast24Hours = self->_carBluetoothHeadUnitsActiveWithinLast24Hours;
  id v8 = v4;
  if (!carBluetoothHeadUnitsActiveWithinLast24Hours)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_carBluetoothHeadUnitsActiveWithinLast24Hours;
    self->_carBluetoothHeadUnitsActiveWithinLast24Hours = v6;

    id v4 = v8;
    carBluetoothHeadUnitsActiveWithinLast24Hours = self->_carBluetoothHeadUnitsActiveWithinLast24Hours;
  }
  [(NSArray *)carBluetoothHeadUnitsActiveWithinLast24Hours addObject:v4];
}

- (void)clearCarBluetoothHeadUnitsActiveWithinLast24Hours
{
}

- (void)deleteCarPlayActiveWithin24Hours
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasCarPlayActiveWithin24Hours:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCarPlayActiveWithin24Hours
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setCarPlayActiveWithin24Hours:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int carPlayActiveWithin24Hours = a3;
}

- (id)audioDevicesActiveWithin24HoursAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_audioDevicesActiveWithin24Hours objectAtIndexedSubscript:a3];
}

- (unint64_t)audioDevicesActiveWithin24HoursCount
{
  return [(NSArray *)self->_audioDevicesActiveWithin24Hours count];
}

- (void)addAudioDevicesActiveWithin24Hours:(id)a3
{
  id v4 = a3;
  audioDevicesActiveWithin24Hours = self->_audioDevicesActiveWithin24Hours;
  id v8 = v4;
  if (!audioDevicesActiveWithin24Hours)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_audioDevicesActiveWithin24Hours;
    self->_audioDevicesActiveWithin24Hours = v6;

    id v4 = v8;
    audioDevicesActiveWithin24Hours = self->_audioDevicesActiveWithin24Hours;
  }
  [(NSArray *)audioDevicesActiveWithin24Hours addObject:v4];
}

- (void)clearAudioDevicesActiveWithin24Hours
{
}

@end