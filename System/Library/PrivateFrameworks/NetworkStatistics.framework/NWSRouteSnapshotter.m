@interface NWSRouteSnapshotter
- (NWSRouteSnapshotter)initWithSource:(id)a3 dest:(id)a4 mask:(id)a5 ifindex:(int)a6;
- (id)snapshot;
- (void)snapshot;
@end

@implementation NWSRouteSnapshotter

- (id)snapshot
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v19 = 0;
  memset(v18, 0, sizeof(v18));
  memset(&v17[1], 0, 128);
  int v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 1007;
  v17[0] = [(NWSSnapshotter *)self kernelSourceRef];
  v3 = [(NWSSnapshotter *)self snapshotSource];
  uint64_t v4 = [v3 send:&v15 length:24 err:&v14];

  if (v4 != 24)
  {
    v9 = NStatGetLog();
    v7 = v9;
    if (v4 < 0)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[NWSRouteSnapshotter snapshot].cold.6();
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      -[NWSRouteSnapshotter snapshot].cold.7();
    }
    goto LABEL_21;
  }
  v5 = [(NWSSnapshotter *)self snapshotSource];
  uint64_t v6 = [v5 recv:&v15 length:272 err:&v14];

  if (v6 <= 271)
  {
    v7 = NStatGetLog();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (v6 < 0)
    {
      if (v8) {
        -[NWSRouteSnapshotter snapshot]();
      }
    }
    else if (v8)
    {
      -[NWSRouteSnapshotter snapshot]();
    }
LABEL_21:

    goto LABEL_22;
  }
  if (v16 != 10006)
  {
    if (v16 == 2)
    {
      v7 = NStatGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[NWSRouteSnapshotter snapshot].cold.5(v7);
      }
    }
    else
    {
      v7 = NStatGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[NWSRouteSnapshotter snapshot]();
      }
    }
    goto LABEL_21;
  }
  uint64_t v10 = v17[0];
  if (v10 == [(NWSSnapshotter *)self kernelSourceRef])
  {
    v11 = [[NWSRouteSnapshot alloc] initWithCounts:&v17[2] routeDescriptor:v18 sourceIdent:[(NWSSnapshotter *)self kernelSourceRef] seqno:0];
    goto LABEL_23;
  }
  v13 = NStatGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    [(NWSRouteSnapshotter *)v17 snapshot];
  }

LABEL_22:
  v11 = 0;
LABEL_23:
  return v11;
}

- (NWSRouteSnapshotter)initWithSource:(id)a3 dest:(id)a4 mask:(id)a5 ifindex:(int)a6
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v26.receiver = self;
  v26.super_class = (Class)NWSRouteSnapshotter;
  v13 = [(NWSRouteSnapshotter *)&v26 init];
  if (!v13) {
    goto LABEL_34;
  }
  uint64_t v28 = 0;
  memset(v27, 0, sizeof(v27));
  if (v11
    && (unint64_t)[v11 length] >= 0x10
    && (unint64_t)[v11 length] < 0x1D)
  {
    if (v12
      && ((unint64_t)[v11 length] < 0x10 || (unint64_t)objc_msgSend(v11, "length") >= 0x1D))
    {
      int v14 = NStatGetLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[NWSRouteSnapshotter initWithSource:dest:mask:ifindex:]0(v12);
      }
      goto LABEL_7;
    }
    *(void *)&v27[0] = v27;
    *((void *)&v27[0] + 1) = 1001;
    *(void *)&v27[1] = 1;
    memset((char *)&v27[1] + 8, 0, 56);
    LODWORD(v28) = a6;
    [v11 getBytes:(char *)&v27[1] + 8 length:28];
    if (v12) {
      [v12 getBytes:(char *)&v27[3] + 4 length:28];
    }
    int v25 = 0;
    uint64_t v16 = [v10 send:v27 length:84 err:&v25];
    if (v16 != 84)
    {
      uint64_t v20 = v16;
      v21 = NStatGetLog();
      int v14 = v21;
      if (v20 < 0)
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          -[NWSRouteSnapshotter snapshot].cold.6();
        }
      }
      else if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        -[NWSRouteSnapshotter initWithSource:dest:mask:ifindex:].cold.9();
      }
      goto LABEL_7;
    }
    uint64_t v17 = [v10 recv:v27 length:88 err:&v25];
    if (v17 <= 31)
    {
      uint64_t v18 = v17;
      int v14 = NStatGetLog();
      BOOL v19 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
      if (v18 < 0)
      {
        if (v19) {
          -[NWSRouteSnapshotter initWithSource:dest:mask:ifindex:]();
        }
      }
      else if (v19)
      {
        -[NWSRouteSnapshotter initWithSource:dest:mask:ifindex:]();
      }
      goto LABEL_7;
    }
    if (DWORD2(v27[0]) != 10001)
    {
      if (DWORD2(v27[0]) == 1)
      {
        int v22 = v27[1];
        int v14 = NStatGetLog();
        BOOL v23 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
        if (v22 == 2)
        {
          if (v23) {
            -[NWSRouteSnapshotter initWithSource:dest:mask:ifindex:].cold.6(v14);
          }
        }
        else if (v23)
        {
          -[NWSRouteSnapshotter initWithSource:dest:mask:ifindex:].cold.7(v14);
        }
      }
      else
      {
        int v14 = NStatGetLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[NWSRouteSnapshotter initWithSource:dest:mask:ifindex:].cold.4();
        }
      }
      goto LABEL_7;
    }
    if (*(_OWORD **)&v27[0] != v27)
    {
      int v14 = NStatGetLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[NWSRouteSnapshotter initWithSource:dest:mask:ifindex:].cold.5((uint64_t *)v27, (uint64_t)v27, v14);
      }
      goto LABEL_7;
    }
    [(NWSSnapshotter *)v13 setKernelSourceRef:*(void *)&v27[1]];
    [(NWSSnapshotter *)v13 setSnapshotSource:v10];
