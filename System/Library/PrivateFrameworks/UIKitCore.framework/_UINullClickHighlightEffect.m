@interface _UINullClickHighlightEffect
+ (id)effectWithPreview:(id)a3 continuingFromPreview:(id)a4;
- (UITargetedPreview)targetedPreview;
- (id)completionBlock;
- (void)interaction:(id)a3 didChangeWithContext:(id)a4;
- (void)setCompletionBlock:(id)a3;
@end

@implementation _UINullClickHighlightEffect

+ (id)effectWithPreview:(id)a3 continuingFromPreview:(id)a4
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = (void *)v5[1];
  v5[1] = v4;

  return v5;
}

- (void)interaction:(id)a3 didChangeWithContext:(id)a4
{
  if (objc_msgSend(a4, "ended", a3))
  {
    uint64_t v6 = [(_UINullClickHighlightEffect *)self completionBlock];
    [(_UINullClickHighlightEffect *)self setCompletionBlock:0];
    v5 = (void *)v6;
    if (v6)
    {
      (*(void (**)(uint64_t, _UINullClickHighlightEffect *))(v6 + 16))(v6, self);
      v5 = (void *)v6;
    }
  }
}

- (UITargetedPreview)targetedPreview
{
  return self->_targetedPreview;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_targetedPreview, 0);
}

@end