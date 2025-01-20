@interface WRSignpostTracker
- ($9113E22C387CB8549570940FFDE4B24C)statsWithEventEndNs:(SEL)a3;
- (BOOL)exceededDiagnosticThreshold;
- (NSArray)emits;
- (NSArray)incompleteIntervalStarts;
- (NSArray)intervals;
- (NSDictionary)environment;
- (NSString)individuationIdentifier;
- (WRSignpost)signpost;
- (id)debugDescription;
- (id)diagnosticsExceedingThresholdsWithEventStartNs:(id)a1 eventEndNs:;
- (id)emitsMutable;
- (id)encodedDict;
- (id)environmentMutable;
- (id)incompleteIntervalStartsMutable;
- (id)initWithSignpost:(void *)a3 individuationIdentifier:;
- (id)intervalsMutable;
- (int)count;
- (int64_t)timeUntilFirstSignpostNanoseconds;
- (uint64_t)isMiddleOfInterval;
- (uint64_t)setIsMiddleOfInterval:(uint64_t)result;
- (unint64_t)totalDurationNanoseconds;
- (void)initWithEncodedDict:(void *)a3 signpost:(uint64_t *)a4 error:;
- (void)reset;
- (void)setEmitsMutable:(void *)a1;
- (void)setEnvironmentMutable:(void *)a1;
- (void)setIncompleteIntervalStartsMutable:(void *)a1;
- (void)setIntervalsMutable:(void *)a1;
@end

@implementation WRSignpostTracker

- (id)initWithSignpost:(void *)a3 individuationIdentifier:
{
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)WRSignpostTracker;
    v8 = (id *)objc_msgSendSuper2(&v10, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 2, a2);
      objc_storeStrong(a1 + 3, a3);
    }
  }

  return a1;
}

- (NSArray)intervals
{
  if (self) {
    self = (WRSignpostTracker *)objc_getProperty(self, a2, 40, 1);
  }
  v2 = (void *)[(WRSignpostTracker *)self copy];

  return (NSArray *)v2;
}

- (id)intervalsMutable
{
  if (result) {
    return objc_getProperty(result, a2, 40, 1);
  }
  return result;
}

- (NSArray)emits
{
  if (self) {
    self = (WRSignpostTracker *)objc_getProperty(self, a2, 48, 1);
  }
  v2 = (void *)[(WRSignpostTracker *)self copy];

  return (NSArray *)v2;
}

- (id)emitsMutable
{
  if (result) {
    return objc_getProperty(result, a2, 48, 1);
  }
  return result;
}

- (NSArray)incompleteIntervalStarts
{
  if (self) {
    self = (WRSignpostTracker *)objc_getProperty(self, a2, 56, 1);
  }
  v2 = (void *)[(WRSignpostTracker *)self copy];

  return (NSArray *)v2;
}

- (id)incompleteIntervalStartsMutable
{
  if (result) {
    return objc_getProperty(result, a2, 56, 1);
  }
  return result;
}

- (NSDictionary)environment
{
  if (self) {
    self = (WRSignpostTracker *)objc_getProperty(self, a2, 32, 1);
  }
  v2 = (void *)[(WRSignpostTracker *)self copy];

  return (NSDictionary *)v2;
}

- (id)environmentMutable
{
  if (result) {
    return objc_getProperty(result, a2, 32, 1);
  }
  return result;
}

