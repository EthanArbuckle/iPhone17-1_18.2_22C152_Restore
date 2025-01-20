@interface PPScoreDict
- (NSSet)featureNames;
- (PPScoreDict)initWithScalarValueCount:(unint64_t)a3 arrayValueCount:(unint64_t)a4 objectCount:(unint64_t)a5;
- (PPScoreDict)initWithScoreInputSet:(id)a3;
- (float)scalarValueForIndex:(unint64_t)a3;
- (id).cxx_construct;
- (id)arrayValueDictionary;
- (id)arrayValueForIndex:(unint64_t)a3;
- (id)description;
- (id)featureValueForName:(id)a3;
- (id)initWithScalarValueCount:(uint64_t)a3 arrayValueCount:(uint64_t)a4 objectCount:(void *)a5 scoreInputSet:;
- (id)objectDictionary;
- (id)objectForIndex:(unint64_t)a3;
- (id)scalarValueDictionary;
- (shared_ptr<std::vector<float>>)arraySharedPtrForIndex:(unint64_t)a3;
- (unint64_t)arrayValueCount;
- (unint64_t)objectCount;
- (unint64_t)scalarValueCount;
- (void)setArraySharedPtr:(shared_ptr<std:(unint64_t)a4 :vector<float>>)a3 forIndex:;
- (void)setArrayStorage:(void *)a3 forIndex:(unint64_t)a4;
- (void)setArrayValue:(id)a3 forIndex:(unint64_t)a4;
- (void)setObject:(id)a3 forIndex:(unint64_t)a4;
- (void)setScalarValue:(float)a3 forIndex:(unint64_t)a4;
@end

@implementation PPScoreDict

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectStorage, 0);
  std::unique_ptr<std::vector<std::shared_ptr<std::vector<float>>>>::reset[abi:ne180100]((void ***)&self->_arrayValueStorage, 0);
  value = self->_scalarValueStorage.__ptr_.__value_;
  self->_scalarValueStorage.__ptr_.__value_ = 0;
  if (value) {
    std::default_delete<std::vector<float>>::operator()[abi:ne180100]((uint64_t)value);
  }
  objc_storeStrong((id *)&self->_scoreInputSet, 0);
}

- (id)description
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (self->_scoreInputSet)
  {
    id v3 = [NSString alloc];
    v4 = [(PPScoreDict *)self scalarValueDictionary];
    v5 = [(PPScoreDict *)self arrayValueDictionary];
    v6 = [(PPScoreDict *)self objectDictionary];
    v7 = (void *)[v3 initWithFormat:@"PPScoreDict: %@\n%@\n%@\n", v4, v5, v6];
  }
  else
  {
    v8 = objc_opt_new();
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v9 = [(PPScoreDict *)self featureNames];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          v14 = [(PPScoreDict *)self featureValueForName:v13];
          [v8 setObject:v14 forKeyedSubscript:v13];
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }

    v7 = (void *)[[NSString alloc] initWithFormat:@"PPScoreDict: %@\n", v8];
  }
  return v7;
}

- (id)objectDictionary
{
  id v3 = objc_opt_new();
  if ([(PPBaseScoreInputSet *)self->_scoreInputSet objectScoreIndexUpperBound])
  {
    for (unint64_t i = [(PPBaseScoreInputSet *)self->_scoreInputSet minObjectScoreIndex];
          i < [(PPBaseScoreInputSet *)self->_scoreInputSet objectScoreIndexUpperBound];
          ++i)
    {
      v5 = [(PPScoreDict *)self objectForIndex:i];
      v6 = [(PPBaseScoreInputSet *)self->_scoreInputSet nameForObjectScoreIndex:i];
      [v3 setObject:v5 forKeyedSubscript:v6];
    }
  }
  v7 = (void *)[v3 copy];

  return v7;
}

- (id)arrayValueDictionary
{
  id v3 = objc_opt_new();
  if ([(PPBaseScoreInputSet *)self->_scoreInputSet arrayScoreIndexUpperBound])
  {
    for (unint64_t i = [(PPBaseScoreInputSet *)self->_scoreInputSet minArrayScoreIndex];
          i < [(PPBaseScoreInputSet *)self->_scoreInputSet arrayScoreIndexUpperBound];
          ++i)
    {
      v5 = [(PPScoreDict *)self arrayValueForIndex:i];
      v6 = [(PPBaseScoreInputSet *)self->_scoreInputSet nameForArrayScoreIndex:i];
      [v3 setObject:v5 forKeyedSubscript:v6];
    }
  }
  v7 = (void *)[v3 copy];

  return v7;
}

