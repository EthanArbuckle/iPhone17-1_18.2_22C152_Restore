@interface TRILogTreatmentReader
+ (id)readerWithProjectId:(int)a3 paths:(id)a4;
- (NSString)path;
- (TRILogTreatmentReader)initWithProjectId:(int)a3 paths:(id)a4;
- (id)fetchRolloutLogNamespaces;
- (id)namespaceLoggingTreatmentPath;
- (id)treatments;
@end

@implementation TRILogTreatmentReader

- (id)treatments
{
  v2 = (void *)MEMORY[0x1E4F1C9B8];
  v3 = [(TRILogTreatmentReader *)self path];
  uint64_t v9 = 0;
  v4 = [v2 dataWithContentsOfFile:v3 options:8 error:&v9];

  if ([v4 length])
  {
    v5 = (void *)[objc_alloc(MEMORY[0x1E4FB0550]) initWithData:v4];
    v6 = v5;
    if (v5 && [v5 treatmentsCount])
    {
      v7 = [v6 treatments];
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)path
{
  v9[4] = *MEMORY[0x1E4F143B8];
  v3 = NSString;
  v4 = [(TRIPaths *)self->_paths namespaceDescriptorsDir];
  v5 = objc_msgSend(NSString, "stringWithFormat:", @"%d", self->_projectId, v4, @"Projects");
  v9[2] = v5;
  v9[3] = @"treatmentsV2.data";
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:4];
  v7 = [v3 pathWithComponents:v6];

  return (NSString *)v7;
}

+ (id)readerWithProjectId:(int)a3 paths:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = a4;
  int IsValidValue = TRIProject_ProjectId_IsValidValue();
  v7 = 0;
  if (v4 && IsValidValue) {
    v7 = [[TRILogTreatmentReader alloc] initWithProjectId:v4 paths:v5];
  }

  return v7;
}

- (TRILogTreatmentReader)initWithProjectId:(int)a3 paths:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TRILogTreatmentReader;
  v8 = [(TRILogTreatmentReader *)&v11 init];
  uint64_t v9 = v8;
  if (v8)
  {
    v8->_projectId = a3;
    objc_storeStrong((id *)&v8->_paths, a4);
  }

  return v9;
}

- (void).cxx_destruct
{
}

- (id)namespaceLoggingTreatmentPath
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v2 = NSString;
  v3 = [(TRIPaths *)self->_paths namespaceDescriptorsDir];
  v7[0] = v3;
  v7[1] = @"logTreamentNamespaceData.data";
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  id v5 = [v2 pathWithComponents:v4];

  return v5;
}

- (id)fetchRolloutLogNamespaces
{
  id v3 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  uint64_t v4 = [(TRILogTreatmentReader *)self namespaceLoggingTreatmentPath];
  id v5 = (void *)[v3 initWithContentsOfFile:v4 options:1 error:0];

  if ([v5 length])
  {
    v6 = (void *)[objc_alloc(MEMORY[0x1E4FB0598]) initWithData:v5];
    if ([v6 namespacesCount])
    {
      id v7 = [v6 namespaces];
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

@end