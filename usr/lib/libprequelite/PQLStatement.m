@interface PQLStatement
- (BOOL)_prepare:(const char *)a3 withDB:(id)a4 preparationTime:(unint64_t *)a5;
- (BOOL)isTraced;
- (PQLStatement)initWithFormat:(id)a3 arguments:(char *)a4 db:(id)a5 cache:(cache_s *)a6 preparationTime:(unint64_t *)a7;
- (PQLStatement)initWithQueryBuilder:(id)a3 db:(id)a4 cache:(cache_s *)a5 preparationTime:(unint64_t *)a6;
- (PQLStatement)initWithStatement:(id)a3 forDB:(id)a4 preparationTime:(unint64_t *)a5;
- (id)description;
- (id)translate:(id)a3 hasInjections:(BOOL *)a4 arguments:(char *)a5;
- (id)translate:(id)a3 withBuilder:(id)a4;
- (void)bindArguments:(char *)a3 db:(id)a4;
- (void)bindFromArray:(id)a3 db:(id)a4;
- (void)dealloc;
- (void)invalidate;
- (void)keepBindAlive:(id)a3;
- (void)unbindForDB:(id)a3 returnedRows:(unint64_t)a4 executionTime:(unint64_t)a5 preparationTime:(unint64_t)a6;
@end

@implementation PQLStatement

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aliveBinds, 0);

  objc_storeStrong((id *)&self->_next, 0);
}

