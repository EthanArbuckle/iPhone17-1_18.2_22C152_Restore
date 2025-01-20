@interface NTKEditOptionPickerView
- (BOOL)active;
- (CGAffineTransform)contentTransform;
- (CGRect)_frameForContainerView;
- (Class)_sideViewClass;
- (NTKEditOptionContainerView)containerView;
- (NTKEditOptionPickerView)initWithOptions:(id)a3 selectedOption:(id)a4;
- (UIEdgeInsets)padding;
- (id)_newContainerView;
- (id)_selectedSideView;
- (id)_sideViewAtIndex:(unint64_t)a3;
- (id)description;
- (id)optionAtIndex:(unint64_t)a3;
- (id)optionToViewMapper;
- (id)selectedOption;
- (unint64_t)numberOfOptions;
- (unint64_t)numberOfSides;
- (unint64_t)selectedOptionIndex;
- (void)_enumerateSideViewsWithBlock:(id)a3;
- (void)_tileContainerForTransitionDirection:(int64_t)a3;
- (void)_transitionToSelectedOption;
- (void)_updateContainer;
- (void)applyBreathingScale:(double)a3;
- (void)applyRubberBandingFraction:(double)a3;
- (void)decrementSelection;
- (void)incrementSelection;
- (void)layoutSubviews;
- (void)setActive:(BOOL)a3;
- (void)setContainerView:(id)a3;
- (void)setContentTransform:(CGAffineTransform *)a3;
- (void)setNumberOfSides:(unint64_t)a3;
- (void)setOptionToViewMapper:(id)a3;
- (void)setPadding:(UIEdgeInsets)a3;
- (void)setSelectedOptionIndex:(unint64_t)a3;
- (void)setSelectedOptionIndex:(unint64_t)a3 animated:(BOOL)a4;
- (void)setTransitionFraction:(double)a3 fromIndex:(unint64_t)a4 toIndex:(unint64_t)a5;
@end

@implementation NTKEditOptionPickerView

- (NTKEditOptionPickerView)initWithOptions:(id)a3 selectedOption:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NTKEditOptionPickerView;
  v8 = -[NTKEditOptionPickerView initWithFrame:](&v14, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v8)
  {
    if (([v6 containsObject:v7] & 1) == 0)
    {
      uint64_t v9 = [v6 arrayByAddingObject:v7];

      id v6 = (id)v9;
    }
    objc_storeStrong((id *)&v8->_options, v6);
    v8->_numberOfOptions = [(NSArray *)v8->_options count];
    v8->_selectedOptionIndex = [v6 indexOfObject:v7];
    uint64_t v10 = MEMORY[0x1E4F1DAB8];
    long long v11 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v8->_contentTransform.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v8->_contentTransform.c = v11;
    *(_OWORD *)&v8->_contentTransform.tx = *(_OWORD *)(v10 + 32);
    id v12 = [(NTKEditOptionPickerView *)v8 _newContainerView];
    [(NTKEditOptionPickerView *)v8 setContainerView:v12];
  }
  return v8;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; selectedOption = %d; numberOfOptions = %d>",
               objc_opt_class(),
               self,
               self->_selectedOptionIndex,
               self->_numberOfOptions);
}

- (void)setContainerView:(id)a3
{
  v5 = (NTKEditOptionContainerView *)a3;
  containerView = self->_containerView;
  if (containerView != v5)
  {
    id v7 = v5;
    [(NTKEditOptionContainerView *)containerView removeFromSuperview];
    objc_storeStrong((id *)&self->_containerView, a3);
    [(NTKEditOptionPickerView *)self addSubview:self->_containerView];
    [(NTKEditOptionPickerView *)self _updateContainer];
    v5 = v7;
  }
}

- (void)setContentTransform:(CGAffineTransform *)a3
{
  long long v4 = *(_OWORD *)&a3->c;
  long long v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_contentTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_contentTransform.c = v4;
  *(_OWORD *)&self->_contentTransform.tx = v3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__NTKEditOptionPickerView_setContentTransform___block_invoke;
  v6[3] = &__block_descriptor_80_e37_v16__0__NTKEditOptionPickerSideView_8l;
  long long v5 = *(_OWORD *)&a3->c;
  long long v7 = *(_OWORD *)&a3->a;
  long long v8 = v5;
  long long v9 = *(_OWORD *)&a3->tx;
  [(NTKEditOptionPickerView *)self _enumerateSideViewsWithBlock:v6];
}

