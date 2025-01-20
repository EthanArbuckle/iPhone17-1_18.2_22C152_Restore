@interface PPSiriQueryResult
+ (id)siriQueryResultWithQid:(id)a3 domain:(id)a4 confidence:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSiriQueryResult:(id)a3;
- (NSNumber)confidence;
- (NSString)domain;
- (NSString)qid;
- (PPSiriQueryResult)initWithQid:(id)a3 domain:(id)a4 confidence:(id)a5;
- (unint64_t)hash;
@end

@implementation PPSiriQueryResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confidence, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_qid, 0);
}

- (NSNumber)confidence
{
  return self->_confidence;
}

- (NSString)domain
{
  return self->_domain;
}

- (NSString)qid
{
  return self->_qid;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_qid hash];
  NSUInteger v4 = [(NSString *)self->_domain hash] - v3 + 32 * v3;
  return [(NSNumber *)self->_confidence hash] - v4 + 32 * v4;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (PPSiriQueryResult *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PPSiriQueryResult *)self isEqualToSiriQueryResult:v5];

  return v6;
}

- (BOOL)isEqualToSiriQueryResult:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_11;
  }
  int v6 = self->_qid != 0;
  v7 = [v4 qid];
  int v8 = v7 == 0;

  if (v6 == v8) {
    goto LABEL_11;
  }
  qid = self->_qid;
  if (qid)
  {
    v10 = [v5 qid];
    int v11 = [(NSString *)qid isEqual:v10];

    if (!v11) {
      goto LABEL_11;
    }
  }
  int v12 = self->_domain != 0;
  v13 = [v5 domain];
  int v14 = v13 == 0;

  if (v12 == v14) {
    goto LABEL_11;
  }
  domain = self->_domain;
  if (domain)
  {
    v16 = [v5 domain];
    int v17 = [(NSString *)domain isEqual:v16];

    if (!v17) {
      goto LABEL_11;
    }
  }
  int v18 = self->_confidence != 0;
  v19 = [v5 confidence];
  int v20 = v19 == 0;

  if (v18 == v20)
  {
LABEL_11:
    char v23 = 0;
  }
  else
  {
    confidence = self->_confidence;
    if (confidence)
    {
      v22 = [v5 confidence];
      char v23 = [(NSNumber *)confidence isEqual:v22];
    }
    else
    {
      char v23 = 1;
    }
  }

  return v23;
}

- (PPSiriQueryResult)initWithQid:(id)a3 domain:(id)a4 confidence:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = v12;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    int v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PPSiriQueryResult.m", 11, @"Invalid parameter not satisfying: %@", @"domain" object file lineNumber description];

    if (v13) {
      goto LABEL_3;
    }
  }
  int v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"PPSiriQueryResult.m", 12, @"Invalid parameter not satisfying: %@", @"confidence != nil" object file lineNumber description];

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)PPSiriQueryResult;
  int v14 = [(PPSiriQueryResult *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_qid, a3);
    objc_storeStrong((id *)&v15->_domain, a4);
    objc_storeStrong((id *)&v15->_confidence, a5);
  }

  return v15;
}

+ (id)siriQueryResultWithQid:(id)a3 domain:(id)a4 confidence:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)a1) initWithQid:v10 domain:v9 confidence:v8];

  return v11;
}

@end