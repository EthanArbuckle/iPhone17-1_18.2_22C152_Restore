@interface PPScoreInterpreterBytecode
+ (id)_bytecodeInstructionForOp:(void *)a3 unsignedIntegerArgument:(void *)a4 doubleArgument:(void *)a5 objectArgument:;
+ (id)_compileToBytecode:(void *)a3 handleDependency:(void *)a4 handleScoreInputsNeeded:(void *)a5 handleRetainedObject:;
+ (id)bytecodeFromAsset:(id)a3;
+ (id)bytecodeFromFactorName:(id)a3 namespaceName:(id)a4;
+ (id)scoreInterpreterParseRootFromAsset:(id)a3 scalarSubscoreCount:(unint64_t *)a4 arraySubscoreCount:(unint64_t *)a5 objectSubscoreCount:(unint64_t *)a6;
- (PPScoreInterpreterBytecode)initWithParseRoot:(id)a3 scalarSubscoreCount:(unint64_t)a4 arraySubscoreCount:(unint64_t)a5 objectSubscoreCount:(unint64_t)a6;
- (__CFBitVector)arrayScoreInputsNeeded;
- (__CFBitVector)objectScoreInputsNeeded;
- (__CFBitVector)scalarScoreInputsNeeded;
- (id).cxx_construct;
- (void)dealloc;
- (void)resolveSubscoreDependencies:(uint64_t)a3 resolved:(uint64_t *)a4 unresolved:(void *)a5 resolvedOrdering:;
@end

@implementation PPScoreInterpreterBytecode

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 4) = 0;
  return self;
}

- (void).cxx_destruct
{
  std::unique_ptr<std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>>::reset[abi:ne180100]((void ***)&self->_subscoreDependencies, 0);
  objc_storeStrong((id *)&self->_bytecodeRetainedObjectSlots, 0);
  objc_storeStrong((id *)&self->_bytecodeDataBySubscoreTypeAndIndex, 0);
  value = self->_subscoreComputeOrder.__ptr_.__value_;
  self->_subscoreComputeOrder.__ptr_.__value_ = 0;
  if (value)
  {
    std::default_delete<std::vector<PPSubscoreIdentifier>>::operator()[abi:ne180100]((uint64_t)value);
  }
}

- (__CFBitVector)objectScoreInputsNeeded
{
  return self->_objectScoreInputsNeeded;
}

- (__CFBitVector)arrayScoreInputsNeeded
{
  return self->_arrayScoreInputsNeeded;
}

- (__CFBitVector)scalarScoreInputsNeeded
{
  return self->_scalarScoreInputsNeeded;
}

- (void)dealloc
{
  CFRelease(self->_scalarScoreInputsNeeded);
  CFRelease(self->_arrayScoreInputsNeeded);
  CFRelease(self->_objectScoreInputsNeeded);
  v3.receiver = self;
  v3.super_class = (Class)PPScoreInterpreterBytecode;
  [(PPScoreInterpreterBytecode *)&v3 dealloc];
}

