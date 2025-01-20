@interface WFDebouncer
- (BOOL)isPendingFire;
- (BOOL)unboundedFiringReasons;
- (NSArray)firingReasons;
- (WFDebouncer)initWithDelay:(double)a3 maximumDelay:(double)a4 queue:(id)a5;
- (WFDebouncer)initWithDelay:(double)a3 maximumDelay:(double)a4 queue:(id)a5 userInfo:(id)a6 unboundedFiringReasons:(BOOL)a7;
- (WFDebouncer)initWithDelay:(double)a3 queue:(id)a4;
- (double)delay;
- (double)maximumDelay;
- (id)userInfo;
- (void)addTarget:(id)a3 action:(SEL)a4;
- (void)dealloc;
- (void)fire;
- (void)poke;
- (void)pokeWithReason:(id)a3 userInfo:(id)a4;
- (void)removeTarget:(id)a3 action:(SEL)a4;
- (void)resetDelayTimer;
- (void)setPendingFire:(uint64_t)a1;
@end

@implementation WFDebouncer

- (WFDebouncer)initWithDelay:(double)a3 maximumDelay:(double)a4 queue:(id)a5 userInfo:(id)a6 unboundedFiringReasons:(BOOL)a7
{
  id v12 = a5;
  id v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)WFDebouncer;
  v14 = [(WFDebouncer *)&v26 init];
  v15 = v14;
  v16 = v14;
  if (v14)
  {
    v14->_delay = a3;
    v14->_maximumDelay = a4;
    if (v12)
    {
      v17 = (OS_dispatch_queue *)v12;
      queue = v16->_queue;
      v16->_queue = v17;
    }
    else
    {
      queue = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v19 = dispatch_queue_attr_make_with_qos_class(queue, QOS_CLASS_UTILITY, 0);
      dispatch_queue_t v20 = dispatch_queue_create("com.apple.shortcuts.WFDebouncer", v19);
      v21 = v16->_queue;
      v16->_queue = (OS_dispatch_queue *)v20;
    }
    uint64_t v22 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    targetTable = v16->_targetTable;
    v16->_targetTable = (NSMapTable *)v22;

    objc_storeStrong(&v15->_userInfo, a6);
    v16->_unboundedFiringReasons = a7;
    v24 = v16;
  }

  return v16;
}

- (WFDebouncer)initWithDelay:(double)a3 maximumDelay:(double)a4 queue:(id)a5
{
  return [(WFDebouncer *)self initWithDelay:a5 maximumDelay:0 queue:0 userInfo:a3 unboundedFiringReasons:a4];
}

- (void)addTarget:(id)a3 action:(SEL)a4
{
  id v7 = a3;
  if (v7)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_7:
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFDebouncer.mm", 191, @"Invalid parameter not satisfying: %@", @"action" object file lineNumber description];

    if (self) {
      goto LABEL_4;
    }
LABEL_8:
    queue = 0;
    goto LABEL_5;
  }
  v10 = [MEMORY[0x1E4F28B00] currentHandler];
  [v10 handleFailureInMethod:a2, self, @"WFDebouncer.mm", 190, @"Invalid parameter not satisfying: %@", @"target" object file lineNumber description];

  if (!a4) {
    goto LABEL_7;
  }
LABEL_3:
  if (!self) {
    goto LABEL_8;
  }
LABEL_4:
  queue = self->_queue;
LABEL_5:
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__WFDebouncer_addTarget_action___block_invoke;
  block[3] = &unk_1E6555668;
  block[4] = self;
  id v13 = v7;
  SEL v14 = a4;
  id v9 = v7;
  dispatch_async(queue, block);
}

