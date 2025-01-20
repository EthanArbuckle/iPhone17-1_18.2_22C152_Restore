@interface PDAggregateMeasurement
- (BOOL)validMax;
- (BOOL)validMin;
- (NSMutableDictionary)labels;
- (NSMutableDictionary)variables;
- (NSString)metric;
- (NSString)unitString;
- (PDAggregateMeasurement)initWithContainer:(id)a3 metric:(id)a4 unitString:(id)a5;
- (PDContainer)container;
- (PDMeasurement)measurement;
- (double)max;
- (double)min;
- (pooled_mean)stats_mean;
- (running_mean)values_mean;
- (unint64_t)samples;
- (void)dealloc;
- (void)setContainer:(id)a3;
- (void)setLabels:(id)a3;
- (void)setMax:(double)a3;
- (void)setMetric:(id)a3;
- (void)setMin:(double)a3;
- (void)setSamples:(unint64_t)a3;
- (void)setStats_mean:(pooled_mean *)a3;
- (void)setUnitString:(id)a3;
- (void)setValidMax:(BOOL)a3;
- (void)setValidMin:(BOOL)a3;
- (void)setValues_mean:(running_mean *)a3;
- (void)setVariables:(id)a3;
- (void)updateWithMeasurement:(id)a3;
@end

@implementation PDAggregateMeasurement

- (PDAggregateMeasurement)initWithContainer:(id)a3 metric:(id)a4 unitString:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PDAggregateMeasurement;
  v11 = [(PDAggregateMeasurement *)&v15 init];
  v12 = v11;
  if (v11)
  {
    [(PDAggregateMeasurement *)v11 setContainer:v8];
    [(PDAggregateMeasurement *)v12 setMetric:v9];
    [(PDAggregateMeasurement *)v12 setUnitString:v10];
    [(PDAggregateMeasurement *)v12 setValues_mean:malloc_type_calloc(1uLL, 0x18uLL, 0x1000040504FFAC1uLL)];
    [(PDAggregateMeasurement *)v12 setStats_mean:malloc_type_calloc(1uLL, 0x30uLL, 0x1000040EED21634uLL)];
    [(PDAggregateMeasurement *)v12 setValidMin:1];
    [(PDAggregateMeasurement *)v12 setMin:1.79769313e308];
    [(PDAggregateMeasurement *)v12 setValidMax:1];
    [(PDAggregateMeasurement *)v12 setMax:2.22507386e-308];
    v13 = v12;
  }

  return v12;
}

- (void)dealloc
{
  free([(PDAggregateMeasurement *)self values_mean]);
  free([(PDAggregateMeasurement *)self stats_mean]);
  v3.receiver = self;
  v3.super_class = (Class)PDAggregateMeasurement;
  [(PDAggregateMeasurement *)&v3 dealloc];
}