- (PPScoreInterpreterBytecode)initWithParseRoot:(id)a3 scalarSubscoreCount:(unint64_t)a4 arraySubscoreCount:(unint64_t)a5 objectSubscoreCount:(unint64_t)a6
{
  v30[3] = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PPScoreInterpreterBytecode;
  if ([(PPScoreInterpreterBytecode *)&v19 init])
  {
    std::vector<std::unordered_set<PPSubscoreIdentifier>>::vector(&v28, a4);
    std::vector<std::unordered_set<PPSubscoreIdentifier>>::vector(&v29, a5);
    std::vector<std::unordered_set<PPSubscoreIdentifier>>::vector(v30, a6);
    long long v25 = 0uLL;
    *(void *)&long long v26 = 0;
    v20 = &v25;
    uint64_t v21 = 0;
    uint64_t v10 = 0;
    *(void *)&long long v25 = operator new(0x48uLL);
    *((void *)&v25 + 1) = v25;
    *(void *)&long long v26 = v25 + 72;
    v24[0] = v25;
    v22[0] = &v26;
    v22[1] = &v27;
    v22[2] = v24;
    uint64_t v23 = 0;
    v11 = (void *)v25;
    uint64_t v27 = v25;
    while (1)
    {
      v12 = &v28 + 3 * v10;
      void *v11 = 0;
      v11[1] = 0;
      v11[2] = 0;
      uint64_t v13 = *v12;
      uint64_t v14 = v12[1];
      v24[3] = v11;
      if (v14 != v13)
      {
        v24[4] = 0;
        std::vector<std::unordered_set<PPSubscoreIdentifier>>::__vallocate[abi:ne180100](v11, 0xCCCCCCCCCCCCCCCDLL * ((v14 - v13) >> 3));
        uint64_t v15 = v11[1];
        do
        {
          *(_OWORD *)uint64_t v15 = 0u;
          *(_OWORD *)(v15 + 16) = 0u;
          *(_DWORD *)(v15 + 32) = *(_DWORD *)(v13 + 32);
          std::__hash_table<PPSubscoreIdentifier,std::hash<PPSubscoreIdentifier>,std::equal_to<PPSubscoreIdentifier>,std::allocator<PPSubscoreIdentifier>>::__rehash<true>(v15, *(void *)(v13 + 8));
          for (i = *(unsigned __int8 **)(v13 + 16); i; i = *(unsigned __int8 **)i)
            std::__hash_table<PPSubscoreIdentifier,std::hash<PPSubscoreIdentifier>,std::equal_to<PPSubscoreIdentifier>,std::allocator<PPSubscoreIdentifier>>::__emplace_unique_key_args<PPSubscoreIdentifier,PPSubscoreIdentifier const&>(v15, i + 16, *((_DWORD *)i + 4));
          v13 += 40;
          v15 += 40;
        }
        while (v13 != v14);
        v11[1] = v15;
        v11 = (void *)v24[0];
      }
      ++v10;
      v11 += 3;
      v24[0] = v11;
      if (v10 == 3)
      {
        LOBYTE(v23) = 1;
        std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<std::unordered_set<PPSubscoreIdentifier>>>,std::vector<std::unordered_set<PPSubscoreIdentifier>>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v22);
        *((void *)&v25 + 1) = v11;
        operator new();
      }
    }
  }

  return 0;
}

uint64_t __47__PPScoreInterpreterBytecode__compileBytecode___block_invoke(uint64_t a1, unsigned __int8 a2, __int16 a3)
{
  LOWORD(v8) = a2;
  HIWORD(v8) = a3;
  uint64_t v3 = **(void **)(*(void *)(a1 + 32) + 32);
  if (0xAAAAAAAAAAAAAAABLL * ((*(void *)(*(void *)(*(void *)(a1 + 32) + 32) + 8) - v3) >> 3) <= *(unsigned __int8 *)(a1 + 48)) {
    std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
  }
  unint64_t v4 = *(void *)(a1 + 40);
  v6 = (uint64_t *)(v3 + 24 * *(unsigned __int8 *)(a1 + 48));
  uint64_t v5 = *v6;
  if (0xCCCCCCCCCCCCCCCDLL * ((v6[1] - *v6) >> 3) <= v4) {
    std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
  }
  return std::__hash_table<PPSubscoreIdentifier,std::hash<PPSubscoreIdentifier>,std::equal_to<PPSubscoreIdentifier>,std::allocator<PPSubscoreIdentifier>>::__emplace_unique_key_args<PPSubscoreIdentifier,PPSubscoreIdentifier const&>(v5 + 40 * v4, (unsigned __int8 *)&v8, v8);
}

void __47__PPScoreInterpreterBytecode__compileBytecode___block_invoke_2(CFBitVectorRef *a1, uint64_t a2, CFIndex a3)
{
  switch(a2)
  {
    case 401:
      unint64_t v4 = a1 + 6;
      break;
    case 301:
      unint64_t v4 = a1 + 5;
      break;
    case 201:
      unint64_t v4 = a1 + 4;
      break;
    default:
      __break(1u);
      return;
  }
  uint64_t v5 = *v4;
  unint64_t Count = CFBitVectorGetCount(*v4);
  if (Count <= a3 + 1) {
    CFIndex v7 = a3 + 1;
  }
  else {
    CFIndex v7 = Count;
  }
  CFBitVectorSetCount(v5, v7);
  CFBitVectorSetBitAtIndex(v5, a3, 1u);
}

