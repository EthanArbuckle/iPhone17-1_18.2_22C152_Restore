@interface PDMeasurement
- (BOOL)enumerateHistogramBucketsWithError:(id *)a3 usingBlock:(id)a4;
- (BOOL)enumeratePercentilesWithError:(id *)a3 usingBlock:(id)a4;
- (BOOL)isComparableTo:(id)a3;
- (BOOL)isComparableTo:(id)a3 ignoringNullableVariables:(id)a4;
- (BOOL)isContext;
- (BOOL)isLike:(id)a3;
- (BOOL)isSummary;
- (BOOL)largerBetter;
- (BOOL)matchesMetricFilter:(id)a3;
- (BOOL)matchesVariables:(id)a3 ignoringMissing:(BOOL)a4;
- (NSDictionary)labels;
- (NSDictionary)measurement;
- (NSDictionary)variables;
- (NSNumber)maximum;
- (NSNumber)mean;
- (NSNumber)minimum;
- (NSNumber)sampleCount;
- (NSNumber)standardDeviation;
- (NSNumber)value;
- (NSString)cachedMetricFilter;
- (NSString)metric;
- (NSString)unitString;
- (PDContainer)container;
- (PDMeasurement)initWithContainer:(id)a3 dictionary:(id)a4 group:(unint64_t)a5 error:(id *)a6;
- (id)description;
- (id)metricFilter;
- (id)metricFilterIgnoringNullableVariables:(id)a3;
- (unint64_t)group;
- (unint64_t)histogramBucketCount;
- (unint64_t)percentileCount;
- (void)setCachedMetricFilter:(id)a3;
- (void)setContainer:(id)a3;
- (void)setContext:(BOOL)a3;
- (void)setGroup:(unint64_t)a3;
- (void)setLabels:(id)a3;
- (void)setLargerBetter:(BOOL)a3;
- (void)setMaximum:(id)a3;
- (void)setMean:(id)a3;
- (void)setMeasurement:(id)a3;
- (void)setMetric:(id)a3;
- (void)setMinimum:(id)a3;
- (void)setSampleCount:(id)a3;
- (void)setStandardDeviation:(id)a3;
- (void)setSummary:(BOOL)a3;
- (void)setUnitString:(id)a3;
- (void)setValue:(id)a3;
- (void)setVariables:(id)a3;
@end

@implementation PDMeasurement

