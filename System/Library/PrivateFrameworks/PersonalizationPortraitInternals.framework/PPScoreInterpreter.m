@interface PPScoreInterpreter
+ (id)scoreInterpreterFromAsset:(id)a3;
+ (id)scoreInterpreterFromFactorName:(id)a3 namespaceName:(id)a4;
- (PPScoreInterpreter)initWithBytecode:(id)a3;
- (PPScoreInterpreter)initWithBytecode:(id)a3 scoreInputSet:(id)a4;
- (PPScoreInterpreter)initWithParseRoot:(id)a3 scalarSubscoreCount:(unint64_t)a4 arraySubscoreCount:(unint64_t)a5 objectSubscoreCount:(unint64_t)a6;
- (id)evaluateWithScoreInputs:(id)a3;
- (id)evaluateWithScoreInputs:(id)a3 previousSubscores:(id)a4;
- (void)_runBytecode:(void *)a3 context:;
- (void)_runOperator:(uint64_t)a1 arity:(unint64_t)a2 context:(void *)a3;
- (void)cleanupReusableComponents;
- (void)evaluateScoresWithContext:(uint64_t)a1;
- (void)evaluateWithPreviousStageSubscores:(id)a3 scoreInputInitializationBlock:(id)a4 scoreInputAssignmentBlock:(id)a5 outputBlock:(id)a6;
@end

@implementation PPScoreInterpreter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reusableContext, 0);
  objc_storeStrong((id *)&self->_scoreInputSet, 0);
  objc_storeStrong((id *)&self->_bytecode, 0);
}

- (id)evaluateWithScoreInputs:(id)a3
{
  v3 = [(PPScoreInterpreter *)self evaluateWithScoreInputs:a3 previousSubscores:0];
  return v3;
}

- (id)evaluateWithScoreInputs:(id)a3 previousSubscores:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = self->_bytecode->_bytecodeDataBySubscoreTypeAndIndex;
  v9 = [(NSArray *)v8 objectAtIndexedSubscript:0];
  uint64_t v10 = [v9 count];

  v11 = [(NSArray *)v8 objectAtIndexedSubscript:1];
  uint64_t v12 = [v11 count];

  v13 = [(NSArray *)v8 objectAtIndexedSubscript:2];
  uint64_t v14 = [v13 count];

  v15 = -[PPScoreInterpreterCtx initWithScoreInputs:previousSubscores:scalarSubscoreCount:arraySubscoreCount:objectSubscoreCount:]((id *)[PPScoreInterpreterCtx alloc], v6, v7, v10, v12, v14);
  -[PPScoreInterpreter evaluateScoresWithContext:]((uint64_t)self, v15);
  if (*((void *)v15[1] + 1) != *(void *)v15[1])
  {
    v16 = pp_default_log_handle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      unint64_t v19 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)v15[1] + 1) - *(void *)v15[1]) >> 3);
      int v20 = 134217984;
      unint64_t v21 = v19;
      _os_log_fault_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_FAULT, "%lu items left on score interpreter stack", (uint8_t *)&v20, 0xCu);
    }
  }
  id v17 = v15[4];

  return v17;
}

- (void)evaluateScoresWithContext:(uint64_t)a1
{
  v38._subscores = (PPScoreDict *)*MEMORY[0x1E4F143B8];
  v3 = a2;
  if (a1)
  {
    v5 = *(unsigned __int8 ***)(*(void *)(a1 + 8) + 8);
    id v7 = *v5;
    id v6 = v5[1];
    if (*v5 != v6)
    {
      *(void *)&long long v4 = 67109120;
      long long v28 = v4;
      do
      {
        unsigned int v8 = *v7;
        uint64_t v9 = *((unsigned __int16 *)v7 + 1);
        if (v8 == 2)
        {
          id v17 = v3;
          v18 = [*(id *)(*(void *)(a1 + 8) + 16) objectAtIndexedSubscript:2];
          unint64_t v19 = [v18 objectAtIndexedSubscript:v9];
          -[PPScoreInterpreter _runBytecode:context:](a1, v19, v17);

          memset(&v38, 0, 24);
          pop(&v38, v17);
          int v20 = PPScoreInterpreterValue::getObject((PPScoreInterpreterValue *)&v38);
          [v3[4] setObject:v20 forIndex:v9];
          PPScoreInterpreterValue::PPScoreInterpreterValue((PPScoreInterpreterValue *)v29, v20);

          PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)&v38);
          v16 = (PPScoreInterpreterValue *)v29;
        }
        else if (v8 == 1)
        {
          unint64_t v21 = v3;
          uint64_t v22 = [*(id *)(*(void *)(a1 + 8) + 16) objectAtIndexedSubscript:1];
          v23 = [v22 objectAtIndexedSubscript:v9];
          -[PPScoreInterpreter _runBytecode:context:](a1, v23, v21);

          memset(&v38, 0, 24);
          pop(&v38, v21);
          *(void *)buf = 0;
          *(void *)&buf[8] = 0;
          PPScoreInterpreterValue::getFloatVector((PPScoreInterpreterValue *)&v38, buf);
          id v24 = v3[4];
          uint64_t v26 = *(void *)buf;
          v25 = *(std::__shared_weak_count **)&buf[8];
          uint64_t v35 = *(void *)buf;
          v36 = *(std::__shared_weak_count **)&buf[8];
          if (*(void *)&buf[8]) {
            atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)&buf[8] + 8), 1uLL, memory_order_relaxed);
          }
          objc_msgSend(v24, "setArraySharedPtr:forIndex:", &v35, v9, v28);
          if (v36) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v36);
          }
          if (v25)
          {
            atomic_fetch_add_explicit(&v25->__shared_owners_, 1uLL, memory_order_relaxed);
            uint64_t v30 = v26;
            v31 = v25;
            atomic_fetch_add_explicit(&v25->__shared_owners_, 1uLL, memory_order_relaxed);
            char v32 = 1;
            std::__shared_weak_count::__release_shared[abi:ne180100](v25);
            std::__shared_weak_count::__release_shared[abi:ne180100](v25);
          }
          else
          {
            uint64_t v30 = v26;
            v31 = 0;
            char v32 = 1;
          }
          PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)&v38);

          v16 = (PPScoreInterpreterValue *)&v30;
        }
        else
        {
          if (*v7)
          {
            v27 = pp_default_log_handle();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
            {
              v38.super.isa = (Class)__PAIR64__(v8, v28);
              _os_log_fault_impl(&dword_1CA9A8000, v27, OS_LOG_TYPE_FAULT, "Invalid subscoreType of %d", (uint8_t *)&v38, 8u);
            }

            goto LABEL_25;
          }
          uint64_t v10 = v3;
          v11 = [*(id *)(*(void *)(a1 + 8) + 16) objectAtIndexedSubscript:0];
          uint64_t v12 = [v11 objectAtIndexedSubscript:v9];
          -[PPScoreInterpreter _runBytecode:context:](a1, v12, v10);

          memset(&v38, 0, 24);
          pop(&v38, v10);
          double Double = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)&v38);
          double v14 = fabs(Double);
          if (v14 == INFINITY)
          {
            v15 = pp_score_interpreter_log_handle();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134218240;
              *(void *)&buf[4] = v9;
              *(_WORD *)&buf[12] = 2048;
              *(double *)&buf[14] = Double;
              _os_log_impl(&dword_1CA9A8000, v15, OS_LOG_TYPE_INFO, "Score for variable %tu returned Nan or Inf: %f", buf, 0x16u);
            }
          }
          *(float *)&double v14 = Double;
          objc_msgSend(v3[4], "setScalarValue:forIndex:", v9, v14, v28);
          double v33 = Double;
          char v34 = 0;
          PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)&v38);

          v16 = (PPScoreInterpreterValue *)&v33;
        }
        PPScoreInterpreterValue::~PPScoreInterpreterValue(v16);
LABEL_25:
        v7 += 4;
      }
      while (v7 != v6);
    }
  }
}

- (void)_runBytecode:(void *)a3 context:
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (_WORD *)[v5 bytes];
  uint64_t v8 = [v5 length];
  uint64_t __dst = 0;
  if (v8 >= 2)
  {
    uint64_t v9 = (char *)v7 + v8;
    uint64_t v10 = (char *)(v7 + 1);
    size_t v11 = 2;
    do
    {
      uint64_t v12 = (unsigned __int16)*v7;
      if ((unsigned __int16)*v7 <= 0x190u)
      {
        switch(*v7)
        {
          case 0xC9:
            HIDWORD(__dst) = 0;
            v13 = &v10[v11];
            if (&v10[v11] > v9) {
              goto LABEL_2;
            }
            memcpy((char *)&__dst + 4, v10, v11);
            [v6[2] scalarValueForIndex:HIDWORD(__dst)];
            v52[0] = v15;
            char v53 = 0;
            push(v6, (const PPScoreInterpreterValue *)v52);
            v16 = v52;
            goto LABEL_51;
          case 0xCA:
            HIDWORD(__dst) = 0;
            v13 = &v10[v11];
            if (&v10[v11] > v9) {
              goto LABEL_2;
            }
            memcpy((char *)&__dst + 4, v10, v11);
            [v6[4] scalarValueForIndex:HIDWORD(__dst)];
            v48[0] = v34;
            char v49 = 0;
            push(v6, (const PPScoreInterpreterValue *)v48);
            v16 = v48;
            goto LABEL_51;
          case 0xCB:
            HIDWORD(__dst) = 0;
            v13 = &v10[v11];
            if (&v10[v11] > v9) {
              goto LABEL_2;
            }
            memcpy((char *)&__dst + 4, v10, v11);
            id v29 = v6[3];
            if (v29)
            {
              [v29 scalarValueForIndex:HIDWORD(__dst)];
              v44[0] = v30;
              char v45 = 0;
              push(v6, (const PPScoreInterpreterValue *)v44);
              v16 = v44;
            }
            else
            {
              v46[0] = 0xC0DE9A8000000000;
              char v47 = 0;
              push(v6, (const PPScoreInterpreterValue *)v46);
              v16 = (double *)v46;
            }
LABEL_51:
            PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v16);
LABEL_52:
            size_t v11 = 2;
            break;
          case 0xCC:
            v13 = (char *)(v7 + 5);
            if (v13 > v9) {
              goto LABEL_2;
            }
            v50[0] = *(void *)v10;
            char v51 = 0;
            push(v6, (const PPScoreInterpreterValue *)v50);
            PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v50);
            break;
          default:
            JUMPOUT(0);
        }
        uint64_t v10 = v13;
      }
      else
      {
        switch(*v7)
        {
          case 0xFFFB:
            if (v11 != 2) {
              __assert_rtn("-[PPScoreInterpreter _runBytecode:context:]", "PPScoreInterpreter.mm", 2025, "nextUIntArgumentSize == sizeof(uint16_t)");
            }
            size_t v11 = 4;
            break;
          case 0xFFFC:
            HIDWORD(__dst) = 0;
            v13 = &v10[v11];
            if (&v10[v11] > v9) {
              goto LABEL_2;
            }
            memcpy((char *)&__dst + 4, v10, v11);
            double v33 = [*(id *)(*(void *)(a1 + 8) + 24) objectAtIndexedSubscript:HIDWORD(__dst)];
            PPScoreInterpreterValue::PPScoreInterpreterValue((PPScoreInterpreterValue *)&v56._previousSubscores, v33);
            push(v6, (const PPScoreInterpreterValue *)&v56._previousSubscores);
            PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)&v56._previousSubscores);

            goto LABEL_52;
          case 0xFFFD:
            memset(&v56, 0, 24);
            pop(&v56, v6);
            if (LOBYTE(v56._scoreInputs))
            {
              if (LOBYTE(v56._scoreInputs) != 2)
              {
                PPScoreInterpreterCtx v38 = pp_score_interpreter_log_handle();
                if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 67109120;
                  int scoreInputs_low = LOBYTE(v56._scoreInputs);
                  _os_log_error_impl(&dword_1CA9A8000, v38, OS_LOG_TYPE_ERROR, "Attempted to compute IfThenElse with an invalid value type of %d in the if condition", buf, 8u);
                }

                PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)&v56);
LABEL_63:
                v10 += v11;
                if (v10 > v9) {
                  goto LABEL_2;
                }
                goto LABEL_64;
              }
              v31 = PPScoreInterpreterValue::getObject((PPScoreInterpreterValue *)&v56);
              BOOL v32 = v31 == 0;

              PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)&v56);
              if (v32) {
                goto LABEL_63;
              }
            }
            else
            {
              double Double = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)&v56);
              if (Double == -31337.0)
              {
                uint64_t v26 = &v56;
LABEL_56:
                PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v26);
              }
              else
              {
                PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)&v56);
                if ((*(void *)&Double & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL && Double > 0.0) {
                  goto LABEL_63;
                }
              }
            }
LABEL_57:
            HIDWORD(__dst) = 0;
            if (&v10[v11] > v9) {
              goto LABEL_2;
            }
            memcpy((char *)&__dst + 4, v10, v11);
            v10 += v11 + HIDWORD(__dst);
            if (v10 >= v9) {
              goto LABEL_2;
            }
            goto LABEL_64;
          case 0xFFFE:
            pop(&v56, v6);
            double v23 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)&v56);
            PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)&v56);
            if (v23 == -31338.0) {
              double v24 = -31337.0;
            }
            else {
              double v24 = v23;
            }
            if (v24 == -31337.0 || (*(void *)&v24 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL) {
              goto LABEL_63;
            }
            *(double *)v54 = v24;
            char v55 = 0;
            push(v6, (const PPScoreInterpreterValue *)v54);
            uint64_t v26 = (PPScoreInterpreterCtx *)v54;
            goto LABEL_56;
          case 0xFFFF:
            goto LABEL_57;
          default:
            switch(*v7)
            {
              case 0x191:
                HIDWORD(__dst) = 0;
                v13 = &v10[v11];
                if (&v10[v11] > v9) {
                  goto LABEL_2;
                }
                memcpy((char *)&__dst + 4, v10, v11);
                double v14 = [v6[2] objectForIndex:HIDWORD(__dst)];
                PPScoreInterpreterValue::PPScoreInterpreterValue((PPScoreInterpreterValue *)v41, v14);
                push(v6, (const PPScoreInterpreterValue *)v41);
                PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v41);

                goto LABEL_52;
              case 0x192:
                HIDWORD(__dst) = 0;
                v13 = &v10[v11];
                if (&v10[v11] > v9) {
                  goto LABEL_2;
                }
                memcpy((char *)&__dst + 4, v10, v11);
                v27 = [v6[4] objectForIndex:HIDWORD(__dst)];
                PPScoreInterpreterValue::PPScoreInterpreterValue((PPScoreInterpreterValue *)v40, v27);
                push(v6, (const PPScoreInterpreterValue *)v40);
                PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v40);

                goto LABEL_52;
              case 0x193:
                HIDWORD(__dst) = 0;
                v13 = &v10[v11];
                if (&v10[v11] > v9) {
                  goto LABEL_2;
                }
                memcpy((char *)&__dst + 4, v10, v11);
                long long v28 = [v6[3] objectForIndex:HIDWORD(__dst)];
                PPScoreInterpreterValue::PPScoreInterpreterValue((PPScoreInterpreterValue *)v39, v28);
                push(v6, (const PPScoreInterpreterValue *)v39);
                PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v39);

                goto LABEL_52;
              case 0x194:
                LODWORD(__dst) = 0;
                id v17 = &v10[v11];
                if (&v10[v11] > v9) {
                  goto LABEL_2;
                }
                memcpy(&__dst, v10, v11);
                id v18 = objc_alloc(MEMORY[0x1E4F1CA58]);
                size_t v19 = __dst;
                int v20 = (void *)[v18 initWithLength:__dst];
                uint64_t v10 = &v17[v19];
                if (&v17[v19] > v9)
                {

                  goto LABEL_2;
                }
                id v21 = v20;
                memcpy((void *)[v21 mutableBytes], v17, v19);
                uint64_t v43 = 0;
                uint64_t v22 = [MEMORY[0x1E4F93B50] propertyListWithData:v21 error:&v43];

                if (!v22) {
                  __assert_rtn("-[PPScoreInterpreter _runBytecode:context:]", "PPScoreInterpreter.mm", 2154, "plpObject");
                }
                PPScoreInterpreterValue::PPScoreInterpreterValue((PPScoreInterpreterValue *)v42, v22);
                push(v6, (const PPScoreInterpreterValue *)v42);
                PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v42);