uint64_t __47__PPScoreInterpreterBytecode__compileBytecode___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) count];
  [*(id *)(a1 + 32) addObject:v3];

  return v4;
}

+ (id)_compileToBytecode:(void *)a3 handleDependency:(void *)a4 handleScoreInputsNeeded:(void *)a5 handleRetainedObject:
{
  id v9 = a2;
  uint64_t v10 = a3;
  v11 = a4;
  v50 = a5;
  uint64_t v12 = self;
  uint64_t v13 = [v9 objectAtIndexedSubscript:0];
  int v14 = [v13 intValue];
  unsigned __int16 v15 = v14;
  uint64_t v16 = v14;

  if (v16 > 300)
  {
    switch(v16)
    {
      case 401:
        goto LABEL_8;
      case 402:
        if (!v10) {
          goto LABEL_21;
        }
        v17 = [v9 objectAtIndexedSubscript:1];
        v10[2](v10, 2, (unsigned __int16)[v17 intValue]);
        goto LABEL_20;
      case 403:
        goto LABEL_21;
      case 404:
        id v18 = [v9 objectAtIndexedSubscript:1];
        if (v50)
        {
          v22 = [NSNumber numberWithUnsignedInteger:v50[2]()];
          uint64_t v5 = +[PPScoreInterpreterBytecode _bytecodeInstructionForOp:unsignedIntegerArgument:doubleArgument:objectArgument:](v12, 65532, v22, 0, 0);
          goto LABEL_34;
        }
        uint64_t v31 = +[PPScoreInterpreterBytecode _bytecodeInstructionForOp:unsignedIntegerArgument:doubleArgument:objectArgument:](v12, v15, 0, 0, v18);
        break;
      default:
        goto LABEL_24;
    }
    goto LABEL_22;
  }
  switch(v16)
  {
    case 201:
LABEL_8:
      if (!v11) {
        goto LABEL_21;
      }
      v17 = [v9 objectAtIndexedSubscript:1];
      v11[2](v11, v16, (int)[v17 intValue]);
      goto LABEL_20;
    case 202:
      if (!v10) {
        goto LABEL_21;
      }
      v17 = [v9 objectAtIndexedSubscript:1];
      v10[2](v10, 0, (unsigned __int16)[v17 intValue]);
LABEL_20:

LABEL_21:
      id v18 = [v9 objectAtIndexedSubscript:1];
      uint64_t v31 = +[PPScoreInterpreterBytecode _bytecodeInstructionForOp:unsignedIntegerArgument:doubleArgument:objectArgument:](v12, v15, v18, 0, 0);
      goto LABEL_22;
    case 203:
      goto LABEL_21;
    case 204:
      id v18 = [v9 objectAtIndexedSubscript:1];
      uint64_t v31 = +[PPScoreInterpreterBytecode _bytecodeInstructionForOp:unsignedIntegerArgument:doubleArgument:objectArgument:](v12, 204, 0, v18, 0);
      goto LABEL_22;
    default:
      if (v16 == -1)
      {
        uint64_t v5 = [MEMORY[0x1E4F1C9B8] data];
        goto LABEL_24;
      }
      if (v16 != 101) {
        goto LABEL_24;
      }
      id v18 = [v9 objectAtIndexedSubscript:2];
      uint64_t v48 = [v18 count];
      objc_super v19 = [v9 objectAtIndexedSubscript:1];
      int v20 = [v19 intValue];

      if (v20 != -1)
      {
        if (v20 == 14)
        {
          if (v48 != 2)
          {
            v44 = [MEMORY[0x1E4F28B00] currentHandler];
            [v44 handleFailureInMethod:sel__compileToBytecode_handleDependency_handleScoreInputsNeeded_handleRetainedObject_, v12, @"PPScoreInterpreter.mm", 669, @"Invalid parameter not satisfying: %@", @"argCount == 2" object file lineNumber description];
          }
          v33 = [v18 objectAtIndexedSubscript:1];
          v22 = +[PPScoreInterpreterBytecode _compileToBytecode:handleDependency:handleScoreInputsNeeded:handleRetainedObject:](v12, v33, v10, v11, v50);

          v34 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v22, "length"));
          v49 = +[PPScoreInterpreterBytecode _bytecodeInstructionForOp:unsignedIntegerArgument:doubleArgument:objectArgument:](v12, 65534, v34, 0, 0);

          v35 = [v18 objectAtIndexedSubscript:0];
          long long v26 = +[PPScoreInterpreterBytecode _compileToBytecode:handleDependency:handleScoreInputsNeeded:handleRetainedObject:](v12, v35, v10, v11, v50);

          uint64_t v5 = (void *)[v26 mutableCopy];
          [v5 appendData:v49];
          [v5 appendData:v22];
          goto LABEL_33;
        }
        if (v20 == 10)
        {
          if (v48 != 3)
          {
            v43 = [MEMORY[0x1E4F28B00] currentHandler];
            [v43 handleFailureInMethod:sel__compileToBytecode_handleDependency_handleScoreInputsNeeded_handleRetainedObject_, v12, @"PPScoreInterpreter.mm", 632, @"Invalid parameter not satisfying: %@", @"argCount == 3" object file lineNumber description];
          }
          uint64_t v21 = [v18 objectAtIndexedSubscript:1];
          v22 = +[PPScoreInterpreterBytecode _compileToBytecode:handleDependency:handleScoreInputsNeeded:handleRetainedObject:](v12, v21, v10, v11, v50);

          uint64_t v23 = [v18 objectAtIndexedSubscript:2];
          v24 = +[PPScoreInterpreterBytecode _compileToBytecode:handleDependency:handleScoreInputsNeeded:handleRetainedObject:](v12, v23, v10, v11, v50);

          v49 = v24;
          long long v25 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v24, "length"));
          long long v26 = +[PPScoreInterpreterBytecode _bytecodeInstructionForOp:unsignedIntegerArgument:doubleArgument:objectArgument:](v12, 0xFFFFLL, v25, 0, 0);

          uint64_t v27 = [v18 objectAtIndexedSubscript:0];
          uint64_t v28 = +[PPScoreInterpreterBytecode _compileToBytecode:handleDependency:handleScoreInputsNeeded:handleRetainedObject:](v12, v27, v10, v11, v50);

          uint64_t v29 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v26, "length") + objc_msgSend(v22, "length"));
          v30 = +[PPScoreInterpreterBytecode _bytecodeInstructionForOp:unsignedIntegerArgument:doubleArgument:objectArgument:](v12, 65533, v29, 0, 0);

          uint64_t v5 = (void *)[v28 mutableCopy];
          [v5 appendData:v30];
          [v5 appendData:v22];
          [v5 appendData:v26];
          [v5 appendData:v49];