- ($9113E22C387CB8549570940FFDE4B24C)statsWithEventEndNs:(SEL)a3
{
  uint64_t v104 = *MEMORY[0x263EF8340];
  *(_OWORD *)&retstr->var1.unint64_t var2 = 0u;
  *(_OWORD *)&retstr->var1.var4 = 0u;
  *(_OWORD *)&retstr->var0.unint64_t var2 = 0u;
  *(_OWORD *)&retstr->var0.var4 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  *(_OWORD *)&retstr->var1.var0 = 0u;
  v76 = [(WRSignpostTracker *)self intervals];
  uint64_t v6 = [v76 count];
  id v7 = [(WRSignpostTracker *)self incompleteIntervalStarts];
  uint64_t v8 = [v7 count];
  v69 = self;
  v9 = [(WRSignpostTracker *)self emits];
  uint64_t v10 = [v9 count];
  uint64_t v85 = v8;
  uint64_t v11 = v8 + v6;
  v89 = retstr;
  retstr->var0.var0 = v10 + v8 + v6;
  uint64_t v73 = v6;
  p_unint64_t var1 = &retstr->var1;
  retstr->var1.var0 = v10 + v6;
  if (!v10)
  {
    unint64_t v13 = 0;
    unint64_t v16 = -1;
    unint64_t v15 = -1;
    if (!v11) {
      goto LABEL_58;
    }
    goto LABEL_13;
  }
  uint64_t v12 = v10;
  unint64_t v13 = 0;
  uint64_t v14 = 0;
  unint64_t v15 = -1;
  unint64_t v16 = -1;
  do
  {
    v17 = [v9 objectAtIndexedSubscript:v14];
    unint64_t v18 = [v17 machContTimeNs];
    if (v15 >= v18) {
      unint64_t v15 = v18;
    }
    if (v16 >= v18) {
      unint64_t v16 = v18;
    }
    if (v13 <= v18) {
      unint64_t v13 = v18;
    }

    ++v14;
  }
  while (v12 != v14);
  if (v11)
  {
LABEL_13:
    uint64_t v92 = 0;
    v93 = 0;
    uint64_t v90 = 0;
    v91 = 0;
    int v19 = v73;
    v68 = v9;
    if (v73)
    {
      v65 = v7;
      unint64_t v77 = 0;
      unint64_t v70 = 0;
      __ptr = 0;
      unint64_t v81 = 0;
      unint64_t v83 = 0;
      v20 = 0;
      uint64_t v21 = 0;
      int v79 = 0;
      uint64_t v22 = 16;
      do
      {
        v23 = [v76 objectAtIndexedSubscript:v21];
        v24 = [v23 start];
        unint64_t v25 = [v24 machContTimeNs];

        v26 = [v23 end];
        unint64_t v27 = [v26 machContTimeNs];

        unint64_t v28 = v27 - v25;
        v29 = (char *)reallocf(v20, v22 & 0xFFFFFFFF0);
        v20 = v29;
        v30 = (unint64_t *)&v29[16 * v21];
        unint64_t *v30 = v25;
        v30[1] = v27;
        if (v81 < v27 - v25)
        {
          v89->var0.unint64_t var3 = v28;
          unint64_t v81 = v27 - v25;
        }
        v83 += v28;
        v89->var0.unint64_t var2 = v83;
        if (v85)
        {
          v87 = v29;
          __ptr = (char *)reallocf(__ptr, 16 * (v79 + 1));
          v31 = (unint64_t *)&__ptr[16 * v79];
          unint64_t *v31 = v25;
          v31[1] = v27;
          if (v70 < v28)
          {
            v89->var1.unint64_t var3 = v28;
            unint64_t v70 = v27 - v25;
          }
          v20 = v87;
          v77 += v28;
          v89->var1.unint64_t var2 = v77;
          ++v79;
        }
        ++v21;
        if (v15 >= v25) {
          unint64_t v15 = v25;
        }
        if (v16 >= v25) {
          unint64_t v16 = v25;
        }
        if (v13 <= v27) {
          unint64_t v13 = v27;
        }

        v22 += 16;
      }
      while (v73 != v21);
      v93 = v20;
      v91 = __ptr;
      id v7 = v65;
      int v32 = v21;
      v9 = v68;
      int v19 = v79;
    }
    else
    {
      v20 = 0;
      int v32 = 0;
    }
    LODWORD(v92) = v32;
    LODWORD(v90) = v19;
    if (!v85)
    {
LABEL_47:
      LODWORD(v92) = v32;
      WRRangesSortAndCoalesce((unsigned int *)&v92);
      uint64_t v52 = v92;
      v53 = v93;
      if (v92)
      {
        unint64_t var1 = v89->var0.var1;
        v55 = (char *)v93 + 8;
        do
        {
          var1 += *v55 - *(v55 - 1);
          v55 += 2;
          --v52;
        }
        while (v52);
        v89->var0.unint64_t var1 = var1;
      }
      free(v53);
      if (v85)
      {
        WRRangesSortAndCoalesce((unsigned int *)&v90);
        uint64_t v56 = v90;
        if (v90)
        {
          unint64_t v57 = v89->var1.var1;
          v58 = (char *)v91 + 8;
          do
          {
            v57 += *v58 - *(v58 - 1);
            v58 += 2;
            --v56;
          }
          while (v56);
          v89->var1.unint64_t var1 = v57;
        }
      }
      else
      {
        long long v59 = *(_OWORD *)&v89->var0.var2;
        *(_OWORD *)&p_var1->var0 = *(_OWORD *)&v89->var0.var0;
        *(_OWORD *)&p_var1->unint64_t var2 = v59;
      }
      free(v91);
      goto LABEL_58;
    }
    v88 = v20;
    uint64_t v33 = 0;
    unint64_t v34 = a4;
    double v35 = (double)a4;
    unint64_t var2 = v89->var0.var2;
    int v80 = v32;
    unint64_t var3 = v89->var0.var3;
    int v86 = v32;
    while (1)
    {
      v37 = objc_msgSend(v7, "objectAtIndexedSubscript:", v33, v63);
      unint64_t v38 = [v37 machContTimeNs];
      unint64_t v39 = v38;
      v84 = v37;
      if (!v34) {
        goto LABEL_39;
      }
      BOOL v40 = v34 > v38;
      v34 -= v38;
      if (v40) {
        goto LABEL_39;
      }
      v41 = v7;
      v42 = [(WRSignpostTracker *)v69 signpost];
      v43 = [v42 individuationFieldName];

      v44 = [(WRSignpostTracker *)v69 signpost];
      v45 = v44;
      if (v43)
      {
        [v44 individuationFieldName];

        [(WRSignpostTracker *)v69 individuationIdentifier];
        v46 = [(WRSignpostTracker *)v69 signpost];
        [v46 name];

        int v47 = *__error();
        v48 = _wrlog();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          v71 = [(WRSignpostTracker *)v69 signpost];
          v74 = [v71 name];
          v66 = [(WRSignpostTracker *)v69 signpost];
          v64 = [v66 individuationFieldName];
          v63 = [(WRSignpostTracker *)v69 individuationIdentifier];
          *(_DWORD *)buf = 138544386;
          v95 = @"<workflow>";
          __int16 v96 = 2114;
          v97 = v74;
          __int16 v98 = 2114;
          double v99 = *(double *)&v64;
          __int16 v100 = 2112;
          v101 = v63;
          __int16 v102 = 2048;
          double v103 = ((double)v39 - v35) / 1000000000.0;
          _os_log_error_impl(&dword_261964000, v48, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@: %{public}@->%@: Interval start after event end (%.3f later)", buf, 0x34u);

          v49 = v71;
LABEL_46:
        }
      }
      else
      {
        [v44 name];

        int v47 = *__error();
        v48 = _wrlog();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          v75 = [(WRSignpostTracker *)v69 signpost];
          v51 = [v75 name];
          *(_DWORD *)buf = 138543874;
          v95 = @"<workflow>";
          __int16 v96 = 2114;
          v97 = v51;
          __int16 v98 = 2048;
          double v99 = ((double)v39 - v35) / 1000000000.0;
          _os_log_error_impl(&dword_261964000, v48, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@: Interval start after event end (%.3f later)", buf, 0x20u);

          v49 = v75;
          goto LABEL_46;
        }
      }

      unint64_t v34 = 0;
      *__error() = v47;
      id v7 = v41;
LABEL_39:
      v88 = (char *)reallocf(v88, 16 * (v80 + v33 + 1));
      v50 = (unint64_t *)&v88[16 * (v80 + v33)];
      unint64_t *v50 = v39;
      v50[1] = v34 + v39;
      if (var3 < v34)
      {
        v89->var0.unint64_t var3 = v34;
        unint64_t var3 = v34;
      }
      var2 += v34;
      v89->var0.unint64_t var2 = var2;
      if (v15 >= v39) {
        unint64_t v15 = v39;
      }

      ++v33;
      unint64_t v34 = a4;
      if (v85 == v33)
      {
        v93 = v88;
        int v32 = v86 + v33;
        v9 = v68;
        goto LABEL_47;
      }
    }
  }
LABEL_58:
  if (v15 == -1) {
    unint64_t v60 = 0;
  }
  else {
    unint64_t v60 = v15;
  }
  v89->var0.var4 = v60;
  v89->var0.var5 = v13;
  if (v16 == -1) {
    unint64_t v61 = 0;
  }
  else {
    unint64_t v61 = v16;
  }
  v89->var1.var4 = v61;
  v89->var1.var5 = v13;

  return result;
}