- (id)translate:(id)a3 hasInjections:(BOOL *)a4 arguments:(char *)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = (const char *)[v7 UTF8String];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:strlen(v8) + 1];
  self->_uint64_t specLength = 0;
  size_t v10 = strcspn(v8, "%");
  [v9 appendBytes:v8 length:v10];
  v11 = &v8[v10];
  if (*v11)
  {
    uint64_t v41 = *MEMORY[0x1E4F1C3C8];
    while (1)
    {
      v13 = v11 + 1;
      int v12 = *((unsigned __int8 *)v11 + 1);
      if (v12 == 37) {
        break;
      }
      if ((unsigned __int16)self->_specLength >= 0x3E8u) {
        goto LABEL_61;
      }
      if (v12 == 64)
      {
        v16 = (id *)a5;
        a5 += 8;
        id v17 = *v16;
        if ([*v16 conformsToProtocol:&unk_1F3831EB0])
        {
          *a4 = 1;
          uint64_t specLength = self->_specLength;
          self->_uint64_t specLength = specLength + 1;
          __src[specLength] = 8;
          v13 = v11 + 2;
          v19 = [v17 sql];
          [v9 appendData:v19];

          goto LABEL_21;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v20 = self->_specLength;
          self->_uint64_t specLength = v20 + 1;
          __src[v20] = 9;
          v13 = v11 + 2;
          v14 = v9;
          v15 = "?";
          goto LABEL_5;
        }
      }
      [v9 appendBytes:"?" length:1];
      int v21 = *v13;
      if (v21 > 96)
      {
        switch(*v13)
        {
          case 'a':
          case 'e':
          case 'f':
          case 'g':
            goto LABEL_18;
          case 'd':
          case 'i':
            a5 += 8;
            uint64_t v22 = self->_specLength;
            self->_uint64_t specLength = v22 + 1;
            __src[v22] = 0;
            goto LABEL_20;
          case 'l':
            int v28 = v11[2];
            if (memchr("udi", v28, 4uLL))
            {
              a5 += 8;
              uint64_t v29 = self->_specLength;
              self->_uint64_t specLength = v29 + 1;
              __src[v29] = 2;
              goto LABEL_38;
            }
            if (v28 <= 107)
            {
              if (v28 == 100 || v28 == 105)
              {
                a5 += 8;
                uint64_t v34 = self->_specLength;
                self->_uint64_t specLength = v34 + 1;
                __src[v34] = 0;
                goto LABEL_38;
              }
              goto LABEL_55;
            }
            if (v28 != 108)
            {
              if (v28 != 117) {
                goto LABEL_55;
              }
              a5 += 8;
              uint64_t v35 = self->_specLength;
              self->_uint64_t specLength = v35 + 1;
              __src[v35] = 1;
              goto LABEL_38;
            }
            if (!memchr("udi", v11[3], 4uLL)) {
              goto LABEL_55;
            }
            a5 += 8;
            uint64_t v36 = self->_specLength;
            self->_uint64_t specLength = v36 + 1;
            __src[v36] = 2;
            break;
          case 'p':
            a5 += 8;
            uint64_t v26 = self->_specLength;
            self->_uint64_t specLength = v26 + 1;
            char v27 = 2;
            goto LABEL_30;
          case 's':
            a5 += 8;
            uint64_t v23 = self->_specLength;
            self->_uint64_t specLength = v23 + 1;
            char v24 = 4;
            goto LABEL_19;
          case 'u':
            a5 += 8;
            uint64_t v23 = self->_specLength;
            self->_uint64_t specLength = v23 + 1;
            char v24 = 1;
            goto LABEL_19;
          default:
            goto LABEL_55;
        }
LABEL_45:
        v13 = v11 + 4;
        goto LABEL_21;
      }
      if (v21 <= 64)
      {
        if (v21 == 42)
        {
          if (memchr("sp", v11[2], 3uLL))
          {
            a5 += 16;
            uint64_t v30 = self->_specLength;
            if (v11[2] == 115) {
              char v31 = 5;
            }
            else {
              char v31 = 6;
            }
            __src[v30] = v31;
            self->_uint64_t specLength = v30 + 1;
LABEL_38:
            v13 = v11 + 3;
            goto LABEL_21;
          }
LABEL_55:
          [MEMORY[0x1E4F1CA00] raise:v41, @"cannot compile statement [%@] around [...%.10s...]", v7, v11 format];
          goto LABEL_21;
        }
        if (v21 == 46)
        {
          if (v11[2] != 42 || !memchr("sp", v11[3], 3uLL)) {
            goto LABEL_55;
          }
          a5 += 16;
          uint64_t v32 = self->_specLength;
          if (v11[3] == 115) {
            char v33 = 5;
          }
          else {
            char v33 = 6;
          }
          __src[v32] = v33;
          self->_uint64_t specLength = v32 + 1;
          goto LABEL_45;
        }
        if (v21 != 64) {
          goto LABEL_55;
        }
        uint64_t v26 = self->_specLength;
        self->_uint64_t specLength = v26 + 1;
        char v27 = 7;
LABEL_30:
        __src[v26] = v27;
      }
      else
      {
        if ((v21 - 69) >= 3 && v21 != 65) {
          goto LABEL_55;
        }
LABEL_18:
        a5 += 8;
        uint64_t v23 = self->_specLength;
        self->_uint64_t specLength = v23 + 1;
        char v24 = 3;
LABEL_19:
        __src[v23] = v24;
      }
LABEL_20:
      v13 = v11 + 2;
LABEL_21:
      size_t v25 = strcspn(v13, "%");
      [v9 appendBytes:v13 length:v25];
      v11 = &v13[v25];
      if (!v13[v25]) {
        goto LABEL_56;
      }
    }
    v13 = v11 + 2;
    v14 = v9;
    v15 = "%";
LABEL_5:
    [v14 appendBytes:v15 length:1];
    goto LABEL_21;
  }
LABEL_56:
  [v9 appendBytes:"" length:1];
  size_t v37 = (unsigned __int16)self->_specLength;
  if (self->_specLength < 9)
  {
    memcpy(&self->_specUnion, __src, (__int16)v37);
  }
  else
  {
    v38 = (unsigned __int8 *)malloc_type_malloc((unsigned __int16)self->_specLength, 0x853F0B0AuLL);
    if (!v38) {
LABEL_61:
    }
      abort();
    v39 = v38;
    memcpy(v38, __src, v37);
    self->_specUnion.ptr = v39;
  }
  [v9 appendBytes:__src length:self->_specLength];

  return v9;
}

