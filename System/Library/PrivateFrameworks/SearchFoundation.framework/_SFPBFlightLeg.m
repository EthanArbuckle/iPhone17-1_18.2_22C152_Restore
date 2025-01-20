@interface _SFPBFlightLeg
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)arrivalGate;
- (NSString)arrivalTerminal;
- (NSString)baggageClaim;
- (NSString)departureGate;
- (NSString)departureTerminal;
- (NSString)title;
- (_SFPBAirport)arrivalAirport;
- (_SFPBAirport)departureAirport;
- (_SFPBAirport)divertedAirport;
- (_SFPBDate)arrivalActualTime;
- (_SFPBDate)arrivalGateTime;
- (_SFPBDate)arrivalPublishedTime;
- (_SFPBDate)arrivalRunwayTime;
- (_SFPBDate)departureActualTime;
- (_SFPBDate)departureGateClosedTime;
- (_SFPBDate)departurePublishedTime;
- (_SFPBDate)departureRunwayTime;
- (_SFPBFlightLeg)initWithDictionary:(id)a3;
- (_SFPBFlightLeg)initWithFacade:(id)a3;
- (_SFPBFlightLeg)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (int)status;
- (unint64_t)hash;
- (void)setArrivalActualTime:(id)a3;
- (void)setArrivalAirport:(id)a3;
- (void)setArrivalGate:(id)a3;
- (void)setArrivalGateTime:(id)a3;
- (void)setArrivalPublishedTime:(id)a3;
- (void)setArrivalRunwayTime:(id)a3;
- (void)setArrivalTerminal:(id)a3;
- (void)setBaggageClaim:(id)a3;
- (void)setDepartureActualTime:(id)a3;
- (void)setDepartureAirport:(id)a3;
- (void)setDepartureGate:(id)a3;
- (void)setDepartureGateClosedTime:(id)a3;
- (void)setDeparturePublishedTime:(id)a3;
- (void)setDepartureRunwayTime:(id)a3;
- (void)setDepartureTerminal:(id)a3;
- (void)setDivertedAirport:(id)a3;
- (void)setStatus:(int)a3;
- (void)setTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBFlightLeg

- (_SFPBFlightLeg)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBFlightLeg *)self init];
  if (v5)
  {
    if ([v4 hasStatus]) {
      -[_SFPBFlightLeg setStatus:](v5, "setStatus:", [v4 status]);
    }
    v6 = [v4 departurePublishedTime];

    if (v6)
    {
      v7 = [_SFPBDate alloc];
      v8 = [v4 departurePublishedTime];
      v9 = [(_SFPBDate *)v7 initWithNSDate:v8];
      [(_SFPBFlightLeg *)v5 setDeparturePublishedTime:v9];
    }
    v10 = [v4 departureActualTime];

    if (v10)
    {
      v11 = [_SFPBDate alloc];
      v12 = [v4 departureActualTime];
      v13 = [(_SFPBDate *)v11 initWithNSDate:v12];
      [(_SFPBFlightLeg *)v5 setDepartureActualTime:v13];
    }
    v14 = [v4 departureTerminal];

    if (v14)
    {
      v15 = [v4 departureTerminal];
      [(_SFPBFlightLeg *)v5 setDepartureTerminal:v15];
    }
    v16 = [v4 departureGate];

    if (v16)
    {
      v17 = [v4 departureGate];
      [(_SFPBFlightLeg *)v5 setDepartureGate:v17];
    }
    v18 = [v4 departureAirport];

    if (v18)
    {
      v19 = [_SFPBAirport alloc];
      v20 = [v4 departureAirport];
      v21 = [(_SFPBAirport *)v19 initWithFacade:v20];
      [(_SFPBFlightLeg *)v5 setDepartureAirport:v21];
    }
    v22 = [v4 arrivalPublishedTime];

    if (v22)
    {
      v23 = [_SFPBDate alloc];
      v24 = [v4 arrivalPublishedTime];
      v25 = [(_SFPBDate *)v23 initWithNSDate:v24];
      [(_SFPBFlightLeg *)v5 setArrivalPublishedTime:v25];
    }
    v26 = [v4 arrivalActualTime];

    if (v26)
    {
      v27 = [_SFPBDate alloc];
      v28 = [v4 arrivalActualTime];
      v29 = [(_SFPBDate *)v27 initWithNSDate:v28];
      [(_SFPBFlightLeg *)v5 setArrivalActualTime:v29];
    }
    v30 = [v4 arrivalTerminal];

    if (v30)
    {
      v31 = [v4 arrivalTerminal];
      [(_SFPBFlightLeg *)v5 setArrivalTerminal:v31];
    }
    v32 = [v4 arrivalGate];

    if (v32)
    {
      v33 = [v4 arrivalGate];
      [(_SFPBFlightLeg *)v5 setArrivalGate:v33];
    }
    v34 = [v4 arrivalAirport];

    if (v34)
    {
      v35 = [_SFPBAirport alloc];
      v36 = [v4 arrivalAirport];
      v37 = [(_SFPBAirport *)v35 initWithFacade:v36];
      [(_SFPBFlightLeg *)v5 setArrivalAirport:v37];
    }
    v38 = [v4 divertedAirport];

    if (v38)
    {
      v39 = [_SFPBAirport alloc];
      v40 = [v4 divertedAirport];
      v41 = [(_SFPBAirport *)v39 initWithFacade:v40];
      [(_SFPBFlightLeg *)v5 setDivertedAirport:v41];
    }
    v42 = [v4 title];

    if (v42)
    {
      v43 = [v4 title];
      [(_SFPBFlightLeg *)v5 setTitle:v43];
    }
    v44 = [v4 baggageClaim];

    if (v44)
    {
      v45 = [v4 baggageClaim];
      [(_SFPBFlightLeg *)v5 setBaggageClaim:v45];
    }
    v46 = [v4 departureGateClosedTime];

    if (v46)
    {
      v47 = [_SFPBDate alloc];
      v48 = [v4 departureGateClosedTime];
      v49 = [(_SFPBDate *)v47 initWithNSDate:v48];
      [(_SFPBFlightLeg *)v5 setDepartureGateClosedTime:v49];
    }
    v50 = [v4 departureRunwayTime];

    if (v50)
    {
      v51 = [_SFPBDate alloc];
      v52 = [v4 departureRunwayTime];
      v53 = [(_SFPBDate *)v51 initWithNSDate:v52];
      [(_SFPBFlightLeg *)v5 setDepartureRunwayTime:v53];
    }
    v54 = [v4 arrivalRunwayTime];

    if (v54)
    {
      v55 = [_SFPBDate alloc];
      v56 = [v4 arrivalRunwayTime];
      v57 = [(_SFPBDate *)v55 initWithNSDate:v56];
      [(_SFPBFlightLeg *)v5 setArrivalRunwayTime:v57];
    }
    v58 = [v4 arrivalGateTime];

    if (v58)
    {
      v59 = [_SFPBDate alloc];
      v60 = [v4 arrivalGateTime];
      v61 = [(_SFPBDate *)v59 initWithNSDate:v60];
      [(_SFPBFlightLeg *)v5 setArrivalGateTime:v61];
    }
    v62 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrivalGateTime, 0);
  objc_storeStrong((id *)&self->_arrivalRunwayTime, 0);
  objc_storeStrong((id *)&self->_departureRunwayTime, 0);
  objc_storeStrong((id *)&self->_departureGateClosedTime, 0);
  objc_storeStrong((id *)&self->_baggageClaim, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_divertedAirport, 0);
  objc_storeStrong((id *)&self->_arrivalAirport, 0);
  objc_storeStrong((id *)&self->_arrivalGate, 0);
  objc_storeStrong((id *)&self->_arrivalTerminal, 0);
  objc_storeStrong((id *)&self->_arrivalActualTime, 0);
  objc_storeStrong((id *)&self->_arrivalPublishedTime, 0);
  objc_storeStrong((id *)&self->_departureAirport, 0);
  objc_storeStrong((id *)&self->_departureGate, 0);
  objc_storeStrong((id *)&self->_departureTerminal, 0);
  objc_storeStrong((id *)&self->_departureActualTime, 0);
  objc_storeStrong((id *)&self->_departurePublishedTime, 0);
}

- (_SFPBDate)arrivalGateTime
{
  return self->_arrivalGateTime;
}

- (_SFPBDate)arrivalRunwayTime
{
  return self->_arrivalRunwayTime;
}

- (_SFPBDate)departureRunwayTime
{
  return self->_departureRunwayTime;
}

- (_SFPBDate)departureGateClosedTime
{
  return self->_departureGateClosedTime;
}

- (NSString)baggageClaim
{
  return self->_baggageClaim;
}

- (NSString)title
{
  return self->_title;
}

- (_SFPBAirport)divertedAirport
{
  return self->_divertedAirport;
}

