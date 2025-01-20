@interface SSNFCAssertion
- (NFAssertion)preventConnectionHandoverAssertion;
- (SSNFCAssertion)init;
- (void)_assert;
- (void)_deassert;
- (void)dealloc;
- (void)setPreventConnectionHandoverAssertion:(id)a3;
@end

@implementation SSNFCAssertion

- (SSNFCAssertion)init
{
  v5.receiver = self;
  v5.super_class = (Class)SSNFCAssertion;
  v2 = [(SSNFCAssertion *)&v5 init];
  v3 = v2;
  if (v2) {
    [(SSNFCAssertion *)v2 _assert];
  }
  return v3;
}

- (void)dealloc
{
  [(SSNFCAssertion *)self _deassert];
  v3.receiver = self;
  v3.super_class = (Class)SSNFCAssertion;
  [(SSNFCAssertion *)&v3 dealloc];
}

- (void)_assert
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138543618;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  objc_super v5 = "-[SSNFCAssertion _assert]";
  _os_log_error_impl(&dword_227A17000, a2, OS_LOG_TYPE_ERROR, "[E]assertion fail with error: %{public}@ @%s", (uint8_t *)&v2, 0x16u);
}

- (void)_deassert
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (self->_preventConnectionHandoverAssertion)
  {
    uint64_t v3 = [getNFHardwareManagerClass() sharedHardwareManagerWithNoUI];
    id v4 = (id)[v3 releaseAssertion:self->_preventConnectionHandoverAssertion];

    preventConnectionHandoverAssertion = self->_preventConnectionHandoverAssertion;
    self->_preventConnectionHandoverAssertion = 0;

    uint64_t v6 = _TSLogDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      v8 = "-[SSNFCAssertion _deassert]";
      _os_log_impl(&dword_227A17000, v6, OS_LOG_TYPE_DEFAULT, "assertion released @%s", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (NFAssertion)preventConnectionHandoverAssertion
{
  return (NFAssertion *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPreventConnectionHandoverAssertion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end