- (id)diagnosticsExceedingThresholdsWithEventStartNs:(id)a1 eventEndNs:
{
  id v1 = a1;
  if (a1)
  {
    objc_msgSend(a1, "statsWithEventEndNs:");
    id v1 = 0;
  }

  return v1;
}

- (void)reset
{
  if (a1)
  {
    objc_setProperty_atomic(a1, a2, 0, 40);
    objc_setProperty_atomic(a1, v3, 0, 48);
    objc_setProperty_atomic(a1, v4, 0, 56);
    objc_setProperty_atomic(a1, v5, 0, 32);
  }
}

- (void)setIntervalsMutable:(void *)a1
{
  if (a1) {
    objc_setProperty_atomic(a1, newValue, newValue, 40);
  }
}

- (void)setEmitsMutable:(void *)a1
{
  if (a1) {
    objc_setProperty_atomic(a1, newValue, newValue, 48);
  }
}

- (void)setIncompleteIntervalStartsMutable:(void *)a1
{
  if (a1) {
    objc_setProperty_atomic(a1, newValue, newValue, 56);
  }
}

- (void)setEnvironmentMutable:(void *)a1
{
  if (a1) {
    objc_setProperty_atomic(a1, newValue, newValue, 32);
  }
}

- (id)debugDescription
{
  id v3 = [NSString alloc];
  SEL v4 = [(WRSignpost *)self->_signpost debugDescription];
  v5 = (void *)[v3 initWithFormat:@"Tracker for %@", v4];

  return v5;
}