void __19__WFDebouncer_poke__block_invoke(uint64_t a1)
{
  -[WFDebouncer setPendingFire:](*(void *)(a1 + 32), 1);
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    -[WFDebouncer resetDelayTimer](*(void *)(a1 + 32));
    objc_initWeak(&location, (id)v2);
    v3 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *(dispatch_queue_t *)(v2 + 56));
    [(id)v2 delay];
    dispatch_time_t v5 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
    dispatch_source_set_timer(v3, v5, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __32__WFDebouncer_restartDelayTimer__block_invoke;
    v19 = &unk_1E6555640;
    objc_copyWeak(&v20, &location);
    dispatch_source_set_event_handler(v3, &v16);
    v6 = *(void **)(v2 + 80);
    *(void *)(v2 + 80) = v3;
    id v7 = v3;

    dispatch_resume(v7);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
    uint64_t v8 = *(void *)(a1 + 32);
    if (v8)
    {
      id v9 = *(id *)(v8 + 88);
      if (v9)
      {
      }
      else
      {
        objc_msgSend((id)v8, "maximumDelay", v16, v17, v18, v19);
        if (v10 != 0.0)
        {
          objc_initWeak(&location, (id)v8);
          v11 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *(dispatch_queue_t *)(v8 + 56));
          [(id)v8 maximumDelay];
          dispatch_time_t v13 = dispatch_time(0, (uint64_t)(v12 * 1000000000.0));
          dispatch_source_set_timer(v11, v13, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
          uint64_t v16 = MEMORY[0x1E4F143A8];
          uint64_t v17 = 3221225472;
          v18 = __48__WFDebouncer_startMaximumDelayTimerIfNecessary__block_invoke;
          v19 = &unk_1E6555640;
          objc_copyWeak(&v20, &location);
          dispatch_source_set_event_handler(v11, &v16);
          SEL v14 = *(void **)(v8 + 88);
          *(void *)(v8 + 88) = v11;
          v15 = v11;

          dispatch_activate(v15);
          objc_destroyWeak(&v20);
          objc_destroyWeak(&location);
        }
      }
    }
  }
}

- (double)maximumDelay
{
  return self->_maximumDelay;
}

- (void)setPendingFire:(uint64_t)a1
{
  if (!a1) {
    return;
  }
  char v2 = a2;
  if (*(unsigned __int8 *)(a1 + 9) != a2)
  {
    dispatch_time_t v5 = *(void **)(a1 + 64);
    if (a2)
    {
      if (!v5)
      {
        uint64_t v6 = os_transaction_create();
        dispatch_time_t v5 = *(void **)(a1 + 64);
LABEL_12:
        *(void *)(a1 + 64) = v6;
      }
    }
    else if (v5)
    {
      uint64_t v6 = 0;
      goto LABEL_12;
    }
    *(unsigned char *)(a1 + 9) = v2;
    return;
  }
  if (a2)
  {
    uint64_t v4 = *(void *)(a1 + 64);
    MEMORY[0x1F40CD5B0](v4);
  }
}

- (void)resetDelayTimer
{
  if (a1)
  {
    char v2 = *(NSObject **)(a1 + 80);
    if (v2)
    {
      dispatch_source_cancel(v2);
      char v2 = *(NSObject **)(a1 + 80);
    }
    *(void *)(a1 + 80) = 0;
  }
}

- (double)delay
{
  return self->_delay;
}

- (void)poke
{
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __19__WFDebouncer_poke__block_invoke;
  block[3] = &unk_1E6558B28;
  block[4] = self;
  dispatch_async(queue, block);
}

void __32__WFDebouncer_addTarget_action___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    v3 = *(void **)(v2 + 72);
  }
  else {
    v3 = 0;
  }
  uint64_t v4 = [v3 objectForKey:*(void *)(a1 + 40)];
  if (!v4)
  {
    uint64_t v5 = objc_opt_new();
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6) {
      id v7 = *(void **)(v6 + 72);
    }
    else {
      id v7 = 0;
    }
    [v7 setObject:v5 forKey:*(void *)(a1 + 40)];
    uint64_t v4 = v5;
  }
  id v9 = (id)v4;
  uint64_t v8 = NSStringFromSelector(*(SEL *)(a1 + 48));
  [v9 addObject:v8];
}

- (void)pokeWithReason:(id)a3 userInfo:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [WFDebouncerPokeReason alloc];
  id v10 = v7;
  id v11 = v8;
  if (v9)
  {
    v17.receiver = v9;
    v17.super_class = (Class)WFDebouncerPokeReason;
    id v12 = [(WFDebouncer *)&v17 init];
    id v9 = (WFDebouncerPokeReason *)v12;
    if (v12)
    {
      objc_storeStrong((id *)v12 + 1, a3);
      objc_storeStrong(&v9->_userInfo, a4);
    }
  }

  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __39__WFDebouncer_pokeWithReason_userInfo___block_invoke;
  v15[3] = &unk_1E6558938;
  v15[4] = self;
  uint64_t v16 = v9;
  SEL v14 = v9;
  dispatch_async(queue, v15);
}

