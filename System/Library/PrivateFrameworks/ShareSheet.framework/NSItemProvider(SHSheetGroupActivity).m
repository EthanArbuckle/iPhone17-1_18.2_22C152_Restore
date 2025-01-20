@interface NSItemProvider(SHSheetGroupActivity)
- (void)loadGroupActivityMetadataWithCompletion:()SHSheetGroupActivity;
@end

@implementation NSItemProvider(SHSheetGroupActivity)

- (void)loadGroupActivityMetadataWithCompletion:()SHSheetGroupActivity
{
  id v4 = a3;
  v5 = +[SHSheetGroupActivity groupActivityType];
  char v6 = [a1 hasItemConformingToTypeIdentifier:v5];

  if (v6)
  {
    v7 = +[SHSheetGroupActivity groupActivityType];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __80__NSItemProvider_SHSheetGroupActivity__loadGroupActivityMetadataWithCompletion___block_invoke;
    v8[3] = &unk_1E5A228F8;
    id v9 = v4;
    [a1 loadItemForTypeIdentifier:v7 options:0 completionHandler:v8];
  }
  else
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

@end