- (_SFPBAirport)arrivalAirport
{
  return self->_arrivalAirport;
}

- (NSString)arrivalGate
{
  return self->_arrivalGate;
}

- (NSString)arrivalTerminal
{
  return self->_arrivalTerminal;
}

- (_SFPBDate)arrivalActualTime
{
  return self->_arrivalActualTime;
}

- (_SFPBDate)arrivalPublishedTime
{
  return self->_arrivalPublishedTime;
}

- (_SFPBAirport)departureAirport
{
  return self->_departureAirport;
}

- (NSString)departureGate
{
  return self->_departureGate;
}

- (NSString)departureTerminal
{
  return self->_departureTerminal;
}

- (_SFPBDate)departureActualTime
{
  return self->_departureActualTime;
}

- (_SFPBDate)departurePublishedTime
{
  return self->_departurePublishedTime;
}

- (int)status
{
  return self->_status;
}

- (_SFPBFlightLeg)initWithDictionary:(id)a3
{
  id v4 = a3;
  v54.receiver = self;
  v54.super_class = (Class)_SFPBFlightLeg;
  v5 = [(_SFPBFlightLeg *)&v54 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"status"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBFlightLeg setStatus:](v5, "setStatus:", [v6 intValue]);
    }
    v50 = v6;
    uint64_t v7 = [v4 objectForKeyedSubscript:@"departurePublishedTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = [[_SFPBDate alloc] initWithDictionary:v7];
      [(_SFPBFlightLeg *)v5 setDeparturePublishedTime:v8];
    }
    v49 = (void *)v7;
    uint64_t v9 = [v4 objectForKeyedSubscript:@"departureActualTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [[_SFPBDate alloc] initWithDictionary:v9];
      [(_SFPBFlightLeg *)v5 setDepartureActualTime:v10];
    }
    v48 = (void *)v9;
    v11 = [v4 objectForKeyedSubscript:@"departureTerminal"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = (void *)[v11 copy];
      [(_SFPBFlightLeg *)v5 setDepartureTerminal:v12];
    }
    v13 = [v4 objectForKeyedSubscript:@"departureGate"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v14 = (void *)[v13 copy];
      [(_SFPBFlightLeg *)v5 setDepartureGate:v14];
    }
    uint64_t v15 = [v4 objectForKeyedSubscript:@"departureAirport"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = [[_SFPBAirport alloc] initWithDictionary:v15];
      [(_SFPBFlightLeg *)v5 setDepartureAirport:v16];
    }
    uint64_t v17 = [v4 objectForKeyedSubscript:@"arrivalPublishedTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = [[_SFPBDate alloc] initWithDictionary:v17];
      [(_SFPBFlightLeg *)v5 setArrivalPublishedTime:v18];
    }
    uint64_t v19 = [v4 objectForKeyedSubscript:@"arrivalActualTime"];
    objc_opt_class();
    v53 = (void *)v19;
    if (objc_opt_isKindOfClass())
    {
      v20 = [[_SFPBDate alloc] initWithDictionary:v19];
      [(_SFPBFlightLeg *)v5 setArrivalActualTime:v20];
    }
    v21 = [v4 objectForKeyedSubscript:@"arrivalTerminal"];
    objc_opt_class();
    v52 = v21;
    if (objc_opt_isKindOfClass())
    {
      v22 = (void *)[v21 copy];
      [(_SFPBFlightLeg *)v5 setArrivalTerminal:v22];
    }
    v23 = [v4 objectForKeyedSubscript:@"arrivalGate"];
    objc_opt_class();
    v51 = v23;
    if (objc_opt_isKindOfClass())
    {
      v24 = (void *)[v23 copy];
      [(_SFPBFlightLeg *)v5 setArrivalGate:v24];
    }
    v47 = v11;
    uint64_t v25 = [v4 objectForKeyedSubscript:@"arrivalAirport"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v26 = [[_SFPBAirport alloc] initWithDictionary:v25];
      [(_SFPBFlightLeg *)v5 setArrivalAirport:v26];
    }
    v43 = (void *)v25;
    v27 = [v4 objectForKeyedSubscript:@"divertedAirport"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v28 = [[_SFPBAirport alloc] initWithDictionary:v27];
      [(_SFPBFlightLeg *)v5 setDivertedAirport:v28];
    }
    v45 = (void *)v15;
    v29 = [v4 objectForKeyedSubscript:@"title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v30 = (void *)[v29 copy];
      [(_SFPBFlightLeg *)v5 setTitle:v30];
    }
    v44 = (void *)v17;
    v46 = v13;
    v31 = [v4 objectForKeyedSubscript:@"baggageClaim"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v32 = (void *)[v31 copy];
      [(_SFPBFlightLeg *)v5 setBaggageClaim:v32];
    }
    v33 = [v4 objectForKeyedSubscript:@"departureGateClosedTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v34 = [[_SFPBDate alloc] initWithDictionary:v33];
      [(_SFPBFlightLeg *)v5 setDepartureGateClosedTime:v34];
    }
    v35 = [v4 objectForKeyedSubscript:@"departureRunwayTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v36 = [[_SFPBDate alloc] initWithDictionary:v35];
      [(_SFPBFlightLeg *)v5 setDepartureRunwayTime:v36];
    }
    v37 = [v4 objectForKeyedSubscript:@"arrivalRunwayTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v38 = [[_SFPBDate alloc] initWithDictionary:v37];
      [(_SFPBFlightLeg *)v5 setArrivalRunwayTime:v38];
    }
    v39 = [v4 objectForKeyedSubscript:@"arrivalGateTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v40 = [[_SFPBDate alloc] initWithDictionary:v39];
      [(_SFPBFlightLeg *)v5 setArrivalGateTime:v40];
    }
    v41 = v5;
  }
  return v5;
}

