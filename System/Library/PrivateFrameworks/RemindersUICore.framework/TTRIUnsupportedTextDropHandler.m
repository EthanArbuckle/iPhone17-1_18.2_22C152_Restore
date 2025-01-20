@interface TTRIUnsupportedTextDropHandler
- (_TtC15RemindersUICore30TTRIUnsupportedTextDropHandler)init;
- (id)textDroppableView:(id)a3 proposalForDrop:(id)a4;
- (unint64_t)textDroppableView:(id)a3 willBecomeEditableForDrop:(id)a4;
@end

@implementation TTRIUnsupportedTextDropHandler

- (_TtC15RemindersUICore30TTRIUnsupportedTextDropHandler)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(TTRIUnsupportedTextDropHandler *)&v3 init];
}

- (id)textDroppableView:(id)a3 proposalForDrop:(id)a4
{
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1D60]), sel_initWithDropOperation_, 0);

  return v4;
}

- (unint64_t)textDroppableView:(id)a3 willBecomeEditableForDrop:(id)a4
{
  return 0;
}

@end