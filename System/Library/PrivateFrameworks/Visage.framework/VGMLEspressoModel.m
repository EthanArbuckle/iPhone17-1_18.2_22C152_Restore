@interface VGMLEspressoModel
+ (id)modelVersionWithModelPath:(id)a3;
+ (id)modelVersionWithNetworkFilePath:(id)a3;
- (NSString)networkFilePath;
- (VGMLEspressoModel)initWithModelInfo:(id)a3;
- (VGMLEspressoModel)initWithModelPath:(id)a3;
- (VGMLEspressoModel)initWithNetworkFile:(id)a3;
- (const)getInputDimensions:(unint64_t)a3;
- (const)getOutputDimensions:(unint64_t)a3;
- (id)inferInputs:(id)a3;
- (unint64_t)getInputSize;
- (unint64_t)getOutputSize;
- (unint64_t)getOutputSize:(unint64_t)a3;
- (unint64_t)numInputs;
- (unint64_t)numOutputs;
- (void)dealloc;
- (void)inferInputs:(id)a3 toOutputs:(id)a4;
- (void)inferModel;
@end

@implementation VGMLEspressoModel

+ (id)modelVersionWithNetworkFilePath:(id)a3
{
  v3 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:a3];
  if (v3)
  {
    v4 = [MEMORY[0x263F08900] JSONObjectWithData:v3 options:0 error:0];
    v5 = [v4 objectForKeyedSubscript:@"properties"];
    v6 = [v5 objectForKeyedSubscript:@"network_version"];
  }
  else
  {
    v6 = 0;
  }
  if (v6) {
    v7 = v6;
  }
  else {
    v7 = @"unknown";
  }
  v8 = v7;

  return v8;
}

+ (id)modelVersionWithModelPath:(id)a3
{
  v3 = [a3 stringByAppendingPathComponent:@"model.espresso.net"];
  v4 = [(id)objc_opt_class() modelVersionWithNetworkFilePath:v3];

  return v4;
}

- (VGMLEspressoModel)initWithModelInfo:(id)a3
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)VGMLEspressoModel;
  v5 = [(VGMLEspressoModel *)&v50 init];
  if (v5)
  {
    v41 = [v4 objectForKeyedSubscript:@"config"];
    uint64_t v6 = [v4 objectForKeyedSubscript:@"model_path"];
    networkFilePath = v5->_networkFilePath;
    v5->_networkFilePath = (NSString *)v6;

    if (v5->_networkFilePath)
    {
      uint64_t v8 = [v41 valueForKeyPath:@"input_name"];
      inputLayerNames = v5->_inputLayerNames;
      v5->_inputLayerNames = (NSMutableArray *)v8;

      uint64_t v10 = [v41 valueForKeyPath:@"output_name"];
      outputLayerNames = v5->_outputLayerNames;
      v5->_outputLayerNames = (NSMutableArray *)v10;

      v5->_numInputs = [(NSMutableArray *)v5->_inputLayerNames count];
      v5->_numOutputs = [(NSMutableArray *)v5->_outputLayerNames count];
      v12 = [v41 valueForKey:@"engine"];
      int v13 = 65552;
      if ([v12 isEqualToString:@"ANE"])
      {
        int v14 = 10007;
      }
      else if ([v12 isEqualToString:@"GPU"])
      {
        int v14 = 5;
      }
      else
      {
        [v12 isEqualToString:@"CPU"];
        int v14 = 0;
        int v13 = 65568;
      }
      v5->_engine = v14;
      v5->_storageFormat = v13;
      v5->_context = (void *)espresso_create_context();
      v5->_plan_flags = 0;
      v5->_plan = (void *)espresso_create_plan();
      [(NSString *)v5->_networkFilePath UTF8String];
      espresso_plan_add_network();
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      v16 = v5->_inputLayerNames;
      uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v46 objects:v52 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v47;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v47 != v18) {
              objc_enumerationMutation(v16);
            }
            [*(id *)(*((void *)&v46 + 1) + 8 * i) UTF8String];
            if (espresso_network_declare_input())
            {
              exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
              espresso_plan_get_error_info();
              std::runtime_error::runtime_error(exception, v38);
              __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
            }
          }
          uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v46 objects:v52 count:16];
        }
        while (v17);
      }

      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      v20 = v5->_outputLayerNames;
      uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v42 objects:v51 count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v43;
        do
        {
          for (uint64_t j = 0; j != v21; ++j)
          {
            if (*(void *)v43 != v22) {
              objc_enumerationMutation(v20);
            }
            [*(id *)(*((void *)&v42 + 1) + 8 * j) UTF8String];
            if (espresso_network_declare_output())
            {
              v39 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
              espresso_plan_get_error_info();
              std::runtime_error::runtime_error(v39, v40);
              __cxa_throw(v39, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
            }
          }
          uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v42 objects:v51 count:16];
        }
        while (v21);
      }

      uint64_t v24 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v5->_numInputs];
      inputBuffers = v5->_inputBuffers;
      v5->_inputBuffers = (NSMutableArray *)v24;

      if (v5->_numInputs)
      {
        unint64_t v26 = 0;
        do
        {
          v27 = [VGMLEspressoBuffer alloc];
          v28 = [(NSMutableArray *)v5->_inputLayerNames objectAtIndexedSubscript:v26];
          v29 = [(VGMLEspressoBuffer *)v27 initWithNetwork:&v5->_network withLayerName:v28 withMode:0x10000];
          [(NSMutableArray *)v5->_inputBuffers setObject:v29 atIndexedSubscript:v26];

          ++v26;
        }
        while (v26 < v5->_numInputs);
      }
      uint64_t v30 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v5->_numOutputs];
      outputBuffers = v5->_outputBuffers;
      v5->_outputBuffers = (NSMutableArray *)v30;

      if (v5->_numOutputs)
      {
        unint64_t v32 = 0;
        do
        {
          v33 = [VGMLEspressoBuffer alloc];
          v34 = [(NSMutableArray *)v5->_outputLayerNames objectAtIndexedSubscript:v32];
          v35 = [(VGMLEspressoBuffer *)v33 initWithNetwork:&v5->_network withLayerName:v34 withMode:0x20000];
          [(NSMutableArray *)v5->_outputBuffers setObject:v35 atIndexedSubscript:v32];

          ++v32;
        }
        while (v32 < v5->_numOutputs);
      }
      espresso_plan_build();
      v15 = v5;
    }
    else
    {
      v12 = __VGLogSharedInstance();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v54 = v4;
        _os_log_impl(&dword_260C8D000, v12, OS_LOG_TYPE_ERROR, " No modelpath with info %@ ", buf, 0xCu);
      }
      v15 = 0;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (VGMLEspressoModel)initWithModelPath:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VGMLEspressoModel;
  v5 = [(VGMLEspressoModel *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 stringByAppendingPathComponent:@"config.plist"];
    v7 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithContentsOfFile:v6];
    uint64_t v8 = [v4 stringByAppendingPathComponent:@"model.espresso.net"];
    id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [v9 setObject:v7 forKeyedSubscript:@"config"];
    [v9 setObject:v8 forKeyedSubscript:@"model_path"];
    v5 = [(VGMLEspressoModel *)v5 initWithModelInfo:v9];
  }
  return v5;
}

