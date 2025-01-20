@interface ULBluetoothIdentityStore
+ (Class)MOClass;
+ (id)defaultSortProperty;
+ (unsigned)maxEntriesInTable;
- (BOOL)insertEntries:(const void *)a3;
- (vector<CLMicroLocationBluetoothIdentityTable::Entry,)_fetchBtIdentityEntriesByAndPredicates:(ULBluetoothIdentityStore *)self sortDescriptors:(SEL)a3 andLimit:(id)a4;
- (vector<CLMicroLocationBluetoothIdentityTable::Entry,)fetchAllRecordsWithLimit:(ULBluetoothIdentityStore *)self;
- (vector<CLMicroLocationBluetoothIdentityTable::Entry,)fetchBtIdentityEntriesBetweenTimes:(ULBluetoothIdentityStore *)self toTime:(SEL)a3;
- (void)fetchBtIdentityEntriesBetweenTimes:(uint64_t)a3 toTime:(int)a4;
@end

@implementation ULBluetoothIdentityStore

+ (unsigned)maxEntriesInTable
{
  v2 = +[ULDefaultsSingleton shared];
  v3 = [v2 defaultsDictionary];

  v4 = [NSString stringWithUTF8String:"ULBluetoothIdentityTableMaxRows"];
  v5 = [v3 objectForKey:v4];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned int v6 = [v5 unsignedIntValue];
  }
  else {
    unsigned int v6 = [&unk_2704F1D88 unsignedIntValue];
  }
  unsigned int v7 = v6;

  return v7;
}

+ (Class)MOClass
{
  return (Class)objc_opt_class();
}

+ (id)defaultSortProperty
{
  return @"lastSeenTimeStamp";
}

- (BOOL)insertEntries:(const void *)a3
{
  return ULDBUtils::insertEntries<CLMicroLocationBluetoothIdentityTable,ULBluetoothIdentityMO>(self, (uint64_t)a3);
}

- (vector<CLMicroLocationBluetoothIdentityTable::Entry,)_fetchBtIdentityEntriesByAndPredicates:(ULBluetoothIdentityStore *)self sortDescriptors:(SEL)a3 andLimit:(id)a4
{
  ULDBUtils::fetchEntries<CLMicroLocationBluetoothIdentityTable,ULBluetoothIdentityMO>(self, a4, a5, a6, retstr);
  return result;
}

- (vector<CLMicroLocationBluetoothIdentityTable::Entry,)fetchAllRecordsWithLimit:(ULBluetoothIdentityStore *)self
{
  ULDBUtils::fetchAllWithLimit<CLMicroLocationBluetoothIdentityTable,ULBluetoothIdentityMO>(self, a4, retstr);
  return result;
}

- (vector<CLMicroLocationBluetoothIdentityTable::Entry,)fetchBtIdentityEntriesBetweenTimes:(ULBluetoothIdentityStore *)self toTime:(SEL)a3
{
  v26[1] = *MEMORY[0x263EF8340];
  v9 = +[ULDefaultsSingleton shared];
  v10 = [v9 defaultsDictionary];

  v11 = [NSString stringWithUTF8String:"ULDatabaseSelectionLimit"];
  v12 = [v10 objectForKey:v11];
  if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned int v13 = [v12 unsignedIntValue];
  }
  else {
    unsigned int v13 = [&unk_2704F1D70 unsignedIntValue];
  }
  unsigned int v14 = v13;

  v15 = [MEMORY[0x263EFF980] array];
  v16 = (void *)MEMORY[0x263F08A98];
  v17 = [NSNumber numberWithDouble:a4];
  v18 = [NSNumber numberWithDouble:a5];
  v19 = [v16 predicateWithFormat:@"%K > %@ && %K <= %@", @"lastSeenTimeStamp", v17, @"lastSeenTimeStamp", v18];
  [v15 addObject:v19];

  v20 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"lastSeenTimeStamp" ascending:0];
  v26[0] = v20;
  v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
  [(ULBluetoothIdentityStore *)self _fetchBtIdentityEntriesByAndPredicates:v15 sortDescriptors:v21 andLimit:v14];

  var1 = retstr->var1;
  unint64_t v23 = 126 - 2 * __clz(0x8E38E38E38E38E39 * (((char *)var1 - (char *)retstr->var0) >> 3));
  if (var1 == retstr->var0) {
    uint64_t v24 = 0;
  }
  else {
    uint64_t v24 = v23;
  }
  std::__introsort<std::_ClassicAlgPolicy,[(ULBluetoothIdentityStore *)(long long *)retstr->var0 fetchBtIdentityEntriesBetweenTimes:v24 toTime:1];

  return result;
}

