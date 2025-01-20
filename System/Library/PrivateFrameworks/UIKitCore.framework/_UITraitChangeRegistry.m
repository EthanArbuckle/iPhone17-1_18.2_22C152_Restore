@interface _UITraitChangeRegistry
- (_UITraitChangeRegistry)init;
- (_UITraitRegistration)registerForTraitTokenChanges:(void *)a3 withHandler:;
- (_UITraitRegistration)registerForTraitTokenChanges:(void *)a3 withTarget:(const char *)a4 action:(int)a5 targetIsSender:;
- (id).cxx_construct;
- (void)_addRegistration:(void *)a3 forTraitTokens:;
- (void)dealloc;
- (void)recordTraitUsage:(void *)a3 forTraitEnvironment:(unint64_t)a4 insideMethod:(const char *)a5 withInvalidationAction:;
- (void)registerAuxiliaryChildEnvironmentForTraitInvalidations:(uint64_t)a1;
- (void)traitsDidChange:(void *)a3 forTraitEnvironment:(void *)a4 withPreviousTraitCollection:;
- (void)unregisterAuxiliaryChildEnvironmentForTraitInvalidations:(uint64_t)a1;
- (void)unregisterForTraitChanges:(uint64_t)a1;
- (void)updateAuxiliaryChildrenTraitsIfNeeded;
@end

@implementation _UITraitChangeRegistry

- (void)updateAuxiliaryChildrenTraitsIfNeeded
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a1 && [*(id *)(a1 + 16) count])
  {
    v2 = (void *)[*(id *)(a1 + 16) copy];
    long long v7 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v3 = v2;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v8;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v8 != v5) {
            objc_enumerationMutation(v3);
          }
          objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "_updateAuxiliaryChildTraitsIfNeeded", (void)v7);
        }
        while (v4 != v6);
        uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
      }
      while (v4);
    }
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *((_DWORD *)self + 14) = 1065353216;
  return self;
}

- (void)recordTraitUsage:(void *)a3 forTraitEnvironment:(unint64_t)a4 insideMethod:(const char *)a5 withInvalidationAction:
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  long long v10 = v9;
  unint64_t v39 = a4;
  if (!a1) {
    goto LABEL_29;
  }
  if (v9)
  {
    if (a4) {
      goto LABEL_4;
    }
LABEL_31:
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:sel_recordTraitUsage_forTraitEnvironment_insideMethod_withInvalidationAction_, a1, @"_UITraitChangeRegistry.mm", 89, @"Invalid parameter not satisfying: %@", @"methodIMP != NULL" object file lineNumber description];

    if (a5) {
      goto LABEL_5;
    }
    goto LABEL_32;
  }
  v25 = [MEMORY[0x1E4F28B00] currentHandler];
  [v25 handleFailureInMethod:sel_recordTraitUsage_forTraitEnvironment_insideMethod_withInvalidationAction_, a1, @"_UITraitChangeRegistry.mm", 88, @"Invalid parameter not satisfying: %@", @"traitEnvironment != nil" object file lineNumber description];

  if (!a4) {
    goto LABEL_31;
  }
LABEL_4:
  if (a5) {
    goto LABEL_5;
  }
LABEL_32:
  v27 = [MEMORY[0x1E4F28B00] currentHandler];
  [v27 handleFailureInMethod:sel_recordTraitUsage_forTraitEnvironment_insideMethod_withInvalidationAction_, a1, @"_UITraitChangeRegistry.mm", 90, @"Invalid parameter not satisfying: %@", @"invalidationAction != NULL" object file lineNumber description];