- (id)scalarValueDictionary
{
  id v3 = objc_opt_new();
  if ([(PPBaseScoreInputSet *)self->_scoreInputSet scalarScoreIndexUpperBound])
  {
    for (unint64_t i = [(PPBaseScoreInputSet *)self->_scoreInputSet minScalarScoreIndex];
          i < [(PPBaseScoreInputSet *)self->_scoreInputSet scalarScoreIndexUpperBound];
          ++i)
    {
      v5 = NSNumber;
      [(PPScoreDict *)self scalarValueForIndex:i];
      v6 = objc_msgSend(v5, "numberWithFloat:");
      v7 = [(PPBaseScoreInputSet *)self->_scoreInputSet nameForScalarScoreIndex:i];
      [v3 setObject:v6 forKeyedSubscript:v7];
    }
  }
  v8 = (void *)[v3 copy];

  return v8;
}

- (id)featureValueForName:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  context = (void *)MEMORY[0x1CB79D060]();
  v5 = [v4 componentsSeparatedByString:@"_"];
  if ((unint64_t)[v5 count] <= 1)
  {
    v6 = pp_default_log_handle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_ERROR, "PPScoreDict: invalid feature name passed.", buf, 2u);
    }

    goto LABEL_5;
  }
  v8 = [v5 objectAtIndexedSubscript:1];
  uint64_t v9 = [v8 integerValue];

  if ([v4 hasPrefix:@"scalar_"])
  {
    uint64_t v10 = NSNumber;
    [(PPScoreDict *)self scalarValueForIndex:v9];
    uint64_t v11 = objc_msgSend(v10, "numberWithFloat:");
    uint64_t v12 = +[PPCoreMLUtils multiArrayFeatureValueForNumber:v11];
LABEL_11:
    v7 = (void *)v12;

    goto LABEL_12;
  }
  if ([v4 hasPrefix:@"array_"])
  {
    uint64_t v13 = [(PPScoreDict *)self arrayValueForIndex:v9];
    uint64_t v11 = +[PPCoreMLUtils multiArrayForArray:v13];

    if (v11)
    {
      uint64_t v12 = [MEMORY[0x1E4F1E950] featureValueWithMultiArray:v11];
      goto LABEL_11;
    }
LABEL_5:
    v7 = 0;
    goto LABEL_12;
  }
  if (![v4 hasPrefix:@"object_"]) {
    goto LABEL_5;
  }
  v48 = [(PPScoreDict *)self objectForIndex:v9];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v47 = v48;
      long long v17 = objc_opt_new();
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      v15 = v47;
      uint64_t v18 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v54, v59, 16, v47);
      if (v18)
      {
        uint64_t v19 = *(void *)v55;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v55 != v19) {
              objc_enumerationMutation(v15);
            }
            uint64_t v21 = *(void *)(*((void *)&v54 + 1) + 8 * i);
            v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSObject countForObject:](v15, "countForObject:", v21));
            [v17 setObject:v22 forKeyedSubscript:v21];
          }
          uint64_t v18 = [v15 countByEnumeratingWithState:&v54 objects:v59 count:16];
        }
        while (v18);
      }

      id v53 = 0;
      v7 = [MEMORY[0x1E4F1E950] featureValueWithDictionary:v17 error:&v53];
      v23 = (__CFString *)v53;
      if (!v7)
      {
        v24 = pp_score_interpreter_log_handle();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v37 = (objc_class *)objc_opt_class();
          uint64_t v38 = NSStringFromClass(v37);
          v39 = (void *)v38;
          v40 = &stru_1F253DF18;
          *(_DWORD *)buf = 138412802;
          if (v23) {
            v40 = v23;
          }
          uint64_t v61 = v38;
          __int16 v62 = 2112;
          id v63 = v4;
          __int16 v64 = 2112;
          v65 = v40;
          _os_log_error_impl(&dword_1CA9A8000, v24, OS_LOG_TYPE_ERROR, "Failed to log %@ value for %@: %@", buf, 0x20u);
        }
      }

      goto LABEL_38;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = v48;
      v25 = objc_opt_new();
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __35__PPScoreDict_featureValueForName___block_invoke;
      v51[3] = &unk_1E65D68C0;
      id v26 = v25;
      id v52 = v26;
      [v15 enumerateValuesAndCountsUsingBlock:v51];
      id v50 = 0;
      v7 = [MEMORY[0x1E4F1E950] featureValueWithDictionary:v26 error:&v50];
      v27 = (__CFString *)v50;
      if (!v7)
      {
        v28 = pp_score_interpreter_log_handle();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          v41 = (objc_class *)objc_opt_class();
          uint64_t v42 = NSStringFromClass(v41);
          v43 = (void *)v42;
          v44 = &stru_1F253DF18;
          *(_DWORD *)buf = 138412802;
          if (v27) {
            v44 = v27;
          }
          uint64_t v61 = v42;
          __int16 v62 = 2112;
          id v63 = v4;
          __int16 v64 = 2112;
          v65 = v44;
          _os_log_error_impl(&dword_1CA9A8000, v28, OS_LOG_TYPE_ERROR, "Failed to log %@ value for %@: %@", buf, 0x20u);
        }
      }

      goto LABEL_38;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = v48;
      if (![v15 length])
      {
        v29 = pp_score_interpreter_log_handle();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v61 = (uint64_t)v4;
          _os_log_error_impl(&dword_1CA9A8000, v29, OS_LOG_TYPE_ERROR, "Encountered nil or empty NSString for %@", buf, 0xCu);
        }
        goto LABEL_49;
      }
      v7 = [MEMORY[0x1E4F1E950] featureValueWithString:v15];
      if (v7) {
        goto LABEL_38;
      }
      v29 = pp_score_interpreter_log_handle();
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        goto LABEL_49;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v7 = 0;
          goto LABEL_39;
        }
        v15 = pp_score_interpreter_log_handle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v31 = (objc_class *)objc_opt_class();
          v32 = NSStringFromClass(v31);
          *(_DWORD *)buf = 138412546;
          uint64_t v61 = (uint64_t)v32;
          __int16 v62 = 2112;
          id v63 = v4;
          _os_log_error_impl(&dword_1CA9A8000, v15, OS_LOG_TYPE_ERROR, "Unrecognized object type of %@ in feature %@", buf, 0x16u);
        }
        goto LABEL_20;
      }
      v15 = v48;
      v30 = (void *)MEMORY[0x1E4F1E950];
      [v15 timeIntervalSince1970];
      v7 = objc_msgSend(v30, "featureValueWithDouble:");
      if (v7) {
        goto LABEL_38;
      }
      v29 = pp_score_interpreter_log_handle();
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        goto LABEL_49;
      }
    }
    v45 = (objc_class *)objc_opt_class();
    v46 = NSStringFromClass(v45);
    *(_DWORD *)buf = 138412802;
    uint64_t v61 = (uint64_t)v46;
    __int16 v62 = 2112;
    id v63 = v4;
    __int16 v64 = 2112;
    v65 = &stru_1F253DF18;
    _os_log_error_impl(&dword_1CA9A8000, v29, OS_LOG_TYPE_ERROR, "Failed to log %@ value for %@: %@", buf, 0x20u);