- (id)encodedDict
{
  id v1 = a1;
  uint64_t v60 = *MEMORY[0x263EF8340];
  if (a1)
  {
    id v2 = objc_alloc(MEMORY[0x263EFF9A0]);
    id v3 = [v1 signpost];
    SEL v4 = [v3 name];
    v5 = objc_msgSend(v2, "initWithObjectsAndKeys:", v4, @"st_name", 0);

    uint64_t v6 = [v1 individuationIdentifier];
    [v5 setObject:v6 forKeyedSubscript:@"st_individuation_identifier"];

    id v7 = [v1 environment];
    [v5 setObject:v7 forKeyedSubscript:@"st_environment"];

    uint64_t v8 = [v1 intervals];
    uint64_t v9 = [v8 count];

    if (v9)
    {
      id v10 = objc_alloc(MEMORY[0x263EFF980]);
      uint64_t v11 = [v1 intervals];
      uint64_t v12 = objc_msgSend(v10, "initWithCapacity:", objc_msgSend(v11, "count"));

      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      unint64_t v13 = [v1 intervals];
      uint64_t v14 = [v13 countByEnumeratingWithState:&v53 objects:v59 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v54;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v54 != v16) {
              objc_enumerationMutation(v13);
            }
            unint64_t v18 = -[WRIntervalAndThreads encodedDict](*(id *)(*((void *)&v53 + 1) + 8 * i));
            [v12 addObject:v18];
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v53 objects:v59 count:16];
        }
        while (v15);
      }

      int v19 = (void *)[v12 copy];
      [v5 setObject:v19 forKeyedSubscript:@"st_intervals"];
    }
    v20 = [v1 emits];
    uint64_t v21 = [v20 count];

    if (v21)
    {
      id v22 = objc_alloc(MEMORY[0x263EFF980]);
      v23 = [v1 emits];
      v24 = objc_msgSend(v22, "initWithCapacity:", objc_msgSend(v23, "count"));

      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      unint64_t v25 = [v1 emits];
      uint64_t v26 = [v25 countByEnumeratingWithState:&v49 objects:v58 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v50;
        do
        {
          for (uint64_t j = 0; j != v27; ++j)
          {
            if (*(void *)v50 != v28) {
              objc_enumerationMutation(v25);
            }
            v30 = -[WRTimestampAndThread encodedDict](*(void **)(*((void *)&v49 + 1) + 8 * j));
            [v24 addObject:v30];
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v49 objects:v58 count:16];
        }
        while (v27);
      }

      v31 = (void *)[v24 copy];
      [v5 setObject:v31 forKeyedSubscript:@"st_emits"];
    }
    int v32 = [v1 incompleteIntervalStarts];
    uint64_t v33 = [v32 count];

    if (v33)
    {
      id v34 = objc_alloc(MEMORY[0x263EFF980]);
      double v35 = [v1 incompleteIntervalStarts];
      v36 = objc_msgSend(v34, "initWithCapacity:", objc_msgSend(v35, "count"));

      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      v37 = [v1 incompleteIntervalStarts];
      uint64_t v38 = [v37 countByEnumeratingWithState:&v45 objects:v57 count:16];
      if (v38)
      {
        uint64_t v39 = v38;
        uint64_t v40 = *(void *)v46;
        do
        {
          for (uint64_t k = 0; k != v39; ++k)
          {
            if (*(void *)v46 != v40) {
              objc_enumerationMutation(v37);
            }
            v42 = -[WRTimestampAndThread encodedDict](*(void **)(*((void *)&v45 + 1) + 8 * k));
            [v36 addObject:v42];
          }
          uint64_t v39 = [v37 countByEnumeratingWithState:&v45 objects:v57 count:16];
        }
        while (v39);
      }

      v43 = (void *)[v36 copy];
      [v5 setObject:v43 forKeyedSubscript:@"st_incomplete_interval_starts"];
    }
    id v1 = (id)[v5 copy];
  }

  return v1;
}

