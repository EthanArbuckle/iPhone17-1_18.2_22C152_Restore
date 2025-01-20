@interface CACDisambiguationHandler
- (CACDisambiguationHandler)initWithLabeledElements:(id)a3;
- (NSArray)labeledElements;
- (id)chosenLabeledElementHandler;
- (void)handleChosenLabeledElement:(id)a3;
- (void)setChosenLabeledElementHandler:(id)a3;
- (void)setLabeledElements:(id)a3;
@end

@implementation CACDisambiguationHandler

- (CACDisambiguationHandler)initWithLabeledElements:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CACDisambiguationHandler;
  v6 = [(CACDisambiguationHandler *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_labeledElements, a3);
  }

  return v7;
}

- (void)handleChosenLabeledElement:(id)a3
{
  id v4 = a3;
  id v5 = [(CACDisambiguationHandler *)self chosenLabeledElementHandler];

  if (v5)
  {
    v6 = [(CACDisambiguationHandler *)self chosenLabeledElementHandler];
    ((void (**)(void, id))v6)[2](v6, v4);
  }
  else
  {
    v7 = [v4 element];
    uint64_t v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __55__CACDisambiguationHandler_handleChosenLabeledElement___block_invoke;
      block[3] = &unk_264D115D0;
      id v10 = v4;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
}

void __55__CACDisambiguationHandler_handleChosenLabeledElement___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) element];
  [v1 cacActivate];
}

- (NSArray)labeledElements
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLabeledElements:(id)a3
{
}

- (id)chosenLabeledElementHandler
{
  return self->_chosenLabeledElementHandler;
}

- (void)setChosenLabeledElementHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_chosenLabeledElementHandler, 0);
  objc_storeStrong((id *)&self->_labeledElements, 0);
}

@end