- (void)fetchBtIdentityEntriesBetweenTimes:(uint64_t)a3 toTime:(int)a4
{
  uint64_t v8 = a2;
  v9 = a1;
  uint64_t v177 = *MEMORY[0x263EF8340];
  uint64_t v169 = a2;
  v170 = a1;
  while (1)
  {
    uint64_t v10 = v8 - (void)v9;
    unint64_t v11 = 0x8E38E38E38E38E39 * ((v8 - (uint64_t)v9) >> 3);
    if (v5 || !v4)
    {
      switch(v11)
      {
        case 0uLL:
        case 1uLL:
          return;
        case 2uLL:
          uint64_t v169 = v8 - 72;
          if (*(double *)(v8 - 8) >= *((double *)v9 + 8)) {
            return;
          }
          v61 = &v170;
          v62 = &v169;
          break;
        case 3uLL:
          uint64_t v169 = v8 - 72;
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[ULBluetoothIdentityStore fetchBtIdentityEntriesBetweenTimes:toTime:]::$_0 &,CLMicroLocationBluetoothIdentityTable::Entry *>((double *)v9, (double *)v9 + 9, v8 - 72);
          return;
        case 4uLL:
          uint64_t v169 = v8 - 72;
          std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,[(ULBluetoothIdentityStore *)(uint64_t)v9 fetchBtIdentityEntriesBetweenTimes:(uint64_t)(v9 + 9) toTime:v8 - 72];
          return;
        case 5uLL:
          uint64_t v169 = v8 - 72;
          v175[0] = (uint64_t)v9;
          *(void *)&long long v176 = (char *)v9 + 72;
          *(void *)&long long v173 = v9 + 9;
          *(void *)v174 = (char *)v9 + 216;
          *(void *)v172 = v8 - 72;
          std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,[(ULBluetoothIdentityStore *)(uint64_t)v9 fetchBtIdentityEntriesBetweenTimes:(uint64_t)(v9 + 9) toTime:(uint64_t)v9 + 216];
          if (*(double *)(v8 - 8) >= *((double *)v9 + 35)) {
            return;
          }
          std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CLMicroLocationBluetoothIdentityTable::Entry *&,CLMicroLocationBluetoothIdentityTable::Entry *&>((long long **)v174, (uint64_t *)v172);
          if (*(double *)(*(void *)v174 + 64) >= *((double *)v9 + 26)) {
            return;
          }
          std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CLMicroLocationBluetoothIdentityTable::Entry *&,CLMicroLocationBluetoothIdentityTable::Entry *&>((long long **)&v173, (uint64_t *)v174);
          if (*(double *)(v173 + 64) >= *((double *)v9 + 17)) {
            return;
          }
          std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CLMicroLocationBluetoothIdentityTable::Entry *&,CLMicroLocationBluetoothIdentityTable::Entry *&>((long long **)&v176, (uint64_t *)&v173);
          if (*(double *)(v176 + 64) >= *((double *)v9 + 8)) {
            return;
          }
          v61 = (long long **)v175;
          v62 = (uint64_t *)&v176;
          break;
        default:
          JUMPOUT(0);
      }
      std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CLMicroLocationBluetoothIdentityTable::Entry *&,CLMicroLocationBluetoothIdentityTable::Entry *&>(v61, v62);
      return;
    }
    if (v10 <= 1727) {
      break;
    }
    if (!a3)
    {
      if (v9 != (long long *)v8)
      {
        v166 = (long long *)v8;
        int64_t v82 = (v11 - 2) >> 1;
        int64_t v83 = v82;
        do
        {
          int64_t v84 = v83;
          if (v82 >= v83)
          {
            uint64_t v85 = (2 * v83) | 1;
            v86 = (double *)v9 + 9 * v85;
            if (2 * v84 + 2 < (uint64_t)v11 && *((double *)v9 + 9 * v85 + 8) < v86[17])
            {
              v86 += 9;
              uint64_t v85 = 2 * v84 + 2;
            }
            double v87 = *((double *)v9 + 9 * v84 + 8);
            if (v86[8] >= v87)
            {
              v88 = (double *)v9 + 9 * v84;
              long long v176 = *(_OWORD *)v88;
              uint64_t v153 = *((void *)v88 + 2);
              uint64_t v89 = *((void *)v88 + 3);
              *(double *)((char *)&v173 + 7) = *(double *)((char *)v88 + 31);
              *(void *)&long long v173 = v89;
              char v151 = *((unsigned char *)v88 + 39);
              v88[2] = 0.0;
              v88[3] = 0.0;
              v88[4] = 0.0;
              char v161 = *((unsigned char *)v88 + 40);
              uint64_t v90 = *(void *)((char *)v88 + 55);
              *(_OWORD *)v175 = *(_OWORD *)((char *)v88 + 41);
              *(uint64_t *)((char *)&v175[1] + 6) = v90;
              char v157 = *((unsigned char *)v88 + 63);
              v88[5] = 0.0;
              v88[6] = 0.0;
              v88[7] = 0.0;
              do
              {
                v91 = v86;
                *(_OWORD *)v88 = *(_OWORD *)v86;
                v92 = (void **)(v88 + 2);
                if (*((char *)v88 + 39) < 0) {
                  operator delete(*v92);
                }
                long long v93 = *((_OWORD *)v91 + 1);
                v88[4] = v91[4];
                *(_OWORD *)v92 = v93;
                *((unsigned char *)v91 + 39) = 0;
                *((unsigned char *)v91 + 16) = 0;
                v94 = (void **)(v88 + 5);
                if (*((char *)v88 + 63) < 0) {
                  operator delete(*v94);
                }
                long long v95 = *(_OWORD *)(v91 + 5);
                v88[7] = v91[7];
                *(_OWORD *)v94 = v95;
                *((unsigned char *)v91 + 63) = 0;
                *((unsigned char *)v91 + 40) = 0;
                v88[8] = v91[8];
                if (v82 < v85) {
                  break;
                }
                uint64_t v96 = (2 * v85) | 1;
                v86 = (double *)v9 + 9 * v96;
                if (2 * v85 + 2 < (uint64_t)v11 && *((double *)v9 + 9 * v96 + 8) < v86[17])
                {
                  v86 += 9;
                  uint64_t v96 = 2 * v85 + 2;
                }
                v88 = v91;
                uint64_t v85 = v96;
              }
              while (v86[8] >= v87);
              *(_OWORD *)v91 = v176;
              if (*((char *)v91 + 39) < 0) {
                operator delete(*((void **)v91 + 2));
              }
              uint64_t v97 = v173;
              *((void *)v91 + 2) = v153;
              *((void *)v91 + 3) = v97;
              *(double *)((char *)v91 + 31) = *(double *)((char *)&v173 + 7);
              *((unsigned char *)v91 + 39) = v151;
              if (*((char *)v91 + 63) < 0) {
                operator delete(*((void **)v91 + 5));
              }
              *((unsigned char *)v91 + 40) = v161;
              *(_OWORD *)((char *)v91 + 41) = *(_OWORD *)v175;
              *(double *)((char *)v91 + 55) = *(double *)((char *)&v175[1] + 6);
              *((unsigned char *)v91 + 63) = v157;
              v91[8] = v87;
            }
          }
          int64_t v83 = v84 - 1;
        }
        while (v84);
        int64_t v98 = v10 / 0x48uLL;
        v99 = v166;
        do
        {
          uint64_t v100 = 0;
          v101 = v99;
          long long v173 = *v9;
          uint64_t v152 = *((void *)v9 + 2);
          *(void *)v172 = *((void *)v9 + 3);
          *(void *)&v172[7] = *(void *)((char *)v9 + 31);
          char v154 = *((unsigned char *)v9 + 39);
          *((void *)v9 + 3) = 0;
          *((void *)v9 + 4) = 0;
          *((void *)v9 + 2) = 0;
          uint64_t v102 = *((void *)v9 + 5);
          v171[0] = *((void *)v9 + 6);
          *(void *)((char *)v171 + 7) = *(void *)((char *)v9 + 55);
          char v167 = *((unsigned char *)v9 + 63);
          *((void *)v9 + 6) = 0;
          *((void *)v9 + 7) = 0;
          *((void *)v9 + 5) = 0;
          v103 = v9;
          uint64_t v158 = *((void *)v9 + 8);
          uint64_t v162 = v102;
          do
          {
            uint64_t v104 = v100 + 1;
            v105 = (char *)v103 + 72 * v100 + 72;
            uint64_t v106 = 2 * v100;
            uint64_t v100 = (2 * v100) | 1;
            int64_t v107 = v106 + 2;
            if (v107 < v98 && *((double *)v103 + 9 * v104 + 8) < *((double *)v105 + 17))
            {
              v105 += 72;
              uint64_t v100 = v107;
            }
            long long *v103 = *(_OWORD *)v105;
            v108 = (void **)(v103 + 1);
            if (*((char *)v103 + 39) < 0) {
              operator delete(*v108);
            }
            v109 = (void **)(v105 + 16);
            long long v110 = *((_OWORD *)v105 + 1);
            *((void *)v103 + 4) = *((void *)v105 + 4);
            *(_OWORD *)v108 = v110;
            v105[39] = 0;
            v105[16] = 0;
            v111 = (void **)v103 + 5;
            if (*((char *)v103 + 63) < 0) {
              operator delete(*v111);
            }
            long long v112 = *(_OWORD *)(v105 + 40);
            *((void *)v103 + 7) = *((void *)v105 + 7);
            *(_OWORD *)v111 = v112;
            v105[63] = 0;
            v105[40] = 0;
            *((void *)v103 + 8) = *((void *)v105 + 8);
            v103 = (long long *)v105;
          }
          while (v100 <= (uint64_t)((unint64_t)(v98 - 2) >> 1));
          v113 = (void **)(v105 + 40);
          v99 = (long long *)((char *)v101 - 72);
          if (v105 == (char *)v101 - 72)
          {
            *(_OWORD *)v105 = v173;
            if (v105[39] < 0) {
              operator delete(*v109);
            }
            *((void *)v105 + 2) = v152;
            uint64_t v133 = *(void *)v172;
            *(void *)(v105 + 31) = *(void *)&v172[7];
            *((void *)v105 + 3) = v133;
            v105[39] = v154;
            if (v105[63] < 0) {
              operator delete(*v113);
            }
            *((void *)v105 + 5) = v162;
            uint64_t v134 = v171[0];
            *(void *)(v105 + 55) = *(void *)((char *)v171 + 7);
            *((void *)v105 + 6) = v134;
            v105[63] = v167;
            *((void *)v105 + 8) = v158;
          }
          else
          {
            *(_OWORD *)v105 = *v99;
            if (v105[39] < 0) {
              operator delete(*v109);
            }
            long long v114 = *(long long *)((char *)v101 - 56);
            *((void *)v105 + 4) = *((void *)v101 - 5);
            *(_OWORD *)v109 = v114;
            *((unsigned char *)v101 - 33) = 0;
            *((unsigned char *)v101 - 56) = 0;
            if (v105[63] < 0) {
              operator delete(*v113);
            }
            long long v115 = *(v101 - 2);
            *((void *)v105 + 7) = *((void *)v101 - 2);
            *(_OWORD *)v113 = v115;
            *((unsigned char *)v101 - 9) = 0;
            *((unsigned char *)v101 - 32) = 0;
            *((void *)v105 + 8) = *((void *)v101 - 1);
            long long *v99 = v173;
            if (*((char *)v101 - 33) < 0) {
              operator delete(*((void **)v101 - 7));
            }
            *((void *)v101 - 7) = v152;
            *((void *)v101 - 6) = *(void *)v172;
            *(void *)((char *)v101 - 41) = *(void *)&v172[7];
            *((unsigned char *)v101 - 33) = v154;
            if (*((char *)v101 - 9) < 0) {
              operator delete(*((void **)v101 - 4));
            }
            uint64_t v116 = v171[0];
            *((void *)v101 - 4) = v162;
            *((void *)v101 - 3) = v116;
            *(void *)((char *)v101 - 17) = *(void *)((char *)v171 + 7);
            *((unsigned char *)v101 - 9) = v167;
            *((void *)v101 - 1) = v158;
            uint64_t v117 = v105 + 72 - (char *)v9;
            if (v117 >= 73)
            {
              unint64_t v118 = (v117 / 0x48uLL - 2) >> 1;
              double v119 = *((double *)v105 + 8);
              if (*((double *)v9 + 9 * v118 + 8) < v119)
              {
                v168 = (long long *)((char *)v101 - 72);
                long long v176 = *(_OWORD *)v105;
                v155 = (void *)*((void *)v105 + 2);
                uint64_t v120 = *((void *)v105 + 3);
                *(void *)&v174[7] = *(void *)(v105 + 31);
                *(void *)v174 = v120;
                char v121 = v105[39];
                *v109 = 0;
                *((void *)v105 + 3) = 0;
                *((void *)v105 + 4) = 0;
                char v163 = v105[40];
                uint64_t v122 = *(void *)(v105 + 55);
                *(_OWORD *)v175 = *(_OWORD *)(v105 + 41);
                *(uint64_t *)((char *)&v175[1] + 6) = v122;
                char v159 = v105[63];
                *v113 = 0;
                *((void *)v105 + 6) = 0;
                *((void *)v105 + 7) = 0;
                do
                {
                  v123 = (char *)v9 + 72 * v118;
                  *(_OWORD *)v105 = *(_OWORD *)v123;
                  v124 = (void **)(v105 + 16);
                  if (v105[39] < 0) {
                    operator delete(*v124);
                  }
                  v125 = (void **)(v123 + 16);
                  long long v126 = *((_OWORD *)v123 + 1);
                  *((void *)v105 + 4) = *((void *)v123 + 4);
                  *(_OWORD *)v124 = v126;
                  v123[39] = 0;
                  v123[16] = 0;
                  v127 = (void **)(v105 + 40);
                  if (v105[63] < 0) {
                    operator delete(*v127);
                  }
                  v128 = (char *)v9 + 72 * v118;
                  long long v129 = *(_OWORD *)(v128 + 40);
                  *((void *)v105 + 7) = *((void *)v128 + 7);
                  *(_OWORD *)v127 = v129;
                  v123[63] = 0;
                  v128[40] = 0;
                  *((void *)v105 + 8) = *((void *)v128 + 8);
                  if (!v118) {
                    break;
                  }
                  unint64_t v118 = (v118 - 1) >> 1;
                  v105 = v123;
                }
                while (*((double *)v9 + 9 * v118 + 8) < v119);
                *(_OWORD *)v123 = v176;
                if (v123[39] < 0) {
                  operator delete(*v125);
                }
                v130 = (void **)(v128 + 40);
                *v125 = v155;
                uint64_t v131 = *(void *)v174;
                *(void *)(v123 + 31) = *(void *)&v174[7];
                *((void *)v123 + 3) = v131;
                v123[39] = v121;
                if (v123[63] < 0) {
                  operator delete(*v130);
                }
                *(unsigned char *)v130 = v163;
                long long v132 = *(_OWORD *)v175;
                *(void *)(v128 + 55) = *(uint64_t *)((char *)&v175[1] + 6);
                *(_OWORD *)(v128 + 41) = v132;
                v128[63] = v159;
                *((double *)v128 + 8) = v119;
                v99 = v168;
              }
            }
          }
        }
        while (v98-- > 2);
      }
      return;
    }
    unint64_t v12 = v11 >> 1;
    uint64_t v13 = v8 - 72;
    if ((unint64_t)v10 >= 0x2401)
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[ULBluetoothIdentityStore fetchBtIdentityEntriesBetweenTimes:toTime:]::$_0 &,CLMicroLocationBluetoothIdentityTable::Entry *>((double *)v9, (double *)v9 + 9 * (v11 >> 1), v13);
      uint64_t v14 = 9 * v12;
      uint64_t v15 = 72 * v12;
      uint64_t v16 = v15 - 72;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[ULBluetoothIdentityStore fetchBtIdentityEntriesBetweenTimes:toTime:]::$_0 &,CLMicroLocationBluetoothIdentityTable::Entry *>((double *)v170 + 9, (double *)((char *)v170 + v15 - 72), v169 - 144);
      v15 += 72;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[ULBluetoothIdentityStore fetchBtIdentityEntriesBetweenTimes:toTime:]::$_0 &,CLMicroLocationBluetoothIdentityTable::Entry *>((double *)v170 + 18, (double *)((char *)v170 + v15), v169 - 216);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[ULBluetoothIdentityStore fetchBtIdentityEntriesBetweenTimes:toTime:]::$_0 &,CLMicroLocationBluetoothIdentityTable::Entry *>((double *)((char *)v170 + v16), (double *)v170 + v14, (uint64_t)v170 + v15);
      v175[0] = (uint64_t)v170 + 8 * v14;
      std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CLMicroLocationBluetoothIdentityTable::Entry *&,CLMicroLocationBluetoothIdentityTable::Entry *&>(&v170, v175);
    }
    else
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[ULBluetoothIdentityStore fetchBtIdentityEntriesBetweenTimes:toTime:]::$_0 &,CLMicroLocationBluetoothIdentityTable::Entry *>((double *)v9 + 9 * (v11 >> 1), (double *)v9, v13);
    }
    uint64_t v17 = a3 - 1;
    v18 = v170;
    if (a4)
    {
      int v160 = a4;
      unint64_t v19 = v169;
      double v20 = *((double *)v170 + 8);
    }
    else
    {
      double v20 = *((double *)v170 + 8);
      unint64_t v19 = v169;
      if (*((double *)v170 - 1) >= v20)
      {
        uint64_t v32 = v17;
        *(void *)v172 = v169;
        long long v176 = *v170;
        v34 = (void **)(v170 + 1);
        uint64_t v33 = *((void *)v170 + 2);
        *(void *)&long long v173 = *((void *)v170 + 3);
        *(void *)((char *)&v173 + 7) = *(void *)((char *)v170 + 31);
        char v35 = *((unsigned char *)v170 + 39);
        *((void *)v170 + 2) = 0;
        *((void *)v18 + 3) = 0;
        *((void *)v18 + 4) = 0;
        v37 = (void **)v18 + 5;
        char v36 = *((unsigned char *)v18 + 40);
        *(_OWORD *)v175 = *(long long *)((char *)v18 + 41);
        *(uint64_t *)((char *)&v175[1] + 6) = *(void *)((char *)v18 + 55);
        char v38 = *((unsigned char *)v18 + 63);
        *((void *)v18 + 5) = 0;
        *((void *)v18 + 6) = 0;
        *((void *)v18 + 7) = 0;
        if (*(double *)(v19 - 8) <= v20)
        {
          v51 = (double *)v18 + 9;
          do
          {
            unint64_t v40 = (unint64_t)v51;
            if ((unint64_t)v51 >= v19) {
              break;
            }
            double v52 = v51[8];
            v51 += 9;
          }
          while (v52 <= v20);
        }
        else
        {
          v39 = v18;
          do
          {
            unint64_t v40 = (unint64_t)v39 + 72;
            double v41 = *((double *)v39 + 17);
            v39 = (long long *)((char *)v39 + 72);
          }
          while (v41 <= v20);
        }
        *(void *)v174 = v40;
        if (v40 < v19)
        {
          do
          {
            double v53 = *(double *)(v19 - 8);
            v19 -= 72;
          }
          while (v53 > v20);
          goto LABEL_55;
        }
        while (v40 < v19)
        {
          std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CLMicroLocationBluetoothIdentityTable::Entry *&,CLMicroLocationBluetoothIdentityTable::Entry *&>((long long **)v174, (uint64_t *)v172);
          unint64_t v40 = *(void *)v174;
          do
          {
            double v54 = *(double *)(v40 + 136);
            v40 += 72;
          }
          while (v54 <= v20);
          *(void *)v174 = v40;
          unint64_t v19 = *(void *)v172;
          do
          {
            double v55 = *(double *)(v19 - 8);
            v19 -= 72;
          }
          while (v55 > v20);
LABEL_55:
          *(void *)v172 = v19;
        }
        v56 = (long long *)(v40 - 72);
        BOOL v4 = v40 - 72 >= (unint64_t)v18;
        BOOL v5 = v40 - 72 == (void)v18;
        if ((long long *)(v40 - 72) != v18)
        {
          long long *v18 = *v56;
          if (*((char *)v18 + 39) < 0) {
            operator delete(*v34);
          }
          long long v57 = *(_OWORD *)(v40 - 56);
          *((void *)v18 + 4) = *(void *)(v40 - 40);
          *(_OWORD *)v34 = v57;
          *(unsigned char *)(v40 - 33) = 0;
          *(unsigned char *)(v40 - 56) = 0;
          if (*((char *)v18 + 63) < 0) {
            operator delete(*v37);
          }
          long long v58 = *(_OWORD *)(v40 - 32);
          *((void *)v18 + 7) = *(void *)(v40 - 16);
          *(_OWORD *)v37 = v58;
          *(unsigned char *)(v40 - 9) = 0;
          *(unsigned char *)(v40 - 32) = 0;
          *((void *)v18 + 8) = *(void *)(v40 - 8);
        }
        long long *v56 = v176;
        if (*(char *)(v40 - 33) < 0) {
          operator delete(*(void **)(v40 - 56));
        }
        *(void *)(v40 - 56) = v33;
        uint64_t v59 = v173;
        *(void *)(v40 - 41) = *(void *)((char *)&v173 + 7);
        *(void *)(v40 - 48) = v59;
        *(unsigned char *)(v40 - 33) = v35;
        if (*(char *)(v40 - 9) < 0) {
          operator delete(*(void **)(v40 - 32));
        }
        a4 = 0;
        *(unsigned char *)(v40 - 32) = v36;
        long long v60 = *(_OWORD *)v175;
        *(void *)(v40 - 17) = *(uint64_t *)((char *)&v175[1] + 6);
        *(_OWORD *)(v40 - 31) = v60;
        *(unsigned char *)(v40 - 9) = v38;
        *(double *)(v40 - 8) = v20;
        v9 = *(long long **)v174;
        v170 = *(long long **)v174;
        a3 = v32;
        goto LABEL_73;
      }
      int v160 = a4;
    }
    uint64_t v164 = v17;
    uint64_t v21 = 0;
    long long v176 = *v170;
    v22 = (void **)(v170 + 1);
    uint64_t v23 = *((void *)v170 + 2);
    *(void *)&long long v173 = *((void *)v170 + 3);
    *(void *)((char *)&v173 + 7) = *(void *)((char *)v170 + 31);
    char v24 = *((unsigned char *)v170 + 39);
    *((void *)v170 + 2) = 0;
    *((void *)v18 + 3) = 0;
    *((void *)v18 + 4) = 0;
    v25 = (void **)v18 + 5;
    char v156 = *((unsigned char *)v18 + 40);
    *(_OWORD *)v175 = *(long long *)((char *)v18 + 41);
    *(uint64_t *)((char *)&v175[1] + 6) = *(void *)((char *)v18 + 55);
    char v26 = *((unsigned char *)v18 + 63);
    *((void *)v18 + 5) = 0;
    *((void *)v18 + 6) = 0;
    *((void *)v18 + 7) = 0;
    do
    {
      double v27 = *(double *)((char *)v18 + v21 + 136);
      v21 += 72;
    }
    while (v27 < v20);
    v28 = (char *)v18 + v21;
    *(void *)v174 = (char *)v18 + v21;
    if (v21 == 72)
    {
      while ((unint64_t)v28 < v19)
      {
        unint64_t v29 = v19 - 72;
        double v31 = *(double *)(v19 - 8);
        v19 -= 72;
        if (v31 < v20) {
          goto LABEL_26;
        }
      }
      unint64_t v29 = v19;
    }
    else
    {
      do
      {
        unint64_t v29 = v19 - 72;
        double v30 = *(double *)(v19 - 8);
        v19 -= 72;
      }
      while (v30 >= v20);
    }