- (void)unbindForDB:(id)a3 returnedRows:(unint64_t)a4 executionTime:(unint64_t)a5 preparationTime:(unint64_t)a6
{
  id v20 = a3;
  if (self->_stmt)
  {
    if (self->_inUse)
    {
      size_t v10 = [v20 profilingHook];

      if (v10)
      {
        v11 = [v20 profilingHook];
        ((void (**)(void, id, sqlite3_stmt *, unint64_t))v11)[2](v11, v20, self->_stmt, a4);
      }
      if (self->_inUse)
      {
        int v12 = [v20 profilingHookV2];

        if (v12)
        {
          v13 = [PQLStatementMetricsData alloc];
          stmt = self->_stmt;
          double v15 = timeInSeconds(a5);
          v16 = [(PQLStatementMetricsData *)v13 initWithStmt:stmt returnedRows:a4 executionTime:v15 preparationTime:timeInSeconds(a6)];
          id v17 = [v20 profilingHookV2];
          ((void (**)(void, id, PQLStatementMetricsData *))v17)[2](v17, v20, v16);
        }
      }
    }
    v18 = self->_stmt;
    sqlite3_reset(v18);
    sqlite3_stmt_status(v18, 1, 1);
    sqlite3_stmt_status(v18, 2, 1);
    sqlite3_stmt_status(v18, 3, 1);
    sqlite3_stmt_status(v18, 4, 1);
    sqlite3_clear_bindings(self->_stmt);
  }
  aliveBinds = self->_aliveBinds;
  self->_aliveBinds = 0;

  self->_inUse = 0;
}

- (PQLStatement)initWithQueryBuilder:(id)a3 db:(id)a4 cache:(cache_s *)a5 preparationTime:(unint64_t *)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  size_t v10 = (void (**)(id, PQLQueryBuilder *))a3;
  id v11 = a4;
  v32.receiver = self;
  v32.super_class = (Class)PQLStatement;
  int v12 = [(PQLStatement *)&v32 init];
  if (v12)
  {
    v13 = v12;
    v14 = objc_alloc_init(PQLQueryBuilder);
    double v15 = v10[2](v10, v14);
    value_out = 0;
    v16 = [(PQLQueryBuilder *)v14 lastError];

    if (v16)
    {
      id v17 = [(PQLQueryBuilder *)v14 lastError];
      [v11 setLastError:v17];

      v18 = 0;
LABEL_23:
      v19 = 0;
LABEL_37:

      goto LABEL_38;
    }
    v13->_isTraced = [v11 isTraced];
    v18 = [(PQLStatement *)v13 translate:v15 withBuilder:v14];
    if (v13->_isTraced)
    {
      id v20 = (void *)MEMORY[0x1E01AB700]();
      if (pql_pred != -1) {
        dispatch_once_f(&pql_pred, 0, (dispatch_function_t)_pql_log_init);
      }
      int v21 = (void *)pql_log;
      if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v22 = v21;
        uint64_t v23 = [v18 bytes];
        *(_DWORD *)buf = 138412546;
        uint64_t v34 = v15;
        __int16 v35 = 2080;
        uint64_t v36 = (PQLStatement *)v23;
        _os_log_impl(&dword_1DCCE4000, v22, OS_LOG_TYPE_DEBUG, "translated statement with injections\nsql:   %@\ntrans: %s", buf, 0x16u);
      }
    }
    if (!a5 || cache_get_and_retain(a5, v18, &value_out)) {
      goto LABEL_13;
    }
    size_t v25 = (PQLStatement *)CFRetain(value_out);
    cache_release_value(a5, value_out);
    if (v13->_isTraced)
    {
      if (pql_pred != -1) {
        dispatch_once_f(&pql_pred, 0, (dispatch_function_t)_pql_log_init);
      }
      uint64_t v26 = pql_log;
      if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v34 = v15;
        __int16 v35 = 2112;
        uint64_t v36 = v25;
        _os_log_impl(&dword_1DCCE4000, v26, OS_LOG_TYPE_DEBUG, "found cached statement with injections\nsql:  %@\nstmt: %@", buf, 0x16u);
      }
    }
    if (!v25)
    {
LABEL_13:
      if (!-[PQLStatement _prepare:withDB:preparationTime:](v13, "_prepare:withDB:preparationTime:", [v18 bytes], v11, a6))goto LABEL_23; {
      if (a5 && !cache_set_and_retain(a5, v18, v13, 0))
      }
      {
        if (v13->_isTraced)
        {
          if (pql_pred != -1) {
            dispatch_once_f(&pql_pred, 0, (dispatch_function_t)_pql_log_init);
          }
          char v24 = pql_log;
          if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v34 = v15;
            __int16 v35 = 2112;
            uint64_t v36 = v13;
            _os_log_impl(&dword_1DCCE4000, v24, OS_LOG_TYPE_DEBUG, "cached statement with injections\nsql:  %@\nstmt: %@", buf, 0x16u);
          }
        }
        cache_release_value(a5, v13);
      }
      size_t v25 = v13;
    }
    if (v25->_inUse)
    {
      while (1)
      {
        next = v25->_next;
        if (!next) {
          break;
        }
        v19 = next;

        size_t v25 = v19;
        if (!v19->_inUse) {
          goto LABEL_36;
        }
      }
      int v28 = [[PQLStatement alloc] initWithStatement:v25 forDB:v11 preparationTime:a6];
      uint64_t v29 = v25->_next;
      v25->_next = v28;

      v19 = v28;
    }
    else
    {
      v19 = v25;
    }