LABEL_5:
  int8x8_t v11 = *(int8x8_t *)(a1 + 32);
  if (v11)
  {
    unint64_t v12 = 0x9DDFEA08EB382D69 * (((8 * a4) + 8) ^ HIDWORD(a4));
    unint64_t v13 = 0x9DDFEA08EB382D69 * (HIDWORD(a4) ^ (v12 >> 47) ^ v12);
    unint64_t v14 = 0x9DDFEA08EB382D69 * (v13 ^ (v13 >> 47));
    uint8x8_t v15 = (uint8x8_t)vcnt_s8(v11);
    v15.i16[0] = vaddlv_u8(v15);
    if (v15.u32[0] > 1uLL)
    {
      unint64_t v16 = v14;
      if (v14 >= *(void *)&v11) {
        unint64_t v16 = v14 % *(void *)&v11;
      }
    }
    else
    {
      unint64_t v16 = (*(void *)&v11 - 1) & v14;
    }
    v17 = *(void **)(*(void *)(a1 + 24) + 8 * v16);
    if (v17)
    {
      for (i = (void *)*v17; i; i = (void *)*i)
      {
        unint64_t v19 = i[1];
        if (v14 == v19)
        {
          if (i[2] == a4)
          {
            v20 = (void *)*((void *)std::__hash_table<std::__hash_value_type<void (*)(void),_UITrackedTraitUsageRecord>,std::__unordered_map_hasher<void (*)(void),std::__hash_value_type<void (*)(void),_UITrackedTraitUsageRecord>,std::hash<void (*)(void)>,std::equal_to<void (*)(void)>,true>,std::__unordered_map_equal<void (*)(void),std::__hash_value_type<void (*)(void),_UITrackedTraitUsageRecord>,std::equal_to<void (*)(void)>,std::hash<void (*)(void)>,true>,std::allocator<std::__hash_value_type<void (*)(void),_UITrackedTraitUsageRecord>>>::__emplace_unique_key_args<void (*)(void),std::piecewise_construct_t const&,std::tuple<void (* const&)(void)>,std::tuple<>>((float *)(a1 + 24), a4, &v39)+ 4);
            if (v20) {

            }
            break;
          }
        }
        else
        {
          if (v15.u32[0] > 1uLL)
          {
            if (v19 >= *(void *)&v11) {
              v19 %= *(void *)&v11;
            }
          }
          else
          {
            v19 &= *(void *)&v11 - 1;
          }
          if (v19 != v16) {
            break;
          }
        }
      }
    }
  }
  if (*(void *)a2) {
    id v21 = *(id *)a2;
  }
  long long v22 = *(_OWORD *)(a2 + 16);
  long long v36 = *(_OWORD *)a2;
  long long v37 = v22;
  uint64_t v38 = *(void *)(a2 + 32);
  v23 = std::__hash_table<std::__hash_value_type<void (*)(void),_UITrackedTraitUsageRecord>,std::__unordered_map_hasher<void (*)(void),std::__hash_value_type<void (*)(void),_UITrackedTraitUsageRecord>,std::hash<void (*)(void)>,std::equal_to<void (*)(void)>,true>,std::__unordered_map_equal<void (*)(void),std::__hash_value_type<void (*)(void),_UITrackedTraitUsageRecord>,std::equal_to<void (*)(void)>,std::hash<void (*)(void)>,true>,std::allocator<std::__hash_value_type<void (*)(void),_UITrackedTraitUsageRecord>>>::__emplace_unique_key_args<void (*)(void),std::piecewise_construct_t const&,std::tuple<void (* const&)(void)>,std::tuple<>>((float *)(a1 + 24), a4, &v39);
  *((void *)v23 + 3) = a5;
  long long v24 = v37;
  *((_OWORD *)v23 + 2) = v36;
  *((_OWORD *)v23 + 3) = v24;
  *((void *)v23 + 8) = v38;
  if (qword_1EB261708 != -1) {
    dispatch_once(&qword_1EB261708, &__block_literal_global_311);
  }
  if (_MergedGlobals_1114)
  {
    v28 = _UITraitTokenSetCount(a2);
    if (v28)
    {
      v29 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v28];
      v34[0] = (void (*)(void, void, void))MEMORY[0x1E4F143A8];
      v34[1] = (void (*)(void, void, void))3221225472;
      v34[2] = (void (*)(void, void, void))__99___UITraitChangeRegistry_recordTraitUsage_forTraitEnvironment_insideMethod_withInvalidationAction___block_invoke;
      v34[3] = (void (*)(void, void, void))&unk_1E52DAEF0;
      id v30 = v29;
      id v35 = v30;
      _UITraitTokenSetEnumerate((uint64_t *)a2, v34);
      v31 = [v30 componentsJoinedByString:@", "];
    }
    else
    {
      v31 = @"none";
    }
    v32 = *(id *)(__UILogGetCategoryCachedImpl("TraitUsageTracking", &qword_1EB2616F0) + 8);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v33 = NSStringFromSelector(a5);
      *(_DWORD *)buf = 138412802;
      v41 = v33;
      __int16 v42 = 2112;
      v43 = v10;
      __int16 v44 = 2112;
      v45 = v31;
      _os_log_impl(&dword_1853B0000, v32, OS_LOG_TYPE_ERROR, "Tracked trait usage with invalidation action -%@ for %@\n\t► traits used: { %@ }", buf, 0x20u);
    }
  }
