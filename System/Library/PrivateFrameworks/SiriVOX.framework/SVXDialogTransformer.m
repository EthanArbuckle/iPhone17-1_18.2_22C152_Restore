@interface SVXDialogTransformer
- (SVXDialogTransformer)initWithModeProvider:(id)a3;
- (id)transformAddDialogs:(id)a3;
- (id)transformAddDialogs:(id)a3 forMode:(unint64_t)a4;
- (id)transformAddViews:(id)a3;
- (id)transformAddViews:(id)a3 forMode:(unint64_t)a4;
@end

@implementation SVXDialogTransformer

- (void).cxx_destruct
{
}

- (id)transformAddViews:(id)a3 forMode:(unint64_t)a4
{
  return (id)[MEMORY[0x263F713F0] transformAddViews:a3 forMode:a4];
}

- (id)transformAddDialogs:(id)a3 forMode:(unint64_t)a4
{
  return (id)[MEMORY[0x263F713F0] transformAddDialogs:a3 forMode:a4];
}

- (id)transformAddDialogs:(id)a3
{
  modeProvider = self->_modeProvider;
  id v5 = a3;
  v6 = [(SVXDialogTransformer *)self transformAddDialogs:v5 forMode:[(MDModeProviding *)modeProvider currentMode]];

  return v6;
}

- (id)transformAddViews:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(MDModeProviding *)self->_modeProvider currentMode];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v6 = objc_msgSend(v4, "views", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v6);
        }
        if (objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "svx_isResponseViewIdPresent"))
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v25 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  v10 = [v4 patternId];

  if ((v7 & 1) != 0 || v10)
  {
    id v14 = v4;
  }
  else
  {
    v11 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      v12 = v11;
      v13 = [v4 responseMode];
      *(_DWORD *)buf = 136315394;
      v22 = "-[SVXDialogTransformer transformAddViews:]";
      __int16 v23 = 2112;
      v24 = v13;
      _os_log_impl(&dword_220062000, v12, OS_LOG_TYPE_INFO, "%s patternId is nil and responseViewIdPresent is false. Calling on MDDialogTransformer for mode: %@", buf, 0x16u);
    }
    id v14 = [(SVXDialogTransformer *)self transformAddViews:v4 forMode:v5];
  }
  v15 = v14;

  return v15;
}

- (SVXDialogTransformer)initWithModeProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SVXDialogTransformer;
  v6 = [(SVXDialogTransformer *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_modeProvider, a3);
  }

  return v7;
}

@end