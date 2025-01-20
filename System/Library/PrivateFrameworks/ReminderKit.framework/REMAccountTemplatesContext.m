@interface REMAccountTemplatesContext
- (REMAccount)account;
- (REMAccountTemplatesContext)initWithAccount:(id)a3;
- (id)fetchTemplatesWithError:(id *)a3;
- (void)setAccount:(id)a3;
@end

@implementation REMAccountTemplatesContext

- (REMAccountTemplatesContext)initWithAccount:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMAccountTemplatesContext;
  v6 = [(REMAccountTemplatesContext *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_account, a3);
  }

  return v7;
}

- (id)fetchTemplatesWithError:(id *)a3
{
  id v5 = [REMTemplatesDataView alloc];
  v6 = [(REMAccountTemplatesContext *)self account];
  v7 = [v6 store];
  v8 = [(REMTemplatesDataView *)v5 initWithStore:v7];

  objc_super v9 = [(REMAccountTemplatesContext *)self account];
  v10 = [(REMTemplatesDataView *)v8 fetchTemplatesInAccount:v9 error:a3];

  return v10;
}

- (REMAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (void).cxx_destruct
{
}

@end