LABEL_33:
LABEL_34:

          goto LABEL_23;
        }
        unsigned __int16 v47 = v20;
        if ((unint64_t)(v20 - 17) < 2)
        {
          if ([v18 count]) {
            goto LABEL_42;
          }
          v36 = [MEMORY[0x1E4F28B00] currentHandler];
          [v36 handleFailureInMethod:sel__compileToBytecode_handleDependency_handleScoreInputsNeeded_handleRetainedObject_, v12, @"PPScoreInterpreter.mm", 699, @"Invalid parameter not satisfying: %@", @"argArray.count >= 1" object file lineNumber description];
        }
        else
        {
          if (v20 != 21 && v20 != 19 || (unint64_t)[v18 count] > 1) {
            goto LABEL_42;
          }
          v36 = [MEMORY[0x1E4F28B00] currentHandler];
          [v36 handleFailureInMethod:sel__compileToBytecode_handleDependency_handleScoreInputsNeeded_handleRetainedObject_, v12, @"PPScoreInterpreter.mm", 695, @"Invalid parameter not satisfying: %@", @"argArray.count >= 2" object file lineNumber description];
        }

LABEL_42:
        self;
        unint64_t v46 = 0x17C0013uLL >> (v20 + 1);
        if ((v46 & 1) == 0)
        {
          uint64_t v37 = qword_1CAB7BAE8[v20 + 1];
          if ([v18 count] != v37)
          {
            v45 = [MEMORY[0x1E4F28B00] currentHandler];
            objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", sel__compileToBytecode_handleDependency_handleScoreInputsNeeded_handleRetainedObject_, v12, @"PPScoreInterpreter.mm", 708, @"expected argArray.count (%tu) == expected count (%tu) for operator %hu", objc_msgSend(v18, "count"), v37, (unsigned __int16)v20);
          }
        }
        uint64_t v5 = objc_opt_new();
        if (v48)
        {
          for (uint64_t i = 0; i != v48; ++i)
          {
            v39 = (void *)MEMORY[0x1CB79D060]();
            v40 = [v18 objectAtIndexedSubscript:i];
            v41 = +[PPScoreInterpreterBytecode _compileToBytecode:handleDependency:handleScoreInputsNeeded:handleRetainedObject:](v12, v40, v10, v11, v50);
            [v5 appendData:v41];
          }
        }
        if (v46)
        {
          v42 = [NSNumber numberWithUnsignedInteger:v48];
          v22 = +[PPScoreInterpreterBytecode _bytecodeInstructionForOp:unsignedIntegerArgument:doubleArgument:objectArgument:](v12, v47, v42, 0, 0);
        }
        else
        {
          v22 = +[PPScoreInterpreterBytecode _bytecodeInstructionForOp:unsignedIntegerArgument:doubleArgument:objectArgument:](v12, v47, 0, 0, 0);
        }
        [v5 appendData:v22];
        goto LABEL_34;
      }
      uint64_t v31 = [MEMORY[0x1E4F1C9B8] data];
