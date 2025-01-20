@interface SUCoreUpdateParam
+ (BOOL)supportsSecureCoding;
+ (id)targetPhaseName:(int64_t)a3;
+ (id)targetRollbackPhaseName:(int64_t)a3;
- (NSError)error;
- (SUCorePolicy)policy;
- (SUCoreProgress)applyProgress;
- (SUCoreProgress)downloadProgress;
- (SUCoreProgress)prepareProgress;
- (SUCoreRollback)rollback;
- (SUCoreUpdateParam)init;
- (SUCoreUpdateParam)initWithApplyProgress:(id)a3;
- (SUCoreUpdateParam)initWithCoder:(id)a3;
- (SUCoreUpdateParam)initWithDownloadProgress:(id)a3;
- (SUCoreUpdateParam)initWithError:(id)a3;
- (SUCoreUpdateParam)initWithPrepareProgress:(id)a3;
- (SUCoreUpdateParam)initWithRollback:(id)a3 withError:(id)a4;
- (SUCoreUpdateParam)initWithRollback:(id)a3 withPolicy:(id)a4;
- (id)copy;
- (id)description;
- (id)initTargetPhase:(int64_t)a3 policy:(id)a4 downloadProgress:(id)a5 prepareProgress:(id)a6 applyProgress:(id)a7 rollback:(id)a8 resultCode:(int64_t)a9 error:(id)a10;
- (id)initTargetPhase:(int64_t)a3 withPolicy:(id)a4;
- (id)summary;
- (int64_t)resultCode;
- (int64_t)targetPhase;
- (void)encodeWithCoder:(id)a3;
- (void)setApplyProgress:(id)a3;
- (void)setDownloadProgress:(id)a3;
- (void)setError:(id)a3;
- (void)setPolicy:(id)a3;
- (void)setPrepareProgress:(id)a3;
- (void)setResultCode:(int64_t)a3;
- (void)setRollback:(id)a3;
- (void)setTargetPhase:(int64_t)a3;
@end

@implementation SUCoreUpdateParam

- (SUCoreUpdateParam)init
{
  return (SUCoreUpdateParam *)[(SUCoreUpdateParam *)self initTargetPhase:0 policy:0 downloadProgress:0 prepareProgress:0 applyProgress:0 rollback:0 resultCode:0 error:0];
}

- (id)initTargetPhase:(int64_t)a3 withPolicy:(id)a4
{
  return [(SUCoreUpdateParam *)self initTargetPhase:a3 policy:a4 downloadProgress:0 prepareProgress:0 applyProgress:0 rollback:0 resultCode:0 error:0];
}

- (SUCoreUpdateParam)initWithDownloadProgress:(id)a3
{
  return (SUCoreUpdateParam *)[(SUCoreUpdateParam *)self initTargetPhase:0 policy:0 downloadProgress:a3 prepareProgress:0 applyProgress:0 rollback:0 resultCode:0 error:0];
}

- (SUCoreUpdateParam)initWithPrepareProgress:(id)a3
{
  return (SUCoreUpdateParam *)[(SUCoreUpdateParam *)self initTargetPhase:0 policy:0 downloadProgress:0 prepareProgress:a3 applyProgress:0 rollback:0 resultCode:0 error:0];
}

- (SUCoreUpdateParam)initWithApplyProgress:(id)a3
{
  return (SUCoreUpdateParam *)[(SUCoreUpdateParam *)self initTargetPhase:0 policy:0 downloadProgress:0 prepareProgress:0 applyProgress:a3 rollback:0 resultCode:0 error:0];
}

- (SUCoreUpdateParam)initWithError:(id)a3
{
  id v4 = a3;
  v5 = -[SUCoreUpdateParam initTargetPhase:policy:downloadProgress:prepareProgress:applyProgress:rollback:resultCode:error:](self, "initTargetPhase:policy:downloadProgress:prepareProgress:applyProgress:rollback:resultCode:error:", 0, 0, 0, 0, 0, 0, [v4 code], v4);

  return v5;
}

- (SUCoreUpdateParam)initWithRollback:(id)a3 withPolicy:(id)a4
{
  return (SUCoreUpdateParam *)[(SUCoreUpdateParam *)self initTargetPhase:11 policy:a4 downloadProgress:0 prepareProgress:0 applyProgress:0 rollback:a3 resultCode:0 error:0];
}

- (SUCoreUpdateParam)initWithRollback:(id)a3 withError:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = -[SUCoreUpdateParam initTargetPhase:policy:downloadProgress:prepareProgress:applyProgress:rollback:resultCode:error:](self, "initTargetPhase:policy:downloadProgress:prepareProgress:applyProgress:rollback:resultCode:error:", 11, 0, 0, 0, 0, v7, [v6 code], v6);

  return v8;
}

