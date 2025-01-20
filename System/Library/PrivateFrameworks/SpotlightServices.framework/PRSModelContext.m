@interface PRSModelContext
- (NSString)version;
- (PRSDirectivesManager)directivesManager;
- (PRSModelContext)initWithModel:(id)a3 directivesManager:(id)a4 type:(unint64_t)a5;
- (SSCoreMLInterface)model;
- (unint64_t)type;
- (void)setDirectivesManager:(id)a3;
- (void)setModel:(id)a3;
- (void)setType:(unint64_t)a3;
- (void)setVersion:(id)a3;
@end

@implementation PRSModelContext

- (PRSModelContext)initWithModel:(id)a3 directivesManager:(id)a4 type:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PRSModelContext;
  v11 = [(PRSModelContext *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_model, a3);
    objc_storeStrong((id *)&v12->_directivesManager, a4);
    v12->_type = a5;
    uint64_t v13 = [v9 getVersionString];
    version = v12->_version;
    v12->_version = (NSString *)v13;
  }
  return v12;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (SSCoreMLInterface)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (PRSDirectivesManager)directivesManager
{
  return self->_directivesManager;
}

- (void)setDirectivesManager:(id)a3
{
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_directivesManager, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end