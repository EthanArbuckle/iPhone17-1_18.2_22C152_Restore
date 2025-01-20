@interface FMServingCell
- (BOOL)isEqual:(id)a3;
- (NSDate)timestamp;
- (NSNumber)arfcnOrUarfcn;
- (NSNumber)bandInfo;
- (NSNumber)bandwidth;
- (NSNumber)cellID;
- (NSNumber)deploymentType;
- (NSNumber)mcc;
- (NSNumber)mnc;
- (NSNumber)pci;
- (NSNumber)subscriptionID;
- (NSNumber)tacOrLac;
- (NSString)radioAccessTechnology;
- (id)description;
- (id)gci;
- (id)init:(id)a3 subscriptionID:(id)a4 radioAccessTechnology:(id)a5 cellID:(id)a6 mnc:(id)a7 mcc:(id)a8 bandInfo:(id)a9 tacOrLac:(id)a10 arfcnOrUarfcn:(id)a11 bandwidth:(id)a12 pci:(id)a13 deploymentType:(id)a14;
- (unint64_t)hash;
- (void)updateTimestampTo:(id)a3;
@end

@implementation FMServingCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deploymentType, 0);
  objc_storeStrong((id *)&self->_pci, 0);
  objc_storeStrong((id *)&self->_bandwidth, 0);
  objc_storeStrong((id *)&self->_arfcnOrUarfcn, 0);
  objc_storeStrong((id *)&self->_tacOrLac, 0);
  objc_storeStrong((id *)&self->_bandInfo, 0);
  objc_storeStrong((id *)&self->_mcc, 0);
  objc_storeStrong((id *)&self->_mnc, 0);
  objc_storeStrong((id *)&self->_cellID, 0);
  objc_storeStrong((id *)&self->_radioAccessTechnology, 0);
  objc_storeStrong((id *)&self->_subscriptionID, 0);

  objc_storeStrong((id *)&self->_timestamp, 0);
}

- (void)updateTimestampTo:(id)a3
{
}

- (NSDate)timestamp
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (id)init:(id)a3 subscriptionID:(id)a4 radioAccessTechnology:(id)a5 cellID:(id)a6 mnc:(id)a7 mcc:(id)a8 bandInfo:(id)a9 tacOrLac:(id)a10 arfcnOrUarfcn:(id)a11 bandwidth:(id)a12 pci:(id)a13 deploymentType:(id)a14
{
  id v38 = a3;
  id v27 = a4;
  id v37 = a4;
  id v36 = a5;
  id v28 = a6;
  id v35 = a6;
  id v34 = a7;
  id v33 = a8;
  id v32 = a9;
  id v31 = a10;
  id v30 = a11;
  id v19 = a12;
  id v20 = a13;
  id v21 = a14;
  v39.receiver = self;
  v39.super_class = (Class)FMServingCell;
  v22 = [(FMServingCell *)&v39 init];
  p_isa = (id *)&v22->super.isa;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_timestamp, a3);
    objc_storeStrong(p_isa + 2, v27);
    objc_storeStrong(p_isa + 3, a5);
    objc_storeStrong(p_isa + 4, v28);
    objc_storeStrong(p_isa + 5, a7);
    objc_storeStrong(p_isa + 6, a8);
    objc_storeStrong(p_isa + 7, a9);
    objc_storeStrong(p_isa + 8, a10);
    objc_storeStrong(p_isa + 9, a11);
    objc_storeStrong(p_isa + 10, a12);
    objc_storeStrong(p_isa + 11, a13);
    objc_storeStrong(p_isa + 12, a14);
    v24 = p_isa;
  }

  return p_isa;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(FMServingCell *)self subscriptionID];
    v7 = [v5 subscriptionID];
    if (![v6 isEqualToNumber:v7])
    {
      BOOL v13 = 0;
LABEL_38:

      goto LABEL_39;
    }
    v8 = [(FMServingCell *)self radioAccessTechnology];
    v9 = [v5 radioAccessTechnology];
    if (![v8 isEqualToString:v9])
    {
      BOOL v13 = 0;
LABEL_37:

      goto LABEL_38;
    }
    v10 = [(FMServingCell *)self cellID];
    v11 = [v5 cellID];
    if (![v10 isEqualToNumber:v11])
    {
      BOOL v13 = 0;
LABEL_36:

      goto LABEL_37;
    }
    v45 = [(FMServingCell *)self mnc];
    v12 = [v5 mnc];
    if (![v45 isEqualToNumber:v12])
    {
      BOOL v13 = 0;
LABEL_35:

      goto LABEL_36;
    }
    v44 = [(FMServingCell *)self mcc];
    v43 = [v5 mcc];
    if (!objc_msgSend(v44, "isEqualToNumber:"))
    {
      BOOL v13 = 0;
LABEL_34:

      goto LABEL_35;
    }
    v42 = [(FMServingCell *)self bandInfo];
    v41 = [v5 bandInfo];
    if (!objc_msgSend(v42, "isEqualToNumber:"))
    {
      BOOL v13 = 0;
LABEL_33:

      goto LABEL_34;
    }
    v40 = [(FMServingCell *)self tacOrLac];
    objc_super v39 = [v5 tacOrLac];
    if (!objc_msgSend(v40, "isEqualToNumber:"))
    {
      BOOL v13 = 0;
LABEL_32:

      goto LABEL_33;
    }
    id v38 = [(FMServingCell *)self arfcnOrUarfcn];
    id v37 = [v5 arfcnOrUarfcn];
    if (!objc_msgSend(v38, "isEqualToNumber:"))
    {
      BOOL v13 = 0;
LABEL_31:

      goto LABEL_32;
    }
    id v36 = [(FMServingCell *)self bandwidth];
    if (v36)
    {
      id v34 = [v5 bandwidth];
      if (v34)
      {
        id v33 = [(FMServingCell *)self bandwidth];
        id v31 = [v5 bandwidth];
        int v35 = 1;
        if ([v33 isEqualToNumber:v31]) {
          goto LABEL_42;
        }
      }
      else
      {
        id v34 = 0;
        int v35 = 0;
      }
    }
    else
    {
      int v35 = 0;
    }
    v14 = [(FMServingCell *)self bandwidth];
    if (v14)
    {

      BOOL v13 = 0;
      if (!v35)
      {
LABEL_28:
        if (v36) {

        }
        goto LABEL_31;
      }
LABEL_27:

      goto LABEL_28;
    }
    v16 = [v5 bandwidth];
    if (v16)
    {

      BOOL v13 = 0;
      goto LABEL_73;
    }
