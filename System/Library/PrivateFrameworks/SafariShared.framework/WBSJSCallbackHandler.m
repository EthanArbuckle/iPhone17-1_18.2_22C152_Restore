@interface WBSJSCallbackHandler
- (JSValue)jsValue;
- (OpaqueJSContext)globalContext;
- (WBSJSCallbackHandler)initWithCallbackFunction:(OpaqueJSValue *)a3 errorReporter:(id)a4 context:(OpaqueJSContext *)a5;
- (WBSJSCallbackHandler)initWithErrorReporter:(id)a3 context:(OpaqueJSContext *)a4;
- (WBSJSCallbackHandler)initWithPromiseResolveFunction:(OpaqueJSValue *)a3 rejectFunction:(OpaqueJSValue *)a4 context:(OpaqueJSContext *)a5;
- (id).cxx_construct;
- (id)call;
- (id)callWithArgument:(id)a3;
- (id)callWithArgument:(id)a3 argument:(id)a4;
- (id)callWithArgument:(id)a3 argument:(id)a4 argument:(id)a5;
- (void)dealloc;
- (void)reportErrorWithMessage:(id)a3;
@end

@implementation WBSJSCallbackHandler

- (WBSJSCallbackHandler)initWithCallbackFunction:(OpaqueJSValue *)a3 errorReporter:(id)a4 context:(OpaqueJSContext *)a5
{
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)WBSJSCallbackHandler;
  v9 = [(WBSJSCallbackHandler *)&v16 init];
  v10 = v9;
  if (v9)
  {
    v9->_callbackFunction = a3;
    objc_storeWeak((id *)&v9->_errorReporter, v8);
    GlobalContext = JSContextGetGlobalContext(a5);
    v12 = GlobalContext;
    if (GlobalContext) {
      JSGlobalContextRetain(GlobalContext);
    }
    m_ptr = v10->_globalContext.m_ptr;
    v10->_globalContext.m_ptr = v12;
    if (m_ptr)
    {
      JSGlobalContextRelease(m_ptr);
      v12 = v10->_globalContext.m_ptr;
    }
    JSValueProtect(v12, v10->_callbackFunction);
    v14 = v10;
  }

  return v10;
}

- (WBSJSCallbackHandler)initWithErrorReporter:(id)a3 context:(OpaqueJSContext *)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WBSJSCallbackHandler;
  v7 = [(WBSJSCallbackHandler *)&v14 init];
  id v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_errorReporter, v6);
    GlobalContext = JSContextGetGlobalContext(a4);
    v10 = GlobalContext;
    if (GlobalContext) {
      JSGlobalContextRetain(GlobalContext);
    }
    m_ptr = v8->_globalContext.m_ptr;
    v8->_globalContext.m_ptr = v10;
    if (m_ptr) {
      JSGlobalContextRelease(m_ptr);
    }
    v12 = v8;
  }

  return v8;
}

- (WBSJSCallbackHandler)initWithPromiseResolveFunction:(OpaqueJSValue *)a3 rejectFunction:(OpaqueJSValue *)a4 context:(OpaqueJSContext *)a5
{
  v16.receiver = self;
  v16.super_class = (Class)WBSJSCallbackHandler;
  id v8 = [(WBSJSCallbackHandler *)&v16 init];
  v9 = v8;
  if (v8)
  {
    v8->_callbackFunction = a3;
    v8->_rejectFunction = a4;
    GlobalContext = JSContextGetGlobalContext(a5);
    v11 = GlobalContext;
    if (GlobalContext) {
      JSGlobalContextRetain(GlobalContext);
    }
    m_ptr = v9->_globalContext.m_ptr;
    v9->_globalContext.m_ptr = v11;
    if (m_ptr)
    {
      JSGlobalContextRelease(m_ptr);
      v11 = v9->_globalContext.m_ptr;
    }
    JSValueProtect(v11, v9->_callbackFunction);
    rejectFunction = v9->_rejectFunction;
    if (rejectFunction) {
      JSValueProtect(v9->_globalContext.m_ptr, rejectFunction);
    }
    objc_super v14 = v9;
  }

  return v9;
}

- (void)dealloc
{
  callbackFunction = self->_callbackFunction;
  if (callbackFunction) {
    JSValueUnprotect(self->_globalContext.m_ptr, callbackFunction);
  }
  rejectFunction = self->_rejectFunction;
  if (rejectFunction) {
    JSValueUnprotect(self->_globalContext.m_ptr, rejectFunction);
  }
  v5.receiver = self;
  v5.super_class = (Class)WBSJSCallbackHandler;
  [(WBSJSCallbackHandler *)&v5 dealloc];
}

- (OpaqueJSContext)globalContext
{
  return self->_globalContext.m_ptr;
}

- (JSValue)jsValue
{
  v2 = (void *)MEMORY[0x1E4F30938];
  callbackFunction = self->_callbackFunction;
  v4 = [MEMORY[0x1E4F30920] contextWithJSGlobalContextRef:self->_globalContext.m_ptr];
  objc_super v5 = [v2 valueWithJSValueRef:callbackFunction inContext:v4];

  return (JSValue *)v5;
}