LABEL_26:
    *(void *)v172 = v29;
    v9 = (long long *)((char *)v18 + v21);
    if ((unint64_t)v28 < v29)
    {
      do
      {
        std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<CLMicroLocationBluetoothIdentityTable::Entry *&,CLMicroLocationBluetoothIdentityTable::Entry *&>((long long **)v174, (uint64_t *)v172);
        v9 = *(long long **)v174;
        do
        {
          double v42 = *((double *)v9 + 17);
          v9 = (long long *)((char *)v9 + 72);
        }
        while (v42 < v20);
        *(void *)v174 = v9;
        unint64_t v43 = *(void *)v172;
        do
        {
          double v44 = *(double *)(v43 - 8);
          v43 -= 72;
        }
        while (v44 >= v20);
        *(void *)v172 = v43;
      }
      while ((unint64_t)v9 < v43);
    }
    v45 = (long long *)((char *)v9 - 72);
    if ((long long *)((char *)v9 - 72) != v18)
    {
      long long *v18 = *v45;
      if (*((char *)v18 + 39) < 0) {
        operator delete(*v22);
      }
      long long v46 = *(long long *)((char *)v9 - 56);
      *((void *)v18 + 4) = *((void *)v9 - 5);
      *(_OWORD *)v22 = v46;
      *((unsigned char *)v9 - 33) = 0;
      *((unsigned char *)v9 - 56) = 0;
      if (*((char *)v18 + 63) < 0) {
        operator delete(*v25);
      }
      long long v47 = *(v9 - 2);
      *((void *)v18 + 7) = *((void *)v9 - 2);
      *(_OWORD *)v25 = v47;
      *((unsigned char *)v9 - 9) = 0;
      *((unsigned char *)v9 - 32) = 0;
      *((void *)v18 + 8) = *((void *)v9 - 1);
    }
    long long *v45 = v176;
    if (*((char *)v9 - 33) < 0) {
      operator delete(*((void **)v9 - 7));
    }
    *((void *)v9 - 7) = v23;
    uint64_t v48 = v173;
    *(void *)((char *)v9 - 41) = *(void *)((char *)&v173 + 7);
    *((void *)v9 - 6) = v48;
    *((unsigned char *)v9 - 33) = v24;
    a4 = v160;
    if (*((char *)v9 - 9) < 0) {
      operator delete(*((void **)v9 - 4));
    }
    *((unsigned char *)v9 - 32) = v156;
    long long v49 = *(_OWORD *)v175;
    *(void *)((char *)v9 - 17) = *(uint64_t *)((char *)&v175[1] + 6);
    *(long long *)((char *)v9 - 31) = v49;
    *((unsigned char *)v9 - 9) = v26;
    *((double *)v9 - 1) = v20;
    BOOL v4 = (unint64_t)v28 >= v29;
    a3 = v164;
    if (!v4) {
      goto LABEL_43;
    }
    BOOL v50 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[ULBluetoothIdentityStore fetchBtIdentityEntriesBetweenTimes:toTime:]::$_0 &,CLMicroLocationBluetoothIdentityTable::Entry *>((uint64_t)v170, (uint64_t)v9 - 72);
    if (!std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[ULBluetoothIdentityStore fetchBtIdentityEntriesBetweenTimes:toTime:]::$_0 &,CLMicroLocationBluetoothIdentityTable::Entry *>((uint64_t)v9, v169))
    {
      if (!v50)
      {
LABEL_43:
        std::__introsort<std::_ClassicAlgPolicy,[(ULBluetoothIdentityStore *)v170 fetchBtIdentityEntriesBetweenTimes:v164 toTime:v160 & 1];
        a4 = 0;
      }
      v170 = v9;
      goto LABEL_73;
    }
    if (v50) {
      return;
    }
    uint64_t v169 = (uint64_t)v9 - 72;
    v9 = v170;
