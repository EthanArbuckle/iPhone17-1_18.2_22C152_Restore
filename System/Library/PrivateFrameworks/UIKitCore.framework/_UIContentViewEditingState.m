@interface _UIContentViewEditingState
- (NSString)proposedReplacementText;
- (NSString)text;
- (_NSRange)proposedReplacementRange;
- (_UIContentViewEditingState)initWithText:(id)a3;
- (_UIContentViewEditingState)initWithText:(id)a3 proposedReplacementText:(id)a4 proposedReplacementRange:(_NSRange)a5;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation _UIContentViewEditingState

- (_UIContentViewEditingState)initWithText:(id)a3
{
  return -[_UIContentViewEditingState initWithText:proposedReplacementText:proposedReplacementRange:](self, "initWithText:proposedReplacementText:proposedReplacementRange:", a3, 0, 0x7FFFFFFFFFFFFFFFLL, 0);
}

- (_UIContentViewEditingState)initWithText:(id)a3 proposedReplacementText:(id)a4 proposedReplacementRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v10 = a3;
  id v11 = a4;
  if (!v10)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"_UIContentViewEditingConfiguration.m", 75, @"Invalid parameter not satisfying: %@", @"text" object file lineNumber description];
  }
  v19.receiver = self;
  v19.super_class = (Class)_UIContentViewEditingState;
  v12 = [(_UIContentViewEditingState *)&v19 init];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    text = v12->_text;
    v12->_text = (NSString *)v13;

    uint64_t v15 = [v11 copy];
    proposedReplacementText = v12->_proposedReplacementText;
    v12->_proposedReplacementText = (NSString *)v15;

    v12->_proposedReplacementRange.NSUInteger location = location;
    v12->_proposedReplacementRange.NSUInteger length = length;
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    uint64_t v5 = [(NSString *)self->_text copy];
    v6 = *(void **)(v4 + 8);
    *(void *)(v4 + 8) = v5;

    *(_NSRange *)(v4 + 24) = self->_proposedReplacementRange;
    uint64_t v7 = [(NSString *)self->_proposedReplacementText copy];
    v8 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v7;
  }
  return (id)v4;
}

- (NSString)text
{
  return self->_text;
}

- (NSString)proposedReplacementText
{
  return self->_proposedReplacementText;
}

- (_NSRange)proposedReplacementRange
{
  NSUInteger length = self->_proposedReplacementRange.length;
  NSUInteger location = self->_proposedReplacementRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proposedReplacementText, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end