- (void)updateWithMeasurement:(id)a3
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PDAggregateMeasurement *)self variables];

  v90 = self;
  id v92 = v4;
  if (v5)
  {
    long long v99 = 0u;
    long long v100 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    v6 = [(PDAggregateMeasurement *)self variables];
    v7 = [v6 allKeys];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v97 objects:v102 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v98;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v98 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v97 + 1) + 8 * i);
          v13 = objc_msgSend(v4, "variables", v90);
          v14 = [v13 objectForKeyedSubscript:v12];
          objc_super v15 = [(PDAggregateMeasurement *)self variables];
          v16 = [v15 objectForKeyedSubscript:v12];
          char v17 = [v14 isEqual:v16];

          self = v90;
          if ((v17 & 1) == 0)
          {
            v18 = [(PDAggregateMeasurement *)v90 variables];
            [v18 removeObjectForKey:v12];
          }
          id v4 = v92;
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v97 objects:v102 count:16];
      }
      while (v9);
    }
  }
  else
  {
    v19 = [v4 variables];
    v20 = (void *)[v19 mutableCopy];
    [(PDAggregateMeasurement *)self setVariables:v20];
  }
  v21 = [(PDAggregateMeasurement *)self labels];

  if (!v21)
  {
    v22 = [MEMORY[0x1E4F1CA60] dictionary];
    [(PDAggregateMeasurement *)self setLabels:v22];
  }
  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  v23 = [v4 labels];
  v24 = [v23 allKeys];

  v25 = v24;
  uint64_t v26 = [v24 countByEnumeratingWithState:&v93 objects:v101 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v94;
    do
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v94 != v28) {
          objc_enumerationMutation(v25);
        }
        uint64_t v30 = *(void *)(*((void *)&v93 + 1) + 8 * j);
        v31 = [(PDAggregateMeasurement *)self labels];
        v32 = [v31 objectForKeyedSubscript:v30];

        if (v32)
        {
          v33 = [v4 labels];
          v34 = [v33 objectForKeyedSubscript:v30];
          [v32 unionSet:v34];
        }
        else
        {
          v33 = [(PDAggregateMeasurement *)self labels];
          v35 = (void *)MEMORY[0x1E4F1CA80];
          v34 = [v4 labels];
          v36 = [v34 objectForKeyedSubscript:v30];
          v37 = [v35 setWithSet:v36];
          [v33 setValue:v37 forKey:v30];

          self = v91;
          id v4 = v92;
        }
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v93 objects:v101 count:16];
    }
    while (v27);
  }

  v38 = [v4 value];

  if (v38)
  {
    v39 = [(PDAggregateMeasurement *)self values_mean];
    v40 = [v4 value];
    [v40 doubleValue];
    uint64_t v41 = v39->var2 + 1;
    double v43 = v42 - v39->var0;
    double v44 = v39->var0 + v43 / (double)(unint64_t)v41;
    double v45 = v39->var1 + v43 * (v42 - v44);
    v39->var0 = v44;
    v39->var1 = v45;
    v39->var2 = v41;

    v46 = [v4 value];
    [v46 doubleValue];
    double v48 = v47;
    [(PDAggregateMeasurement *)self min];
    double v50 = v49;

    if (v48 < v50)
    {
      v51 = [v4 value];
      [v51 doubleValue];
      -[PDAggregateMeasurement setMin:](self, "setMin:");
    }
    v52 = [v4 value];
    [v52 doubleValue];
    double v54 = v53;
    [(PDAggregateMeasurement *)self max];
    double v56 = v55;

    if (v54 > v56)
    {
      v57 = [v4 value];
      [v57 doubleValue];
      -[PDAggregateMeasurement setMax:](self, "setMax:");
    }
    [(PDAggregateMeasurement *)self setSamples:[(PDAggregateMeasurement *)self samples] + 1];
  }
  else
  {
    v58 = [v4 sampleCount];

    if (v58)
    {
      uint64_t v59 = [v4 mean];
      if (v59)
      {
        v60 = (void *)v59;
        v61 = [v4 standardDeviation];

        if (v61)
        {
          v62 = [(PDAggregateMeasurement *)self stats_mean];
          v63 = [v4 sampleCount];
          unint64_t v64 = [v63 unsignedIntegerValue];
          v65 = [v4 mean];
          [v65 doubleValue];
          double v67 = v66;
          v68 = [v4 standardDeviation];
          [v68 doubleValue];
          int64x2_t v69 = vdupq_n_s64(1uLL);
          v69.i64[0] = v64;
          *(int64x2_t *)&v62->var2 = vaddq_s64(*(int64x2_t *)&v62->var2, v69);
          v69.i64[0] = *(void *)&v62->var1.var0;
          double v71 = v70 * v70 * (double)(v64 - 1) - v62->var1.var1;
          v62->var1.var0 = *(double *)v69.i64 + v71;
          v62->var1.var1 = *(double *)v69.i64 + v71 - *(double *)v69.i64 - v71;
          double v72 = v67 * (double)v64 - v62->var0.var1;
          double v73 = v62->var0.var0 + v72;
          double v74 = v73 - v62->var0.var0 - v72;
          v62->var0.var0 = v73;
          v62->var0.var1 = v74;
        }
      }
      v75 = [v4 minimum];

      if (v75)
      {
        v76 = [v4 minimum];
        [v76 doubleValue];
        double v78 = v77;
        [(PDAggregateMeasurement *)self min];
        double v80 = v79;

        if (v78 < v80)
        {
          v81 = [v4 minimum];
          [v81 doubleValue];
          -[PDAggregateMeasurement setMin:](self, "setMin:");
        }
      }
      else
      {
        [(PDAggregateMeasurement *)self setValidMin:0];
      }
      v82 = [v4 maximum];

      if (v82)
      {
        v83 = [v4 maximum];
        [v83 doubleValue];
        double v85 = v84;
        [(PDAggregateMeasurement *)self max];
        double v87 = v86;

        if (v85 > v87)
        {
          v88 = [v4 maximum];
          [v88 doubleValue];
          -[PDAggregateMeasurement setMax:](self, "setMax:");
        }
      }
      else
      {
        [(PDAggregateMeasurement *)self setValidMax:0];
      }
      v89 = [v4 sampleCount];
      -[PDAggregateMeasurement setSamples:](self, "setSamples:", -[PDAggregateMeasurement samples](self, "samples") + [v89 unsignedIntegerValue]);
    }
  }
}

