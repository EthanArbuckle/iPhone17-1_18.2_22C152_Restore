@interface FMCongestionCell
- (BOOL)isCongested;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMatchForMetric:(id)a3;
- (FMCongestionMetric)congestionMetric;
- (NSDate)timestamp;
- (NSNumber)arfcnOrUarfcn;
- (NSNumber)mcc;
- (NSNumber)mnc;
- (NSNumber)subscriptionID;
- (NSString)gci;
- (NSString)rat;
- (id)description;
- (id)dlBottleneckScoreAsString;
- (id)init:(id)a3 subscriptionID:(id)a4 mcc:(id)a5 mnc:(id)a6 gci:(id)a7 rat:(id)a8 arfcnOrUarfcn:(id)a9;
- (id)ulBottleneckScoreAsString;
- (unint64_t)hash;
- (void)setCongestionMetric:(id)a3;
- (void)setTimestamp:(id)a3;
@end

@implementation FMCongestionCell

- (BOOL)isMatchForMetric:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(FMCongestionCell *)self gci];
    v6 = [v4 gci];
    if ([v5 isEqualToString:v6])
    {
      v7 = [(FMCongestionCell *)self subscriptionID];
      v8 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v4 subsId]);
      unsigned __int8 v9 = [v7 isEqualToNumber:v8];
    }
    else
    {
      unsigned __int8 v9 = 0;
    }
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_congestionMetric, 0);
  objc_storeStrong((id *)&self->_arfcnOrUarfcn, 0);
  objc_storeStrong((id *)&self->_rat, 0);
  objc_storeStrong((id *)&self->_gci, 0);
  objc_storeStrong((id *)&self->_mnc, 0);
  objc_storeStrong((id *)&self->_mcc, 0);
  objc_storeStrong((id *)&self->_subscriptionID, 0);

  objc_storeStrong((id *)&self->_timestamp, 0);
}

- (id)ulBottleneckScoreAsString
{
  v3 = [(FMCongestionCell *)self congestionMetric];

  if (!v3) {
    return @"unknown";
  }
  id v4 = [(FMCongestionCell *)self congestionMetric];
  unsigned int v5 = [v4 ulBottleneckScoreHigh];

  if (v5) {
    return @"high";
  }
  v7 = [(FMCongestionCell *)self congestionMetric];
  unsigned int v8 = [v7 ulBottleneckScoreMedium];

  if (v8) {
    return @"medium";
  }
  unsigned __int8 v9 = [(FMCongestionCell *)self congestionMetric];
  unsigned int v10 = [v9 ulBottleneckScoreLow];

  if (v10) {
    return @"low";
  }
  v11 = [(FMCongestionCell *)self congestionMetric];
  unsigned int v12 = [v11 ulBottleneckScoreNo];

  if (v12) {
    return @"no";
  }
  v13 = [(FMCongestionCell *)self congestionMetric];
  unsigned int v14 = [v13 ulBottleneckScoreInvalid];

  if (v14) {
    return @"invalid";
  }
  else {
    return @"none";
  }
}

- (id)dlBottleneckScoreAsString
{
  v3 = [(FMCongestionCell *)self congestionMetric];

  if (!v3) {
    return @"unknown";
  }
  id v4 = [(FMCongestionCell *)self congestionMetric];
  unsigned int v5 = [v4 dlBottleneckScoreHigh];

  if (v5) {
    return @"high";
  }
  v7 = [(FMCongestionCell *)self congestionMetric];
  unsigned int v8 = [v7 dlBottleneckScoreMedium];

  if (v8) {
    return @"medium";
  }
  unsigned __int8 v9 = [(FMCongestionCell *)self congestionMetric];
  unsigned int v10 = [v9 dlBottleneckScoreLow];

  if (v10) {
    return @"low";
  }
  v11 = [(FMCongestionCell *)self congestionMetric];
  unsigned int v12 = [v11 dlBottleneckScoreNo];

  if (v12) {
    return @"no";
  }
  v13 = [(FMCongestionCell *)self congestionMetric];
  unsigned int v14 = [v13 dlBottleneckScoreInvalid];

  if (v14) {
    return @"invalid";
  }
  else {
    return @"none";
  }
}

- (BOOL)isCongested
{
  v3 = [(FMCongestionCell *)self congestionMetric];

  if (v3)
  {
    id v4 = [(FMCongestionCell *)self congestionMetric];
    LOBYTE(v3) = [v4 isCongested];
  }
  return (char)v3;
}

- (FMCongestionMetric)congestionMetric
{
  return (FMCongestionMetric *)objc_getProperty(self, a2, 64, 1);
}

- (NSDate)timestamp
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTimestamp:(id)a3
{
}

