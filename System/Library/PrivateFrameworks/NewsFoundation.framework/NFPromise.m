@interface NFPromise
+ (NFPromise)new;
+ (id)asDelay:(double)a3 onQueue:(id)a4 withError:(id)a5;
+ (id)asDelay:(double)a3 onQueue:(id)a4 withValue:(id)a5;
+ (id)asDelay:(double)a3 withError:(id)a4;
+ (id)asDelay:(double)a3 withValue:(id)a4;
+ (id)asVoid;
+ (id)asVoid:(id)a3;
+ (id)firstly:(id)a3;
- (NFPromise)init;
- (NFPromise)initWithError:(id)a3;
- (NFPromise)initWithResolver:(id)a3;
- (NFPromise)initWithValue:(id)a3;
- (NFPromiseSeal)seal;
- (id)always:(id)a3;
- (id)alwaysOn:(id)a3 always:(id)a4;
- (id)delay;
- (id)delayOn;
- (id)error;
- (id)error:(id)a3;
- (id)errorOn;
- (id)errorOn:(id)a3 error:(id)a4;
- (id)pipe;
- (id)pipeOn;
- (id)resolve;
- (id)resolveOn;
- (id)then;
- (id)then:(id)a3;
- (id)thenOn;
- (id)thenOn:(id)a3 then:(id)a4;
- (id)timeoutAfter:(double)a3;
- (id)timeoutAfter:(double)a3 on:(id)a4;
- (void)dealloc;
- (void)setSeal:(id)a3;
@end

@implementation NFPromise

- (void).cxx_destruct
{
}

- (id)alwaysOn:(id)a3 always:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(NFPromise *)self seal];
  [v8 alwaysOn:v7 always:v6];

  return self;
}

+ (id)firstly:(id)a3
{
  return (id)(*((uint64_t (**)(id))a3 + 2))(a3);
}

- (id)errorOn:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(NFPromise *)self seal];
  [v8 resolveOn:v7 reject:v6 resolve:&__block_literal_global_24];

  return self;
}

- (id)thenOn:(id)a3 then:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [NFPromise alloc];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __25__NFPromise_thenOn_then___block_invoke;
  v13[3] = &unk_264485AC8;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v9 = v7;
  id v10 = v6;
  v11 = [(NFPromise *)v8 initWithResolver:v13];

  return v11;
}

- (NFPromise)initWithResolver:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NFPromise;
  v5 = [(NFPromise *)&v13 init];
  if (v5)
  {
    id v6 = objc_alloc_init(NFPromiseSeal);
    seal = v5->_seal;
    v5->_seal = v6;

    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __30__NFPromise_initWithResolver___block_invoke;
    v11[3] = &unk_264485A28;
    v12 = v5;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __30__NFPromise_initWithResolver___block_invoke_2;
    v9[3] = &unk_264485A50;
    id v10 = v12;
    (*((void (**)(id, void *, void *))v4 + 2))(v4, v11, v9);
  }
  return v5;
}

void __25__NFPromise_thenOn_then___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [a1[4] seal];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __25__NFPromise_thenOn_then___block_invoke_2;
  v11[3] = &unk_264485AA0;
  id v8 = a1[5];
  id v13 = a1[6];
  id v12 = a1[5];
  id v14 = v6;
  id v15 = v5;
  id v9 = v5;
  id v10 = v6;
  [v7 resolveOn:v8 reject:v10 resolve:v11];
}

void __30__NFPromise_initWithResolver___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 seal];
  [v4 resolve:v3];
}

- (NFPromiseSeal)seal
{
  return self->_seal;
}

void __25__NFPromise_thenOn_then___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (id v5 = v4) != 0)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __25__NFPromise_thenOn_then___block_invoke_3;
    v8[3] = &unk_264485A78;
    id v6 = v5;
    id v9 = v6;
    id v10 = *(id *)(a1 + 32);
    id v11 = *(id *)(a1 + 48);
    id v12 = *(id *)(a1 + 56);
    __25__NFPromise_thenOn_then___block_invoke_3((uint64_t)v8);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = 0;
    }
    else {
      id v7 = v4;
    }
    (*(void (**)(void, void *))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v7);
  }
}

