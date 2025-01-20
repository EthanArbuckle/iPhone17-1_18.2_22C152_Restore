@interface SHSheetScrollingTestAction
- (SHSheetScrollingTest)test;
- (SHSheetScrollingTestAction)initWithTest:(id)a3;
@end

@implementation SHSheetScrollingTestAction

- (SHSheetScrollingTestAction)initWithTest:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F62860];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setObject:v5 forSetting:4];

  v7 = [(SHSheetScrollingTestAction *)self initWithInfo:v6 responder:0];
  return v7;
}

- (SHSheetScrollingTest)test
{
  v2 = [(SHSheetScrollingTestAction *)self info];
  v3 = [v2 objectForSetting:4];

  return (SHSheetScrollingTest *)v3;
}

@end