@interface PSGQuickResponsesEngagementMetrics
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToQuickResponsesEngagementMetrics:(id)a3;
- (NSMutableArray)engagementDeltas;
- (NSString)experimentId;
- (NSString)factorPackId;
- (NSString)lang;
- (NSString)rolloutId;
- (NSString)treatmentId;
- (PSGQuickResponsesEngagementMetrics)initWithCoder:(id)a3;
- (PSGQuickResponsesEngagementMetrics)initWithLang:(id)a3 rolloutId:(id)a4 factorPackId:(id)a5 experimentId:(id)a6 treatmentId:(id)a7;
- (PSGQuickResponsesEngagementMetrics)initWithLang:(id)a3 rolloutId:(id)a4 factorPackId:(id)a5 experimentId:(id)a6 treatmentId:(id)a7 engagementDeltas:(id)a8;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PSGQuickResponsesEngagementMetrics

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engagementDeltas, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
  objc_storeStrong((id *)&self->_factorPackId, 0);
  objc_storeStrong((id *)&self->_rolloutId, 0);
  objc_storeStrong((id *)&self->_lang, 0);
}

- (NSMutableArray)engagementDeltas
{
  return self->_engagementDeltas;
}

- (NSString)treatmentId
{
  return self->_treatmentId;
}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (NSString)factorPackId
{
  return self->_factorPackId;
}

- (NSString)rolloutId
{
  return self->_rolloutId;
}

- (NSString)lang
{
  return self->_lang;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PSGQuickResponsesEngagementMetrics *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PSGQuickResponsesEngagementMetrics *)self isEqualToQuickResponsesEngagementMetrics:v5];

  return v6;
}

- (BOOL)isEqualToQuickResponsesEngagementMetrics:(id)a3
{
  v4 = (id *)a3;
  lang = self->_lang;
  BOOL v6 = (NSString *)v4[1];
  if (lang == v6)
  {
  }
  else
  {
    v7 = v6;
    v8 = lang;
    char v9 = [(NSString *)v8 isEqual:v7];

    if ((v9 & 1) == 0) {
      goto LABEL_19;
    }
  }
  rolloutId = self->_rolloutId;
  v11 = (NSString *)v4[2];
  if (rolloutId == v11)
  {
  }
  else
  {
    v12 = v11;
    v13 = rolloutId;
    char v14 = [(NSString *)v13 isEqual:v12];

    if ((v14 & 1) == 0) {
      goto LABEL_19;
    }
  }
  factorPackId = self->_factorPackId;
  v16 = (NSString *)v4[3];
  if (factorPackId == v16)
  {
  }
  else
  {
    v17 = v16;
    v18 = factorPackId;
    char v19 = [(NSString *)v18 isEqual:v17];

    if ((v19 & 1) == 0) {
      goto LABEL_19;
    }
  }
  experimentId = self->_experimentId;
  v21 = (NSString *)v4[4];
  if (experimentId == v21)
  {
  }
  else
  {
    v22 = v21;
    v23 = experimentId;
    char v24 = [(NSString *)v23 isEqual:v22];

    if ((v24 & 1) == 0) {
      goto LABEL_19;
    }
  }
  treatmentId = self->_treatmentId;
  v26 = (NSString *)v4[5];
  if (treatmentId == v26)
  {
  }
  else
  {
    v27 = v26;
    v28 = treatmentId;
    char v29 = [(NSString *)v28 isEqual:v27];

    if ((v29 & 1) == 0)
    {
LABEL_19:
      char v30 = 0;
      goto LABEL_20;
    }
  }
  v32 = self->_engagementDeltas;
  v33 = v32;
  if (v32 == v4[6]) {
    char v30 = 1;
  }
  else {
    char v30 = -[NSMutableArray isEqual:](v32, "isEqual:");
  }

LABEL_20:
  return v30;
}