- (_SFPBFlightLeg)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBFlightLeg *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBFlightLeg *)self dictionaryRepresentation];
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
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_arrivalActualTime)
  {
    id v4 = [(_SFPBFlightLeg *)self arrivalActualTime];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"arrivalActualTime"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"arrivalActualTime"];
    }
  }
  if (self->_arrivalAirport)
  {
    uint64_t v7 = [(_SFPBFlightLeg *)self arrivalAirport];
    v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"arrivalAirport"];
    }
    else
    {
      uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"arrivalAirport"];
    }
  }
  if (self->_arrivalGate)
  {
    v10 = [(_SFPBFlightLeg *)self arrivalGate];
    v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"arrivalGate"];
  }
  if (self->_arrivalGateTime)
  {
    v12 = [(_SFPBFlightLeg *)self arrivalGateTime];
    v13 = [v12 dictionaryRepresentation];
    if (v13)
    {
      [v3 setObject:v13 forKeyedSubscript:@"arrivalGateTime"];
    }
    else
    {
      v14 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v14 forKeyedSubscript:@"arrivalGateTime"];
    }
  }
  if (self->_arrivalPublishedTime)
  {
    uint64_t v15 = [(_SFPBFlightLeg *)self arrivalPublishedTime];
    v16 = [v15 dictionaryRepresentation];
    if (v16)
    {
      [v3 setObject:v16 forKeyedSubscript:@"arrivalPublishedTime"];
    }
    else
    {
      uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v17 forKeyedSubscript:@"arrivalPublishedTime"];
    }
  }
  if (self->_arrivalRunwayTime)
  {
    v18 = [(_SFPBFlightLeg *)self arrivalRunwayTime];
    uint64_t v19 = [v18 dictionaryRepresentation];
    if (v19)
    {
      [v3 setObject:v19 forKeyedSubscript:@"arrivalRunwayTime"];
    }
    else
    {
      v20 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v20 forKeyedSubscript:@"arrivalRunwayTime"];
    }
  }
  if (self->_arrivalTerminal)
  {
    v21 = [(_SFPBFlightLeg *)self arrivalTerminal];
    v22 = (void *)[v21 copy];
    [v3 setObject:v22 forKeyedSubscript:@"arrivalTerminal"];
  }
  if (self->_baggageClaim)
  {
    v23 = [(_SFPBFlightLeg *)self baggageClaim];
    v24 = (void *)[v23 copy];
    [v3 setObject:v24 forKeyedSubscript:@"baggageClaim"];
  }
  if (self->_departureActualTime)
  {
    uint64_t v25 = [(_SFPBFlightLeg *)self departureActualTime];
    v26 = [v25 dictionaryRepresentation];
    if (v26)
    {
      [v3 setObject:v26 forKeyedSubscript:@"departureActualTime"];
    }
    else
    {
      v27 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v27 forKeyedSubscript:@"departureActualTime"];
    }
  }
  if (self->_departureAirport)
  {
    v28 = [(_SFPBFlightLeg *)self departureAirport];
    v29 = [v28 dictionaryRepresentation];
    if (v29)
    {
      [v3 setObject:v29 forKeyedSubscript:@"departureAirport"];
    }
    else
    {
      v30 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v30 forKeyedSubscript:@"departureAirport"];
    }
  }
  if (self->_departureGate)
  {
    v31 = [(_SFPBFlightLeg *)self departureGate];
    v32 = (void *)[v31 copy];
    [v3 setObject:v32 forKeyedSubscript:@"departureGate"];
  }
  if (self->_departureGateClosedTime)
  {
    v33 = [(_SFPBFlightLeg *)self departureGateClosedTime];
    v34 = [v33 dictionaryRepresentation];
    if (v34)
    {
      [v3 setObject:v34 forKeyedSubscript:@"departureGateClosedTime"];
    }
    else
    {
      v35 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v35 forKeyedSubscript:@"departureGateClosedTime"];
    }
  }
  if (self->_departurePublishedTime)
  {
    v36 = [(_SFPBFlightLeg *)self departurePublishedTime];
    v37 = [v36 dictionaryRepresentation];
    if (v37)
    {
      [v3 setObject:v37 forKeyedSubscript:@"departurePublishedTime"];
    }
    else
    {
      v38 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v38 forKeyedSubscript:@"departurePublishedTime"];
    }
  }
  if (self->_departureRunwayTime)
  {
    v39 = [(_SFPBFlightLeg *)self departureRunwayTime];
    v40 = [v39 dictionaryRepresentation];
    if (v40)
    {
      [v3 setObject:v40 forKeyedSubscript:@"departureRunwayTime"];
    }
    else
    {
      v41 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v41 forKeyedSubscript:@"departureRunwayTime"];
    }
  }
  if (self->_departureTerminal)
  {
    v42 = [(_SFPBFlightLeg *)self departureTerminal];
    v43 = (void *)[v42 copy];
    [v3 setObject:v43 forKeyedSubscript:@"departureTerminal"];
  }
  if (self->_divertedAirport)
  {
    v44 = [(_SFPBFlightLeg *)self divertedAirport];
    v45 = [v44 dictionaryRepresentation];
    if (v45)
    {
      [v3 setObject:v45 forKeyedSubscript:@"divertedAirport"];
    }
    else
    {
      v46 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v46 forKeyedSubscript:@"divertedAirport"];
    }
  }
  if (self->_status)
  {
    uint64_t v47 = [(_SFPBFlightLeg *)self status];
    if (v47 >= 0xA)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v47);
      v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v48 = off_1E5A2ED30[v47];
    }
    [v3 setObject:v48 forKeyedSubscript:@"status"];
  }
  if (self->_title)
  {
    v49 = [(_SFPBFlightLeg *)self title];
    v50 = (void *)[v49 copy];
    [v3 setObject:v50 forKeyedSubscript:@"title"];
  }
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = 2654435761 * self->_status;
  unint64_t v4 = [(_SFPBDate *)self->_departurePublishedTime hash];
  unint64_t v5 = v4 ^ [(_SFPBDate *)self->_departureActualTime hash];
  NSUInteger v6 = v5 ^ [(NSString *)self->_departureTerminal hash];
  NSUInteger v7 = v6 ^ [(NSString *)self->_departureGate hash];
  unint64_t v8 = v7 ^ [(_SFPBAirport *)self->_departureAirport hash] ^ v3;
  unint64_t v9 = [(_SFPBDate *)self->_arrivalPublishedTime hash];
  unint64_t v10 = v9 ^ [(_SFPBDate *)self->_arrivalActualTime hash];
  NSUInteger v11 = v10 ^ [(NSString *)self->_arrivalTerminal hash];
  NSUInteger v12 = v11 ^ [(NSString *)self->_arrivalGate hash];
  unint64_t v13 = v12 ^ [(_SFPBAirport *)self->_arrivalAirport hash];
  unint64_t v14 = v8 ^ v13 ^ [(_SFPBAirport *)self->_divertedAirport hash];
  NSUInteger v15 = [(NSString *)self->_title hash];
  NSUInteger v16 = v15 ^ [(NSString *)self->_baggageClaim hash];
  unint64_t v17 = v16 ^ [(_SFPBDate *)self->_departureGateClosedTime hash];
  unint64_t v18 = v17 ^ [(_SFPBDate *)self->_departureRunwayTime hash];
  unint64_t v19 = v18 ^ [(_SFPBDate *)self->_arrivalRunwayTime hash];
  return v14 ^ v19 ^ [(_SFPBDate *)self->_arrivalGateTime hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_88;
  }
  int status = self->_status;
  if (status != [v4 status]) {
    goto LABEL_88;
  }
  NSUInteger v6 = [(_SFPBFlightLeg *)self departurePublishedTime];
  NSUInteger v7 = [v4 departurePublishedTime];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_87;
  }
  uint64_t v8 = [(_SFPBFlightLeg *)self departurePublishedTime];
  if (v8)
  {
    unint64_t v9 = (void *)v8;
    unint64_t v10 = [(_SFPBFlightLeg *)self departurePublishedTime];
    NSUInteger v11 = [v4 departurePublishedTime];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_88;
    }
  }
  else
  {
  }
  NSUInteger v6 = [(_SFPBFlightLeg *)self departureActualTime];
  NSUInteger v7 = [v4 departureActualTime];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_87;
  }
  uint64_t v13 = [(_SFPBFlightLeg *)self departureActualTime];
  if (v13)
  {
    unint64_t v14 = (void *)v13;
    NSUInteger v15 = [(_SFPBFlightLeg *)self departureActualTime];
    NSUInteger v16 = [v4 departureActualTime];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_88;
    }
  }
  else
  {
  }
  NSUInteger v6 = [(_SFPBFlightLeg *)self departureTerminal];
  NSUInteger v7 = [v4 departureTerminal];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_87;
  }
  uint64_t v18 = [(_SFPBFlightLeg *)self departureTerminal];
  if (v18)
  {
    unint64_t v19 = (void *)v18;
    v20 = [(_SFPBFlightLeg *)self departureTerminal];
    v21 = [v4 departureTerminal];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_88;
    }
  }
  else
  {
  }
  NSUInteger v6 = [(_SFPBFlightLeg *)self departureGate];
  NSUInteger v7 = [v4 departureGate];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_87;
  }
  uint64_t v23 = [(_SFPBFlightLeg *)self departureGate];
  if (v23)
  {
    v24 = (void *)v23;
    uint64_t v25 = [(_SFPBFlightLeg *)self departureGate];
    v26 = [v4 departureGate];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_88;
    }
  }
  else
  {
  }
  NSUInteger v6 = [(_SFPBFlightLeg *)self departureAirport];
  NSUInteger v7 = [v4 departureAirport];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_87;
  }
  uint64_t v28 = [(_SFPBFlightLeg *)self departureAirport];
  if (v28)
  {
    v29 = (void *)v28;
    v30 = [(_SFPBFlightLeg *)self departureAirport];
    v31 = [v4 departureAirport];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_88;
    }
  }
  else
  {
  }
  NSUInteger v6 = [(_SFPBFlightLeg *)self arrivalPublishedTime];
  NSUInteger v7 = [v4 arrivalPublishedTime];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_87;
  }
  uint64_t v33 = [(_SFPBFlightLeg *)self arrivalPublishedTime];
  if (v33)
  {
    v34 = (void *)v33;
    v35 = [(_SFPBFlightLeg *)self arrivalPublishedTime];
    v36 = [v4 arrivalPublishedTime];
    int v37 = [v35 isEqual:v36];

    if (!v37) {
      goto LABEL_88;
    }
  }
  else
  {
  }
  NSUInteger v6 = [(_SFPBFlightLeg *)self arrivalActualTime];
  NSUInteger v7 = [v4 arrivalActualTime];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_87;
  }
  uint64_t v38 = [(_SFPBFlightLeg *)self arrivalActualTime];
  if (v38)
  {
    v39 = (void *)v38;
    v40 = [(_SFPBFlightLeg *)self arrivalActualTime];
    v41 = [v4 arrivalActualTime];
    int v42 = [v40 isEqual:v41];

    if (!v42) {
      goto LABEL_88;
    }
  }
  else
  {
  }
  NSUInteger v6 = [(_SFPBFlightLeg *)self arrivalTerminal];
  NSUInteger v7 = [v4 arrivalTerminal];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_87;
  }
  uint64_t v43 = [(_SFPBFlightLeg *)self arrivalTerminal];
  if (v43)
  {
    v44 = (void *)v43;
    v45 = [(_SFPBFlightLeg *)self arrivalTerminal];
    v46 = [v4 arrivalTerminal];
    int v47 = [v45 isEqual:v46];

    if (!v47) {
      goto LABEL_88;
    }
  }
  else
  {
  }
  NSUInteger v6 = [(_SFPBFlightLeg *)self arrivalGate];
  NSUInteger v7 = [v4 arrivalGate];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_87;
  }
  uint64_t v48 = [(_SFPBFlightLeg *)self arrivalGate];
  if (v48)
  {
    v49 = (void *)v48;
    v50 = [(_SFPBFlightLeg *)self arrivalGate];
    v51 = [v4 arrivalGate];
    int v52 = [v50 isEqual:v51];

    if (!v52) {
      goto LABEL_88;
    }
  }
  else
  {
  }
  NSUInteger v6 = [(_SFPBFlightLeg *)self arrivalAirport];
  NSUInteger v7 = [v4 arrivalAirport];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_87;
  }
  uint64_t v53 = [(_SFPBFlightLeg *)self arrivalAirport];
  if (v53)
  {
    objc_super v54 = (void *)v53;
    v55 = [(_SFPBFlightLeg *)self arrivalAirport];
    v56 = [v4 arrivalAirport];
    int v57 = [v55 isEqual:v56];

    if (!v57) {
      goto LABEL_88;
    }
  }
  else
  {
  }
  NSUInteger v6 = [(_SFPBFlightLeg *)self divertedAirport];
  NSUInteger v7 = [v4 divertedAirport];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_87;
  }
  uint64_t v58 = [(_SFPBFlightLeg *)self divertedAirport];
  if (v58)
  {
    v59 = (void *)v58;
    v60 = [(_SFPBFlightLeg *)self divertedAirport];
    v61 = [v4 divertedAirport];
    int v62 = [v60 isEqual:v61];

    if (!v62) {
      goto LABEL_88;
    }
  }
  else
  {
  }
  NSUInteger v6 = [(_SFPBFlightLeg *)self title];
  NSUInteger v7 = [v4 title];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_87;
  }
  uint64_t v63 = [(_SFPBFlightLeg *)self title];
  if (v63)
  {
    v64 = (void *)v63;
    v65 = [(_SFPBFlightLeg *)self title];
    v66 = [v4 title];
    int v67 = [v65 isEqual:v66];

    if (!v67) {
      goto LABEL_88;
    }
  }
  else
  {
  }
  NSUInteger v6 = [(_SFPBFlightLeg *)self baggageClaim];
  NSUInteger v7 = [v4 baggageClaim];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_87;
  }
  uint64_t v68 = [(_SFPBFlightLeg *)self baggageClaim];
  if (v68)
  {
    v69 = (void *)v68;
    v70 = [(_SFPBFlightLeg *)self baggageClaim];
    v71 = [v4 baggageClaim];
    int v72 = [v70 isEqual:v71];

    if (!v72) {
      goto LABEL_88;
    }
  }
  else
  {
  }
  NSUInteger v6 = [(_SFPBFlightLeg *)self departureGateClosedTime];
  NSUInteger v7 = [v4 departureGateClosedTime];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_87;
  }
  uint64_t v73 = [(_SFPBFlightLeg *)self departureGateClosedTime];
  if (v73)
  {
    v74 = (void *)v73;
    v75 = [(_SFPBFlightLeg *)self departureGateClosedTime];
    v76 = [v4 departureGateClosedTime];
    int v77 = [v75 isEqual:v76];

    if (!v77) {
      goto LABEL_88;
    }
  }
  else
  {
  }
  NSUInteger v6 = [(_SFPBFlightLeg *)self departureRunwayTime];
  NSUInteger v7 = [v4 departureRunwayTime];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_87;
  }
  uint64_t v78 = [(_SFPBFlightLeg *)self departureRunwayTime];
  if (v78)
  {
    v79 = (void *)v78;
    v80 = [(_SFPBFlightLeg *)self departureRunwayTime];
    v81 = [v4 departureRunwayTime];
    int v82 = [v80 isEqual:v81];

    if (!v82) {
      goto LABEL_88;
    }
  }
  else
  {
  }
  NSUInteger v6 = [(_SFPBFlightLeg *)self arrivalRunwayTime];
  NSUInteger v7 = [v4 arrivalRunwayTime];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_87;
  }
  uint64_t v83 = [(_SFPBFlightLeg *)self arrivalRunwayTime];
  if (v83)
  {
    v84 = (void *)v83;
    v85 = [(_SFPBFlightLeg *)self arrivalRunwayTime];
    v86 = [v4 arrivalRunwayTime];
    int v87 = [v85 isEqual:v86];

    if (!v87) {
      goto LABEL_88;
    }
  }
  else
  {
  }
  NSUInteger v6 = [(_SFPBFlightLeg *)self arrivalGateTime];
  NSUInteger v7 = [v4 arrivalGateTime];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v88 = [(_SFPBFlightLeg *)self arrivalGateTime];
    if (!v88)
    {

LABEL_91:
      BOOL v93 = 1;
      goto LABEL_89;
    }
    v89 = (void *)v88;
    v90 = [(_SFPBFlightLeg *)self arrivalGateTime];
    v91 = [v4 arrivalGateTime];
    char v92 = [v90 isEqual:v91];

    if (v92) {
      goto LABEL_91;
    }
  }
  else
  {
LABEL_87:
  }