LABEL_34:
    uint64_t v15 = v13;
    goto LABEL_35;
  }
  int v14 = NStatGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[NWSRouteSnapshotter initWithSource:dest:mask:ifindex:](v11, v11 == 0);
  }
LABEL_7:

  uint64_t v15 = 0;
LABEL_35:

  return v15;
}

- (void)snapshot
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  uint64_t v2 = 24;
  _os_log_debug_impl(&dword_21C4BC000, v0, OS_LOG_TYPE_DEBUG, "sent %ld out of %lu", v1, 0x16u);
}

- (void)initWithSource:(void *)a1 dest:(char)a2 mask:ifindex:.cold.1(void *a1, char a2)
{
  if ((a2 & 1) == 0) {
    [a1 length];
  }
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_21C4BC000, v2, v3, "dest check failed  %p %d", v4, v5, v6, v7, v8);
}

- (void)initWithSource:dest:mask:ifindex:.cold.2()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_21C4BC000, v0, v1, "recv  failed %d", v2, v3, v4, v5, v6);
}

- (void)initWithSource:dest:mask:ifindex:.cold.3()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  uint64_t v3 = 32;
  OUTLINED_FUNCTION_4(&dword_21C4BC000, v0, v1, "recv too small, received %ld, expected %lu", v2);
}

- (void)initWithSource:dest:mask:ifindex:.cold.4()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_6();
  int v2 = 10001;
  _os_log_error_impl(&dword_21C4BC000, v0, OS_LOG_TYPE_ERROR, "received wrong message type, received (%u), expected SRC_ADDED(%u)", v1, 0xEu);
}

- (void)initWithSource:(NSObject *)a3 dest:mask:ifindex:.cold.5(uint64_t *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  int v4 = 134218240;
  uint64_t v5 = v3;
  __int16 v6 = 2048;
  uint64_t v7 = a2;
  OUTLINED_FUNCTION_4(&dword_21C4BC000, a3, (uint64_t)a3, "received wrong context, received %llu expected %lu", (uint8_t *)&v4);
}

- (void)initWithSource:(os_log_t)log dest:mask:ifindex:.cold.6(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21C4BC000, log, OS_LOG_TYPE_ERROR, "received non-critical error for SRC_ADDED", v1, 2u);
}

- (void)initWithSource:(NSObject *)a1 dest:mask:ifindex:.cold.7(NSObject *a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  __error();
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_21C4BC000, a1, OS_LOG_TYPE_ERROR, "received error %d for SRC_ADDED", v2, 8u);
}

- (void)initWithSource:dest:mask:ifindex:.cold.9()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  uint64_t v2 = 84;
  _os_log_debug_impl(&dword_21C4BC000, v0, OS_LOG_TYPE_DEBUG, "sent %ld out of %lu", v1, 0x16u);
}

- (void)initWithSource:(void *)a1 dest:mask:ifindex:.cold.10(void *a1)
{
  [a1 length];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_21C4BC000, v1, v2, "mask check failed  %p %d", v3, v4, v5, v6, v7);
}

@end