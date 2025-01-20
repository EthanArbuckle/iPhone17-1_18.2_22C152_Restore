@interface WFWorkflowChangeset
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (NSSet)inserted;
- (NSSet)modified;
- (NSSet)removed;
- (WFWorkflowChangeset)initWithModifiedWorkflows:(id)a3 insertedWorkflows:(id)a4 removedWorkflows:(id)a5;
- (id)changesetForVisibleWorkflows;
@end

@implementation WFWorkflowChangeset

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removed, 0);
  objc_storeStrong((id *)&self->_inserted, 0);
  objc_storeStrong((id *)&self->_modified, 0);
}

- (NSSet)removed
{
  return self->_removed;
}

- (NSSet)inserted
{
  return self->_inserted;
}

- (NSSet)modified
{
  return self->_modified;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WFWorkflowChangeset *)a3;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(WFWorkflowChangeset *)self modified];
      v7 = [(WFWorkflowChangeset *)v5 modified];
      if ([v6 isEqual:v7])
      {
        v8 = [(WFWorkflowChangeset *)self inserted];
        v9 = [(WFWorkflowChangeset *)v5 inserted];
        if ([v8 isEqual:v9])
        {
          v10 = [(WFWorkflowChangeset *)self removed];
          v11 = [(WFWorkflowChangeset *)v5 removed];
          char v12 = [v10 isEqual:v11];
        }
        else
        {
          char v12 = 0;
        }
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

- (BOOL)isEmpty
{
  return ![(NSSet *)self->_modified count]
      && ![(NSSet *)self->_inserted count]
      && [(NSSet *)self->_removed count] == 0;
}

- (id)changesetForVisibleWorkflows
{
  v3 = [(WFWorkflowChangeset *)self inserted];
  v4 = (void *)[v3 mutableCopy];

  v5 = [(WFWorkflowChangeset *)self modified];
  v6 = (void *)[v5 mutableCopy];

  v7 = [(WFWorkflowChangeset *)self removed];
  v8 = (void *)[v7 mutableCopy];

  v9 = [(WFWorkflowChangeset *)self modified];
  v10 = objc_msgSend(v9, "if_compactMap:", &__block_literal_global_418);

  [v8 unionSet:v10];
  [v6 minusSet:v10];
  v11 = [(WFWorkflowChangeset *)self inserted];
  char v12 = objc_msgSend(v11, "if_compactMap:", &__block_literal_global_159);

  [v4 minusSet:v12];
  v13 = [[WFWorkflowChangeset alloc] initWithModifiedWorkflows:v6 insertedWorkflows:v4 removedWorkflows:v8];

  return v13;
}

id __51__WFWorkflowChangeset_changesetForVisibleWorkflows__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (([v2 isDeleted] & 1) != 0 || objc_msgSend(v2, "hiddenFromLibraryAndSync")) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  return v4;
}

id __51__WFWorkflowChangeset_changesetForVisibleWorkflows__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (([v2 isDeleted] & 1) != 0 || objc_msgSend(v2, "hiddenFromLibraryAndSync")) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (WFWorkflowChangeset)initWithModifiedWorkflows:(id)a3 insertedWorkflows:(id)a4 removedWorkflows:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)WFWorkflowChangeset;
  char v12 = [(WFWorkflowChangeset *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_modified, a3);
    objc_storeStrong((id *)&v13->_inserted, a4);
    objc_storeStrong((id *)&v13->_removed, a5);
  }

  return v13;
}

@end