LABEL_49:
LABEL_20:
    v7 = 0;
    goto LABEL_38;
  }
  id v58 = 0;
  v7 = [MEMORY[0x1E4F1E950] featureValueWithDictionary:v48 error:&v58];
  v15 = v58;
  if (!v7)
  {
    long long v16 = pp_score_interpreter_log_handle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v33 = (objc_class *)objc_opt_class();
      uint64_t v34 = NSStringFromClass(v33);
      v35 = (void *)v34;
      v36 = &stru_1F253DF18;
      *(_DWORD *)buf = 138412802;
      if (v15) {
        v36 = (__CFString *)v15;
      }
      uint64_t v61 = v34;
      __int16 v62 = 2112;
      id v63 = v4;
      __int16 v64 = 2112;
      v65 = v36;
      _os_log_error_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_ERROR, "Failed to log %@ value for %@: %@", buf, 0x20u);
    }
    goto LABEL_20;
  }
LABEL_38:

LABEL_39:
LABEL_12:

  return v7;
}

void __35__PPScoreDict_featureValueForName___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(NSNumber, "numberWithUnsignedShort:");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = *(void **)(a1 + 32);
  v5 = [NSNumber numberWithUnsignedShort:a2];
  [v4 setObject:v6 forKeyedSubscript:v5];
}