LABEL_36:
    [(PQLStatement *)v19 bindFromArray:v14->_parameters db:v11];
    goto LABEL_37;
  }
  v19 = 0;
LABEL_38:

  return v19;
}

- (void)bindFromArray:(id)a3 db:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!self->_stmt)
  {
    char v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2 object:self file:@"PQLStatement.m" lineNumber:705 description:@"cannot bind a closed statement"];
  }
  if (self->_inUse)
  {
    uint64_t v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2 object:self file:@"PQLStatement.m" lineNumber:706 description:@"cannot bind a statement in use"];
  }
  p_specUnion = &self->_specUnion;
  if (self->_specLength >= 9) {
    p_specUnion = ($B640FA5AF0A9E956D46B4BA9A7C3BCE7 *)p_specUnion->ptr;
  }
  self->_inUse = 1;
  if ([v8 isTraced]) {
    size_t v10 = objc_opt_new();
  }
  else {
    size_t v10 = 0;
  }
  if (self->_specLength >= 1)
  {
    uint64_t v11 = 0;
    uint64_t v12 = 1;
    do
    {
      switch(p_specUnion->inlined[v11])
      {
        case 0u:
          if (v10)
          {
            if ([v10 length]) {
              v13 = @", %s";
            }
            else {
              v13 = @"%s";
            }
            [v10 appendFormat:v13, @"INT"];
          }
          stmt = self->_stmt;
          id v15 = [v7 objectAtIndexedSubscript:v11];
          sqlite3_bind_int(stmt, v12, [v15 intValue]);
          goto LABEL_56;
        case 1u:
          if (v10)
          {
            if ([v10 length]) {
              uint64_t v23 = @", %s";
            }
            else {
              uint64_t v23 = @"%s";
            }
            [v10 appendFormat:v23, @"UINT"];
          }
          char v24 = self->_stmt;
          id v15 = [v7 objectAtIndexedSubscript:v11];
          sqlite3_int64 v25 = [v15 unsignedIntValue];
          goto LABEL_43;
        case 2u:
          if (v10)
          {
            if ([v10 length]) {
              uint64_t v26 = @", %s";
            }
            else {
              uint64_t v26 = @"%s";
            }
            [v10 appendFormat:v26, @"INT64"];
          }
          char v24 = self->_stmt;
          id v15 = [v7 objectAtIndexedSubscript:v11];
          sqlite3_int64 v25 = [v15 longLongValue];
LABEL_43:
          sqlite3_bind_int64(v24, v12, v25);
          goto LABEL_56;
        case 3u:
          if (v10)
          {
            if ([v10 length]) {
              char v27 = @", %s";
            }
            else {
              char v27 = @"%s";
            }
            [v10 appendFormat:v27, @"DOUBLE"];
          }
          int v28 = self->_stmt;
          id v15 = [v7 objectAtIndexedSubscript:v11];
          [v15 doubleValue];
          sqlite3_bind_double(v28, v12, v29);
          goto LABEL_56;
        case 4u:
          if (v10)
          {
            if ([v10 length]) {
              v16 = @", %s";
            }
            else {
              v16 = @"%s";
            }
            [v10 appendFormat:v16, "TEXT"];
          }
          id v17 = self->_stmt;
          id v15 = [v7 objectAtIndexedSubscript:v11];
          sqlite3_bind_text(v17, v12, (const char *)[v15 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
          goto LABEL_56;
        case 5u:
        case 6u:
        case 8u:
          abort();
        case 7u:
          if (v10)
          {
            uint64_t v18 = [v10 length];
            uint64_t v19 = [v7 objectAtIndexedSubscript:v11];
            id v20 = (void *)v19;
            if (v18) {
              int v21 = @", %s(%@)";
            }
            else {
              int v21 = @"%s(%@)";
            }
            [v10 appendFormat:v21, @"OBJECT", v19];
          }
          uint64_t v22 = self->_stmt;
          id v15 = [v7 objectAtIndexedSubscript:v11];
          pql_bind_object(v22, v12, v15);
          goto LABEL_56;
        case 9u:
          if (v10)
          {
            if ([v10 length]) {
              uint64_t v30 = @", %s";
            }
            else {
              uint64_t v30 = @"%s";
            }
            [v10 appendFormat:v30, "BLOCK"];
          }
          char v31 = [v7 objectAtIndexedSubscript:v11];
          id v15 = (id)[v31 copy];

          [(PQLStatement *)self keepBindAlive:v15];
          pql_sqlite3_bind_pointer(self->_stmt, v12, (sqlite3_int64)v15);
LABEL_56:
          uint64_t v12 = (v12 + 1);

          break;
        default:
          break;
      }
      ++v11;
    }
    while (v11 < self->_specLength);
  }
  if (v10)
  {
    if (pql_pred != -1) {
      dispatch_once_f(&pql_pred, 0, (dispatch_function_t)_pql_log_init);
    }
    objc_super v32 = pql_log;
    if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v36 = self;
      __int16 v37 = 2112;
      v38 = v10;
      _os_log_impl(&dword_1DCCE4000, v32, OS_LOG_TYPE_DEBUG, "binding values to statement\nstmt: %@\nbinding: [%@]", buf, 0x16u);
    }
  }
}

