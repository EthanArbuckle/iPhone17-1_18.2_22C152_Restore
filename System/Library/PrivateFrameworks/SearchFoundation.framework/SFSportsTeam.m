@interface SFSportsTeam
+ (BOOL)supportsSecureCoding;
- (BOOL)hasIsWinner;
- (BOOL)isEqual:(id)a3;
- (BOOL)isWinner;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)accessibilityDescription;
- (NSString)name;
- (NSString)record;
- (NSString)score;
- (SFButtonItem)button;
- (SFImage)logo;
- (SFSportsTeam)initWithCoder:(id)a3;
- (SFSportsTeam)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessibilityDescription:(id)a3;
- (void)setButton:(id)a3;
- (void)setIsWinner:(BOOL)a3;
- (void)setLogo:(id)a3;
- (void)setName:(id)a3;
- (void)setRecord:(id)a3;
- (void)setScore:(id)a3;
@end

@implementation SFSportsTeam

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_accessibilityDescription, 0);
  objc_storeStrong((id *)&self->_score, 0);
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_logo, 0);
}

- (BOOL)isWinner
{
  return self->_isWinner;
}

- (void)setButton:(id)a3
{
}

- (SFButtonItem)button
{
  return self->_button;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setAccessibilityDescription:(id)a3
{
}

- (NSString)accessibilityDescription
{
  return self->_accessibilityDescription;
}

- (void)setScore:(id)a3
{
}

- (NSString)score
{
  return self->_score;
}

- (void)setRecord:(id)a3
{
}

- (NSString)record
{
  return self->_record;
}

- (void)setLogo:(id)a3
{
}

- (SFImage)logo
{
  return self->_logo;
}

- (unint64_t)hash
{
  v3 = [(SFSportsTeam *)self logo];
  uint64_t v4 = [v3 hash];
  v5 = [(SFSportsTeam *)self record];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(SFSportsTeam *)self score];
  uint64_t v8 = [v7 hash];
  v9 = [(SFSportsTeam *)self accessibilityDescription];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  v11 = [(SFSportsTeam *)self name];
  uint64_t v12 = [v11 hash];
  v13 = [(SFSportsTeam *)self button];
  uint64_t v14 = v12 ^ [v13 hash];
  unint64_t v15 = v10 ^ v14 ^ [(SFSportsTeam *)self isWinner];

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (SFSportsTeam *)a3;
  if (self == v5)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    if ([(SFSportsTeam *)v5 isMemberOfClass:objc_opt_class()])
    {
      uint64_t v6 = v5;
      v7 = [(SFSportsTeam *)self logo];
      uint64_t v8 = [(SFSportsTeam *)v6 logo];
      if ((v7 == 0) == (v8 != 0))
      {
        LOBYTE(v12) = 0;
LABEL_49:

        goto LABEL_50;
      }
      v9 = [(SFSportsTeam *)self logo];
      if (v9)
      {
        uint64_t v10 = [(SFSportsTeam *)self logo];
        v11 = [(SFSportsTeam *)v6 logo];
        if (![v10 isEqual:v11])
        {
          LOBYTE(v12) = 0;
          goto LABEL_47;
        }
        v62 = v11;
        v63 = v10;
      }
      v13 = [(SFSportsTeam *)self record];
      uint64_t v14 = [(SFSportsTeam *)v6 record];
      if ((v13 == 0) != (v14 != 0))
      {
        v61 = v14;
        unint64_t v15 = [(SFSportsTeam *)self record];
        if (v15)
        {
          v16 = [(SFSportsTeam *)self record];
          v17 = [(SFSportsTeam *)v6 record];
          if (([v16 isEqual:v17] & 1) == 0)
          {

LABEL_44:
LABEL_45:
            LOBYTE(v12) = 0;
            goto LABEL_46;
          }
          v59 = v17;
          v60 = v13;
          v3 = v16;
          v18 = v15;
        }
        else
        {
          v60 = v13;
          v18 = 0;
        }
        v19 = [(SFSportsTeam *)self score];
        v20 = [(SFSportsTeam *)v6 score];
        v21 = v18;
        v22 = v3;
        if ((v19 == 0) != (v20 != 0))
        {
          v58 = v20;
          v57 = v19;
          v56 = [(SFSportsTeam *)self score];
          if (v56)
          {
            v23 = [(SFSportsTeam *)self score];
            v24 = [(SFSportsTeam *)v6 score];
            if (([v23 isEqual:v24] & 1) == 0)
            {

              if (v21)
              {
              }
              goto LABEL_45;
            }
            v54 = v24;
            v55 = v23;
            v25 = v21;
          }
          else
          {
            v25 = v21;
          }
          v26 = [(SFSportsTeam *)self accessibilityDescription];
          v27 = [(SFSportsTeam *)v6 accessibilityDescription];
          v21 = v25;
          v22 = v3;
          if ((v26 == 0) != (v27 != 0))
          {
            id v53 = v27;
            v52 = [(SFSportsTeam *)self accessibilityDescription];
            if (v52)
            {
              v28 = [(SFSportsTeam *)self accessibilityDescription];
              [(SFSportsTeam *)v6 accessibilityDescription];
              v49 = v51 = v28;
              if (!objc_msgSend(v28, "isEqual:"))
              {
                LOBYTE(v12) = 0;
                v34 = v52;
                goto LABEL_65;
              }
              v50 = v21;
            }
            else
            {
              v50 = v21;
            }
            v29 = [(SFSportsTeam *)self name];
            v30 = [(SFSportsTeam *)v6 name];
            if ((v29 == 0) != (v30 != 0))
            {
              v48 = v30;
              uint64_t v31 = [(SFSportsTeam *)self name];
              v47 = v29;
              if (v31)
              {
                v32 = [(SFSportsTeam *)self name];
                v43 = [(SFSportsTeam *)v6 name];
                v44 = v32;
                if (!objc_msgSend(v32, "isEqual:"))
                {
                  LOBYTE(v12) = 0;
                  v37 = (void *)v31;
                  v21 = v50;
LABEL_63:

LABEL_64:
                  v34 = v52;
                  if (!v52)
                  {
LABEL_66:

                    if (v56)
                    {
                    }
                    if (v21)
                    {
                    }
LABEL_46:
                    v11 = v62;
                    uint64_t v10 = v63;
                    if (!v9)
                    {
LABEL_48:

                      goto LABEL_49;
                    }
LABEL_47:

                    goto LABEL_48;
                  }
LABEL_65:

                  goto LABEL_66;
                }
                v45 = (void *)v31;
              }
              else
              {
                v45 = 0;
              }
              v35 = [(SFSportsTeam *)self button];
              v36 = [(SFSportsTeam *)v6 button];
              if ((v35 == 0) == (v36 != 0))
              {

                LOBYTE(v12) = 0;
                v21 = v50;
                goto LABEL_62;
              }
              v41 = v36;
              v42 = v35;
              [(SFSportsTeam *)self button];
              v46 = v21 = v50;
              if (!v46
                || ([(SFSportsTeam *)self button],
                    v40 = objc_claimAutoreleasedReturnValue(),
                    [(SFSportsTeam *)v6 button],
                    v39 = objc_claimAutoreleasedReturnValue(),
                    objc_msgSend(v40, "isEqual:")))
              {
                BOOL v38 = [(SFSportsTeam *)self isWinner];
                BOOL v12 = v38 ^ [(SFSportsTeam *)v6 isWinner] ^ 1;
                if (!v46)
                {
LABEL_61:

LABEL_62:
                  v37 = v45;
                  if (!v45) {
                    goto LABEL_64;
                  }
                  goto LABEL_63;
                }
              }
              else
              {
                LOBYTE(v12) = 0;
              }

              goto LABEL_61;
            }

            if (v52)
            {
            }
            v21 = v50;
            v27 = v53;
          }

          if (v56)
          {
          }
          v19 = v57;
          v20 = v58;
        }

        if (v21)
        {
        }
        v13 = v60;
        uint64_t v14 = v61;
      }

      goto LABEL_44;
    }
    LOBYTE(v12) = 0;
  }
