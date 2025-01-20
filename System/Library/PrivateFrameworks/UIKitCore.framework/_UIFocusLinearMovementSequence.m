@interface _UIFocusLinearMovementSequence
+ (id)sequenceWithItems:(id)a3 loops:(BOOL)a4;
+ (id)sequenceWithItems:(id)a3 loops:(BOOL)a4 restrictEnteringSequence:(BOOL)a5;
- (BOOL)isLooping;
- (BOOL)restrictsEnteringSequence;
- (NSArray)items;
- (_UIFocusLinearMovementSequence)init;
- (_UIFocusLinearMovementSequence)initWithItems:(id)a3 loops:(BOOL)a4;
- (_UIFocusLinearMovementSequence)initWithItems:(id)a3 loops:(BOOL)a4 restrictEnteringSequence:(BOOL)a5;
@end

@implementation _UIFocusLinearMovementSequence

+ (id)sequenceWithItems:(id)a3 loops:(BOOL)a4 restrictEnteringSequence:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = a3;
  v8 = [[_UIFocusLinearMovementSequence alloc] initWithItems:v7 loops:v6 restrictEnteringSequence:v5];

  return v8;
}

+ (id)sequenceWithItems:(id)a3 loops:(BOOL)a4
{
  return (id)[a1 sequenceWithItems:a3 loops:a4 restrictEnteringSequence:0];
}

- (_UIFocusLinearMovementSequence)init
{
  return [(_UIFocusLinearMovementSequence *)self initWithItems:MEMORY[0x1E4F1CBF0] loops:0 restrictEnteringSequence:0];
}

- (_UIFocusLinearMovementSequence)initWithItems:(id)a3 loops:(BOOL)a4
{
  return [(_UIFocusLinearMovementSequence *)self initWithItems:a3 loops:a4 restrictEnteringSequence:0];
}

- (_UIFocusLinearMovementSequence)initWithItems:(id)a3 loops:(BOOL)a4 restrictEnteringSequence:(BOOL)a5
{
  id v9 = a3;
  if (!v9)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"_UIFocusLinearMovementSequence.m", 31, @"Invalid parameter not satisfying: %@", @"items" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)_UIFocusLinearMovementSequence;
  v10 = [(_UIFocusLinearMovementSequence *)&v15 init];
  if (v10)
  {
    uint64_t v11 = [v9 copy];
    items = v10->_items;
    v10->_items = (NSArray *)v11;

    v10->_looping = a4;
    v10->_restrictEnteringSequence = a5;
  }

  return v10;
}

- (NSArray)items
{
  return self->_items;
}

- (BOOL)isLooping
{
  return self->_looping;
}

- (BOOL)restrictsEnteringSequence
{
  return self->_restrictEnteringSequence;
}

- (void).cxx_destruct
{
}

@end