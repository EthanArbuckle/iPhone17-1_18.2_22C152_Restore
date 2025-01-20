@interface SHSheetPulsingAction
- (SHSheetPulsingAction)initWithEvent:(id)a3;
- (SHSheetPulsingEvent)event;
@end

@implementation SHSheetPulsingAction

- (SHSheetPulsingAction)initWithEvent:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F62860];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setObject:v5 forSetting:2];

  v7 = [(SHSheetPulsingAction *)self initWithInfo:v6 responder:0];
  return v7;
}

- (SHSheetPulsingEvent)event
{
  v2 = [(SHSheetPulsingAction *)self info];
  v3 = [v2 objectForSetting:2];

  return (SHSheetPulsingEvent *)v3;
}

@end