- (VGMLEspressoModel)initWithNetworkFile:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)VGMLEspressoModel;
  v5 = [(VGMLEspressoModel *)&v34 init];
  if (v5)
  {
    id v33 = 0;
    uint64_t v6 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v4 options:0 error:&v33];
    id v7 = v33;
    if (v7)
    {
      id v8 = v7;
      id v9 = __VGLogSharedInstance();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = [v8 description];
        *(_DWORD *)buf = 138412290;
        long long v43 = v10;
        _os_log_impl(&dword_260C8D000, v9, OS_LOG_TYPE_ERROR, " Failed to read network file. %@ ", buf, 0xCu);
      }
      objc_super v11 = 0;
      goto LABEL_27;
    }
    id v32 = 0;
    id v9 = [MEMORY[0x263F08900] JSONObjectWithData:v6 options:0 error:&v32];
    id v8 = v32;
    v12 = [v9 objectForKeyedSubscript:@"properties"];
    int v13 = v12;
    if (v8 || !v12)
    {
      v25 = __VGLogSharedInstance();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        goto LABEL_25;
      }
      *(_WORD *)buf = 0;
      unint64_t v26 = " Properties field is missing in the network file. ";
    }
    else
    {
      int v14 = [v12 objectForKey:@"network_version"];
      BOOL v15 = v14 == 0;

      if (v15)
      {
        v25 = __VGLogSharedInstance();
        if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          goto LABEL_25;
        }
        *(_WORD *)buf = 0;
        unint64_t v26 = " network_version field is missing in the network properties. ";
      }
      else
      {
        v16 = [v13 objectForKey:@"engine"];
        BOOL v17 = v16 == 0;

        if (v17)
        {
          v25 = __VGLogSharedInstance();
          if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
            goto LABEL_25;
          }
          *(_WORD *)buf = 0;
          unint64_t v26 = " engine field is missing in the network properties. ";
        }
        else
        {
          uint64_t v18 = [v13 objectForKey:@"input_name"];
          BOOL v19 = v18 == 0;

          if (!v19)
          {
            v20 = [v13 objectForKey:@"output_name"];
            BOOL v21 = v20 == 0;

            if (!v21)
            {
              v41[0] = v4;
              v40[0] = @"model_path";
              v40[1] = @"config";
              v35[0] = @"version";
              v31 = [v13 objectForKeyedSubscript:@"network_version"];
              v36 = v31;
              v35[1] = @"engine";
              uint64_t v37 = [v13 objectForKeyedSubscript:@"engine"];
              v35[2] = @"input_name";
              uint64_t v30 = (void *)v37;
              v29 = [v13 objectForKeyedSubscript:@"input_name"];
              v28 = [v29 componentsSeparatedByString:@","];
              v38 = v28;
              v35[3] = @"output_name";
              uint64_t v22 = [v13 objectForKeyedSubscript:@"output_name"];
              v23 = [v22 componentsSeparatedByString:@","];
              v39 = v23;
              uint64_t v24 = [NSDictionary dictionaryWithObjects:&v36 forKeys:v35 count:4];
              v41[1] = v24;
              v25 = [NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:2];

              v5 = [(VGMLEspressoModel *)v5 initWithModelInfo:v25];
              objc_super v11 = v5;
LABEL_26:

LABEL_27:
              goto LABEL_28;
            }
            v25 = __VGLogSharedInstance();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              unint64_t v26 = " output_name is missing in the network properties. ";
              goto LABEL_24;
            }
LABEL_25:
            objc_super v11 = 0;
            goto LABEL_26;
          }
          v25 = __VGLogSharedInstance();
          if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
            goto LABEL_25;
          }
          *(_WORD *)buf = 0;
          unint64_t v26 = " input_name is missing in the network properties. ";
        }
      }
    }
