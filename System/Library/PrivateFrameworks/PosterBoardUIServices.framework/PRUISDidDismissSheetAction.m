@interface PRUISDidDismissSheetAction
- (PRUISDidDismissSheetAction)initWithResponse:(id)a3;
- (PRUISModalEntryPointResponse)response;
@end

@implementation PRUISDidDismissSheetAction

- (PRUISDidDismissSheetAction)initWithResponse:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F29C78];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setObject:v5 forSetting:1];

  v9.receiver = self;
  v9.super_class = (Class)PRUISDidDismissSheetAction;
  v7 = [(PRUISDidDismissSheetAction *)&v9 initWithInfo:v6 responder:0];

  return v7;
}

- (PRUISModalEntryPointResponse)response
{
  v2 = [(PRUISDidDismissSheetAction *)self info];
  v3 = [v2 objectForSetting:1];

  return (PRUISModalEntryPointResponse *)v3;
}

@end