- (PDMeasurement)initWithContainer:(id)a3 dictionary:(id)a4 group:(unint64_t)a5 error:(id *)a6
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  v95.receiver = self;
  v95.super_class = (Class)PDMeasurement;
  v12 = [(PDMeasurement *)&v95 init];
  v13 = v12;
  if (v12)
  {
    [(PDMeasurement *)v12 setContainer:v10];
    [(PDMeasurement *)v13 setMeasurement:v11];
    [(PDMeasurement *)v13 setGroup:a5];
    v14 = [v11 objectForKeyedSubscript:@"metric"];
    if (!v14 || (unint64_t v15 = 0x1E4F29000uLL, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      handle_malformed_data(a6, @"measurement metric");
      v24 = (PDMeasurement *)objc_claimAutoreleasedReturnValue();
LABEL_54:

      goto LABEL_55;
    }
    [(PDMeasurement *)v13 setMetric:v14];
    v16 = [v11 objectForKeyedSubscript:@"unit"];
    if (!v16 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      handle_malformed_data(a6, @"measurement unit");
      v24 = (PDMeasurement *)objc_claimAutoreleasedReturnValue();
LABEL_53:

      goto LABEL_54;
    }
    v79 = a6;
    [(PDMeasurement *)v13 setUnitString:v16];
    uint64_t v17 = [v11 objectForKeyedSubscript:@"variables"];
    v78 = (void *)v17;
    if (v17)
    {
      uint64_t v18 = v17;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        handle_malformed_data(a6, @"measurement variables");
        v24 = (PDMeasurement *)objc_claimAutoreleasedReturnValue();
LABEL_52:

        goto LABEL_53;
      }
      v19 = [v10 variables];
      uint64_t v20 = [v19 count];

      if (!v20)
      {
        [(PDMeasurement *)v13 setVariables:v18];
LABEL_15:
        [v11 objectForKeyedSubscript:@"labels"];
        v80 = id v86 = v11;
        if (v80)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            handle_malformed_data(v79, @"measurement labels");
            v24 = (PDMeasurement *)objc_claimAutoreleasedReturnValue();
LABEL_51:

            goto LABEL_52;
          }
          v25 = [v10 labels];
          uint64_t v26 = [v25 count];

          id v76 = v10;
          if (v26)
          {
            v27 = [v10 labels];
            v28 = (void *)[v27 mutableCopy];
            [(PDMeasurement *)v13 setLabels:v28];
          }
          else
          {
            v27 = [MEMORY[0x1E4F1CA60] dictionary];
            [(PDMeasurement *)v13 setLabels:v27];
          }

          long long v93 = 0u;
          long long v94 = 0u;
          long long v91 = 0u;
          long long v92 = 0u;
          v30 = v80;
          v29 = [v80 allKeys];
          uint64_t v84 = [v29 countByEnumeratingWithState:&v91 objects:v97 count:16];
          if (v84)
          {
            v81 = v29;
            uint64_t v82 = *(void *)v92;
            while (2)
            {
              uint64_t v31 = 0;
              do
              {
                if (*(void *)v92 != v82) {
                  objc_enumerationMutation(v29);
                }
                uint64_t v32 = *(void *)(*((void *)&v91 + 1) + 8 * v31);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  handle_malformed_data(v79, @"measurement label key");
                  objc_claimAutoreleasedReturnValue();

                  v24 = 0;
                  id v10 = v76;
                  goto LABEL_51;
                }
                unint64_t v33 = v15;
                v34 = [v30 objectForKeyedSubscript:v32];
                v35 = [(PDMeasurement *)v13 labels];
                v36 = [v35 objectForKeyedSubscript:v32];

                if (v36)
                {
                  [v36 addObject:v34];
                }
                else
                {
                  v37 = [(PDMeasurement *)v13 labels];
                  [MEMORY[0x1E4F1CA80] setWithObject:v34];
                  v38 = v14;
                  v40 = v39 = v16;
                  [v37 setValue:v40 forKey:v32];

                  v16 = v39;
                  v14 = v38;
                  v30 = v80;
                }
                ++v31;
                unint64_t v15 = v33;
                id v11 = v86;
                v29 = v81;
              }
              while (v84 != v31);
              uint64_t v84 = [v81 countByEnumeratingWithState:&v91 objects:v97 count:16];
              if (v84) {
                continue;
              }
              break;
            }
          }
          id v10 = v76;
        }
        else
        {
          v29 = [v10 labels];
          [(PDMeasurement *)v13 setLabels:v29];
        }

        v41 = [v11 objectForKeyedSubscript:@"larger_better"];
        if (not_a_number(v41, v79, @"measurement larger_better"))
        {
          v24 = 0;
        }
        else
        {
          v85 = v41;
          unint64_t v42 = v15;
          if (v41) {
            uint64_t v43 = [v41 BOOLValue];
          }
          else {
            uint64_t v43 = 0;
          }
          -[PDMeasurement setLargerBetter:](v13, "setLargerBetter:", v43, v10, v78);
          v44 = [v11 objectForKeyedSubscript:@"value"];
          [(PDMeasurement *)v13 setValue:v44];

          v45 = [(PDMeasurement *)v13 value];
          char v46 = not_a_number(v45, v79, @"measurement value");

          if (v46) {
            goto LABEL_48;
          }
          v47 = [v11 objectForKeyedSubscript:@"samples"];
          [(PDMeasurement *)v13 setSampleCount:v47];

          v48 = [(PDMeasurement *)v13 sampleCount];
          char v49 = not_a_number(v48, v79, @"measurement samples");

          if (v49) {
            goto LABEL_48;
          }
          v50 = [v11 objectForKeyedSubscript:@"mean"];
          [(PDMeasurement *)v13 setMean:v50];

          v51 = [(PDMeasurement *)v13 mean];
          char v52 = not_a_number(v51, v79, @"measurement mean");

          if (v52) {
            goto LABEL_48;
          }
          v53 = [v11 objectForKeyedSubscript:@"std_dev"];
          [(PDMeasurement *)v13 setStandardDeviation:v53];

          v54 = [(PDMeasurement *)v13 standardDeviation];
          char v55 = not_a_number(v54, v79, @"measurement std_dev");

          if (v55) {
            goto LABEL_48;
          }
          v56 = [v11 objectForKeyedSubscript:@"minimum"];
          [(PDMeasurement *)v13 setMinimum:v56];

          v57 = [(PDMeasurement *)v13 minimum];
          char v58 = not_a_number(v57, v79, @"measurement minimum");

          if (v58) {
            goto LABEL_48;
          }
          v59 = [v11 objectForKeyedSubscript:@"maximum"];
          [(PDMeasurement *)v13 setMaximum:v59];

          v60 = [(PDMeasurement *)v13 maximum];
          char v61 = not_a_number(v60, v79, @"measurement maximum");

          if (v61)
          {
LABEL_48:
            v24 = 0;
          }
          else
          {
            v83 = v16;
            long long v89 = 0u;
            long long v90 = 0u;
            long long v87 = 0u;
            long long v88 = 0u;
            v63 = [(PDMeasurement *)v13 measurement];
            v64 = [v63 objectForKeyedSubscript:@"tags"];

            v65 = v64;
            uint64_t v66 = [v64 countByEnumeratingWithState:&v87 objects:v96 count:16];
            if (v66)
            {
              uint64_t v67 = v66;
              uint64_t v68 = *(void *)v88;
              do
              {
                for (uint64_t i = 0; i != v67; ++i)
                {
                  if (*(void *)v88 != v68) {
                    objc_enumerationMutation(v65);
                  }
                  v70 = *(void **)(*((void *)&v87 + 1) + 8 * i);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    [*(id *)(v42 + 24) stringWithUTF8String:pdtag_summary];
                    v72 = unint64_t v71 = v42;
                    int v73 = [v70 isEqualToString:v72];

                    if (v73)
                    {
                      [(PDMeasurement *)v13 setSummary:1];
                      unint64_t v42 = v71;
                      id v11 = v86;
                    }
                    else
                    {
                      v74 = [*(id *)(v71 + 24) stringWithUTF8String:pdtag_context];
                      int v75 = [v70 isEqualToString:v74];

                      unint64_t v42 = v71;
                      id v11 = v86;
                      if (v75) {
                        [(PDMeasurement *)v13 setContext:1];
                      }
                    }
                  }
                }
                uint64_t v67 = [v65 countByEnumeratingWithState:&v87 objects:v96 count:16];
              }
              while (v67);
            }

            v24 = v13;
            v16 = v83;
          }
          id v10 = v77;
          v41 = v85;
        }

        goto LABEL_51;
      }
      v21 = [v10 variables];
      v22 = (void *)[v21 mutableCopy];
      [(PDMeasurement *)v13 setVariables:v22];

      v23 = [(PDMeasurement *)v13 variables];
      [v23 setValuesForKeysWithDictionary:v18];
    }
    else
    {
      v23 = [v10 variables];
      [(PDMeasurement *)v13 setVariables:v23];
    }

    goto LABEL_15;
  }
  v24 = 0;
