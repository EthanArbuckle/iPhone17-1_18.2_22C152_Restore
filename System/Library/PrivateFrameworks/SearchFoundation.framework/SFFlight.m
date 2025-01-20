@interface SFFlight
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)legs;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)carrierCode;
- (NSString)carrierName;
- (NSString)carrierPhoneNumber;
- (NSString)carrierWebsite;
- (NSString)flightID;
- (NSString)flightNumber;
- (NSString)operatorCarrierCode;
- (NSString)operatorFlightNumber;
- (SFFlight)initWithCoder:(id)a3;
- (SFFlight)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCarrierCode:(id)a3;
- (void)setCarrierName:(id)a3;
- (void)setCarrierPhoneNumber:(id)a3;
- (void)setCarrierWebsite:(id)a3;
- (void)setFlightID:(id)a3;
- (void)setFlightNumber:(id)a3;
- (void)setLegs:(id)a3;
- (void)setOperatorCarrierCode:(id)a3;
- (void)setOperatorFlightNumber:(id)a3;
@end

@implementation SFFlight

+ (BOOL)supportsSecureCoding
{
  return 1;
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

- (void)setCarrierWebsite:(id)a3
{
}

- (NSString)carrierWebsite
{
  return self->_carrierWebsite;
}

- (void)setCarrierPhoneNumber:(id)a3
{
}

- (NSString)carrierPhoneNumber
{
  return self->_carrierPhoneNumber;
}

- (void)setOperatorFlightNumber:(id)a3
{
}

- (NSString)operatorFlightNumber
{
  return self->_operatorFlightNumber;
}

- (void)setOperatorCarrierCode:(id)a3
{
}

- (NSString)operatorCarrierCode
{
  return self->_operatorCarrierCode;
}

- (void)setLegs:(id)a3
{
}

- (NSArray)legs
{
  return self->_legs;
}

- (void)setFlightNumber:(id)a3
{
}

- (NSString)flightNumber
{
  return self->_flightNumber;
}

- (void)setCarrierName:(id)a3
{
}

- (NSString)carrierName
{
  return self->_carrierName;
}

- (void)setCarrierCode:(id)a3
{
}

- (NSString)carrierCode
{
  return self->_carrierCode;
}

- (void)setFlightID:(id)a3
{
}

- (NSString)flightID
{
  return self->_flightID;
}

- (unint64_t)hash
{
  v21 = [(SFFlight *)self flightID];
  uint64_t v3 = [v21 hash];
  v4 = [(SFFlight *)self carrierCode];
  uint64_t v5 = [v4 hash] ^ v3;
  v6 = [(SFFlight *)self carrierName];
  uint64_t v7 = [v6 hash];
  v8 = [(SFFlight *)self flightNumber];
  uint64_t v9 = v5 ^ v7 ^ [v8 hash];
  v10 = [(SFFlight *)self legs];
  uint64_t v11 = [v10 hash];
  v12 = [(SFFlight *)self operatorCarrierCode];
  uint64_t v13 = v11 ^ [v12 hash];
  v14 = [(SFFlight *)self operatorFlightNumber];
  uint64_t v15 = v9 ^ v13 ^ [v14 hash];
  v16 = [(SFFlight *)self carrierPhoneNumber];
  uint64_t v17 = [v16 hash];
  v18 = [(SFFlight *)self carrierWebsite];
  unint64_t v19 = v15 ^ v17 ^ [v18 hash];

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SFFlight *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    if ([(SFFlight *)v4 isMemberOfClass:objc_opt_class()])
    {
      uint64_t v5 = v4;
      v6 = [(SFFlight *)self flightID];
      uint64_t v7 = [(SFFlight *)v5 flightID];
      if ((v6 == 0) == (v7 != 0))
      {
        char v11 = 0;
LABEL_50:

        goto LABEL_51;
      }
      v8 = [(SFFlight *)self flightID];
      if (v8)
      {
        uint64_t v9 = [(SFFlight *)self flightID];
        v10 = [(SFFlight *)v5 flightID];
        if (![v9 isEqual:v10])
        {
          char v11 = 0;
LABEL_48:

          goto LABEL_49;
        }
        v79 = v10;
        v80 = v9;
      }
      v12 = [(SFFlight *)self carrierCode];
      uint64_t v13 = [(SFFlight *)v5 carrierCode];
      if ((v12 == 0) == (v13 != 0)) {
        goto LABEL_46;
      }
      v14 = [(SFFlight *)self carrierCode];
      if (v14)
      {
        uint64_t v15 = [(SFFlight *)self carrierCode];
        v76 = [(SFFlight *)v5 carrierCode];
        v77 = v15;
        if (![v15 isEqual:v76])
        {
LABEL_44:

LABEL_45:
          goto LABEL_46;
        }
      }
      v78 = v14;
      v16 = [(SFFlight *)self carrierName];
      uint64_t v17 = [(SFFlight *)v5 carrierName];
      if ((v16 == 0) == (v17 != 0))
      {

        if (!v14)
        {
LABEL_46:

          char v11 = 0;
          if (!v8)
          {
LABEL_49:

            goto LABEL_50;
          }
          goto LABEL_47;
        }
        goto LABEL_44;
      }
      v73 = v16;
      v74 = v17;
      v75 = [(SFFlight *)self carrierName];
      if (v75)
      {
        v18 = [(SFFlight *)self carrierName];
        [(SFFlight *)v5 carrierName];
        v72 = v71 = v18;
        if (![v18 isEqual:v72])
        {
LABEL_42:

LABEL_43:
          if (!v14) {
            goto LABEL_46;
          }
          goto LABEL_44;
        }
      }
      unint64_t v19 = [(SFFlight *)self flightNumber];
      uint64_t v20 = v19 == 0;
      v21 = [(SFFlight *)v5 flightNumber];
      if (v20 == (v21 != 0))
      {

        goto LABEL_41;
      }
      v69 = v21;
      v70 = v19;
      v22 = [(SFFlight *)self flightNumber];
      if (v22)
      {
        uint64_t v20 = [(SFFlight *)self flightNumber];
        v67 = [(SFFlight *)v5 flightNumber];
        if (!objc_msgSend((id)v20, "isEqual:")) {
          goto LABEL_39;
        }
      }
      v68 = v22;
      v66 = (void *)v20;
      v23 = [(SFFlight *)self legs];
      v24 = [(SFFlight *)v5 legs];
      if ((v23 == 0) == (v24 != 0))
      {

        goto LABEL_38;
      }
      v64 = v23;
      v65 = v24;
      v25 = [(SFFlight *)self legs];
      if (v25)
      {
        v23 = [(SFFlight *)self legs];
        v62 = [(SFFlight *)v5 legs];
        if (!objc_msgSend(v23, "isEqual:"))
        {
LABEL_36:

LABEL_37:
LABEL_38:
          uint64_t v20 = (uint64_t)v66;
          v22 = v68;
          if (!v68)
          {
LABEL_40:

LABEL_41:
            v14 = v78;
            if (!v75) {
              goto LABEL_43;
            }
            goto LABEL_42;
          }
LABEL_39:

          goto LABEL_40;
        }
      }
      v61 = v23;
      v63 = v25;
      v26 = [(SFFlight *)self operatorCarrierCode];
      v27 = [(SFFlight *)v5 operatorCarrierCode];
      if ((v26 == 0) == (v27 != 0))
      {

        v23 = v61;
        if (!v25) {
          goto LABEL_37;
        }
        goto LABEL_36;
      }
      v58 = v27;
      v59 = v26;
      v60 = [(SFFlight *)self operatorCarrierCode];
      if (v60)
      {
        v28 = [(SFFlight *)self operatorCarrierCode];
        v56 = [(SFFlight *)v5 operatorCarrierCode];
        v57 = v28;
        if (![v28 isEqual:v56]) {
          goto LABEL_58;
        }
      }
      v30 = [(SFFlight *)self operatorFlightNumber];
      v31 = [(SFFlight *)v5 operatorFlightNumber];
      if ((v30 == 0) == (v31 != 0))
      {

        if (!v60)
        {
          v35 = v68;
LABEL_59:

          if (v25)
          {
          }
          v14 = v78;
          if (v35)
          {
          }
          if (v75)
          {
          }
          if (!v78) {
            goto LABEL_45;
          }
          goto LABEL_44;
        }
LABEL_58:
        v35 = v68;

        goto LABEL_59;
      }
      v54 = v30;
      v55 = v31;
      v32 = [(SFFlight *)self operatorFlightNumber];
      if (v32)
      {
        v33 = [(SFFlight *)self operatorFlightNumber];
        v51 = [(SFFlight *)v5 operatorFlightNumber];
        v52 = v33;
        if (!objc_msgSend(v33, "isEqual:"))
        {
          char v11 = 0;
          v34 = v63;
LABEL_82:

LABEL_83:
          if (v60)
          {
          }
          v41 = v34;
          if (v34)
          {
            v42 = v72;
          }
          else
          {
            v42 = v72;
          }

          if (v68)
          {
          }
          if (v75)
          {
          }
          if (v78)
          {
          }
          if (!v8) {
            goto LABEL_49;
          }
LABEL_47:
          v10 = v79;
          uint64_t v9 = v80;
          goto LABEL_48;
        }
      }
      v53 = [(SFFlight *)self carrierPhoneNumber];
      v36 = [(SFFlight *)v5 carrierPhoneNumber];
      if ((v53 == 0) == (v36 != 0))
      {

        char v11 = 0;
        goto LABEL_81;
      }
      v49 = v36;
      uint64_t v50 = [(SFFlight *)self carrierPhoneNumber];
      if (!v50
        || ([(SFFlight *)self carrierPhoneNumber],
            v37 = objc_claimAutoreleasedReturnValue(),
            [(SFFlight *)v5 carrierPhoneNumber],
            v47 = objc_claimAutoreleasedReturnValue(),
            v48 = v37,
            objc_msgSend(v37, "isEqual:")))
      {
        v46 = [(SFFlight *)self carrierWebsite];
        v45 = [(SFFlight *)v5 carrierWebsite];
        if ((v46 == 0) == (v45 != 0))
        {

          char v11 = 0;
        }
        else
        {
          uint64_t v39 = [(SFFlight *)self carrierWebsite];
          if (v39)
          {
            v40 = (void *)v39;
            v44 = [(SFFlight *)self carrierWebsite];
            v43 = [(SFFlight *)v5 carrierWebsite];
            char v11 = [v44 isEqual:v43];
          }
          else
          {

            char v11 = 1;
          }
        }
        v38 = (void *)v50;
        if (!v50) {
          goto LABEL_80;
        }
      }
      else
      {
        char v11 = 0;
        v38 = (void *)v50;
      }

LABEL_80:
LABEL_81:
      v34 = v63;
      if (!v32) {
        goto LABEL_83;
      }
      goto LABEL_82;
    }
    char v11 = 0;
  }
LABEL_51:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(SFFlight *)self flightID];
  v6 = (void *)[v5 copy];
  [v4 setFlightID:v6];

  uint64_t v7 = [(SFFlight *)self carrierCode];
  v8 = (void *)[v7 copy];
  [v4 setCarrierCode:v8];

  uint64_t v9 = [(SFFlight *)self carrierName];
  v10 = (void *)[v9 copy];
  [v4 setCarrierName:v10];

  char v11 = [(SFFlight *)self flightNumber];
  v12 = (void *)[v11 copy];
  [v4 setFlightNumber:v12];

  uint64_t v13 = [(SFFlight *)self legs];
  v14 = (void *)[v13 copy];
  [v4 setLegs:v14];

  uint64_t v15 = [(SFFlight *)self operatorCarrierCode];
  v16 = (void *)[v15 copy];
  [v4 setOperatorCarrierCode:v16];

  uint64_t v17 = [(SFFlight *)self operatorFlightNumber];
  v18 = (void *)[v17 copy];
  [v4 setOperatorFlightNumber:v18];

  unint64_t v19 = [(SFFlight *)self carrierPhoneNumber];
  uint64_t v20 = (void *)[v19 copy];
  [v4 setCarrierPhoneNumber:v20];

  v21 = [(SFFlight *)self carrierWebsite];
  v22 = (void *)[v21 copy];
  [v4 setCarrierWebsite:v22];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBFlight alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBFlight *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBFlight alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBFlight *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6 = [[_SFPBFlight alloc] initWithFacade:self];
  uint64_t v5 = [(_SFPBFlight *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFFlight)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  v6 = [[_SFPBFlight alloc] initWithData:v5];
  uint64_t v7 = [(SFFlight *)self initWithProtobuf:v6];

  return v7;
}

