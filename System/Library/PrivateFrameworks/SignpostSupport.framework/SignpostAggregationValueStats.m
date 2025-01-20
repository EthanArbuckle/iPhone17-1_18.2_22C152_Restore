@interface SignpostAggregationValueStats
+ (id)sumOfStats0:(id)a3 stats1:(id)a4 errorOut:(id *)a5;
+ (id)zeroedValue;
- (BOOL)isEqual:(id)a3;
- (NSNumber)_rawAverage;
- (NSNumber)_rawTotal;
- (NSNumber)count;
- (NSNumber)max;
- (NSNumber)min;
- (NSNumber)stddev;
- (id)_finalizeState;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setCount:(id)a3;
- (void)setMax:(id)a3;
- (void)setMin:(id)a3;
- (void)setStddev:(id)a3;
- (void)set_rawAverage:(id)a3;
- (void)set_rawTotal:(id)a3;
@end

@implementation SignpostAggregationValueStats

+ (id)zeroedValue
{
  v2 = objc_alloc_init(SignpostAggregationValueStats);
  [(SignpostAggregationValueStats *)v2 setCount:&unk_1EF81E808];
  [(SignpostAggregationValueStats *)v2 set_rawTotal:&unk_1EF81E808];
  id v3 = [(SignpostAggregationValueStats *)v2 _finalizeState];

  return v2;
}

- (id)_finalizeState
{
  uint64_t v3 = [(SignpostAggregationValueStats *)self _rawTotal];
  if (v3)
  {
    v4 = (void *)v3;
    v5 = [(SignpostAggregationValueStats *)self _rawAverage];

    if (v5) {
      return @"Cannot specify both raw total and average value";
    }
  }
  v7 = [(SignpostAggregationValueStats *)self _rawTotal];
  if (v7)
  {
  }
  else
  {
    v8 = [(SignpostAggregationValueStats *)self _rawAverage];

    if (!v8) {
      return @"Either total or average is required";
    }
  }
  v9 = [(SignpostAggregationValueStats *)self count];

  if (!v9) {
    return @"Missing 'count'";
  }
  v10 = [(SignpostAggregationValueStats *)self count];
  [v10 doubleValue];
  double v12 = v11;

  if (v12 < 0.0) {
    return @"Negative count not supported";
  }
  v13 = [(SignpostAggregationValueStats *)self _rawTotal];

  if (!v13)
  {
    v14 = NSNumber;
    v15 = [(SignpostAggregationValueStats *)self count];
    double v16 = (double)(unint64_t)[v15 unsignedLongLongValue];
    v17 = [(SignpostAggregationValueStats *)self _rawAverage];
    [v17 doubleValue];
    v19 = [v14 numberWithDouble:v18 * v16];
    [(SignpostAggregationValueStats *)self set_rawTotal:v19];
  }
  v20 = [(SignpostAggregationValueStats *)self _rawAverage];

  if (!v20)
  {
    v21 = [(SignpostAggregationValueStats *)self count];
    uint64_t v22 = [v21 unsignedLongLongValue];

    if (v22)
    {
      v23 = NSNumber;
      v24 = [(SignpostAggregationValueStats *)self _rawTotal];
      [v24 doubleValue];
      double v26 = v25;
      v27 = [(SignpostAggregationValueStats *)self count];
      v28 = objc_msgSend(v23, "numberWithDouble:", v26 / (double)(unint64_t)objc_msgSend(v27, "unsignedLongLongValue"));
      [(SignpostAggregationValueStats *)self set_rawAverage:v28];
    }
    else
    {
      [(SignpostAggregationValueStats *)self set_rawAverage:&unk_1EF81E808];
    }
  }
  v29 = [(SignpostAggregationValueStats *)self count];
  uint64_t v30 = [v29 unsignedLongLongValue];

  if (!v30)
  {
    [(SignpostAggregationValueStats *)self setMin:0];
    [(SignpostAggregationValueStats *)self setMax:0];
    [(SignpostAggregationValueStats *)self setStddev:0];
  }
  v31 = [(SignpostAggregationValueStats *)self stddev];
  [v31 doubleValue];
  double v33 = v32;

  if (v33 < 0.0) {
    return @"Negative stddev is invalid";
  }
  uint64_t v34 = [(SignpostAggregationValueStats *)self _rawTotal];
  if (v34)
  {
    v35 = (void *)v34;
    v36 = [(SignpostAggregationValueStats *)self count];
    if ([v36 unsignedLongLongValue])
    {
    }
    else
    {
      v49 = [(SignpostAggregationValueStats *)self _rawTotal];
      [v49 doubleValue];
      double v51 = v50;

      if (v51 != 0.0) {
        return @"Non-zero raw total with zero count";
      }
    }
  }
  uint64_t v37 = [(SignpostAggregationValueStats *)self _rawAverage];
  if (v37)
  {
    v38 = (void *)v37;
    v39 = [(SignpostAggregationValueStats *)self count];
    if ([v39 unsignedLongLongValue])
    {
    }
    else
    {
      v52 = [(SignpostAggregationValueStats *)self _rawAverage];
      [v52 doubleValue];
      double v54 = v53;

      if (v54 != 0.0) {
        return @"Non-zero average with zero count";
      }
    }
  }
  id result = [(SignpostAggregationValueStats *)self min];
  if (!result) {
    return result;
  }
  id v40 = result;
  uint64_t v41 = [(SignpostAggregationValueStats *)self max];
  if (v41)
  {
    v42 = (void *)v41;
    v43 = [(SignpostAggregationValueStats *)self min];
    [v43 doubleValue];
    double v45 = v44;
    v46 = [(SignpostAggregationValueStats *)self max];
    [v46 doubleValue];
    double v48 = v47;

    if (v45 > v48) {
      return @"Min is greather than max";
    }
  }
  else
  {
  }
  return 0;
}