LABEL_22:
      uint64_t v5 = (void *)v31;
LABEL_23:

LABEL_24:
      return v5;
  }
}

- (void)resolveSubscoreDependencies:(uint64_t)a3 resolved:(uint64_t *)a4 unresolved:(void *)a5 resolvedOrdering:
{
  int v40 = a2;
  std::__hash_table<PPSubscoreIdentifier,std::hash<PPSubscoreIdentifier>,std::equal_to<PPSubscoreIdentifier>,std::allocator<PPSubscoreIdentifier>>::__emplace_unique_key_args<PPSubscoreIdentifier,PPSubscoreIdentifier const&>((uint64_t)a4, (unsigned __int8 *)&v40, a2);
  uint64_t v11 = **(void **)(a1 + 32);
  if (0xAAAAAAAAAAAAAAABLL * ((*(void *)(*(void *)(a1 + 32) + 8) - v11) >> 3) <= a2) {
    std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
  }
  uint64_t v13 = (uint64_t *)(v11 + 24 * a2);
  uint64_t v12 = *v13;
  if (0xCCCCCCCCCCCCCCCDLL * ((v13[1] - *v13) >> 3) <= HIWORD(a2)) {
    std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
  }
  for (uint64_t i = *(unsigned __int8 **)(v12 + 40 * HIWORD(a2) + 16); i; uint64_t i = *(unsigned __int8 **)i)
  {
    if (!std::__hash_table<PPSubscoreIdentifier,std::hash<PPSubscoreIdentifier>,std::equal_to<PPSubscoreIdentifier>,std::allocator<PPSubscoreIdentifier>>::find<PPSubscoreIdentifier>(*(void *)a3, *(void *)(a3 + 8), i + 16))
    {
      if (std::__hash_table<PPSubscoreIdentifier,std::hash<PPSubscoreIdentifier>,std::equal_to<PPSubscoreIdentifier>,std::allocator<PPSubscoreIdentifier>>::find<PPSubscoreIdentifier>(*a4, a4[1], i + 16))
      {
        unsigned __int16 v15 = [MEMORY[0x1E4F28B00] currentHandler];
        [v15 handleFailureInMethod:sel_resolveSubscoreDependencies_resolved_unresolved_resolvedOrdering_ object:a1 file:@"PPScoreInterpreter.mm" lineNumber:371 description:@"Circular dependency detected in model subscore definitions"];
      }
      unint64_t v5 = v5 & 0xFFFFFFFF00000000 | *((unsigned int *)i + 4);
      -[PPScoreInterpreterBytecode resolveSubscoreDependencies:resolved:unresolved:resolvedOrdering:](a1, v5, a3, a4, a5);
    }
  }
  if (std::__hash_table<PPSubscoreIdentifier,std::hash<PPSubscoreIdentifier>,std::equal_to<PPSubscoreIdentifier>,std::allocator<PPSubscoreIdentifier>>::__emplace_unique_key_args<PPSubscoreIdentifier,PPSubscoreIdentifier const&>(a3, (unsigned __int8 *)&v40, a2))
  {
    v17 = (int *)a5[1];
    unint64_t v16 = (unint64_t)a5[2];
    if ((unint64_t)v17 >= v16)
    {
      uint64_t v19 = ((char *)v17 - (unsigned char *)*a5) >> 2;
      if ((unint64_t)(v19 + 1) >> 62) {
        std::vector<PPTokenCount * {__strong}>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v20 = v16 - (void)*a5;
      uint64_t v21 = v20 >> 1;
      if (v20 >> 1 <= (unint64_t)(v19 + 1)) {
        uint64_t v21 = v19 + 1;
      }
      if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v22 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v22 = v21;
      }
      if (v22) {
        unint64_t v22 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned short,unsigned short>>>(v22);
      }
      else {
        uint64_t v23 = 0;
      }
      v24 = (int *)(v22 + 4 * v19);
      unint64_t v25 = v22 + 4 * v23;
      int *v24 = a2;
      id v18 = v24 + 1;
      uint64_t v27 = (char *)*a5;
      long long v26 = (char *)a5[1];
      if (v26 != *a5)
      {
        do
        {
          int v28 = *((_DWORD *)v26 - 1);
          v26 -= 4;
          *--v24 = v28;
        }
        while (v26 != v27);
        long long v26 = (char *)*a5;
      }
      *a5 = v24;
      a5[1] = v18;
      a5[2] = (void *)v25;
      if (v26) {
        operator delete(v26);
      }
    }
    else
    {
      int *v17 = a2;
      id v18 = v17 + 1;
    }
    a5[1] = v18;
  }
  uint64_t v30 = *a4;
  unint64_t v29 = a4[1];
  uint64_t v31 = std::__hash_table<PPSubscoreIdentifier,std::hash<PPSubscoreIdentifier>,std::equal_to<PPSubscoreIdentifier>,std::allocator<PPSubscoreIdentifier>>::find<PPSubscoreIdentifier>(*a4, v29, (unsigned __int8 *)&v40);
  if (v31)
  {
    unint64_t v32 = v31[1];
    uint8x8_t v33 = (uint8x8_t)vcnt_s8((int8x8_t)v29);
    v33.i16[0] = vaddlv_u8(v33);
    if (v33.u32[0] > 1uLL)
    {
      if (v32 >= v29) {
        v32 %= v29;
      }
    }
    else
    {
      v32 &= v29 - 1;
    }
    v34 = *(uint64_t **)(v30 + 8 * v32);
    do
    {
      v35 = v34;
      v34 = (uint64_t *)*v34;
    }
    while (v34 != v31);
    if (v35 == a4 + 2) {
      goto LABEL_46;
    }
    unint64_t v36 = v35[1];
    if (v33.u32[0] > 1uLL)
    {
      if (v36 >= v29) {
        v36 %= v29;
      }
    }
    else
    {
      v36 &= v29 - 1;
    }
    if (v36 != v32)
    {
LABEL_46:
      if (!*v31) {
        goto LABEL_47;
      }
      unint64_t v37 = *(void *)(*v31 + 8);
      if (v33.u32[0] > 1uLL)
      {
        if (v37 >= v29) {
          v37 %= v29;
        }
      }
      else
      {
        v37 &= v29 - 1;
      }
      if (v37 != v32) {
LABEL_47:
      }
        *(void *)(v30 + 8 * v32) = 0;
    }
    uint64_t v38 = *v31;
    if (*v31)
    {
      unint64_t v39 = *(void *)(v38 + 8);
      if (v33.u32[0] > 1uLL)
      {
        if (v39 >= v29) {
          v39 %= v29;
        }
      }
      else
      {
        v39 &= v29 - 1;
      }
      if (v39 != v32)
      {
        *(void *)(*a4 + 8 * v39) = v35;
        uint64_t v38 = *v31;
      }
    }
    uint64_t *v35 = v38;
    *uint64_t v31 = 0;
    --a4[3];
    operator delete(v31);
  }
}

