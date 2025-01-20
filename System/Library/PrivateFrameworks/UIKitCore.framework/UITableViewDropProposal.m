@interface UITableViewDropProposal
- (NSIndexPath)_adjustedTargetIndexPath;
- (UITableViewDropIntent)intent;
- (UITableViewDropProposal)initWithDropOperation:(UIDropOperation)operation intent:(UITableViewDropIntent)intent;
- (UITableViewDropProposal)initWithDropOperation:(unint64_t)a3;
- (UITableViewDropProposal)initWithDropOperation:(unint64_t)a3 dropLocation:(int64_t)a4;
- (id)_updatedDropProposalWithDropOperation:(unint64_t)a3 dropIntent:(int64_t)a4 adjustedTargetIndexPath:(id)a5;
- (int64_t)_dropAction;
- (int64_t)_dropLocation;
- (void)_setAdjustedTargetIndexPath:(id)a3;
- (void)setIntent:(int64_t)a3;
@end

@implementation UITableViewDropProposal

- (UITableViewDropProposal)initWithDropOperation:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UITableViewDropProposal;
  result = [(UIDropProposal *)&v4 initWithDropOperation:a3];
  if (result) {
    result->_intent = 0;
  }
  return result;
}

- (UITableViewDropProposal)initWithDropOperation:(unint64_t)a3 dropLocation:(int64_t)a4
{
  v5 = [(UITableViewDropProposal *)self initWithDropOperation:a3];
  if (v5)
  {
    if ((unint64_t)a4 >= 4)
    {
      v7 = [MEMORY[0x1E4F28B00] currentHandler];
      v8 = [NSString stringWithUTF8String:"UITableViewDropIntent _UITableViewDropIntentForDropLocation(UITableViewDropLocation)"];
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, @"_UITableViewDropCoordinator.m", 39, @"Unknown drop location value: %ld", a4);
    }
    else
    {
      int64_t v6 = qword_186B9D520[a4];
    }
    v5->_intent = v6;
  }
  return v5;
}

- (UITableViewDropProposal)initWithDropOperation:(UIDropOperation)operation intent:(UITableViewDropIntent)intent
{
  result = [(UITableViewDropProposal *)self initWithDropOperation:operation];
  if (result) {
    result->_intent = intent;
  }
  return result;
}

- (int64_t)_dropLocation
{
  unint64_t intent = self->_intent;
  if (intent < 4) {
    return qword_186B9D540[intent];
  }
  objc_super v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = [NSString stringWithUTF8String:"UITableViewDropLocation _UITableViewDropLocationForDropIntent(UITableViewDropIntent)"];
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"_UITableViewDropCoordinator.m", 26, @"Unknown drop intent value: %ld", intent);

  return result;
}

- (id)_updatedDropProposalWithDropOperation:(unint64_t)a3 dropIntent:(int64_t)a4 adjustedTargetIndexPath:(id)a5
{
  id v8 = a5;
  v9 = self;
  if ([(UIDropProposal *)v9 operation] != a3 || [(UITableViewDropProposal *)v9 intent] != a4)
  {
    v10 = [[UITableViewDropProposal alloc] initWithDropOperation:a3 intent:a4];

    v9 = v10;
  }
  [(UITableViewDropProposal *)v9 _setAdjustedTargetIndexPath:v8];

  return v9;
}

- (int64_t)_dropAction
{
  UIDropOperation v3 = [(UIDropProposal *)self operation];
  unint64_t v4 = [(UITableViewDropProposal *)self _dropLocation];
  if (v3 < UIDropOperationCopy) {
    return 3;
  }
  unint64_t v6 = v4;
  if (v4 < 4) {
    return qword_186B9D560[v4];
  }
  v7 = [MEMORY[0x1E4F28B00] currentHandler];
  id v8 = objc_msgSend(NSString, "stringWithUTF8String:", "UITableViewDropAction _UITableViewDropActionForDropOperationAndDropLocation(UIDropOperation, UITableViewDropLocation)");
  objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, @"_UITableViewDropCoordinator.m", 120, @"Unknown drop location value: %ld", v6);

  return result;
}

- (UITableViewDropIntent)intent
{
  return self->_intent;
}

- (void)setIntent:(int64_t)a3
{
  self->_unint64_t intent = a3;
}

- (NSIndexPath)_adjustedTargetIndexPath
{
  return self->_adjustedTargetIndexPath;
}

- (void)_setAdjustedTargetIndexPath:(id)a3
{
}

- (void).cxx_destruct
{
}

@end