- (NSSet)featureNames
{
  id v3 = objc_opt_new();
  for (unint64_t i = 0; i < [(PPScoreDict *)self scalarValueCount]; ++i)
  {
    v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"scalar_%tu", i);
    [v3 addObject:v5];
  }
  for (unint64_t j = 0; j < [(PPScoreDict *)self arrayValueCount]; ++j)
  {
    v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"array_%tu", j);
    [v3 addObject:v7];
  }
  for (unint64_t k = 0; k < [(PPScoreDict *)self objectCount]; ++k)
  {
    uint64_t v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"object_%tu", k);
    [v3 addObject:v9];
  }
  uint64_t v10 = (void *)[v3 copy];

  return (NSSet *)v10;
}

- (unint64_t)objectCount
{
  unint64_t result = (unint64_t)self->_objectStorage;
  if (result) {
    return [(id)result count];
  }
  return result;
}

- (unint64_t)arrayValueCount
{
  value = self->_arrayValueStorage.__ptr_.__value_;
  if (value) {
    return (uint64_t)(value[1] - *value) >> 4;
  }
  else {
    return 0;
  }
}

- (unint64_t)scalarValueCount
{
  value = self->_scalarValueStorage.__ptr_.__value_;
  if (value) {
    return (uint64_t)(value[1] - *value) >> 2;
  }
  else {
    return 0;
  }
}

- (void)setObject:(id)a3 forIndex:(unint64_t)a4
{
  id v6 = a3;
  id v8 = v6;
  if (!v6)
  {
    id v6 = [MEMORY[0x1E4F1CA98] null];
  }
  [(NSMutableArray *)self->_objectStorage setObject:v6 atIndexedSubscript:a4];
  v7 = v8;
  if (!v8)
  {

    v7 = 0;
  }
}

- (id)objectForIndex:(unint64_t)a3
{
  id v3 = [(NSMutableArray *)self->_objectStorage objectAtIndexedSubscript:a3];
  id v4 = [MEMORY[0x1E4F1CA98] null];

  if (v3 == v4) {
    id v5 = 0;
  }
  else {
    id v5 = v3;
  }

  return v5;
}

- (void)setArraySharedPtr:(shared_ptr<std:(unint64_t)a4 :vector<float>>)a3 forIndex:
{
  uint64_t v4 = *(void *)self->_arrayValueStorage.__ptr_.__value_;
  if (a3.var1 >= (__shared_weak_count *)((*((void *)self->_arrayValueStorage.__ptr_.__value_ + 1) - v4) >> 4)) {
    std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
  }
  id v5 = (void *)(v4 + 16 * (uint64_t)a3.var1);
  uint64_t v7 = *(void *)a3.var0;
  uint64_t v6 = *((void *)a3.var0 + 1);
  if (v6) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
  }
  id v8 = (std::__shared_weak_count *)v5[1];
  void *v5 = v7;
  v5[1] = v6;
  if (v8)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
}