+ (id)_bytecodeInstructionForOp:(void *)a3 unsignedIntegerArgument:(void *)a4 doubleArgument:(void *)a5 objectArgument:
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  __int16 v28 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = self;
  unsigned int v12 = v8 != 0;
  if (v9) {
    ++v12;
  }
  if (v10) {
    ++v12;
  }
  if (v12 >= 2) {
    __assert_rtn("+[PPScoreInterpreterBytecode _bytecodeInstructionForOp:unsignedIntegerArgument:doubleArgument:objectArgument:]", "PPScoreInterpreter.mm", 487, "(nil != unsignedIntegerArgument ? 1 : 0) + (nil != doubleArgument ? 1 : 0) + (nil != objectArgument ? 1 : 0) <= 1");
  }
  uint64_t v13 = v11;
  if (!v8 && !v9 && !v10)
  {
    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&v28 length:2];
LABEL_16:
    v17 = (void *)v14;
    goto LABEL_17;
  }
  if (v8)
  {
    unsigned int v15 = [v8 unsignedIntValue];
    if (HIWORD(v15))
    {
      LOWORD(v31[0]) = -5;
      HIWORD(v31[0]) = a2;
      v31[1] = v15;
      uint64_t v14 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v31 length:8];
    }
    else
    {
      LOWORD(v31[0]) = a2;
      HIWORD(v31[0]) = v15;
      uint64_t v14 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v31 length:4];
    }
    goto LABEL_16;
  }
  if (v9)
  {
    LOWORD(v31[0]) = a2;
    [v9 doubleValue];
    *(void *)((char *)v31 + 2) = v16;
    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v31 length:10];
    goto LABEL_16;
  }
  id v27 = 0;
  uint64_t v19 = [MEMORY[0x1E4F93B50] dataWithPropertyList:v10 error:&v27];
  id v20 = v27;
  if (v20)
  {
    v24 = (void *)MEMORY[0x1E4F1CA00];
    unint64_t v29 = @"error";
    id v30 = v20;
    unint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    id v26 = [v24 exceptionWithName:@"PPScoreInterpreterError" reason:@"couldn't encode obj arg to plist" userInfo:v25];

    objc_exception_throw(v26);
  }
  if (!v19) {
    __assert_rtn("+[PPScoreInterpreterBytecode _bytecodeInstructionForOp:unsignedIntegerArgument:doubleArgument:objectArgument:]", "PPScoreInterpreter.mm", 529, "lazyPlist");
  }
  uint64_t v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v19, "length"));
  unint64_t v22 = +[PPScoreInterpreterBytecode _bytecodeInstructionForOp:unsignedIntegerArgument:doubleArgument:objectArgument:](v13, a2, v21, 0, 0);

  uint64_t v23 = (void *)[v22 mutableCopy];
  [v23 appendData:v19];
  v17 = (void *)[v23 copy];

