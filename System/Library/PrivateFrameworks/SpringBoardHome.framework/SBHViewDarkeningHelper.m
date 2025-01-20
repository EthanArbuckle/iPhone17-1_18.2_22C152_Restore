@interface SBHViewDarkeningHelper
- (NSString)description;
- (SBHViewDarkeningHelper)initWithView:(id)a3;
- (UIView)view;
- (double)brightness;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)setBrightness:(double)a3;
@end

@implementation SBHViewDarkeningHelper

- (void)setBrightness:(double)a3
{
  if (self->_brightness == a3) {
    return;
  }
  self->_double brightness = a3;
  v4 = [(SBHViewDarkeningHelper *)self view];
  id v10 = [v4 layer];

  double brightness = self->_brightness;
  multiplyFilter = self->_multiplyFilter;
  if (brightness < 1.0)
  {
    if (!multiplyFilter)
    {
      v7 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2A8]];
      v8 = self->_multiplyFilter;
      self->_multiplyFilter = v7;

      [(CAFilter *)self->_multiplyFilter setName:@"SBHViewDarkening"];
      objc_msgSend(v10, "sbh_addFilter:", self->_multiplyFilter);
      multiplyFilter = self->_multiplyFilter;
      double brightness = self->_brightness;
    }
    v9 = [MEMORY[0x1E4FB1618] colorWithWhite:brightness alpha:1.0];
    [(CAFilter *)multiplyFilter setValue:[(CAFilter *)v9 CGColor] forKey:@"inputColor"];
    goto LABEL_9;
  }
  if (multiplyFilter)
  {
    objc_msgSend(v10, "sbh_removeFilterWithName:", @"SBHViewDarkening");
    v9 = self->_multiplyFilter;
    self->_multiplyFilter = 0;
LABEL_9:
  }
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (SBHViewDarkeningHelper)initWithView:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBHViewDarkeningHelper;
  v5 = [(SBHViewDarkeningHelper *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_view, v4);
    v6->_double brightness = 1.0;
  }

  return v6;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F720]);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  v9 = __37__SBHViewDarkeningHelper_description__block_invoke;
  id v10 = &unk_1E6AACA90;
  v11 = self;
  id v12 = v3;
  id v4 = v3;
  [v4 appendProem:self block:&v7];
  v5 = objc_msgSend(v4, "description", v7, v8, v9, v10, v11);

  return (NSString *)v5;
}

uint64_t __37__SBHViewDarkeningHelper_description__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) appendDescriptionToFormatter:*(void *)(a1 + 40)];
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v7 = a3;
  id v4 = [(SBHViewDarkeningHelper *)self view];
  id v5 = (id)[v7 appendObject:v4 withName:@"view"];

  [(SBHViewDarkeningHelper *)self brightness];
  id v6 = (id)objc_msgSend(v7, "appendFloat:withName:", @"brightness");
}

- (double)brightness
{
  return self->_brightness;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong((id *)&self->_multiplyFilter, 0);
}

@end