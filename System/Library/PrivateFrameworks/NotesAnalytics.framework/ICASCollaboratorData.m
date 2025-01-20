@interface ICASCollaboratorData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASCollaboratorData)initWithCountOfCollaboratorAdded:(id)a3 countOfCollaboratorRemoved:(id)a4;
- (NSNumber)countOfCollaboratorAdded;
- (NSNumber)countOfCollaboratorRemoved;
- (id)toDict;
@end

@implementation ICASCollaboratorData

- (ICASCollaboratorData)initWithCountOfCollaboratorAdded:(id)a3 countOfCollaboratorRemoved:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICASCollaboratorData;
  v9 = [(ICASCollaboratorData *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_countOfCollaboratorAdded, a3);
    objc_storeStrong((id *)&v10->_countOfCollaboratorRemoved, a4);
  }

  return v10;
}

+ (NSString)dataName
{
  return (NSString *)@"CollaboratorData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"countOfCollaboratorAdded";
  v3 = [(ICASCollaboratorData *)self countOfCollaboratorAdded];
  if (v3)
  {
    uint64_t v4 = [(ICASCollaboratorData *)self countOfCollaboratorAdded];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v11[1] = @"countOfCollaboratorRemoved";
  v12[0] = v4;
  v6 = [(ICASCollaboratorData *)self countOfCollaboratorRemoved];
  if (v6)
  {
    uint64_t v7 = [(ICASCollaboratorData *)self countOfCollaboratorRemoved];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  id v8 = (void *)v7;
  v12[1] = v7;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

  return v9;
}

- (NSNumber)countOfCollaboratorAdded
{
  return self->_countOfCollaboratorAdded;
}

- (NSNumber)countOfCollaboratorRemoved
{
  return self->_countOfCollaboratorRemoved;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countOfCollaboratorRemoved, 0);
  objc_storeStrong((id *)&self->_countOfCollaboratorAdded, 0);
}

@end