- (void)dealloc
{
  [(NFPromise *)self setSeal:0];
  v3.receiver = self;
  v3.super_class = (Class)NFPromise;
  [(NFPromise *)&v3 dealloc];
}

- (void)setSeal:(id)a3
{
}

void __25__NFPromise_thenOn_then___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) seal];
  [v2 resolveOn:*(void *)(a1 + 40) reject:*(void *)(a1 + 48) resolve:*(void *)(a1 + 56)];
}

void __30__NFPromise_initWithResolver___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 seal];
  [v4 reject:v3];
}

+ (id)asVoid
{
  id v2 = [NFPromise alloc];
  id v3 = objc_opt_new();
  id v4 = [(NFPromise *)v2 initWithValue:v3];

  return v4;
}

- (NFPromise)initWithValue:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFPromise;
  id v5 = [(NFPromise *)&v9 init];
  if (v5)
  {
    id v6 = [[NFPromiseSeal alloc] initWithValue:v4];
    seal = v5->_seal;
    v5->_seal = v6;
  }
  return v5;
}

- (id)error:(id)a3
{
  return [(NFPromise *)self errorOn:MEMORY[0x263EF83A0] error:a3];
}

uint64_t __19__NFPromise_thenOn__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) thenOn:a2 then:a3];
}

- (id)then:(id)a3
{
  return [(NFPromise *)self thenOn:MEMORY[0x263EF83A0] then:a3];
}

- (id)thenOn
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __19__NFPromise_thenOn__block_invoke;
  v4[3] = &unk_264485B38;
  v4[4] = self;
  id v2 = (void *)MEMORY[0x223C1A400](v4, a2);
  return v2;
}

- (NFPromise)init
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    id v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    id v8 = "-[NFPromise init]";
    __int16 v9 = 2080;
    id v10 = "NFPromise.m";
    __int16 v11 = 1024;
    int v12 = 56;
    __int16 v13 = 2114;
    id v14 = v2;
    _os_log_error_impl(&dword_21DE44000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  id v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[NFPromise init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

+ (NFPromise)new
{
  id v2 = objc_alloc((Class)a1);
  return (NFPromise *)[v2 initWithValue:0];
}

- (NFPromise)initWithError:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFPromise;
  id v5 = [(NFPromise *)&v9 init];
  if (v5)
  {
    id v6 = [[NFPromiseSeal alloc] initWithError:v4];
    seal = v5->_seal;
    v5->_seal = v6;
  }
  return v5;
}

- (id)always:(id)a3
{
  return [(NFPromise *)self alwaysOn:MEMORY[0x263EF83A0] always:a3];
}

- (id)then
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __17__NFPromise_then__block_invoke;
  v4[3] = &unk_264485B10;
  v4[4] = self;
  id v2 = (void *)MEMORY[0x223C1A400](v4, a2);
  return v2;
}

uint64_t __17__NFPromise_then__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) then:a2];
}

- (id)pipe
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __17__NFPromise_pipe__block_invoke;
  v4[3] = &unk_264485B88;
  v4[4] = self;
  id v2 = (void *)MEMORY[0x223C1A400](v4, a2);
  return v2;
}

id __17__NFPromise_pipe__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __17__NFPromise_pipe__block_invoke_2;
  v8[3] = &unk_264485B60;
  id v9 = v3;
  id v5 = v3;
  id v6 = [v4 then:v8];

  return v6;
}

id __17__NFPromise_pipe__block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)pipeOn
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __19__NFPromise_pipeOn__block_invoke;
  v4[3] = &unk_264485BB0;
  v4[4] = self;
  id v2 = (void *)MEMORY[0x223C1A400](v4, a2);
  return v2;
}

