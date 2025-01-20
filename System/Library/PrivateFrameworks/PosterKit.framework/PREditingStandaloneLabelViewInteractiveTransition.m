@interface PREditingStandaloneLabelViewInteractiveTransition
- (NSString)currentText;
- (NSString)description;
- (NSString)transitionText;
- (PREditingStandaloneLabelView)label;
- (PREditingStandaloneLabelViewInteractiveTransition)initWithLabel:(id)a3 currentText:(id)a4 transitionText:(id)a5;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)cancelInteractiveTransition;
- (void)finishInteractiveTransition;
- (void)updateInteractiveTransition:(double)a3;
@end

@implementation PREditingStandaloneLabelViewInteractiveTransition

- (PREditingStandaloneLabelViewInteractiveTransition)initWithLabel:(id)a3 currentText:(id)a4 transitionText:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)PREditingStandaloneLabelViewInteractiveTransition;
  v11 = [(PREditingStandaloneLabelViewInteractiveTransition *)&v18 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_label, v8);
    uint64_t v13 = [v9 copy];
    currentText = v12->_currentText;
    v12->_currentText = (NSString *)v13;

    uint64_t v15 = [v10 copy];
    transitionText = v12->_transitionText;
    v12->_transitionText = (NSString *)v15;
  }
  return v12;
}

- (void)updateInteractiveTransition:(double)a3
{
  id v5 = [(PREditingStandaloneLabelViewInteractiveTransition *)self label];
  [v5 interactiveTransition:self didUpdate:a3];
}

- (void)finishInteractiveTransition
{
  id v3 = [(PREditingStandaloneLabelViewInteractiveTransition *)self label];
  [v3 interactiveTransition:self didFinishSuccessfully:1];
}

- (void)cancelInteractiveTransition
{
  id v3 = [(PREditingStandaloneLabelViewInteractiveTransition *)self label];
  [v3 interactiveTransition:self didFinishSuccessfully:0];
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F720]);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __64__PREditingStandaloneLabelViewInteractiveTransition_description__block_invoke;
  id v10 = &unk_1E54DAA08;
  v11 = self;
  id v12 = v3;
  id v4 = v3;
  [v4 appendProem:self block:&v7];
  id v5 = objc_msgSend(v4, "description", v7, v8, v9, v10, v11);

  return (NSString *)v5;
}

uint64_t __64__PREditingStandaloneLabelViewInteractiveTransition_description__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) appendDescriptionToFormatter:*(void *)(a1 + 40)];
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v8 = a3;
  id v4 = [(PREditingStandaloneLabelViewInteractiveTransition *)self currentText];
  id v5 = (id)[v8 appendObject:v4 withName:@"currentText"];

  v6 = [(PREditingStandaloneLabelViewInteractiveTransition *)self transitionText];
  id v7 = (id)[v8 appendObject:v6 withName:@"transitionText"];
}

- (PREditingStandaloneLabelView)label
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_label);
  return (PREditingStandaloneLabelView *)WeakRetained;
}

- (NSString)currentText
{
  return self->_currentText;
}

- (NSString)transitionText
{
  return self->_transitionText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionText, 0);
  objc_storeStrong((id *)&self->_currentText, 0);
  objc_destroyWeak((id *)&self->_label);
}

@end