LABEL_55:

  return v24;
}

- (id)description
{
  v3 = NSString;
  v4 = [(PDMeasurement *)self metric];
  v5 = [(PDMeasurement *)self unitString];
  v6 = [v3 stringWithFormat:@"PDMeasurement: %@ (%@)", v4, v5];

  return v6;
}

- (BOOL)matchesMetricFilter:(id)a3
{
  id v4 = a3;
  v5 = [(PDMeasurement *)self container];
  v6 = strip_container_prefix(v5, v4);

  v7 = get_metric_filter_metric(v6);
  v8 = [(PDMeasurement *)self metric];
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    id v10 = get_metric_filter_variables(v6, 0);
    if (v10) {
      BOOL v11 = [(PDMeasurement *)self matchesVariables:v10 ignoringMissing:0];
    }
    else {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)matchesVariables:(id)a3 ignoringMissing:(BOOL)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        v12 = [(PDMeasurement *)self variables];
        v13 = [v12 objectForKeyedSubscript:v11];

        if (!a4 && !v13
          || v13
          && ([v6 objectForKeyedSubscript:v11],
              v14 = objc_claimAutoreleasedReturnValue(),
              char v15 = [v13 isEqual:v14],
              v14,
              (v15 & 1) == 0))
        {

          BOOL v16 = 0;
          goto LABEL_15;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      BOOL v16 = 1;
      if (v8) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v16 = 1;
  }
LABEL_15:

  return v16;
}