LABEL_29:
}

- (_UITraitChangeRegistry)init
{
  v6.receiver = self;
  v6.super_class = (Class)_UITraitChangeRegistry;
  v2 = [(_UITraitChangeRegistry *)&v6 init];
  if (v2)
  {
    id v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    registrations = v2->_registrations;
    v2->_registrations = v3;
  }
  return v2;
}

- (_UITraitRegistration)registerForTraitTokenChanges:(void *)a3 withHandler:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    if (dyld_program_sdk_at_least())
    {
      if (![v5 count])
      {
        long long v7 = [MEMORY[0x1E4F28B00] currentHandler];
        [v7 handleFailureInMethod:sel_registerForTraitTokenChanges_withHandler_ object:a1 file:@"_UITraitChangeRegistry.mm" lineNumber:136 description:@"Must pass one or more traits to register for"];
      }
    }
    else if (![v5 count])
    {
      unint64_t v13 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &-[_UITraitChangeRegistry registerForTraitTokenChanges:withHandler:]::__s_category)+ 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14[0] = 0;
        _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_ERROR, "Must pass one or more traits to register for", (uint8_t *)v14, 2u);
      }
    }
    if (!v6)
    {
      unint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:sel_registerForTraitTokenChanges_withHandler_ object:a1 file:@"_UITraitChangeRegistry.mm" lineNumber:137 description:@"Must pass a non-nil trait change handler to register"];
    }
    long long v8 = objc_alloc_init(_UITraitRegistration);
    long long v10 = v8;
    if (v8) {
      objc_setProperty_nonatomic_copy(v8, v9, v6, 16);
    }
    -[_UITraitChangeRegistry _addRegistration:forTraitTokens:](a1, v10, v5);
  }
  else
  {
    long long v10 = 0;
  }

  return v10;
}

- (void)_addRegistration:(void *)a3 forTraitTokens:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v22 = 0;
  memset(v21, 0, sizeof(v21));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v6);
        }
        CFNumberRef v10 = *(const __CFNumber **)(*((void *)&v17 + 1) + 8 * i);
        unint64_t v11 = _UIGetTraitTokenValue(v10);
        if ((_UITraitTokenSetContains((uint16x8_t **)v21, v11) & 1) == 0)
        {
          _UITraitTokenSetInsert((uint64_t *)v21, v11, v12);
          unint64_t v13 = [*(id *)(a1 + 8) objectForKey:v10];
          unint64_t v14 = v13;
          if (v13)
          {
            [v13 addObject:v5];
          }
          else
          {
            uint8x8_t v15 = *(void **)(a1 + 8);
            unint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithObjects:", v5, 0);
            [v15 setObject:v16 forKey:v10];
          }
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v7);
  }

  if (*(void *)&v21[0]) {
}
  }

- (void)traitsDidChange:(void *)a3 forTraitEnvironment:(void *)a4 withPreviousTraitCollection:
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!a1) {
    goto LABEL_37;
  }
  if (a2)
  {
    if (v7) {
      goto LABEL_4;
    }
LABEL_39:
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:sel_traitsDidChange_forTraitEnvironment_withPreviousTraitCollection_, a1, @"_UITraitChangeRegistry.mm", 205, @"Invalid parameter not satisfying: %@", @"traitEnvironment != nil" object file lineNumber description];

    if (v8) {
      goto LABEL_5;
    }