id __19__NFPromise_pipeOn__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __19__NFPromise_pipeOn__block_invoke_2;
  v10[3] = &unk_264485B60;
  id v11 = v5;
  id v7 = v5;
  id v8 = [v6 thenOn:a2 then:v10];

  return v8;
}

id __19__NFPromise_pipeOn__block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)error
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __18__NFPromise_error__block_invoke;
  v4[3] = &unk_264485BD8;
  v4[4] = self;
  id v2 = (void *)MEMORY[0x223C1A400](v4, a2);
  return v2;
}

id __18__NFPromise_error__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = zalgoIfMain();
  id v5 = [v2 errorOn:v4 error:v3];

  return v5;
}

- (id)errorOn
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __20__NFPromise_errorOn__block_invoke;
  v4[3] = &unk_264485C00;
  v4[4] = self;
  id v2 = (void *)MEMORY[0x223C1A400](v4, a2);
  return v2;
}

uint64_t __20__NFPromise_errorOn__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) errorOn:a2 error:a3];
}

- (id)resolve
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __20__NFPromise_resolve__block_invoke;
  v4[3] = &unk_264485C78;
  v4[4] = self;
  id v2 = (void *)MEMORY[0x223C1A400](v4, a2);
  return v2;
}

id __20__NFPromise_resolve__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __20__NFPromise_resolve__block_invoke_2;
  v8[3] = &unk_264485C50;
  id v9 = v3;
  id v5 = v3;
  id v6 = [v4 then:v8];

  return v6;
}

NFPromise *__20__NFPromise_resolve__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [NFPromise alloc];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __20__NFPromise_resolve__block_invoke_3;
  v9[3] = &unk_264485C28;
  id v5 = *(id *)(a1 + 32);
  id v10 = v3;
  id v11 = v5;
  id v6 = v3;
  id v7 = [(NFPromise *)v4 initWithResolver:v9];

  return v7;
}

uint64_t __20__NFPromise_resolve__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, void, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2, a3);
}

- (id)resolveOn
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __22__NFPromise_resolveOn__block_invoke;
  v4[3] = &unk_264485CA0;
  v4[4] = self;
  id v2 = (void *)MEMORY[0x223C1A400](v4, a2);
  return v2;
}

id __22__NFPromise_resolveOn__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __22__NFPromise_resolveOn__block_invoke_2;
  v10[3] = &unk_264485C50;
  id v11 = v5;
  id v7 = v5;
  id v8 = [v6 thenOn:a2 then:v10];

  return v8;
}

NFPromise *__22__NFPromise_resolveOn__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [NFPromise alloc];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __22__NFPromise_resolveOn__block_invoke_3;
  v9[3] = &unk_264485C28;
  id v5 = *(id *)(a1 + 32);
  id v10 = v3;
  id v11 = v5;
  id v6 = v3;
  id v7 = [(NFPromise *)v4 initWithResolver:v9];

  return v7;
}

uint64_t __22__NFPromise_resolveOn__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, void, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2, a3);
}

- (id)delay
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __18__NFPromise_delay__block_invoke;
  v4[3] = &unk_264485CE8;
  v4[4] = self;
  id v2 = (void *)MEMORY[0x223C1A400](v4, a2);
  return v2;
}

id __18__NFPromise_delay__block_invoke(uint64_t a1, double a2)
{
  id v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __18__NFPromise_delay__block_invoke_2;
  v5[3] = &__block_descriptor_40_e8__16__0_8l;
  *(double *)&v5[4] = a2;
  id v3 = [v2 then:v5];
  return v3;
}

id __18__NFPromise_delay__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[NFPromise asDelay:a2 withValue:*(double *)(a1 + 32)];
}

- (id)delayOn
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __20__NFPromise_delayOn__block_invoke;
  v4[3] = &unk_264485D38;
  v4[4] = self;
  id v2 = (void *)MEMORY[0x223C1A400](v4, a2);
  return v2;
}