- (id)metricFilter
{
  v3 = [(PDMeasurement *)self cachedMetricFilter];

  if (!v3)
  {
    id v4 = [(PDMeasurement *)self metricFilterIgnoringNullableVariables:0];
    [(PDMeasurement *)self setCachedMetricFilter:v4];
  }
  return [(PDMeasurement *)self cachedMetricFilter];
}

- (id)metricFilterIgnoringNullableVariables:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PDMeasurement *)self container];
  id v6 = [v5 name];
  uint64_t v7 = (void *)[v6 mutableCopy];

  uint64_t v8 = [(PDMeasurement *)self metric];
  [v7 appendFormat:@".%@", v8];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v9 = [(PDMeasurement *)self variables];
  id v10 = [v9 allKeys];
  uint64_t v11 = [v10 sortedArrayUsingSelector:sel_compare_];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        if (!v4 || ([v4 containsObject:*(void *)(*((void *)&v20 + 1) + 8 * i)] & 1) == 0)
        {
          uint64_t v17 = [(PDMeasurement *)self variables];
          long long v18 = [v17 objectForKeyedSubscript:v16];
          [v7 appendFormat:@",%@=%@", v16, v18];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }

  return v7;
}

- (BOOL)isComparableTo:(id)a3
{
  return [(PDMeasurement *)self isComparableTo:a3 ignoringNullableVariables:0];
}

- (BOOL)isLike:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) == 0 || [(PDMeasurement *)self isComparableTo:v4];

  return v5;
}

- (BOOL)isComparableTo:(id)a3 ignoringNullableVariables:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PDMeasurement *)self metric];
  uint64_t v9 = [v6 metric];
  if (![v8 isEqualToString:v9])
  {
    char v15 = 0;
LABEL_10:

    goto LABEL_11;
  }
  id v10 = [(PDMeasurement *)self container];
  uint64_t v11 = [v6 container];
  int v12 = [v10 isComparableTo:v11];

  if (v12)
  {
    if (v7 && [v7 count])
    {
      uint64_t v13 = [(PDMeasurement *)self variables];
      uint64_t v8 = (void *)[v13 mutableCopy];

      [v8 removeObjectsForKeys:v7];
      uint64_t v14 = [v6 variables];
      uint64_t v9 = (void *)[v14 mutableCopy];

      [v9 removeObjectsForKeys:v7];
    }
    else
    {
      uint64_t v8 = [(PDMeasurement *)self variables];
      uint64_t v9 = [v6 variables];
    }
    char v15 = [v8 isEqualToDictionary:v9];
    goto LABEL_10;
  }
  char v15 = 0;
LABEL_11:

  return v15;
}