- (PSGQuickResponsesEngagementMetrics)initWithCoder:(id)a3
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v50.receiver = self;
  v50.super_class = (Class)PSGQuickResponsesEngagementMetrics;
  BOOL v6 = [(PSGQuickResponsesEngagementMetrics *)&v50 init];
  if (v6)
  {
    v7 = v6;
    v8 = (void *)MEMORY[0x263F61E90];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = *MEMORY[0x263F61908];
    v11 = psg_default_log_handle();
    v12 = [v8 robustDecodeObjectOfClass:v9 forKey:@"lang" withCoder:v5 expectNonNull:1 errorDomain:v10 errorCode:3 logHandle:v11];

    if (!v12)
    {
      v44 = [MEMORY[0x263F08690] currentHandler];
      [v44 handleFailureInMethod:a2, v7, @"PSGDPDeviceMetricsCollector.m", 139, @"Invalid parameter not satisfying: %@", @"lang" object file lineNumber description];
    }
    v13 = (void *)MEMORY[0x263F61E90];
    uint64_t v14 = objc_opt_class();
    v15 = psg_default_log_handle();
    v16 = [v13 robustDecodeObjectOfClass:v14 forKey:@"rolloutId" withCoder:v5 expectNonNull:0 errorDomain:v10 errorCode:3 logHandle:v15];

    v17 = [v5 error];

    if (v17)
    {
      v18 = psg_default_log_handle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v34 = [v5 error];
        *(_DWORD *)buf = 138412290;
        v52 = v34;
        _os_log_error_impl(&dword_23EAA9000, v18, OS_LOG_TYPE_ERROR, "Secure coding failure: %@", buf, 0xCu);
      }
      char v19 = 0;
    }
    else
    {
      SEL v49 = a2;
      v20 = (void *)MEMORY[0x263F61E90];
      uint64_t v21 = objc_opt_class();
      v22 = psg_default_log_handle();
      v18 = [v20 robustDecodeObjectOfClass:v21 forKey:@"factorPackId" withCoder:v5 expectNonNull:0 errorDomain:v10 errorCode:3 logHandle:v22];

      v23 = [v5 error];

      if (v23)
      {
        char v24 = psg_default_log_handle();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v41 = [v5 error];
          *(_DWORD *)buf = 138412290;
          v52 = v41;
          _os_log_error_impl(&dword_23EAA9000, v24, OS_LOG_TYPE_ERROR, "Secure coding failure: %@", buf, 0xCu);
        }
        char v19 = 0;
      }
      else
      {
        v48 = v7;
        v25 = (void *)MEMORY[0x263F61E90];
        uint64_t v26 = objc_opt_class();
        v27 = psg_default_log_handle();
        char v24 = [v25 robustDecodeObjectOfClass:v26 forKey:@"experimentId" withCoder:v5 expectNonNull:0 errorDomain:v10 errorCode:3 logHandle:v27];

        v28 = [v5 error];

        if (v28)
        {
          char v29 = psg_default_log_handle();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            v42 = [v5 error];
            *(_DWORD *)buf = 138412290;
            v52 = v42;
            _os_log_error_impl(&dword_23EAA9000, v29, OS_LOG_TYPE_ERROR, "Secure coding failure: %@", buf, 0xCu);
          }
          char v19 = 0;
        }
        else
        {
          context = (void *)MEMORY[0x263F61E90];
          uint64_t v30 = objc_opt_class();
          v31 = psg_default_log_handle();
          char v29 = [context robustDecodeObjectOfClass:v30 forKey:@"treatmentId" withCoder:v5 expectNonNull:0 errorDomain:v10 errorCode:3 logHandle:v31];

          v32 = [v5 error];

          if (v32)
          {
            v33 = psg_default_log_handle();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              v43 = [v5 error];
              *(_DWORD *)buf = 138412290;
              v52 = v43;
              _os_log_error_impl(&dword_23EAA9000, v33, OS_LOG_TYPE_ERROR, "Secure coding failure: %@", buf, 0xCu);
            }
            char v19 = 0;
          }
          else
          {
            v35 = (void *)MEMORY[0x263F61E90];
            contexta = (void *)MEMORY[0x23ED0AB80]();
            id v36 = objc_alloc(MEMORY[0x263EFFA08]);
            uint64_t v37 = objc_opt_class();
            v38 = objc_msgSend(v36, "initWithObjects:", v37, objc_opt_class(), 0);
            v39 = psg_default_log_handle();
            v33 = [v35 robustDecodeObjectOfClasses:v38 forKey:@"engagementDeltas" withCoder:v5 expectNonNull:1 errorDomain:v10 errorCode:3 logHandle:v39];

            if (!v33)
            {
              v45 = [MEMORY[0x263F08690] currentHandler];
              [v45 handleFailureInMethod:v49, v48, @"PSGDPDeviceMetricsCollector.m", 183, @"Invalid parameter not satisfying: %@", @"deltas" object file lineNumber description];
            }
            char v19 = [(PSGQuickResponsesEngagementMetrics *)v48 initWithLang:v12 rolloutId:v16 factorPackId:v18 experimentId:v24 treatmentId:v29 engagementDeltas:v33];
            v48 = v19;
          }
        }
        v7 = v48;
      }
    }
  }
  else
  {
    char v19 = 0;
  }

  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  lang = self->_lang;
  id v5 = a3;
  [v5 encodeObject:lang forKey:@"lang"];
  [v5 encodeObject:self->_rolloutId forKey:@"rolloutId"];
  [v5 encodeObject:self->_factorPackId forKey:@"factorPackId"];
  [v5 encodeObject:self->_experimentId forKey:@"experimentId"];
  [v5 encodeObject:self->_treatmentId forKey:@"treatmentId"];
  [v5 encodeObject:self->_engagementDeltas forKey:@"engagementDeltas"];
}

