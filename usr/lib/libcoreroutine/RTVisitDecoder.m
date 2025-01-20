@interface RTVisitDecoder
- (RTVisitDecoder)init;
- (RTVisitDecoder)initWithHyperParameter:(id)a3;
- (RTVisitHyperParameter)hyperParameter;
- (id)createSuccessor:(id)a3 probabilities:(const float *)a4 firstTimeStepDate:(id)a5 currentDate:(id)a6;
- (id)decodeWithProbabilities:(const float *)a3 batchSize:(unint64_t)a4 firstTimeStepDate:(id)a5;
- (void)reset;
- (void)updateSuccessor:(id)a3 newNode:(id)a4;
@end

@implementation RTVisitDecoder

- (RTVisitDecoder)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithHyperParameter_);
}

- (RTVisitDecoder)initWithHyperParameter:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RTVisitDecoder;
  v6 = [(RTVisitDecoder *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_hyperParameter, a3);
  }

  return v7;
}

- (void)reset
{
  self->_beam = 0;
  MEMORY[0x1F41817F8]();
}

- (void)updateSuccessor:(id)a3 newNode:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v5)
  {
    uint64_t v8 = [v6 outputType];
    if (v8)
    {
      objc_super v9 = v8;
      v10 = [v5 objectForKeyedSubscript:v8];
      v11 = v10;
      if (!v10 || ([v10 logProbability], double v13 = v12, objc_msgSend(v7, "logProbability"), v13 < v14)) {
        [v5 setObject:v7 forKeyedSubscript:v9];
      }
    }
    else
    {
      v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v16 = 0;
        _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: key", v16, 2u);
      }

      objc_super v9 = 0;
    }
  }
  else
  {
    objc_super v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: successor", buf, 2u);
    }
  }
}

- (id)createSuccessor:(id)a3 probabilities:(const float *)a4 firstTimeStepDate:(id)a5 currentDate:(id)a6
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  double v13 = objc_opt_new();
  if (!v10)
  {
    obj = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
      goto LABEL_37;
    }
    *(_WORD *)buf = 0;
    v52 = "Invalid parameter not satisfying: beam";
    goto LABEL_36;
  }
  if (!a4)
  {
    obj = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
      goto LABEL_37;
    }
    *(_WORD *)buf = 0;
    v52 = "Invalid parameter not satisfying: probabilities";
    goto LABEL_36;
  }
  if (v11)
  {
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    obj = v10;
    uint64_t v14 = [obj countByEnumeratingWithState:&v58 objects:v63 count:16];
    if (!v14) {
      goto LABEL_37;
    }
    uint64_t v15 = v14;
    id v54 = v10;
    id v55 = v12;
    uint64_t v57 = *(void *)v59;
    while (1)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v59 != v57) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        long double v18 = *a4;
        float v19 = a4[3];
        long double v20 = (float)(a4[1] + a4[2]);
        v21 = [v17 entryDate:v54];
        int v22 = [v21 isBeforeDate:v11];

        if (v22) {
          double v23 = v18;
        }
        else {
          double v23 = -0.0;
        }
        if ([v17 noVisit])
        {
          [(RTVisitHyperParameter *)self->_hyperParameter minNoVisitProbability];
          if (v24 <= v18)
          {
            v25 = [RTVisitDecoded alloc];
            [v17 logProbability];
            v27 = [(RTVisitDecoded *)v25 initWithEntryDate:0 exitDate:0 logProbability:(double)(log(v18) + v26)];
            [(RTVisitDecoder *)self updateSuccessor:v13 newNode:v27];
          }
          [(RTVisitHyperParameter *)self->_hyperParameter minEntryProbability];
          if (v28 <= v20)
          {
            v29 = [RTVisitDecoded alloc];
            [v17 logProbability];
            long double v31 = log(v20) + v30;
            [(RTVisitHyperParameter *)self->_hyperParameter decoderEntryCost];
            v33 = [(RTVisitDecoded *)v29 initWithEntryDate:v12 exitDate:0 logProbability:(double)(v31 - v32)];
            goto LABEL_26;
          }
        }
        else
        {
          double v34 = v23 + v19;
          if ([v17 partialVisit])
          {
            [(RTVisitHyperParameter *)self->_hyperParameter minEntryProbability];
            if (v35 <= v20)
            {
              v36 = [RTVisitDecoded alloc];
              v37 = [v17 entryDate];
              [v17 logProbability];
              v39 = [(RTVisitDecoded *)v36 initWithEntryDate:v37 exitDate:0 logProbability:(double)(log(v20) + v38)];

              [(RTVisitDecoder *)self updateSuccessor:v13 newNode:v39];
            }
            [(RTVisitHyperParameter *)self->_hyperParameter minExitProbability];
            if (v34 >= v40)
            {
              v41 = [RTVisitDecoded alloc];
              v42 = [v17 entryDate];
              [v17 logProbability];
              long double v44 = log(v34) + v43;
              [(RTVisitHyperParameter *)self->_hyperParameter decoderExitCost];
              v33 = [(RTVisitDecoded *)v41 initWithEntryDate:v42 exitDate:v12 logProbability:(double)(v44 - v45)];
              goto LABEL_25;
            }
          }
          else if ([v17 completeVisit])
          {
            [(RTVisitHyperParameter *)self->_hyperParameter minExitProbability];
            if (v34 >= v46)
            {
              v47 = [RTVisitDecoded alloc];
              v42 = [v17 entryDate];
              [v17 exitDate];
              id v48 = v11;
              v50 = v49 = v13;
              [v17 logProbability];
              v33 = [(RTVisitDecoded *)v47 initWithEntryDate:v42 exitDate:v50 logProbability:(double)(log(v23 + v19) + v51)];

              double v13 = v49;
              id v11 = v48;
              id v12 = v55;
LABEL_25:

LABEL_26:
              [(RTVisitDecoder *)self updateSuccessor:v13 newNode:v33];

              continue;
            }
          }
        }
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v58 objects:v63 count:16];
      if (!v15)
      {
        id v10 = v54;
        goto LABEL_37;
      }
    }
  }
  obj = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v52 = "Invalid parameter not satisfying: firstTimeStepDate";
