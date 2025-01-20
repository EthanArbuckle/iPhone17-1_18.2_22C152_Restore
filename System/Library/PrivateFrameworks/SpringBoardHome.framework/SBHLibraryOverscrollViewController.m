@interface SBHLibraryOverscrollViewController
- (BOOL)shouldBeIndicatedInPageControl;
- (_UILegibilitySettings)legibilitySettings;
- (unint64_t)contentVisibility;
- (void)setContentVisibility:(unint64_t)a3;
- (void)setLegibilitySettings:(id)a3;
@end

@implementation SBHLibraryOverscrollViewController

- (BOOL)shouldBeIndicatedInPageControl
{
  return 0;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->legibilitySettings;
}

- (void)setLegibilitySettings:(id)a3
{
}

- (unint64_t)contentVisibility
{
  return self->contentVisibility;
}

- (void)setContentVisibility:(unint64_t)a3
{
  self->contentVisibility = a3;
}

- (void).cxx_destruct
{
}

@end