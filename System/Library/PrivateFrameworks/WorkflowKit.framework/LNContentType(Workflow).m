@interface LNContentType(Workflow)
- (id)wf_fileType;
- (id)wf_initWithFileType:()Workflow;
@end

@implementation LNContentType(Workflow)

- (id)wf_initWithFileType:()Workflow
{
  id v4 = a1;
  v5 = [a3 string];
  v6 = (void *)[v4 initWithContentType:v5];

  return v6;
}

- (id)wf_fileType
{
  v1 = (void *)MEMORY[0x1E4FB4718];
  v2 = [a1 contentType];
  v3 = [v1 typeWithString:v2];

  return v3;
}

@end