- (id)translate:(id)a3 withBuilder:(id)a4
{
  id v6 = a3;
  id v7 = (signed __int16 *)a4;
  id v8 = v6;
  v9 = (const char *)[v8 UTF8String];
  size_t v10 = strlen(v9);
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:strlen(v9) + v7[508] + 1];
  int v12 = v7[508];
  size_t v13 = (unsigned __int16)v7[508];
  self->_uint64_t specLength = v7[508];
  if (v12 < 9)
  {
    memcpy(&self->_specUnion, v7 + 8, (__int16)v13);
  }
  else
  {
    v14 = (unsigned __int8 *)malloc_type_malloc(v13, 0x853F0B0AuLL);
    if (!v14) {
      abort();
    }
    id v15 = v14;
    memcpy(v14, v7 + 8, v13);
    self->_specUnion.ptr = v15;
  }
  [v11 appendBytes:v9 length:v10 + 1];
  [v11 appendBytes:v7 + 8 length:v7[508]];

  return v11;
}

- (void)dealloc
{
  [(PQLStatement *)self invalidate];
  if (self->_specLength >= 9) {
    free(self->_specUnion.ptr);
  }
  v3.receiver = self;
  v3.super_class = (Class)PQLStatement;
  [(PQLStatement *)&v3 dealloc];
}

- (void)invalidate
{
  sqlite3_finalize(self->_stmt);
  self->_stmt = 0;
  aliveBinds = self->_aliveBinds;
  self->_aliveBinds = 0;
}

- (void)keepBindAlive:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    aliveBinds = self->_aliveBinds;
    if (aliveBinds)
    {
      [(NSMutableArray *)aliveBinds addObject:v4];
    }
    else
    {
      id v6 = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithObjects:v4, 0];
      id v7 = self->_aliveBinds;
      self->_aliveBinds = v6;
    }
  }

  MEMORY[0x1F41817F8]();
}

