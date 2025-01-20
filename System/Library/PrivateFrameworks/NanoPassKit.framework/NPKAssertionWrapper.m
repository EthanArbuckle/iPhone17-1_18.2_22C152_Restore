@interface NPKAssertionWrapper
- (BOOL)invalidateAssertionExpected:(BOOL)a3;
- (NPKAssertionWrapper)initWithAssertion:(id)a3 invalidator:(id)a4;
- (NSObject)assertion;
- (NSUUID)wrapperUUID;
- (id)description;
- (void)dealloc;
@end

@implementation NPKAssertionWrapper

- (NPKAssertionWrapper)initWithAssertion:(id)a3 invalidator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)NPKAssertionWrapper;
  v9 = [(NPKAssertionWrapper *)&v15 init];
  if (v9)
  {
    uint64_t v10 = [MEMORY[0x263F08C38] UUID];
    wrapperUUID = v9->_wrapperUUID;
    v9->_wrapperUUID = (NSUUID *)v10;

    objc_storeStrong((id *)&v9->_assertion, a3);
    uint64_t v12 = MEMORY[0x223C37380](v8);
    id assertionInvalidator = v9->_assertionInvalidator;
    v9->_id assertionInvalidator = (id)v12;
  }
  return v9;
}

- (void)dealloc
{
  [(NPKAssertionWrapper *)self invalidateAssertionExpected:0];
  v3.receiver = self;
  v3.super_class = (Class)NPKAssertionWrapper;
  [(NPKAssertionWrapper *)&v3 dealloc];
}

- (BOOL)invalidateAssertionExpected:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  assertion = self->_assertion;
  if (assertion)
  {
    if (!a3)
    {
      v5 = pk_General_log();
      BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

      if (v6)
      {
        id v7 = pk_General_log();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          id v8 = self->_assertion;
          int v12 = 138412290;
          v13 = v8;
          _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Warning: Unexpected invalidation of assertion:%@", (uint8_t *)&v12, 0xCu);
        }
      }
    }
    (*((void (**)(void))self->_assertionInvalidator + 2))();
    v9 = self->_assertion;
    self->_assertion = 0;

    id assertionInvalidator = self->_assertionInvalidator;
    self->_id assertionInvalidator = 0;
  }
  return assertion != 0;
}

- (id)description
{
  assertion = self->_assertion;
  if (assertion)
  {
    v4 = [NSString stringWithFormat:@", assertion:%@", assertion];
  }
  else
  {
    v4 = &stru_26CFEBA18;
  }
  v5 = [NSString stringWithFormat:@"<%@:%p> {UUID:%@%@}", objc_opt_class(), self, self->_wrapperUUID, v4];

  return v5;
}

- (NSObject)assertion
{
  return self->_assertion;
}

- (NSUUID)wrapperUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrapperUUID, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong(&self->_assertionInvalidator, 0);
}

@end