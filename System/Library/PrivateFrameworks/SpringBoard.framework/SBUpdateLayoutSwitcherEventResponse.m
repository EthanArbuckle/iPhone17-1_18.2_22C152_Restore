@interface SBUpdateLayoutSwitcherEventResponse
- (SBUpdateLayoutSwitcherEventResponse)initWithOptions:(unint64_t)a3 updateMode:(int64_t)a4;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (int64_t)type;
- (int64_t)updateMode;
- (unint64_t)options;
@end

@implementation SBUpdateLayoutSwitcherEventResponse

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SBUpdateLayoutSwitcherEventResponse;
  v4 = [(SBChainableModifierEventResponse *)&v9 descriptionBuilderWithMultilinePrefix:a3];
  v5 = v4;
  unint64_t options = self->_options;
  if ((options & 2) != 0)
  {
    [v4 appendString:@"updateVisibleItems" withName:0];
    unint64_t options = self->_options;
    if ((options & 4) == 0)
    {
LABEL_3:
      if ((options & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((options & 4) == 0)
  {
    goto LABEL_3;
  }
  [v5 appendString:@"layout" withName:0];
  unint64_t options = self->_options;
  if ((options & 8) == 0)
  {
LABEL_4:
    if ((options & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  [v5 appendString:@"style" withName:0];
  if ((self->_options & 0x20) != 0) {
LABEL_5:
  }
    [v5 appendString:@"setNeedsLayout" withName:0];
LABEL_6:
  v7 = SBStringFromAnimationUpdateMode();
  [v5 appendString:v7 withName:@"mode"];

  return v5;
}

- (int64_t)type
{
  return 10;
}

- (int64_t)updateMode
{
  return self->_updateMode;
}

- (unint64_t)options
{
  return self->_options;
}

- (SBUpdateLayoutSwitcherEventResponse)initWithOptions:(unint64_t)a3 updateMode:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SBUpdateLayoutSwitcherEventResponse;
  result = [(SBChainableModifierEventResponse *)&v7 init];
  if (result)
  {
    result->_unint64_t options = a3;
    result->_updateMode = a4;
  }
  return result;
}

@end