- (PQLStatement)initWithFormat:(id)a3 arguments:(char *)a4 db:(id)a5 cache:(cache_s *)a6 preparationTime:(unint64_t *)a7
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  int v12 = (char *)a3;
  v38 = a4;
  id v13 = a5;
  v37.receiver = self;
  v37.super_class = (Class)PQLStatement;
  v14 = [(PQLStatement *)&v37 init];
  if (v14)
  {
    id v15 = v14;
    char v36 = 0;
    CFTypeRef cf = 0;
    __int16 v35 = 0;
    v14->_isTraced = [v13 isTraced];
    if (a6 && !cache_get_and_retain(a6, v12, (void **)&cf))
    {
      uint64_t v23 = CFRetain(cf);
      cache_release_value(a6, (void *)cf);
      if (v15->_isTraced)
      {
        if (pql_pred != -1) {
          dispatch_once_f(&pql_pred, 0, (dispatch_function_t)_pql_log_init);
        }
        char v24 = pql_log;
        if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v40 = v12;
          __int16 v41 = 2112;
          v42 = v23;
          _os_log_impl(&dword_1DCCE4000, v24, OS_LOG_TYPE_DEBUG, "found cached statement without injections\nsql:  %@\nstmt: %@", buf, 0x16u);
        }
      }
      id v17 = 0;
    }
    else
    {
      if (v38) {
        __int16 v35 = v38;
      }
      id v17 = -[PQLStatement translate:hasInjections:arguments:](v15, "translate:hasInjections:arguments:", v12, &v36);
      if (v15->_isTraced)
      {
        uint64_t v18 = (void *)MEMORY[0x1E01AB700]();
        if (pql_pred != -1) {
          dispatch_once_f(&pql_pred, 0, (dispatch_function_t)_pql_log_init);
        }
        uint64_t v19 = (void *)pql_log;
        if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEBUG))
        {
          if (v36) {
            id v20 = "";
          }
          else {
            id v20 = "out";
          }
          int v21 = v19;
          uint64_t v22 = [v17 bytes];
          *(_DWORD *)buf = 136315650;
          v40 = v20;
          __int16 v41 = 2112;
          v42 = v12;
          __int16 v43 = 2080;
          uint64_t v44 = (PQLStatement *)v22;
          _os_log_impl(&dword_1DCCE4000, v21, OS_LOG_TYPE_DEBUG, "translated statement with%s injections\nsql:   %@\ntrans: %s", buf, 0x20u);
        }
      }
      uint64_t v23 = 0;
      if (!a6) {
        goto LABEL_26;
      }
    }
    if (v36 && !cache_get_and_retain(a6, v17, (void **)&cf))
    {
      sqlite3_int64 v25 = (PQLStatement *)CFRetain(cf);

      cache_release_value(a6, (void *)cf);
      if (v15->_isTraced)
      {
        if (pql_pred != -1) {
          dispatch_once_f(&pql_pred, 0, (dispatch_function_t)_pql_log_init);
        }
        char v33 = pql_log;
        if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v40 = v12;
          __int16 v41 = 2112;
          v42 = v25;
          _os_log_impl(&dword_1DCCE4000, v33, OS_LOG_TYPE_DEBUG, "found cached statement with injections\nsql:  %@\nstmt: %@", buf, 0x16u);
        }
      }
LABEL_27:
      if (!v25)
      {
        if (!-[PQLStatement _prepare:withDB:preparationTime:](v15, "_prepare:withDB:preparationTime:", [v17 bytes], v13, a7))
        {
          v16 = 0;
LABEL_51:

          goto LABEL_52;
        }
        if (a6)
        {
          uint64_t v26 = v36 ? v17 : v12;
          if (!cache_set_and_retain(a6, v26, v15, 0))
          {
            if (v15->_isTraced)
            {
              if (pql_pred != -1) {
                dispatch_once_f(&pql_pred, 0, (dispatch_function_t)_pql_log_init);
              }
              char v27 = pql_log;
              if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315650;
                if (v36) {
                  int v28 = "";
                }
                else {
                  int v28 = "out";
                }
                v40 = v28;
                __int16 v41 = 2112;
                v42 = v12;
                __int16 v43 = 2112;
                uint64_t v44 = v15;
                _os_log_impl(&dword_1DCCE4000, v27, OS_LOG_TYPE_DEBUG, "cached statement with%s injections\nsql:  %@\nstmt: %@", buf, 0x20u);
              }
            }
            cache_release_value(a6, v15);
          }
        }
        sqlite3_int64 v25 = v15;
      }
      if (v25->_inUse)
      {
        while (1)
        {
          next = v25->_next;
          if (!next) {
            break;
          }
          v16 = next;

          sqlite3_int64 v25 = v16;
          if (!v16->_inUse) {
            goto LABEL_50;
          }
        }
        uint64_t v30 = [[PQLStatement alloc] initWithStatement:v25 forDB:v13 preparationTime:a7];
        char v31 = v25->_next;
        v25->_next = v30;

        v16 = v30;
      }
      else
      {
        v16 = v25;
      }