- (unint64_t)histogramBucketCount
{
  v2 = [(PDMeasurement *)self measurement];
  v3 = [v2 objectForKeyedSubscript:@"histogram"];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v3 count])
  {
    id v4 = objc_msgSend(v3, "objectAtIndexedSubscript:", objc_msgSend(v3, "count") - 1);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v5 = [[PDBucket alloc] initWithDictionary:v4 error:0];
      id v6 = v5;
      if (v5)
      {
        BOOL v7 = [(PDBucket *)v5 count] == 0;
        unint64_t v8 = [v3 count] - v7;
      }
      else
      {
        unint64_t v8 = 0;
      }
    }
    else
    {
      unint64_t v8 = 0;
    }
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (BOOL)enumerateHistogramBucketsWithError:(id *)a3 usingBlock:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void *, unsigned char *))a4;
  BOOL v7 = [(PDMeasurement *)self measurement];
  unint64_t v8 = [v7 objectForKeyedSubscript:@"histogram"];

  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = [v8 count];
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v10 = v8;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = 0;
        uint64_t v14 = 0;
        uint64_t v15 = *(void *)v35;
        uint64_t v16 = v9 - 1;
        char v31 = 1;
        id obj = v10;
        v28 = self;
        uint64_t v29 = v9 - 1;
        while (2)
        {
          uint64_t v17 = 0;
          uint64_t v18 = v16 - v13;
          uint64_t v30 = v13 + v12;
          long long v19 = v14;
          do
          {
            if (*(void *)v35 != v15) {
              objc_enumerationMutation(obj);
            }
            uint64_t v20 = *(void *)(*((void *)&v34 + 1) + 8 * v17);
            if (!v20 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              id v26 = (id)handle_malformed_data(a3, @"histogram bucket");
              BOOL v22 = 0;
LABEL_25:

              goto LABEL_26;
            }
            long long v21 = [[PDBucket alloc] initWithDictionary:v20 error:a3];
            uint64_t v14 = v21;
            BOOL v22 = v21 != 0;
            if (!v21) {
              goto LABEL_24;
            }
            if (v19)
            {
              if (v18 == v17) {
                v31 &= [(PDBucket *)v21 count] != 0;
              }
              [(PDBucket *)v14 lowerInclusiveBound];
              -[PDBucket setUpperBound:](v19, "setUpperBound:");
              [(PDBucket *)v19 setHasInclusiveUpperBound:0];
              char v33 = 0;
              v6[2](v6, v19, &v33);
              if (v33)
              {
LABEL_24:

                goto LABEL_25;
              }
            }

            ++v17;
            long long v19 = v14;
          }
          while (v12 != v17);
          uint64_t v12 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
          uint64_t v16 = v29;
          uint64_t v13 = v30;
          if (v12) {
            continue;
          }
          break;
        }

        if (v31)
        {
          long long v23 = [(PDMeasurement *)v28 maximum];
          if (v23)
          {
            v24 = [(PDMeasurement *)v28 maximum];
            [v24 doubleValue];
            -[PDBucket setUpperBound:](v14, "setUpperBound:");
          }
          else
          {
            [(PDBucket *)v14 setUpperBound:1.79769313e308];
          }

          BOOL v22 = 1;
          [(PDBucket *)v14 setHasInclusiveUpperBound:1];
          char v33 = 0;
          v6[2](v6, v14, &v33);
        }
        else
        {
          BOOL v22 = 1;
        }
        long long v19 = v14;
      }
      else
      {

        long long v19 = 0;
        BOOL v22 = 1;
      }
LABEL_26:
    }
    else
    {
      id v25 = (id)handle_malformed_data(a3, @"measurement histogram");
      BOOL v22 = 0;
    }
  }
  else
  {
    BOOL v22 = 1;
  }

  return v22;
}

