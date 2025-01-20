@interface _DASKnapsackSolver
- (BOOL)index_vect;
- (OS_os_log)logger;
- (_DASKnapsackSolver)init;
- (char)values_vect;
- (id)solveKnapsackWithCapacity:(id)a3 forItemWeights:(id)a4 andItemValues:(id)a5;
- (unsigned)J;
- (unsigned)n_cols;
- (unsigned)n_rows;
- (unsigned)weight_vect;
- (void)reset;
- (void)setIndex_vect:(BOOL *)a3;
- (void)setJ:(unsigned __int16 *)a3;
- (void)setLogger:(id)a3;
- (void)setN_cols:(unsigned int)a3;
- (void)setN_rows:(unsigned __int8)a3;
- (void)setValues_vect:(char *)a3;
- (void)setWeight_vect:(unsigned int *)a3;
@end

@implementation _DASKnapsackSolver

- (_DASKnapsackSolver)init
{
  v6.receiver = self;
  v6.super_class = (Class)_DASKnapsackSolver;
  v2 = [(_DASKnapsackSolver *)&v6 init];
  uint64_t v3 = +[_DASDaemonLogger logForCategory:@"DASKnapsackSolver"];
  v4 = (void *)*((void *)v2 + 2);
  *((void *)v2 + 2) = v3;

  v2[8] = 0;
  *((_DWORD *)v2 + 3) = 0;
  *(_OWORD *)(v2 + 24) = 0u;
  *(_OWORD *)(v2 + 40) = 0u;
  return (_DASKnapsackSolver *)v2;
}

- (id)solveKnapsackWithCapacity:(id)a3 forItemWeights:(id)a4 andItemValues:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  objc_sync_enter(v11);
  if ((unint64_t)[v10 count] >= 0xFF)
  {
    logger = v11->_logger;
    if (!os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_27;
    }
    *(_WORD *)buf = 0;
    v13 = "Error: Exceeded the maximum number of solver inputs (UINT8_MAX - 1).";
LABEL_7:
    _os_log_impl((void *)&_mh_execute_header, logger, OS_LOG_TYPE_DEFAULT, v13, buf, 2u);
    goto LABEL_27;
  }
  if ((unint64_t)[v8 unsignedLongValue] >> 32)
  {
    logger = v11->_logger;
    if (!os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_27;
    }
    *(_WORD *)buf = 0;
    v13 = "Error: Exceeded the maximum solver capacity UINT32_MAX.";
    goto LABEL_7;
  }
  unsigned int v14 = [v8 unsignedIntValue];
  size_t v15 = (size_t)[v10 count];
  id v16 = [v9 count];
  uint64_t v17 = v14 + 1;
  v11->_n_cols = v17;
  v11->_unsigned __int8 n_rows = v15 + 1;
  if (v16 != (id)v15 || (unint64_t)v16 < 2 || v17 < 3 || (v15 + 1) <= 2u)
  {
    v27 = v11->_logger;
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_27;
    }
    *(_WORD *)buf = 0;
    v28 = "Error: Invalid solver input.";
    goto LABEL_26;
  }
  v11->_values_vect = (char *)malloc_type_malloc(v15, 0x100004077774924uLL);
  v18 = (unsigned int *)malloc_type_malloc(4 * v15, 0x100004052888210uLL);
  v11->_weight_vect = v18;
  if (!v18 || !v11->_values_vect)
  {
    v27 = v11->_logger;
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_27;
    }
    *(_WORD *)buf = 0;
    v28 = "Error: Failed to allocate memory for I/O vectorization.";
