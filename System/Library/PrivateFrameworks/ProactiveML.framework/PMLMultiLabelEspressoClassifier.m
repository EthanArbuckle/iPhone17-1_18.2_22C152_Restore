@interface PMLMultiLabelEspressoClassifier
+ (id)classifierWithEspressoModelFile:(id)a3;
+ (id)makeStringForShape:(unint64_t)a3[10];
+ (unint64_t)getNumParametersFromShape:(unint64_t)a3[10] rank:(unint64_t)a4;
- (PMLMultiLabelEspressoClassifier)initWithEspressoContext:(void *)a3 espressoPlan:(void *)a4 espressoModel:(id)a5 inputNumParameters:(unint64_t)a6 outputNumReplyClasses:(unint64_t)a7;
- (id)predict:(id)a3;
- (unint64_t)outputDimension;
- (void)dealloc;
@end

@implementation PMLMultiLabelEspressoClassifier

- (id)predict:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = (void *)MEMORY[0x223C7E5C0]();
  [@"inputSequence" cStringUsingEncoding:4];
  int v7 = espresso_network_bind_buffer();
  if (v7)
  {
    int v8 = v7;
    v9 = PML_LogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      LODWORD(v27[0]) = 138412546;
      *(void *)((char *)v27 + 4) = @"inputSequence";
      WORD6(v27[0]) = 1024;
      *(_DWORD *)((char *)v27 + 14) = v8;
      v10 = "Could not bind the input buffer to layer %@ in espresso plan, status code %d";
      v11 = (uint8_t *)v27;
LABEL_7:
      v14 = v9;
      uint32_t v15 = 18;
LABEL_8:
      _os_log_fault_impl(&dword_2212A0000, v14, OS_LOG_TYPE_FAULT, v10, v11, v15);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  [v4 sparseVectorToDense:0 length:self->_inputNumParameters];
  uint64_t v28 = 0;
  memset(v27, 0, sizeof(v27));
  [@"outputLabels" cStringUsingEncoding:4];
  int v12 = espresso_network_bind_buffer();
  if (v12)
  {
    int v13 = v12;
    v9 = PML_LogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412546;
      v24 = @"outputLabels";
      __int16 v25 = 1024;
      int v26 = v13;
      v10 = "Could not bind the output buffer to layer %@ in espresso plan, status code %d";
      v11 = buf;
      goto LABEL_7;
    }
LABEL_11:

    id v19 = 0;
    goto LABEL_12;
  }
  int v16 = espresso_plan_execute_sync();
  if (v16)
  {
    int v18 = v16;
    v9 = PML_LogHandle();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_11;
    }
    *(_DWORD *)buf = 67109120;
    LODWORD(v24) = v18;
    v10 = "Could not execute espresso plan, status code %d";
    v11 = buf;
    v14 = v9;
    uint32_t v15 = 8;
    goto LABEL_8;
  }
  if (self->_outputNumReplyClasses)
  {
    unint64_t v21 = 0;
    do
    {
      LODWORD(v17) = *(_DWORD *)(*(void *)&v27[0] + 4 * v21);
      v22 = [NSNumber numberWithFloat:v17];
      [v5 addObject:v22];

      ++v21;
    }
    while (self->_outputNumReplyClasses > v21);
  }
  id v19 = v5;
LABEL_12:

  return v19;
}

- (PMLMultiLabelEspressoClassifier)initWithEspressoContext:(void *)a3 espressoPlan:(void *)a4 espressoModel:(id)a5 inputNumParameters:(unint64_t)a6 outputNumReplyClasses:(unint64_t)a7
{
  uint64_t v9 = *(void *)&a5.var1;
  var0 = a5.var0;
  v14.receiver = self;
  v14.super_class = (Class)PMLMultiLabelEspressoClassifier;
  result = [(PMLMultiLabelEspressoClassifier *)&v14 init];
  if (result)
  {
    result->_espressoPlan = a4;
    result->_espressoContext = a3;
    result->_espressoModel.plan = var0;
    *(void *)&result->_espressoModel.network_index = v9;
    result->_outputNumReplyClasses = a7;
    result->_inputNumParameters = a6;
  }
  return result;
}