- (unint64_t)percentileCount
{
  v2 = [(PDMeasurement *)self measurement];
  v3 = [v2 objectForKeyedSubscript:@"percentiles"];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unint64_t v4 = [v3 count];
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

- (BOOL)enumeratePercentilesWithError:(id *)a3 usingBlock:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  BOOL v7 = (void (**)(id, unsigned char *, double, double))a4;
  unint64_t v8 = [(PDMeasurement *)self measurement];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"percentiles"];

  if (!v9)
  {
    char v21 = 1;
    goto LABEL_28;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v22 = (id)handle_malformed_data(a3, @"measurement percentiles");
    char v21 = 0;
    goto LABEL_28;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (!v11)
  {
    char v20 = 1;
    goto LABEL_27;
  }
  uint64_t v12 = v11;
  uint64_t v13 = *(void *)v29;
  while (2)
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v29 != v13) {
        objc_enumerationMutation(v10);
      }
      uint64_t v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
      if (!v14 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        id v23 = (id)handle_malformed_data(a3, @"measurement percentile");
LABEL_23:
        char v20 = 0;
        LOBYTE(i) = 0;
        goto LABEL_27;
      }
      uint64_t v15 = [v14 objectForKeyedSubscript:@"%"];
      if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        id v24 = (id)handle_malformed_data(a3, @"percentile %");

        goto LABEL_23;
      }
      uint64_t v16 = [v14 objectForKeyedSubscript:@"value"];
      if (!v16 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        id v25 = (id)handle_malformed_data(a3, @"percentile value");
        LOBYTE(i) = 0;
LABEL_26:

        char v20 = 0;
        goto LABEL_27;
      }
      char v27 = 0;
      [v15 doubleValue];
      double v18 = v17;
      [v16 doubleValue];
      v7[2](v7, &v27, v18, v19);
      if (v27)
      {
        LOBYTE(i) = 1;
        goto LABEL_26;
      }
    }
    uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
    char v20 = 1;
    if (v12) {
      continue;
    }
    break;
  }
LABEL_27:

  char v21 = v20 | i;
LABEL_28:

  return v21 & 1;
}

- (NSString)metric
{
  return self->_metric;
}

- (void)setMetric:(id)a3
{
}

- (NSString)unitString
{
  return self->_unitString;
}

- (void)setUnitString:(id)a3
{
}

- (NSDictionary)variables
{
  return self->_variables;
}

- (void)setVariables:(id)a3
{
}

- (NSDictionary)labels
{
  return self->_labels;
}

- (void)setLabels:(id)a3
{
}

- (BOOL)largerBetter
{
  return self->_largerBetter;
}

- (void)setLargerBetter:(BOOL)a3
{
  self->_largerBetter = a3;
}

- (unint64_t)group
{
  return self->_group;
}

- (void)setGroup:(unint64_t)a3
{
  self->_group = a3;
}

- (NSNumber)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (NSNumber)sampleCount
{
  return self->_sampleCount;
}

- (void)setSampleCount:(id)a3
{
}

- (NSNumber)mean
{
  return self->_mean;
}

- (void)setMean:(id)a3
{
}

- (NSNumber)standardDeviation
{
  return self->_standardDeviation;
}

- (void)setStandardDeviation:(id)a3
{
}

- (NSNumber)minimum
{
  return self->_minimum;
}

- (void)setMinimum:(id)a3
{
}

- (NSNumber)maximum
{
  return self->_maximum;
}

- (void)setMaximum:(id)a3
{
}

- (BOOL)isSummary
{
  return self->_summary;
}

- (void)setSummary:(BOOL)a3
{
  self->_summary = a3;
}

- (BOOL)isContext
{
  return self->_context;
}

- (void)setContext:(BOOL)a3
{
  self->_context = a3;
}

- (NSDictionary)measurement
{
  return self->_measurement;
}

- (void)setMeasurement:(id)a3
{
}

- (PDContainer)container
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_container);
  return (PDContainer *)WeakRetained;
}

- (void)setContainer:(id)a3
{
}

- (NSString)cachedMetricFilter
{
  return self->_cachedMetricFilter;
}

- (void)setCachedMetricFilter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedMetricFilter, 0);
  objc_destroyWeak((id *)&self->_container);
  objc_storeStrong((id *)&self->_measurement, 0);
  objc_storeStrong((id *)&self->_maximum, 0);
  objc_storeStrong((id *)&self->_minimum, 0);
  objc_storeStrong((id *)&self->_standardDeviation, 0);
  objc_storeStrong((id *)&self->_mean, 0);
  objc_storeStrong((id *)&self->_sampleCount, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_variables, 0);
  objc_storeStrong((id *)&self->_unitString, 0);
  objc_storeStrong((id *)&self->_metric, 0);
}

@end