LABEL_17:
  return v17;
}

+ (id)bytecodeFromFactorName:(id)a3 namespaceName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (+[PPScoreInterpreterBytecode bytecodeFromFactorName:namespaceName:]::_pasOnceToken2 != -1) {
    dispatch_once(&+[PPScoreInterpreterBytecode bytecodeFromFactorName:namespaceName:]::_pasOnceToken2, &__block_literal_global_2767);
  }
  id v7 = (id)+[PPScoreInterpreterBytecode bytecodeFromFactorName:namespaceName:]::_pasExprOnceResult;
  id v8 = (void *)MEMORY[0x1E4F93BB8];
  id v9 = (void *)[v5 copy];
  id v10 = (void *)[v6 copy];
  uint64_t v11 = [v8 tupleWithFirst:v9 second:v10];

  uint64_t v21 = 0;
  unint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__2769;
  unint64_t v25 = __Block_byref_object_dispose__2770;
  id v26 = 0;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __67__PPScoreInterpreterBytecode_bytecodeFromFactorName_namespaceName___block_invoke_87;
  id v18 = &unk_1E65D4D08;
  id v20 = &v21;
  id v12 = v11;
  id v19 = v12;
  [v7 runWithLockAcquired:&v15];
  uint64_t v13 = objc_msgSend((id)v22[5], "result", v15, v16, v17, v18);

  _Block_object_dispose(&v21, 8);
  return v13;
}