- (void)reportErrorWithMessage:(id)a3
{
  id v4 = a3;
  WeakRetained = (const OpaqueJSContext *)objc_loadWeakRetained((id *)&self->_errorReporter);
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    [(OpaqueJSContext *)WeakRetained reportErrorForCallbackHandler:self withMessage:v4 context:self->_globalContext.m_ptr];
  }
  else
  {
    if (!self->_rejectFunction) {
      goto LABEL_4;
    }
    v7 = (void *)MEMORY[0x1E4F30938];
    id v8 = [MEMORY[0x1E4F30920] contextWithJSGlobalContextRef:self->_globalContext.m_ptr];
    id v6 = [v7 valueWithNewErrorFromMessage:v4 inContext:v8];

    rejectFunction = self->_rejectFunction;
    m_ptr = self->_globalContext.m_ptr;
    JSGlobalContextRef ctx = m_ptr;
    if (m_ptr)
    {
      JSGlobalContextRetain(m_ptr);
      m_ptr = self->_globalContext.m_ptr;
    }
    v12 = (const OpaqueJSValue *)SafariShared::JSUtilities::translateNSToJSValueForJSCallbackHandler(m_ptr, v6, v9);
    id v13 = callWithArguments<1ul>(rejectFunction, &ctx, v12);
    if (ctx) {
      JSGlobalContextRelease(ctx);
    }
  }

LABEL_4:
}

- (id)call
{
  callbackFunction = self->_callbackFunction;
  if (callbackFunction)
  {
    m_ptr = self->_globalContext.m_ptr;
    JSGlobalContextRef ctx = m_ptr;
    if (m_ptr) {
      JSGlobalContextRetain(m_ptr);
    }
    callWithArguments<0ul>(callbackFunction, &ctx);
    callbackFunction = (OpaqueJSValue *)objc_claimAutoreleasedReturnValue();
    if (ctx) {
      JSGlobalContextRelease(ctx);
    }
  }
  return callbackFunction;
}

- (id)callWithArgument:(id)a3
{
  objc_super v5 = (const OpaqueJSContext *)a3;
  callbackFunction = self->_callbackFunction;
  if (callbackFunction)
  {
    m_ptr = self->_globalContext.m_ptr;
    JSGlobalContextRef ctx = m_ptr;
    if (m_ptr)
    {
      JSGlobalContextRetain(m_ptr);
      m_ptr = self->_globalContext.m_ptr;
    }
    id v8 = (const OpaqueJSValue *)SafariShared::JSUtilities::translateNSToJSValueForJSCallbackHandler(m_ptr, v5, v4);
    callWithArguments<1ul>(callbackFunction, &ctx, v8);
    callbackFunction = (OpaqueJSValue *)objc_claimAutoreleasedReturnValue();
    if (ctx) {
      JSGlobalContextRelease(ctx);
    }
  }

  return callbackFunction;
}

- (id)callWithArgument:(id)a3 argument:(id)a4
{
  id v6 = (const OpaqueJSContext *)a3;
  id v8 = (const OpaqueJSContext *)a4;
  callbackFunction = self->_callbackFunction;
  if (callbackFunction)
  {
    m_ptr = self->_globalContext.m_ptr;
    JSGlobalContextRef ctx = m_ptr;
    if (m_ptr)
    {
      JSGlobalContextRetain(m_ptr);
      m_ptr = self->_globalContext.m_ptr;
    }
    v11 = (const OpaqueJSValue *)SafariShared::JSUtilities::translateNSToJSValueForJSCallbackHandler(m_ptr, v6, v7);
    id v13 = (const OpaqueJSValue *)SafariShared::JSUtilities::translateNSToJSValueForJSCallbackHandler(self->_globalContext.m_ptr, v8, v12);
    callWithArguments<2ul>(callbackFunction, &ctx, v11, v13);
    callbackFunction = (OpaqueJSValue *)objc_claimAutoreleasedReturnValue();
    if (ctx) {
      JSGlobalContextRelease(ctx);
    }
  }

  return callbackFunction;
}

- (id)callWithArgument:(id)a3 argument:(id)a4 argument:(id)a5
{
  id v8 = (const OpaqueJSContext *)a3;
  v9 = (const OpaqueJSContext *)a4;
  v11 = (const OpaqueJSContext *)a5;
  callbackFunction = self->_callbackFunction;
  if (callbackFunction)
  {
    m_ptr = self->_globalContext.m_ptr;
    JSGlobalContextRef ctx = m_ptr;
    if (m_ptr)
    {
      JSGlobalContextRetain(m_ptr);
      m_ptr = self->_globalContext.m_ptr;
    }
    v17[0] = (JSValueRef)SafariShared::JSUtilities::translateNSToJSValueForJSCallbackHandler(m_ptr, v8, v10);
    v17[1] = (JSValueRef)SafariShared::JSUtilities::translateNSToJSValueForJSCallbackHandler(self->_globalContext.m_ptr, v9, v14);
    v17[2] = (JSValueRef)SafariShared::JSUtilities::translateNSToJSValueForJSCallbackHandler(self->_globalContext.m_ptr, v11, v15);
    callWithArguments<3ul>(callbackFunction, &ctx, v17);
    callbackFunction = (OpaqueJSValue *)objc_claimAutoreleasedReturnValue();
    if (ctx) {
      JSGlobalContextRelease(ctx);
    }
  }

  return callbackFunction;
}

- (void).cxx_destruct
{
  m_ptr = self->_globalContext.m_ptr;
  if (m_ptr) {
    JSGlobalContextRelease(m_ptr);
  }
  objc_destroyWeak((id *)&self->_errorReporter);
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  return self;
}

@end