- (SFFlight)initWithProtobuf:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)SFFlight;
  uint64_t v5 = [(SFFlight *)&v36 init];
  if (v5)
  {
    v6 = [v4 flightID];

    if (v6)
    {
      uint64_t v7 = [v4 flightID];
      [(SFFlight *)v5 setFlightID:v7];
    }
    v8 = [v4 carrierCode];

    if (v8)
    {
      uint64_t v9 = [v4 carrierCode];
      [(SFFlight *)v5 setCarrierCode:v9];
    }
    v10 = [v4 carrierName];

    if (v10)
    {
      char v11 = [v4 carrierName];
      [(SFFlight *)v5 setCarrierName:v11];
    }
    v12 = [v4 flightNumber];

    if (v12)
    {
      uint64_t v13 = [v4 flightNumber];
      [(SFFlight *)v5 setFlightNumber:v13];
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
    uint64_t v17 = [v16 countByEnumeratingWithState:&v32 objects:v37 count:16];
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
          v21 = [[SFFlightLeg alloc] initWithProtobuf:*(void *)(*((void *)&v32 + 1) + 8 * i)];
          if (v21) {
            [v15 addObject:v21];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v18);
    }

    [(SFFlight *)v5 setLegs:v15];
    v22 = [v4 operatorCarrierCode];

    if (v22)
    {
      v23 = [v4 operatorCarrierCode];
      [(SFFlight *)v5 setOperatorCarrierCode:v23];
    }
    v24 = [v4 operatorFlightNumber];

    if (v24)
    {
      v25 = [v4 operatorFlightNumber];
      [(SFFlight *)v5 setOperatorFlightNumber:v25];
    }
    v26 = [v4 carrierPhoneNumber];

    if (v26)
    {
      v27 = [v4 carrierPhoneNumber];
      [(SFFlight *)v5 setCarrierPhoneNumber:v27];
    }
    v28 = [v4 carrierWebsite];

    if (v28)
    {
      v29 = [v4 carrierWebsite];
      [(SFFlight *)v5 setCarrierWebsite:v29];
    }
    v30 = v5;
  }
  return v5;
}

@end