void __67__PPScoreInterpreterBytecode_bytecodeFromFactorName_namespaceName___block_invoke_87(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v7 = objc_alloc(MEMORY[0x1E4F93B60]);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __67__PPScoreInterpreterBytecode_bytecodeFromFactorName_namespaceName___block_invoke_2;
    v11[3] = &unk_1E65D4CE0;
    id v12 = *(id *)(a1 + 32);
    uint64_t v8 = [v7 initWithBlock:v11];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    [v3 setObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) forKeyedSubscript:*(void *)(a1 + 32)];
  }
}

id __67__PPScoreInterpreterBytecode_bytecodeFromFactorName_namespaceName___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = +[PPTrialWrapper sharedInstance];
  id v3 = [*(id *)(a1 + 32) first];
  uint64_t v4 = [*(id *)(a1 + 32) second];
  id v11 = 0;
  uint64_t v5 = [v2 lazyPlistForFactorName:v3 namespaceName:v4 error:&v11];
  id v6 = v11;

  if (v5)
  {
    id v7 = +[PPScoreInterpreterBytecode bytecodeFromAsset:v5];
  }
  else
  {
    uint64_t v9 = pp_default_log_handle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v13 = v10;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_error_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_ERROR, "Error loading asset %@: %@", buf, 0x16u);
    }

    id v7 = 0;
  }

  return v7;
}

void __67__PPScoreInterpreterBytecode_bytecodeFromFactorName_namespaceName___block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79D060]();
  id v1 = objc_alloc(MEMORY[0x1E4F93B70]);
  v2 = objc_opt_new();
  uint64_t v3 = [v1 initWithGuardedData:v2];
  uint64_t v4 = (void *)+[PPScoreInterpreterBytecode bytecodeFromFactorName:namespaceName:]::_pasExprOnceResult;
  +[PPScoreInterpreterBytecode bytecodeFromFactorName:namespaceName:]::_pasExprOnceResult = v3;
}

+ (id)bytecodeFromAsset:(id)a3
{
  id v3 = a3;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v8 = 0;
  uint64_t v4 = [(id)objc_opt_class() scoreInterpreterParseRootFromAsset:v3 scalarSubscoreCount:&v10 arraySubscoreCount:&v9 objectSubscoreCount:&v8];
  id v5 = objc_alloc((Class)objc_opt_class());
  id v6 = (void *)[v5 initWithParseRoot:v4 scalarSubscoreCount:v10 arraySubscoreCount:v9 objectSubscoreCount:v8];

  return v6;
}

+ (id)scoreInterpreterParseRootFromAsset:(id)a3 scalarSubscoreCount:(unint64_t *)a4 arraySubscoreCount:(unint64_t *)a5 objectSubscoreCount:(unint64_t *)a6
{
  uint64_t v9 = [a3 objectForKeyedSubscript:@"Scorer"];
  uint64_t v10 = [v9 objectAtIndexedSubscript:0];
  *a4 = [v10 count];

  id v11 = [v9 objectAtIndexedSubscript:1];
  *a5 = [v11 count];

  id v12 = [v9 objectAtIndexedSubscript:2];
  *a6 = [v12 count];

  return v9;
}

@end