@interface _UIImageViewPendingSymbolContentTransition
+ (id)transitionWithTransition:(id)a3 sourceSymbolImage:(id)a4 targetSymbolImage:(id)a5 options:(id)a6 completion:(id)a7;
- (BOOL)isPendingLayoutPass;
- (CGRect)initialSymbolAbsoluteRect;
- (NSSymbolContentTransition)symbolContentTransition;
- (NSSymbolEffectOptions)options;
- (UIImage)sourceSymbolImage;
- (UIImage)targetSymbolImage;
- (_UIImageViewPendingSymbolContentTransition)init;
- (id)completionHandler;
- (void)setInitialSymbolAbsoluteRect:(CGRect)a3;
- (void)setPendingLayoutPass:(BOOL)a3;
@end

@implementation _UIImageViewPendingSymbolContentTransition

- (_UIImageViewPendingSymbolContentTransition)init
{
  v4.receiver = self;
  v4.super_class = (Class)_UIImageViewPendingSymbolContentTransition;
  result = [(_UIImageViewPendingSymbolContentTransition *)&v4 init];
  if (result)
  {
    CGSize v3 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    result->_initialSymbolAbsoluteRect.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    result->_initialSymbolAbsoluteRect.size = v3;
  }
  return result;
}

+ (id)transitionWithTransition:(id)a3 sourceSymbolImage:(id)a4 targetSymbolImage:(id)a5 options:(id)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v16 = objc_opt_new();
  v17 = (void *)v16[2];
  v16[2] = v11;
  id v18 = v11;

  v19 = (void *)v16[5];
  v16[5] = v12;
  id v20 = v12;

  v21 = (void *)v16[6];
  v16[6] = v13;
  id v22 = v13;

  v23 = (void *)v16[3];
  v16[3] = v14;
  id v24 = v14;

  v25 = _Block_copy(v15);
  v26 = (void *)v16[4];
  v16[4] = v25;

  return v16;
}

- (NSSymbolContentTransition)symbolContentTransition
{
  return self->_symbolContentTransition;
}

- (NSSymbolEffectOptions)options
{
  return self->_options;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (UIImage)sourceSymbolImage
{
  return self->_sourceSymbolImage;
}

- (UIImage)targetSymbolImage
{
  return self->_targetSymbolImage;
}

- (BOOL)isPendingLayoutPass
{
  return self->_pendingLayoutPass;
}

- (void)setPendingLayoutPass:(BOOL)a3
{
  self->_pendingLayoutPass = a3;
}

- (CGRect)initialSymbolAbsoluteRect
{
  double x = self->_initialSymbolAbsoluteRect.origin.x;
  double y = self->_initialSymbolAbsoluteRect.origin.y;
  double width = self->_initialSymbolAbsoluteRect.size.width;
  double height = self->_initialSymbolAbsoluteRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setInitialSymbolAbsoluteRect:(CGRect)a3
{
  self->_initialSymbolAbsoluteRect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetSymbolImage, 0);
  objc_storeStrong((id *)&self->_sourceSymbolImage, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_symbolContentTransition, 0);
}

@end