@interface SearchUICopyButtonItemGenerator
- (void)generateSearchUIButtonItemsWithSFButtonItem:(id)a3 completion:(id)a4;
@end

@implementation SearchUICopyButtonItemGenerator

- (void)generateSearchUIButtonItemsWithSFButtonItem:(id)a3 completion:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  v8 = [[SearchUICopyButtonItem alloc] initWithSFButtonItem:v7];

  v10[0] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  (*((void (**)(id, void *, uint64_t))a4 + 2))(v6, v9, 1);
}

@end