- (void)setArrayStorage:(void *)a3 forIndex:(unint64_t)a4
{
  uint64_t v7 = (char *)operator new(0x30uLL);
  *(_OWORD *)(v7 + 8) = 0u;
  *((void *)v7 + 3) = 0;
  *(void *)uint64_t v7 = &unk_1F2539B18;
  *((_OWORD *)v7 + 2) = 0u;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>((void *)v7 + 3, *(const void **)a3, *((void *)a3 + 1), (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 2);
  uint64_t v8 = *(void *)self->_arrayValueStorage.__ptr_.__value_;
  if (a4 >= (*((void *)self->_arrayValueStorage.__ptr_.__value_ + 1) - v8) >> 4) {
    std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
  }
  *(void *)&long long v9 = v7 + 24;
  *((void *)&v9 + 1) = v7;
  uint64_t v10 = v8 + 16 * a4;
  uint64_t v11 = *(std::__shared_weak_count **)(v10 + 8);
  *(_OWORD *)uint64_t v10 = v9;
  if (v11)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
}

- (void)setArrayValue:(id)a3 forIndex:(unint64_t)a4
{
  id v41 = a3;
  unint64_t v6 = [v41 count];
  uint64_t v7 = (char *)operator new(0x30uLL);
  uint64_t v8 = v7;
  *(_OWORD *)(v7 + 8) = 0u;
  *(void *)uint64_t v7 = &unk_1F2539B18;
  *((void *)v7 + 3) = 0;
  long long v9 = v7 + 24;
  *((_OWORD *)v7 + 2) = 0u;
  if (v6)
  {
    std::vector<float>::__vallocate[abi:ne180100]((void *)v7 + 3, v6);
    uint64_t v10 = (char *)*((void *)v8 + 4);
    bzero(v10, 4 * v6);
    *((void *)v8 + 4) = &v10[4 * v6];
  }
  uint64_t v11 = *(void *)self->_arrayValueStorage.__ptr_.__value_;
  if (a4 >= (*((void *)self->_arrayValueStorage.__ptr_.__value_ + 1) - v11) >> 4) {
    std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
  }
  *(void *)&long long v12 = v9;
  *((void *)&v12 + 1) = v8;
  uint64_t v13 = v11 + 16 * a4;
  v14 = *(std::__shared_weak_count **)(v13 + 8);
  *(_OWORD *)uint64_t v13 = v12;
  if (v14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v14);
  }
  uint64_t v15 = *(void *)self->_arrayValueStorage.__ptr_.__value_;
  if (a4 >= (*((void *)self->_arrayValueStorage.__ptr_.__value_ + 1) - v15) >> 4) {
    std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
  }
  long long v16 = *(char ***)(v15 + 16 * a4);
  unint64_t v17 = [v41 count];
  uint64_t v18 = *v16;
  uint64_t v19 = v16[1];
  unint64_t v20 = (v19 - *v16) >> 2;
  if (v17 <= v20)
  {
    if (v17 >= v20) {
      goto LABEL_24;
    }
    uint64_t v34 = &v18[4 * v17];
LABEL_21:
    v16[1] = v34;
    goto LABEL_24;
  }
  unint64_t v21 = v17 - v20;
  v22 = v16[2];
  if (v17 - v20 <= (v22 - v19) >> 2)
  {
    bzero(v16[1], 4 * v21);
    uint64_t v34 = &v19[4 * v21];
    goto LABEL_21;
  }
  if (v17 >> 62) {
    std::vector<PPTokenCount * {__strong}>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v23 = v22 - v18;
  uint64_t v24 = v23 >> 1;
  if (v23 >> 1 <= v17) {
    uint64_t v24 = v17;
  }
  if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFFCLL) {
    unint64_t v25 = 0x3FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v25 = v24;
  }
  id v26 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned short,unsigned short>>>(v25);
  v27 = *v16;
  v28 = v16[1];
  v29 = &v26[4 * v20];
  v31 = &v26[4 * v30];
  bzero(v29, 4 * v21);
  v32 = &v29[4 * v21];
  while (v28 != v27)
  {
    int v33 = *((_DWORD *)v28 - 1);
    v28 -= 4;
    *((_DWORD *)v29 - 1) = v33;
    v29 -= 4;
  }
  *long long v16 = v29;
  v16[1] = v32;
  v16[2] = v31;
  if (v27) {
    operator delete(v27);
  }
LABEL_24:
  for (unint64_t i = 0; i < [v41 count]; ++i)
  {
    v36 = [v41 objectAtIndexedSubscript:i];
    [v36 floatValue];
    uint64_t v38 = *(void *)self->_arrayValueStorage.__ptr_.__value_;
    if (a4 >= (*((void *)self->_arrayValueStorage.__ptr_.__value_ + 1) - v38) >> 4) {
      std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
    }
    v40 = *(uint64_t **)(v38 + 16 * a4);
    uint64_t v39 = *v40;
    if (i >= (v40[1] - *v40) >> 2) {
      std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
    }
    *(_DWORD *)(v39 + 4 * i) = v37;
  }
}