LABEL_40:
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:sel_traitsDidChange_forTraitEnvironment_withPreviousTraitCollection_, a1, @"_UITraitChangeRegistry.mm", 206, @"Invalid parameter not satisfying: %@", @"previousTraitCollection != nil" object file lineNumber description];

    goto LABEL_5;
  }
  v25 = [MEMORY[0x1E4F28B00] currentHandler];
  [v25 handleFailureInMethod:sel_traitsDidChange_forTraitEnvironment_withPreviousTraitCollection_, a1, @"_UITraitChangeRegistry.mm", 204, @"Invalid parameter not satisfying: %@", @"traitTokens != NULL" object file lineNumber description];

  if (!v7) {
    goto LABEL_39;
  }
LABEL_4:
  if (!v8) {
    goto LABEL_40;
  }
LABEL_5:
  if (_UITraitTokenSetCount((uint64_t)a2)
    && ([*(id *)(a1 + 8) count] || objc_msgSend(*(id *)(a1 + 16), "count") || *(void *)(a1 + 48)))
  {
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v43[0] = (void (*)(void, void, void))MEMORY[0x1E4F143A8];
    v43[1] = (void (*)(void, void, void))3221225472;
    v43[2] = (void (*)(void, void, void))__90___UITraitChangeRegistry_traitsDidChange_forTraitEnvironment_withPreviousTraitCollection___block_invoke;
    v43[3] = (void (*)(void, void, void))&unk_1E52F38F8;
    v43[4] = (void (*)(void, void, void))a1;
    v43[5] = (void (*)(void, void, void))&v44;
    _UITraitTokenSetEnumerate(a2, v43);
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    if (*(void *)(a1 + 48))
    {
      id v9 = *(void **)(a1 + 40);
      if (v9)
      {
        do
        {
          if (_UITraitTokenSetIntersectsSet((uint64_t)(v9 + 4), (uint64_t)a2)) {
            __UIInlinePointerSetInsertElement((uint64_t *)&v35, v9[3], 0);
          }
          id v9 = (void *)*v9;
        }
        while (v9);
        uint64_t v10 = v35;
        if ((void)v35)
        {
          id v11 = v7;
          id v12 = v8;
          if (qword_1EB261708 != -1) {
            dispatch_once(&qword_1EB261708, &__block_literal_global_311);
          }
          if (_MergedGlobals_1114) {
            unint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v10];
          }
          else {
            unint64_t v13 = 0;
          }
          *(void *)&long long v52 = MEMORY[0x1E4F143A8];
          *((void *)&v52 + 1) = 3221225472;
          *(void *)&long long v53 = __108___UITraitChangeRegistry__performTrackedTraitInvalidations_forTraitEnvironment_withPreviousTraitCollection___block_invoke;
          *((void *)&v53 + 1) = &unk_1E52F3920;
          id v14 = v11;
          *(void *)&long long v54 = v14;
          id v15 = v13;
          *((void *)&v54 + 1) = v15;
          _UIInlinePointerSetEnumerate(&v35, &v52);
          if (v15)
          {
            v34 = [v14 traitCollection];
            v31 = *(id *)(__UILogGetCategoryCachedImpl("TraitCollectionChange", &qword_1EB2616F8)+ 8);
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              v33 = [v15 componentsJoinedByString:@", "];
              v32 = +[UITraitCollection _descriptionForChangeFromTraitCollection:v12 toTraitCollection:v34];
              *(_DWORD *)buf = 138413314;
              *(void *)&uint8_t buf[4] = v14;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v33;
              *(_WORD *)&buf[22] = 2112;
              v57 = v32;
              *(_WORD *)v58 = 2112;
              *(void *)&v58[2] = v12;
              *(_WORD *)&v58[10] = 2112;
              *(void *)&v58[12] = v34;
              _os_log_impl(&dword_1853B0000, v31, OS_LOG_TYPE_ERROR, "Traits with tracked usage changed for %@\n\t► performed invalidation selectors: [ %@ ]\n\t► trait changes: %@\n\t► previous: %@\n\t► current: %@", buf, 0x34u);
            }
          }
        }
      }
    }
    if ((void)v44)
    {
      id v16 = v7;
      id v17 = v8;
      if (_UIShouldLogTraitRegistryChange())
      {
        v28 = [v16 traitCollection];
        v29 = *(id *)(__UILogGetCategoryCachedImpl("TraitCollectionChange", &qword_1EB261700) + 8);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          id v30 = +[UITraitCollection _descriptionForChangeFromTraitCollection:v17 toTraitCollection:v28];
          *(_DWORD *)buf = 138413058;
          *(void *)&uint8_t buf[4] = v16;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v30;
          *(_WORD *)&buf[22] = 2112;
          v57 = v17;
          *(_WORD *)v58 = 2112;
          *(void *)&v58[2] = v28;
          _os_log_impl(&dword_1853B0000, v29, OS_LOG_TYPE_ERROR, "Traits changed for %@\n\t► trait changes: %@\n\t► previous: %@\n\t► current: %@", buf, 0x2Au);
        }
      }
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __103___UITraitChangeRegistry__performTraitChangeCallbacks_forTraitEnvironment_withPreviousTraitCollection___block_invoke;
      v57 = &unk_1E52F3920;
      id v18 = v16;
      *(void *)v58 = v18;
      id v19 = v17;
      *(void *)&v58[8] = v19;
      _UIInlinePointerSetEnumerate(&v44, buf);
    }
    if ([*(id *)(a1 + 16) count])
    {
      long long v20 = (void *)[*(id *)(a1 + 16) copy];
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id v21 = v20;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v52 objects:buf count:16];
      if (v22)
      {
        uint64_t v23 = *(void *)v53;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v53 != v23) {
              objc_enumerationMutation(v21);
            }
            [*(id *)(*((void *)&v52 + 1) + 8 * i) _invalidateAuxiliaryChildTraits];
          }
          uint64_t v22 = [v21 countByEnumeratingWithState:&v52 objects:buf count:16];
        }
        while (v22);
      }
    }
    if ((void)v36) {

    }
    _UIInlinePointerSetEnumerate(&v44, &__block_literal_global_160_0);
    if ((void)v45) {
  }
    }
