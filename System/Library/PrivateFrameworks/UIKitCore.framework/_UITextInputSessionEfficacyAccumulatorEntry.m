@interface _UITextInputSessionEfficacyAccumulatorEntry
+ (id)generateAccumulatorEntryFromAction:(id)a3;
- (BOOL)isAllZeroes;
- (int64_t)inputActions;
- (int64_t)netCharacters;
- (int64_t)netEmojiCharacters;
- (int64_t)userRemovedCharacters;
- (int64_t)userRemovedEmojiCharacters;
- (void)increaseWithEntry:(id)a3;
- (void)setInputActions:(int64_t)a3;
- (void)setNetCharacters:(int64_t)a3;
- (void)setNetEmojiCharacters:(int64_t)a3;
- (void)setUserRemovedCharacters:(int64_t)a3;
- (void)setUserRemovedEmojiCharacters:(int64_t)a3;
@end

@implementation _UITextInputSessionEfficacyAccumulatorEntry

+ (id)generateAccumulatorEntryFromAction:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(_UITextInputSessionEfficacyAccumulatorEntry);
  [(_UITextInputSessionEfficacyAccumulatorEntry *)v4 setNetCharacters:0];
  [(_UITextInputSessionEfficacyAccumulatorEntry *)v4 setUserRemovedCharacters:0];
  [(_UITextInputSessionEfficacyAccumulatorEntry *)v4 setNetEmojiCharacters:0];
  [(_UITextInputSessionEfficacyAccumulatorEntry *)v4 setUserRemovedEmojiCharacters:0];
  -[_UITextInputSessionEfficacyAccumulatorEntry setInputActions:](v4, "setInputActions:", [v3 inputActionCount]);
  v5 = [v3 asInsertion];
  v6 = v5;
  if (v5)
  {
    -[_UITextInputSessionEfficacyAccumulatorEntry setNetCharacters:](v4, "setNetCharacters:", [v5 insertedTextLength] - objc_msgSend(v5, "insertedEmojiCount"));
    [(_UITextInputSessionEfficacyAccumulatorEntry *)v4 setUserRemovedCharacters:0];
    -[_UITextInputSessionEfficacyAccumulatorEntry setNetEmojiCharacters:](v4, "setNetEmojiCharacters:", [v6 insertedEmojiCount]);
    [(_UITextInputSessionEfficacyAccumulatorEntry *)v4 setUserRemovedEmojiCharacters:0];
    v7 = v4;
  }
  else
  {
    v8 = [v3 asDeletion];
    v9 = v8;
    if (v8)
    {
      uint64_t v10 = [v8 removedTextLength];
      uint64_t v11 = v10 - [v9 removedEmojiCount];
      [(_UITextInputSessionEfficacyAccumulatorEntry *)v4 setNetCharacters:-v11];
      [(_UITextInputSessionEfficacyAccumulatorEntry *)v4 setUserRemovedCharacters:v11];
      -[_UITextInputSessionEfficacyAccumulatorEntry setNetEmojiCharacters:](v4, "setNetEmojiCharacters:", -[v9 removedEmojiCount]);
      -[_UITextInputSessionEfficacyAccumulatorEntry setUserRemovedEmojiCharacters:](v4, "setUserRemovedEmojiCharacters:", [v9 removedEmojiCount]);
      v12 = v4;
    }
    else
    {
      v13 = [v3 asReplaceText];
      v14 = v13;
      if (v13)
      {
        -[_UITextInputSessionEfficacyAccumulatorEntry setNetCharacters:](v4, "setNetCharacters:", [v13 insertedTextLength]- (objc_msgSend(v13, "insertedEmojiCount")+ objc_msgSend(v13, "removedTextLength"))+ objc_msgSend(v13, "removedEmojiCount"));
        [(_UITextInputSessionEfficacyAccumulatorEntry *)v4 setUserRemovedCharacters:0];
        -[_UITextInputSessionEfficacyAccumulatorEntry setNetEmojiCharacters:](v4, "setNetEmojiCharacters:", [v14 insertedEmojiCount] - objc_msgSend(v14, "removedEmojiCount"));
        [(_UITextInputSessionEfficacyAccumulatorEntry *)v4 setUserRemovedEmojiCharacters:0];
      }
      v15 = v4;
    }
  }

  return v4;
}

- (void)increaseWithEntry:(id)a3
{
  id v4 = a3;
  self->_netCharacters += [v4 netCharacters];
  self->_userRemovedCharacters += [v4 userRemovedCharacters];
  self->_netEmojiCharacters += [v4 netEmojiCharacters];
  self->_userRemovedEmojiCharacters += [v4 userRemovedEmojiCharacters];
  uint64_t v5 = [v4 inputActions];

  self->_inputActions += v5;
}

- (BOOL)isAllZeroes
{
  return !self->_netCharacters
      && !self->_userRemovedCharacters
      && !self->_netEmojiCharacters
      && !self->_userRemovedEmojiCharacters
      && self->_inputActions == 0;
}

- (int64_t)netCharacters
{
  return self->_netCharacters;
}

- (void)setNetCharacters:(int64_t)a3
{
  self->_netCharacters = a3;
}

- (int64_t)userRemovedCharacters
{
  return self->_userRemovedCharacters;
}

- (void)setUserRemovedCharacters:(int64_t)a3
{
  self->_userRemovedCharacters = a3;
}

- (int64_t)netEmojiCharacters
{
  return self->_netEmojiCharacters;
}

- (void)setNetEmojiCharacters:(int64_t)a3
{
  self->_netEmojiCharacters = a3;
}

- (int64_t)userRemovedEmojiCharacters
{
  return self->_userRemovedEmojiCharacters;
}

- (void)setUserRemovedEmojiCharacters:(int64_t)a3
{
  self->_userRemovedEmojiCharacters = a3;
}

- (int64_t)inputActions
{
  return self->_inputActions;
}

- (void)setInputActions:(int64_t)a3
{
  self->_inputActions = a3;
}

@end