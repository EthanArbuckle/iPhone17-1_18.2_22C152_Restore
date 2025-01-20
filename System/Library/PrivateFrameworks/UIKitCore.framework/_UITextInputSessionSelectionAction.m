@interface _UITextInputSessionSelectionAction
- (_NSRange)rangeAfter;
- (id)description;
- (int64_t)mergeActionIfPossible:(id)a3;
- (int64_t)textInputActionsType;
- (void)setRangeAfter:(_NSRange)a3;
@end

@implementation _UITextInputSessionSelectionAction

- (int64_t)mergeActionIfPossible:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(_UITextInputSessionAction *)self source];
  if (v5 == [v4 source]
    && (int64_t v6 = -[_UITextInputSessionAction flagOptions](self, "flagOptions"), v6 == [v4 flagOptions]))
  {
    v7 = [v4 asSelection];
    if (v7
      && (([(_UITextInputSessionSelectionAction *)self rangeAfter], !v8)
       && ([(_UITextInputSessionAction *)self relativeRangeBefore], !v9)
       && ([v7 rangeAfter], !v10)
       || ([(_UITextInputSessionSelectionAction *)self rangeAfter], v11)
       && ([(_UITextInputSessionAction *)self relativeRangeBefore], v12)
       && ([v7 rangeAfter], v13)))
    {
      uint64_t v14 = [v7 rangeAfter];
      -[_UITextInputSessionSelectionAction setRangeAfter:](self, "setRangeAfter:", v14, v15);
      -[_UITextInputSessionAction setInputActionCountFromMergedActions:](self, "setInputActionCountFromMergedActions:", -[_UITextInputSessionAction inputActionCountFromMergedActions](self, "inputActionCountFromMergedActions")+ [v7 inputActionCount]);
      int64_t v16 = 1;
    }
    else
    {
      int64_t v16 = 0;
    }
  }
  else
  {
    int64_t v16 = 0;
  }

  return v16;
}

- (id)description
{
  v11.receiver = self;
  v11.super_class = (Class)_UITextInputSessionSelectionAction;
  v3 = [(_UITextInputSessionAction *)&v11 description];
  id v4 = [MEMORY[0x1E4F1CA48] array];
  int64_t v5 = NSString;
  v13.location = [(_UITextInputSessionSelectionAction *)self rangeAfter];
  int64_t v6 = NSStringFromRange(v13);
  v7 = [v5 stringWithFormat:@"rangeAfter=%@", v6];
  [v4 addObject:v7];

  uint64_t v8 = [v4 componentsJoinedByString:@", "];
  uint64_t v9 = [v3 stringByAppendingFormat:@", %@", v8];

  return v9;
}

- (int64_t)textInputActionsType
{
  [(_UITextInputSessionSelectionAction *)self rangeAfter];
  if (v2) {
    return 9;
  }
  else {
    return 8;
  }
}

- (_NSRange)rangeAfter
{
  p_rangeAfter = &self->_rangeAfter;
  NSUInteger location = self->_rangeAfter.location;
  NSUInteger length = p_rangeAfter->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRangeAfter:(_NSRange)a3
{
  self->_rangeAfter = a3;
}

@end