LABEL_64:
                size_t v11 = 2;
                break;
              default:
                self;
                if ((0xBE0009uLL >> v12))
                {
                  HIDWORD(__dst) = 0;
                  v36 = &v10[v11];
                  if (&v10[v11] > v9) {
                    goto LABEL_2;
                  }
                  memcpy((char *)&__dst + 4, v10, v11);
                  unint64_t v35 = HIDWORD(__dst);
                  size_t v11 = 2;
                  uint64_t v10 = v36;
                }
                else
                {
                  unint64_t v35 = qword_1CAB7BAE8[v12 + 1];
                }
                -[PPScoreInterpreter _runOperator:arity:context:](v12, v35, v6);
                goto LABEL_65;
            }
            break;
        }
      }
LABEL_65:
      id v7 = v10;
      uint64_t __dst = 0;
      v10 += 2;
    }
    while (v10 <= v9);
  }
LABEL_2:
}

- (void)_runOperator:(uint64_t)a1 arity:(unint64_t)a2 context:(void *)a3
{
  uint64_t v644 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  int v7 = 0;
  char v8 = 1;
  switch(a1)
  {
    case 0:
      if (shouldReturnUndefined(v5, a2))
      {
        drop(v6, a2);
        v636[0] = 0xC0DE9A4000000000;
        char v637 = 0;
        push(v6, (const PPScoreInterpreterValue *)v636);
        uint64_t v9 = (double *)v636;
        goto LABEL_563;
      }
      if (!a2)
      {
        double v243 = 0.0;
LABEL_410:
        *(double *)v632 = v243;
        char v633 = 0;
        push(v6, (const PPScoreInterpreterValue *)v632);
        uint64_t v9 = (double *)v632;
        goto LABEL_563;
      }
      uint64_t v242 = 0;
      double v243 = 0.0;
      while (2)
      {
        memset(buf, 0, 24);
        pop((PPScoreInterpreterCtx *)buf, v6);
        if (!buf[16])
        {
          double Double = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)buf);
          if (Double == -31338.0) {
            double v245 = 0.0;
          }
          else {
            double v245 = Double;
          }
          goto LABEL_348;
        }
        if (buf[16] == 1)
        {
          long long v642 = 0uLL;
          PPScoreInterpreterValue::getFloatVector((PPScoreInterpreterValue *)buf, &v642);
          v244 = *(float **)v642;
          double v245 = 0.0;
          while (v244 != *(float **)(v642 + 8))
          {
            float v246 = *v244++;
            double v245 = v245 + v246;
          }
          if (*((void *)&v642 + 1)) {
            std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v642 + 1));
          }
LABEL_348:
          double v243 = v243 + v245;
          PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)buf);
          if (++v242 == a2) {
            goto LABEL_410;
          }
          continue;
        }
        break;
      }
      v342 = pp_score_interpreter_log_handle();
      if (os_log_type_enabled(v342, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v642) = 67109120;
        DWORD1(v642) = buf[16];
        _os_log_error_impl(&dword_1CA9A8000, v342, OS_LOG_TYPE_ERROR, "Invalid value of type %d passed to PPOperatorSum", (uint8_t *)&v642, 8u);
      }

      v634[0] = 0xC0DE9A4000000000;
      char v635 = 0;
      push(v6, (const PPScoreInterpreterValue *)v634);
      v301 = (PPScoreInterpreterValue *)v634;
      goto LABEL_550;
    case 1:
      if (shouldReturnUndefined(v5, 2uLL))
      {
        drop(v6, a2);
        v630[0] = 0xC0DE9A4000000000;
        char v631 = 0;
        push(v6, (const PPScoreInterpreterValue *)v630);
        uint64_t v9 = (double *)v630;
      }
      else
      {
        uint64_t v186 = *(void *)v6->_stack.__ptr_.__value_;
        unint64_t v187 = 0xAAAAAAAAAAAAAAABLL * ((*((void *)v6->_stack.__ptr_.__value_ + 1) - v186) >> 3);
        unint64_t v188 = v187 - a2;
        if (v187 <= v187 - a2) {
          std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
        }
        double v189 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v186 + 24 * v188));
        uint64_t v190 = *(void *)v6->_stack.__ptr_.__value_;
        if (0xAAAAAAAAAAAAAAABLL * ((*((void *)v6->_stack.__ptr_.__value_ + 1) - v190) >> 3) <= v188 + 1) {
          std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
        }
        double v191 = v189;
        double v192 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v190 + 24 * (v188 + 1)));
        drop(v6, a2);
        if (v191 == -31338.0) {
          double v193 = 0.0;
        }
        else {
          double v193 = v191;
        }
        if (v192 == -31338.0) {
          double v194 = 0.0;
        }
        else {
          double v194 = v192;
        }
        v628[0] = v193 - v194;
        char v629 = 0;
        push(v6, (const PPScoreInterpreterValue *)v628);
        uint64_t v9 = v628;
      }
      goto LABEL_563;
    case 2:
      if (shouldReturnUndefined(v5, 1uLL))
      {
        drop(v6, a2);
        v626[0] = 0xC0DE9A4000000000;
        char v627 = 0;
        push(v6, (const PPScoreInterpreterValue *)v626);
        uint64_t v9 = (double *)v626;
        goto LABEL_563;
      }
      value = v6->_stack.__ptr_.__value_;
      unint64_t v222 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(value[1] - *value) >> 3) - a2;
      memset(buf, 0, 24);
      v224 = value;
      uint64_t v223 = *value;
      if (0xAAAAAAAAAAAAAAABLL * ((v224[1] - v223) >> 3) <= v222) {
        std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
      }
      PPScoreInterpreterValue::PPScoreInterpreterValue((PPScoreInterpreterValue *)buf, (const PPScoreInterpreterValue *)(v223 + 24 * v222));
      drop(v6, a2);
      if (buf[16])
      {
        if (buf[16] == 1)
        {
          PPScoreInterpreterValue::getFloatVector((PPScoreInterpreterValue *)buf, &v641);
          uint64_t v643 = 0;
          long long v642 = 0uLL;
          std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v642, *(const void **)v641, *(void *)(v641 + 8), (uint64_t)(*(void *)(v641 + 8) - *(void *)v641) >> 2);
          if (*((void *)&v641 + 1)) {
            std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v641 + 1));
          }
          uint64_t v225 = *((void *)&v642 + 1);
          v76 = (void *)v642;
          if ((void)v642 != *((void *)&v642 + 1))
          {
            v226 = (float *)v642;
            do
            {
              float *v226 = -*v226;
              ++v226;
            }
            while (v226 != (float *)v225);
          }
          std::allocate_shared[abi:ne180100]<std::vector<float>,std::allocator<std::vector<float>>,std::vector<float> const&,void>(v622, v76, v225);
          char v623 = 1;
          push(v6, (const PPScoreInterpreterValue *)v622);
          v79 = (PPScoreInterpreterValue *)v622;
          goto LABEL_318;
        }
        v304 = pp_score_interpreter_log_handle();
        if (os_log_type_enabled(v304, OS_LOG_TYPE_ERROR))
        {
          LODWORD(v642) = 67109120;
          DWORD1(v642) = buf[16];
          _os_log_error_impl(&dword_1CA9A8000, v304, OS_LOG_TYPE_ERROR, "Invalid value of type %d passed to PPOperatorNegate", (uint8_t *)&v642, 8u);
        }

        v620[0] = 0xC0DE9A4000000000;
        char v621 = 0;
        push(v6, (const PPScoreInterpreterValue *)v620);
        v301 = (PPScoreInterpreterValue *)v620;
      }
      else
      {
        double v303 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)buf);
        if (v303 == -31338.0) {
          double v303 = 0.0;
        }
        v624[0] = -v303;
        char v625 = 0;
        push(v6, (const PPScoreInterpreterValue *)v624);
        v301 = (PPScoreInterpreterValue *)v624;
      }
      goto LABEL_550;
    case 3:
      if (shouldReturnUndefined(v5, a2))
      {
        drop(v6, a2);
        v618[0] = 0xC0DE9A4000000000;
        char v619 = 0;
        push(v6, (const PPScoreInterpreterValue *)v618);
        uint64_t v9 = (double *)v618;
        goto LABEL_563;
      }
      if (!a2)
      {
        double v155 = 1.0;
LABEL_404:
        *(double *)v614 = v155;
        char v615 = 0;
        push(v6, (const PPScoreInterpreterValue *)v614);
        uint64_t v9 = (double *)v614;
        goto LABEL_563;
      }
      uint64_t v154 = 0;
      double v155 = 1.0;
      while (2)
      {
        memset(buf, 0, 24);
        pop((PPScoreInterpreterCtx *)buf, v6);
        if (!buf[16])
        {
          double v159 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)buf);
          if (v159 == -31338.0) {
            double v157 = 1.0;
          }
          else {
            double v157 = v159;
          }
          goto LABEL_213;
        }
        if (buf[16] == 1)
        {
          long long v642 = 0uLL;
          PPScoreInterpreterValue::getFloatVector((PPScoreInterpreterValue *)buf, &v642);
          v156 = *(float **)v642;
          double v157 = 1.0;
          while (v156 != *(float **)(v642 + 8))
          {
            float v158 = *v156++;
            double v157 = v157 * v158;
          }
          if (*((void *)&v642 + 1)) {
            std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v642 + 1));
          }
LABEL_213:
          double v155 = v155 * v157;
          PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)buf);
          if (++v154 == a2) {
            goto LABEL_404;
          }
          continue;
        }
        break;
      }
      v341 = pp_score_interpreter_log_handle();
      if (os_log_type_enabled(v341, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v642) = 67109120;
        DWORD1(v642) = buf[16];
        _os_log_error_impl(&dword_1CA9A8000, v341, OS_LOG_TYPE_ERROR, "Invalid value of type %d passed to PPOperatorProduct", (uint8_t *)&v642, 8u);
      }

      v616[0] = 0xC0DE9A4000000000;
      char v617 = 0;
      push(v6, (const PPScoreInterpreterValue *)v616);
      v301 = (PPScoreInterpreterValue *)v616;
LABEL_550:
      PPScoreInterpreterValue::~PPScoreInterpreterValue(v301);
