@interface PREditorLookTransition
- (BOOL)matchesCurrentLook:(id)a3 destinationLook:(id)a4;
- (CSProminentDisplayTransitioning)subtitleStyleTransition;
- (NSString)description;
- (PREditingLook)currentLook;
- (PREditingLook)destinationLook;
- (PREditingStandaloneLabelViewTransitioning)lookNameTransition;
- (PREditorLookSwitchingComplicationTransition)complicationTransition;
- (PREditorLookTransition)initWithCurrentLook:(id)a3 destinationLook:(id)a4;
- (PREditorTitleTransitioning)titleScrollingTransition;
- (PREditorTitleViewControllerTransitioning)titleStyleTransition;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)cancelInteractiveTransition;
- (void)finishInteractiveTransition;
- (void)setComplicationTransition:(id)a3;
- (void)setLookNameTransition:(id)a3;
- (void)setSubtitleStyleTransition:(id)a3;
- (void)setTitleScrollingTransition:(id)a3;
- (void)setTitleStyleTransition:(id)a3;
- (void)updateInteractiveTransition:(double)a3;
@end

@implementation PREditorLookTransition

- (PREditorLookTransition)initWithCurrentLook:(id)a3 destinationLook:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PREditorLookTransition;
  v8 = [(PREditorLookTransition *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    currentLook = v8->_currentLook;
    v8->_currentLook = (PREditingLook *)v9;

    uint64_t v11 = [v7 copy];
    destinationLook = v8->_destinationLook;
    v8->_destinationLook = (PREditingLook *)v11;
  }
  return v8;
}

- (BOOL)matchesCurrentLook:(id)a3 destinationLook:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(PREditorLookTransition *)self currentLook];
  int v9 = BSEqualObjects();

  if (v9)
  {
    v10 = [(PREditorLookTransition *)self destinationLook];
    char v11 = BSEqualObjects();
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (void)updateInteractiveTransition:(double)a3
{
  double v5 = fmax(fmin((a3 + -0.2) / 0.6, 1.0), 0.0);
  id v10 = [(PREditorLookTransition *)self titleStyleTransition];
  [v10 updateInteractiveTransition:v5];
  id v6 = [(PREditorLookTransition *)self titleScrollingTransition];
  [v6 updateInteractiveTransition:a3];
  id v7 = [(PREditorLookTransition *)self subtitleStyleTransition];
  [v7 updateInteractiveTransition:v5];
  v8 = [(PREditorLookTransition *)self complicationTransition];
  [v8 updateInteractiveTransition:v5];
  int v9 = [(PREditorLookTransition *)self lookNameTransition];
  [v9 updateInteractiveTransition:a3];
}

- (void)finishInteractiveTransition
{
  id v7 = [(PREditorLookTransition *)self titleStyleTransition];
  [v7 cancelInteractiveTransition];
  v3 = [(PREditorLookTransition *)self titleScrollingTransition];
  [v3 finishInteractiveTransition];
  v4 = [(PREditorLookTransition *)self subtitleStyleTransition];
  [v4 finishInteractiveTransition];
  double v5 = [(PREditorLookTransition *)self complicationTransition];
  [v5 finishInteractiveTransition];
  id v6 = [(PREditorLookTransition *)self lookNameTransition];
  [v6 finishInteractiveTransition];
}

- (void)cancelInteractiveTransition
{
  id v7 = [(PREditorLookTransition *)self titleStyleTransition];
  [v7 cancelInteractiveTransition];
  v3 = [(PREditorLookTransition *)self titleScrollingTransition];
  [v3 cancelInteractiveTransition];
  v4 = [(PREditorLookTransition *)self subtitleStyleTransition];
  [v4 cancelInteractiveTransition];
  double v5 = [(PREditorLookTransition *)self complicationTransition];
  [v5 cancelInteractiveTransition];
  id v6 = [(PREditorLookTransition *)self lookNameTransition];
  [v6 cancelInteractiveTransition];
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F720]);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  int v9 = __37__PREditorLookTransition_description__block_invoke;
  id v10 = &unk_1E54DAA08;
  char v11 = self;
  id v12 = v3;
  id v4 = v3;
  [v4 appendProem:self block:&v7];
  double v5 = objc_msgSend(v4, "description", v7, v8, v9, v10, v11);

  return (NSString *)v5;
}

uint64_t __37__PREditorLookTransition_description__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) appendDescriptionToFormatter:*(void *)(a1 + 40)];
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v16 = a3;
  id v4 = [(PREditorLookTransition *)self currentLook];
  id v5 = (id)[v16 appendObject:v4 withName:@"currentLook"];

  id v6 = [(PREditorLookTransition *)self destinationLook];
  id v7 = (id)[v16 appendObject:v6 withName:@"destinationLook"];

  uint64_t v8 = [(PREditorLookTransition *)self titleStyleTransition];
  id v9 = (id)[v16 appendObject:v8 withName:@"titleStyleTransition"];

  id v10 = [(PREditorLookTransition *)self titleScrollingTransition];
  id v11 = (id)[v16 appendObject:v10 withName:@"titleScrollingTransition"];

  id v12 = [(PREditorLookTransition *)self subtitleStyleTransition];
  id v13 = (id)[v16 appendObject:v12 withName:@"subtitleStyleTransition"];

  objc_super v14 = [(PREditorLookTransition *)self lookNameTransition];
  id v15 = (id)[v16 appendObject:v14 withName:@"lookNameTransition"];
}

- (PREditingLook)currentLook
{
  return self->_currentLook;
}

- (PREditingLook)destinationLook
{
  return self->_destinationLook;
}

- (PREditorTitleViewControllerTransitioning)titleStyleTransition
{
  return self->_titleStyleTransition;
}

- (void)setTitleStyleTransition:(id)a3
{
}

- (PREditorTitleTransitioning)titleScrollingTransition
{
  return self->_titleScrollingTransition;
}

- (void)setTitleScrollingTransition:(id)a3
{
}

- (CSProminentDisplayTransitioning)subtitleStyleTransition
{
  return self->_subtitleStyleTransition;
}

- (void)setSubtitleStyleTransition:(id)a3
{
}

- (PREditorLookSwitchingComplicationTransition)complicationTransition
{
  return self->_complicationTransition;
}

- (void)setComplicationTransition:(id)a3
{
}

- (PREditingStandaloneLabelViewTransitioning)lookNameTransition
{
  return self->_lookNameTransition;
}

- (void)setLookNameTransition:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lookNameTransition, 0);
  objc_storeStrong((id *)&self->_complicationTransition, 0);
  objc_storeStrong((id *)&self->_subtitleStyleTransition, 0);
  objc_storeStrong((id *)&self->_titleScrollingTransition, 0);
  objc_storeStrong((id *)&self->_titleStyleTransition, 0);
  objc_storeStrong((id *)&self->_destinationLook, 0);
  objc_storeStrong((id *)&self->_currentLook, 0);
}

@end