- (void)dealloc
{
  espresso_plan_destroy();
  espresso_context_destroy();
  v3.receiver = self;
  v3.super_class = (Class)PMLMultiLabelEspressoClassifier;
  [(PMLMultiLabelEspressoClassifier *)&v3 dealloc];
}

- (unint64_t)outputDimension
{
  return self->_outputNumReplyClasses;
}

+ (id)classifierWithEspressoModelFile:(id)a3
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t context = espresso_create_context();
  if (!context)
  {
    v11 = PML_LogHandle();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    int v12 = "Could not create espresso context";
LABEL_24:
    int v13 = v11;
    uint32_t v14 = 2;
    goto LABEL_25;
  }
  uint64_t v5 = context;
  uint64_t plan = espresso_create_plan();
  if (!plan)
  {
    v11 = PML_LogHandle();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    int v12 = "Could not create espresso plan";
    goto LABEL_24;
  }
  uint64_t v7 = plan;
  id v8 = v3;
  [v8 UTF8String];
  int v9 = espresso_plan_add_network();
  if (v9)
  {
    int v10 = v9;
    v11 = PML_LogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v8;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 65568;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v10;
      int v12 = "Could not add espresso network from file %@ with storage type %05x, status code %d";
      int v13 = v11;
      uint32_t v14 = 24;
LABEL_25:
      _os_log_fault_impl(&dword_2212A0000, v13, OS_LOG_TYPE_FAULT, v12, buf, v14);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  [@"inputSequence" cStringUsingEncoding:4];
  int v17 = espresso_network_declare_input();
  if (v17)
  {
    int v18 = v17;
    id v19 = PML_LogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = @"inputSequence";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v18;
      v20 = "Could not declare espresso network input %@, status code %d";
LABEL_35:
      _os_log_fault_impl(&dword_2212A0000, v19, OS_LOG_TYPE_FAULT, v20, buf, 0x12u);
      goto LABEL_19;
    }
    goto LABEL_19;
  }
  [@"outputLabels" cStringUsingEncoding:4];
  int v21 = espresso_network_declare_output();
  if (v21)
  {
    int v22 = v21;
    id v19 = PML_LogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = @"outputLabels";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v22;
      v20 = "Could not declare espresso network output %@, status code %d";
      goto LABEL_35;
    }
LABEL_19:

    goto LABEL_10;
  }
  int v23 = espresso_plan_build();
  if (v23)
  {
    int v24 = v23;
    v11 = PML_LogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v24;
      int v12 = "Could not build espresso plan, status code %d";
      int v13 = v11;
      uint32_t v14 = 8;
      goto LABEL_25;
    }
LABEL_9:

LABEL_10:
    uint32_t v15 = 0;
    goto LABEL_11;
  }
  __int16 v25 = (void *)MEMORY[0x223C7E5C0]();
  uint64_t v73 = 0;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  memset(buf, 0, sizeof(buf));
  [@"inputSequence" cStringUsingEncoding:4];
  int v26 = espresso_network_bind_buffer();
  if (v26)
  {
    int v27 = v26;
    uint64_t v28 = PML_LogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v53 = 138412546;
      *(void *)&v53[4] = @"inputSequence";
      *(_WORD *)&v53[12] = 1024;
      *(_DWORD *)&v53[14] = v27;
      uint64_t v29 = "Could not bind the input buffer to layer %@ in espresso plan during initialization, status code %d";
LABEL_32:
      v32 = v53;
LABEL_33:
      _os_log_fault_impl(&dword_2212A0000, v28, OS_LOG_TYPE_FAULT, v29, v32, 0x12u);
      goto LABEL_43;
    }
    goto LABEL_43;
  }
  memset(v63, 0, sizeof(v63));
  int v30 = espresso_buffer_unpack_tensor_shape();
  if (v30)
  {
    int v31 = v30;
    uint64_t v28 = PML_LogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v53 = 138412546;
      *(void *)&v53[4] = @"inputSequence";
      *(_WORD *)&v53[12] = 1024;
      *(_DWORD *)&v53[14] = v31;
      uint64_t v29 = "Unable to get input shape to layer %@ in espresso plan during initialization, status code %d";
      goto LABEL_32;
    }
