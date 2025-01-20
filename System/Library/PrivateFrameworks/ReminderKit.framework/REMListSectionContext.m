@interface REMListSectionContext
- (BOOL)hasSections;
- (REMList)list;
- (REMListSectionContext)initWithList:(id)a3;
- (void)setList:(id)a3;
@end

@implementation REMListSectionContext

- (REMListSectionContext)initWithList:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMListSectionContext;
  v6 = [(REMListSectionContext *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_list, a3);
  }

  return v7;
}

- (BOOL)hasSections
{
  v3 = [(REMListSectionContext *)self list];
  v4 = [v3 store];

  id v5 = [(REMListSectionContext *)self list];
  v6 = [v5 remObjectID];
  v7 = [v4 fetchListSectionsCountWithListObjectID:v6 error:0];

  LOBYTE(v5) = (int)[v7 intValue] > 0;
  return (char)v5;
}

- (REMList)list
{
  return self->_list;
}

- (void)setList:(id)a3
{
}

- (void).cxx_destruct
{
}

@end