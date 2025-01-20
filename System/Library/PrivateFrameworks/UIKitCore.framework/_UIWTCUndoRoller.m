@interface _UIWTCUndoRoller
- (BOOL)hasFouled;
- (NSAttributedString)evaluatedText;
- (NSAttributedString)rolledReplacement;
- (_UIWTCUndoRoller)initWithEvaluatedText:(id)a3 offset:(unint64_t)a4;
- (unint64_t)offset;
- (void)replaceRange:(_NSRange)a3 withText:(id)a4;
@end

@implementation _UIWTCUndoRoller

- (_UIWTCUndoRoller)initWithEvaluatedText:(id)a3 offset:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UIWTCUndoRoller;
  v8 = [(_UIWTCUndoRoller *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_evaluatedText, a3);
    v9->_offset = a4;
  }

  return v9;
}

- (void)replaceRange:(_NSRange)a3 withText:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  if (!self->_hasFouled)
  {
    if (!self->_rolledReplacement)
    {
      id v13 = v7;
      v8 = (NSMutableAttributedString *)[(NSAttributedString *)self->_evaluatedText mutableCopy];
      rolledReplacement = self->_rolledReplacement;
      self->_rolledReplacement = v8;

      id v7 = v13;
    }
    unint64_t offset = self->_offset;
    if (location >= offset
      && (unint64_t v11 = location + length - offset,
          id v14 = v7,
          unint64_t v12 = [(NSMutableAttributedString *)self->_rolledReplacement length],
          id v7 = v14,
          v11 <= v12))
    {
      if (!self->_hasFouled)
      {
        -[NSMutableAttributedString replaceCharactersInRange:withAttributedString:](self->_rolledReplacement, "replaceCharactersInRange:withAttributedString:", location - self->_offset, length, v14);
        id v7 = v14;
      }
    }
    else
    {
      self->_hasFouled = 1;
    }
  }
}

- (NSAttributedString)rolledReplacement
{
  if (self->_hasFouled || (rolledReplacement = self->_rolledReplacement) == 0) {
    v2 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:&stru_1ED0E84C0];
  }
  else {
    v2 = (void *)[(NSMutableAttributedString *)rolledReplacement copy];
  }
  return (NSAttributedString *)v2;
}

- (NSAttributedString)evaluatedText
{
  return self->_evaluatedText;
}

- (unint64_t)offset
{
  return self->_offset;
}

- (BOOL)hasFouled
{
  return self->_hasFouled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_evaluatedText, 0);
  objc_storeStrong((id *)&self->_rolledReplacement, 0);
}

@end