LABEL_50:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(SFSportsTeam *)self logo];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setLogo:v6];

  v7 = [(SFSportsTeam *)self record];
  uint64_t v8 = (void *)[v7 copy];
  [v4 setRecord:v8];

  v9 = [(SFSportsTeam *)self score];
  uint64_t v10 = (void *)[v9 copy];
  [v4 setScore:v10];

  v11 = [(SFSportsTeam *)self accessibilityDescription];
  BOOL v12 = (void *)[v11 copy];
  [v4 setAccessibilityDescription:v12];

  v13 = [(SFSportsTeam *)self name];
  uint64_t v14 = (void *)[v13 copy];
  [v4 setName:v14];

  unint64_t v15 = [(SFSportsTeam *)self button];
  v16 = (void *)[v15 copy];
  [v4 setButton:v16];

  objc_msgSend(v4, "setIsWinner:", -[SFSportsTeam isWinner](self, "isWinner"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBSportsTeam alloc] initWithFacade:self];
  v3 = [(_SFPBSportsTeam *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBSportsTeam alloc] initWithFacade:self];
  v3 = [(_SFPBSportsTeam *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[_SFPBSportsTeam alloc] initWithFacade:self];
  v5 = [(_SFPBSportsTeam *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFSportsTeam)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v6 = [[_SFPBSportsTeam alloc] initWithData:v5];
  v7 = [(SFSportsTeam *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasIsWinner
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsWinner:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isWinner = a3;
}

- (SFSportsTeam)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SFSportsTeam;
  v5 = [(SFSportsTeam *)&v24 init];
  if (v5)
  {
    uint64_t v6 = [v4 logo];

    if (v6)
    {
      v7 = [SFImage alloc];
      uint64_t v8 = [v4 logo];
      v9 = [(SFImage *)v7 initWithProtobuf:v8];
      [(SFSportsTeam *)v5 setLogo:v9];
    }
    uint64_t v10 = [v4 record];

    if (v10)
    {
      v11 = [v4 record];
      [(SFSportsTeam *)v5 setRecord:v11];
    }
    BOOL v12 = [v4 score];

    if (v12)
    {
      v13 = [v4 score];
      [(SFSportsTeam *)v5 setScore:v13];
    }
    uint64_t v14 = [v4 accessibilityDescription];

    if (v14)
    {
      unint64_t v15 = [v4 accessibilityDescription];
      [(SFSportsTeam *)v5 setAccessibilityDescription:v15];
    }
    v16 = [v4 name];

    if (v16)
    {
      v17 = [v4 name];
      [(SFSportsTeam *)v5 setName:v17];
    }
    v18 = [v4 button];

    if (v18)
    {
      v19 = [SFButtonItem alloc];
      v20 = [v4 button];
      v21 = [(SFButtonItem *)v19 initWithProtobuf:v20];
      [(SFSportsTeam *)v5 setButton:v21];
    }
    if ([v4 isWinner]) {
      -[SFSportsTeam setIsWinner:](v5, "setIsWinner:", [v4 isWinner]);
    }
    v22 = v5;
  }

  return v5;
}

@end