LABEL_43:

    goto LABEL_10;
  }
  unint64_t v33 = 0x26459E000uLL;
  unint64_t v34 = +[PMLMultiLabelEspressoClassifier getNumParametersFromShape:v63 rank:0];
  v35 = PML_LogHandle();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
  {
    v42 = +[PMLMultiLabelEspressoClassifier makeStringForShape:v63];
    *(_DWORD *)v53 = 138413058;
    *(void *)&v53[4] = @"inputSequence";
    *(_WORD *)&v53[12] = 2048;
    *(void *)&v53[14] = 0;
    *(_WORD *)&v53[22] = 2112;
    *(void *)&v53[24] = v42;
    LOWORD(v54) = 2048;
    *(void *)((char *)&v54 + 2) = v34;
    _os_log_debug_impl(&dword_2212A0000, v35, OS_LOG_TYPE_DEBUG, "Input layer %@ has rank %zu, shape %@, num parameters %tu", v53, 0x2Au);
  }
  uint64_t v62 = 0;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  memset(v53, 0, sizeof(v53));
  [@"outputLabels" cStringUsingEncoding:4];
  int v36 = espresso_network_bind_buffer();
  if (v36)
  {
    int v37 = v36;
    uint64_t v28 = PML_LogHandle();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
      goto LABEL_43;
    }
    LODWORD(v52[0]) = 138412546;
    *(void *)((char *)v52 + 4) = @"outputLabels";
    WORD6(v52[0]) = 1024;
    *(_DWORD *)((char *)v52 + 14) = v37;
    uint64_t v29 = "Could not bind the output buffer to layer %@ in espresso plan during initialization, status code %d";
    v32 = (uint8_t *)v52;
    goto LABEL_33;
  }
  memset(v52, 0, sizeof(v52));
  int v38 = espresso_buffer_unpack_tensor_shape();
  if (v38)
  {
    int v39 = v38;
    uint64_t v28 = PML_LogHandle();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
      goto LABEL_43;
    }
    *(_DWORD *)v44 = 138412546;
    v45 = @"outputLabels";
    __int16 v46 = 1024;
    LODWORD(v47) = v39;
    uint64_t v29 = "Unable to get output shape to layer %@ in espresso plan during initialization, status code %d";
    v32 = v44;
    goto LABEL_33;
  }
  unint64_t v40 = +[PMLMultiLabelEspressoClassifier getNumParametersFromShape:v52 rank:0];
  v41 = PML_LogHandle();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
  {
    v43 = +[PMLMultiLabelEspressoClassifier makeStringForShape:v52];
    *(_DWORD *)v44 = 138413058;
    v45 = @"outputLabels";
    __int16 v46 = 2048;
    uint64_t v47 = 0;
    __int16 v48 = 2112;
    v49 = v43;
    __int16 v50 = 2048;
    unint64_t v51 = v40;
    _os_log_debug_impl(&dword_2212A0000, v41, OS_LOG_TYPE_DEBUG, "Output layer %@ has rank %zu, shape %@, num parameters %tu", v44, 0x2Au);

    unint64_t v33 = 0x26459E000;
  }

  uint32_t v15 = objc_msgSend(objc_alloc(*(Class *)(v33 + 2016)), "initWithEspressoContext:espressoPlan:espressoModel:inputNumParameters:outputNumReplyClasses:", v5, v7, 0, 0, v34, v40);
LABEL_11:

  return v15;
}

+ (unint64_t)getNumParametersFromShape:(unint64_t)a3[10] rank:(unint64_t)a4
{
  if (!a4) {
    return 0;
  }
  unint64_t v4 = 10;
  if (a4 < 0xA) {
    unint64_t v4 = a4;
  }
  unint64_t result = 1;
  do
  {
    uint64_t v6 = *a3++;
    result *= v6;
    --v4;
  }
  while (v4);
  return result;
}

+ (id)makeStringForShape:(unint64_t)a3[10]
{
  unint64_t v4 = objc_opt_new();
  [v4 appendString:@"{"];
  for (uint64_t i = 0; i != 10; ++i)
    objc_msgSend(v4, "appendFormat:", @" %zu", a3[i]);
  [v4 appendString:@" }"];
  return v4;
}

@end