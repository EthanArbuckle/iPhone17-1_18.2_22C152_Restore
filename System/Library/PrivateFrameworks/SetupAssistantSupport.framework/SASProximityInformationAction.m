@interface SASProximityInformationAction
+ (unint64_t)actionID;
- (BOOL)hasResponse;
- (SASProximityInformation)information;
- (SASProximityInformationAction)init;
- (id)responsePayload;
- (void)setInformation:(id)a3;
- (void)setResponseFromData:(id)a3;
@end

@implementation SASProximityInformationAction

+ (unint64_t)actionID
{
  return 3;
}

- (SASProximityInformationAction)init
{
  v5.receiver = self;
  v5.super_class = (Class)SASProximityInformationAction;
  v2 = [(SASProximityInformationAction *)&v5 init];
  if (v2)
  {
    v3 = objc_alloc_init(SASProximityInformation);
    [(SASProximityInformationAction *)v2 setInformation:v3];
  }
  return v2;
}

- (BOOL)hasResponse
{
  return 1;
}

- (void)setResponseFromData:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F28DC0];
  objc_super v5 = (void *)MEMORY[0x1E4F1CAD0];
  id v6 = a3;
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v5, "setWithObjects:", v7, v8, objc_opt_class(), 0);
  id v21 = 0;
  v10 = [v4 unarchivedObjectOfClasses:v9 fromData:v6 error:&v21];

  id v11 = v21;
  if (!v10)
  {
    v12 = +[SASLogging facility];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v11;
      _os_log_impl(&dword_1DCC71000, v12, OS_LOG_TYPE_DEFAULT, "Failed to unarchive information response payload: %@", buf, 0xCu);
    }
  }
  v13 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v14 = objc_opt_class();
  v15 = [v10 objectForKeyedSubscript:@"information"];
  id v20 = v11;
  v16 = [v13 unarchivedObjectOfClass:v14 fromData:v15 error:&v20];
  id v17 = v20;

  [(SASProximityInformationAction *)self setInformation:v16];
  v18 = [(SASProximityInformationAction *)self information];

  if (!v18)
  {
    v19 = +[SASLogging facility];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v17;
      _os_log_impl(&dword_1DCC71000, v19, OS_LOG_TYPE_DEFAULT, "Failed to unarchive handshake: %@", buf, 0xCu);
    }
  }
}

- (id)responsePayload
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [(SASProximityInformationAction *)self information];
  [v3 loadInformation];

  v4 = (void *)MEMORY[0x1E4F28DB0];
  objc_super v5 = [(SASProximityInformationAction *)self information];
  id v15 = 0;
  id v6 = [v4 archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v15];
  id v7 = v15;

  if (v6)
  {
    v16 = @"information";
    id v17 = v6;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    id v14 = v7;
    v9 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v8 requiringSecureCoding:1 error:&v14];
    id v10 = v14;

    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      v12 = +[SASLogging facility];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v19 = v10;
        _os_log_impl(&dword_1DCC71000, v12, OS_LOG_TYPE_DEFAULT, "Failed to archive information response payload: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v8 = +[SASLogging facility];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v7;
      _os_log_impl(&dword_1DCC71000, v8, OS_LOG_TYPE_DEFAULT, "Failed to archive information: %@", buf, 0xCu);
    }
    v9 = 0;
    id v10 = v7;
  }

  return v9;
}

- (SASProximityInformation)information
{
  return (SASProximityInformation *)objc_getProperty(self, a2, 8, 1);
}

- (void)setInformation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end