LABEL_37:
}

- (void).cxx_destruct
{
  next = self->_traitUsageRecordsByMethodIMP.__table_.__p1_.__value_.__next_;
  if (next)
  {
    do
    {
      uint64_t v4 = (void *)*next;
      operator delete(next);
      next = v4;
    }
    while (v4);
  }
  value = self->_traitUsageRecordsByMethodIMP.__table_.__bucket_list_.__ptr_.__value_;
  self->_traitUsageRecordsByMethodIMP.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value) {
    operator delete(value);
  }
  objc_storeStrong((id *)&self->_auxiliaryChildTraitEnvironments, 0);
  objc_storeStrong((id *)&self->_registrations, 0);
}

- (_UITraitRegistration)registerForTraitTokenChanges:(void *)a3 withTarget:(const char *)a4 action:(int)a5 targetIsSender:
{
  id v9 = a2;
  id v10 = a3;
  if (a1)
  {
    if (dyld_program_sdk_at_least())
    {
      if (![v9 count])
      {
        id v11 = [MEMORY[0x1E4F28B00] currentHandler];
        [v11 handleFailureInMethod:sel_registerForTraitTokenChanges_withTarget_action_targetIsSender_ object:a1 file:@"_UITraitChangeRegistry.mm" lineNumber:145 description:@"Must pass one or more traits to register for"];
      }
    }
    else if (![v9 count])
    {
      id v18 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &-[_UITraitChangeRegistry registerForTraitTokenChanges:withTarget:action:targetIsSender:]::__s_category)+ 8);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19[0] = 0;
        _os_log_impl(&dword_1853B0000, v18, OS_LOG_TYPE_ERROR, "Must pass one or more traits to register for", (uint8_t *)v19, 2u);
      }
    }
    if (v10)
    {
      if (a4) {
        goto LABEL_8;
      }
    }
    else
    {
      id v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:sel_registerForTraitTokenChanges_withTarget_action_targetIsSender_ object:a1 file:@"_UITraitChangeRegistry.mm" lineNumber:146 description:@"Must pass a non-nil target to register for trait changes"];

      if (a4) {
        goto LABEL_8;
      }
    }
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:sel_registerForTraitTokenChanges_withTarget_action_targetIsSender_ object:a1 file:@"_UITraitChangeRegistry.mm" lineNumber:147 description:@"Must pass a nonnull action selector to register for trait changes"];

