@interface SHSheetDraggingAction
- (SHSheetDraggingAction)initWithDraggingEvent:(id)a3;
- (SHSheetDraggingEvent)draggingEvent;
@end

@implementation SHSheetDraggingAction

- (SHSheetDraggingAction)initWithDraggingEvent:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F62860];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setObject:v5 forSetting:3];

  v7 = [(SHSheetDraggingAction *)self initWithInfo:v6 responder:0];
  return v7;
}

- (SHSheetDraggingEvent)draggingEvent
{
  v2 = [(SHSheetDraggingAction *)self info];
  v3 = [v2 objectForSetting:3];

  return (SHSheetDraggingEvent *)v3;
}

@end