@interface _PXSimulatedFailingMediaRequest
- (_PXSimulatedFailingMediaRequest)initWithWrappedMediaRequest:(id)a3 error:(id)a4;
- (void)handleOriginalResult:(id)a3 info:(id)a4;
@end

@implementation _PXSimulatedFailingMediaRequest

- (void).cxx_destruct
{
}

- (void)handleOriginalResult:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  v9 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F396F8]];
  char v10 = [v9 BOOLValue];

  if (v10)
  {
    v15.receiver = v8;
    v15.super_class = (Class)_PXSimulatedFailingMediaRequest;
    [(_PXSimulatedMediaRequest *)&v15 handleOriginalResult:v6 info:v7];
  }
  else if (!v8->_didReturnError)
  {
    v11 = (void *)[v7 mutableCopy];
    v12 = v11;
    if (v11) {
      id v13 = v11;
    }
    else {
      id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    v14 = v13;

    [v14 setObject:v8->_error forKeyedSubscript:*MEMORY[0x1E4F39698]];
    v16.receiver = v8;
    v16.super_class = (Class)_PXSimulatedFailingMediaRequest;
    [(_PXSimulatedMediaRequest *)&v16 handleOriginalResult:0 info:v14];
    v8->_didReturnError = 1;
  }
  objc_sync_exit(v8);
}

- (_PXSimulatedFailingMediaRequest)initWithWrappedMediaRequest:(id)a3 error:(id)a4
{
  id v7 = a4;
  v8 = [(_PXSimulatedMediaRequest *)self initWithWrappedMediaRequest:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_error, a4);
  }

  return v9;
}

@end