id __20__NFPromise_delayOn__block_invoke(uint64_t a1, void *a2, double a3)
{
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __20__NFPromise_delayOn__block_invoke_2;
  v10[3] = &unk_264485D10;
  double v12 = a3;
  id v11 = v5;
  id v7 = v5;
  id v8 = [v6 thenOn:v7 then:v10];

  return v8;
}

id __20__NFPromise_delayOn__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[NFPromise asDelay:*(void *)(a1 + 32) onQueue:a2 withValue:*(double *)(a1 + 40)];
}

+ (id)asVoid:(id)a3
{
  id v3 = a3;
  id v4 = [[NFPromise alloc] initWithError:v3];

  return v4;
}

+ (id)asDelay:(double)a3 withValue:(id)a4
{
  return +[NFPromise asDelay:MEMORY[0x263EF83A0] onQueue:a4 withValue:a3];
}

+ (id)asDelay:(double)a3 withError:(id)a4
{
  return +[NFPromise asDelay:MEMORY[0x263EF83A0] onQueue:a4 withError:a3];
}

+ (id)asDelay:(double)a3 onQueue:(id)a4 withValue:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [NFPromise alloc];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __46__NFPromise_Delay__asDelay_onQueue_withValue___block_invoke;
  v14[3] = &unk_264485D88;
  double v17 = a3;
  id v15 = v7;
  id v16 = v8;
  id v10 = v8;
  id v11 = v7;
  double v12 = [(NFPromise *)v9 initWithResolver:v14];

  return v12;
}

void __46__NFPromise_Delay__asDelay_onQueue_withValue___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_time_t v4 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 48) * 1000000000.0));
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__NFPromise_Delay__asDelay_onQueue_withValue___block_invoke_2;
  v7[3] = &unk_264485D60;
  id v9 = v3;
  id v5 = *(NSObject **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v6 = v3;
  dispatch_after(v4, v5, v7);
}

uint64_t __46__NFPromise_Delay__asDelay_onQueue_withValue___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (id)asDelay:(double)a3 onQueue:(id)a4 withError:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [NFPromise alloc];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __46__NFPromise_Delay__asDelay_onQueue_withError___block_invoke;
  v14[3] = &unk_264485D88;
  double v17 = a3;
  id v15 = v7;
  id v16 = v8;
  id v10 = v8;
  id v11 = v7;
  double v12 = [(NFPromise *)v9 initWithResolver:v14];

  return v12;
}

void __46__NFPromise_Delay__asDelay_onQueue_withError___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  dispatch_time_t v5 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 48) * 1000000000.0));
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __46__NFPromise_Delay__asDelay_onQueue_withError___block_invoke_2;
  v8[3] = &unk_264485D60;
  id v10 = v4;
  id v6 = *(NSObject **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v7 = v4;
  dispatch_after(v5, v6, v8);
}

uint64_t __46__NFPromise_Delay__asDelay_onQueue_withError___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)timeoutAfter:(double)a3
{
  dispatch_time_t v5 = zalgo();
  id v6 = [(NFPromise *)self timeoutAfter:v5 on:a3];

  return v6;
}

- (id)timeoutAfter:(double)a3 on:(id)a4
{
  id v6 = a4;
  id v7 = [NFPromise alloc];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __38__NFPromise_Timeout__timeoutAfter_on___block_invoke;
  v11[3] = &unk_264485D88;
  void v11[4] = self;
  id v12 = v6;
  double v13 = a3;
  id v8 = v6;
  id v9 = [(NFPromise *)v7 initWithResolver:v11];

  return v9;
}

