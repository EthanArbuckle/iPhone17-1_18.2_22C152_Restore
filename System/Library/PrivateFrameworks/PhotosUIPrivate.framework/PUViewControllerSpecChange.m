@interface PUViewControllerSpecChange
- (BOOL)changed;
- (BOOL)layoutReferenceSizeChanged;
- (BOOL)layoutStyleChanged;
- (BOOL)prefersCompactLayoutForSplitScreenChanged;
- (BOOL)presentedForSecondScreenChanged;
- (BOOL)secondScreenSizeChanged;
- (BOOL)traitCollectionChanged;
- (void)setLayoutReferenceSizeChanged:(BOOL)a3;
- (void)setLayoutStyleChanged:(BOOL)a3;
- (void)setPrefersCompactLayoutForSplitScreenChanged:(BOOL)a3;
- (void)setPresentedForSecondScreenChanged:(BOOL)a3;
- (void)setSecondScreenSizeChanged:(BOOL)a3;
- (void)setTraitCollectionChanged:(BOOL)a3;
@end

@implementation PUViewControllerSpecChange

- (void)setPrefersCompactLayoutForSplitScreenChanged:(BOOL)a3
{
  self->_prefersCompactLayoutForSplitScreenChanged = a3;
}

- (BOOL)prefersCompactLayoutForSplitScreenChanged
{
  return self->_prefersCompactLayoutForSplitScreenChanged;
}

- (void)setSecondScreenSizeChanged:(BOOL)a3
{
  self->_secondScreenSizeChanged = a3;
}

- (BOOL)secondScreenSizeChanged
{
  return self->_secondScreenSizeChanged;
}

- (void)setPresentedForSecondScreenChanged:(BOOL)a3
{
  self->_presentedForSecondScreenChanged = a3;
}

- (BOOL)presentedForSecondScreenChanged
{
  return self->_presentedForSecondScreenChanged;
}

- (void)setLayoutStyleChanged:(BOOL)a3
{
  self->_layoutStyleChanged = a3;
}

- (BOOL)layoutStyleChanged
{
  return self->_layoutStyleChanged;
}

- (void)setLayoutReferenceSizeChanged:(BOOL)a3
{
  self->_layoutReferenceSizeChanged = a3;
}

- (BOOL)layoutReferenceSizeChanged
{
  return self->_layoutReferenceSizeChanged;
}

- (void)setTraitCollectionChanged:(BOOL)a3
{
  self->_traitCollectionChanged = a3;
}

- (BOOL)traitCollectionChanged
{
  return self->_traitCollectionChanged;
}

- (BOOL)changed
{
  if ([(PUViewControllerSpecChange *)self traitCollectionChanged]
    || [(PUViewControllerSpecChange *)self layoutReferenceSizeChanged]
    || [(PUViewControllerSpecChange *)self layoutStyleChanged]
    || [(PUViewControllerSpecChange *)self presentedForSecondScreenChanged]
    || [(PUViewControllerSpecChange *)self secondScreenSizeChanged])
  {
    return 1;
  }
  return [(PUViewControllerSpecChange *)self prefersCompactLayoutForSplitScreenChanged];
}

@end