uint64_t __39__WFDebouncer_pokeWithReason_userInfo___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (!v2[2]) {
    operator new();
  }
  if ([v2 unboundedFiringReasons]) {
    goto LABEL_7;
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    uint64_t v4 = *(void *)(v3 + 16);
    if (*(void *)(v4 + 40) != 10) {
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  uint64_t v4 = 0;
  uint64_t v6 = 0;
  if (MEMORY[0x28] == 10)
  {
LABEL_5:
    std::deque<WFDebouncerPokeReason * {__strong}>::pop_front(v4);
LABEL_7:
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      uint64_t v6 = *(void **)(v5 + 16);
    }
    else {
      uint64_t v6 = 0;
    }
  }
  id v7 = (char *)v6[1];
  id v8 = (char *)v6[2];
  uint64_t v9 = v8 - v7;
  if (v8 == v7) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = ((v8 - v7) << 6) - 1;
  }
  unint64_t v11 = v6[4];
  if (v10 == v6[5] + v11)
  {
    BOOL v12 = v11 >= 0x200;
    unint64_t v13 = v11 - 512;
    if (v12)
    {
      v6[4] = v13;
      uint64_t v16 = *(void *)v7;
      SEL v14 = v7 + 8;
      uint64_t v15 = v16;
      v6[1] = v14;
      if (v8 == (char *)v6[3])
      {
        uint64_t v17 = (uint64_t)&v14[-*v6];
        if ((unint64_t)v14 <= *v6)
        {
          if (v8 == (char *)*v6) {
            unint64_t v54 = 1;
          }
          else {
            unint64_t v54 = (uint64_t)&v8[-*v6] >> 2;
          }
          v55 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<WFDebouncerPokeReason * {__strong}*>>(v54);
          v57 = &v55[8 * (v54 >> 2)];
          v58 = (uint64_t *)v6[1];
          id v8 = v57;
          uint64_t v59 = v6[2] - (void)v58;
          if (v59)
          {
            id v8 = &v57[v59 & 0xFFFFFFFFFFFFFFF8];
            uint64_t v60 = 8 * (v59 >> 3);
            v61 = &v55[8 * (v54 >> 2)];
            do
            {
              uint64_t v62 = *v58++;
              *(void *)v61 = v62;
              v61 += 8;
              v60 -= 8;
            }
            while (v60);
          }
          v63 = (char *)*v6;
          void *v6 = v55;
          v6[1] = v57;
          v6[2] = v8;
          v6[3] = &v55[8 * v56];
          if (v63)
          {
            operator delete(v63);
            id v8 = (char *)v6[2];
          }
        }
        else
        {
          uint64_t v18 = v17 >> 3;
          BOOL v19 = v17 >> 3 < -1;
          uint64_t v20 = (v17 >> 3) + 2;
          if (v19) {
            uint64_t v21 = v20;
          }
          else {
            uint64_t v21 = v18 + 1;
          }
          uint64_t v22 = -(v21 >> 1);
          uint64_t v23 = v21 >> 1;
          v24 = &v14[-8 * v23];
          int64_t v25 = v8 - v14;
          if (v8 != v14)
          {
            memmove(&v14[-8 * v23], v14, v8 - v14);
            id v8 = (char *)v6[1];
          }
          objc_super v26 = &v8[8 * v22];
          id v8 = &v24[v25];
          v6[1] = v26;
          v6[2] = &v24[v25];
        }
      }
      *(void *)id v8 = v15;
      goto LABEL_123;
    }
    uint64_t v27 = v9 >> 3;
    v28 = (char *)v6[3];
    v29 = (char *)*v6;
    uint64_t v30 = (uint64_t)&v28[-*v6];
    if (v9 >> 3 < (unint64_t)(v30 >> 3))
    {
      v31 = operator new(0x1000uLL);
      if (v28 == v8)
      {
        v64 = (char *)v6[1];
        if (v64 == v29)
        {
          v65 = (char *)v6[2];
          v66 = (char *)v6[3];
          if (v65 >= v66)
          {
            if (v66 == v29) {
              unint64_t v103 = 1;
            }
            else {
              unint64_t v103 = (v66 - v29) >> 2;
            }
            uint64_t v104 = 2 * v103;
            v105 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<WFDebouncerPokeReason * {__strong}*>>(v103);
            v64 = &v105[(v104 + 6) & 0xFFFFFFFFFFFFFFF8];
            v107 = (uint64_t *)v6[1];
            v108 = v64;
            uint64_t v109 = v6[2] - (void)v107;
            if (v109)
            {
              v108 = &v64[v109 & 0xFFFFFFFFFFFFFFF8];
              uint64_t v110 = 8 * (v109 >> 3);
              v111 = v64;
              do
              {
                uint64_t v112 = *v107++;
                *(void *)v111 = v112;
                v111 += 8;
                v110 -= 8;
              }
              while (v110);
            }
            v113 = (char *)*v6;
            void *v6 = v105;
            v6[1] = v64;
            v6[2] = v108;
            v6[3] = &v105[8 * v106];
            if (v113)
            {
              operator delete(v113);
              v64 = (char *)v6[1];
            }
          }
          else
          {
            uint64_t v67 = (v66 - v65) >> 3;
            if (v67 >= -1) {
              uint64_t v68 = v67 + 1;
            }
            else {
              uint64_t v68 = v67 + 2;
            }
            uint64_t v69 = v68 >> 1;
            v64 = &v29[8 * (v68 >> 1)];
            if (v65 != v29)
            {
              memmove(&v29[8 * (v68 >> 1)], v29, v65 - v29);
              v29 = (char *)v6[2];
            }
            v6[1] = v64;
            v6[2] = &v29[8 * v69];
          }
        }
        *((void *)v64 - 1) = v31;
        v114 = (char *)v6[1];
        v115 = (char *)v6[2];
        v6[1] = v114 - 8;
        uint64_t v116 = *((void *)v114 - 1);
        v6[1] = v114;
        if (v115 == (char *)v6[3])
        {
          uint64_t v117 = (uint64_t)&v114[-*v6];
          if ((unint64_t)v114 <= *v6)
          {
            if (v115 == (char *)*v6) {
              unint64_t v125 = 1;
            }
            else {
              unint64_t v125 = (uint64_t)&v115[-*v6] >> 2;
            }
            v126 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<WFDebouncerPokeReason * {__strong}*>>(v125);
            v128 = &v126[8 * (v125 >> 2)];
            v129 = (uint64_t *)v6[1];
            v115 = v128;
            uint64_t v130 = v6[2] - (void)v129;
            if (v130)
            {
              v115 = &v128[v130 & 0xFFFFFFFFFFFFFFF8];
              uint64_t v131 = 8 * (v130 >> 3);
              v132 = &v126[8 * (v125 >> 2)];
              do
              {
                uint64_t v133 = *v129++;
                *(void *)v132 = v133;
                v132 += 8;
                v131 -= 8;
              }
              while (v131);
            }
            v134 = (char *)*v6;
            void *v6 = v126;
            v6[1] = v128;
            v6[2] = v115;
            v6[3] = &v126[8 * v127];
            if (v134)
            {
              operator delete(v134);
              v115 = (char *)v6[2];
            }
          }
          else
          {
            uint64_t v118 = v117 >> 3;
            BOOL v19 = v117 >> 3 < -1;
            uint64_t v119 = (v117 >> 3) + 2;
            if (v19) {
              uint64_t v120 = v119;
            }
            else {
              uint64_t v120 = v118 + 1;
            }
            uint64_t v121 = -(v120 >> 1);
            uint64_t v122 = v120 >> 1;
            v123 = &v114[-8 * v122];
            int64_t v124 = v115 - v114;
            if (v115 != v114)
            {
              memmove(&v114[-8 * v122], v114, v115 - v114);
              v114 = (char *)v6[1];
            }
            v115 = &v123[v124];
            v6[1] = &v114[8 * v121];
            v6[2] = &v123[v124];
          }
        }
        *(void *)v115 = v116;
      }
      else
      {
        v32 = (char *)v6[2];
        if (v32 == (char *)v6[3])
        {
          v33 = (char *)v6[1];
          if (v33 <= v29)
          {
            if (v32 == v29) {
              unint64_t v93 = 1;
            }
            else {
              unint64_t v93 = (v32 - v29) >> 2;
            }
            v94 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<WFDebouncerPokeReason * {__strong}*>>(v93);
            v96 = &v94[8 * (v93 >> 2)];
            v97 = (uint64_t *)v6[1];
            v32 = v96;
            uint64_t v98 = v6[2] - (void)v97;
            if (v98)
            {
              v32 = &v96[v98 & 0xFFFFFFFFFFFFFFF8];
              uint64_t v99 = 8 * (v98 >> 3);
              v100 = &v94[8 * (v93 >> 2)];
              do
              {
                uint64_t v101 = *v97++;
                *(void *)v100 = v101;
                v100 += 8;
                v99 -= 8;
              }
              while (v99);
            }
            v102 = (char *)*v6;
            void *v6 = v94;
            v6[1] = v96;
            v6[2] = v32;
            v6[3] = &v94[8 * v95];
            if (v102)
            {
              operator delete(v102);
              v32 = (char *)v6[2];
            }
          }
          else
          {
            uint64_t v34 = (v33 - v29) >> 3;
            if (v34 >= -1) {
              uint64_t v35 = v34 + 1;
            }
            else {
              uint64_t v35 = v34 + 2;
            }
            uint64_t v36 = -(v35 >> 1);
            uint64_t v37 = v35 >> 1;
            v38 = &v33[-8 * v37];
            int64_t v39 = v32 - v33;
            if (v32 != v33)
            {
              memmove(&v33[-8 * v37], v33, v32 - v33);
              v32 = (char *)v6[1];
            }
            v40 = &v32[8 * v36];
            v32 = &v38[v39];
            v6[1] = v40;
            v6[2] = &v38[v39];
          }
        }
        *(void *)v32 = v31;
      }
LABEL_123:
      id v8 = (char *)(v6[2] + 8);
      v6[2] = v8;
LABEL_124:
      id v7 = (char *)v6[1];
      goto LABEL_125;
    }
    uint64_t v41 = v30 >> 2;
    if (v28 == v29) {
      unint64_t v42 = 1;
    }
    else {
      unint64_t v42 = v41;
    }
    v43 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<WFDebouncerPokeReason * {__strong}*>>(v42);
    uint64_t v45 = v44;
    v46 = &v43[8 * v27];
    *(void *)&long long v47 = v43;
    *((void *)&v47 + 1) = v46;
    long long v142 = v47;
    v48 = operator new(0x1000uLL);
    *(void *)&long long v49 = v46;
    *((void *)&v49 + 1) = &v43[8 * v45];
    if (v27 == v45)
    {
      uint64_t v50 = 8 * v27;
      *(void *)&long long v51 = v142;
      if (v9 >= 1)
      {
        uint64_t v52 = v50 >> 3;
        if (v52 >= -1) {
          unint64_t v53 = v52 + 1;
        }
        else {
          unint64_t v53 = v52 + 2;
        }
        v46 -= 8 * (v53 >> 1);
        *(void *)&long long v49 = v46;
        *((void *)&v51 + 1) = v46;
        goto LABEL_65;
      }
      uint64_t v70 = v50 >> 2;
      if (v8 == v7) {
        unint64_t v71 = 1;
      }
      else {
        unint64_t v71 = v70;
      }
      v72 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<WFDebouncerPokeReason * {__strong}*>>(v71);
      v46 = &v72[8 * (v71 >> 2)];
      *(void *)&long long v51 = v72;
      *((void *)&v51 + 1) = v46;
      *(void *)&long long v49 = v46;
      *((void *)&v49 + 1) = &v72[8 * v73];
      if (!v43)
      {
LABEL_65:
        *(void *)v46 = v48;
        *(void *)&long long v49 = v49 + 8;
        for (uint64_t i = v6[2]; i != v6[1]; i -= 8)
        {
          v75 = (void *)*((void *)&v51 + 1);
          if (*((void *)&v51 + 1) == (void)v51)
          {
            v77 = (unsigned char *)v49;
            if ((unint64_t)v49 >= *((void *)&v49 + 1))
            {
              if (*((void *)&v49 + 1) == *((void *)&v51 + 1)) {
                unint64_t v82 = 1;
              }
              else {
                unint64_t v82 = (uint64_t)(*((void *)&v49 + 1) - *((void *)&v51 + 1)) >> 2;
              }
              v83 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<WFDebouncerPokeReason * {__strong}*>>(v82);
              v76 = &v83[(2 * v82 + 6) & 0xFFFFFFFFFFFFFFF8];
              v85 = v76;
              uint64_t v86 = v77 - (unsigned char *)v75;
              if (v77 != (unsigned char *)v75)
              {
                v85 = &v76[v86 & 0xFFFFFFFFFFFFFFF8];
                uint64_t v87 = 8 * (v86 >> 3);
                v88 = v76;
                v89 = v75;
                do
                {
                  uint64_t v90 = *v89++;
                  *(void *)v88 = v90;
                  v88 += 8;
                  v87 -= 8;
                }
                while (v87);
              }
              *(void *)&long long v51 = v83;
              *((void *)&v51 + 1) = v76;
              *(void *)&long long v49 = v85;
              *((void *)&v49 + 1) = &v83[8 * v84];
              if (v75)
              {
                long long v140 = v49;
                long long v144 = v51;
                operator delete(v75);
                long long v49 = v140;
                long long v51 = v144;
              }
            }
            else
            {
              uint64_t v78 = (uint64_t)(*((void *)&v49 + 1) - v49) >> 3;
              if (v78 >= -1) {
                uint64_t v79 = v78 + 1;
              }
              else {
                uint64_t v79 = v78 + 2;
              }
              uint64_t v80 = v79 >> 1;
              uint64_t v81 = v49 + 8 * (v79 >> 1);
              v76 = (char *)(v81 - (v49 - *((void *)&v51 + 1)));
              if ((void)v49 == *((void *)&v51 + 1))
              {
                v77 = (unsigned char *)*((void *)&v51 + 1);
              }
              else
              {
                uint64_t v141 = *((void *)&v49 + 1);
                uint64_t v143 = v51;
                memmove((void *)(v81 - (v49 - *((void *)&v51 + 1))), *((const void **)&v51 + 1), v49 - *((void *)&v51 + 1));
                *((void *)&v49 + 1) = v141;
                *(void *)&long long v51 = v143;
              }
              *((void *)&v51 + 1) = v76;
              *(void *)&long long v49 = &v77[8 * v80];
            }
          }
          else
          {
            v76 = (char *)*((void *)&v51 + 1);
          }
          uint64_t v91 = *(void *)(i - 8);
          *((void *)v76 - 1) = v91;
          *((void *)&v51 + 1) -= 8;
        }
        v92 = (char *)*v6;
        *(_OWORD *)uint64_t v6 = v51;
        *((_OWORD *)v6 + 1) = v49;
        if (v92)
        {
          operator delete(v92);
          id v8 = (char *)v6[2];
        }
        else
        {
          id v8 = (char *)v49;
        }
        goto LABEL_124;
      }
      long long v139 = v49;
      long long v142 = v51;
      operator delete(v43);
      long long v49 = v139;
    }
    long long v51 = v142;
    goto LABEL_65;
  }