- (void)initWithEncodedDict:(void *)a3 signpost:(uint64_t *)a4 error:
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  id v53 = a2;
  id v50 = a3;
  if (!a1)
  {
    unint64_t v18 = 0;
    goto LABEL_65;
  }
  uint64_t v74 = 0;
  if (a4) {
    *a4 = 0;
  }
  else {
    a4 = &v74;
  }
  v73.receiver = a1;
  v73.super_class = (Class)WRSignpostTracker;
  id v7 = objc_msgSendSuper2(&v73, sel_init);
  uint64_t v14 = v7;
  if (v7)
  {
    objc_storeStrong((id *)v7 + 2, a3);
    uint64_t v15 = DictGetString(v53, @"st_individuation_identifier", a4);
    uint64_t v16 = (void *)v14[3];
    v14[3] = v15;

    if (!v14[3] && *a4)
    {
      unint64_t v18 = 0;
      goto LABEL_64;
    }
    long long v51 = DictGetDict(v53, @"st_environment", a4);
    if (!v51 && *a4) {
      goto LABEL_18;
    }
    if ([v51 count])
    {
      uint64_t v67 = 0;
      v68 = &v67;
      uint64_t v69 = 0x3032000000;
      unint64_t v70 = __Block_byref_object_copy_;
      v71 = __Block_byref_object_dispose_;
      id v72 = 0;
      v66[0] = MEMORY[0x263EF8330];
      v66[1] = 3221225472;
      v66[2] = __56__WRSignpostTracker_initWithEncodedDict_signpost_error___block_invoke;
      v66[3] = &unk_265589370;
      v66[4] = &v67;
      [v51 enumerateKeysAndObjectsUsingBlock:v66];
      v17 = (void *)v68[5];
      if (v17)
      {
        *a4 = (uint64_t)v17;
      }
      else
      {
        uint64_t v19 = [v51 mutableCopy];
        v20 = (void *)v14[4];
        v14[4] = v19;
      }
      _Block_object_dispose(&v67, 8);

      if (v17)
      {
LABEL_18:
        unint64_t v18 = 0;
LABEL_63:

        goto LABEL_64;
      }
    }
    uint64_t v21 = objc_opt_class();
    long long v49 = DictGetArrayOfClass(v53, @"st_intervals", v21, a4);
    if (!v49 && *a4)
    {
      unint64_t v18 = 0;
LABEL_62:

      goto LABEL_63;
    }
    if ([v49 count])
    {
      long long v52 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v49, "count"));
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      id v22 = v49;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v62 objects:v77 count:16];
      if (v23)
      {
        uint64_t v24 = *(void *)v63;
LABEL_23:
        uint64_t v25 = 0;
        while (1)
        {
          if (*(void *)v63 != v24) {
            objc_enumerationMutation(v22);
          }
          uint64_t v26 = -[WRIntervalAndThreads initWithEncodedDict:error:]((id *)[WRIntervalAndThreads alloc], *(void **)(*((void *)&v62 + 1) + 8 * v25), a4);
          uint64_t v27 = v26;
          if (!v26) {
            goto LABEL_59;
          }
          -[WRIntervalAndThreads insertIntoSortedArray:]((uint64_t)v26, v52);

          if (v23 == ++v25)
          {
            uint64_t v23 = [v22 countByEnumeratingWithState:&v62 objects:v77 count:16];
            if (v23) {
              goto LABEL_23;
            }
            break;
          }
        }
      }

      uint64_t v28 = (void *)v14[5];
      v14[5] = v52;
    }
    uint64_t v29 = objc_opt_class();
    long long v52 = DictGetArrayOfClass(v53, @"st_emits", v29, a4);
    if (!v52 && *a4)
    {
      unint64_t v18 = 0;
LABEL_61:

      goto LABEL_62;
    }
    if ([v52 count])
    {
      id v22 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v52, "count"));
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      id v30 = v52;
      uint64_t v31 = [v30 countByEnumeratingWithState:&v58 objects:v76 count:16];
      if (v31)
      {
        uint64_t v32 = *(void *)v59;
        while (2)
        {
          for (uint64_t i = 0; i != v31; ++i)
          {
            if (*(void *)v59 != v32) {
              objc_enumerationMutation(v30);
            }
            id v34 = -[WRTimestampAndThread initWithEncodedDict:error:]((id *)[WRTimestampAndThread alloc], *(void **)(*((void *)&v58 + 1) + 8 * i), a4);
            double v35 = v34;
            if (!v34)
            {

              unint64_t v18 = 0;
              long long v52 = v30;
              goto LABEL_60;
            }
            -[WRTimestampAndThread insertIntoSortedArray:]((uint64_t)v34, v22);
          }
          uint64_t v31 = [v30 countByEnumeratingWithState:&v58 objects:v76 count:16];
          if (v31) {
            continue;
          }
          break;
        }
      }

      v36 = (void *)v14[6];
      v14[6] = v22;
    }
    uint64_t v37 = objc_opt_class();
    uint64_t v38 = DictGetArrayOfClass(v53, @"st_incomplete_interval_starts", v37, a4);
    id v22 = v38;
    if (v38 || !*a4)
    {
      if ([v38 count])
      {
        uint64_t v39 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v22, "count"));
        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        id v40 = v22;
        uint64_t v41 = [v40 countByEnumeratingWithState:&v54 objects:v75 count:16];
        if (v41)
        {
          uint64_t v42 = *(void *)v55;
          while (2)
          {
            for (uint64_t j = 0; j != v41; ++j)
            {
              if (*(void *)v55 != v42) {
                objc_enumerationMutation(v40);
              }
              v44 = -[WRTimestampAndThread initWithEncodedDict:error:]((id *)[WRTimestampAndThread alloc], *(void **)(*((void *)&v54 + 1) + 8 * j), a4);
              long long v45 = v44;
              if (!v44)
              {

                unint64_t v18 = 0;
                id v22 = v40;
                goto LABEL_60;
              }
              -[WRTimestampAndThread insertIntoSortedArray:]((uint64_t)v44, v39);
            }
            uint64_t v41 = [v40 countByEnumeratingWithState:&v54 objects:v75 count:16];
            if (v41) {
              continue;
            }
            break;
          }
        }

        long long v46 = (void *)v14[7];
        v14[7] = v39;
      }
      unint64_t v18 = v14;
      goto LABEL_60;
    }