uint64_t __47__NTKEditOptionPickerView_setContentTransform___block_invoke(_OWORD *a1, void *a2)
{
  long long v2 = a1[3];
  v4[0] = a1[2];
  v4[1] = v2;
  v4[2] = a1[4];
  return [a2 applyContentTransform:v4];
}

- (void)_updateContainer
{
  self->_visibleOptionBufferSize = [(NTKEditOptionContainerView *)self->_containerView numberOfVisibleSides];
  if ([(NTKEditOptionContainerView *)self->_containerView numberOfSides])
  {
    unint64_t v3 = 0;
    do
    {
      id v4 = objc_alloc_init([(NTKEditOptionPickerView *)self _sideViewClass]);
      [(NTKEditOptionPickerView *)self _willDisplaySideView:v4];
      [(NTKEditOptionContainerView *)self->_containerView setView:v4 forSideAtIndex:v3];

      ++v3;
    }
    while (v3 < [(NTKEditOptionContainerView *)self->_containerView numberOfSides]);
  }
  [(NTKEditOptionPickerView *)self _tileContainerForTransitionDirection:0];
  [(NTKEditOptionPickerView *)self _transitionToSelectedOption];
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    if (a3) {
      [(NTKEditOptionPickerView *)self _tileContainerForTransitionDirection:0];
    }
  }
}

- (void)setNumberOfSides:(unint64_t)a3
{
  if ([(NTKEditOptionContainerView *)self->_containerView numberOfSides] != a3)
  {
    if (objc_opt_respondsToSelector()) {
      [(NTKEditOptionContainerView *)self->_containerView setNumberOfSides:a3];
    }
    [(NTKEditOptionPickerView *)self _updateContainer];
    [(NTKEditOptionPickerView *)self setNeedsLayout];
  }
}

- (unint64_t)numberOfSides
{
  return [(NTKEditOptionContainerView *)self->_containerView numberOfSides];
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->_padding = a3;
  [(NTKEditOptionPickerView *)self setNeedsLayout];
}

- (void)incrementSelection
{
  if (self->_selectedOptionIndex + 1 < self->_numberOfOptions)
  {
    [(NTKEditOptionPickerView *)self _tileContainerForTransitionDirection:1];
    ++self->_selectedOptionIndex;
    -[NTKEditOptionPickerView _transitionAnimatedToSelectedOptionFromIndex:](self, "_transitionAnimatedToSelectedOptionFromIndex:");
  }
}

- (void)decrementSelection
{
  if (self->_selectedOptionIndex)
  {
    [(NTKEditOptionPickerView *)self _tileContainerForTransitionDirection:2];
    --self->_selectedOptionIndex;
    -[NTKEditOptionPickerView _transitionAnimatedToSelectedOptionFromIndex:](self, "_transitionAnimatedToSelectedOptionFromIndex:");
  }
}

- (id)selectedOption
{
  return [(NTKEditOptionPickerView *)self optionAtIndex:self->_selectedOptionIndex];
}

- (id)optionAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_options objectAtIndexedSubscript:a3];
}

- (void)setSelectedOptionIndex:(unint64_t)a3
{
}

- (void)setSelectedOptionIndex:(unint64_t)a3 animated:(BOOL)a4
{
  if (a4)
  {
    unint64_t selectedOptionIndex = self->_selectedOptionIndex;
    if (selectedOptionIndex <= a3)
    {
      if (selectedOptionIndex < a3)
      {
        do
          [(NTKEditOptionPickerView *)self incrementSelection];
        while (self->_selectedOptionIndex < a3);
      }
    }
    else
    {
      do
        [(NTKEditOptionPickerView *)self decrementSelection];
      while (self->_selectedOptionIndex > a3);
    }
  }
  else
  {
    self->_unint64_t selectedOptionIndex = a3;
    [(NTKEditOptionPickerView *)self _tileContainerForTransitionDirection:0];
    [(NTKEditOptionPickerView *)self _transitionToSelectedOption];
  }
}