LABEL_551:
      uint64_t v9 = (double *)buf;
      goto LABEL_563;
    case 4:
      if (shouldReturnUndefined(v5, 2uLL))
      {
        drop(v6, a2);
        v612[0] = 0xC0DE9A4000000000;
        char v613 = 0;
        push(v6, (const PPScoreInterpreterValue *)v612);
        uint64_t v9 = (double *)v612;
      }
      else
      {
        uint64_t v210 = *(void *)v6->_stack.__ptr_.__value_;
        unint64_t v211 = 0xAAAAAAAAAAAAAAABLL * ((*((void *)v6->_stack.__ptr_.__value_ + 1) - v210) >> 3);
        unint64_t v212 = v211 - a2;
        if (v211 <= v211 - a2) {
          std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
        }
        double v213 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v210 + 24 * v212));
        uint64_t v214 = *(void *)v6->_stack.__ptr_.__value_;
        if (0xAAAAAAAAAAAAAAABLL * ((*((void *)v6->_stack.__ptr_.__value_ + 1) - v214) >> 3) <= v212 + 1) {
          std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
        }
        double v215 = v213;
        double v216 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v214 + 24 * (v212 + 1)));
        drop(v6, a2);
        if (v215 == -31338.0) {
          double v217 = 0.0;
        }
        else {
          double v217 = v215;
        }
        if (v216 == -31338.0) {
          double v218 = 0.0;
        }
        else {
          double v218 = v216;
        }
        BOOL v219 = v217 < v218;
        double v220 = 1.0;
        if (v219) {
          double v220 = 0.0;
        }
        *(double *)v610 = v220;
        char v611 = 0;
        push(v6, (const PPScoreInterpreterValue *)v610);
        uint64_t v9 = (double *)v610;
      }
      goto LABEL_563;
    case 5:
      if (shouldReturnUndefined(v5, 2uLL))
      {
        drop(v6, a2);
        v608[0] = 0xC0DE9A4000000000;
        char v609 = 0;
        push(v6, (const PPScoreInterpreterValue *)v608);
        uint64_t v9 = (double *)v608;
        goto LABEL_563;
      }
      uint64_t v231 = *(void *)v6->_stack.__ptr_.__value_;
      unint64_t v232 = 0xAAAAAAAAAAAAAAABLL * ((*((void *)v6->_stack.__ptr_.__value_ + 1) - v231) >> 3);
      unint64_t v233 = v232 - a2;
      if (v232 <= v232 - a2) {
        std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
      }
      double v234 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v231 + 24 * v233));
      uint64_t v235 = *(void *)v6->_stack.__ptr_.__value_;
      if (0xAAAAAAAAAAAAAAABLL * ((*((void *)v6->_stack.__ptr_.__value_ + 1) - v235) >> 3) <= v233 + 1) {
        std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
      }
      long double v236 = v234;
      long double v237 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v235 + 24 * (v233 + 1)));
      drop(v6, a2);
      if (v236 <= 0.0)
      {
        v390 = [MEMORY[0x1E4F28B00] currentHandler];
        v391 = [NSString stringWithUTF8String:"-[PPScoreInterpreter _runOperator:arity:context:]"];
        [v390 handleFailureInFunction:v391, @"PPScoreInterpreter.mm", 1206, @"Invalid parameter not satisfying: %@", @"value > 0" file lineNumber description];
      }
      if (v237 <= 0.0)
      {
        v392 = [MEMORY[0x1E4F28B00] currentHandler];
        v393 = [NSString stringWithUTF8String:"-[PPScoreInterpreter _runOperator:arity:context:]"];
        [v392 handleFailureInFunction:v393, @"PPScoreInterpreter.mm", 1207, @"Invalid parameter not satisfying: %@", @"base > 0" file lineNumber description];
      }
      if (v236 <= 0.0)
      {
        v238 = pp_score_interpreter_log_handle();
        if (!os_log_type_enabled(v238, OS_LOG_TYPE_ERROR)) {
          goto LABEL_399;
        }
        *(_DWORD *)buf = 134217984;
        *(long double *)&uint8_t buf[4] = v236;
        v239 = "Attempted to compute log10 of non-positive number %f (value arg of Logarithm operator) --  output is NaN";
        v240 = v238;
        uint32_t v241 = 12;
        goto LABEL_616;
      }
      if (v237 > 0.0) {
        goto LABEL_400;
      }
      v238 = pp_score_interpreter_log_handle();
      if (os_log_type_enabled(v238, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        *(long double *)&uint8_t buf[4] = v236;
        *(_WORD *)&buf[12] = 2048;
        *(long double *)&buf[14] = v237;
        v239 = "Attempted to compute log10 of number %f with negative base of %f -- output is NaN";
        v240 = v238;
        uint32_t v241 = 22;
LABEL_616:
        _os_log_error_impl(&dword_1CA9A8000, v240, OS_LOG_TYPE_ERROR, v239, buf, v241);
      }
LABEL_399:

LABEL_400:
      double v295 = log2(v236);
      v606[0] = v295 / log2(v237);
      char v607 = 0;
      push(v6, (const PPScoreInterpreterValue *)v606);
      uint64_t v9 = v606;
      goto LABEL_563;
    case 6:
      if (shouldReturnUndefined(v5, 2uLL))
      {
        drop(v6, a2);
        v604[0] = 0xC0DE9A4000000000;
        char v605 = 0;
        push(v6, (const PPScoreInterpreterValue *)v604);
        uint64_t v9 = (double *)v604;
      }
      else
      {
        uint64_t v120 = *(void *)v6->_stack.__ptr_.__value_;
        unint64_t v121 = 0xAAAAAAAAAAAAAAABLL * ((*((void *)v6->_stack.__ptr_.__value_ + 1) - v120) >> 3);
        unint64_t v122 = v121 - a2;
        if (v121 <= v121 - a2) {
          std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
        }
        double v123 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v120 + 24 * v122));
        uint64_t v124 = *(void *)v6->_stack.__ptr_.__value_;
        if (0xAAAAAAAAAAAAAAABLL * ((*((void *)v6->_stack.__ptr_.__value_ + 1) - v124) >> 3) <= v122 + 1) {
          std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
        }
        double v125 = v123;
        double v126 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v124 + 24 * (v122 + 1)));
        drop(v6, a2);
        if (v126 == 0.0)
        {
          v387 = [MEMORY[0x1E4F28B00] currentHandler];
          v388 = [NSString stringWithUTF8String:"-[PPScoreInterpreter _runOperator:arity:context:]"];
          [v387 handleFailureInFunction:v388, @"PPScoreInterpreter.mm", 1218, @"Invalid parameter not satisfying: %@", @"denominator != 0" file lineNumber description];

          v389 = pp_score_interpreter_log_handle();
          if (os_log_type_enabled(v389, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            *(double *)&uint8_t buf[4] = v125;
            *(_WORD *)&buf[12] = 2048;
            *(double *)&buf[14] = v126;
            _os_log_error_impl(&dword_1CA9A8000, v389, OS_LOG_TYPE_ERROR, "Divide by zero error (%f / %f) -- setting output to PPScoreNotSet", buf, 0x16u);
          }

          v602[0] = 0xC0DE9A4000000000;
          char v603 = 0;
          push(v6, (const PPScoreInterpreterValue *)v602);
          uint64_t v9 = (double *)v602;
        }
        else
        {
          v600[0] = v125 / v126;
          char v601 = 0;
          push(v6, (const PPScoreInterpreterValue *)v600);
          uint64_t v9 = v600;
        }
      }
      goto LABEL_563;
    case 7:
      if (shouldReturnUndefined(v5, 1uLL))
      {
        drop(v6, a2);
        v598[0] = 0xC0DE9A4000000000;
        char v599 = 0;
        push(v6, (const PPScoreInterpreterValue *)v598);
        uint64_t v9 = (double *)v598;
      }
      else
      {
        uint64_t v227 = *(void *)v6->_stack.__ptr_.__value_;
        unint64_t v228 = 0xAAAAAAAAAAAAAAABLL * ((*((void *)v6->_stack.__ptr_.__value_ + 1) - v227) >> 3);
        if (v228 <= v228 - a2) {
          std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
        }
        long double v229 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v227 + 24 * (v228 - a2)));
        drop(v6, a2);
        if (v229 <= 0.0)
        {
          v383 = [MEMORY[0x1E4F28B00] currentHandler];
          v384 = [NSString stringWithUTF8String:"-[PPScoreInterpreter _runOperator:arity:context:]"];
          [v383 handleFailureInFunction:v384, @"PPScoreInterpreter.mm", 1228, @"Invalid parameter not satisfying: %@", @"value > 0" file lineNumber description];

          v230 = pp_score_interpreter_log_handle();
          if (os_log_type_enabled(v230, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134217984;
            *(long double *)&uint8_t buf[4] = v229;
            _os_log_error_impl(&dword_1CA9A8000, v230, OS_LOG_TYPE_ERROR, "Attempted to compute NatLog of non-positive number %f -- output is NaN", buf, 0xCu);
          }
        }
        v596[0] = log(v229);
        char v597 = 0;
        push(v6, (const PPScoreInterpreterValue *)v596);
        uint64_t v9 = (double *)v596;
      }
      goto LABEL_563;
    case 8:
      if (shouldReturnUndefined(v5, 1uLL))
      {
        drop(v6, a2);
        v594[0] = 0xC0DE9A4000000000;
        char v595 = 0;
        push(v6, (const PPScoreInterpreterValue *)v594);
        uint64_t v9 = (double *)v594;
      }
      else
      {
        uint64_t v127 = *(void *)v6->_stack.__ptr_.__value_;
        unint64_t v128 = 0xAAAAAAAAAAAAAAABLL * ((*((void *)v6->_stack.__ptr_.__value_ + 1) - v127) >> 3);
        if (v128 <= v128 - a2) {
          std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
        }
        double v129 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v127 + 24 * (v128 - a2)));
        drop(v6, a2);
        double v130 = 0.0;
        if (v129 != -31338.0) {
          double v130 = v129;
        }
        v592[0] = exp(v130);
        char v593 = 0;
        push(v6, (const PPScoreInterpreterValue *)v592);
        uint64_t v9 = (double *)v592;
      }
      goto LABEL_563;
    case 9:
      if (shouldReturnUndefined(v5, 2uLL))
      {
        drop(v6, a2);
        v590[0] = 0xC0DE9A4000000000;
        char v591 = 0;
        push(v6, (const PPScoreInterpreterValue *)v590);
        uint64_t v9 = (double *)v590;
      }
      else
      {
        uint64_t v85 = *(void *)v6->_stack.__ptr_.__value_;
        unint64_t v86 = 0xAAAAAAAAAAAAAAABLL * ((*((void *)v6->_stack.__ptr_.__value_ + 1) - v85) >> 3);
        unint64_t v87 = v86 - a2;
        if (v86 <= v86 - a2) {
          std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
        }
        double v88 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v85 + 24 * v87));
        uint64_t v89 = *(void *)v6->_stack.__ptr_.__value_;
        if (0xAAAAAAAAAAAAAAABLL * ((*((void *)v6->_stack.__ptr_.__value_ + 1) - v89) >> 3) <= v87 + 1) {
          std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
        }
        double v90 = v88;
        double v91 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v89 + 24 * (v87 + 1)));
        drop(v6, a2);
        if (v90 == -31338.0) {
          double v90 = 0.0;
        }
        if (v91 == -31338.0) {
          double v91 = 0.0;
        }
        if (v90 <= 0.0 && (v90 != 0.0 || v91 < 0.0) && v91 != (double)(int)v91)
        {
          v394 = [MEMORY[0x1E4F28B00] currentHandler];
          v395 = [NSString stringWithUTF8String:"-[PPScoreInterpreter _runOperator:arity:context:]"];
          [v394 handleFailureInFunction:v395, @"PPScoreInterpreter.mm", 1247, @"Attempted to compute pow(%f, %f)", *(void *)&v90, *(void *)&v91 file lineNumber description];

          v396 = pp_score_interpreter_log_handle();
          if (os_log_type_enabled(v396, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            *(double *)&uint8_t buf[4] = v90;
            *(_WORD *)&buf[12] = 2048;
            *(double *)&buf[14] = v91;
            _os_log_error_impl(&dword_1CA9A8000, v396, OS_LOG_TYPE_ERROR, "Attempted to compute pow(%f,%f) -- output is NaN", buf, 0x16u);
          }
        }
        v588[0] = pow(v90, v91);
        char v589 = 0;
        push(v6, (const PPScoreInterpreterValue *)v588);
        uint64_t v9 = (double *)v588;
      }
      goto LABEL_563;
    case 11:
      if (shouldReturnUndefined(v5, 3uLL))
      {
        drop(v6, a2);
        v586[0] = 0xC0DE9A4000000000;
        char v587 = 0;
        push(v6, (const PPScoreInterpreterValue *)v586);
        uint64_t v9 = (double *)v586;
        goto LABEL_563;
      }
      uint64_t v109 = *(void *)v6->_stack.__ptr_.__value_;
      unint64_t v110 = 0xAAAAAAAAAAAAAAABLL * ((*((void *)v6->_stack.__ptr_.__value_ + 1) - v109) >> 3);
      unint64_t v111 = v110 - a2;
      if (v110 <= v110 - a2) {
        std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
      }
      double v112 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v109 + 24 * v111));
      uint64_t v113 = *(void *)v6->_stack.__ptr_.__value_;
      if (0xAAAAAAAAAAAAAAABLL * ((*((void *)v6->_stack.__ptr_.__value_ + 1) - v113) >> 3) <= v111 + 1) {
        std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
      }
      double v114 = v112;
      double v115 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v113 + 24 * (v111 + 1)));
      uint64_t v116 = *(void *)v6->_stack.__ptr_.__value_;
      if (0xAAAAAAAAAAAAAAABLL * ((*((void *)v6->_stack.__ptr_.__value_ + 1) - v116) >> 3) <= v111 + 2) {
        std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
      }
      double v117 = v115;
      double v118 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v116 + 24 * (v111 + 2)));
      drop(v6, a2);
      if (v114 < 0.0)
      {
        v401 = [MEMORY[0x1E4F28B00] currentHandler];
        v402 = [NSString stringWithUTF8String:"-[PPScoreInterpreter _runOperator:arity:context:]"];
        [v401 handleFailureInFunction:v402, @"PPScoreInterpreter.mm", 1259, @"Invalid parameter not satisfying: %@", @"age >= 0" file lineNumber description];
      }
      if (v117 <= 0.0)
      {
        v403 = [MEMORY[0x1E4F28B00] currentHandler];
        v404 = [NSString stringWithUTF8String:"-[PPScoreInterpreter _runOperator:arity:context:]"];
        [v403 handleFailureInFunction:v404, @"PPScoreInterpreter.mm", 1260, @"Invalid parameter not satisfying: %@", @"halflife > 0" file lineNumber description];
      }
      if (v114 < 0.0)
      {
        v119 = pp_score_interpreter_log_handle();
        if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          *(double *)&uint8_t buf[4] = v114;
          _os_log_error_impl(&dword_1CA9A8000, v119, OS_LOG_TYPE_ERROR, "Attempted to compute ExpDecay with negative age: %f  -- output is NaN", buf, 0xCu);
        }

        goto LABEL_402;
      }
      if (v117 > 0.0)
      {
LABEL_402:
        v582[0] = exp(v114 * (-0.693147181 / v117)) * v118;
        char v583 = 0;
        push(v6, (const PPScoreInterpreterValue *)v582);
        uint64_t v9 = v582;
        goto LABEL_563;
      }
      v328 = pp_score_interpreter_log_handle();
      if (os_log_type_enabled(v328, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        *(double *)&uint8_t buf[4] = v117;
        _os_log_error_impl(&dword_1CA9A8000, v328, OS_LOG_TYPE_ERROR, "Attempted to compute ExpDecay with non-positive half-life: %f -- forcing output to PPScoreNotSet", buf, 0xCu);
      }

      v584[0] = 0xC0DE9A4000000000;
      char v585 = 0;
      push(v6, (const PPScoreInterpreterValue *)v584);
      uint64_t v9 = (double *)v584;
      goto LABEL_563;
    case 12:
      if (shouldReturnUndefined(v5, 3uLL))
      {
        drop(v6, a2);
        v580[0] = 0xC0DE9A4000000000;
        char v581 = 0;
        push(v6, (const PPScoreInterpreterValue *)v580);
        uint64_t v9 = (double *)v580;
      }
      else
      {
        uint64_t v60 = *(void *)v6->_stack.__ptr_.__value_;
        unint64_t v61 = 0xAAAAAAAAAAAAAAABLL * ((*((void *)v6->_stack.__ptr_.__value_ + 1) - v60) >> 3);
        unint64_t v62 = v61 - a2;
        if (v61 <= v61 - a2) {
          std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
        }
        double v63 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v60 + 24 * v62));
        uint64_t v64 = *(void *)v6->_stack.__ptr_.__value_;
        if (0xAAAAAAAAAAAAAAABLL * ((*((void *)v6->_stack.__ptr_.__value_ + 1) - v64) >> 3) <= v62 + 1) {
          std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
        }
        long double v65 = v63;
        double v66 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v64 + 24 * (v62 + 1)));
        uint64_t v67 = *(void *)v6->_stack.__ptr_.__value_;
        if (0xAAAAAAAAAAAAAAABLL * ((*((void *)v6->_stack.__ptr_.__value_ + 1) - v67) >> 3) <= v62 + 2) {
          std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
        }
        double v68 = v66;
        long double v69 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v67 + 24 * (v62 + 2)));
        drop(v6, a2);
        if (v69 == 1.0)
        {
          v397 = [MEMORY[0x1E4F28B00] currentHandler];
          v398 = [NSString stringWithUTF8String:"-[PPScoreInterpreter _runOperator:arity:context:]"];
          [v397 handleFailureInFunction:v398, @"PPScoreInterpreter.mm", 1272, @"Invalid parameter not satisfying: %@", @"ratio != 1" file lineNumber description];
        }
        if (v69 < 0.0)
        {
          v399 = [MEMORY[0x1E4F28B00] currentHandler];
          v400 = [NSString stringWithUTF8String:"-[PPScoreInterpreter _runOperator:arity:context:]"];
          [v399 handleFailureInFunction:v400, @"PPScoreInterpreter.mm", 1273, @"Invalid parameter not satisfying: %@", @"ratio >= 0" file lineNumber description];
        }
        if (v69 == 1.0)
        {
          v70 = pp_score_interpreter_log_handle();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1CA9A8000, v70, OS_LOG_TYPE_ERROR, "Attempted to compute GeometricSum with a ratio of 1 -- setting output to PPScoreNotSet", buf, 2u);
          }

          v578[0] = 0xC0DE9A4000000000;
          char v579 = 0;
          push(v6, (const PPScoreInterpreterValue *)v578);
          uint64_t v9 = (double *)v578;
        }
        else
        {
          if (v69 < 0.0 && v65 != (double)(int)v65)
          {
            v299 = pp_score_interpreter_log_handle();
            if (os_log_type_enabled(v299, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              *(long double *)&uint8_t buf[4] = v69;
              *(_WORD *)&buf[12] = 2048;
              *(long double *)&buf[14] = v65;
              _os_log_error_impl(&dword_1CA9A8000, v299, OS_LOG_TYPE_ERROR, "Attempted to compute GeometricSum with ratio of %f and terms of %f -- result will be NaN", buf, 0x16u);
            }
          }
          v576[0] = v68 * ((1.0 - pow(v69, v65)) / (1.0 - v69));
          char v577 = 0;
          push(v6, (const PPScoreInterpreterValue *)v576);
          uint64_t v9 = v576;
        }
      }
      goto LABEL_563;
    case 13:
      if (shouldReturnUndefined(v5, 3uLL))
      {
        drop(v6, a2);
        v574[0] = 0xC0DE9A4000000000;
        char v575 = 0;
        push(v6, (const PPScoreInterpreterValue *)v574);
        uint64_t v9 = (double *)v574;
      }
      else
      {
        uint64_t v99 = *(void *)v6->_stack.__ptr_.__value_;
        unint64_t v100 = 0xAAAAAAAAAAAAAAABLL * ((*((void *)v6->_stack.__ptr_.__value_ + 1) - v99) >> 3);
        unint64_t v101 = v100 - a2;
        if (v100 <= v100 - a2) {
          std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
        }
        double v102 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v99 + 24 * v101));
        uint64_t v103 = *(void *)v6->_stack.__ptr_.__value_;
        if (0xAAAAAAAAAAAAAAABLL * ((*((void *)v6->_stack.__ptr_.__value_ + 1) - v103) >> 3) <= v101 + 1) {
          std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
        }
        double v104 = v102;
        double v105 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v103 + 24 * (v101 + 1)));
        uint64_t v106 = *(void *)v6->_stack.__ptr_.__value_;
        if (0xAAAAAAAAAAAAAAABLL * ((*((void *)v6->_stack.__ptr_.__value_ + 1) - v106) >> 3) <= v101 + 2) {
          std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
        }
        double v107 = v105;
        double v108 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v106 + 24 * (v101 + 2)));
        drop(v6, a2);
        v572[0] = v107 / (exp(-(v108 * v104)) + 1.0);
        char v573 = 0;
        push(v6, (const PPScoreInterpreterValue *)v572);
        uint64_t v9 = v572;
      }
      goto LABEL_563;
    case 15:
      if (shouldReturnUndefined(v5, 4uLL))
      {
        drop(v6, a2);
        v570[0] = 0xC0DE9A4000000000;
        char v571 = 0;
        push(v6, (const PPScoreInterpreterValue *)v570);
        uint64_t v9 = (double *)v570;
      }
      else
      {
        uint64_t v131 = *(void *)v6->_stack.__ptr_.__value_;
        unint64_t v132 = 0xAAAAAAAAAAAAAAABLL * ((*((void *)v6->_stack.__ptr_.__value_ + 1) - v131) >> 3);
        unint64_t v133 = v132 - a2;
        if (v132 <= v132 - a2) {
          std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
        }
        double v134 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v131 + 24 * v133));
        uint64_t v135 = *(void *)v6->_stack.__ptr_.__value_;
        if (0xAAAAAAAAAAAAAAABLL * ((*((void *)v6->_stack.__ptr_.__value_ + 1) - v135) >> 3) <= v133 + 1) {
          std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
        }
        double v136 = v134;
        double v137 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v135 + 24 * (v133 + 1)));
        uint64_t v138 = *(void *)v6->_stack.__ptr_.__value_;
        if (0xAAAAAAAAAAAAAAABLL * ((*((void *)v6->_stack.__ptr_.__value_ + 1) - v138) >> 3) <= v133 + 2) {
          std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
        }
        double v139 = v137;
        double v140 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v138 + 24 * (v133 + 2)));
        uint64_t v141 = *(void *)v6->_stack.__ptr_.__value_;
        if (0xAAAAAAAAAAAAAAABLL * ((*((void *)v6->_stack.__ptr_.__value_ + 1) - v141) >> 3) <= v133 + 3) {
          std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
        }
        double v142 = v140;
        double v143 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v141 + 24 * (v133 + 3)));
        drop(v6, a2);
        if (v139 > v143)
        {
          v405 = [MEMORY[0x1E4F28B00] currentHandler];
          v406 = [NSString stringWithUTF8String:"-[PPScoreInterpreter _runOperator:arity:context:]"];
          objc_msgSend(v405, "handleFailureInFunction:file:lineNumber:description:", v406, @"PPScoreInterpreter.mm", 1294, @"ClampToRange: minVal (%f) must be <= defaultVal (%f) ", *(void *)&v139, *(void *)&v143);
        }
        if (v143 > v142)
        {
          v407 = [MEMORY[0x1E4F28B00] currentHandler];
          v408 = [NSString stringWithUTF8String:"-[PPScoreInterpreter _runOperator:arity:context:]"];
          objc_msgSend(v407, "handleFailureInFunction:file:lineNumber:description:", v408, @"PPScoreInterpreter.mm", 1295, @"ClampToRange: defaultVal (%f) must be <= maxVal (%f) ", *(void *)&v143, *(void *)&v142);
        }
        double v144 = v136;
        if (v136 < v139) {
          double v144 = v139;
        }
        if (v144 >= v142) {
          double v145 = v142;
        }
        else {
          double v145 = v144;
        }
        if (v145 != v136)
        {
          v146 = pp_score_interpreter_log_handle();
          if (os_log_type_enabled(v146, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134219008;
            *(double *)&uint8_t buf[4] = v136;
            *(_WORD *)&buf[12] = 2048;
            *(double *)&buf[14] = v139;
            *(_WORD *)&unsigned char buf[22] = 2048;
            *(double *)&buf[24] = v142;
            LOWORD(v639[0]) = 2048;
            *(double *)((char *)v639 + 2) = v143;
            WORD5(v639[0]) = 2048;
            *(double *)((char *)v639 + 12) = v145;
            _os_log_impl(&dword_1CA9A8000, v146, OS_LOG_TYPE_INFO, "ClampToRange(input=%f, min=%f, max=%f, default=%f): input coerced to %f", buf, 0x34u);
          }
        }
        *(double *)v568 = v145;
        char v569 = 0;
        push(v6, (const PPScoreInterpreterValue *)v568);
        uint64_t v9 = (double *)v568;
      }
      goto LABEL_563;
    case 16:
      pop((PPScoreInterpreterCtx *)buf, v5);
      double v18 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)buf);
      PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)buf);
      pop((PPScoreInterpreterCtx *)buf, v6);
      double v19 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)buf);
      PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)buf);
      if (v18 == -31337.0 || (*(void *)&v18 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000) {
        double v18 = 1.0;
      }
      if (v19 >= 0.0) {
        double v21 = v19 * v18;
      }
      else {
        double v21 = v19 / fmax(v18, 0.0000001);
      }
      *(double *)v566 = v21;
      char v567 = 0;
      push(v6, (const PPScoreInterpreterValue *)v566);
      uint64_t v9 = (double *)v566;
      goto LABEL_563;
    case 17:
      if (shouldReturnUndefined(v5, a2))
      {
        drop(v6, a2);
        v564[0] = 0xC0DE9A4000000000;
        char v565 = 0;
        push(v6, (const PPScoreInterpreterValue *)v564);
        uint64_t v9 = (double *)v564;
        goto LABEL_563;
      }
      if (!a2)
      {
        double v175 = -INFINITY;
LABEL_408:
        *(double *)v555 = v175;
        char v556 = 0;
        push(v6, (const PPScoreInterpreterValue *)v555);
        uint64_t v9 = (double *)v555;
        goto LABEL_563;
      }
      uint64_t v173 = 0;
      v174 = 0;
      double v175 = -INFINITY;
      while (2)
      {
        memset(buf, 0, 24);
        pop((PPScoreInterpreterCtx *)buf, v6);
        if (buf[16])
        {
          if (buf[16] != 1)
          {
            if (buf[16] == 2)
            {
              v176 = PPScoreInterpreterValue::getObject((PPScoreInterpreterValue *)buf);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & (v175 == -INFINITY)) != 0)
              {
                v177 = v176;
                v178 = v177;
                if (v174)
                {
                  if ([v177 compare:v174] == 1) {
                    v179 = v178;
                  }
                  else {
                    v179 = v174;
                  }
                  v180 = v179;

                  v174 = v180;
                }
                else
                {
                  v174 = v177;
                }
              }
LABEL_274:
              PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)buf);
              if (++v173 == a2)
              {
                if (v174)
                {
                  PPScoreInterpreterValue::PPScoreInterpreterValue((PPScoreInterpreterValue *)v557, v174);
                  push(v6, (const PPScoreInterpreterValue *)v557);
                  PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v557);

                  goto LABEL_564;
                }
                goto LABEL_408;
              }
              continue;
            }
            v349 = pp_score_interpreter_log_handle();
            if (os_log_type_enabled(v349, OS_LOG_TYPE_ERROR))
            {
              LODWORD(v642) = 67109120;
              DWORD1(v642) = buf[16];
              _os_log_error_impl(&dword_1CA9A8000, v349, OS_LOG_TYPE_ERROR, "Invalid value of type %d passed to PPOperatorMaximum", (uint8_t *)&v642, 8u);
            }

            v558[0] = 0xC0DE9A4000000000;
            char v559 = 0;
            v350 = (PPScoreInterpreterValue *)v558;
            push(v6, (const PPScoreInterpreterValue *)v558);
            break;
          }
          if (!v174)
          {
            long long v642 = 0uLL;
            PPScoreInterpreterValue::getFloatVector((PPScoreInterpreterValue *)buf, &v642);
            v181 = *(float **)v642;
            v182 = *(float **)(v642 + 8);
            if (*(float **)v642 == v182)
            {
              float v183 = -INFINITY;
            }
            else
            {
              float v183 = -INFINITY;
              do
              {
                float v184 = *v181++;
                float v183 = fmaxf(v183, v184);
              }
              while (v181 != v182);
            }
            if (*((void *)&v642 + 1)) {
              std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v642 + 1));
            }
            v174 = 0;
            double v185 = v183;