LABEL_125:
  if (v8 == v7)
  {
    v136 = 0;
  }
  else
  {
    unint64_t v135 = v6[5] + v6[4];
    v136 = (void *)(*(void *)&v7[(v135 >> 6) & 0x3FFFFFFFFFFFFF8] + 8 * (v135 & 0x1FF));
  }
  void *v136 = *(id *)(a1 + 40);
  ++v6[5];
  v137 = *(void **)(a1 + 32);
  return [v137 poke];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumDelayTimer, 0);
  objc_storeStrong((id *)&self->_delayTimer, 0);
  objc_storeStrong((id *)&self->_targetTable, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_firingReasons, 0);
}

- (BOOL)isPendingFire
{
  return self->_pendingFire;
}

- (BOOL)unboundedFiringReasons
{
  return self->_unboundedFiringReasons;
}

- (id)userInfo
{
  return self->_userInfo;
}

- (NSArray)firingReasons
{
  return self->_firingReasons;
}

- (void)removeTarget:(id)a3 action:(SEL)a4
{
  id v6 = a3;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__WFDebouncer_removeTarget_action___block_invoke;
  block[3] = &unk_1E6555668;
  id v10 = v6;
  SEL v11 = a4;
  block[4] = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

void __35__WFDebouncer_removeTarget_action___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(a1 + 48))
  {
    if (v2) {
      uint64_t v3 = *(void **)(v2 + 72);
    }
    else {
      uint64_t v3 = 0;
    }
    id v7 = [v3 objectForKey:*(void *)(a1 + 40)];
    uint64_t v4 = NSStringFromSelector(*(SEL *)(a1 + 48));
    [v7 removeObject:v4];
  }
  else
  {
    if (v2) {
      uint64_t v5 = *(void **)(v2 + 72);
    }
    else {
      uint64_t v5 = 0;
    }
    uint64_t v6 = *(void *)(a1 + 40);
    [v5 removeObjectForKey:v6];
  }
}