- (id)init:(id)a3 subscriptionID:(id)a4 mcc:(id)a5 mnc:(id)a6 gci:(id)a7 rat:(id)a8 arfcnOrUarfcn:(id)a9
{
  id v27 = a3;
  id v26 = a4;
  id v25 = a5;
  id v24 = a6;
  id v23 = a7;
  id v16 = a8;
  id v17 = a9;
  v28.receiver = self;
  v28.super_class = (Class)FMCongestionCell;
  v18 = [(FMCongestionCell *)&v28 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_timestamp, a3);
    objc_storeStrong((id *)&v19->_subscriptionID, a4);
    objc_storeStrong((id *)&v19->_mcc, a5);
    objc_storeStrong((id *)&v19->_mnc, a6);
    objc_storeStrong((id *)&v19->_gci, a7);
    objc_storeStrong((id *)&v19->_rat, a8);
    objc_storeStrong((id *)&v19->_arfcnOrUarfcn, a9);
    congestionMetric = v19->_congestionMetric;
    v19->_congestionMetric = 0;

    v21 = v19;
  }

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [(FMCongestionCell *)self subscriptionID];
      v7 = [v5 subscriptionID];
      if (![v6 isEqualToNumber:v7])
      {
        unsigned __int8 v12 = 0;
LABEL_25:

        goto LABEL_26;
      }
      unsigned int v8 = [(FMCongestionCell *)self mcc];
      unsigned __int8 v9 = [v5 mcc];
      if (![v8 isEqualToNumber:v9])
      {
        unsigned __int8 v12 = 0;
LABEL_24:

        goto LABEL_25;
      }
      unsigned int v10 = [(FMCongestionCell *)self mnc];
      v11 = [v5 mnc];
      if (![v10 isEqualToNumber:v11])
      {
        unsigned __int8 v12 = 0;
LABEL_23:

        goto LABEL_24;
      }
      id v23 = [(FMCongestionCell *)self gci];
      v22 = [v5 gci];
      if (!objc_msgSend(v23, "isEqualToString:"))
      {
        unsigned __int8 v12 = 0;
LABEL_22:

        goto LABEL_23;
      }
      v21 = [(FMCongestionCell *)self rat];
      v20 = [v5 rat];
      if (!objc_msgSend(v21, "isEqualToString:"))
      {
        unsigned __int8 v12 = 0;
LABEL_21:

        goto LABEL_22;
      }
      uint64_t v19 = [(FMCongestionCell *)self arfcnOrUarfcn];
      if (v19 || ([v5 arfcnOrUarfcn], (uint64_t v15 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v18 = [(FMCongestionCell *)self arfcnOrUarfcn];
        id v17 = [v5 arfcnOrUarfcn];
        unsigned __int8 v12 = [v18 isEqualToNumber:v17];

        v13 = (void *)v19;
        if (v19)
        {
LABEL_20:

          goto LABEL_21;
        }
      }
      else
      {
        id v16 = 0;
        unsigned __int8 v12 = 1;
      }
      v13 = v16;
      goto LABEL_20;
    }
  }
  unsigned __int8 v12 = 0;
LABEL_26:

  return v12;
}

- (NSNumber)subscriptionID
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)mnc
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (NSNumber)mcc
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)gci
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSNumber)arfcnOrUarfcn
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)rat
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCongestionMetric:(id)a3
{
}

- (id)description
{
  v3 = [(FMCongestionCell *)self timestamp];
  id v4 = [(FMCongestionCell *)self subscriptionID];
  id v5 = [(FMCongestionCell *)self mcc];
  v6 = [(FMCongestionCell *)self mnc];
  v7 = [(FMCongestionCell *)self gci];
  unsigned int v8 = [(FMCongestionCell *)self rat];
  unsigned __int8 v9 = [(FMCongestionCell *)self arfcnOrUarfcn];
  unsigned int v10 = [(FMCongestionCell *)self congestionMetric];
  v11 = +[NSString stringWithFormat:@"timestamp %@, subscriptionID %@, mcc %@, mnc %@, gci %@, rat %@, arfcnOrUarfcn %@, congestionMetric %@", v3, v4, v5, v6, v7, v8, v9, v10];

  return v11;
}

- (unint64_t)hash
{
  v3 = [(FMCongestionCell *)self subscriptionID];
  id v4 = [v3 hash];

  id v5 = [(FMCongestionCell *)self mcc];
  v6 = [v5 hash];

  v7 = [(FMCongestionCell *)self mnc];
  id v8 = [v7 hash];

  unsigned __int8 v9 = [(FMCongestionCell *)self gci];
  unsigned int v10 = (char *)[v9 hash];

  v11 = [(FMCongestionCell *)self rat];
  unsigned __int8 v12 = [v11 hash];

  v13 = [(FMCongestionCell *)self arfcnOrUarfcn];
  id v14 = [v13 hash];
  uint64_t v15 = (uint64_t)v8 + 1024 * (void)v4 + 32 * (v6 - (unsigned char *)v4) - (v6 - (unsigned char *)v4) + -32 * (void)v4;
  uint64_t v16 = v12 - &v10[32 * v15 - v15] + 32 * (void)&v10[32 * v15 - v15];
  unint64_t v17 = (unint64_t)v14 + 32 * v16 - v16 + 887503681;

  return v17;
}

@end