LABEL_270:
            double v175 = fmax(v175, v185);
            goto LABEL_274;
          }
          v352 = pp_score_interpreter_log_handle();
          if (os_log_type_enabled(v352, OS_LOG_TYPE_ERROR))
          {
            LODWORD(v642) = 67109120;
            DWORD1(v642) = buf[16];
            _os_log_error_impl(&dword_1CA9A8000, v352, OS_LOG_TYPE_ERROR, "Invalid value of type %d passed to PPOperatorMaximum", (uint8_t *)&v642, 8u);
          }

          v560[0] = 0xC0DE9A4000000000;
          char v561 = 0;
          v350 = (PPScoreInterpreterValue *)v560;
          push(v6, (const PPScoreInterpreterValue *)v560);
        }
        else
        {
          if (!v174)
          {
            double v185 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)buf);
            v174 = 0;
            if (v185 == -31338.0) {
              double v185 = -INFINITY;
            }
            goto LABEL_270;
          }
          v354 = pp_score_interpreter_log_handle();
          if (os_log_type_enabled(v354, OS_LOG_TYPE_ERROR))
          {
            LODWORD(v642) = 67109120;
            DWORD1(v642) = buf[16];
            _os_log_error_impl(&dword_1CA9A8000, v354, OS_LOG_TYPE_ERROR, "Invalid value of type %d passed to PPOperatorMaximum", (uint8_t *)&v642, 8u);
          }

          v562[0] = 0xC0DE9A4000000000;
          char v563 = 0;
          v350 = (PPScoreInterpreterValue *)v562;
          push(v6, (const PPScoreInterpreterValue *)v562);
        }
        break;
      }
      PPScoreInterpreterValue::~PPScoreInterpreterValue(v350);
      PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)buf);

      goto LABEL_564;
    case 18:
      if (shouldReturnUndefined(v5, a2))
      {
        drop(v6, a2);
        v553[0] = 0xC0DE9A4000000000;
        char v554 = 0;
        push(v6, (const PPScoreInterpreterValue *)v553);
        uint64_t v9 = (double *)v553;
        goto LABEL_563;
      }
      if (!a2)
      {
        double v162 = INFINITY;
LABEL_406:
        *(double *)v544 = v162;
        char v545 = 0;
        push(v6, (const PPScoreInterpreterValue *)v544);
        uint64_t v9 = (double *)v544;
        goto LABEL_563;
      }
      uint64_t v160 = 0;
      v161 = 0;
      double v162 = INFINITY;
      while (2)
      {
        memset(buf, 0, 24);
        pop((PPScoreInterpreterCtx *)buf, v6);
        if (buf[16])
        {
          if (buf[16] != 1)
          {
            if (buf[16] == 2)
            {
              v163 = PPScoreInterpreterValue::getObject((PPScoreInterpreterValue *)buf);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & (v162 == INFINITY)) != 0)
              {
                v164 = v163;
                v165 = v164;
                if (v161)
                {
                  if ([v164 compare:v161] == -1) {
                    v166 = v165;
                  }
                  else {
                    v166 = v161;
                  }
                  v167 = v166;

                  v161 = v167;
                }
                else
                {
                  v161 = v164;
                }
              }
LABEL_243:
              PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)buf);
              if (++v160 == a2)
              {
                if (v161)
                {
                  PPScoreInterpreterValue::PPScoreInterpreterValue((PPScoreInterpreterValue *)v546, v161);
                  push(v6, (const PPScoreInterpreterValue *)v546);
                  PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v546);

                  goto LABEL_564;
                }
                goto LABEL_406;
              }
              continue;
            }
            v347 = pp_score_interpreter_log_handle();
            if (os_log_type_enabled(v347, OS_LOG_TYPE_ERROR))
            {
              LODWORD(v642) = 67109120;
              DWORD1(v642) = buf[16];
              _os_log_error_impl(&dword_1CA9A8000, v347, OS_LOG_TYPE_ERROR, "Invalid value of type %d passed to PPOperatorMinimum", (uint8_t *)&v642, 8u);
            }

            v547[0] = 0xC0DE9A4000000000;
            char v548 = 0;
            v348 = (PPScoreInterpreterValue *)v547;
            push(v6, (const PPScoreInterpreterValue *)v547);
            break;
          }
          if (!v161)
          {
            long long v642 = 0uLL;
            PPScoreInterpreterValue::getFloatVector((PPScoreInterpreterValue *)buf, &v642);
            v168 = *(float **)v642;
            v169 = *(float **)(v642 + 8);
            if (*(float **)v642 == v169)
            {
              float v170 = INFINITY;
            }
            else
            {
              float v170 = INFINITY;
              do
              {
                float v171 = *v168++;
                float v170 = fminf(v170, v171);
              }
              while (v168 != v169);
            }
            if (*((void *)&v642 + 1)) {
              std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v642 + 1));
            }
            v161 = 0;
            double v172 = v170;
