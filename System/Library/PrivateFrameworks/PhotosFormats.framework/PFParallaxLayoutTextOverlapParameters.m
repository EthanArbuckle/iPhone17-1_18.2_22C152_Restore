@interface PFParallaxLayoutTextOverlapParameters
+ (PFParallaxLayoutTextOverlapParameters)standardAlphabeticTextParameters;
+ (PFParallaxLayoutTextOverlapParameters)standardNumericTextParameters;
+ (PFParallaxLayoutTextOverlapParameters)systemParameters;
+ (void)setSystemParameters:(id)a3;
- (double)bottomAreaHeight;
- (double)maxBottomOverlap;
- (double)maxTopOverlapForTopRect:(CGRect)a3 isInteractive:(BOOL)a4;
- (double)targetBottomOverlap;
@end

@implementation PFParallaxLayoutTextOverlapParameters

+ (PFParallaxLayoutTextOverlapParameters)standardAlphabeticTextParameters
{
  v2 = objc_alloc_init(PFParallaxLayoutAlphabeticalTextOverlapParameters);

  return (PFParallaxLayoutTextOverlapParameters *)v2;
}

- (double)maxBottomOverlap
{
  return self->_maxBottomOverlap;
}

- (double)targetBottomOverlap
{
  return self->_targetBottomOverlap;
}

- (double)bottomAreaHeight
{
  return self->_bottomAreaHeight;
}

- (double)maxTopOverlapForTopRect:(CGRect)a3 isInteractive:(BOOL)a4
{
  v4 = (void *)_PFAssertFailHandler();
  +[PFParallaxLayoutTextOverlapParameters standardNumericTextParameters];
  return result;
}

+ (PFParallaxLayoutTextOverlapParameters)standardNumericTextParameters
{
  v2 = objc_alloc_init(PFParallaxLayoutNumericTextOverlapParameters);

  return (PFParallaxLayoutTextOverlapParameters *)v2;
}

+ (void)setSystemParameters:(id)a3
{
}

+ (PFParallaxLayoutTextOverlapParameters)systemParameters
{
  if (systemParameters_once != -1) {
    dispatch_once(&systemParameters_once, &__block_literal_global_6493);
  }
  v2 = (void *)sSystemParameters;
  if (sSystemParameters)
  {
    return (PFParallaxLayoutTextOverlapParameters *)v2;
  }
  else
  {
    uint64_t v4 = _PFAssertFailHandler();
    return (PFParallaxLayoutTextOverlapParameters *)__57__PFParallaxLayoutTextOverlapParameters_systemParameters__block_invoke(v4);
  }
}

void __57__PFParallaxLayoutTextOverlapParameters_systemParameters__block_invoke()
{
  if (!sSystemParameters)
  {
    sSystemParameters = +[PFParallaxLayoutTextOverlapParameters standardNumericTextParameters];
    MEMORY[0x1F41817F8]();
  }
}

@end