- (PSGQuickResponsesEngagementMetrics)initWithLang:(id)a3 rolloutId:(id)a4 factorPackId:(id)a5 experimentId:(id)a6 treatmentId:(id)a7 engagementDeltas:(id)a8
{
  id v15 = a3;
  id v27 = a4;
  id v26 = a5;
  id v25 = a6;
  id v16 = a7;
  id v17 = a8;
  v18 = v17;
  if (v15)
  {
    if (v17) {
      goto LABEL_3;
    }
  }
  else
  {
    v22 = [MEMORY[0x263F08690] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"PSGDPDeviceMetricsCollector.m", 93, @"Invalid parameter not satisfying: %@", @"lang" object file lineNumber description];

    if (v18) {
      goto LABEL_3;
    }
  }
  v23 = [MEMORY[0x263F08690] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"PSGDPDeviceMetricsCollector.m", 94, @"Invalid parameter not satisfying: %@", @"engagementDeltas" object file lineNumber description];

LABEL_3:
  v28.receiver = self;
  v28.super_class = (Class)PSGQuickResponsesEngagementMetrics;
  char v19 = [(PSGQuickResponsesEngagementMetrics *)&v28 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_lang, a3);
    objc_storeStrong((id *)&v20->_rolloutId, a4);
    objc_storeStrong((id *)&v20->_factorPackId, a5);
    objc_storeStrong((id *)&v20->_experimentId, a6);
    objc_storeStrong((id *)&v20->_treatmentId, a7);
    objc_storeStrong((id *)&v20->_engagementDeltas, a8);
  }

  return v20;
}

- (PSGQuickResponsesEngagementMetrics)initWithLang:(id)a3 rolloutId:(id)a4 factorPackId:(id)a5 experimentId:(id)a6 treatmentId:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = objc_opt_new();
  v18 = [(PSGQuickResponsesEngagementMetrics *)self initWithLang:v16 rolloutId:v15 factorPackId:v14 experimentId:v13 treatmentId:v12 engagementDeltas:v17];

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end