LABEL_239:
            double v162 = fmin(v162, v172);
            goto LABEL_243;
          }
          v351 = pp_score_interpreter_log_handle();
          if (os_log_type_enabled(v351, OS_LOG_TYPE_ERROR))
          {
            LODWORD(v642) = 67109120;
            DWORD1(v642) = buf[16];
            _os_log_error_impl(&dword_1CA9A8000, v351, OS_LOG_TYPE_ERROR, "Invalid value of type %d passed to PPOperatorMinimum", (uint8_t *)&v642, 8u);
          }

          v549[0] = 0xC0DE9A4000000000;
          char v550 = 0;
          v348 = (PPScoreInterpreterValue *)v549;
          push(v6, (const PPScoreInterpreterValue *)v549);
        }
        else
        {
          if (!v161)
          {
            double v172 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)buf);
            v161 = 0;
            if (v172 == -31338.0) {
              double v172 = INFINITY;
            }
            goto LABEL_239;
          }
          v353 = pp_score_interpreter_log_handle();
          if (os_log_type_enabled(v353, OS_LOG_TYPE_ERROR))
          {
            LODWORD(v642) = 67109120;
            DWORD1(v642) = buf[16];
            _os_log_error_impl(&dword_1CA9A8000, v353, OS_LOG_TYPE_ERROR, "Invalid value of type %d passed to PPOperatorMinimum", (uint8_t *)&v642, 8u);
          }

          v551[0] = 0xC0DE9A4000000000;
          char v552 = 0;
          v348 = (PPScoreInterpreterValue *)v551;
          push(v6, (const PPScoreInterpreterValue *)v551);
        }
        break;
      }
      PPScoreInterpreterValue::~PPScoreInterpreterValue(v348);
      PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)buf);

      goto LABEL_564;
    case 19:
      drop(v5, a2);
      id v17 = pp_score_interpreter_log_handle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CA9A8000, v17, OS_LOG_TYPE_ERROR, "PPOperatorNeuralNet is not supported anymore", buf, 2u);
      }

      v542[0] = 0xC0DE9A4000000000;
      char v543 = 0;
      push(v6, (const PPScoreInterpreterValue *)v542);
      uint64_t v9 = (double *)v542;
      goto LABEL_563;
    case 21:
      if (shouldReturnUndefined(v5, 2uLL))
      {
        drop(v6, a2);
        v540[0] = 0xC0DE9A4000000000;
        char v541 = 0;
        push(v6, (const PPScoreInterpreterValue *)v540);
        uint64_t v9 = (double *)v540;
        goto LABEL_563;
      }
      uint64_t v255 = *(void *)v6->_stack.__ptr_.__value_;
      unint64_t v256 = 0xAAAAAAAAAAAAAAABLL * ((*((void *)v6->_stack.__ptr_.__value_ + 1) - v255) >> 3);
      unint64_t v257 = v256 - a2;
      if (v256 <= v256 - a2) {
        std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
      }
      v258 = PPScoreInterpreterValue::getObject((PPScoreInterpreterValue *)(v255 + 24 * v257));
      uint64_t v259 = *(void *)v6->_stack.__ptr_.__value_;
      if (0xAAAAAAAAAAAAAAABLL * ((*((void *)v6->_stack.__ptr_.__value_ + 1) - v259) >> 3) <= v257 + 1) {
        std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
      }
      v260 = PPScoreInterpreterValue::getObject((PPScoreInterpreterValue *)(v259 + 24 * (v257 + 1)));
      drop(v6, a2);
      id v261 = v258;
      id v262 = v260;
      [v261 length];
      v538[0] = (double)[v262 containsObject:v261];
      char v539 = 0;
      push(v6, (const PPScoreInterpreterValue *)v538);
      PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v538);

      goto LABEL_564;
    case 22:
      if (shouldReturnUndefined(v5, 2uLL))
      {
        drop(v6, a2);
        v536[0] = 0xC0DE9A4000000000;
        char v537 = 0;
        push(v6, (const PPScoreInterpreterValue *)v536);
        uint64_t v9 = (double *)v536;
      }
      else
      {
        uint64_t v92 = *(void *)v6->_stack.__ptr_.__value_;
        unint64_t v93 = 0xAAAAAAAAAAAAAAABLL * ((*((void *)v6->_stack.__ptr_.__value_ + 1) - v92) >> 3);
        unint64_t v94 = v93 - a2;
        if (v93 <= v93 - a2) {
          std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
        }
        double v95 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v92 + 24 * v94));
        uint64_t v96 = *(void *)v6->_stack.__ptr_.__value_;
        if (0xAAAAAAAAAAAAAAABLL * ((*((void *)v6->_stack.__ptr_.__value_ + 1) - v96) >> 3) <= v94 + 1) {
          std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
        }
        double v97 = v95;
        double v98 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v96 + 24 * (v94 + 1)));
        drop(v6, a2);
        if (v97 > v98)
        {
          v385 = [MEMORY[0x1E4F28B00] currentHandler];
          v386 = [NSString stringWithUTF8String:"-[PPScoreInterpreter _runOperator:arity:context:]"];
          objc_msgSend(v385, "handleFailureInFunction:file:lineNumber:description:", v386, @"PPScoreInterpreter.mm", 1463, @"RandomUniform: start (%f) must be <= end (%f) ", *(void *)&v97, *(void *)&v98);
        }
        v534[0] = v97 + (v98 - v97) * ((double)arc4random_uniform(0xFFFFFFFF) / 4294967300.0);
        char v535 = 0;
        push(v6, (const PPScoreInterpreterValue *)v534);
        uint64_t v9 = v534;
      }
      goto LABEL_563;
    case 24:
      if (shouldReturnUndefined(v5, 1uLL))
      {
        drop(v6, a2);
        v532[0] = 0xC0DE9A4000000000;
        char v533 = 0;
        push(v6, (const PPScoreInterpreterValue *)v532);
        uint64_t v9 = (double *)v532;
        goto LABEL_563;
      }
      v71 = v6->_stack.__ptr_.__value_;
      unint64_t v72 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v71[1] - *v71) >> 3) - a2;
      memset(buf, 0, 24);
      v74 = v71;
      uint64_t v73 = *v71;
      if (0xAAAAAAAAAAAAAAABLL * ((v74[1] - v73) >> 3) <= v72) {
        std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
      }
      PPScoreInterpreterValue::PPScoreInterpreterValue((PPScoreInterpreterValue *)buf, (const PPScoreInterpreterValue *)(v73 + 24 * v72));
      drop(v6, a2);
      if (!buf[16])
      {
        double v300 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)buf);
        if (v300 == -31338.0) {
          double v300 = 0.0;
        }
        v530[0] = fabs(v300);
        char v531 = 0;
        push(v6, (const PPScoreInterpreterValue *)v530);
        v301 = (PPScoreInterpreterValue *)v530;
        goto LABEL_550;
      }
      if (buf[16] != 1)
      {
        v302 = pp_score_interpreter_log_handle();
        if (os_log_type_enabled(v302, OS_LOG_TYPE_ERROR))
        {
          LODWORD(v642) = 67109120;
          DWORD1(v642) = buf[16];
          _os_log_error_impl(&dword_1CA9A8000, v302, OS_LOG_TYPE_ERROR, "Invalid value of type %d in argument to PPOperatorAbsVal", (uint8_t *)&v642, 8u);
        }

        v526[0] = 0xC0DE9A4000000000;
        char v527 = 0;
        push(v6, (const PPScoreInterpreterValue *)v526);
        v301 = (PPScoreInterpreterValue *)v526;
        goto LABEL_550;
      }
      PPScoreInterpreterValue::getFloatVector((PPScoreInterpreterValue *)buf, &v641);
      uint64_t v643 = 0;
      long long v642 = 0uLL;
      std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v642, *(const void **)v641, *(void *)(v641 + 8), (uint64_t)(*(void *)(v641 + 8) - *(void *)v641) >> 2);
      if (*((void *)&v641 + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v641 + 1));
      }
      uint64_t v75 = *((void *)&v642 + 1);
      v76 = (void *)v642;
      if ((void)v642 != *((void *)&v642 + 1))
      {
        v77 = (float *)v642;
        do
        {
          float v78 = *v77;
          if (*v77 < 0.0) {
            float v78 = -*v77;
          }
          *v77++ = v78;
        }
        while (v77 != (float *)v75);
      }
      std::allocate_shared[abi:ne180100]<std::vector<float>,std::allocator<std::vector<float>>,std::vector<float> const&,void>(v528, v76, v75);
      char v529 = 1;
      push(v6, (const PPScoreInterpreterValue *)v528);
      v79 = (PPScoreInterpreterValue *)v528;
LABEL_318:
      PPScoreInterpreterValue::~PPScoreInterpreterValue(v79);
      if (v76) {
        operator delete(v76);
      }
      goto LABEL_551;
    case 25:
      if (shouldReturnUndefined(v5, 2uLL))
      {
        drop(v6, a2);
        v524[0] = 0xC0DE9A4000000000;
        char v525 = 0;
        push(v6, (const PPScoreInterpreterValue *)v524);
        uint64_t v9 = (double *)v524;
        goto LABEL_563;
      }
      uint64_t v147 = *(void *)v6->_stack.__ptr_.__value_;
      unint64_t v148 = 0xAAAAAAAAAAAAAAABLL * ((*((void *)v6->_stack.__ptr_.__value_ + 1) - v147) >> 3);
      unint64_t v149 = v148 - a2;
      long long v642 = 0uLL;
      if (v148 <= v148 - a2) {
        std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
      }
      PPScoreInterpreterValue::getFloatVector((PPScoreInterpreterValue *)(v147 + 24 * v149), &v642);
      uint64_t v150 = *(void *)v6->_stack.__ptr_.__value_;
      if (0xAAAAAAAAAAAAAAABLL * ((*((void *)v6->_stack.__ptr_.__value_ + 1) - v150) >> 3) <= v149 + 1) {
        std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
      }
      double v151 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v150 + 24 * (v149 + 1)));
      drop(v6, a2);
      memset(buf, 0, 24);
      std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(buf, *(const void **)v642, *(void *)(v642 + 8), (uint64_t)(*(void *)(v642 + 8) - *(void *)v642) >> 2);
      float v152 = v151;
      *(float *)&long long v641 = v152;
      std::vector<float>::push_back[abi:ne180100]((uint64_t)buf, &v641);
      v39 = *(void **)buf;
      std::allocate_shared[abi:ne180100]<std::vector<float>,std::allocator<std::vector<float>>,std::vector<float> const&,void>(v522, *(const void **)buf, *(uint64_t *)&buf[8]);
      char v523 = 1;
      push(v6, (const PPScoreInterpreterValue *)v522);
      v153 = (PPScoreInterpreterValue *)v522;
      goto LABEL_416;
    case 26:
      if (shouldReturnUndefined(v5, 1uLL))
      {
        drop(v6, a2);
        v520[0] = 0xC0DE9A4000000000;
        char v521 = 0;
        push(v6, (const PPScoreInterpreterValue *)v520);
        uint64_t v9 = (double *)v520;
        goto LABEL_563;
      }
      uint64_t v266 = *(void *)v6->_stack.__ptr_.__value_;
      unint64_t v267 = 0xAAAAAAAAAAAAAAABLL * ((*((void *)v6->_stack.__ptr_.__value_ + 1) - v266) >> 3);
      *(void *)&buf[8] = 0;
      *(void *)buf = 0;
      if (v267 <= v267 - a2) {
        std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
      }
      PPScoreInterpreterValue::getFloatVector((PPScoreInterpreterValue *)(v266 + 24 * (v267 - a2)), buf);
      drop(v6, a2);
      v268 = *(float **)(*(void *)buf + 8);
      double v269 = 0.0;
      if (**(float ***)buf != v268)
      {
        v270 = **(float ***)buf;
        do
        {
          float v271 = *v270++;
          double v269 = v269 + v271;
        }
        while (v270 != v268);
        double v269 = v269 / (double)(unint64_t)(((uint64_t)v268 - **(void **)buf) >> 2);
      }
      *(double *)v518 = v269;
      char v519 = 0;
      push(v6, (const PPScoreInterpreterValue *)v518);
      v265 = (PPScoreInterpreterValue *)v518;
      goto LABEL_413;
    case 27:
      if (shouldReturnUndefined(v5, 1uLL))
      {
        drop(v6, a2);
        v516[0] = 0xC0DE9A4000000000;
        char v517 = 0;
        push(v6, (const PPScoreInterpreterValue *)v516);
        uint64_t v9 = (double *)v516;
LABEL_563:
        PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v9);
        goto LABEL_564;
      }
      uint64_t v37 = *(void *)v6->_stack.__ptr_.__value_;
      unint64_t v38 = 0xAAAAAAAAAAAAAAABLL * ((*((void *)v6->_stack.__ptr_.__value_ + 1) - v37) >> 3);
      long long v642 = 0uLL;
      if (v38 <= v38 - a2) {
        std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
      }
      PPScoreInterpreterValue::getFloatVector((PPScoreInterpreterValue *)(v37 + 24 * (v38 - a2)), &v642);
      drop(v6, a2);
      memset(buf, 0, 24);
      std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(buf, *(const void **)v642, *(void *)(v642 + 8), (uint64_t)(*(void *)(v642 + 8) - *(void *)v642) >> 2);
      v39 = *(void **)buf;
      uint64_t v40 = *(void *)&buf[8] - *(void *)buf;
      if (*(void *)&buf[8] == *(void *)buf)
      {
        v514[0] = 0xC0DE9A4000000000;
        char v515 = 0;
        push(v6, (const PPScoreInterpreterValue *)v514);
        v153 = (PPScoreInterpreterValue *)v514;
LABEL_416:
        PPScoreInterpreterValue::~PPScoreInterpreterValue(v153);
        if (!v39)
        {
LABEL_536:
          v296 = (std::__shared_weak_count *)*((void *)&v642 + 1);
          if (*((void *)&v642 + 1)) {
LABEL_537:
          }
            std::__shared_weak_count::__release_shared[abi:ne180100](v296);
          goto LABEL_564;
        }
LABEL_535:
        operator delete(v39);
        goto LABEL_536;
      }
      LOBYTE(v641) = 0;
      std::__sort<std::__less<float,float> &,float *>();
      unint64_t v41 = v40 >> 2;
      double v42 = (double)(unint64_t)(v40 >> 2) * 0.5 + -1.0;
      unint64_t v43 = (int)v42;
      if (v42 == (double)(int)v42)
      {
        if (v41 > v43 && v41 > (int)v43 + 1)
        {
          double v44 = (float)(*((float *)v39 + v43) + *((float *)v39 + (int)v43 + 1)) * 0.5;
LABEL_534:
          *(double *)v512 = v44;
          char v513 = 0;
          push(v6, (const PPScoreInterpreterValue *)v512);
          PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v512);
          goto LABEL_535;
        }
      }
      else if (v41 > v43)
      {
        double v44 = *((float *)v39 + v43);
        goto LABEL_534;
      }
LABEL_648:
      std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
    case 28:
      if (shouldReturnUndefined(v5, 1uLL))
      {
        drop(v6, a2);
        v510[0] = 0xC0DE9A4000000000;
        char v511 = 0;
        push(v6, (const PPScoreInterpreterValue *)v510);
        uint64_t v9 = (double *)v510;
        goto LABEL_563;
      }
      uint64_t v263 = *(void *)v6->_stack.__ptr_.__value_;
      unint64_t v264 = 0xAAAAAAAAAAAAAAABLL * ((*((void *)v6->_stack.__ptr_.__value_ + 1) - v263) >> 3);
      *(void *)&buf[8] = 0;
      *(void *)buf = 0;
      if (v264 <= v264 - a2) {
        std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
      }
      PPScoreInterpreterValue::getFloatVector((PPScoreInterpreterValue *)(v263 + 24 * (v264 - a2)), buf);
      drop(v6, a2);
      v508[0] = (double)(unint64_t)((uint64_t)(*(void *)(*(void *)buf + 8) - **(void **)buf) >> 2);
      char v509 = 0;
      push(v6, (const PPScoreInterpreterValue *)v508);
      v265 = (PPScoreInterpreterValue *)v508;
      goto LABEL_413;
    case 29:
      if (shouldReturnUndefined(v5, 1uLL))
      {
        drop(v6, a2);
        v506[0] = 0xC0DE9A4000000000;
        char v507 = 0;
        push(v6, (const PPScoreInterpreterValue *)v506);
        uint64_t v9 = (double *)v506;
        goto LABEL_563;
      }
      uint64_t v278 = *(void *)v6->_stack.__ptr_.__value_;
      unint64_t v279 = 0xAAAAAAAAAAAAAAABLL * ((*((void *)v6->_stack.__ptr_.__value_ + 1) - v278) >> 3);
      *(void *)&buf[8] = 0;
      *(void *)buf = 0;
      if (v279 <= v279 - a2) {
        std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
      }
      PPScoreInterpreterValue::getFloatVector((PPScoreInterpreterValue *)(v278 + 24 * (v279 - a2)), buf);
      drop(v6, a2);
      v280 = **(float ***)buf;
      v281 = *(float **)(*(void *)buf + 8);
      if (**(float ***)buf == v281)
      {
        v504[0] = 0;
        char v505 = 0;
        v289 = (PPScoreInterpreterValue *)v504;
        push(v6, (const PPScoreInterpreterValue *)v504);
      }
      else
      {
        uint64_t v282 = v281 - v280;
        double v283 = 0.0;
        v284 = **(float ***)buf;
        do
        {
          float v285 = *v284++;
          double v283 = v283 + v285;
        }
        while (v284 != v281);
        double v286 = v283 / (double)(unint64_t)v282;
        double v287 = 0.0;
        do
        {
          float v288 = *v280++;
          double v287 = v287 + (v288 - v286) * (v288 - v286);
        }
        while (v280 != v281);
        v502[0] = sqrt(v287 / (double)(unint64_t)v282);
        char v503 = 0;
        v289 = (PPScoreInterpreterValue *)v502;
        push(v6, (const PPScoreInterpreterValue *)v502);
      }
      v265 = v289;
