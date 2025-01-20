@interface UIAccessibilityCustomRotorItemResult
- (NSUUID)uuid;
- (UIAccessibilityCustomRotorItemResult)initWithTargetElement:(id)targetElement targetRange:(UITextRange *)targetRange;
- (UITextRange)targetRange;
- (id)targetElement;
- (void)setTargetElement:(id)targetElement;
- (void)setTargetRange:(UITextRange *)targetRange;
- (void)setUuid:(id)a3;
@end

@implementation UIAccessibilityCustomRotorItemResult

- (UIAccessibilityCustomRotorItemResult)initWithTargetElement:(id)targetElement targetRange:(UITextRange *)targetRange
{
  id v6 = targetElement;
  v7 = targetRange;
  v12.receiver = self;
  v12.super_class = (Class)UIAccessibilityCustomRotorItemResult;
  v8 = [(UIAccessibilityCustomRotorItemResult *)&v12 init];
  if (v8)
  {
    v9 = [MEMORY[0x1E4F29128] UUID];
    [(UIAccessibilityCustomRotorItemResult *)v8 setUuid:v9];

    [(UIAccessibilityCustomRotorItemResult *)v8 setTargetElement:v6];
    [(UIAccessibilityCustomRotorItemResult *)v8 setTargetRange:v7];
    v10 = v8;
  }

  return v8;
}

- (NSUUID)uuid
{
  return self->uuid;
}

- (void)setUuid:(id)a3
{
}

- (id)targetElement
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetElement);
  return WeakRetained;
}

- (void)setTargetElement:(id)targetElement
{
}

- (UITextRange)targetRange
{
  return self->_targetRange;
}

- (void)setTargetRange:(UITextRange *)targetRange
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetRange, 0);
  objc_destroyWeak((id *)&self->_targetElement);
  objc_storeStrong((id *)&self->uuid, 0);
}

@end