- (PDMeasurement)measurement
{
  objc_super v3 = objc_alloc_init(PDMeasurement);
  id v4 = [(PDAggregateMeasurement *)self container];
  [(PDMeasurement *)v3 setContainer:v4];

  v5 = [(PDAggregateMeasurement *)self metric];
  [(PDMeasurement *)v3 setMetric:v5];

  v6 = [(PDAggregateMeasurement *)self unitString];
  [(PDMeasurement *)v3 setUnitString:v6];

  v7 = [(PDAggregateMeasurement *)self variables];
  [(PDMeasurement *)v3 setVariables:v7];

  uint64_t v8 = [(PDAggregateMeasurement *)self labels];
  [(PDMeasurement *)v3 setLabels:v8];

  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", -[PDAggregateMeasurement samples](self, "samples"));
  [(PDMeasurement *)v3 setSampleCount:v9];

  if ((void)[(PDAggregateMeasurement *)self stats_mean][40]
    && (void)[(PDAggregateMeasurement *)self values_mean][16])
  {
    unint64_t v10 = (unint64_t)[(PDAggregateMeasurement *)self stats_mean][40];
    v11 = [(PDAggregateMeasurement *)self stats_mean];
    double v12 = v11->var0.var0 / (double)v11->var2;
    v13 = [(PDAggregateMeasurement *)self stats_mean];
    double v14 = sqrt(v13->var1.var0 / (double)(v13->var2 - v13->var3));
    double v15 = v14 * v14 * (double)(v10 - 1);
    double v16 = 0.0;
    double v17 = v15 + 0.0;
    double v18 = v15 + 0.0 - v15;
    double v19 = v12 * (double)v10;
    double v20 = v19 + 0.0;
    double v21 = v19 + 0.0 - v19;
    unint64_t v22 = (unint64_t)[(PDAggregateMeasurement *)self values_mean][16];
    double v23 = *(double *)[(PDAggregateMeasurement *)self values_mean];
    v24 = [(PDAggregateMeasurement *)self values_mean];
    unint64_t var2 = v24->var2;
    if (var2 >= 2) {
      double v16 = sqrt(v24->var1 / (double)(var2 - 1));
    }
    unint64_t v26 = v22 + v10;
    uint64_t v27 = [MEMORY[0x1E4F28ED0] numberWithDouble:(v20 + v23 * (double)v22 - v21) / (double)(v22 + v10)];
    [(PDMeasurement *)v3 setMean:v27];

    uint64_t v28 = (void *)MEMORY[0x1E4F28ED0];
    double v29 = sqrt((v17 + v16 * v16 * (double)(v22 - 1) - v18) / (double)(v26 - 2));
    goto LABEL_10;
  }
  if ((void)[(PDAggregateMeasurement *)self stats_mean][40])
  {
    uint64_t v30 = (void *)MEMORY[0x1E4F28ED0];
    v31 = [(PDAggregateMeasurement *)self stats_mean];
    v32 = [v30 numberWithDouble:v31->var0.var0 / (double)v31->var2];
    [(PDMeasurement *)v3 setMean:v32];

    v33 = (void *)MEMORY[0x1E4F28ED0];
    v34 = [(PDAggregateMeasurement *)self stats_mean];
    double var0 = v34->var1.var0;
    unint64_t v36 = v34->var2 - v34->var3;
  }
  else
  {
    if (!(void)[(PDAggregateMeasurement *)self values_mean][16])
    {
      double v48 = 0;
      goto LABEL_17;
    }
    double v50 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithDouble:", *(double *)-[PDAggregateMeasurement values_mean](self, "values_mean"));
    [(PDMeasurement *)v3 setMean:v50];

    v33 = (void *)MEMORY[0x1E4F28ED0];
    v51 = [(PDAggregateMeasurement *)self values_mean];
    unint64_t v52 = v51->var2;
    double v29 = 0.0;
    if (v52 < 2) {
      goto LABEL_9;
    }
    double var0 = v51->var1;
    unint64_t v36 = v52 - 1;
  }
  double v29 = sqrt(var0 / (double)v36);
LABEL_9:
  uint64_t v28 = v33;
LABEL_10:
  v37 = [v28 numberWithDouble:v29];
  [(PDMeasurement *)v3 setStandardDeviation:v37];

  uint64_t v38 = [(PDMeasurement *)v3 sampleCount];
  if (v38)
  {
    v39 = (void *)v38;
    BOOL v40 = [(PDAggregateMeasurement *)self validMin];

    if (v40)
    {
      uint64_t v41 = (void *)MEMORY[0x1E4F28ED0];
      [(PDAggregateMeasurement *)self min];
      double v42 = objc_msgSend(v41, "numberWithDouble:");
      [(PDMeasurement *)v3 setMinimum:v42];
    }
  }
  uint64_t v43 = [(PDMeasurement *)v3 sampleCount];
  if (v43)
  {
    double v44 = (void *)v43;
    BOOL v45 = [(PDAggregateMeasurement *)self validMax];

    if (v45)
    {
      v46 = (void *)MEMORY[0x1E4F28ED0];
      [(PDAggregateMeasurement *)self max];
      double v47 = objc_msgSend(v46, "numberWithDouble:");
      [(PDMeasurement *)v3 setMaximum:v47];
    }
  }
  double v48 = v3;
LABEL_17:

  return v48;
}