LABEL_50:
      [(PQLStatement *)v16 bindArguments:v38 db:v13];
      goto LABEL_51;
    }
LABEL_26:
    sqlite3_int64 v25 = (PQLStatement *)v23;
    goto LABEL_27;
  }
  v16 = 0;
LABEL_52:

  return v16;
}

- (void)bindArguments:(char *)a3 db:(id)a4
{
  id v6 = a4;
  if (!self->_stmt)
  {
    __int16 v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2 object:self file:@"PQLStatement.m" lineNumber:427 description:@"cannot bind a closed statement"];
  }
  if (self->_inUse)
  {
    char v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2 object:self file:@"PQLStatement.m" lineNumber:428 description:@"cannot bind a statement in use"];
  }
  int specLength = self->_specLength;
  if (specLength >= 9)
  {
    ptr = ($B640FA5AF0A9E956D46B4BA9A7C3BCE7 *)self->_specUnion.ptr;
    self->_inUse = 1;
LABEL_9:
    uint64_t v9 = 0;
    uint64_t v10 = 1;
    while (2)
    {
      switch(ptr->inlined[v9])
      {
        case 0u:
          uint64_t v11 = (v10 + 1);
          int v12 = (int *)a3;
          a3 += 8;
          sqlite3_bind_int(self->_stmt, v10, *v12);
          goto LABEL_33;
        case 1u:
          stmt = self->_stmt;
          uint64_t v11 = (v10 + 1);
          id v15 = a3;
          a3 += 8;
          sqlite3_int64 v16 = *(unsigned int *)v15;
          goto LABEL_15;
        case 2u:
          stmt = self->_stmt;
          uint64_t v11 = (v10 + 1);
          id v17 = a3;
          a3 += 8;
          sqlite3_int64 v16 = *(void *)v17;
LABEL_15:
          sqlite3_bind_int64(stmt, v10, v16);
          goto LABEL_33;
        case 3u:
          uint64_t v11 = (v10 + 1);
          uint64_t v18 = (double *)a3;
          a3 += 8;
          sqlite3_bind_double(self->_stmt, v10, *v18);
          goto LABEL_33;
        case 4u:
          uint64_t v19 = a3;
          a3 += 8;
          id v20 = *(const char **)v19;
          int v21 = self->_stmt;
          uint64_t v11 = (v10 + 1);
          int v22 = v10;
          if (*(void *)v19)
          {
            int v23 = -1;
LABEL_23:
            sqlite3_bind_text(v21, v22, v20, v23, 0);
          }
          else
          {
            sqlite3_bind_null(v21, v10);
          }
LABEL_33:
          id v13 = 0;
          uint64_t v10 = v11;
LABEL_34:

          if (++v9 >= self->_specLength) {
            goto LABEL_35;
          }
          continue;
        case 5u:
          char v24 = a3;
          int v23 = *(_DWORD *)a3;
          a3 += 16;
          sqlite3_int64 v25 = (const char *)*((void *)v24 + 1);
          int v21 = self->_stmt;
          uint64_t v11 = (v10 + 1);
          if (v25) {
            id v20 = v25;
          }
          else {
            id v20 = "";
          }
          int v22 = v10;
          goto LABEL_23;
        case 6u:
          uint64_t v26 = a3;
          int v27 = *(_DWORD *)a3;
          a3 += 16;
          int v28 = (const char *)*((void *)v26 + 1);
          uint64_t v11 = (v10 + 1);
          if (v28) {
            double v29 = v28;
          }
          else {
            double v29 = "";
          }
          sqlite3_bind_blob(self->_stmt, v10, v29, v27, 0);
          goto LABEL_33;
        case 7u:
          uint64_t v11 = (v10 + 1);
          uint64_t v30 = a3;
          a3 += 8;
          pql_bind_object(self->_stmt, v10, *(void **)v30);
          goto LABEL_33;
        case 8u:
          char v31 = a3;
          a3 += 8;
          id v13 = *(id *)v31;
          uint64_t v10 = [v13 bindWithStatement:self->_stmt startingAtIndex:v10]
              + v10;
          if (objc_opt_respondsToSelector())
          {
            objc_super v32 = [v13 bindValuesToKeepAlive];
            [(PQLStatement *)self keepBindAlive:v32];
          }
          goto LABEL_34;
        case 9u:
          char v33 = a3;
          a3 += 8;
          uint64_t v34 = (void *)[*(id *)v33 copy];
          [(PQLStatement *)self keepBindAlive:v34];
          uint64_t v11 = (v10 + 1);
          pql_sqlite3_bind_pointer(self->_stmt, v10, (sqlite3_int64)v34);

          goto LABEL_33;
        default:
          id v13 = 0;
          goto LABEL_34;
      }
    }
  }
  self->_inUse = 1;
  if (specLength >= 1)
  {
    ptr = &self->_specUnion;
    goto LABEL_9;
  }
