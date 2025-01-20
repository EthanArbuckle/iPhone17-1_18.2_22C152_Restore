@interface _UITextInputSessionDictationBeganAction
- (id)description;
- (int64_t)inputActionCount;
- (int64_t)mergeActionIfPossible:(id)a3;
- (unint64_t)dictationBeganCount;
- (unint64_t)modelessUsedAtLeastOnceCount;
- (unint64_t)multiModalDictationBeganCount;
- (void)setDictationBeganCount:(unint64_t)a3;
- (void)setModelessUsedAtLeastOnceCount:(unint64_t)a3;
- (void)setMultiModalDictationBeganCount:(unint64_t)a3;
@end

@implementation _UITextInputSessionDictationBeganAction

- (int64_t)mergeActionIfPossible:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(_UITextInputSessionAction *)self source];
  if (v5 == [v4 source])
  {
    v6 = [v4 asDictationBegan];
    v7 = v6;
    if (v6)
    {
      -[_UITextInputSessionDictationBeganAction setDictationBeganCount:](self, "setDictationBeganCount:", -[_UITextInputSessionDictationBeganAction dictationBeganCount](self, "dictationBeganCount")+ [v6 dictationBeganCount]);
      -[_UITextInputSessionDictationBeganAction setModelessUsedAtLeastOnceCount:](self, "setModelessUsedAtLeastOnceCount:", -[_UITextInputSessionDictationBeganAction modelessUsedAtLeastOnceCount](self, "modelessUsedAtLeastOnceCount")+ [v7 modelessUsedAtLeastOnceCount]);
      -[_UITextInputSessionDictationBeganAction setMultiModalDictationBeganCount:](self, "setMultiModalDictationBeganCount:", -[_UITextInputSessionDictationBeganAction multiModalDictationBeganCount](self, "multiModalDictationBeganCount")+ [v7 multiModalDictationBeganCount]);
      int64_t v8 = 1;
    }
    else
    {
      int64_t v8 = 0;
    }
  }
  else
  {
    int64_t v8 = 0;
  }

  return v8;
}

- (id)description
{
  v11.receiver = self;
  v11.super_class = (Class)_UITextInputSessionDictationBeganAction;
  v3 = [(_UITextInputSessionAction *)&v11 description];
  id v4 = [MEMORY[0x1E4F1CA48] array];
  int64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"dictationBeganCount=%lu", -[_UITextInputSessionDictationBeganAction dictationBeganCount](self, "dictationBeganCount"));
  [v4 addObject:v5];

  v6 = objc_msgSend(NSString, "stringWithFormat:", @"modelessUsedAtLeastOnceCount=%lu", -[_UITextInputSessionDictationBeganAction modelessUsedAtLeastOnceCount](self, "modelessUsedAtLeastOnceCount"));
  [v4 addObject:v6];

  v7 = objc_msgSend(NSString, "stringWithFormat:", @"multiModalDictationBeganCount=%lu", -[_UITextInputSessionDictationBeganAction multiModalDictationBeganCount](self, "multiModalDictationBeganCount"));
  [v4 addObject:v7];

  int64_t v8 = [v4 componentsJoinedByString:@", "];
  v9 = [v3 stringByAppendingFormat:@", %@", v8];

  return v9;
}

- (int64_t)inputActionCount
{
  return 0;
}

- (unint64_t)dictationBeganCount
{
  return self->_dictationBeganCount;
}

- (void)setDictationBeganCount:(unint64_t)a3
{
  self->_dictationBeganCount = a3;
}

- (unint64_t)modelessUsedAtLeastOnceCount
{
  return self->_modelessUsedAtLeastOnceCount;
}

- (void)setModelessUsedAtLeastOnceCount:(unint64_t)a3
{
  self->_modelessUsedAtLeastOnceCount = a3;
}

- (unint64_t)multiModalDictationBeganCount
{
  return self->_multiModalDictationBeganCount;
}

- (void)setMultiModalDictationBeganCount:(unint64_t)a3
{
  self->_multiModalDictationBeganCount = a3;
}

@end