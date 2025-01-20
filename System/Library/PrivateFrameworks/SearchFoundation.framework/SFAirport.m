@interface SFAirport
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)city;
- (NSString)code;
- (NSString)country;
- (NSString)countryCode;
- (NSString)district;
- (NSString)name;
- (NSString)postalCode;
- (NSString)state;
- (NSString)street;
- (NSTimeZone)timezone;
- (SFAirport)initWithCoder:(id)a3;
- (SFAirport)initWithProtobuf:(id)a3;
- (SFLatLng)location;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCity:(id)a3;
- (void)setCode:(id)a3;
- (void)setCountry:(id)a3;
- (void)setCountryCode:(id)a3;
- (void)setDistrict:(id)a3;
- (void)setLocation:(id)a3;
- (void)setName:(id)a3;
- (void)setPostalCode:(id)a3;
- (void)setState:(id)a3;
- (void)setStreet:(id)a3;
- (void)setTimezone:(id)a3;
@end

@implementation SFAirport

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_postalCode, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_district, 0);
  objc_storeStrong((id *)&self->_street, 0);
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_timezone, 0);
  objc_storeStrong((id *)&self->_code, 0);
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setCountry:(id)a3
{
}

- (NSString)country
{
  return self->_country;
}

- (void)setCountryCode:(id)a3
{
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setPostalCode:(id)a3
{
}

- (NSString)postalCode
{
  return self->_postalCode;
}

- (void)setState:(id)a3
{
}

- (NSString)state
{
  return self->_state;
}

- (void)setDistrict:(id)a3
{
}

- (NSString)district
{
  return self->_district;
}

- (void)setStreet:(id)a3
{
}

- (NSString)street
{
  return self->_street;
}

- (void)setCity:(id)a3
{
}

- (NSString)city
{
  return self->_city;
}

- (void)setLocation:(id)a3
{
}

- (SFLatLng)location
{
  return self->_location;
}

- (void)setTimezone:(id)a3
{
}

- (NSTimeZone)timezone
{
  return self->_timezone;
}

- (void)setCode:(id)a3
{
}

- (NSString)code
{
  return self->_code;
}

- (unint64_t)hash
{
  v25 = [(SFAirport *)self code];
  uint64_t v3 = [v25 hash];
  v24 = [(SFAirport *)self timezone];
  uint64_t v4 = [v24 hash] ^ v3;
  v23 = [(SFAirport *)self location];
  uint64_t v5 = [v23 hash];
  v6 = [(SFAirport *)self city];
  uint64_t v7 = v4 ^ v5 ^ [v6 hash];
  v8 = [(SFAirport *)self street];
  uint64_t v9 = [v8 hash];
  v10 = [(SFAirport *)self district];
  uint64_t v11 = v9 ^ [v10 hash];
  v12 = [(SFAirport *)self state];
  uint64_t v13 = v7 ^ v11 ^ [v12 hash];
  v14 = [(SFAirport *)self postalCode];
  uint64_t v15 = [v14 hash];
  v16 = [(SFAirport *)self countryCode];
  uint64_t v17 = v15 ^ [v16 hash];
  v18 = [(SFAirport *)self country];
  uint64_t v19 = v17 ^ [v18 hash];
  v20 = [(SFAirport *)self name];
  unint64_t v21 = v13 ^ v19 ^ [v20 hash];

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SFAirport *)a3;
  if (self == v4)
  {
    char v18 = 1;
    goto LABEL_78;
  }
  if (![(SFAirport *)v4 isMemberOfClass:objc_opt_class()])
  {
    char v18 = 0;
    goto LABEL_78;
  }
  uint64_t v5 = v4;
  v6 = [(SFAirport *)self code];
  uint64_t v7 = [(SFAirport *)v5 code];
  id v103 = v7;
  id v104 = v6;
  int v101 = v7 != 0;
  int v102 = v6 == 0;
  if (v102 == v101)
  {
    memset(v100, 0, sizeof(v100));
    long long v99 = 0uLL;
    memset(v105, 0, sizeof(v105));
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    char v18 = 0;
    goto LABEL_15;
  }
  uint64_t v8 = [(SFAirport *)self code];
  BOOL v9 = v8 != 0;
  v98 = (void *)v8;
  if (v8)
  {
    v10 = [(SFAirport *)self code];
    v94 = [(SFAirport *)v5 code];
    v95 = v10;
    if (!objc_msgSend(v10, "isEqual:"))
    {
      memset(v100, 0, 44);
      memset(v105, 0, sizeof(v105));
      long long v99 = 0uLL;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      HIDWORD(v100[5]) = 1;
      goto LABEL_15;
    }
  }
  v97 = [(SFAirport *)self timezone];
  v96 = [(SFAirport *)v5 timezone];
  HIDWORD(v100[5]) = v9;
  if ((v97 == 0) == (v96 != 0))
  {
    long long v99 = 0uLL;
    memset(v100, 0, 36);
    memset(v105, 0, sizeof(v105));
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    char v18 = 0;
    *(void *)((char *)&v100[4] + 4) = 1;
    goto LABEL_15;
  }
  uint64_t v19 = [(SFAirport *)self timezone];
  HIDWORD(v105[3]) = v19 != 0;
  v93 = (void *)v19;
  if (v19)
  {
    v20 = [(SFAirport *)self timezone];
    v89 = [(SFAirport *)v5 timezone];
    v90 = v20;
    if (!objc_msgSend(v20, "isEqual:"))
    {
      memset(v100, 0, 32);
      long long v99 = 0uLL;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      memset(v105, 0, 28);
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      LODWORD(v100[5]) = 0;
      v100[4] = 0x100000001;
      HIDWORD(v105[3]) = 1;
      goto LABEL_15;
    }
  }
  v92 = [(SFAirport *)self location];
  v91 = [(SFAirport *)v5 location];
  if ((v92 == 0) == (v91 != 0))
  {
    memset(v100, 0, 24);
    long long v99 = 0uLL;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    memset(v105, 0, 28);
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    char v18 = 0;
    LODWORD(v100[5]) = 0;
    v100[4] = 0x100000001;
    v100[3] = 1;
    goto LABEL_15;
  }
  v88 = [(SFAirport *)self location];
  LODWORD(v105[3]) = v88 != 0;
  if (v88)
  {
    v29 = [(SFAirport *)self location];
    v84 = [(SFAirport *)v5 location];
    v85 = v29;
    if (!objc_msgSend(v29, "isEqual:"))
    {
      memset(v100, 0, 24);
      long long v99 = 0uLL;
      int v11 = 0;
      int v12 = 0;
      memset(v105, 0, 24);
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      LODWORD(v100[5]) = 0;
      v100[4] = 0x100000001;
      v100[3] = 0x100000001;
      LODWORD(v105[3]) = 1;
      goto LABEL_15;
    }
  }
  v87 = [(SFAirport *)self city];
  v86 = [(SFAirport *)v5 city];
  if ((v87 == 0) == (v86 != 0))
  {
    v100[0] = 0;
    v100[1] = 0;
    long long v99 = 0uLL;
    int v11 = 0;
    int v12 = 0;
    memset(v105, 0, 24);
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    char v18 = 0;
    LODWORD(v100[5]) = 0;
    v100[4] = 0x100000001;
    v100[3] = 0x100000001;
    v100[2] = 1;
    goto LABEL_15;
  }
  uint64_t v30 = [(SFAirport *)self city];
  HIDWORD(v105[2]) = v30 != 0;
  v83 = (void *)v30;
  if (v30)
  {
    v31 = [(SFAirport *)self city];
    v79 = [(SFAirport *)v5 city];
    v80 = v31;
    if (!objc_msgSend(v31, "isEqual:"))
    {
      v100[0] = 0;
      v100[1] = 0;
      long long v99 = 0uLL;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      memset(v105, 0, 20);
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      LODWORD(v100[5]) = 0;
      v100[4] = 0x100000001;
      v100[3] = 0x100000001;
      v100[2] = 0x100000001;
      HIDWORD(v105[2]) = 1;
      goto LABEL_15;
    }
  }
  uint64_t v32 = [(SFAirport *)self street];
  v81 = [(SFAirport *)v5 street];
  v82 = (void *)v32;
  if ((v32 == 0) == (v81 != 0))
  {
    v100[0] = 0;
    long long v99 = 0uLL;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    memset(v105, 0, 20);
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    char v18 = 0;
    LODWORD(v100[5]) = 0;
    v100[4] = 0x100000001;
    v100[3] = 0x100000001;
    v100[2] = 0x100000001;
    v100[1] = 1;
    goto LABEL_15;
  }
  uint64_t v33 = [(SFAirport *)self street];
  BOOL v34 = v33 != 0;
  v78 = (void *)v33;
  if (v33)
  {
    v35 = [(SFAirport *)self street];
    v74 = [(SFAirport *)v5 street];
    v75 = v35;
    if (!objc_msgSend(v35, "isEqual:"))
    {
      v100[0] = 0;
      long long v99 = 0uLL;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      memset(v105, 0, 20);
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      v100[4] = 0x100000001;
      v100[3] = 0x100000001;
      v100[2] = 0x100000001;
      v100[1] = 0x100000001;
      LODWORD(v100[5]) = 1;
      goto LABEL_15;
    }
    LODWORD(v100[5]) = v34;
  }
  else
  {
    LODWORD(v100[5]) = 0;
  }
  uint64_t v36 = [(SFAirport *)self district];
  v76 = [(SFAirport *)v5 district];
  v77 = (void *)v36;
  if ((v36 == 0) == (v76 != 0))
  {
    v100[0] = 0;
    *(void *)((char *)&v99 + 4) = 0;
    LODWORD(v99) = 0;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    memset(v105, 0, 20);
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    char v18 = 0;
    v100[4] = 0x100000001;
    v100[3] = 0x100000001;
    v100[2] = 0x100000001;
    v100[1] = 0x100000001;
    HIDWORD(v99) = 1;
    goto LABEL_15;
  }
  v73 = [(SFAirport *)self district];
  LODWORD(v105[2]) = v73 != 0;
  if (v73)
  {
    v37 = [(SFAirport *)self district];
    v69 = [(SFAirport *)v5 district];
    v70 = v37;
    if (!objc_msgSend(v37, "isEqual:"))
    {
      *(void *)((char *)&v99 + 4) = 0;
      v100[0] = 0x100000000;
      v105[0] = 0;
      v105[1] = 0;
      LODWORD(v99) = 0;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      v100[4] = 0x100000001;
      v100[3] = 0x100000001;
      v100[2] = 0x100000001;
      v100[1] = 0x100000001;
      HIDWORD(v99) = 1;
      LODWORD(v105[2]) = 1;
      goto LABEL_15;
    }
  }
  v72 = [(SFAirport *)self state];
  v71 = [(SFAirport *)v5 state];
  if ((v72 == 0) == (v71 != 0))
  {
    v100[0] = 0x100000000;
    v105[0] = 0;
    v105[1] = 0;
    *(void *)&long long v99 = 0;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    char v18 = 0;
    v100[4] = 0x100000001;
    v100[3] = 0x100000001;
    v100[2] = 0x100000001;
    v100[1] = 0x100000001;
    *((void *)&v99 + 1) = 0x100000001;
    goto LABEL_15;
  }
  v68 = [(SFAirport *)self state];
  HIDWORD(v105[1]) = v68 != 0;
  if (v68)
  {
    v38 = [(SFAirport *)self state];
    v64 = [(SFAirport *)v5 state];
    v65 = v38;
    if (!objc_msgSend(v38, "isEqual:"))
    {
      *(void *)&long long v99 = 0;
      int v11 = 0;
      *(void *)((char *)v105 + 4) = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      LODWORD(v105[0]) = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      v100[4] = 0x100000001;
      v100[3] = 0x100000001;
      v100[2] = 0x100000001;
      v100[1] = 0x100000001;
      *((void *)&v99 + 1) = 0x100000001;
      v100[0] = 0x100000001;
      HIDWORD(v105[1]) = 1;
      goto LABEL_15;
    }
  }
  v67 = [(SFAirport *)self postalCode];
  v66 = [(SFAirport *)v5 postalCode];
  if ((v67 == 0) == (v66 != 0))
  {
    int v11 = 0;
    *(void *)((char *)v105 + 4) = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    LODWORD(v105[0]) = 0;
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    char v18 = 0;
    v100[4] = 0x100000001;
    v100[3] = 0x100000001;
    v100[2] = 0x100000001;
    v100[1] = 0x100000001;
    HIDWORD(v99) = 1;
    v100[0] = 0x100000001;
    *(void *)((char *)&v99 + 4) = 0x100000000;
    LODWORD(v99) = 1;
    goto LABEL_15;
  }
  uint64_t v39 = [(SFAirport *)self postalCode];
  LODWORD(v105[1]) = v39 != 0;
  v63 = (void *)v39;
  v46 = v5;
  if (!v39
    || ([(SFAirport *)self postalCode],
        v40 = objc_claimAutoreleasedReturnValue(),
        [(SFAirport *)v5 postalCode],
        v59 = objc_claimAutoreleasedReturnValue(),
        v60 = v40,
        objc_msgSend(v40, "isEqual:")))
  {
    v62 = [(SFAirport *)self countryCode];
    v61 = [(SFAirport *)v5 countryCode];
    if ((v62 == 0) == (v61 != 0))
    {
      int v12 = 0;
      v105[0] = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      v100[4] = 0x100000001;
      v100[3] = 0x100000001;
      v100[2] = 0x100000001;
      v100[1] = 0x100000001;
      *((void *)&v99 + 1) = 0x100000001;
      v100[0] = 0x100000001;
      int v11 = 1;
      *(void *)&long long v99 = 0x100000001;
    }
    else
    {
      uint64_t v41 = [(SFAirport *)self countryCode];
      HIDWORD(v105[0]) = v41 != 0;
      v58 = (void *)v41;
      if (!v41
        || ([(SFAirport *)self countryCode],
            v42 = objc_claimAutoreleasedReturnValue(),
            [(SFAirport *)v46 countryCode],
            v54 = objc_claimAutoreleasedReturnValue(),
            v55 = v42,
            objc_msgSend(v42, "isEqual:")))
      {
        v57 = [(SFAirport *)self country];
        v56 = [(SFAirport *)v46 country];
        if ((v57 == 0) == (v56 != 0))
        {
          int v14 = 0;
          LODWORD(v105[0]) = 0;
          int v15 = 0;
          int v16 = 0;
          int v17 = 0;
          char v18 = 0;
          v100[4] = 0x100000001;
          v100[3] = 0x100000001;
          v100[2] = 0x100000001;
          v100[1] = 0x100000001;
          *((void *)&v99 + 1) = 0x100000001;
          v100[0] = 0x100000001;
          *(void *)&long long v99 = 0x100000001;
          int v11 = 1;
          int v12 = 1;
          int v13 = 1;
        }
        else
        {
          uint64_t v43 = [(SFAirport *)self country];
          LODWORD(v105[0]) = v43 != 0;
          v53 = (void *)v43;
          if (!v43
            || ([(SFAirport *)self country],
                v44 = objc_claimAutoreleasedReturnValue(),
                [(SFAirport *)v46 country],
                v49 = objc_claimAutoreleasedReturnValue(),
                v50 = v44,
                objc_msgSend(v44, "isEqual:")))
          {
            v52 = [(SFAirport *)self name];
            v51 = [(SFAirport *)v46 name];
            if ((v52 == 0) == (v51 != 0))
            {
              int v16 = 0;
              int v17 = 0;
              char v18 = 0;
              v100[4] = 0x100000001;
              v100[3] = 0x100000001;
              v100[2] = 0x100000001;
              v100[1] = 0x100000001;
              *((void *)&v99 + 1) = 0x100000001;
              v100[0] = 0x100000001;
              *(void *)&long long v99 = 0x100000001;
              int v11 = 1;
              int v12 = 1;
              int v13 = 1;
              int v14 = 1;
              int v15 = 1;
            }
            else
            {
              v48 = [(SFAirport *)self name];
              if (v48)
              {
                v45 = [(SFAirport *)self name];
                uint64_t v5 = v46;
                uint64_t v7 = [(SFAirport *)v46 name];
                v47 = v45;
                char v18 = [v45 isEqual:v7];
                int v17 = 1;
                v100[4] = 0x100000001;
                v100[3] = 0x100000001;
                v100[2] = 0x100000001;
                v100[1] = 0x100000001;
                *((void *)&v99 + 1) = 0x100000001;
                v100[0] = 0x100000001;
                *(void *)&long long v99 = 0x100000001;
                int v11 = 1;
                int v12 = 1;
                int v13 = 1;
                int v14 = 1;
                int v15 = 1;
                int v16 = 1;
                goto LABEL_15;
              }
              v48 = 0;
              int v17 = 0;
              v100[4] = 0x100000001;
              v100[3] = 0x100000001;
              v100[2] = 0x100000001;
              v100[1] = 0x100000001;
              *((void *)&v99 + 1) = 0x100000001;
              v100[0] = 0x100000001;
              *(void *)&long long v99 = 0x100000001;
              int v11 = 1;
              int v12 = 1;
              int v13 = 1;
              int v14 = 1;
              int v15 = 1;
              int v16 = 1;
              char v18 = 1;
            }
          }
          else
          {
            int v15 = 0;
            int v16 = 0;
            int v17 = 0;
            char v18 = 0;
            v100[4] = 0x100000001;
            v100[3] = 0x100000001;
            v100[2] = 0x100000001;
            v100[1] = 0x100000001;
            *((void *)&v99 + 1) = 0x100000001;
            v100[0] = 0x100000001;
            *(void *)&long long v99 = 0x100000001;
            int v11 = 1;
            int v12 = 1;
            int v13 = 1;
            int v14 = 1;
            LODWORD(v105[0]) = 1;
          }
        }
      }
      else
      {
        int v13 = 0;
        int v14 = 0;
        v105[0] = 0x100000000;
        int v15 = 0;
        int v16 = 0;
        int v17 = 0;
        char v18 = 0;
        v100[4] = 0x100000001;
        v100[3] = 0x100000001;
        v100[2] = 0x100000001;
        v100[1] = 0x100000001;
        *((void *)&v99 + 1) = 0x100000001;
        v100[0] = 0x100000001;
        *(void *)&long long v99 = 0x100000001;
        int v11 = 1;
        int v12 = 1;
      }
    }
  }
  else
  {
    int v12 = 0;
    v105[0] = 0;
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    char v18 = 0;
    v100[4] = 0x100000001;
    v100[3] = 0x100000001;
    v100[2] = 0x100000001;
    v100[1] = 0x100000001;
    HIDWORD(v99) = 1;
    v100[0] = 0x100000001;
    *(void *)((char *)&v99 + 4) = 0x100000000;
    LODWORD(v99) = 1;
    int v11 = 1;
    LODWORD(v105[1]) = 1;
  }
  uint64_t v5 = v46;
LABEL_15:
  if (v17)
  {
    unint64_t v21 = v5;
    int v22 = v11;
    int v23 = v13;
    int v24 = v12;
    int v25 = v14;
    int v26 = v15;
    int v27 = v16;

    int v16 = v27;
    int v15 = v26;
    int v14 = v25;
    int v12 = v24;
    int v13 = v23;
    int v11 = v22;
    uint64_t v5 = v21;
  }
  if (v16) {

  }
  if (v15)
  {
  }
  if (LODWORD(v105[0]))
  {

    if (!v14) {
      goto LABEL_23;
    }
LABEL_80:

    if (!v13) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (v14) {
    goto LABEL_80;
  }
LABEL_23:
  if (v13)
  {
LABEL_24:
  }
LABEL_25:
  if (HIDWORD(v105[0]))
  {
  }
  if (v12) {

  }
  if (DWORD1(v99))
  {
  }
  if (LODWORD(v105[1]))
  {
  }
  if (v11) {

  }
  if (v99)
  {
  }
  if (HIDWORD(v105[1]))
  {
  }
  if (LODWORD(v100[0])) {

  }
  if (DWORD2(v99))
  {
  }
  if (LODWORD(v105[2]))
  {
  }
  if (HIDWORD(v100[0])) {

  }
  if (HIDWORD(v99))
  {
  }
  if (LODWORD(v100[5]))
  {
  }
  if (HIDWORD(v100[1])) {

  }
  if (LODWORD(v100[1]))
  {
  }
  if (HIDWORD(v105[2]))
  {
  }
  if (HIDWORD(v100[2])) {

  }
  if (LODWORD(v100[2]))
  {
  }
  if (LODWORD(v105[3]))
  {
  }
  if (HIDWORD(v100[3])) {

  }
  if (LODWORD(v100[3]))
  {
  }
  if (HIDWORD(v105[3]))
  {
  }
  if (LODWORD(v100[4])) {

  }
  if (HIDWORD(v100[4]))
  {
  }
  if (HIDWORD(v100[5]))
  {
  }
  if (v102 != v101) {

  }
LABEL_78:
  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(SFAirport *)self code];
  v6 = (void *)[v5 copy];
  [v4 setCode:v6];

  uint64_t v7 = [(SFAirport *)self timezone];
  uint64_t v8 = (void *)[v7 copy];
  [v4 setTimezone:v8];

  BOOL v9 = [(SFAirport *)self location];
  v10 = (void *)[v9 copy];
  [v4 setLocation:v10];

  int v11 = [(SFAirport *)self city];
  int v12 = (void *)[v11 copy];
  [v4 setCity:v12];

  int v13 = [(SFAirport *)self street];
  int v14 = (void *)[v13 copy];
  [v4 setStreet:v14];

  int v15 = [(SFAirport *)self district];
  int v16 = (void *)[v15 copy];
  [v4 setDistrict:v16];

  int v17 = [(SFAirport *)self state];
  char v18 = (void *)[v17 copy];
  [v4 setState:v18];

  uint64_t v19 = [(SFAirport *)self postalCode];
  v20 = (void *)[v19 copy];
  [v4 setPostalCode:v20];

  unint64_t v21 = [(SFAirport *)self countryCode];
  int v22 = (void *)[v21 copy];
  [v4 setCountryCode:v22];

  int v23 = [(SFAirport *)self country];
  int v24 = (void *)[v23 copy];
  [v4 setCountry:v24];

  int v25 = [(SFAirport *)self name];
  int v26 = (void *)[v25 copy];
  [v4 setName:v26];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBAirport alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBAirport *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBAirport alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBAirport *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6 = [[_SFPBAirport alloc] initWithFacade:self];
  uint64_t v5 = [(_SFPBAirport *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFAirport)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  v6 = [[_SFPBAirport alloc] initWithData:v5];
  uint64_t v7 = [(SFAirport *)self initWithProtobuf:v6];

  return v7;
}

- (SFAirport)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)SFAirport;
  uint64_t v5 = [(SFAirport *)&v33 init];
  if (v5)
  {
    v6 = [v4 code];

    if (v6)
    {
      uint64_t v7 = [v4 code];
      [(SFAirport *)v5 setCode:v7];
    }
    uint64_t v8 = [v4 timezone];

    if (v8)
    {
      BOOL v9 = [v4 timezone];
      v10 = _SFPBTimeZoneHandwrittenTranslator(v9);
      [(SFAirport *)v5 setTimezone:v10];
    }
    int v11 = [v4 location];

    if (v11)
    {
      int v12 = [SFLatLng alloc];
      int v13 = [v4 location];
      int v14 = [(SFLatLng *)v12 initWithProtobuf:v13];
      [(SFAirport *)v5 setLocation:v14];
    }
    int v15 = [v4 city];

    if (v15)
    {
      int v16 = [v4 city];
      [(SFAirport *)v5 setCity:v16];
    }
    int v17 = [v4 street];

    if (v17)
    {
      char v18 = [v4 street];
      [(SFAirport *)v5 setStreet:v18];
    }
    uint64_t v19 = [v4 district];

    if (v19)
    {
      v20 = [v4 district];
      [(SFAirport *)v5 setDistrict:v20];
    }
    unint64_t v21 = [v4 state];

    if (v21)
    {
      int v22 = [v4 state];
      [(SFAirport *)v5 setState:v22];
    }
    int v23 = [v4 postalCode];

    if (v23)
    {
      int v24 = [v4 postalCode];
      [(SFAirport *)v5 setPostalCode:v24];
    }
    int v25 = [v4 countryCode];

    if (v25)
    {
      int v26 = [v4 countryCode];
      [(SFAirport *)v5 setCountryCode:v26];
    }
    int v27 = [v4 country];

    if (v27)
    {
      v28 = [v4 country];
      [(SFAirport *)v5 setCountry:v28];
    }
    v29 = [v4 name];

    if (v29)
    {
      uint64_t v30 = [v4 name];
      [(SFAirport *)v5 setName:v30];
    }
    v31 = v5;
  }

  return v5;
}

@end