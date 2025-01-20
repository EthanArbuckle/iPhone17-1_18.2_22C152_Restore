@interface _SFPBApiResults
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)flights;
- (NSData)jsonData;
- (_SFPBApiResults)initWithDictionary:(id)a3;
- (_SFPBApiResults)initWithFacade:(id)a3;
- (_SFPBApiResults)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)flightsAtIndex:(unint64_t)a3;
- (int)resultType;
- (int)status;
- (unint64_t)flightsCount;
- (unint64_t)hash;
- (void)addFlights:(id)a3;
- (void)clearFlights;
- (void)setFlights:(id)a3;
- (void)setResultType:(int)a3;
- (void)setStatus:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBApiResults

- (_SFPBApiResults)initWithFacade:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBApiResults *)self init];
  if (v5)
  {
    if ([v4 hasStatus]) {
      -[_SFPBApiResults setStatus:](v5, "setStatus:", [v4 status]);
    }
    if ([v4 hasResultType]) {
      -[_SFPBApiResults setResultType:](v5, "setResultType:", [v4 resultType]);
    }
    v6 = [v4 flights];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v8 = objc_msgSend(v4, "flights", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [[_SFPBFlight alloc] initWithFacade:*(void *)(*((void *)&v16 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }

    [(_SFPBApiResults *)v5 setFlights:v7];
    v14 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
}

- (NSArray)flights
{
  return self->_flights;
}

- (int)resultType
{
  return self->_resultType;
}

- (int)status
{
  return self->_status;
}

- (_SFPBApiResults)initWithDictionary:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)_SFPBApiResults;
  v5 = [(_SFPBApiResults *)&v24 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"status"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBApiResults setStatus:](v5, "setStatus:", [v6 intValue]);
    }
    id v7 = [v4 objectForKeyedSubscript:@"resultType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBApiResults setResultType:](v5, "setResultType:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"flights"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v18 = v7;
      long long v19 = v6;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v21;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v21 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * v13);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v15 = [[_SFPBFlight alloc] initWithDictionary:v14];
              [(_SFPBApiResults *)v5 addFlights:v15];
            }
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
        }
        while (v11);
      }

      id v7 = v18;
      v6 = v19;
    }
    long long v16 = v5;
  }
  return v5;
}

- (_SFPBApiResults)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBApiResults *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBApiResults *)self dictionaryRepresentation];
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
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_flights count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v5 = self->_flights;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [*(id *)(*((void *)&v17 + 1) + 8 * i) dictionaryRepresentation];
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
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"flights"];
  }
  if (self->_resultType)
  {
    uint64_t v12 = [(_SFPBApiResults *)self resultType];
    if (v12)
    {
      if (v12 == 1)
      {
        uint64_t v13 = @"1";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v12);
        uint64_t v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      uint64_t v13 = @"0";
    }
    [v3 setObject:v13 forKeyedSubscript:@"resultType"];
  }
  if (self->_status)
  {
    uint64_t v14 = [(_SFPBApiResults *)self status];
    if (v14 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v14);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = off_1E5A2F058[v14];
    }
    [v3 setObject:v15 forKeyedSubscript:@"status"];
  }
  return v3;
}

- (unint64_t)hash
{
  uint64_t v2 = (2654435761 * self->_resultType) ^ (2654435761 * self->_status);
  return v2 ^ [(NSArray *)self->_flights hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    int status = self->_status;
    if (status == [v4 status])
    {
      int resultType = self->_resultType;
      if (resultType == [v4 resultType])
      {
        uint64_t v7 = [(_SFPBApiResults *)self flights];
        uint64_t v8 = [v4 flights];
        id v9 = v8;
        if ((v7 == 0) != (v8 != 0))
        {
          uint64_t v10 = [(_SFPBApiResults *)self flights];
          if (!v10)
          {

LABEL_12:
            BOOL v15 = 1;
            goto LABEL_10;
          }
          uint64_t v11 = (void *)v10;
          uint64_t v12 = [(_SFPBApiResults *)self flights];
          uint64_t v13 = [v4 flights];
          char v14 = [v12 isEqual:v13];

          if (v14) {
            goto LABEL_12;
          }
        }
        else
        {
        }
      }
    }
  }
  BOOL v15 = 0;
LABEL_10:

  return v15;
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(_SFPBApiResults *)self status]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_SFPBApiResults *)self resultType]) {
    PBDataWriterWriteInt32Field();
  }
  v5 = [(_SFPBApiResults *)self flights];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBApiResultsReadFrom(self, (uint64_t)a3);
}

- (id)flightsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_flights objectAtIndexedSubscript:a3];
}

- (unint64_t)flightsCount
{
  return [(NSArray *)self->_flights count];
}

- (void)addFlights:(id)a3
{
  id v4 = a3;
  flights = self->_flights;
  id v8 = v4;
  if (!flights)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_flights;
    self->_flights = v6;

    id v4 = v8;
    flights = self->_flights;
  }
  [(NSArray *)flights addObject:v4];
}

- (void)clearFlights
{
}

- (void)setFlights:(id)a3
{
  self->_flights = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setResultType:(int)a3
{
  self->_int resultType = a3;
}

- (void)setStatus:(int)a3
{
  self->_int status = a3;
}

@end