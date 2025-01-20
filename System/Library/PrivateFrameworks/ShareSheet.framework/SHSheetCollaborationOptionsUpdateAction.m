@interface SHSheetCollaborationOptionsUpdateAction
- (SHSheetCollaborationOptionsUpdateAction)initWithCollaborationOptions:(id)a3;
- (_SWCollaborationShareOptions)collaborationOptions;
@end

@implementation SHSheetCollaborationOptionsUpdateAction

- (SHSheetCollaborationOptionsUpdateAction)initWithCollaborationOptions:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F62860];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v7 = [[_WrapperForNonBSXPCCodingConformingClass alloc] initWithObject:v5];

  [v6 setObject:v7 forSetting:5];
  v8 = [(SHSheetCollaborationOptionsUpdateAction *)self initWithInfo:v6 responder:0];

  return v8;
}

- (_SWCollaborationShareOptions)collaborationOptions
{
  v2 = [(SHSheetCollaborationOptionsUpdateAction *)self info];
  v3 = [v2 objectForSetting:5];

  v4 = [v3 object];

  return (_SWCollaborationShareOptions *)v4;
}

@end