LABEL_73:
    uint64_t v8 = v169;
  }
  v63 = (long long *)((char *)v9 + 72);
  BOOL v65 = v9 == (long long *)v8 || v63 == (long long *)v8;
  if (a4)
  {
    if (!v65)
    {
      uint64_t v66 = 0;
      v67 = v9;
      uint64_t v165 = v8;
      do
      {
        v68 = v63;
        double v69 = *((double *)v67 + 17);
        if (v69 < *((double *)v67 + 8))
        {
          long long v70 = *v63;
          *(_OWORD *)v175 = *(long long *)((char *)v67 + 113);
          uint64_t v71 = *((void *)v67 + 11);
          *(void *)&long long v173 = *((void *)v67 + 12);
          *(void *)((char *)&v173 + 7) = *(void *)((char *)v67 + 103);
          char v72 = *((unsigned char *)v67 + 111);
          *((void *)v67 + 11) = 0;
          *((void *)v67 + 12) = 0;
          char v73 = *((unsigned char *)v67 + 112);
          *(uint64_t *)((char *)&v175[1] + 6) = *(void *)((char *)v67 + 127);
          char v74 = *((unsigned char *)v67 + 135);
          *((void *)v67 + 13) = 0;
          *((void *)v67 + 14) = 0;
          *((void *)v67 + 15) = 0;
          *((void *)v67 + 16) = 0;
          uint64_t v75 = v66;
          long long v176 = v70;
          while (1)
          {
            v76 = (char *)v9 + v75;
            *(long long *)((char *)v9 + v75 + 72) = *(long long *)((char *)v9 + v75);
            v77 = (void **)((char *)v9 + v75 + 88);
            if (*((char *)v9 + v75 + 111) < 0) {
              operator delete(*v77);
            }
            *(_OWORD *)v77 = *((_OWORD *)v76 + 1);
            *(void *)((char *)v9 + v75 + 104) = *((void *)v76 + 4);
            v76[39] = 0;
            v76[16] = 0;
            v78 = v76 + 112;
            if (v76[135] < 0) {
              operator delete(*(void **)v78);
            }
            v79 = (char *)v9 + v75;
            *(_OWORD *)v78 = *(long long *)((char *)v9 + v75 + 40);
            uint64_t v80 = *(void *)((char *)v9 + v75 + 64);
            *((void *)v78 + 2) = *(void *)((char *)v9 + v75 + 56);
            v79[63] = 0;
            v79[40] = 0;
            *((void *)v79 + 17) = v80;
            if (!v75) {
              break;
            }
            v75 -= 72;
            if (v69 >= *((double *)v79 - 1))
            {
              uint64_t v81 = (uint64_t)v9 + v75 + 72;
              goto LABEL_104;
            }
          }
          uint64_t v81 = (uint64_t)v9;
LABEL_104:
          *(_OWORD *)uint64_t v81 = v176;
          if (*(char *)(v81 + 39) < 0) {
            operator delete(*((void **)v79 + 2));
          }
          *((void *)v79 + 2) = v71;
          *(void *)(v81 + 24) = v173;
          *(void *)(v81 + 31) = *(void *)((char *)&v173 + 7);
          *(unsigned char *)(v81 + 39) = v72;
          uint64_t v8 = v165;
          if (*(char *)(v81 + 63) < 0) {
            operator delete(*((void **)v79 + 5));
          }
          v79[40] = v73;
          *(_OWORD *)(v81 + 41) = *(_OWORD *)v175;
          *(void *)(v81 + 55) = *(uint64_t *)((char *)&v175[1] + 6);
          *(unsigned char *)(v81 + 63) = v74;
          *(double *)(v81 + 64) = v69;
        }
        v63 = (long long *)((char *)v68 + 72);
        v66 += 72;
        v67 = v68;
      }
      while ((long long *)((char *)v68 + 72) != (long long *)v8);
    }
  }
  else if (!v65)
  {
    v136 = (void *)v9 + 17;
    do
    {
      v137 = v63;
      double v138 = *((double *)v9 + 17);
      if (v138 < *((double *)v9 + 8))
      {
        long long v139 = *v63;
        *(_OWORD *)v175 = *(long long *)((char *)v9 + 113);
        uint64_t v140 = *((void *)v9 + 11);
        *(void *)&long long v173 = *((void *)v9 + 12);
        *(void *)((char *)&v173 + 7) = *(void *)((char *)v9 + 103);
        char v141 = *((unsigned char *)v9 + 111);
        *((void *)v9 + 11) = 0;
        *((void *)v9 + 12) = 0;
        char v142 = *((unsigned char *)v9 + 112);
        *(uint64_t *)((char *)&v175[1] + 6) = *(void *)((char *)v9 + 127);
        char v143 = *((unsigned char *)v9 + 135);
        *((void *)v9 + 13) = 0;
        *((void *)v9 + 14) = 0;
        *((void *)v9 + 15) = 0;
        *((void *)v9 + 16) = 0;
        v144 = v136;
        long long v176 = v139;
        do
        {
          *((_OWORD *)v144 - 4) = *(_OWORD *)(v144 - 17);
          v145 = (void **)(v144 - 6);
          if (*((char *)v144 - 25) < 0) {
            operator delete(*v145);
          }
          *(_OWORD *)v145 = *(_OWORD *)(v144 - 15);
          *(v144 - 4) = *(v144 - 13);
          *((unsigned char *)v144 - 97) = 0;
          *((unsigned char *)v144 - 120) = 0;
          v146 = (void **)(v144 - 3);
          if (*((char *)v144 - 1) < 0) {
            operator delete(*v146);
          }
          *(_OWORD *)v146 = *((_OWORD *)v144 - 6);
          *(v144 - 1) = *(v144 - 10);
          *((unsigned char *)v144 - 73) = 0;
          *((unsigned char *)v144 - 96) = 0;
          v147 = (double *)(v144 - 9);
          void *v144 = *(v144 - 9);
          double v148 = *((double *)v144 - 18);
          v144 -= 9;
        }
        while (v138 < v148);
        *((_OWORD *)v147 - 4) = v176;
        if (*((char *)v147 - 25) < 0) {
          operator delete(*((void **)v147 - 6));
        }
        *((void *)v147 - 6) = v140;
        uint64_t v149 = v173;
        *(double *)((char *)v147 - 33) = *(double *)((char *)&v173 + 7);
        *((void *)v147 - 5) = v149;
        *((unsigned char *)v147 - 25) = v141;
        if (*((char *)v147 - 1) < 0) {
          operator delete(*((void **)v147 - 3));
        }
        *((unsigned char *)v147 - 24) = v142;
        long long v150 = *(_OWORD *)v175;
        *(double *)((char *)v147 - 9) = *(double *)((char *)&v175[1] + 6);
        *(_OWORD *)((char *)v147 - 23) = v150;
        *((unsigned char *)v147 - 1) = v143;
        double *v147 = v138;
      }
      v63 = (long long *)((char *)v137 + 72);
      v136 += 9;
      v9 = v137;
    }
    while ((long long *)((char *)v137 + 72) != (long long *)v8);
  }
}

@end