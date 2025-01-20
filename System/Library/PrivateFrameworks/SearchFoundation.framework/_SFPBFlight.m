@interface _SFPBFlight
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)legs;
- (NSData)jsonData;
- (NSString)carrierCode;
- (NSString)carrierName;
- (NSString)carrierPhoneNumber;
- (NSString)carrierWebsite;
- (NSString)flightID;
- (NSString)flightNumber;
- (NSString)operatorCarrierCode;
- (NSString)operatorFlightNumber;
- (_SFPBFlight)initWithDictionary:(id)a3;
- (_SFPBFlight)initWithFacade:(id)a3;
- (_SFPBFlight)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)legsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)legsCount;
- (void)addLegs:(id)a3;
- (void)clearLegs;
- (void)setCarrierCode:(id)a3;
- (void)setCarrierName:(id)a3;
- (void)setCarrierPhoneNumber:(id)a3;
- (void)setCarrierWebsite:(id)a3;
- (void)setFlightID:(id)a3;
- (void)setFlightNumber:(id)a3;
- (void)setLegs:(id)a3;
- (void)setOperatorCarrierCode:(id)a3;
- (void)setOperatorFlightNumber:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBFlight

- (_SFPBFlight)initWithFacade:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBFlight *)self init];
  if (v5)
  {
    v6 = [v4 flightID];

    if (v6)
    {
      v7 = [v4 flightID];
      [(_SFPBFlight *)v5 setFlightID:v7];
    }
    v8 = [v4 carrierCode];

    if (v8)
    {
      v9 = [v4 carrierCode];
      [(_SFPBFlight *)v5 setCarrierCode:v9];
    }
    v10 = [v4 carrierName];

    if (v10)
    {
      v11 = [v4 carrierName];
      [(_SFPBFlight *)v5 setCarrierName:v11];
    }
    v12 = [v4 flightNumber];

    if (v12)
    {
      v13 = [v4 flightNumber];
      [(_SFPBFlight *)v5 setFlightNumber:v13];
    }
    v14 = [v4 legs];
    if (v14) {
      id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v15 = 0;
    }

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v16 = objc_msgSend(v4, "legs", 0);
    uint64_t v17 = [v16 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v33 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [[_SFPBFlightLeg alloc] initWithFacade:*(void *)(*((void *)&v32 + 1) + 8 * i)];
          if (v21) {
            [v15 addObject:v21];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v18);
    }

    [(_SFPBFlight *)v5 setLegs:v15];
    v22 = [v4 operatorCarrierCode];

    if (v22)
    {
      v23 = [v4 operatorCarrierCode];
      [(_SFPBFlight *)v5 setOperatorCarrierCode:v23];
    }
    v24 = [v4 operatorFlightNumber];

    if (v24)
    {
      v25 = [v4 operatorFlightNumber];
      [(_SFPBFlight *)v5 setOperatorFlightNumber:v25];
    }
    v26 = [v4 carrierPhoneNumber];

    if (v26)
    {
      v27 = [v4 carrierPhoneNumber];
      [(_SFPBFlight *)v5 setCarrierPhoneNumber:v27];
    }
    v28 = [v4 carrierWebsite];

    if (v28)
    {
      v29 = [v4 carrierWebsite];
      [(_SFPBFlight *)v5 setCarrierWebsite:v29];
    }
    v30 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carrierWebsite, 0);
  objc_storeStrong((id *)&self->_carrierPhoneNumber, 0);
  objc_storeStrong((id *)&self->_operatorFlightNumber, 0);
  objc_storeStrong((id *)&self->_operatorCarrierCode, 0);
  objc_storeStrong((id *)&self->_legs, 0);
  objc_storeStrong((id *)&self->_flightNumber, 0);
  objc_storeStrong((id *)&self->_carrierName, 0);
  objc_storeStrong((id *)&self->_carrierCode, 0);
  objc_storeStrong((id *)&self->_flightID, 0);
}

- (NSString)carrierWebsite
{
  return self->_carrierWebsite;
}

- (NSString)carrierPhoneNumber
{
  return self->_carrierPhoneNumber;
}

- (NSString)operatorFlightNumber
{
  return self->_operatorFlightNumber;
}

- (NSString)operatorCarrierCode
{
  return self->_operatorCarrierCode;
}

- (NSArray)legs
{
  return self->_legs;
}

- (NSString)flightNumber
{
  return self->_flightNumber;
}

- (NSString)carrierName
{
  return self->_carrierName;
}

- (NSString)carrierCode
{
  return self->_carrierCode;
}

- (NSString)flightID
{
  return self->_flightID;
}

