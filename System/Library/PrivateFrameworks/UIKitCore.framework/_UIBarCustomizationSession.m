@interface _UIBarCustomizationSession
+ (_UIBarCustomizationSession)sessionWithVisibleItems:(id)a3 additionalItems:(id)a4;
- (NSArray)additionalItems;
- (NSArray)sourceItems;
- (NSArray)visibleItems;
- (NSMutableArray)_mutableAdditionalItems;
- (NSMutableArray)_mutableVisibleItems;
- (_UIBarCustomizerAnimating)beginAnimationCoordinator;
- (_UIBarCustomizerAnimating)endAnimationCoordinator;
- (void)setSourceItems:(id)a3;
- (void)set_mutableAdditionalItems:(id)a3;
- (void)set_mutableVisibleItems:(id)a3;
@end

@implementation _UIBarCustomizationSession

+ (_UIBarCustomizationSession)sessionWithVisibleItems:(id)a3 additionalItems:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  v8 = (void *)[v6 copy];
  [v7 setSourceItems:v8];

  v9 = (void *)[v6 mutableCopy];
  objc_msgSend(v7, "set_mutableVisibleItems:", v9);

  v10 = (void *)[v5 mutableCopy];
  objc_msgSend(v7, "set_mutableAdditionalItems:", v10);

  return (_UIBarCustomizationSession *)v7;
}

- (_UIBarCustomizerAnimating)beginAnimationCoordinator
{
  beginAnimationCoordinator = self->_beginAnimationCoordinator;
  if (!beginAnimationCoordinator)
  {
    v4 = (_UIBarCustomizerAnimating *)objc_opt_new();
    id v5 = self->_beginAnimationCoordinator;
    self->_beginAnimationCoordinator = v4;

    beginAnimationCoordinator = self->_beginAnimationCoordinator;
  }
  return beginAnimationCoordinator;
}

- (_UIBarCustomizerAnimating)endAnimationCoordinator
{
  endAnimationCoordinator = self->_endAnimationCoordinator;
  if (!endAnimationCoordinator)
  {
    v4 = (_UIBarCustomizerAnimating *)objc_opt_new();
    id v5 = self->_endAnimationCoordinator;
    self->_endAnimationCoordinator = v4;

    endAnimationCoordinator = self->_endAnimationCoordinator;
  }
  return endAnimationCoordinator;
}

- (NSArray)visibleItems
{
  v2 = (void *)MEMORY[0x1E4F1C978];
  v3 = [(_UIBarCustomizationSession *)self _mutableVisibleItems];
  v4 = [v2 arrayWithArray:v3];

  return (NSArray *)v4;
}

- (NSArray)additionalItems
{
  v2 = (void *)MEMORY[0x1E4F1C978];
  v3 = [(_UIBarCustomizationSession *)self _mutableAdditionalItems];
  v4 = [v2 arrayWithArray:v3];

  return (NSArray *)v4;
}

- (NSArray)sourceItems
{
  return self->_sourceItems;
}

- (void)setSourceItems:(id)a3
{
}

- (NSMutableArray)_mutableVisibleItems
{
  return self->__mutableVisibleItems;
}

- (void)set_mutableVisibleItems:(id)a3
{
}

- (NSMutableArray)_mutableAdditionalItems
{
  return self->__mutableAdditionalItems;
}

- (void)set_mutableAdditionalItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__mutableAdditionalItems, 0);
  objc_storeStrong((id *)&self->__mutableVisibleItems, 0);
  objc_storeStrong((id *)&self->_sourceItems, 0);
  objc_storeStrong((id *)&self->_endAnimationCoordinator, 0);
  objc_storeStrong((id *)&self->_beginAnimationCoordinator, 0);
}

@end