LABEL_413:
      PPScoreInterpreterValue::~PPScoreInterpreterValue(v265);
      v296 = *(std::__shared_weak_count **)&buf[8];
      if (!*(void *)&buf[8]) {
        goto LABEL_564;
      }
      goto LABEL_537;
    case 30:
      if (shouldReturnUndefined(v5, 2uLL))
      {
        drop(v6, a2);
        v500[0] = 0xC0DE9A4000000000;
        char v501 = 0;
        push(v6, (const PPScoreInterpreterValue *)v500);
        uint64_t v9 = (double *)v500;
        goto LABEL_563;
      }
      uint64_t v195 = *(void *)v6->_stack.__ptr_.__value_;
      unint64_t v196 = 0xAAAAAAAAAAAAAAABLL * ((*((void *)v6->_stack.__ptr_.__value_ + 1) - v195) >> 3);
      unint64_t v197 = v196 - a2;
      if (v196 <= v196 - a2) {
        std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
      }
      v198 = PPScoreInterpreterValue::getObject((PPScoreInterpreterValue *)(v195 + 24 * v197));
      memset(buf, 0, 24);
      uint64_t v199 = *(void *)v6->_stack.__ptr_.__value_;
      if (0xAAAAAAAAAAAAAAABLL * ((*((void *)v6->_stack.__ptr_.__value_ + 1) - v199) >> 3) <= v197 + 1) {
        std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
      }
      PPScoreInterpreterValue::PPScoreInterpreterValue((PPScoreInterpreterValue *)buf, (const PPScoreInterpreterValue *)(v199 + 24 * (v197 + 1)));
      drop(v6, a2);
      if (!v198) {
        goto LABEL_453;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v200 = v198;
      }
      else
      {
        v308 = pp_score_interpreter_log_handle();
        if (os_log_type_enabled(v308, OS_LOG_TYPE_ERROR))
        {
          v372 = (objc_class *)objc_opt_class();
          v373 = NSStringFromClass(v372);
          LODWORD(v642) = 138412290;
          *(void *)((char *)&v642 + 4) = v373;
          _os_log_error_impl(&dword_1CA9A8000, v308, OS_LOG_TYPE_ERROR, "PPOperatorUpdateItemCounts was passed an existingCountsObj of the wrong type: %@", (uint8_t *)&v642, 0xCu);
        }
LABEL_453:
        v200 = objc_opt_new();
      }
      v309 = v200;
      if (buf[16] == 2)
      {
        v333 = PPScoreInterpreterValue::getObject((PPScoreInterpreterValue *)buf);
        if (v333) {
          [v309 addObject:v333];
        }
LABEL_513:

        goto LABEL_514;
      }
      if (buf[16] != 1)
      {
        if (!buf[16])
        {
          v310 = [NSNumber numberWithDouble:PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)buf)];
          [v309 addObject:v310];

          goto LABEL_514;
        }
        v333 = pp_score_interpreter_log_handle();
        if (os_log_type_enabled(v333, OS_LOG_TYPE_ERROR))
        {
          LODWORD(v642) = 67109120;
          DWORD1(v642) = buf[16];
          _os_log_error_impl(&dword_1CA9A8000, v333, OS_LOG_TYPE_ERROR, "Attempted to store invalid value of type %d in argument to PPOperatorUpdateItemCounts", (uint8_t *)&v642, 8u);
        }
        goto LABEL_513;
      }
      long long v642 = 0uLL;
      PPScoreInterpreterValue::getFloatVector((PPScoreInterpreterValue *)buf, &v642);
      v330 = *(_DWORD **)v642;
      v331 = *(_DWORD **)(v642 + 8);
      if (*(_DWORD **)v642 != v331)
      {
        do
        {
          LODWORD(v329) = *v330;
          v332 = [NSNumber numberWithFloat:v329];
          [v309 addObject:v332];

          ++v330;
        }
        while (v330 != v331);
      }
      if (*((void *)&v642 + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v642 + 1));
      }
LABEL_514:
      PPScoreInterpreterValue::PPScoreInterpreterValue((PPScoreInterpreterValue *)v499, v309);
      push(v6, (const PPScoreInterpreterValue *)v499);
      PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v499);

      PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)buf);
      goto LABEL_564;
    case 31:
      if (shouldReturnUndefined(v5, 2uLL))
      {
        drop(v6, a2);
        v497[0] = 0xC0DE9A4000000000;
        char v498 = 0;
        push(v6, (const PPScoreInterpreterValue *)v497);
        uint64_t v9 = (double *)v497;
        goto LABEL_563;
      }
      uint64_t v272 = *(void *)v6->_stack.__ptr_.__value_;
      unint64_t v273 = 0xAAAAAAAAAAAAAAABLL * ((*((void *)v6->_stack.__ptr_.__value_ + 1) - v272) >> 3);
      unint64_t v274 = v273 - a2;
      if (v273 <= v273 - a2) {
        std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
      }
      v275 = PPScoreInterpreterValue::getObject((PPScoreInterpreterValue *)(v272 + 24 * v274));
      memset(buf, 0, 24);
      uint64_t v276 = *(void *)v6->_stack.__ptr_.__value_;
      if (0xAAAAAAAAAAAAAAABLL * ((*((void *)v6->_stack.__ptr_.__value_ + 1) - v276) >> 3) <= v274 + 1) {
        std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
      }
      PPScoreInterpreterValue::PPScoreInterpreterValue((PPScoreInterpreterValue *)buf, (const PPScoreInterpreterValue *)(v276 + 24 * (v274 + 1)));
      drop(v6, a2);
      if (!v275) {
        goto LABEL_461;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v277 = v275;
      }
      else
      {
        v311 = pp_score_interpreter_log_handle();
        if (os_log_type_enabled(v311, OS_LOG_TYPE_ERROR))
        {
          v374 = (objc_class *)objc_opt_class();
          v375 = NSStringFromClass(v374);
          LODWORD(v642) = 138412290;
          *(void *)((char *)&v642 + 4) = v375;
          _os_log_error_impl(&dword_1CA9A8000, v311, OS_LOG_TYPE_ERROR, "PPOperatorUpdateCompactNumericItemCounts was passed an existingCountsObj of the wrong type: %@", (uint8_t *)&v642, 0xCu);
        }
LABEL_461:
        v277 = objc_opt_new();
      }
      v312 = v277;
      if (buf[16] == 1)
      {
        long long v642 = 0uLL;
        PPScoreInterpreterValue::getFloatVector((PPScoreInterpreterValue *)buf, &v642);
        v313 = *(float **)v642;
        v314 = *(float **)(v642 + 8);
        while (v313 != v314)
          [v312 addValue:(unsigned __int16)(int)*v313++];
        if (*((void *)&v642 + 1)) {
          std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v642 + 1));
        }
      }
      else if (buf[16])
      {
        v315 = pp_score_interpreter_log_handle();
        if (os_log_type_enabled(v315, OS_LOG_TYPE_ERROR))
        {
          LODWORD(v642) = 67109120;
          DWORD1(v642) = buf[16];
          _os_log_error_impl(&dword_1CA9A8000, v315, OS_LOG_TYPE_ERROR, "Attempted to store invalid value of type %d in argument to PPOperatorUpdateCompactNumericItemCounts", (uint8_t *)&v642, 8u);
        }
      }
      else
      {
        [v277 addValue:(unsigned __int16)(int)PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)buf)];
      }
      PPScoreInterpreterValue::PPScoreInterpreterValue((PPScoreInterpreterValue *)v496, v312);
      push(v6, (const PPScoreInterpreterValue *)v496);
      PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v496);

      PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)buf);
      goto LABEL_564;
    case 32:
      if (shouldReturnUndefined(v5, 2uLL))
      {
        drop(v6, a2);
        v494[0] = 0xC0DE9A4000000000;
        char v495 = 0;
        push(v6, (const PPScoreInterpreterValue *)v494);
        uint64_t v9 = (double *)v494;
        goto LABEL_563;
      }
      uint64_t v248 = *(void *)v6->_stack.__ptr_.__value_;
      unint64_t v249 = 0xAAAAAAAAAAAAAAABLL * ((*((void *)v6->_stack.__ptr_.__value_ + 1) - v248) >> 3);
      unint64_t v250 = v249 - a2;
      if (v249 <= v249 - a2) {
        std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
      }
      v251 = PPScoreInterpreterValue::getObject((PPScoreInterpreterValue *)(v248 + 24 * v250));
      memset(buf, 0, 24);
      uint64_t v252 = *(void *)v6->_stack.__ptr_.__value_;
      if (0xAAAAAAAAAAAAAAABLL * ((*((void *)v6->_stack.__ptr_.__value_ + 1) - v252) >> 3) <= v250 + 1) {
        std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
      }
      PPScoreInterpreterValue::PPScoreInterpreterValue((PPScoreInterpreterValue *)buf, (const PPScoreInterpreterValue *)(v252 + 24 * (v250 + 1)));
      drop(v6, a2);
      if (buf[16])
      {
        if (buf[16] != 2)
        {
          v307 = pp_score_interpreter_log_handle();
          if (os_log_type_enabled(v307, OS_LOG_TYPE_ERROR))
          {
            LODWORD(v642) = 67109120;
            DWORD1(v642) = buf[16];
            _os_log_error_impl(&dword_1CA9A8000, v307, OS_LOG_TYPE_ERROR, "Attempted to store invalid value of type %d in 2nd argument to PPOperatorCountsForItem", (uint8_t *)&v642, 8u);
          }

          v492[0] = 0xC0DE9A4000000000;
          char v493 = 0;
          push(v6, (const PPScoreInterpreterValue *)v492);
          PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v492);
          goto LABEL_614;
        }
        PPScoreInterpreterValue::getObject((PPScoreInterpreterValue *)buf);
        v254 = double v253 = -31337.0;
      }
      else
      {
        v254 = 0;
        double v253 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)buf);
      }
      if (!v251)
      {
        v490[0] = 0;
        char v491 = 0;
        push(v6, (const PPScoreInterpreterValue *)v490);
        PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v490);

        goto LABEL_614;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v305 = v251;
        if (v253 != -31337.0)
        {
          v358 = [NSNumber numberWithDouble:v253];
          unint64_t v306 = [v305 countForObject:v358];

          goto LABEL_601;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unint64_t v306 = [v305 countForObject:v254];
LABEL_601:

          v482[0] = (double)v306;
          char v483 = 0;
          push(v6, (const PPScoreInterpreterValue *)v482);
          PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v482);

          goto LABEL_614;
        }
        v359 = pp_score_interpreter_log_handle();
        if (os_log_type_enabled(v359, OS_LOG_TYPE_ERROR))
        {
          LODWORD(v642) = 138412290;
          *(void *)((char *)&v642 + 4) = v254;
          _os_log_error_impl(&dword_1CA9A8000, v359, OS_LOG_TYPE_ERROR, "Invalid key passed to PPOperatorCountsForItem using NSCountedSet: %@", (uint8_t *)&v642, 0xCu);
        }

        v488[0] = 0xC0DE9A4000000000;
        char v489 = 0;
        push(v6, (const PPScoreInterpreterValue *)v488);
        PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v488);

LABEL_614:
        PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)buf);

        goto LABEL_564;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v355 = pp_score_interpreter_log_handle();
        if (os_log_type_enabled(v355, OS_LOG_TYPE_ERROR))
        {
          LODWORD(v642) = 138412290;
          *(void *)((char *)&v642 + 4) = v251;
          _os_log_error_impl(&dword_1CA9A8000, v355, OS_LOG_TYPE_ERROR, "Invalid counted set object passed to PPOperatorCountsForItem: %@", (uint8_t *)&v642, 0xCu);
        }

        v484[0] = 0xC0DE9A4000000000;
        char v485 = 0;
        push(v6, (const PPScoreInterpreterValue *)v484);
        PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v484);

        goto LABEL_614;
      }
      id v343 = v251;
      if (v253 == -31337.0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v366 = pp_score_interpreter_log_handle();
          if (os_log_type_enabled(v366, OS_LOG_TYPE_ERROR))
          {
            LODWORD(v642) = 138412290;
            *(void *)((char *)&v642 + 4) = v254;
            _os_log_error_impl(&dword_1CA9A8000, v366, OS_LOG_TYPE_ERROR, "Invalid key passed to PPOperatorCountsForItem using PPU16CountedSet: %@", (uint8_t *)&v642, 0xCu);
          }

          v486[0] = 0xC0DE9A4000000000;
          char v487 = 0;
          push(v6, (const PPScoreInterpreterValue *)v486);
          PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v486);

          goto LABEL_614;
        }
        [v254 doubleValue];
        double v253 = v344;
      }
      unint64_t v306 = [v343 countForValue:(unsigned __int16)(int)v253];
      goto LABEL_601;
    case 33:
      goto LABEL_64;
    case 34:
      char v8 = 0;
