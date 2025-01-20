@interface _UIInputViewKeyboardOutput
+ (BOOL)supportsSecureCoding;
+ (id)outputWithKeyboardOutput:(id)a3;
- (BOOL)didBeginOutput;
- (BOOL)isEqual:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setDidBeginOutput:(BOOL)a3;
@end

@implementation _UIInputViewKeyboardOutput

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[_UIInputViewKeyboardOutput outputWithKeyboardOutput:self];
  objc_msgSend(v4, "setPositionOffset:", -[_UIInputViewKeyboardOutput positionOffset](self, "positionOffset"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    uint64_t v6 = [(_UIInputViewKeyboardOutput *)self deletionCount];
    if (v6 == [v5 deletionCount])
    {
      v7 = [(_UIInputViewKeyboardOutput *)self insertionText];
      uint64_t v8 = [v5 insertionText];
      if (v7 == (void *)v8)
      {
      }
      else
      {
        v9 = (void *)v8;
        v10 = [(_UIInputViewKeyboardOutput *)self insertionText];
        v11 = [v5 insertionText];
        int v12 = [v10 isEqualToString:v11];

        if (!v12) {
          goto LABEL_5;
        }
      }
      uint64_t v14 = [(_UIInputViewKeyboardOutput *)self positionOffset];
      BOOL v13 = v14 == [v5 positionOffset];
      goto LABEL_9;
    }
LABEL_5:
    BOOL v13 = 0;
LABEL_9:

    goto LABEL_10;
  }
  BOOL v13 = 0;
LABEL_10:

  return v13;
}

+ (id)outputWithKeyboardOutput:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(_UIInputViewKeyboardOutput);
  -[_UIInputViewKeyboardOutput setDeletionCount:](v4, "setDeletionCount:", [v3 deletionCount]);
  id v5 = [v3 insertionText];

  uint64_t v6 = (void *)[v5 copy];
  [(_UIInputViewKeyboardOutput *)v4 setInsertionText:v6];

  return v4;
}

- (BOOL)didBeginOutput
{
  return self->_didBeginOutput;
}

- (void)setDidBeginOutput:(BOOL)a3
{
  self->_didBeginOutput = a3;
}

@end