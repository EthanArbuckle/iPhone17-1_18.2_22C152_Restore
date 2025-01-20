@interface TUIIDMSDeviceSource
- (NSMutableDictionary)idmsDevices;
- (TUIIDMSDeviceSource)initWithIdmsDeviceProtocol:(id)a3;
- (TransparencyIDMSDeviceProtocol)d;
- (id)mapDeviceWithMissing:(id)a3 aaDevices:(id)a4;
- (void)setD:(id)a3;
- (void)setIdmsDevices:(id)a3;
@end

@implementation TUIIDMSDeviceSource

- (TUIIDMSDeviceSource)initWithIdmsDeviceProtocol:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TUIIDMSDeviceSource;
  v5 = [(TUIIDMSDeviceSource *)&v10 init];
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      [(TUIIDMSDeviceSource *)v5 setD:v4];
    }
    else
    {
      id v7 = objc_alloc_init(MEMORY[0x263F80D60]);
      [(TUIIDMSDeviceSource *)v6 setD:v7];
    }
    v8 = v6;
  }

  return v6;
}

- (id)mapDeviceWithMissing:(id)a3 aaDevices:(id)a4
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(TUIIDMSDeviceSource *)self idmsDevices];

  if (!v8)
  {
    id v49 = v7;
    v9 = [MEMORY[0x263EFF9A0] dictionary];
    [(TUIIDMSDeviceSource *)self setIdmsDevices:v9];

    objc_super v10 = [(TUIIDMSDeviceSource *)self d];
    id v66 = 0;
    v11 = [v10 transparencyIDMSDeviceList:&v66];
    id v12 = v66;

    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v13 = v11;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v62 objects:v69 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v63;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v63 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v62 + 1) + 8 * i);
          v19 = [v18 pushToken];

          if (v19)
          {
            v20 = [(TUIIDMSDeviceSource *)self idmsDevices];
            v21 = [v18 pushToken];
            [v20 setObject:v18 forKeyedSubscript:v21];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v62 objects:v69 count:16];
      }
      while (v15);
    }

    id v7 = v49;
  }
  v22 = [(TUIIDMSDeviceSource *)self idmsDevices];
  v23 = [v22 objectForKeyedSubscript:v6];

  if (v23)
  {
    v24 = [MEMORY[0x263EFF980] array];
    v25 = [(TUIIDMSDeviceSource *)self idmsDevices];
    v59[0] = MEMORY[0x263EF8330];
    v59[1] = 3221225472;
    v59[2] = __54__TUIIDMSDeviceSource_mapDeviceWithMissing_aaDevices___block_invoke_27;
    v59[3] = &unk_265552F98;
    id v60 = v23;
    id v26 = v24;
    id v61 = v26;
    [v25 enumerateKeysAndObjectsUsingBlock:v59];

    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v27 = v26;
    uint64_t v45 = [v27 countByEnumeratingWithState:&v55 objects:v68 count:16];
    if (v45)
    {
      uint64_t v28 = *(void *)v56;
      id v48 = v6;
      id v50 = v7;
      v46 = v27;
      v47 = v23;
      uint64_t v44 = *(void *)v56;
      do
      {
        uint64_t v29 = 0;
        do
        {
          if (*(void *)v56 != v28) {
            objc_enumerationMutation(v27);
          }
          v30 = *(void **)(*((void *)&v55 + 1) + 8 * v29);
          long long v51 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          long long v54 = 0u;
          id v31 = v7;
          uint64_t v32 = [v31 countByEnumeratingWithState:&v51 objects:v67 count:16];
          if (v32)
          {
            uint64_t v33 = v32;
            uint64_t v34 = *(void *)v52;
            while (2)
            {
              for (uint64_t j = 0; j != v33; ++j)
              {
                if (*(void *)v52 != v34) {
                  objc_enumerationMutation(v31);
                }
                v36 = *(void **)(*((void *)&v51 + 1) + 8 * j);
                v37 = objc_msgSend(v36, "pushToken", v44);

                if (v37)
                {
                  v38 = [v30 pushToken];
                  v39 = [v36 pushToken];
                  char v40 = [v38 isEqual:v39];

                  if (v40)
                  {
                    id v41 = v36;

                    id v6 = v48;
                    id v7 = v50;
                    id v27 = v46;
                    v23 = v47;
                    goto LABEL_37;
                  }
                }
              }
              uint64_t v33 = [v31 countByEnumeratingWithState:&v51 objects:v67 count:16];
              if (v33) {
                continue;
              }
              break;
            }
          }

          ++v29;
          id v27 = v46;
          id v6 = v48;
          id v7 = v50;
          v23 = v47;
          uint64_t v28 = v44;
        }
        while (v29 != v45);
        id v41 = 0;
        uint64_t v45 = [v46 countByEnumeratingWithState:&v55 objects:v68 count:16];
      }
      while (v45);
    }
    else
    {
      id v41 = 0;
    }
LABEL_37:
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK, &__block_literal_global);
    }
    v42 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_ERROR)) {
      -[TUIIDMSDeviceSource mapDeviceWithMissing:aaDevices:]((uint64_t)v6, (uint64_t)self, v42);
    }
    id v41 = 0;
  }

  return v41;
}

uint64_t __54__TUIIDMSDeviceSource_mapDeviceWithMissing_aaDevices___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __54__TUIIDMSDeviceSource_mapDeviceWithMissing_aaDevices___block_invoke_27(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  id v4 = [v7 serial];
  v5 = [*(id *)(a1 + 32) serial];
  int v6 = [v4 isEqual:v5];

  if (v6) {
    [*(id *)(a1 + 40) addObject:v7];
  }
}

- (TransparencyIDMSDeviceProtocol)d
{
  return (TransparencyIDMSDeviceProtocol *)objc_getProperty(self, a2, 8, 1);
}

- (void)setD:(id)a3
{
}

- (NSMutableDictionary)idmsDevices
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIdmsDevices:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idmsDevices, 0);
  objc_storeStrong((id *)&self->_d, 0);
}

- (void)mapDeviceWithMissing:(os_log_t)log aaDevices:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = 136315650;
  id v4 = "-[TUIIDMSDeviceSource mapDeviceWithMissing:aaDevices:]";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 2114;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_260338000, log, OS_LOG_TYPE_ERROR, "%s device unknown for IDMS list too: %@ on %{public}@", (uint8_t *)&v3, 0x20u);
}

@end