LABEL_26:
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, v28, buf, 2u);
    goto LABEL_27;
  }
  uint64_t v19 = 0;
  do
  {
    v20 = [v10 objectAtIndex:v19];
    if ((unint64_t)[v20 longValue] >= 0x100)
    {
      v30 = v11->_logger;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Error: Item values must be positive and less than UINT8_MAX.", buf, 2u);
      }
      [(_DASKnapsackSolver *)v11 reset];
      id v26 = [objc_alloc((Class)NSSet) initWithObjects:&off_100186B08];

      goto LABEL_28;
    }
    v11->_values_vect[v19] = [v20 unsignedCharValue];
    v21 = [v9 objectAtIndex:v19];
    v11->_weight_vect[v19] = [v21 unsignedIntValue];

    ++v19;
  }
  while (v15 != v19);
  uint64_t v22 = 0;
  unsigned int v23 = 0;
  unsigned int v24 = -1;
  do
  {
    unsigned int v25 = v11->_weight_vect[v22];
    v23 += v25;
    if (v25 < v24) {
      unsigned int v24 = v11->_weight_vect[v22];
    }
    ++v22;
  }
  while (v15 != v22);
  if (v24 > v14)
  {
    id v26 = objc_alloc_init((Class)NSSet);
LABEL_63:
    [(_DASKnapsackSolver *)v11 reset];
    goto LABEL_28;
  }
  if (v23 <= v14)
  {
    id v47 = +[NSMutableArray arrayWithCapacity:v15];
    uint64_t v52 = 0;
    do
    {
      v53 = +[NSNumber numberWithInt:v52];
      [v47 addObject:v53];

      ++v52;
    }
    while (v15 != v52);
    id v51 = [objc_alloc((Class)NSSet) initWithArray:v47];
LABEL_62:
    id v26 = v51;

    goto LABEL_63;
  }
  v31 = (unsigned __int16 **)malloc_type_calloc(v11->_n_rows, 8uLL, 0x10040436913F5uLL);
  v11->_J = v31;
  if (!v31)
  {
    v54 = v11->_logger;
    if (!os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_27;
    }
    *(_WORD *)buf = 0;
    v55 = "Error: Failed to allocate memory for solver core.";
    goto LABEL_70;
  }
  *v11->_J = (unsigned __int16 *)malloc_type_calloc(v11->_n_cols, 2uLL, 0x1000040BDFB0063uLL);
  if (!*v11->_J)
  {
    v54 = v11->_logger;
    if (!os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_27;
    }
    *(_WORD *)buf = 0;
    v55 = "Error: Failed to allocate memory for solver core.";
    goto LABEL_70;
  }
  if (v11->_n_rows < 2u)
  {
LABEL_48:
    v40 = (BOOL *)malloc_type_calloc(v15, 1uLL, 0x100004077774924uLL);
    v11->_index_vect = v40;
    if (v40)
    {
      unsigned __int8 n_rows = v11->_n_rows;
      LOBYTE(v42) = n_rows - 1;
      if (n_rows != 1)
      {
        weight_vect = v11->_weight_vect;
        J = v11->_J;
        unsigned int v45 = v11->_n_cols - 1;
        uint64_t v42 = v42;
        do
        {
          uint64_t v46 = (v42 - 1);
          if (J[v42][v45] > J[v46][v45])
          {
            v45 -= weight_vect[v46];
            v40[v46] = 1;
          }
          --v42;
        }
        while (v46);
      }
      id v47 = objc_alloc_init((Class)NSMutableSet);
      uint64_t v48 = 0;
      unsigned __int8 v49 = 0;
      do
      {
        if (v11->_index_vect[v48])
        {
          v50 = +[NSNumber numberWithUnsignedChar:v49];
          [v47 addObject:v50];
        }
        uint64_t v48 = ++v49;
      }
      while (v15 > v49);
      id v51 = [v47 copy];
      goto LABEL_62;
    }
    v54 = v11->_logger;
    if (!os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_27;
    }
    *(_WORD *)buf = 0;
    v55 = "Error: Failed to allocate memory for I/O vectorization.";
LABEL_70:
    _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, v55, buf, 2u);
    goto LABEL_27;
  }
  unsigned __int8 v32 = 1;
  while (1)
  {
    v11->_J[v32] = (unsigned __int16 *)malloc_type_malloc(2 * v11->_n_cols, 0x1000040BDFB0063uLL);
    v33 = v11->_J;
    v34 = v33[v32];
    if (!v34) {
      break;
    }
    unint64_t v35 = 0;
    uint64_t v36 = (v32 - 1);
    unint64_t v37 = v11->_weight_vect[v36];
    v38 = v33[v36];
    do
    {
      unsigned int v39 = v38[v35];
      if (v35 >= v37 && v38[(v35 - v37)] + v11->_values_vect[v36] > v39) {
        LOWORD(v39) = v38[(v35 - v37)] + v11->_values_vect[v36];
      }
      v34[v35++] = v39;
    }
    while (v17 != v35);
    if (v11->_n_rows <= ++v32) {
      goto LABEL_48;
    }
  }
  v56 = v11->_logger;
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "Error: Failed to allocate memory for solver core.", buf, 2u);
  }
LABEL_27:
  [(_DASKnapsackSolver *)v11 reset];
  id v26 = [objc_alloc((Class)NSSet) initWithObjects:&off_100186B08, 0];
LABEL_28:
  objc_sync_exit(v11);

  return v26;
}

- (void)reset
{
  free(self->_index_vect);
  free(self->_weight_vect);
  free(self->_values_vect);
  J = self->_J;
  if (J)
  {
    if (self->_n_rows)
    {
      unint64_t v4 = 0;
      do
        free(self->_J[v4++]);
      while (v4 < self->_n_rows);
      J = self->_J;
    }
    free(J);
  }
  self->_unsigned __int8 n_rows = 0;
  self->_n_cols = 0;
}

- (OS_os_log)logger
{
  return (OS_os_log *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLogger:(id)a3
{
}

- (BOOL)index_vect
{
  return self->_index_vect;
}

- (void)setIndex_vect:(BOOL *)a3
{
  self->_index_vect = a3;
}

- (char)values_vect
{
  return self->_values_vect;
}

- (void)setValues_vect:(char *)a3
{
  self->_values_vect = a3;
}

- (unsigned)weight_vect
{
  return self->_weight_vect;
}

- (void)setWeight_vect:(unsigned int *)a3
{
  self->_weight_vect = a3;
}

- (unsigned)n_rows
{
  return self->_n_rows;
}

- (void)setN_rows:(unsigned __int8)a3
{
  self->_unsigned __int8 n_rows = a3;
}

- (unsigned)n_cols
{
  return self->_n_cols;
}

- (void)setN_cols:(unsigned int)a3
{
  self->_n_cols = a3;
}

- (unsigned)J
{
  return self->_J;
}

- (void)setJ:(unsigned __int16 *)a3
{
  self->_J = a3;
}

- (void).cxx_destruct
{
}

@end