- (void)setTransitionFraction:(double)a3 fromIndex:(unint64_t)a4 toIndex:(unint64_t)a5
{
  unint64_t selectedOptionIndex = self->_selectedOptionIndex;
  if (a3 <= 0.5)
  {
    unint64_t v10 = a4;
    if (selectedOptionIndex == a4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  unint64_t v10 = a5;
  if (selectedOptionIndex != a5)
  {
LABEL_5:
    self->_unint64_t selectedOptionIndex = v10;
    [(NTKEditOptionPickerView *)self _tileContainerForTransitionDirection:0];
  }
LABEL_6:
  unint64_t v11 = [(NTKEditOptionContainerView *)self->_containerView numberOfSides];
  unint64_t v12 = a4 % v11;
  unint64_t v13 = a5 % v11;
  containerView = self->_containerView;
  [(NTKEditOptionContainerView *)containerView transitionToFraction:v12 fromSideAtIndex:v13 toSideAtIndex:a3];
}

- (void)layoutSubviews
{
  containerView = self->_containerView;
  [(NTKEditOptionPickerView *)self _frameForContainerView];
  -[NTKEditOptionContainerView setFrame:](containerView, "setFrame:");
}

- (void)applyBreathingScale:(double)a3
{
  memset(&v8, 0, sizeof(v8));
  long long v4 = *(_OWORD *)&self->_contentTransform.c;
  *(_OWORD *)&v7.a = *(_OWORD *)&self->_contentTransform.a;
  *(_OWORD *)&v7.c = v4;
  *(_OWORD *)&v7.tx = *(_OWORD *)&self->_contentTransform.tx;
  CGAffineTransformScale(&v8, &v7, a3, a3);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__NTKEditOptionPickerView_applyBreathingScale___block_invoke;
  v5[3] = &__block_descriptor_80_e37_v16__0__NTKEditOptionPickerSideView_8l;
  CGAffineTransform v6 = v8;
  [(NTKEditOptionPickerView *)self _enumerateSideViewsWithBlock:v5];
}

uint64_t __47__NTKEditOptionPickerView_applyBreathingScale___block_invoke(_OWORD *a1, void *a2)
{
  long long v2 = a1[3];
  v4[0] = a1[2];
  v4[1] = v2;
  v4[2] = a1[4];
  return [a2 applyContentTransform:v4];
}

- (void)applyRubberBandingFraction:(double)a3
{
  double v5 = NTKScaleForRubberBandingFraction(a3);
  memset(&v12, 0, sizeof(v12));
  long long v6 = *(_OWORD *)&self->_contentTransform.c;
  *(_OWORD *)&v11.a = *(_OWORD *)&self->_contentTransform.a;
  *(_OWORD *)&v11.c = v6;
  *(_OWORD *)&v11.tx = *(_OWORD *)&self->_contentTransform.tx;
  CGAffineTransformScale(&v12, &v11, v5, v5);
  double v7 = NTKAlphaForRubberBandingFraction(a3);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__NTKEditOptionPickerView_applyRubberBandingFraction___block_invoke;
  v8[3] = &__block_descriptor_88_e37_v16__0__NTKEditOptionPickerSideView_8l;
  CGAffineTransform v9 = v12;
  double v10 = v7;
  [(NTKEditOptionPickerView *)self _enumerateSideViewsWithBlock:v8];
}

void __54__NTKEditOptionPickerView_applyRubberBandingFraction___block_invoke(uint64_t a1, void *a2)
{
  long long v3 = *(_OWORD *)(a1 + 48);
  long long v5 = *(_OWORD *)(a1 + 32);
  long long v6 = v3;
  long long v7 = *(_OWORD *)(a1 + 64);
  id v4 = a2;
  [v4 applyContentTransform:&v5];
  objc_msgSend(v4, "setAlpha:", *(double *)(a1 + 80), v5, v6, v7);
}

- (CGRect)_frameForContainerView
{
  [(NTKEditOptionPickerView *)self bounds];
  double top = self->_padding.top;
  double left = self->_padding.left;
  double v6 = v5 + left;
  double v8 = v7 + top;
  double v10 = v9 - (left + self->_padding.right);
  double v12 = v11 - (top + self->_padding.bottom);
  result.size.height = v12;
  result.size.width = v10;
  result.origin.y = v8;
  result.origin.x = v6;
  return result;
}

- (id)_sideViewAtIndex:(unint64_t)a3
{
  return (id)[(NTKEditOptionContainerView *)self->_containerView viewForSideAtIndex:a3];
}

- (id)_selectedSideView
{
  if ([(NTKEditOptionContainerView *)self->_containerView numberOfSides])
  {
    unint64_t selectedOptionIndex = self->_selectedOptionIndex;
    unint64_t v4 = selectedOptionIndex % [(NTKEditOptionContainerView *)self->_containerView numberOfSides];
  }
  else
  {
    unint64_t v4 = 0;
  }
  return [(NTKEditOptionPickerView *)self _sideViewAtIndex:v4];
}

- (void)_tileContainerForTransitionDirection:(int64_t)a3
{
  uint64_t v5 = [(NTKEditOptionContainerView *)self->_containerView numberOfSides];
  if (v5)
  {
    unint64_t selectedOptionIndex = self->_selectedOptionIndex;
    unint64_t visibleOptionBufferSize = self->_visibleOptionBufferSize;
    uint64_t v8 = a3 == 2 ? -1 : 0;
    unint64_t v9 = selectedOptionIndex - (a3 == 2) - visibleOptionBufferSize;
    unint64_t v10 = a3 == 1 ? selectedOptionIndex + 1 : self->_selectedOptionIndex;
    int64_t v11 = v10 + visibleOptionBufferSize;
    unint64_t v12 = self->_active ? 0x7FFFFFFFFFFFFFFFLL : self->_selectedOptionIndex;
    if ((uint64_t)v9 <= v11)
    {
      uint64_t v13 = v5;
      unint64_t v14 = ((a3 == 1) | (2 * visibleOptionBufferSize)) - v8 + 1;
      do
      {
        v15 = [(NTKEditOptionPickerView *)self _sideViewAtIndex:(uint64_t)(v13 + v9) % v13];
        v16 = 0;
        if ((v9 & 0x8000000000000000) != 0)
        {
          v17 = 0;
        }
        else if (v12 == v9)
        {
          v17 = 0;
        }
        else
        {
          v17 = 0;
          if (v9 < self->_numberOfOptions)
          {
            v16 = [(NSArray *)self->_options objectAtIndex:v9];
            v17 = (*((void (**)(void))self->_optionToViewMapper + 2))();
          }
        }
        [v15 setOptionView:v17];
        [(NTKEditOptionPickerView *)self _configureSideView:v15 forOption:v16];

        ++v9;
        --v14;
      }
      while (v14);
    }
  }
}

- (id)_newContainerView
{
  return (id)objc_opt_new();
}

- (Class)_sideViewClass
{
  return (Class)objc_opt_class();
}

- (void)_transitionToSelectedOption
{
  if ([(NTKEditOptionContainerView *)self->_containerView numberOfSides])
  {
    unint64_t selectedOptionIndex = self->_selectedOptionIndex;
    unint64_t v4 = selectedOptionIndex % [(NTKEditOptionContainerView *)self->_containerView numberOfSides];
  }
  else
  {
    unint64_t v4 = 0;
  }
  containerView = self->_containerView;
  [(NTKEditOptionContainerView *)containerView transitionToSideAtIndex:v4];
}

- (void)_enumerateSideViewsWithBlock:(id)a3
{
  double v6 = (void (**)(id, void *))a3;
  if ([(NTKEditOptionContainerView *)self->_containerView numberOfSides])
  {
    unint64_t v4 = 0;
    do
    {
      uint64_t v5 = [(NTKEditOptionPickerView *)self _sideViewAtIndex:v4];
      v6[2](v6, v5);

      ++v4;
    }
    while (v4 < [(NTKEditOptionContainerView *)self->_containerView numberOfSides]);
  }
}

- (unint64_t)numberOfOptions
{
  return self->_numberOfOptions;
}

- (id)optionToViewMapper
{
  return self->_optionToViewMapper;
}

- (void)setOptionToViewMapper:(id)a3
{
}

- (UIEdgeInsets)padding
{
  double top = self->_padding.top;
  double left = self->_padding.left;
  double bottom = self->_padding.bottom;
  double right = self->_padding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (CGAffineTransform)contentTransform
{
  long long v3 = *(_OWORD *)&self[10].tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[10].c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[11].a;
  return self;
}

- (unint64_t)selectedOptionIndex
{
  return self->_selectedOptionIndex;
}

- (BOOL)active
{
  return self->_active;
}

- (NTKEditOptionContainerView)containerView
{
  return self->_containerView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong(&self->_optionToViewMapper, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end