LABEL_42:
    id v32 = [(FMServingCell *)self pci];
    if (v32)
    {
      v29 = [v5 pci];
      if (v29)
      {
        id v28 = [(FMServingCell *)self pci];
        id v27 = [v5 pci];
        int v30 = 1;
        if ([v28 isEqualToNumber:v27])
        {
          char v25 = 0;
          goto LABEL_54;
        }
      }
      else
      {
        v29 = 0;
        int v30 = 0;
      }
    }
    else
    {
      int v30 = 0;
    }
    v17 = [(FMServingCell *)self pci];
    if (v17)
    {

      BOOL v13 = 0;
      goto LABEL_68;
    }
    v18 = [v5 pci];
    if (v18)
    {
      BOOL v13 = 0;
LABEL_52:

      goto LABEL_68;
    }
    char v25 = 1;
LABEL_54:
    v26 = [(FMServingCell *)self deploymentType];
    if (v26)
    {
      v23 = [v5 deploymentType];
      if (v23)
      {
        v22 = [(FMServingCell *)self deploymentType];
        id v21 = [v5 deploymentType];
        if ([v22 isEqualToNumber:v21])
        {

          if (v25)
          {
            v18 = 0;
            BOOL v13 = 1;
            goto LABEL_52;
          }
          BOOL v13 = 1;
LABEL_68:
          if ((v30 & 1) == 0)
          {
LABEL_70:
            if (v32) {

            }
LABEL_73:
            if ((v35 & 1) == 0) {
              goto LABEL_28;
            }
            goto LABEL_27;
          }
LABEL_69:

          goto LABEL_70;
        }
        int v24 = 1;
      }
      else
      {
        v23 = 0;
        int v24 = 0;
      }
    }
    else
    {
      int v24 = 0;
    }
    id v19 = [(FMServingCell *)self deploymentType];
    if (v19)
    {

      BOOL v13 = 0;
      if (!v24) {
        goto LABEL_65;
      }
    }
    else
    {
      id v20 = [v5 deploymentType];
      BOOL v13 = v20 == 0;

      if ((v24 & 1) == 0)
      {
LABEL_65:
        if (v26) {

        }
        if ((v25 & 1) == 0)
        {
          if (!v30) {
            goto LABEL_70;
          }
          goto LABEL_69;
        }
        goto LABEL_68;
      }
    }

    goto LABEL_65;
  }
  BOOL v13 = 0;
LABEL_39:

  return v13;
}