- (NSMutableDictionary)labels
{
  return self->_labels;
}

- (void)setLabels:(id)a3
{
}

- (PDContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
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

- (NSMutableDictionary)variables
{
  return self->_variables;
}

- (void)setVariables:(id)a3
{
}

- (running_mean)values_mean
{
  return self->_values_mean;
}

- (void)setValues_mean:(running_mean *)a3
{
  self->_values_mean = a3;
}

- (pooled_mean)stats_mean
{
  return self->_stats_mean;
}

- (void)setStats_mean:(pooled_mean *)a3
{
  self->_stats_mean = a3;
}

- (BOOL)validMin
{
  return self->_validMin;
}

- (void)setValidMin:(BOOL)a3
{
  self->_validMin = a3;
}

- (double)min
{
  return self->_min;
}

- (void)setMin:(double)a3
{
  self->_min = a3;
}

- (BOOL)validMax
{
  return self->_validMax;
}

- (void)setValidMax:(BOOL)a3
{
  self->_validMax = a3;
}

- (double)max
{
  return self->_max;
}

- (void)setMax:(double)a3
{
  self->_max = a3;
}

- (unint64_t)samples
{
  return self->_samples;
}

- (void)setSamples:(unint64_t)a3
{
  self->_samples = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variables, 0);
  objc_storeStrong((id *)&self->_unitString, 0);
  objc_storeStrong((id *)&self->_metric, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_labels, 0);
}

@end