LABEL_24:
    _os_log_impl(&dword_260C8D000, v25, OS_LOG_TYPE_ERROR, v26, buf, 2u);
    goto LABEL_25;
  }
  objc_super v11 = 0;
LABEL_28:

  return v11;
}

- (void)dealloc
{
  espresso_plan_destroy();
  espresso_context_destroy();
  v3.receiver = self;
  v3.super_class = (Class)VGMLEspressoModel;
  [(VGMLEspressoModel *)&v3 dealloc];
}

- (void)inferModel
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (espresso_plan_execute_sync())
  {
    espresso_plan_get_error_info();
    uint64_t v3 = v2;
    id v4 = __VGLogSharedInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315138;
      uint64_t v6 = v3;
      _os_log_impl(&dword_260C8D000, v4, OS_LOG_TYPE_ERROR, " Espresso error: %s ", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (const)getInputDimensions:(unint64_t)a3
{
  uint64_t v3 = [(NSMutableArray *)self->_inputBuffers objectAtIndexedSubscript:a3];
  id v4 = (const unint64_t *)[v3 getDimensions];

  return v4;
}

- (const)getOutputDimensions:(unint64_t)a3
{
  uint64_t v3 = [(NSMutableArray *)self->_outputBuffers objectAtIndexedSubscript:a3];
  id v4 = (const unint64_t *)[v3 getDimensions];

  return v4;
}

- (unint64_t)getInputSize
{
  uint64_t v2 = [(NSMutableArray *)self->_inputBuffers objectAtIndexedSubscript:0];
  unint64_t v3 = [v2 getSize];

  return v3;
}

- (unint64_t)getOutputSize
{
  uint64_t v2 = [(NSMutableArray *)self->_outputBuffers objectAtIndexedSubscript:0];
  unint64_t v3 = [v2 getSize];

  return v3;
}

- (unint64_t)getOutputSize:(unint64_t)a3
{
  unint64_t v3 = [(NSMutableArray *)self->_outputBuffers objectAtIndexedSubscript:a3];
  unint64_t v4 = [v3 getSize];

  return v4;
}

- (void)inferInputs:(id)a3 toOutputs:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  for (unint64_t i = 0; i < [(NSMutableArray *)self->_inputBuffers count]; ++i)
  {
    id v8 = [(NSMutableArray *)self->_inputBuffers objectAtIndexedSubscript:i];
    id v9 = [v13 objectAtIndexedSubscript:i];
    [v8 bindTensor:v9];
  }
  for (unint64_t j = 0; j < [(NSMutableArray *)self->_outputBuffers count]; ++j)
  {
    objc_super v11 = [(NSMutableArray *)self->_outputBuffers objectAtIndexedSubscript:j];
    v12 = [v6 objectAtIndexedSubscript:j];
    [v11 bindTensor:v12];
  }
  [(VGMLEspressoModel *)self inferModel];
}

- (id)inferInputs:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(VGMLEspressoModel *)self numOutputs];
  id v6 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v5];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:v5];
  if (v5)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      id v9 = [(NSMutableArray *)self->_outputBuffers objectAtIndexedSubscript:i];
      uint64_t v10 = [v9 getSize];

      id v11 = [MEMORY[0x263EFF990] dataWithLength:4 * v10];
      v12 = -[VGMLFloatIOData initWithSize:withData:]([VGMLFloatIOData alloc], "initWithSize:withData:", v10, [v11 mutableBytes]);
      [v6 setObject:v12 atIndexedSubscript:i];
      id v13 = [(NSMutableArray *)self->_outputLayerNames objectAtIndexedSubscript:i];
      [v7 setObject:v12 forKey:v13];
    }
  }
  [(VGMLEspressoModel *)self inferInputs:v4 toOutputs:v6];

  return v7;
}

- (unint64_t)numInputs
{
  return self->_numInputs;
}

- (unint64_t)numOutputs
{
  return self->_numOutputs;
}

- (NSString)networkFilePath
{
  return self->_networkFilePath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkFilePath, 0);
  objc_storeStrong((id *)&self->_outputBuffers, 0);
  objc_storeStrong((id *)&self->_inputBuffers, 0);
  objc_storeStrong((id *)&self->_outputLayerNames, 0);

  objc_storeStrong((id *)&self->_inputLayerNames, 0);
}

@end