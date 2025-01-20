@interface QOSErrorMessage
- (ObjcQOSErrorMessageProtocolInternal)underlyingObject;
- (QOSErrorMessage)initWithConfig:(id)a3 logger:(id)a4 metricsRecorder:(id)a5 defaultAlert:(id)a6;
- (id)getLocalizedErrorMessageForItems:(id)a3 usingError:(id)a4;
- (void)fetchLocalizedErrorMessageForItems:(id)a3 usingError:(id)a4 completionHandler:(id)a5;
@end

@implementation QOSErrorMessage

- (QOSErrorMessage)initWithConfig:(id)a3 logger:(id)a4 metricsRecorder:(id)a5 defaultAlert:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v30.receiver = self;
  v30.super_class = (Class)QOSErrorMessage;
  v14 = [(QOSErrorMessage *)&v30 init];
  if (v14)
  {
    v15 = [QOSConfigInternal alloc];
    uint64_t v16 = [v10 appTarget];
    v17 = [v10 locale];
    v18 = [(QOSConfigInternal *)v15 initWithAppTarget:v16 locale:v17];

    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __70__QOSErrorMessage_initWithConfig_logger_metricsRecorder_defaultAlert___block_invoke;
    aBlock[3] = &unk_265482C70;
    id v29 = v11;
    v19 = _Block_copy(aBlock);
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __70__QOSErrorMessage_initWithConfig_logger_metricsRecorder_defaultAlert___block_invoke_2;
    v26[3] = &unk_265482C98;
    id v27 = v13;
    v20 = _Block_copy(v26);
    id v25 = 0;
    uint64_t v21 = +[QOSErrorMessageInternal getObjcInstanceWithConfig:v18 error:&v25 logger:v19 metricsRecorder:v12 defaultAlert:v20];
    id v22 = v25;
    underlyingObject = v14->_underlyingObject;
    v14->_underlyingObject = (ObjcQOSErrorMessageProtocolInternal *)v21;
  }
  return v14;
}

uint64_t __70__QOSErrorMessage_initWithConfig_logger_metricsRecorder_defaultAlert___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

QOSAlertMessageInternal *__70__QOSErrorMessage_initWithConfig_logger_metricsRecorder_defaultAlert___block_invoke_2(uint64_t a1)
{
  v1 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v2 = [QOSAlertMessageInternal alloc];
  v3 = [v1 title];
  v4 = [v1 body];
  v5 = [(QOSAlertMessageInternal *)v2 initWithTitle:v3 body:v4];

  return v5;
}

- (id)getLocalizedErrorMessageForItems:(id)a3 usingError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_initWeak(&location, self);
  v9 = [(QOSErrorMessage *)self underlyingObject];
  id v10 = [v9 getLocalizedErrorMessageForItems:v6 :v7];

  id v11 = [QOSAlertMessage alloc];
  id v12 = [v10 title];
  id v13 = [v10 body];
  v14 = [(QOSAlertMessage *)v11 initWithTitle:v12 body:v13];

  objc_destroyWeak(&location);

  return v14;
}

- (void)fetchLocalizedErrorMessageForItems:(id)a3 usingError:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_initWeak(&location, self);
  id v12 = [(QOSErrorMessage *)self underlyingObject];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __83__QOSErrorMessage_fetchLocalizedErrorMessageForItems_usingError_completionHandler___block_invoke;
  v14[3] = &unk_265482CE8;
  id v13 = v10;
  id v15 = v13;
  [v12 fetchLocalizedErrorMessageForItems:v8 :v9 completionHandler:v14];

  objc_destroyWeak(&location);
}

void __83__QOSErrorMessage_fetchLocalizedErrorMessageForItems_usingError_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [QOSAlertMessage alloc];
  v5 = [v3 title];
  id v6 = [v3 body];

  id v7 = [(QOSAlertMessage *)v4 initWithTitle:v5 body:v6];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __83__QOSErrorMessage_fetchLocalizedErrorMessageForItems_usingError_completionHandler___block_invoke_2;
  v10[3] = &unk_265482CC0;
  id v8 = *(id *)(a1 + 32);
  id v11 = v7;
  id v12 = v8;
  id v9 = v7;
  dispatch_async(MEMORY[0x263EF83A0], v10);
}

uint64_t __83__QOSErrorMessage_fetchLocalizedErrorMessageForItems_usingError_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (ObjcQOSErrorMessageProtocolInternal)underlyingObject
{
  return (ObjcQOSErrorMessageProtocolInternal *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end