LABEL_88:
  BOOL v93 = 0;
LABEL_89:

  return v93;
}

- (void)writeTo:(id)a3
{
  id v21 = a3;
  if ([(_SFPBFlightLeg *)self status]) {
    PBDataWriterWriteInt32Field();
  }
  id v4 = [(_SFPBFlightLeg *)self departurePublishedTime];
  if (v4) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v5 = [(_SFPBFlightLeg *)self departureActualTime];
  if (v5) {
    PBDataWriterWriteSubmessage();
  }

  NSUInteger v6 = [(_SFPBFlightLeg *)self departureTerminal];
  if (v6) {
    PBDataWriterWriteStringField();
  }

  NSUInteger v7 = [(_SFPBFlightLeg *)self departureGate];
  if (v7) {
    PBDataWriterWriteStringField();
  }

  uint64_t v8 = [(_SFPBFlightLeg *)self departureAirport];
  if (v8) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v9 = [(_SFPBFlightLeg *)self arrivalPublishedTime];
  if (v9) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v10 = [(_SFPBFlightLeg *)self arrivalActualTime];
  if (v10) {
    PBDataWriterWriteSubmessage();
  }

  NSUInteger v11 = [(_SFPBFlightLeg *)self arrivalTerminal];
  if (v11) {
    PBDataWriterWriteStringField();
  }

  int v12 = [(_SFPBFlightLeg *)self arrivalGate];
  if (v12) {
    PBDataWriterWriteStringField();
  }

  uint64_t v13 = [(_SFPBFlightLeg *)self arrivalAirport];
  if (v13) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v14 = [(_SFPBFlightLeg *)self divertedAirport];
  if (v14) {
    PBDataWriterWriteSubmessage();
  }

  NSUInteger v15 = [(_SFPBFlightLeg *)self title];
  if (v15) {
    PBDataWriterWriteStringField();
  }

  NSUInteger v16 = [(_SFPBFlightLeg *)self baggageClaim];
  if (v16) {
    PBDataWriterWriteStringField();
  }

  int v17 = [(_SFPBFlightLeg *)self departureGateClosedTime];
  if (v17) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v18 = [(_SFPBFlightLeg *)self departureRunwayTime];
  if (v18) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v19 = [(_SFPBFlightLeg *)self arrivalRunwayTime];
  if (v19) {
    PBDataWriterWriteSubmessage();
  }

  v20 = [(_SFPBFlightLeg *)self arrivalGateTime];
  if (v20) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBFlightLegReadFrom(self, (uint64_t)a3);
}

- (void)setArrivalGateTime:(id)a3
{
}

- (void)setArrivalRunwayTime:(id)a3
{
}

- (void)setDepartureRunwayTime:(id)a3
{
}

- (void)setDepartureGateClosedTime:(id)a3
{
}

- (void)setBaggageClaim:(id)a3
{
  self->_baggageClaim = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setTitle:(id)a3
{
  self->_title = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setDivertedAirport:(id)a3
{
}

- (void)setArrivalAirport:(id)a3
{
}

- (void)setArrivalGate:(id)a3
{
  self->_arrivalGate = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setArrivalTerminal:(id)a3
{
  self->_arrivalTerminal = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setArrivalActualTime:(id)a3
{
}

- (void)setArrivalPublishedTime:(id)a3
{
}

- (void)setDepartureAirport:(id)a3
{
}

- (void)setDepartureGate:(id)a3
{
  self->_departureGate = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setDepartureTerminal:(id)a3
{
  self->_departureTerminal = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setDepartureActualTime:(id)a3
{
}

- (void)setDeparturePublishedTime:(id)a3
{
}

- (void)setStatus:(int)a3
{
  self->_int status = a3;
}

@end