void __38__NFPromise_Timeout__timeoutAfter_on___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  char v43 = 0;
  id v7 = [[NFUnfairLock alloc] initWithOptions:1];
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __38__NFPromise_Timeout__timeoutAfter_on___block_invoke_2;
  v39[3] = &unk_264485E80;
  id v8 = v7;
  v40 = v8;
  v41 = v42;
  id v9 = (void *)MEMORY[0x223C1A400](v39);
  id v10 = *(void **)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __38__NFPromise_Timeout__timeoutAfter_on___block_invoke_4;
  v36[3] = &unk_264485EA8;
  id v12 = v9;
  id v37 = v12;
  id v13 = v5;
  id v38 = v13;
  id v14 = (id)[v10 thenOn:v11 then:v36];
  id v15 = *(void **)(a1 + 32);
  uint64_t v16 = *(void *)(a1 + 40);
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __38__NFPromise_Timeout__timeoutAfter_on___block_invoke_6;
  v33[3] = &unk_264485ED0;
  id v17 = v12;
  id v34 = v17;
  id v18 = v6;
  id v35 = v18;
  id v19 = (id)[v15 errorOn:v16 error:v33];
  v20 = *(id *)(a1 + 40);
  v21 = *(void **)(a1 + 40);
  v22 = zalgo();
  if (v21 == v22)
  {

LABEL_5:
    qos_class_t v25 = qos_class_self();
    uint64_t v26 = dispatch_get_global_queue(v25, 0);

    v20 = v26;
    goto LABEL_6;
  }
  v23 = *(void **)(a1 + 40);
  v24 = zalgoIfMain();

  if (v23 == v24) {
    goto LABEL_5;
  }
LABEL_6:
  dispatch_time_t v27 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 48) * 1000000000.0));
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __38__NFPromise_Timeout__timeoutAfter_on___block_invoke_8;
  v30[3] = &unk_264485EF8;
  id v31 = v17;
  id v32 = v18;
  id v28 = v18;
  id v29 = v17;
  dispatch_after(v27, v20, v30);

  _Block_object_dispose(v42, 8);
}

void __38__NFPromise_Timeout__timeoutAfter_on___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__NFPromise_Timeout__timeoutAfter_on___block_invoke_3;
  v7[3] = &unk_264485E58;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v6 = v3;
  [v5 performWithLockSync:v7];
}

uint64_t __38__NFPromise_Timeout__timeoutAfter_on___block_invoke_3(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24))
  {
    uint64_t v1 = result;
    result = (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
    *(unsigned char *)(*(void *)(*(void *)(v1 + 40) + 8) + 24) = 1;
  }
  return result;
}

id __38__NFPromise_Timeout__timeoutAfter_on___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __38__NFPromise_Timeout__timeoutAfter_on___block_invoke_5;
  v9[3] = &unk_264485D60;
  uint64_t v4 = *(void *)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  id v5 = v3;
  id v10 = v5;
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v9);
  id v6 = v10;
  id v7 = v5;

  return v7;
}

uint64_t __38__NFPromise_Timeout__timeoutAfter_on___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __38__NFPromise_Timeout__timeoutAfter_on___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __38__NFPromise_Timeout__timeoutAfter_on___block_invoke_7;
  v8[3] = &unk_264485D60;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v5;
  id v6 = *(void (**)(uint64_t, void *))(v4 + 16);
  id v7 = v3;
  v6(v4, v8);
}

uint64_t __38__NFPromise_Timeout__timeoutAfter_on___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __38__NFPromise_Timeout__timeoutAfter_on___block_invoke_8(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __38__NFPromise_Timeout__timeoutAfter_on___block_invoke_9;
  v2[3] = &unk_264485DD8;
  uint64_t v1 = *(void *)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);
}

void __38__NFPromise_Timeout__timeoutAfter_on___block_invoke_9(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = objc_alloc(MEMORY[0x263F087E8]);
  id v3 = (id)[v2 initWithDomain:kNFPromiseErrorDomain code:kNFPromiseTimeoutErrorCode userInfo:MEMORY[0x263EFFA78]];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v3);
}

@end