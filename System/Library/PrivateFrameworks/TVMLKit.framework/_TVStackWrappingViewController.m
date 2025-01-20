@interface _TVStackWrappingViewController
- (TVShowcaseConfig)showcaseConfig;
- (void)setShowcaseConfig:(TVShowcaseConfig *)a3;
- (void)tv_setShowcaseConfig:(TVShowcaseConfig *)a3;
@end

@implementation _TVStackWrappingViewController

- (void)tv_setShowcaseConfig:(TVShowcaseConfig *)a3
{
  TVShowcaseConfig v3 = *a3;
  [(_TVStackWrappingViewController *)self setShowcaseConfig:&v3];
}

- (TVShowcaseConfig)showcaseConfig
{
  *retstr = *(TVShowcaseConfig *)((char *)self + 976);
  return self;
}

- (void)setShowcaseConfig:(TVShowcaseConfig *)a3
{
  double inset = a3->inset;
  *(_OWORD *)&self->_showcaseConfig.flavor = *(_OWORD *)&a3->flavor;
  self->_showcaseConfig.double inset = inset;
}

@end