- (shared_ptr<std::vector<float>>)arraySharedPtrForIndex:(unint64_t)a3
{
  uint64_t v4 = *(void *)self->_arrayValueStorage.__ptr_.__value_;
  if (a3 >= (*((void *)self->_arrayValueStorage.__ptr_.__value_ + 1) - v4) >> 4) {
    std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
  }
  long long v5 = *(_OWORD *)(v4 + 16 * a3);
  *id v3 = v5;
  if (*((void *)&v5 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v5 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  result.var1 = (__shared_weak_count *)a2;
  result.var0 = self;
  return result;
}

- (id)arrayValueForIndex:(unint64_t)a3
{
  uint64_t v3 = *(void *)self->_arrayValueStorage.__ptr_.__value_;
  if (a3 >= (*((void *)self->_arrayValueStorage.__ptr_.__value_ + 1) - v3) >> 4) {
    std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
  }
  uint64_t v4 = v3 + 16 * a3;
  unint64_t v6 = *(void **)v4;
  long long v5 = *(std::__shared_weak_count **)(v4 + 8);
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:(uint64_t)(v6[1] - *v6) >> 2];
  long long v9 = (_DWORD *)*v6;
  uint64_t v10 = (_DWORD *)v6[1];
  if ((_DWORD *)*v6 != v10)
  {
    do
    {
      LODWORD(v8) = *v9;
      uint64_t v11 = [NSNumber numberWithFloat:v8];
      [v7 addObject:v11];

      ++v9;
    }
    while (v9 != v10);
  }
  long long v12 = (void *)[v7 copy];

  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  return v12;
}

- (void)setScalarValue:(float)a3 forIndex:(unint64_t)a4
{
  uint64_t v4 = *(void *)self->_scalarValueStorage.__ptr_.__value_;
  if (a4 >= (*((void *)self->_scalarValueStorage.__ptr_.__value_ + 1) - v4) >> 2) {
    std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
  }
  *(float *)(v4 + 4 * a4) = a3;
}

- (float)scalarValueForIndex:(unint64_t)a3
{
  uint64_t v3 = *(void *)self->_scalarValueStorage.__ptr_.__value_;
  if (a3 >= (*((void *)self->_scalarValueStorage.__ptr_.__value_ + 1) - v3) >> 2) {
    std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
  }
  return *(float *)(v3 + 4 * a3);
}

- (PPScoreDict)initWithScoreInputSet:(id)a3
{
  id v4 = a3;
  long long v5 = (PPScoreDict *)-[PPScoreDict initWithScalarValueCount:arrayValueCount:objectCount:scoreInputSet:](self, [v4 scalarScoreIndexUpperBound] - objc_msgSend(v4, "minScalarScoreIndex"), objc_msgSend(v4, "arrayScoreIndexUpperBound") - objc_msgSend(v4, "minArrayScoreIndex"), objc_msgSend(v4, "objectScoreIndexUpperBound") - objc_msgSend(v4, "minObjectScoreIndex"), v4);

  return v5;
}

- (id)initWithScalarValueCount:(uint64_t)a3 arrayValueCount:(uint64_t)a4 objectCount:(void *)a5 scoreInputSet:
{
  id v10 = a5;
  if (a1)
  {
    v20.receiver = a1;
    v20.super_class = (Class)PPScoreDict;
    uint64_t v11 = objc_msgSendSuper2(&v20, sel_init);
    a1 = v11;
    if (v11)
    {
      if (a2) {
        operator new();
      }
      uint64_t v17 = v11[2];
      *((void *)a1 + 2) = 0;
      if (v17) {
        std::default_delete<std::vector<float>>::operator()[abi:ne180100](v17);
      }
      if (a3)
      {
        long long v12 = operator new(0x30uLL);
        v12[1] = 0;
        v12[2] = 0;
        *long long v12 = &unk_1F2539B18;
        v12[3] = 0;
        v12[4] = 0;
        v12[5] = 0;
        operator new();
      }
      std::unique_ptr<std::vector<std::shared_ptr<std::vector<float>>>>::reset[abi:ne180100]((void ***)a1 + 3, 0);
      if (a4)
      {
        uint64_t v13 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a4];
        v14 = (void *)*((void *)a1 + 4);
        *((void *)a1 + 4) = v13;

        do
        {
          uint64_t v15 = (void *)*((void *)a1 + 4);
          long long v16 = [MEMORY[0x1E4F1CA98] null];
          [v15 addObject:v16];

          --a4;
        }
        while (a4);
      }
      else
      {
        uint64_t v18 = (void *)*((void *)a1 + 4);
        *((void *)a1 + 4) = 0;
      }
      objc_storeStrong((id *)a1 + 1, a5);
    }
  }

  return a1;
}

- (PPScoreDict)initWithScalarValueCount:(unint64_t)a3 arrayValueCount:(unint64_t)a4 objectCount:(unint64_t)a5
{
  return (PPScoreDict *)-[PPScoreDict initWithScalarValueCount:arrayValueCount:objectCount:scoreInputSet:](self, a3, a4, a5, 0);
}

@end