LABEL_35:
}

- (BOOL)isTraced
{
  return self->_isTraced;
}

- (BOOL)_prepare:(const char *)a3 withDB:(id)a4 preparationTime:(unint64_t *)a5
{
  id v8 = a4;
  v8[1] = mach_absolute_time();
  int v9 = sqlite3_prepare_v2((sqlite3 *)[v8 dbHandle], a3, -1, &self->_stmt, 0);
  if (a5) {
    *a5 = mach_absolute_time() - v8[1];
  }
  v8[1] = 0;
  if (v9)
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = [v8 dbHandle];
    int v12 = [NSString stringWithUTF8String:a3];
    id v13 = [v10 errorForDB:v11 SQL:v12];
    [v8 setLastError:v13];

    v14 = [v8 sqliteErrorHandler];

    if (v14)
    {
      id v15 = [v8 sqliteErrorHandler];
      sqlite3_int64 v16 = [v8 lastError];
      ((void (**)(void, void *, PQLStatement *, void *))v15)[2](v15, v8, self, v16);
    }
  }

  return v9 == 0;
}

- (PQLStatement)initWithStatement:(id)a3 forDB:(id)a4 preparationTime:(unint64_t *)a5
{
  id v8 = (char *)a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PQLStatement;
  uint64_t v10 = [(PQLStatement *)&v17 init];
  uint64_t v11 = v10;
  if (v10)
  {
    v10->_size_t specLength = *((_WORD *)v8 + 21);
    v10->_isTraced = [v9 isTraced];
    size_t specLength = v11->_specLength;
    if (*((__int16 *)v8 + 21) < 9)
    {
      memcpy(&v11->_specUnion, v8 + 32, v11->_specLength);
    }
    else
    {
      id v13 = (const void *)*((void *)v8 + 4);
      v14 = (unsigned __int8 *)malloc_type_malloc(v11->_specLength, 0x853F0B0AuLL);
      if (!v14) {
        abort();
      }
      id v15 = v14;
      memcpy(v14, v13, specLength);
      v11->_specUnion.ptr = v15;
    }
    if (![(PQLStatement *)v11 _prepare:sqlite3_sql(*((sqlite3_stmt **)v8 + 1)) withDB:v9 preparationTime:a5])
    {

      uint64_t v11 = 0;
    }
  }

  return v11;
}

- (id)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  stmt = self->_stmt;
  if (stmt) {
    id v6 = sqlite3_sql(stmt);
  }
  else {
    id v6 = "INVALIDATED";
  }
  return (id)[v3 stringWithFormat:@"<%@:%p {%s}>", v4, self, v6];
}

@end