- (NSNumber)deploymentType
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (NSNumber)bandwidth
{
  return (NSNumber *)objc_getProperty(self, a2, 80, 1);
}

- (NSNumber)subscriptionID
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)radioAccessTechnology
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSNumber)pci
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (NSNumber)cellID
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (NSNumber)tacOrLac
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (NSNumber)mnc
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (NSNumber)mcc
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (NSNumber)bandInfo
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (NSNumber)arfcnOrUarfcn
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (id)description
{
  v15 = [(FMServingCell *)self timestamp];
  v3 = [(FMServingCell *)self subscriptionID];
  v14 = [(FMServingCell *)self radioAccessTechnology];
  v16 = [(FMServingCell *)self cellID];
  id v4 = [(FMServingCell *)self mnc];
  id v5 = [(FMServingCell *)self mcc];
  v6 = [(FMServingCell *)self bandInfo];
  v7 = [(FMServingCell *)self tacOrLac];
  BOOL v13 = [(FMServingCell *)self arfcnOrUarfcn];
  v12 = [(FMServingCell *)self bandwidth];
  v8 = [(FMServingCell *)self pci];
  v9 = [(FMServingCell *)self deploymentType];
  v10 = +[NSString stringWithFormat:@"timestamp %@, subscriptionID %@, radioAccessTechnology %@, cellID %@, mnc %@, mcc %@, bandInfo %@, tacOrLac %@, arfcnOrUarfcn %@, bandwidth %@, pci %@, deploymentType %@", v15, v3, v14, v16, v4, v5, v6, v7, v13, v12, v8, v9];

  return v10;
}

- (id)gci
{
  v3 = [(FMServingCell *)self mcc];
  id v4 = [v3 stringValue];
  id v5 = [(FMServingCell *)self mnc];
  v6 = [v5 stringValue];
  v7 = [(FMServingCell *)self tacOrLac];
  v8 = [v7 stringValue];
  v9 = [(FMServingCell *)self cellID];
  v10 = [v9 stringValue];
  v11 = +[NSString stringWithFormat:@"%@.%@.%@.%@", v4, v6, v8, v10];

  return v11;
}

- (unint64_t)hash
{
  v3 = [(FMServingCell *)self subscriptionID];
  id v4 = [v3 hash];

  id v5 = [(FMServingCell *)self radioAccessTechnology];
  v6 = [v5 hash];

  v7 = [(FMServingCell *)self cellID];
  id v8 = [v7 hash];

  v9 = [(FMServingCell *)self mnc];
  v10 = (char *)[v9 hash];

  v11 = [(FMServingCell *)self mcc];
  v12 = [v11 hash];

  BOOL v13 = [(FMServingCell *)self bandInfo];
  id v34 = (char *)[v13 hash];
  int v35 = v12;
  id v36 = v10;
  v14 = v6;

  v15 = [(FMServingCell *)self tacOrLac];
  v16 = [v15 hash];

  v17 = [(FMServingCell *)self arfcnOrUarfcn];
  v18 = (char *)[v17 hash];

  id v19 = [(FMServingCell *)self bandwidth];
  if (v19)
  {
    id v20 = [(FMServingCell *)self bandwidth];
    id v21 = [v20 hash];
  }
  else
  {
    id v21 = 0;
  }

  v22 = [(FMServingCell *)self pci];
  if (v22)
  {
    v23 = [(FMServingCell *)self pci];
    int v24 = (char *)[v23 hash];
  }
  else
  {
    int v24 = 0;
  }

  char v25 = [(FMServingCell *)self deploymentType];
  if (v25)
  {
    v26 = [(FMServingCell *)self deploymentType];
    id v27 = [v26 hash];
  }
  else
  {
    id v27 = 0;
  }
  uint64_t v28 = (uint64_t)v8 + 1024 * (void)v4 + 32 * (v14 - (unsigned char *)v4) - (v14 - (unsigned char *)v4) + -32 * (void)v4;
  uint64_t v29 = v35 - &v36[32 * v28 - v28] + 32 * (void)&v36[32 * v28 - v28];
  uint64_t v30 = v16 - &v34[32 * v29 - v29] + 32 * (void)&v34[32 * v29 - v29];
  uint64_t v31 = v21 - &v18[32 * v30 - v30] + 32 * (void)&v18[32 * v30 - v30];
  unint64_t v32 = v27 - &v24[32 * v31 - v31] + 32 * (void)&v24[32 * v31 - v31] + 0x5A44E007B1A55FLL;

  return v32;
}

@end