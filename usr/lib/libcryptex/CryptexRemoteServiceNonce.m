@interface CryptexRemoteServiceNonce
- (CryptexRemoteServiceNonce)initWithNonce:(const _img4_nonce *)a3;
- (_img4_nonce)nonce;
- (void)dealloc;
@end

@implementation CryptexRemoteServiceNonce

- (CryptexRemoteServiceNonce)initWithNonce:(const _img4_nonce *)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v10.receiver = self;
  v10.super_class = (Class)CryptexRemoteServiceNonce;
  v4 = [(CryptexRemoteServiceNonce *)&v10 init];
  v5 = (_img4_nonce *)malloc_type_calloc(1uLL, 0x38uLL, 0x61D5536CuLL);
  if (!v5) {
    -[CryptexRemoteServiceNonce initWithNonce:](&v11, v12);
  }
  v4->_nonce = v5;
  long long v6 = *(_OWORD *)&a3->var0;
  long long v7 = *(_OWORD *)&a3->var1[14];
  long long v8 = *(_OWORD *)&a3->var1[30];
  *(void *)&v5->var1[46] = *(void *)&a3->var1[46];
  *(_OWORD *)&v5->var1[14] = v7;
  *(_OWORD *)&v5->var1[30] = v8;
  *(_OWORD *)&v5->var0 = v6;
  return v4;
}

- (void)dealloc
{
  if ([(CryptexRemoteServiceNonce *)self nonce])
  {
    free(self->_nonce);
    self->_nonce = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)CryptexRemoteServiceNonce;
  [(CryptexRemoteServiceNonce *)&v3 dealloc];
}

- (_img4_nonce)nonce
{
  return self->_nonce;
}

- (void)initWithNonce:(void *)a1 .cold.1(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1_0(a1, a2);
  os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
  v2 = __error();
  strerror(*v2);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0();
  __break(1u);
}

@end