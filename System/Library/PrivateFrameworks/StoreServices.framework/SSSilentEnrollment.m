@interface SSSilentEnrollment
- (SSSilentEnrollment)initWithSilentEnrollmentContext:(id)a3;
- (SSSilentEnrollment)initWithXPCEncoding:(id)a3;
- (SSSilentEnrollmentContext)context;
- (id)copyXPCEncoding;
- (void)setContext:(id)a3;
@end

@implementation SSSilentEnrollment

- (SSSilentEnrollment)initWithSilentEnrollmentContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SSSilentEnrollment;
  v6 = [(SSRequest *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_context, a3);
  }

  return v7;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  v4 = [(SSSilentEnrollment *)self context];
  id v5 = [v4 accountIdentifier];
  SSXPCDictionarySetObject(v3, "0", v5);

  v6 = [(SSSilentEnrollment *)self context];
  v7 = [v6 headerADSID];
  SSXPCDictionarySetObject(v3, "1", v7);

  v8 = [(SSSilentEnrollment *)self context];
  objc_super v9 = [v8 headerGSToken];
  SSXPCDictionarySetObject(v3, "2", v9);

  v10 = [(SSSilentEnrollment *)self context];
  v11 = [v10 headerGuid];
  SSXPCDictionarySetObject(v3, "3", v11);

  v12 = [(SSSilentEnrollment *)self context];
  v13 = [v12 headerMMeClientInfo];
  SSXPCDictionarySetObject(v3, "4", v13);

  v14 = [(SSSilentEnrollment *)self context];
  v15 = [v14 headerMMeDeviceId];
  SSXPCDictionarySetObject(v3, "5", v15);

  v16 = [(SSSilentEnrollment *)self context];
  v17 = [v16 parameters];
  SSXPCDictionarySetObject(v3, "7", v17);

  v18 = [(SSSilentEnrollment *)self context];
  v19 = [v18 URLString];
  SSXPCDictionarySetObject(v3, "6", v19);

  return v3;
}

- (SSSilentEnrollment)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && MEMORY[0x1A62689E0](v4) == MEMORY[0x1E4F14590])
  {
    v6 = [(SSRequest *)self init];
    if (!v6) {
      goto LABEL_5;
    }
    v8 = objc_alloc_init(SSSilentEnrollmentContext);
    context = v6->_context;
    v6->_context = v8;

    v10 = v6->_context;
    uint64_t v11 = objc_opt_class();
    v12 = (void *)SSXPCDictionaryCopyObjectWithClass(v5, "0", v11);
    [(SSSilentEnrollmentContext *)v10 setAccountIdentifier:v12];

    v13 = v6->_context;
    uint64_t v14 = objc_opt_class();
    v15 = (void *)SSXPCDictionaryCopyObjectWithClass(v5, "1", v14);
    [(SSSilentEnrollmentContext *)v13 setHeaderADSID:v15];

    v16 = v6->_context;
    uint64_t v17 = objc_opt_class();
    v18 = (void *)SSXPCDictionaryCopyObjectWithClass(v5, "2", v17);
    [(SSSilentEnrollmentContext *)v16 setHeaderGSToken:v18];

    v19 = v6->_context;
    uint64_t v20 = objc_opt_class();
    v21 = (void *)SSXPCDictionaryCopyObjectWithClass(v5, "3", v20);
    [(SSSilentEnrollmentContext *)v19 setHeaderGuid:v21];

    v22 = v6->_context;
    uint64_t v23 = objc_opt_class();
    v24 = (void *)SSXPCDictionaryCopyObjectWithClass(v5, "4", v23);
    [(SSSilentEnrollmentContext *)v22 setHeaderMMeClientInfo:v24];

    v25 = v6->_context;
    uint64_t v26 = objc_opt_class();
    v27 = (void *)SSXPCDictionaryCopyObjectWithClass(v5, "5", v26);
    [(SSSilentEnrollmentContext *)v25 setHeaderMMeDeviceId:v27];

    v28 = v6->_context;
    uint64_t v29 = objc_opt_class();
    v30 = (void *)SSXPCDictionaryCopyObjectWithClass(v5, "7", v29);
    [(SSSilentEnrollmentContext *)v28 setParameters:v30];

    v31 = v6->_context;
    uint64_t v32 = objc_opt_class();
    self = (SSSilentEnrollment *)SSXPCDictionaryCopyObjectWithClass(v5, "6", v32);
    [(SSSilentEnrollmentContext *)v31 setURLString:self];
  }
  else
  {
    v6 = 0;
  }

LABEL_5:
  return v6;
}

- (SSSilentEnrollmentContext)context
{
  return (SSSilentEnrollmentContext *)objc_getProperty(self, a2, 96, 1);
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end