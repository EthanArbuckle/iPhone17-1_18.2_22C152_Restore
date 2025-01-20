@interface SHSheetCloudShareResultAction
- (SFCollaborationCloudSharingResult)result;
- (SHSheetCloudShareResultAction)initWithResult:(id)a3;
@end

@implementation SHSheetCloudShareResultAction

- (SHSheetCloudShareResultAction)initWithResult:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F62860];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v7 = [[_WrapperForNonBSXPCCodingConformingClass alloc] initWithObject:v5];

  [v6 setObject:v7 forSetting:6];
  v8 = [(SHSheetCloudShareResultAction *)self initWithInfo:v6 responder:0];

  return v8;
}

- (SFCollaborationCloudSharingResult)result
{
  v2 = [(SHSheetCloudShareResultAction *)self info];
  v3 = [v2 objectForSetting:6];

  v4 = [v3 object];

  return (SFCollaborationCloudSharingResult *)v4;
}

@end