- (_SFPBFlight)initWithDictionary:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)_SFPBFlight;
  v5 = [(_SFPBFlight *)&v40 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"flightID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(_SFPBFlight *)v5 setFlightID:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"carrierCode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(_SFPBFlight *)v5 setCarrierCode:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"carrierName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = (void *)[v10 copy];
      [(_SFPBFlight *)v5 setCarrierName:v11];
    }
    long long v35 = v10;
    v12 = [v4 objectForKeyedSubscript:@"flightNumber"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = (void *)[v12 copy];
      [(_SFPBFlight *)v5 setFlightNumber:v13];
    }
    long long v34 = v12;
    v14 = [v4 objectForKeyedSubscript:@"legs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v32 = v8;
      long long v33 = v6;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v15 = v14;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v36 objects:v41 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v37;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v37 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void *)(*((void *)&v36 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v21 = [[_SFPBFlightLeg alloc] initWithDictionary:v20];
              [(_SFPBFlight *)v5 addLegs:v21];
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v36 objects:v41 count:16];
        }
        while (v17);
      }
    }
    v22 = objc_msgSend(v4, "objectForKeyedSubscript:", @"operatorCarrierCode", v32, v33);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v23 = (void *)[v22 copy];
      [(_SFPBFlight *)v5 setOperatorCarrierCode:v23];
    }
    v24 = [v4 objectForKeyedSubscript:@"operatorFlightNumber"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v25 = (void *)[v24 copy];
      [(_SFPBFlight *)v5 setOperatorFlightNumber:v25];
    }
    v26 = [v4 objectForKeyedSubscript:@"carrierPhoneNumber"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v27 = (void *)[v26 copy];
      [(_SFPBFlight *)v5 setCarrierPhoneNumber:v27];
    }
    v28 = [v4 objectForKeyedSubscript:@"carrierWebsite"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v29 = (void *)[v28 copy];
      [(_SFPBFlight *)v5 setCarrierWebsite:v29];
    }
    v30 = v5;
  }
  return v5;
}

- (_SFPBFlight)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBFlight *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBFlight *)self dictionaryRepresentation];
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
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_carrierCode)
  {
    id v4 = [(_SFPBFlight *)self carrierCode];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"carrierCode"];
  }
  if (self->_carrierName)
  {
    v6 = [(_SFPBFlight *)self carrierName];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"carrierName"];
  }
  if (self->_carrierPhoneNumber)
  {
    v8 = [(_SFPBFlight *)self carrierPhoneNumber];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"carrierPhoneNumber"];
  }
  if (self->_carrierWebsite)
  {
    v10 = [(_SFPBFlight *)self carrierWebsite];
    v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"carrierWebsite"];
  }
  if (self->_flightID)
  {
    v12 = [(_SFPBFlight *)self flightID];
    v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"flightID"];
  }
  if (self->_flightNumber)
  {
    v14 = [(_SFPBFlight *)self flightNumber];
    id v15 = (void *)[v14 copy];
    [v3 setObject:v15 forKeyedSubscript:@"flightNumber"];
  }
  if ([(NSArray *)self->_legs count])
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v17 = self->_legs;
    uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v30 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * i), "dictionaryRepresentation", (void)v29);
          if (v22)
          {
            [v16 addObject:v22];
          }
          else
          {
            v23 = [MEMORY[0x1E4F1CA98] null];
            [v16 addObject:v23];
          }
        }
        uint64_t v19 = [(NSArray *)v17 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v19);
    }

    [v3 setObject:v16 forKeyedSubscript:@"legs"];
  }
  if (self->_operatorCarrierCode)
  {
    v24 = [(_SFPBFlight *)self operatorCarrierCode];
    v25 = (void *)[v24 copy];
    [v3 setObject:v25 forKeyedSubscript:@"operatorCarrierCode"];
  }
  if (self->_operatorFlightNumber)
  {
    v26 = [(_SFPBFlight *)self operatorFlightNumber];
    v27 = (void *)[v26 copy];
    [v3 setObject:v27 forKeyedSubscript:@"operatorFlightNumber"];
  }
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_flightID hash];
  NSUInteger v4 = [(NSString *)self->_carrierCode hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_carrierName hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_flightNumber hash];
  uint64_t v7 = [(NSArray *)self->_legs hash];
  NSUInteger v8 = v7 ^ [(NSString *)self->_operatorCarrierCode hash];
  NSUInteger v9 = v6 ^ v8 ^ [(NSString *)self->_operatorFlightNumber hash];
  NSUInteger v10 = [(NSString *)self->_carrierPhoneNumber hash];
  return v9 ^ v10 ^ [(NSString *)self->_carrierWebsite hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_47;
  }
  NSUInteger v5 = [(_SFPBFlight *)self flightID];
  NSUInteger v6 = [v4 flightID];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v7 = [(_SFPBFlight *)self flightID];
  if (v7)
  {
    NSUInteger v8 = (void *)v7;
    NSUInteger v9 = [(_SFPBFlight *)self flightID];
    NSUInteger v10 = [v4 flightID];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBFlight *)self carrierCode];
  NSUInteger v6 = [v4 carrierCode];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v12 = [(_SFPBFlight *)self carrierCode];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_SFPBFlight *)self carrierCode];
    id v15 = [v4 carrierCode];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBFlight *)self carrierName];
  NSUInteger v6 = [v4 carrierName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v17 = [(_SFPBFlight *)self carrierName];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    uint64_t v19 = [(_SFPBFlight *)self carrierName];
    uint64_t v20 = [v4 carrierName];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBFlight *)self flightNumber];
  NSUInteger v6 = [v4 flightNumber];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v22 = [(_SFPBFlight *)self flightNumber];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(_SFPBFlight *)self flightNumber];
    v25 = [v4 flightNumber];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBFlight *)self legs];
  NSUInteger v6 = [v4 legs];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v27 = [(_SFPBFlight *)self legs];
  if (v27)
  {
    v28 = (void *)v27;
    long long v29 = [(_SFPBFlight *)self legs];
    long long v30 = [v4 legs];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBFlight *)self operatorCarrierCode];
  NSUInteger v6 = [v4 operatorCarrierCode];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v32 = [(_SFPBFlight *)self operatorCarrierCode];
  if (v32)
  {
    long long v33 = (void *)v32;
    uint64_t v34 = [(_SFPBFlight *)self operatorCarrierCode];
    long long v35 = [v4 operatorCarrierCode];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBFlight *)self operatorFlightNumber];
  NSUInteger v6 = [v4 operatorFlightNumber];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v37 = [(_SFPBFlight *)self operatorFlightNumber];
  if (v37)
  {
    long long v38 = (void *)v37;
    long long v39 = [(_SFPBFlight *)self operatorFlightNumber];
    objc_super v40 = [v4 operatorFlightNumber];
    int v41 = [v39 isEqual:v40];

    if (!v41) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBFlight *)self carrierPhoneNumber];
  NSUInteger v6 = [v4 carrierPhoneNumber];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v42 = [(_SFPBFlight *)self carrierPhoneNumber];
  if (v42)
  {
    v43 = (void *)v42;
    v44 = [(_SFPBFlight *)self carrierPhoneNumber];
    v45 = [v4 carrierPhoneNumber];
    int v46 = [v44 isEqual:v45];

    if (!v46) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBFlight *)self carrierWebsite];
  NSUInteger v6 = [v4 carrierWebsite];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v47 = [(_SFPBFlight *)self carrierWebsite];
    if (!v47)
    {

LABEL_50:
      BOOL v52 = 1;
      goto LABEL_48;
    }
    v48 = (void *)v47;
    v49 = [(_SFPBFlight *)self carrierWebsite];
    v50 = [v4 carrierWebsite];
    char v51 = [v49 isEqual:v50];

    if (v51) {
      goto LABEL_50;
    }
  }
  else
  {
LABEL_46:
  }