- (void)fire
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  -[WFDebouncer setPendingFire:]((uint64_t)self, 0);
  -[WFDebouncer resetDelayTimer]((uint64_t)self);
  if (self)
  {
    maximumDelayTimer = self->_maximumDelayTimer;
    if (maximumDelayTimer)
    {
      dispatch_source_cancel(maximumDelayTimer);
      uint64_t v4 = self->_maximumDelayTimer;
    }
    else
    {
      uint64_t v4 = 0;
    }
    self->_maximumDelayTimer = 0;

    firingReasonsQueue = self->_firingReasonsQueue;
    if (firingReasonsQueue)
    {
      if (firingReasonsQueue[5])
      {
        uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:firingReasonsQueue[5]];
        while (firingReasonsQueue[5])
        {
          [v6 addObject:*(void *)(*(void *)(firingReasonsQueue[1] + ((firingReasonsQueue[4] >> 6) & 0x3FFFFFFFFFFFFF8))+ 8 * (firingReasonsQueue[4] & 0x1FFLL))];
          std::deque<WFDebouncerPokeReason * {__strong}>::pop_front((uint64_t)firingReasonsQueue);
        }
        id v7 = (NSArray *)[v6 copy];
        firingReasons = self->_firingReasons;
        self->_firingReasons = v7;
      }
      uint64_t v9 = std::deque<WFDebouncerPokeReason * {__strong}>::~deque[abi:ne180100]((uint64_t)firingReasonsQueue);
      MEMORY[0x1C87C9970](v9, 0x1080C40BE8D5F09);
    }
  }
  self->_firingReasonsQueue = 0;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v10 = self->_targetTable;
  uint64_t v11 = [(NSMapTable *)v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v28;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v10);
        }
        SEL v14 = *(void **)(*((void *)&v27 + 1) + 8 * v13);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        if (self) {
          targetTable = self->_targetTable;
        }
        else {
          targetTable = 0;
        }
        uint64_t v16 = targetTable;
        uint64_t v17 = -[NSMapTable objectForKey:](v16, "objectForKey:", v14, (void)v23);

        uint64_t v18 = [v17 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v18)
        {
          uint64_t v19 = *(void *)v24;
          do
          {
            uint64_t v20 = 0;
            do
            {
              if (*(void *)v24 != v19) {
                objc_enumerationMutation(v17);
              }
              [v14 performSelector:NSSelectorFromString(*(NSString **)(*((void *)&v23 + 1) + 8 * v20++)) withObject:self];
            }
            while (v18 != v20);
            uint64_t v18 = [v17 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }
          while (v18);
        }

        ++v13;
      }
      while (v13 != v11);
      uint64_t v21 = [(NSMapTable *)v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
      uint64_t v11 = v21;
    }
    while (v21);
  }

  uint64_t v22 = self->_firingReasons;
  self->_firingReasons = 0;
}

void __48__WFDebouncer_startMaximumDelayTimerIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained fire];
}

void __32__WFDebouncer_restartDelayTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained fire];
}

- (void)dealloc
{
  if (self)
  {
    firingReasonsQueue = self->_firingReasonsQueue;
    if (firingReasonsQueue)
    {
      uint64_t v4 = std::deque<WFDebouncerPokeReason * {__strong}>::~deque[abi:ne180100]((uint64_t)firingReasonsQueue);
      MEMORY[0x1C87C9970](v4, 0x1080C40BE8D5F09);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)WFDebouncer;
  [(WFDebouncer *)&v5 dealloc];
}

- (WFDebouncer)initWithDelay:(double)a3 queue:(id)a4
{
  return [(WFDebouncer *)self initWithDelay:a4 maximumDelay:a3 queue:0.0];
}

@end