@interface WFWorkflowCreationOptions
- (BOOL)deleted;
- (NSString)collectionIdentifier;
- (NSString)identifier;
- (WFWorkflowCreationOptions)init;
- (WFWorkflowCreationOptions)initWithRecord:(id)a3;
- (WFWorkflowRecord)record;
- (unint64_t)location;
- (void)setCollectionIdentifier:(id)a3;
- (void)setDeleted:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setLocation:(unint64_t)a3;
@end

@implementation WFWorkflowCreationOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_record, 0);
}

- (void)setCollectionIdentifier:(id)a3
{
}

- (NSString)collectionIdentifier
{
  return self->_collectionIdentifier;
}

- (void)setDeleted:(BOOL)a3
{
  self->_deleted = a3;
}

- (BOOL)deleted
{
  return self->_deleted;
}

- (void)setLocation:(unint64_t)a3
{
  self->_location = a3;
}

- (unint64_t)location
{
  return self->_location;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (WFWorkflowRecord)record
{
  return self->_record;
}

- (WFWorkflowCreationOptions)initWithRecord:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFWorkflowCreationOptions;
  v5 = [(WFWorkflowCreationOptions *)&v10 init];
  if (v5)
  {
    if (v4) {
      v6 = (WFWorkflowRecord *)v4;
    }
    else {
      v6 = (WFWorkflowRecord *)objc_opt_new();
    }
    record = v5->_record;
    v5->_record = v6;

    v5->_location = 0x7FFFFFFFFFFFFFFFLL;
    v8 = v5;
  }

  return v5;
}

- (WFWorkflowCreationOptions)init
{
  return [(WFWorkflowCreationOptions *)self initWithRecord:0];
}

@end