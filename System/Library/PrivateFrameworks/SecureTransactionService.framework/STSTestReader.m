@interface STSTestReader
- (id)startWithHandoverType:(unint64_t)a3 connectionHandler:(id)a4 invalidationErrorHandler:(id)a5 completion:(id)a6;
- (id)startWithHandoverType:(unint64_t)a3 connectionHandler:(id)a4 invalidationHandler:(id)a5 completion:(id)a6;
- (id)startWithHandoverType:(unint64_t)a3 tnepStatusHandler:(id)a4 connectionHandler:(id)a5 invalidationErrorHandler:(id)a6 completion:(id)a7;
- (void)sendDocumentRequest:(id)a3 timeoutInterval:(double)a4 responseHandler:(id)a5;
@end

@implementation STSTestReader

- (id)startWithHandoverType:(unint64_t)a3 connectionHandler:(id)a4 invalidationHandler:(id)a5 completion:(id)a6
{
  id v10 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = sub_221195244;
  v14[3] = &unk_264594A88;
  id v15 = v10;
  id v11 = v10;
  v12 = [(STSTestReader *)self startWithHandoverType:a3 tnepStatusHandler:0 connectionHandler:a4 invalidationErrorHandler:v14 completion:a6];

  return v12;
}

- (id)startWithHandoverType:(unint64_t)a3 connectionHandler:(id)a4 invalidationErrorHandler:(id)a5 completion:(id)a6
{
  return [(STSTestReader *)self startWithHandoverType:a3 tnepStatusHandler:0 connectionHandler:a4 invalidationErrorHandler:a5 completion:a6];
}

- (id)startWithHandoverType:(unint64_t)a3 tnepStatusHandler:(id)a4 connectionHandler:(id)a5 invalidationErrorHandler:(id)a6 completion:(id)a7
{
  id v12 = a5;
  id v13 = a7;
  id v14 = a6;
  id v15 = a4;
  v16 = _os_activity_create(&dword_221170000, "startWithHandoverType:tnepStatusHandler:connectionHandler:invalidationHandler:completion:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v16, &state);
  os_activity_scope_leave(&state);

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_2211953D8;
  aBlock[3] = &unk_264594D30;
  id v23 = v12;
  id v17 = v12;
  v18 = _Block_copy(aBlock);
  v21.receiver = self;
  v21.super_class = (Class)STSTestReader;
  v19 = [(STSReader *)&v21 startWithHandoverType:a3 connectionHandler:v18 tnepStatusHandler:v15 invalidationErrorHandler:v14 completion:v13];

  return v19;
}

- (void)sendDocumentRequest:(id)a3 timeoutInterval:(double)a4 responseHandler:(id)a5
{
}

@end