LABEL_64:
      if (shouldReturnUndefined(v5, 1uLL))
      {
        drop(v6, a2);
        v480[0] = 0xC0DE9A4000000000;
        char v481 = 0;
        push(v6, (const PPScoreInterpreterValue *)v480);
        uint64_t v9 = (double *)v480;
        goto LABEL_563;
      }
      uint64_t v22 = v6->_stack.__ptr_.__value_;
      unint64_t v23 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v22[1] - *v22) >> 3) - a2;
      uint64_t v643 = 0;
      long long v642 = 0uLL;
      v25 = v22;
      uint64_t v24 = *v22;
      if (0xAAAAAAAAAAAAAAABLL * ((v25[1] - v24) >> 3) <= v23) {
        std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
      }
      PPScoreInterpreterValue::PPScoreInterpreterValue((PPScoreInterpreterValue *)&v642, (const PPScoreInterpreterValue *)(v24 + 24 * v23));
      drop(v6, a2);
      if ((_BYTE)v643)
      {
        if (v643 == 1)
        {
          PPScoreInterpreterValue::getFloatVector((PPScoreInterpreterValue *)&v642, buf);
          v292 = *(float ***)buf;
          v27 = *(std::__shared_weak_count **)&buf[8];
          if (v8)
          {
            if (*(void *)buf)
            {
              *(void *)&v639[0] = 0;
              memset(buf, 0, sizeof(buf));
              std::unordered_set<float>::unordered_set<std::__wrap_iter<float *>>((uint64_t *)buf, *v292, v292[1]);
              v462[0] = (double)*(unint64_t *)&buf[24];
              char v463 = 0;
              push(v6, (const PPScoreInterpreterValue *)v462);
              PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v462);
              std::__hash_table<PPSubscoreIdentifier,std::hash<PPSubscoreIdentifier>,std::equal_to<PPSubscoreIdentifier>,std::allocator<PPSubscoreIdentifier>>::~__hash_table((uint64_t)buf);
              goto LABEL_560;
            }
            goto LABEL_557;
          }
          if (*(void *)buf)
          {
            v441[0] = (double)(unint64_t)((uint64_t)(*(void *)(*(void *)buf + 8) - **(void **)buf) >> 2);
            char v442 = 0;
            push(v6, (const PPScoreInterpreterValue *)v441);
            v320 = (PPScoreInterpreterValue *)v441;
LABEL_559:
            PPScoreInterpreterValue::~PPScoreInterpreterValue(v320);
LABEL_560:
            if (v27) {
              std::__shared_weak_count::__release_shared[abi:ne180100](v27);
            }
            goto LABEL_562;
          }
LABEL_558:
          v443[0] = 0;
          char v444 = 0;
          push(v6, (const PPScoreInterpreterValue *)v443);
          v320 = (PPScoreInterpreterValue *)v443;
          goto LABEL_559;
        }
        if (v643 == 2)
        {
          uint64_t v26 = PPScoreInterpreterValue::getObject((PPScoreInterpreterValue *)&v642);
          v27 = (std::__shared_weak_count *)v26;
          if (v8)
          {
            if (v26)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v28 = v27;
                v474[0] = (double)(unint64_t)[(std::__shared_weak_count *)v28 count];
                char v475 = 0;
                push(v6, (const PPScoreInterpreterValue *)v474);
                PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v474);
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v356 = v27;
                  v472[0] = (double)(unint64_t)[(std::__shared_weak_count *)v356 uniqueValueCount];
                  char v473 = 0;
                  push(v6, (const PPScoreInterpreterValue *)v472);
                  PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v472);
                }
                else
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    v363 = v27;
                    v364 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v363];
                    v470[0] = (double)(unint64_t)[v364 count];
                    char v471 = 0;
                    push(v6, (const PPScoreInterpreterValue *)v470);
                    PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v470);
                  }
                  else
                  {
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      v367 = v27;
                      v368 = objc_opt_new();
                      for (unint64_t i = 0; i < [(std::__shared_weak_count *)v367 length]; ++i)
                      {
                        v370 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", -[std::__shared_weak_count characterAtIndex:](v367, "characterAtIndex:", i));
                        [v368 addObject:v370];
                      }
                      v468[0] = (double)(unint64_t)[v368 count];
                      char v469 = 0;
                      push(v6, (const PPScoreInterpreterValue *)v468);
                      PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v468);
                    }
                    else
                    {
                      v378 = pp_score_interpreter_log_handle();
                      if (os_log_type_enabled(v378, OS_LOG_TYPE_ERROR))
                      {
                        v381 = (objc_class *)objc_opt_class();
                        v382 = NSStringFromClass(v381);
                        *(_DWORD *)buf = 138412290;
                        *(void *)&uint8_t buf[4] = v382;
                        _os_log_error_impl(&dword_1CA9A8000, v378, OS_LOG_TYPE_ERROR, "Unhandled object type of %@ encountered in PPOperator<Distinct/Total>ItemCount", buf, 0xCu);
                      }
                      v466[0] = 0xC0DE9A4000000000;
                      char v467 = 0;
                      push(v6, (const PPScoreInterpreterValue *)v466);
                      PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v466);
                    }
                  }
                }
              }
LABEL_562:
              uint64_t v9 = (double *)&v642;
              goto LABEL_563;
            }
LABEL_557:
            v464[0] = 0;
            char v465 = 0;
            push(v6, (const PPScoreInterpreterValue *)v464);
            v320 = (PPScoreInterpreterValue *)v464;
            goto LABEL_559;
          }
          if (v26)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v321 = v27;
              [(std::__shared_weak_count *)v321 objectEnumerator];
              long long v460 = 0u;
              long long v461 = 0u;
              long long v458 = 0u;
              long long v459 = 0u;
              id v322 = (id)objc_claimAutoreleasedReturnValue();
              uint64_t v323 = [v322 countByEnumeratingWithState:&v458 objects:v640 count:16];
              if (v323)
              {
                unint64_t v324 = 0;
                uint64_t v325 = *(void *)v459;
                do
                {
                  for (uint64_t j = 0; j != v323; ++j)
                  {
                    if (*(void *)v459 != v325) {
                      objc_enumerationMutation(v322);
                    }
                    v324 += [(std::__shared_weak_count *)v321 countForObject:*(void *)(*((void *)&v458 + 1) + 8 * j)];
                  }
                  uint64_t v323 = [v322 countByEnumeratingWithState:&v458 objects:v640 count:16];
                }
                while (v323);
                double v327 = (double)v324;
              }
              else
              {
                double v327 = 0.0;
              }

              *(double *)v456 = v327;
              char v457 = 0;
              push(v6, (const PPScoreInterpreterValue *)v456);
              PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v456);
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v357 = v27;
                v454[0] = (double)(unint64_t)[(std::__shared_weak_count *)v357 count];
                char v455 = 0;
                push(v6, (const PPScoreInterpreterValue *)v454);
                PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v454);
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v365 = v27;
                  *(void *)buf = 0;
                  *(void *)&buf[8] = buf;
                  *(_OWORD *)&buf[16] = 0x2020000000uLL;
                  v453[0] = MEMORY[0x1E4F143A8];
                  v453[1] = 3221225472;
                  v453[2] = __49__PPScoreInterpreter__runOperator_arity_context___block_invoke;
                  v453[3] = &unk_1E65D4DE8;
                  v453[4] = buf;
                  [(std::__shared_weak_count *)v365 enumerateValuesAndCountsUsingBlock:v453];
                  v451[0] = (double)*(unint64_t *)(*(void *)&buf[8] + 24);
                  char v452 = 0;
                  push(v6, (const PPScoreInterpreterValue *)v451);
                  PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v451);
                  _Block_object_dispose(buf, 8);
                }
                else
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    v371 = v27;
                    v449[0] = (double)(unint64_t)[(std::__shared_weak_count *)v371 count];
                    char v450 = 0;
                    push(v6, (const PPScoreInterpreterValue *)v449);
                    PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v449);
                  }
                  else
                  {
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      v379 = v27;
                      v447[0] = (double)(unint64_t)[(std::__shared_weak_count *)v379 length];
                      char v448 = 0;
                      push(v6, (const PPScoreInterpreterValue *)v447);
                      PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v447);
                    }
                    else
                    {
                      v380 = pp_score_interpreter_log_handle();
                      if (os_log_type_enabled(v380, OS_LOG_TYPE_ERROR))
                      {
                        v409 = (objc_class *)objc_opt_class();
                        v410 = NSStringFromClass(v409);
                        *(_DWORD *)buf = 138412290;
                        *(void *)&uint8_t buf[4] = v410;
                        _os_log_error_impl(&dword_1CA9A8000, v380, OS_LOG_TYPE_ERROR, "Unhandled object type of %@ encountered in PPOperator<Distinct/Total>ItemCount", buf, 0xCu);
                      }
                      v445[0] = 0xC0DE9A4000000000;
                      char v446 = 0;
                      push(v6, (const PPScoreInterpreterValue *)v445);
                      PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v445);
                    }
                  }
                }
              }
            }
            goto LABEL_562;
          }
          goto LABEL_558;
        }
        v294 = pp_score_interpreter_log_handle();
        if (os_log_type_enabled(v294, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v643;
          _os_log_error_impl(&dword_1CA9A8000, v294, OS_LOG_TYPE_ERROR, "Attempted to store invalid value of type %d in 2nd argument to PPOperator<Distinct/Total>ItemCount", buf, 8u);
        }

        v476[0] = 0xC0DE9A4000000000;
        char v477 = 0;
        push(v6, (const PPScoreInterpreterValue *)v476);
        v293 = (PPScoreInterpreterValue *)v476;
      }
      else
      {
        v478[0] = 0x3FF0000000000000;
        char v479 = 0;
        push(v6, (const PPScoreInterpreterValue *)v478);
        v293 = (PPScoreInterpreterValue *)v478;
      }
      PPScoreInterpreterValue::~PPScoreInterpreterValue(v293);
      goto LABEL_562;
    case 35:
      if (shouldReturnUndefined(v5, 2uLL))
      {
        drop(v6, a2);
        v429[0] = 0xC0DE9A4000000000;
        char v430 = 0;
        push(v6, (const PPScoreInterpreterValue *)v429);
        uint64_t v9 = (double *)v429;
        goto LABEL_563;
      }
      uint64_t v201 = *(void *)v6->_stack.__ptr_.__value_;
      unint64_t v202 = 0xAAAAAAAAAAAAAAABLL * ((*((void *)v6->_stack.__ptr_.__value_ + 1) - v201) >> 3);
      unint64_t v203 = v202 - a2;
      if (v202 <= v202 - a2) {
        std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
      }
      v204 = PPScoreInterpreterValue::getObject((PPScoreInterpreterValue *)(v201 + 24 * v203));
      unint64_t v205 = v203 + 1;
      memset(buf, 0, 24);
      uint64_t v206 = *(void *)v6->_stack.__ptr_.__value_;
      if (0xAAAAAAAAAAAAAAABLL * ((*((void *)v6->_stack.__ptr_.__value_ + 1) - v206) >> 3) <= v203 + 1) {
        std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
      }
      unint64_t v207 = v203 + 2;
      PPScoreInterpreterValue::PPScoreInterpreterValue((PPScoreInterpreterValue *)buf, (const PPScoreInterpreterValue *)(v206 + 24 * v205));
      uint64_t v643 = 0;
      long long v642 = 0uLL;
      uint64_t v208 = *(void *)v6->_stack.__ptr_.__value_;
      if (0xAAAAAAAAAAAAAAABLL * ((*((void *)v6->_stack.__ptr_.__value_ + 1) - v208) >> 3) <= v207) {
        std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
      }
      PPScoreInterpreterValue::PPScoreInterpreterValue((PPScoreInterpreterValue *)&v642, (const PPScoreInterpreterValue *)(v208 + 24 * v207));
      drop(v6, a2);
      if (!v204) {
        goto LABEL_477;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v209 = v204;
      }
      else
      {
        v316 = pp_score_interpreter_log_handle();
        if (os_log_type_enabled(v316, OS_LOG_TYPE_ERROR))
        {
          v376 = (objc_class *)objc_opt_class();
          v377 = NSStringFromClass(v376);
          LODWORD(v641) = 138412290;
          *(void *)((char *)&v641 + 4) = v377;
          _os_log_error_impl(&dword_1CA9A8000, v316, OS_LOG_TYPE_ERROR, "PPOperatorAddToDictionary was passed an existingDictObj of the wrong type: %@", (uint8_t *)&v641, 0xCu);
        }
LABEL_477:
        id v209 = (id)objc_opt_new();
      }
      v317 = v209;
      if (v643 == 2)
      {
        uint64_t v318 = PPScoreInterpreterValue::getObject((PPScoreInterpreterValue *)&v642);
      }
      else if (v643 == 1)
      {
        uint64_t v318 = PPScoreInterpreterValue::getNumericArray((PPScoreInterpreterValue *)&v642);
      }
      else if ((_BYTE)v643)
      {
        v334 = pp_score_interpreter_log_handle();
        if (os_log_type_enabled(v334, OS_LOG_TYPE_ERROR))
        {
          LODWORD(v641) = 67109120;
          DWORD1(v641) = v643;
          _os_log_error_impl(&dword_1CA9A8000, v334, OS_LOG_TYPE_ERROR, "Attempted to store invalid value of type %d in PPOperatorAddToDictionary", (uint8_t *)&v641, 8u);
        }

        v335 = pp_score_interpreter_log_handle();
        if (os_log_type_enabled(v335, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v641) = 0;
          _os_log_error_impl(&dword_1CA9A8000, v335, OS_LOG_TYPE_ERROR, "Attempted to store nil object value in PPOperatorAddToDictionary", (uint8_t *)&v641, 2u);
        }

        uint64_t v318 = objc_opt_new();
      }
      else
      {
        uint64_t v318 = [NSNumber numberWithDouble:PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)&v642)];
      }
      v336 = (void *)v318;
      if (buf[16] != 2)
      {
        if (!buf[16])
        {
          uint64_t v337 = [NSNumber numberWithDouble:PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)buf)];
          goto LABEL_530;
        }
        v339 = pp_score_interpreter_log_handle();
        if (!os_log_type_enabled(v339, OS_LOG_TYPE_ERROR)) {
          goto LABEL_529;
        }
        LODWORD(v641) = 67109120;
        DWORD1(v641) = buf[16];
        v360 = "Attempted to store invalid key of type %d in PPOperatorAddToDictionary";
        v361 = v339;
        uint32_t v362 = 8;
LABEL_620:
        _os_log_error_impl(&dword_1CA9A8000, v361, OS_LOG_TYPE_ERROR, v360, (uint8_t *)&v641, v362);
        goto LABEL_529;
      }
      v338 = PPScoreInterpreterValue::getObject((PPScoreInterpreterValue *)buf);
      if (v338) {
        goto LABEL_531;
      }
      if ([(id)objc_opt_class() conformsToProtocol:&unk_1F256D438])
      {
        v338 = 0;
        goto LABEL_531;
      }
      v339 = pp_score_interpreter_log_handle();
      if (os_log_type_enabled(v339, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v641) = 0;
        v360 = "Attempted to store nil object key in PPOperatorAddToDictionary";
        v361 = v339;
        uint32_t v362 = 2;
        goto LABEL_620;
      }
LABEL_529:

      uint64_t v337 = objc_opt_new();
LABEL_530:
      v338 = (void *)v337;
LABEL_531:
      [v317 setObject:v336 forKeyedSubscript:v338];
      PPScoreInterpreterValue::PPScoreInterpreterValue((PPScoreInterpreterValue *)v428, (const PPScoreInterpreterValue *)&v642);
      push(v6, (const PPScoreInterpreterValue *)v428);
      PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v428);

      PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)&v642);
      PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)buf);

LABEL_564:
      return;
    case 36:
      goto LABEL_22;
    case 37:
      int v7 = 1;
      goto LABEL_22;
    case 38:
      int v7 = 2;
LABEL_22:
      if (shouldReturnUndefined(v5, 2uLL))
      {
        drop(v6, a2);
        v439[0] = 0xC0DE9A4000000000;
        char v440 = 0;
        push(v6, (const PPScoreInterpreterValue *)v439);
        uint64_t v9 = (double *)v439;
        goto LABEL_563;
      }
      uint64_t v10 = *(void *)v6->_stack.__ptr_.__value_;
      unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * ((*((void *)v6->_stack.__ptr_.__value_ + 1) - v10) >> 3);
      unint64_t v12 = v11 - a2;
      if (v11 <= v11 - a2) {
        std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
      }
      v13 = PPScoreInterpreterValue::getObject((PPScoreInterpreterValue *)(v10 + 24 * v12));
      memset(buf, 0, 24);
      uint64_t v14 = *(void *)v6->_stack.__ptr_.__value_;
      if (0xAAAAAAAAAAAAAAABLL * ((*((void *)v6->_stack.__ptr_.__value_ + 1) - v14) >> 3) <= v12 + 1) {
        std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
      }
      PPScoreInterpreterValue::PPScoreInterpreterValue((PPScoreInterpreterValue *)buf, (const PPScoreInterpreterValue *)(v14 + 24 * (v12 + 1)));
      drop(v6, a2);
      if (buf[16])
      {
        if (buf[16] != 2)
        {
          v290 = pp_score_interpreter_log_handle();
          if (os_log_type_enabled(v290, OS_LOG_TYPE_ERROR))
          {
            LODWORD(v642) = 67109120;
            DWORD1(v642) = buf[16];
            _os_log_error_impl(&dword_1CA9A8000, v290, OS_LOG_TYPE_ERROR, "Attempted to store invalid value of type %d in 2nd argument to PPOperator<Type>ForKey", (uint8_t *)&v642, 8u);
          }
          v16 = 0;
          goto LABEL_485;
        }
        PPScoreInterpreterValue::getObject((PPScoreInterpreterValue *)buf);
        v16 = double v15 = -31337.0;
      }
      else
      {
        double v15 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)buf);
        v16 = 0;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v290 = v13;
        if (v15 != -31337.0)
        {
          v297 = [NSNumber numberWithDouble:v15];
          v291 = [v290 objectForKeyedSubscript:v297];

          goto LABEL_419;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v291 = [v290 objectForKeyedSubscript:v16];
LABEL_419:

          if (v7 != 1)
          {
            if (!v7)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [v291 doubleValue];
                v437[0] = v298;
                char v438 = 0;
                push(v6, (const PPScoreInterpreterValue *)v437);
                PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v437);

                goto LABEL_572;
              }
              v345 = pp_score_interpreter_log_handle();
              if (os_log_type_enabled(v345, OS_LOG_TYPE_ERROR))
              {
                LODWORD(v642) = 138412290;
                *(void *)((char *)&v642 + 4) = v290;
                _os_log_error_impl(&dword_1CA9A8000, v345, OS_LOG_TYPE_ERROR, "Invalid dictionary object (expected NSNumber) passed to PPOperator<Type>ForKey: %@", (uint8_t *)&v642, 0xCu);
              }

              goto LABEL_487;
            }
            v340 = pp_score_interpreter_log_handle();
            if (os_log_type_enabled(v340, OS_LOG_TYPE_ERROR))
            {
              LODWORD(v642) = 67109120;
              DWORD1(v642) = v7;
              _os_log_error_impl(&dword_1CA9A8000, v340, OS_LOG_TYPE_ERROR, "Invalid type of %d requested from PPOperator<Type>ForKey", (uint8_t *)&v642, 8u);
            }

            goto LABEL_543;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            PPScoreInterpreterValue::PPScoreInterpreterValue((uint64_t)v436, v291);
            push(v6, (const PPScoreInterpreterValue *)v436);
            PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v436);