LABEL_47:
  BOOL v52 = 0;
LABEL_48:

  return v52;
}

- (void)writeTo:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  NSUInteger v5 = [(_SFPBFlight *)self flightID];
  if (v5) {
    PBDataWriterWriteStringField();
  }

  NSUInteger v6 = [(_SFPBFlight *)self carrierCode];
  if (v6) {
    PBDataWriterWriteStringField();
  }

  uint64_t v7 = [(_SFPBFlight *)self carrierName];
  if (v7) {
    PBDataWriterWriteStringField();
  }

  NSUInteger v8 = [(_SFPBFlight *)self flightNumber];
  if (v8) {
    PBDataWriterWriteStringField();
  }

  NSUInteger v9 = [(_SFPBFlight *)self legs];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        PBDataWriterWriteSubmessage();
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  v14 = [(_SFPBFlight *)self operatorCarrierCode];
  if (v14) {
    PBDataWriterWriteStringField();
  }

  id v15 = [(_SFPBFlight *)self operatorFlightNumber];
  if (v15) {
    PBDataWriterWriteStringField();
  }

  int v16 = [(_SFPBFlight *)self carrierPhoneNumber];
  if (v16) {
    PBDataWriterWriteStringField();
  }

  uint64_t v17 = [(_SFPBFlight *)self carrierWebsite];
  if (v17) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBFlightReadFrom(self, (uint64_t)a3);
}

- (void)setCarrierWebsite:(id)a3
{
  self->_carrierWebsite = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setCarrierPhoneNumber:(id)a3
{
  self->_carrierPhoneNumber = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setOperatorFlightNumber:(id)a3
{
  self->_operatorFlightNumber = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setOperatorCarrierCode:(id)a3
{
  self->_operatorCarrierCode = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (id)legsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_legs objectAtIndexedSubscript:a3];
}

- (unint64_t)legsCount
{
  return [(NSArray *)self->_legs count];
}

- (void)addLegs:(id)a3
{
  id v4 = a3;
  legs = self->_legs;
  id v8 = v4;
  if (!legs)
  {
    NSUInteger v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_legs;
    self->_legs = v6;

    id v4 = v8;
    legs = self->_legs;
  }
  [(NSArray *)legs addObject:v4];
}

- (void)clearLegs
{
}

- (void)setLegs:(id)a3
{
  self->_legs = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setFlightNumber:(id)a3
{
  self->_flightNumber = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setCarrierName:(id)a3
{
  self->_carrierName = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setCarrierCode:(id)a3
{
  self->_carrierCode = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setFlightID:(id)a3
{
  self->_flightID = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end