LABEL_36:
    _os_log_error_impl(&dword_1D9BFA000, obj, OS_LOG_TYPE_ERROR, v52, buf, 2u);
  }
LABEL_37:

  return v13;
}

- (id)decodeWithProbabilities:(const float *)a3 batchSize:(unint64_t)a4 firstTimeStepDate:(id)a5
{
  v45[1] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  objc_super v9 = v7;
  if (!a3)
  {
    long double v31 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
LABEL_30:

LABEL_31:
      id v14 = 0;
      goto LABEL_32;
    }
    *(_WORD *)buf = 0;
    double v32 = "Invalid parameter not satisfying: probabilities";
LABEL_37:
    _os_log_error_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_ERROR, v32, buf, 2u);
    goto LABEL_30;
  }
  if (!v7)
  {
    long double v31 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      goto LABEL_30;
    }
    *(_WORD *)buf = 0;
    double v32 = "Invalid parameter not satisfying: firstTimeStepDate";
    goto LABEL_37;
  }
  if (!self->_beam)
  {
    id v10 = objc_opt_new();
    v45[0] = v10;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:1];
    beam = self->_beam;
    self->_beam = v11;
  }
  if (!a4) {
    goto LABEL_31;
  }
  uint64_t v13 = 0;
  id v14 = 0;
  *(void *)&long long v8 = 138412290;
  long long v34 = v8;
  long double v35 = v9;
  while (1)
  {
    uint64_t v15 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v9 sinceDate:[RTVisitHyperParameter visitInferenceResolution](self->_hyperParameter, "visitInferenceResolution", v34)* v13* -[RTVisitHyperParameter timeStepInterval](self->_hyperParameter, "timeStepInterval")];
    v16 = [(RTVisitDecoder *)self createSuccessor:self->_beam probabilities:a3 firstTimeStepDate:v9 currentDate:v15];
    v37 = (void *)v15;
    if ([v16 count])
    {
      v17 = [v16 allValues];
      p_super = &self->_beam->super;
      self->_beam = v17;
    }
    else
    {
      p_super = _rt_log_facility_get_os_log(RTLogFacilityVisit);
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        double v30 = self->_beam;
        *(_DWORD *)buf = v34;
        long double v44 = v30;
        _os_log_error_impl(&dword_1D9BFA000, p_super, OS_LOG_TYPE_ERROR, "no successor for beam=%@", buf, 0xCu);
      }
    }

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    float v19 = self->_beam;
    uint64_t v20 = [(NSArray *)v19 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      id v14 = 0;
      uint64_t v22 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v39 != v22) {
            objc_enumerationMutation(v19);
          }
          long double v24 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          if (v14)
          {
            [v14 logProbability];
            double v26 = v25;
            [v24 logProbability];
            if (v26 < v27)
            {
              id v28 = v24;

              id v14 = v28;
            }
          }
          else
          {
            id v14 = v24;
          }
        }
        uint64_t v21 = [(NSArray *)v19 countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v21);
    }
    else
    {
      id v14 = 0;
    }

    char v29 = [v14 completeVisit];
    if (v29) {
      break;
    }
    a3 += 4;
    ++v13;
    objc_super v9 = v35;
    if (v13 == a4) {
      goto LABEL_32;
    }
  }
  objc_super v9 = v35;
LABEL_32:

  return v14;
}

- (RTVisitHyperParameter)hyperParameter
{
  return self->_hyperParameter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hyperParameter, 0);

  objc_storeStrong((id *)&self->_beam, 0);
}

@end