- (id)initTargetPhase:(int64_t)a3 policy:(id)a4 downloadProgress:(id)a5 prepareProgress:(id)a6 applyProgress:(id)a7 rollback:(id)a8 resultCode:(int64_t)a9 error:(id)a10
{
  id v16 = a4;
  id v17 = a5;
  id v25 = a6;
  id v24 = a7;
  id v23 = a8;
  id v18 = a10;
  v26.receiver = self;
  v26.super_class = (Class)SUCoreUpdateParam;
  v19 = [(SUCoreUpdateParam *)&v26 init];
  v20 = v19;
  if (v19)
  {
    v19->_targetPhase = a3;
    objc_storeStrong((id *)&v19->_policy, a4);
    objc_storeStrong((id *)&v20->_downloadProgress, a5);
    objc_storeStrong((id *)&v20->_prepareProgress, a6);
    objc_storeStrong((id *)&v20->_applyProgress, a7);
    objc_storeStrong((id *)&v20->_rollback, a8);
    v20->_resultCode = a9;
    objc_storeStrong((id *)&v20->_error, a10);
  }

  return v20;
}

- (SUCoreUpdateParam)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SUCoreUpdateParam;
  v5 = [(SUCoreUpdateParam *)&v21 init];
  if (v5)
  {
    v5->_targetPhase = [v4 decodeInt64ForKey:@"TargetPhase"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Policy"];
    policy = v5->_policy;
    v5->_policy = (SUCorePolicy *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DownloadProgress"];
    downloadProgress = v5->_downloadProgress;
    v5->_downloadProgress = (SUCoreProgress *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PrepareProgress"];
    prepareProgress = v5->_prepareProgress;
    v5->_prepareProgress = (SUCoreProgress *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ApplyProgress"];
    applyProgress = v5->_applyProgress;
    v5->_applyProgress = (SUCoreProgress *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Rollback"];
    rollback = v5->_rollback;
    v5->_rollback = (SUCoreRollback *)v14;

    v5->_resultCode = [v4 decodeInt64ForKey:@"ResultCode"];
    id v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ErrorString"];
    id v17 = [MEMORY[0x263F77D78] sharedCore];
    uint64_t v18 = [v17 buildError:v5->_resultCode underlying:0 description:v16];
    error = v5->_error;
    v5->_error = (NSError *)v18;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[SUCoreUpdateParam targetPhase](self, "targetPhase"), @"TargetPhase");
  v5 = [(SUCoreUpdateParam *)self policy];
  [v4 encodeObject:v5 forKey:@"Policy"];

  uint64_t v6 = [(SUCoreUpdateParam *)self downloadProgress];
  [v4 encodeObject:v6 forKey:@"DownloadProgress"];

  id v7 = [(SUCoreUpdateParam *)self prepareProgress];
  [v4 encodeObject:v7 forKey:@"PrepareProgress"];

  uint64_t v8 = [(SUCoreUpdateParam *)self applyProgress];
  [v4 encodeObject:v8 forKey:@"ApplyProgress"];

  v9 = [(SUCoreUpdateParam *)self rollback];
  [v4 encodeObject:v9 forKey:@"Rollback"];

  objc_msgSend(v4, "encodeInt64:forKey:", -[SUCoreUpdateParam resultCode](self, "resultCode"), @"ResultCode");
  id v10 = [NSString alloc];
  v11 = [(SUCoreUpdateParam *)self error];
  id v12 = (id)[v10 initWithFormat:@"%@", v11];

  [v4 encodeObject:v12 forKey:@"ErrorString"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  v3 = objc_alloc_init(SUCoreUpdateParam);
  [(SUCoreUpdateParam *)v3 setTargetPhase:[(SUCoreUpdateParam *)self targetPhase]];
  id v4 = [(SUCoreUpdateParam *)self policy];
  [(SUCoreUpdateParam *)v3 setPolicy:v4];

  v5 = [(SUCoreUpdateParam *)self downloadProgress];
  [(SUCoreUpdateParam *)v3 setDownloadProgress:v5];

  uint64_t v6 = [(SUCoreUpdateParam *)self prepareProgress];
  [(SUCoreUpdateParam *)v3 setPrepareProgress:v6];

  id v7 = [(SUCoreUpdateParam *)self applyProgress];
  [(SUCoreUpdateParam *)v3 setApplyProgress:v7];

  uint64_t v8 = [(SUCoreUpdateParam *)self rollback];
  [(SUCoreUpdateParam *)v3 setRollback:v8];

  [(SUCoreUpdateParam *)v3 setResultCode:[(SUCoreUpdateParam *)self resultCode]];
  v9 = [(SUCoreUpdateParam *)self error];
  [(SUCoreUpdateParam *)v3 setError:v9];

  return v3;
}

- (id)description
{
  id v15 = [NSString alloc];
  uint64_t v14 = +[SUCoreUpdateParam targetPhaseName:[(SUCoreUpdateParam *)self targetPhase]];
  uint64_t v18 = [(SUCoreUpdateParam *)self policy];
  v3 = [v18 summary];
  id v17 = [(SUCoreUpdateParam *)self downloadProgress];
  id v4 = [v17 summary];
  v5 = [(SUCoreUpdateParam *)self prepareProgress];
  uint64_t v6 = [v5 summary];
  id v7 = [(SUCoreUpdateParam *)self applyProgress];
  uint64_t v8 = [v7 summary];
  v9 = [(SUCoreUpdateParam *)self rollback];
  id v10 = [v9 summary];
  int64_t v11 = [(SUCoreUpdateParam *)self resultCode];
  id v12 = [(SUCoreUpdateParam *)self error];
  id v16 = (id)[v15 initWithFormat:@"\n[>>>\n        targetPhase: %@\n             policy: %@\n   downloadProgress: %@\n    prepareProgress: %@\n      applyProgress: %@\n           rollback: %@\n         resultCode: %ld\n              error: %@\n<<<]", v14, v3, v4, v6, v8, v10, v11, v12];

  return v16;
}

- (id)summary
{
  v3 = [(SUCoreUpdateParam *)self error];

  if (v3)
  {
    id v4 = [NSString alloc];
    int64_t v5 = [(SUCoreUpdateParam *)self resultCode];
    uint64_t v6 = [(SUCoreUpdateParam *)self error];
    id v7 = [v6 description];
    uint64_t v8 = (void *)[v4 initWithFormat:@"resultCode:%ld,errorDesc:%@", v5, v7];

    goto LABEL_13;
  }
  if ([(SUCoreUpdateParam *)self targetPhase])
  {
    id v9 = [NSString alloc];
    id v10 = +[SUCoreUpdateParam targetPhaseName:[(SUCoreUpdateParam *)self targetPhase]];
    uint64_t v8 = (void *)[v9 initWithFormat:@"target:%@", v10];
LABEL_12:

    goto LABEL_13;
  }
  int64_t v11 = [(SUCoreUpdateParam *)self downloadProgress];

  if (v11)
  {
    id v12 = [NSString alloc];
    id v10 = [(SUCoreUpdateParam *)self downloadProgress];
    v13 = [v10 summary];
    uint64_t v14 = [v12 initWithFormat:@"downloadProg:%@", v13];
LABEL_11:
    uint64_t v8 = (void *)v14;

    goto LABEL_12;
  }
  id v15 = [(SUCoreUpdateParam *)self prepareProgress];

  if (v15)
  {
    id v16 = [NSString alloc];
    id v10 = [(SUCoreUpdateParam *)self prepareProgress];
    v13 = [v10 summary];
    uint64_t v14 = [v16 initWithFormat:@"prepareProg:%@", v13];
    goto LABEL_11;
  }
  id v17 = [(SUCoreUpdateParam *)self applyProgress];

  id v18 = [NSString alloc];
  if (v17)
  {
    id v10 = [(SUCoreUpdateParam *)self applyProgress];
    v13 = [v10 summary];
    uint64_t v14 = [v18 initWithFormat:@"applyProg:%@", v13];
    goto LABEL_11;
  }
  uint64_t v8 = objc_msgSend(v18, "initWithFormat:", @"resultCode:%ld", -[SUCoreUpdateParam resultCode](self, "resultCode"));
LABEL_13:

  return v8;
}

+ (id)targetPhaseName:(int64_t)a3
{
  if ((unint64_t)a3 > 0xB)
  {
    id v4 = @"UNKNOWN";
  }
  else
  {
    id v4 = kSUCoreUpdateTargetPhaseName[a3];
  }
  return v4;
}

+ (id)targetRollbackPhaseName:(int64_t)a3
{
  if ((unint64_t)a3 > 8)
  {
    id v4 = @"UNKNOWN";
  }
  else
  {
    id v4 = kSUCoreRollbackTargetPhaseName[a3];
  }
  return v4;
}

- (int64_t)targetPhase
{
  return self->_targetPhase;
}

- (void)setTargetPhase:(int64_t)a3
{
  self->_targetPhase = a3;
}

- (SUCorePolicy)policy
{
  return self->_policy;
}

- (void)setPolicy:(id)a3
{
}

- (SUCoreProgress)downloadProgress
{
  return self->_downloadProgress;
}

- (void)setDownloadProgress:(id)a3
{
}

- (SUCoreProgress)prepareProgress
{
  return self->_prepareProgress;
}

- (void)setPrepareProgress:(id)a3
{
}

- (SUCoreProgress)applyProgress
{
  return self->_applyProgress;
}

- (void)setApplyProgress:(id)a3
{
}

- (SUCoreRollback)rollback
{
  return self->_rollback;
}

- (void)setRollback:(id)a3
{
}

- (int64_t)resultCode
{
  return self->_resultCode;
}

- (void)setResultCode:(int64_t)a3
{
  self->_resultCode = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_rollback, 0);
  objc_storeStrong((id *)&self->_applyProgress, 0);
  objc_storeStrong((id *)&self->_prepareProgress, 0);
  objc_storeStrong((id *)&self->_downloadProgress, 0);

  objc_storeStrong((id *)&self->_policy, 0);
}

@end