LABEL_8:
    id v12 = objc_alloc_init(_UITraitRegistration);
    unint64_t v13 = v12;
    if (a5)
    {
      if (v12)
      {
        v12->_targetIsSender = 1;
LABEL_13:
        if (a4) {
          id v14 = a4;
        }
        else {
          id v14 = 0;
        }
        v13->_action = v14;
      }
    }
    else if (v12)
    {
      objc_storeWeak(&v12->_target, v10);
      goto LABEL_13;
    }
    -[_UITraitChangeRegistry _addRegistration:forTraitTokens:](a1, v13, v9);
    goto LABEL_18;
  }
  unint64_t v13 = 0;
LABEL_18:

  return v13;
}

- (void)dealloc
{
  for (uint64_t i = self->_traitUsageRecordsByMethodIMP.__table_.__p1_.__value_.__next_; i; uint64_t i = (void *)*i)
  {
    uint64_t v4 = (void *)i[4];
    if (v4) {
  }
    }
  v5.receiver = self;
  v5.super_class = (Class)_UITraitChangeRegistry;
  [(_UITraitChangeRegistry *)&v5 dealloc];
}

- (void)unregisterForTraitChanges:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      id v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:sel_unregisterForTraitChanges_ object:a1 file:@"_UITraitChangeRegistry.mm" lineNumber:160 description:@"Must pass a non-nil registration to unregister"];
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v14 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v11 = 0u;
    objc_super v5 = *(void **)(a1 + 8);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __52___UITraitChangeRegistry_unregisterForTraitChanges___block_invoke;
    v8[3] = &unk_1E52F38A8;
    id v9 = v4;
    id v10 = &v11;
    [v5 enumerateKeysAndObjectsUsingBlock:v8];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __52___UITraitChangeRegistry_unregisterForTraitChanges___block_invoke_2;
    v7[3] = &unk_1E52F38D0;
    v7[4] = a1;
    _UIInlinePointerSetEnumerate(&v11, v7);
    if ((void)v12) {
  }
    }
}

- (void)registerAuxiliaryChildEnvironmentForTraitInvalidations:(uint64_t)a1
{
  id v10 = a2;
  if (a1)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      id v6 = [MEMORY[0x1E4F28B00] currentHandler];
      id v7 = NSStringFromSelector(sel__invalidateAuxiliaryChildTraits);
      [v6 handleFailureInMethod:sel_registerAuxiliaryChildEnvironmentForTraitInvalidations_, a1, @"_UITraitChangeRegistry.mm", 181, @"Child must implement -%@ to handle trait invalidations: %@", v7, v10 object file lineNumber description];
    }
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      id v8 = [MEMORY[0x1E4F28B00] currentHandler];
      id v9 = NSStringFromSelector(sel__updateAuxiliaryChildTraitsIfNeeded);
      [v8 handleFailureInMethod:sel_registerAuxiliaryChildEnvironmentForTraitInvalidations_, a1, @"_UITraitChangeRegistry.mm", 183, @"Child must implement -%@ to handle trait updates: %@", v9, v10 object file lineNumber description];
    }
    id v3 = *(void **)(a1 + 16);
    if (!v3)
    {
      uint64_t v4 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:1];
      objc_super v5 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v4;

      id v3 = *(void **)(a1 + 16);
    }
    [v3 addObject:v10];
  }
}

- (void)unregisterAuxiliaryChildEnvironmentForTraitInvalidations:(uint64_t)a1
{
  id v3 = a2;
  if (a1) {
    [*(id *)(a1 + 16) removeObject:v3];
  }
}

@end