@interface UITextDropProposal
- (BOOL)useFastSameViewOperations;
- (UITextDropAction)dropAction;
- (UITextDropPerformer)dropPerformer;
- (UITextDropProgressMode)dropProgressMode;
- (UITextDropProposal)initWithDropOperation:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setDropAction:(UITextDropAction)dropAction;
- (void)setDropPerformer:(UITextDropPerformer)dropPerformer;
- (void)setDropProgressMode:(UITextDropProgressMode)dropProgressMode;
- (void)setUseFastSameViewOperations:(BOOL)useFastSameViewOperations;
@end

@implementation UITextDropProposal

- (UITextDropProposal)initWithDropOperation:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UITextDropProposal;
  v3 = [(UIDropProposal *)&v6 initWithDropOperation:a3];
  v4 = v3;
  if (v3)
  {
    [(UIDropProposal *)v3 setPrecise:1];
    [(UITextDropProposal *)v4 setDropAction:0];
    [(UITextDropProposal *)v4 setUseFastSameViewOperations:1];
    [(UITextDropProposal *)v4 setDropProgressMode:0];
    [(UITextDropProposal *)v4 setDropPerformer:0];
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UITextDropProposal;
  id v4 = [(UIDropProposal *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setDropAction:", -[UITextDropProposal dropAction](self, "dropAction"));
  objc_msgSend(v4, "setUseFastSameViewOperations:", -[UITextDropProposal useFastSameViewOperations](self, "useFastSameViewOperations"));
  objc_msgSend(v4, "setDropProgressMode:", -[UITextDropProposal dropProgressMode](self, "dropProgressMode"));
  objc_msgSend(v4, "setDropPerformer:", -[UITextDropProposal dropPerformer](self, "dropPerformer"));
  return v4;
}

- (UITextDropAction)dropAction
{
  return self->_dropAction;
}

- (void)setDropAction:(UITextDropAction)dropAction
{
  self->_dropAction = dropAction;
}

- (UITextDropProgressMode)dropProgressMode
{
  return self->_dropProgressMode;
}

- (void)setDropProgressMode:(UITextDropProgressMode)dropProgressMode
{
  self->_dropProgressMode = dropProgressMode;
}

- (BOOL)useFastSameViewOperations
{
  return self->_useFastSameViewOperations;
}

- (void)setUseFastSameViewOperations:(BOOL)useFastSameViewOperations
{
  self->_useFastSameViewOperations = useFastSameViewOperations;
}

- (UITextDropPerformer)dropPerformer
{
  return self->_dropPerformer;
}

- (void)setDropPerformer:(UITextDropPerformer)dropPerformer
{
  self->_dropPerformer = dropPerformer;
}

@end