LABEL_59:
    unint64_t v18 = 0;
LABEL_60:

    goto LABEL_61;
  }
  WRMakeError(2, @"Unable to init WRSignpostTracker", v8, v9, v10, v11, v12, v13, v48);
  unint64_t v18 = 0;
  *a4 = (uint64_t)(id)objc_claimAutoreleasedReturnValue();
LABEL_64:

LABEL_65:
  return v18;
}

void __56__WRSignpostTracker_initWithEncodedDict_signpost_error___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v18 = a2;
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    ClassName = object_getClassName(v18);
    object_getClassName(v7);
    uint64_t v15 = WRMakeError(6, @"Invalid type in environment (%s -> %s)", v9, v10, v11, v12, v13, v14, (uint64_t)ClassName);
    uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 8);
    v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;

    *a4 = 1;
  }
}

- (BOOL)exceededDiagnosticThreshold
{
  id v2 = -[WRSignpostTracker diagnosticsExceedingThresholdsWithEventStartNs:eventEndNs:](self);
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (int64_t)timeUntilFirstSignpostNanoseconds
{
  return 0;
}

- (unint64_t)totalDurationNanoseconds
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = [(WRSignpostTracker *)self intervals];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v9 = [v8 end];
        uint64_t v10 = [v9 machContTimeNs];
        uint64_t v11 = [v8 start];
        v5 += v10 - [v11 machContTimeNs];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (int)count
{
  id v2 = self;
  if (self) {
    self = (WRSignpostTracker *)objc_getProperty(self, a2, 48, 1);
  }
  int v4 = [(WRSignpostTracker *)self count];
  if (v2) {
    id Property = objc_getProperty(v2, v3, 40, 1);
  }
  else {
    id Property = 0;
  }
  int v6 = [Property count] + v4;
  id v7 = [(WRSignpostTracker *)v2 incompleteIntervalStarts];
  int v8 = v6 + [v7 count];

  return v8;
}

- (WRSignpost)signpost
{
  return (WRSignpost *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)individuationIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (uint64_t)isMiddleOfInterval
{
  if (result) {
    return *(unsigned char *)(result + 8) & 1;
  }
  return result;
}

- (uint64_t)setIsMiddleOfInterval:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 8) = a2;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incompleteIntervalStartsMutable, 0);
  objc_storeStrong((id *)&self->_emitsMutable, 0);
  objc_storeStrong((id *)&self->_intervalsMutable, 0);
  objc_storeStrong((id *)&self->_environmentMutable, 0);
  objc_storeStrong((id *)&self->_individuationIdentifier, 0);

  objc_storeStrong((id *)&self->_signpost, 0);
}

@end