+ (id)sumOfStats0:(id)a3 stats1:(id)a4 errorOut:(id *)a5
{
  unint64_t v7 = (unint64_t)a3;
  unint64_t v8 = (unint64_t)a4;
  v9 = (void *)v8;
  if (!(v7 | v8))
  {
    v10 = 0;
    goto LABEL_87;
  }
  if (v7 && !v8)
  {
    unint64_t v8 = v7;
LABEL_8:
    v10 = (SignpostAggregationValueStats *)[(id)v8 copy];
    goto LABEL_87;
  }
  if (!v7 && v8) {
    goto LABEL_8;
  }
  double v11 = objc_alloc_init(SignpostAggregationValueStats);
  double v12 = [(id)v7 count];
  if (![v12 unsignedLongLongValue])
  {

LABEL_15:
    double v16 = [(id)v7 count];
    if ([v16 unsignedLongLongValue])
    {
    }
    else
    {
      double v25 = [v9 count];
      uint64_t v26 = [v25 unsignedLongLongValue];

      if (v26)
      {
        v27 = [v9 count];
        [(SignpostAggregationValueStats *)v11 setCount:v27];

        v28 = [v9 min];
        [(SignpostAggregationValueStats *)v11 setMin:v28];

        v29 = [v9 max];
        [(SignpostAggregationValueStats *)v11 setMax:v29];

        uint64_t v30 = [v9 stddev];
        [(SignpostAggregationValueStats *)v11 setStddev:v30];

        v24 = v9;
        goto LABEL_22;
      }
    }
    v17 = [(id)v7 count];
    if ([v17 unsignedLongLongValue])
    {
      double v18 = [v9 count];
      uint64_t v19 = [v18 unsignedLongLongValue];

      if (!v19)
      {
        v20 = [(id)v7 count];
        [(SignpostAggregationValueStats *)v11 setCount:v20];

        v21 = [(id)v7 min];
        [(SignpostAggregationValueStats *)v11 setMin:v21];

        uint64_t v22 = [(id)v7 max];
        [(SignpostAggregationValueStats *)v11 setMax:v22];

        v23 = [(id)v7 stddev];
        [(SignpostAggregationValueStats *)v11 setStddev:v23];

        v24 = (void *)v7;
LABEL_22:
        v31 = [v24 _rawTotal];
        [(SignpostAggregationValueStats *)v11 set_rawTotal:v31];
LABEL_25:

        goto LABEL_26;
      }
    }
    else
    {
    }
    v31 = [(id)v7 count];
    if (![v31 unsignedLongLongValue])
    {
      v35 = [v9 count];
      uint64_t v36 = [v35 unsignedLongLongValue];

      if (!v36)
      {
        [(SignpostAggregationValueStats *)v11 setCount:&unk_1EF81E808];
        [(SignpostAggregationValueStats *)v11 setMin:0];
        [(SignpostAggregationValueStats *)v11 setMax:0];
        [(SignpostAggregationValueStats *)v11 setStddev:0];
        [(SignpostAggregationValueStats *)v11 set_rawTotal:&unk_1EF81E808];
      }
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  v13 = [v9 count];
  uint64_t v14 = [v13 unsignedLongLongValue];

  if (!v14) {
    goto LABEL_15;
  }
  v15 = [(id)v7 _rawAverage];
  if (v15)
  {
    v13 = [v9 _rawAverage];
    if (!v13)
    {

      goto LABEL_38;
    }
  }
  uint64_t v34 = [(id)v7 _rawAverage];
  if (v34)
  {

    if (v15)
    {
    }
LABEL_40:
    id v40 = [(id)v7 _rawTotal];
    if (v40)
    {
      v13 = [v9 _rawTotal];
      if (!v13)
      {

        goto LABEL_49;
      }
    }
    uint64_t v41 = [(id)v7 _rawTotal];
    if (v41)
    {

      if (v40)
      {
      }
    }
    else
    {
      v42 = [v9 _rawTotal];

      if (v40)
      {
      }
      if (v42)
      {
LABEL_49:
        if (a5)
        {
          v38 = (void *)MEMORY[0x1E4F28C58];
          v39 = @"Cannot add stats with and without total value";
          goto LABEL_84;
        }
LABEL_85:
        v10 = 0;
        goto LABEL_86;
      }
    }
    v43 = [(id)v7 min];
    if (v43)
    {
      v13 = [v9 min];
      if (!v13)
      {

        goto LABEL_60;
      }
    }
    double v44 = [(id)v7 min];
    if (v44)
    {

      if (v43)
      {
      }
    }
    else
    {
      double v45 = [v9 min];

      if (v43)
      {
      }
      if (v45)
      {
LABEL_60:
        if (a5)
        {
          v38 = (void *)MEMORY[0x1E4F28C58];
          v39 = @"Cannot add stats with and without minimum value";
          goto LABEL_84;
        }
        goto LABEL_85;
      }
    }
    v46 = [(id)v7 max];
    if (v46)
    {
      v13 = [v9 max];
      if (!v13)
      {

        goto LABEL_71;
      }
    }
    double v47 = [(id)v7 max];
    if (v47)
    {

      if (v46)
      {
      }
    }
    else
    {
      double v48 = [v9 max];

      if (v46)
      {
      }
      if (v48)
      {
LABEL_71:
        if (a5)
        {
          v38 = (void *)MEMORY[0x1E4F28C58];
          v39 = @"Cannot add stats with and without maximum value";
          goto LABEL_84;
        }
        goto LABEL_85;
      }
    }
    v49 = [(id)v7 stddev];
    if (v49)
    {
      v13 = [v9 stddev];
      if (!v13)
      {

        goto LABEL_82;
      }
    }
    double v50 = [(id)v7 stddev];
    if (v50)
    {

      if (v49)
      {
      }
    }
    else
    {
      double v51 = [v9 stddev];

      if (v49)
      {
      }
      if (v51)
      {
LABEL_82:
        if (a5)
        {
          v38 = (void *)MEMORY[0x1E4F28C58];
          v39 = @"Cannot add stats with and without stddev value";
          goto LABEL_84;
        }
        goto LABEL_85;
      }
    }
    double v53 = [(id)v7 count];
    uint64_t v54 = [v53 unsignedLongLongValue];
    v55 = [v9 count];
    unint64_t v56 = [v55 unsignedLongLongValue] + v54;

    v57 = [NSNumber numberWithUnsignedLongLong:v56];
    [(SignpostAggregationValueStats *)v11 setCount:v57];

    v58 = [(id)v7 min];

    if (v58)
    {
      v59 = NSNumber;
      v60 = [(id)v7 min];
      [v60 doubleValue];
      double v62 = v61;

      v63 = [v9 min];
      [v63 doubleValue];
      double v65 = v64;

      if (v62 >= v65) {
        double v66 = v65;
      }
      else {
        double v66 = v62;
      }
      v67 = [v59 numberWithDouble:v66];
      [(SignpostAggregationValueStats *)v11 setMin:v67];
    }
    v68 = [(id)v7 max];

    if (v68)
    {
      v69 = NSNumber;
      v70 = [(id)v7 max];
      [v70 doubleValue];
      double v72 = v71;

      v73 = [v9 max];
      [v73 doubleValue];
      double v75 = v74;

      if (v72 >= v75) {
        double v76 = v72;
      }
      else {
        double v76 = v75;
      }
      v77 = [v69 numberWithDouble:v76];
      [(SignpostAggregationValueStats *)v11 setMax:v77];
    }
    v78 = [(id)v7 stddev];

    if (v78)
    {
      v110 = [(id)v7 count];
      unint64_t v109 = [v110 unsignedLongLongValue];
      v79 = [(id)v7 total];
      [v79 doubleValue];
      double v81 = v80;
      v82 = [(id)v7 stddev];
      [v82 doubleValue];
      double v84 = v83;
      [v9 count];
      v85 = unint64_t v111 = v56;
      unint64_t v86 = [v85 unsignedLongLongValue];
      v87 = [v9 total];
      [v87 doubleValue];
      double v89 = v88;
      v90 = [v9 stddev];
      [v90 doubleValue];
      v92 = _combinedStdDev(v109, v86, v81, v84, v89, v91);
      [(SignpostAggregationValueStats *)v11 setStddev:v92];

      unint64_t v56 = v111;
    }
    v93 = [(id)v7 _rawAverage];

    if (v93)
    {
      v94 = NSNumber;
      v95 = [(id)v7 total];
      [v95 doubleValue];
      double v97 = v96;
      v98 = [v9 total];
      [v98 doubleValue];
      v100 = [v94 numberWithDouble:(v97 + v99) / (double)v56];
      [(SignpostAggregationValueStats *)v11 set_rawAverage:v100];
    }
    v101 = [(id)v7 _rawTotal];

    if (v101)
    {
      v102 = NSNumber;
      v103 = [(id)v7 _rawTotal];
      [v103 doubleValue];
      double v105 = v104;
      v106 = [v9 _rawTotal];
      [v106 doubleValue];
      v108 = [v102 numberWithDouble:v105 + v107];
      [(SignpostAggregationValueStats *)v11 set_rawTotal:v108];
    }
LABEL_26:
    uint64_t v32 = [(SignpostAggregationValueStats *)v11 _finalizeState];
    double v33 = (void *)v32;
    if (a5 && v32)
    {
      *a5 = [MEMORY[0x1E4F28C58] errorWithCode:9 description:v32];
    }
    v10 = v11;

    goto LABEL_86;
  }
  uint64_t v37 = [v9 _rawAverage];

  if (v15)
  {
  }
  if (!v37) {
    goto LABEL_40;
  }
LABEL_38:
  if (!a5) {
    goto LABEL_85;
  }
  v38 = (void *)MEMORY[0x1E4F28C58];
  v39 = @"Cannot add stats with and without average value";
LABEL_84:
  [v38 errorWithCode:9 description:v39];
  v10 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_86:

LABEL_87:

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SignpostAggregationValueStats *)a3;
  v5 = v4;
  if (v4)
  {
    if (v4 == self)
    {
      BOOL v11 = 1;
      goto LABEL_80;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = v5;
      unint64_t v7 = [(SignpostAggregationValueStats *)self _rawAverage];
      uint64_t v8 = [(SignpostAggregationValueStats *)v6 _rawAverage];
      if (v7 == (void *)v8)
      {

        goto LABEL_21;
      }
      v9 = (void *)v8;
      v10 = [(SignpostAggregationValueStats *)self _rawAverage];
      if (v10)
      {
        v55 = [(SignpostAggregationValueStats *)v6 _rawAverage];
        if (!v55) {
          goto LABEL_69;
        }
      }
      double v12 = [(SignpostAggregationValueStats *)self _rawAverage];
      if (v12
        || ([(SignpostAggregationValueStats *)v6 _rawAverage],
            (double v18 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        v13 = v9;
        uint64_t v14 = [(SignpostAggregationValueStats *)self _rawAverage];
        v15 = v6;
        double v16 = [(SignpostAggregationValueStats *)v6 _rawAverage];
        char v17 = [v14 isEqual:v16] ^ 1;

        if (v12)
        {

          v6 = v15;
          v9 = v13;
          goto LABEL_18;
        }
        double v18 = 0;
        v6 = v15;
        v9 = v13;
      }
      else
      {
        char v17 = 1;
      }

LABEL_18:
      if (v10)
      {
      }
      if (v17) {
        goto LABEL_76;
      }
LABEL_21:
      unint64_t v7 = [(SignpostAggregationValueStats *)self _rawTotal];
      uint64_t v19 = [(SignpostAggregationValueStats *)v6 _rawTotal];
      if (v7 == (void *)v19)
      {

        goto LABEL_36;
      }
      v9 = (void *)v19;
      v10 = [(SignpostAggregationValueStats *)self _rawTotal];
      if (v10)
      {
        v55 = [(SignpostAggregationValueStats *)v6 _rawTotal];
        if (!v55) {
          goto LABEL_69;
        }
      }
      v20 = [(SignpostAggregationValueStats *)self _rawTotal];
      if (v20
        || ([(SignpostAggregationValueStats *)v6 _rawTotal],
            (v27 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        v21 = v9;
        uint64_t v22 = [(SignpostAggregationValueStats *)self _rawTotal];
        v23 = v6;
        v24 = [(SignpostAggregationValueStats *)v6 _rawTotal];
        char v25 = [v22 isEqual:v24] ^ 1;

        if (v20)
        {

          v6 = v23;
          v9 = v21;
          uint64_t v26 = v55;
          if (!v10)
          {
LABEL_35:

            if (v25) {
              goto LABEL_76;
            }
LABEL_36:
            unint64_t v7 = [(SignpostAggregationValueStats *)self min];
            uint64_t v28 = [(SignpostAggregationValueStats *)v6 min];
            if (v7 == (void *)v28)
            {

              goto LABEL_51;
            }
            v9 = (void *)v28;
            v10 = [(SignpostAggregationValueStats *)self min];
            if (v10)
            {
              v55 = [(SignpostAggregationValueStats *)v6 min];
              if (!v55) {
                goto LABEL_69;
              }
            }
            v29 = [(SignpostAggregationValueStats *)self min];
            if (v29
              || ([(SignpostAggregationValueStats *)v6 min],
                  (v35 = objc_claimAutoreleasedReturnValue()) == 0))
            {
              uint64_t v30 = v9;
              v31 = [(SignpostAggregationValueStats *)self min];
              uint64_t v32 = v6;
              double v33 = [(SignpostAggregationValueStats *)v6 min];
              char v34 = [v31 isEqual:v33] ^ 1;

              if (v29)
              {

                v6 = v32;
                v9 = v30;
                goto LABEL_48;
              }
              v35 = 0;
              v6 = v32;
              v9 = v30;
            }
            else
            {
              char v34 = 1;
            }

LABEL_48:
            if (v10)
            {
            }
            if (v34) {
              goto LABEL_76;
            }
LABEL_51:
            unint64_t v7 = [(SignpostAggregationValueStats *)self max];
            uint64_t v36 = [(SignpostAggregationValueStats *)v6 max];
            if (v7 == (void *)v36)
            {

              goto LABEL_66;
            }
            v9 = (void *)v36;
            v10 = [(SignpostAggregationValueStats *)self max];
            if (v10)
            {
              v55 = [(SignpostAggregationValueStats *)v6 max];
              if (!v55) {
                goto LABEL_69;
              }
            }
            uint64_t v37 = [(SignpostAggregationValueStats *)self max];
            if (v37
              || ([(SignpostAggregationValueStats *)v6 max],
                  (double v44 = objc_claimAutoreleasedReturnValue()) == 0))
            {
              v38 = v9;
              v39 = [(SignpostAggregationValueStats *)self max];
              id v40 = v6;
              uint64_t v41 = [(SignpostAggregationValueStats *)v6 max];
              char v42 = [v39 isEqual:v41] ^ 1;

              if (v37)
              {

                v6 = v40;
                v9 = v38;
                v43 = v55;
                if (!v10)
                {
LABEL_65:

                  if ((v42 & 1) == 0)
                  {
LABEL_66:
                    unint64_t v7 = [(SignpostAggregationValueStats *)self stddev];
                    uint64_t v45 = [(SignpostAggregationValueStats *)v6 stddev];
                    if (v7 == (void *)v45)
                    {

                      goto LABEL_77;
                    }
                    v9 = (void *)v45;
                    v10 = [(SignpostAggregationValueStats *)self stddev];
                    if (v10)
                    {
                      v55 = [(SignpostAggregationValueStats *)v6 stddev];
                      if (!v55)
                      {
LABEL_69:

                        BOOL v11 = 0;
LABEL_78:

                        goto LABEL_79;
                      }
                    }
                    v46 = [(SignpostAggregationValueStats *)self stddev];
                    if (v46
                      || ([(SignpostAggregationValueStats *)v6 stddev],
                          (uint64_t v54 = objc_claimAutoreleasedReturnValue()) == 0))
                    {
                      double v47 = v9;
                      double v48 = [(SignpostAggregationValueStats *)self stddev];
                      v49 = v6;
                      double v50 = [(SignpostAggregationValueStats *)v6 stddev];
                      char v51 = [v48 isEqual:v50] ^ 1;

                      if (v46)
                      {

                        v6 = v49;
                        v9 = v47;
                        v52 = v55;
                        if (!v10) {
                          goto LABEL_75;
                        }
                        goto LABEL_74;
                      }
                      uint64_t v54 = 0;
                      v6 = v49;
                      v9 = v47;
                    }
                    else
                    {
                      char v51 = 1;
                    }
                    v52 = v55;

                    if (!v10)
                    {
LABEL_75:

                      if (v51) {
                        goto LABEL_76;
                      }
LABEL_77:
                      unint64_t v7 = [(SignpostAggregationValueStats *)self count];
                      v9 = [(SignpostAggregationValueStats *)v6 count];
                      BOOL v11 = v7 == v9;
                      goto LABEL_78;
                    }
LABEL_74:

                    goto LABEL_75;
                  }
LABEL_76:
                  BOOL v11 = 0;
LABEL_79:

                  goto LABEL_80;
                }
LABEL_64:

                goto LABEL_65;
              }
              double v44 = 0;
              v6 = v40;
              v9 = v38;
            }
            else
            {
              char v42 = 1;
            }
            v43 = v55;

            if (!v10) {
              goto LABEL_65;
            }
            goto LABEL_64;
          }
LABEL_34:

          goto LABEL_35;
        }
        v27 = 0;
        v6 = v23;
        v9 = v21;
      }
      else
      {
        char v25 = 1;
      }
      uint64_t v26 = v55;

      if (!v10) {
        goto LABEL_35;
      }
      goto LABEL_34;
    }
  }
  BOOL v11 = 0;
LABEL_80:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(SignpostAggregationValueStats);
  v5 = [(SignpostAggregationValueStats *)self count];
  [(SignpostAggregationValueStats *)v4 setCount:v5];

  v6 = [(SignpostAggregationValueStats *)self _rawAverage];
  [(SignpostAggregationValueStats *)v4 set_rawAverage:v6];

  unint64_t v7 = [(SignpostAggregationValueStats *)self _rawTotal];
  [(SignpostAggregationValueStats *)v4 set_rawTotal:v7];

  uint64_t v8 = [(SignpostAggregationValueStats *)self min];
  [(SignpostAggregationValueStats *)v4 setMin:v8];

  v9 = [(SignpostAggregationValueStats *)self max];
  [(SignpostAggregationValueStats *)v4 setMax:v9];

  v10 = [(SignpostAggregationValueStats *)self stddev];
  [(SignpostAggregationValueStats *)v4 setStddev:v10];

  return v4;
}

- (NSNumber)count
{
  return self->_count;
}

- (void)setCount:(id)a3
{
}

- (NSNumber)min
{
  return self->_min;
}

- (void)setMin:(id)a3
{
}

- (NSNumber)max
{
  return self->_max;
}

- (void)setMax:(id)a3
{
}

- (NSNumber)stddev
{
  return self->_stddev;
}

- (void)setStddev:(id)a3
{
}

- (NSNumber)_rawTotal
{
  return self->__rawTotal;
}

- (void)set_rawTotal:(id)a3
{
}

- (NSNumber)_rawAverage
{
  return self->__rawAverage;
}

- (void)set_rawAverage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__rawAverage, 0);
  objc_storeStrong((id *)&self->__rawTotal, 0);
  objc_storeStrong((id *)&self->_stddev, 0);
  objc_storeStrong((id *)&self->_max, 0);
  objc_storeStrong((id *)&self->_min, 0);

  objc_storeStrong((id *)&self->_count, 0);
}

@end