LABEL_572:
            PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)buf);

            goto LABEL_564;
          }
          v346 = pp_score_interpreter_log_handle();
          if (os_log_type_enabled(v346, OS_LOG_TYPE_ERROR))
          {
            LODWORD(v642) = 138412290;
            *(void *)((char *)&v642 + 4) = v290;
            _os_log_error_impl(&dword_1CA9A8000, v346, OS_LOG_TYPE_ERROR, "Invalid dictionary object (expected NSArray) passed to PPOperator<Type>ForKey: %@", (uint8_t *)&v642, 0xCu);
          }

          goto LABEL_571;
        }
        v319 = pp_score_interpreter_log_handle();
        if (os_log_type_enabled(v319, OS_LOG_TYPE_ERROR))
        {
          LODWORD(v642) = 138412290;
          *(void *)((char *)&v642 + 4) = v16;
          _os_log_error_impl(&dword_1CA9A8000, v319, OS_LOG_TYPE_ERROR, "Invalid key passed to PPOperator<Type>ForKey: %@", (uint8_t *)&v642, 0xCu);
        }
      }
      else
      {
        v290 = pp_score_interpreter_log_handle();
        if (os_log_type_enabled(v290, OS_LOG_TYPE_ERROR))
        {
          LODWORD(v642) = 138412290;
          *(void *)((char *)&v642 + 4) = v13;
          _os_log_error_impl(&dword_1CA9A8000, v290, OS_LOG_TYPE_ERROR, "Invalid dictionary object passed to PPOperator<Type>ForKey: %@", (uint8_t *)&v642, 0xCu);
        }
      }
LABEL_485:

      v291 = 0;
      if (v7 == 2)
      {
LABEL_543:
        char v432 = 2;
        v431[0] = 0;
        push(v6, (const PPScoreInterpreterValue *)v431);
        PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v431);

        goto LABEL_572;
      }
      if (v7 != 1)
      {
LABEL_487:
        v434[0] = 0xC0DE9A4000000000;
        char v435 = 0;
        push(v6, (const PPScoreInterpreterValue *)v434);
        PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v434);

        goto LABEL_572;
      }
LABEL_571:
      PPScoreInterpreterValue::PPScoreInterpreterValue((uint64_t)v433, MEMORY[0x1E4F1CBF0]);
      push(v6, (const PPScoreInterpreterValue *)v433);
      PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v433);

      goto LABEL_572;
    case 39:
      if (shouldReturnUndefined(v5, 3uLL))
      {
        drop(v6, a2);
        v426[0] = 0xC0DE9A4000000000;
        char v427 = 0;
        push(v6, (const PPScoreInterpreterValue *)v426);
        uint64_t v9 = (double *)v426;
      }
      else
      {
        uint64_t v45 = *(void *)v6->_stack.__ptr_.__value_;
        unint64_t v46 = 0xAAAAAAAAAAAAAAABLL * ((*((void *)v6->_stack.__ptr_.__value_ + 1) - v45) >> 3);
        unint64_t v47 = v46 - a2;
        if (v46 <= v46 - a2) {
          std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
        }
        double v48 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v45 + 24 * v47));
        uint64_t v49 = *(void *)v6->_stack.__ptr_.__value_;
        if (0xAAAAAAAAAAAAAAABLL * ((*((void *)v6->_stack.__ptr_.__value_ + 1) - v49) >> 3) <= v47 + 1) {
          std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
        }
        double v50 = v48;
        double v51 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v49 + 24 * (v47 + 1)));
        uint64_t v52 = *(void *)v6->_stack.__ptr_.__value_;
        if (0xAAAAAAAAAAAAAAABLL * ((*((void *)v6->_stack.__ptr_.__value_ + 1) - v52) >> 3) <= v47 + 2) {
          std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
        }
        double v53 = v51;
        double v54 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v52 + 24 * (v47 + 2)));
        drop(v6, a2);
        v424[0] = v50 * exp(-fabs(v53 * v54));
        char v425 = 0;
        push(v6, (const PPScoreInterpreterValue *)v424);
        uint64_t v9 = v424;
      }
      goto LABEL_563;
    case 40:
      if (shouldReturnUndefined(v5, 1uLL))
      {
        drop(v6, a2);
        v422[0] = 0xC0DE9A4000000000;
        char v423 = 0;
        push(v6, (const PPScoreInterpreterValue *)v422);
        uint64_t v9 = (double *)v422;
        goto LABEL_563;
      }
      uint64_t v55 = *(void *)v6->_stack.__ptr_.__value_;
      unint64_t v56 = 0xAAAAAAAAAAAAAAABLL * ((*((void *)v6->_stack.__ptr_.__value_ + 1) - v55) >> 3);
      if (v56 <= v56 - a2) {
        std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
      }
      v57 = PPScoreInterpreterValue::getObject((PPScoreInterpreterValue *)(v55 + 24 * (v56 - a2)));
      drop(v6, a2);
      id v58 = v57;
      [v58 timeIntervalSince1970];
      v420[0] = v59;
      char v421 = 0;
      push(v6, (const PPScoreInterpreterValue *)v420);
      PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v420);

      goto LABEL_564;
    case 41:
      if (shouldReturnUndefined(v5, 1uLL))
      {
        drop(v6, a2);
        v418[0] = 0xC0DE9A4000000000;
        char v419 = 0;
        push(v6, (const PPScoreInterpreterValue *)v418);
        uint64_t v9 = (double *)v418;
        goto LABEL_563;
      }
      uint64_t v80 = *(void *)v6->_stack.__ptr_.__value_;
      unint64_t v81 = 0xAAAAAAAAAAAAAAABLL * ((*((void *)v6->_stack.__ptr_.__value_ + 1) - v80) >> 3);
      if (v81 <= v81 - a2) {
        std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
      }
      v82 = PPScoreInterpreterValue::getObject((PPScoreInterpreterValue *)(v80 + 24 * (v81 - a2)));
      drop(v6, a2);
      id v83 = v82;
      memset(v639, 0, 24);
      memset(buf, 0, sizeof(buf));
      double v84 = -1.0;
      if (v83 && ([MEMORY[0x1E4F89FC8] localizedTimeStructForDate:v83 tm:buf] & 1) != 0) {
        double v84 = (double)(*(_DWORD *)&buf[24] + 1);
      }
      *(double *)v416 = v84;
      char v417 = 0;
      push(v6, (const PPScoreInterpreterValue *)v416);
      PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v416);

      goto LABEL_564;
    case 42:
      if (shouldReturnUndefined(v5, 2uLL))
      {
        drop(v6, a2);
        v414[0] = 0xC0DE9A4000000000;
        char v415 = 0;
        push(v6, (const PPScoreInterpreterValue *)v414);
        uint64_t v9 = (double *)v414;
        goto LABEL_563;
      }
      uint64_t v29 = *(void *)v6->_stack.__ptr_.__value_;
      unint64_t v30 = 0xAAAAAAAAAAAAAAABLL * ((*((void *)v6->_stack.__ptr_.__value_ + 1) - v29) >> 3);
      unint64_t v31 = v30 - a2;
      if (v30 <= v30 - a2) {
        std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
      }
      BOOL v32 = PPScoreInterpreterValue::getObject((PPScoreInterpreterValue *)(v29 + 24 * v31));
      uint64_t v33 = *(void *)v6->_stack.__ptr_.__value_;
      if (0xAAAAAAAAAAAAAAABLL * ((*((void *)v6->_stack.__ptr_.__value_ + 1) - v33) >> 3) <= v31 + 1) {
        std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
      }
      double v34 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v33 + 24 * (v31 + 1)));
      drop(v6, a2);
      id v35 = v32;
      memset(v639, 0, 24);
      memset(buf, 0, sizeof(buf));
      double v36 = -1.0;
      if (v35 && ([MEMORY[0x1E4F89FC8] localizedTimeStructForDate:v35 tm:buf] & 1) != 0) {
        double v36 = (double)((3600 * *(_DWORD *)&buf[8] + 60 * *(_DWORD *)&buf[4] + *(_DWORD *)buf) / (86400 / (int)v34));
      }
      *(double *)v412 = v36;
      char v413 = 0;
      push(v6, (const PPScoreInterpreterValue *)v412);
      PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v412);

      goto LABEL_564;
    default:
      v411 = pp_score_interpreter_log_handle();
      if (os_log_type_enabled(v411, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = a1;
        _os_log_error_impl(&dword_1CA9A8000, v411, OS_LOG_TYPE_ERROR, "Undefined operator of value %tu", buf, 0xCu);
      }

      __break(1u);
      goto LABEL_648;
  }
}

uint64_t __49__PPScoreInterpreter__runOperator_arity_context___block_invoke(uint64_t result, uint64_t a2, unsigned int a3)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += a3;
  return result;
}

- (void)cleanupReusableComponents
{
}

void __47__PPScoreInterpreter_cleanupReusableComponents__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a2 + 8);
  *(void *)(a2 + 8) = 0;
}

- (void)evaluateWithPreviousStageSubscores:(id)a3 scoreInputInitializationBlock:(id)a4 scoreInputAssignmentBlock:(id)a5 outputBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = (void *)MEMORY[0x1CB79D060]();
  reusableContext = self->_reusableContext;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __125__PPScoreInterpreter_evaluateWithPreviousStageSubscores_scoreInputInitializationBlock_scoreInputAssignmentBlock_outputBlock___block_invoke;
  v20[3] = &unk_1E65D4DA0;
  v20[4] = self;
  id v16 = v11;
  id v22 = v16;
  id v17 = v10;
  id v21 = v17;
  id v18 = v12;
  id v23 = v18;
  id v19 = v13;
  id v24 = v19;
  [(_PASLock *)reusableContext runWithLockAcquired:v20];
}

void __125__PPScoreInterpreter_evaluateWithPreviousStageSubscores_scoreInputInitializationBlock_scoreInputAssignmentBlock_outputBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  long long v4 = (id *)v3[1];
  if (v4)
  {
    id v5 = v4[4];
    id v6 = v4[3];
    v4[3] = v5;
  }
  else
  {
    id v6 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 16);
    int v7 = [v6 objectAtIndexedSubscript:0];
    uint64_t v8 = [v7 count];

    uint64_t v9 = [v6 objectAtIndexedSubscript:1];
    uint64_t v10 = [v9 count];

    id v11 = [v6 objectAtIndexedSubscript:2];
    uint64_t v12 = [v11 count];

    id v13 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    uint64_t v14 = -[PPScoreInterpreterCtx initWithScoreInputs:previousSubscores:scalarSubscoreCount:arraySubscoreCount:objectSubscoreCount:]((id *)[PPScoreInterpreterCtx alloc], v13, *(void **)(a1 + 40), v8, v10, v12);
    double v15 = v3[1];
    v3[1] = v14;
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  -[PPScoreInterpreter evaluateScoresWithContext:](*(void *)(a1 + 32), v3[1]);
  if (*(void *)(*((void *)v3[1] + 1) + 8) != **((void **)v3[1] + 1))
  {
    id v16 = pp_default_log_handle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      unint64_t v18 = 0xAAAAAAAAAAAAAAABLL
          * ((uint64_t)(*(void *)(*((void *)v3[1] + 1) + 8) - **((void **)v3[1] + 1)) >> 3);
      int v19 = 134217984;
      unint64_t v20 = v18;
      _os_log_fault_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_FAULT, "%lu items left on score interpreter stack", (uint8_t *)&v19, 0xCu);
    }
  }
  uint64_t v17 = *(void *)(a1 + 64);
  if (v17) {
    (*(void (**)(uint64_t, void))(v17 + 16))(v17, *((void *)v3[1] + 4));
  }
}

- (PPScoreInterpreter)initWithBytecode:(id)a3 scoreInputSet:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PPScoreInterpreter;
  uint64_t v9 = [(PPScoreInterpreter *)&v16 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bytecode, a3);
    objc_storeStrong((id *)&v10->_scoreInputSet, a4);
    id v11 = objc_alloc(MEMORY[0x1E4F93B70]);
    uint64_t v12 = objc_opt_new();
    uint64_t v13 = [v11 initWithGuardedData:v12];
    reusableContext = v10->_reusableContext;
    v10->_reusableContext = (_PASLock *)v13;
  }
  return v10;
}

- (PPScoreInterpreter)initWithBytecode:(id)a3
{
  return [(PPScoreInterpreter *)self initWithBytecode:a3 scoreInputSet:0];
}

- (PPScoreInterpreter)initWithParseRoot:(id)a3 scalarSubscoreCount:(unint64_t)a4 arraySubscoreCount:(unint64_t)a5 objectSubscoreCount:(unint64_t)a6
{
  id v10 = a3;
  id v11 = v10;
  if (self)
  {
    if (!v10)
    {
      uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:sel_initWithParseRoot_scalarSubscoreCount_arraySubscoreCount_objectSubscoreCount_scoreInputSet_, self, @"PPScoreInterpreter.mm", 828, @"Invalid parameter not satisfying: %@", @"root" object file lineNumber description];
    }
    uint64_t v12 = [[PPScoreInterpreterBytecode alloc] initWithParseRoot:v11 scalarSubscoreCount:a4 arraySubscoreCount:a5 objectSubscoreCount:a6];
    self = [(PPScoreInterpreter *)self initWithBytecode:v12 scoreInputSet:0];
  }
  return self;
}

+ (id)scoreInterpreterFromFactorName:(id)a3 namespaceName:(id)a4
{
  id v5 = +[PPScoreInterpreterBytecode bytecodeFromFactorName:a3 namespaceName:a4];
  if (v5) {
    id v6 = (void *)[objc_alloc((Class)a1) initWithBytecode:v5];
  }
  else {
    id v6 = 0;
  }

  return v6;
}

+ (id)scoreInterpreterFromAsset:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  id v6 = +[PPScoreInterpreterBytecode bytecodeFromAsset:v4];
  id v7 = (void *)[v5 initWithBytecode:v6];

  return v7;
}

@end