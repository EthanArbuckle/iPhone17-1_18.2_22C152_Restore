@interface PDSlideChild
- (BOOL)showMasterPlaceholderAnimations;
- (BOOL)showMasterShapes;
- (PDSlideChild)init;
- (id)colorMap;
- (id)colorMapOverride;
- (id)colorScheme;
- (id)defaultTextListStyle;
- (id)description;
- (id)drawingTheme;
- (id)fontScheme;
- (id)styleMatrix;
- (id)themeOverrides;
- (void)doneWithContent;
- (void)setColorMapOverride:(id)a3;
- (void)setShowMasterPlaceholderAnimations:(BOOL)a3;
- (void)setShowMasterShapes:(BOOL)a3;
@end

@implementation PDSlideChild

- (PDSlideChild)init
{
  v7.receiver = self;
  v7.super_class = (Class)PDSlideChild;
  v2 = [(PDSlideBase *)&v7 init];
  v3 = v2;
  if (v2)
  {
    *((unsigned char *)&v2->super + 73) = 1;
    *((unsigned char *)&v2->super + 74) = 1;
    v4 = objc_alloc_init(OADThemeOverrides);
    v5 = *(void **)&v3->mShowMasterPlaceholderAnimations;
    *(void *)&v3->mShowMasterPlaceholderAnimations = v4;
  }
  return v3;
}

- (id)colorScheme
{
  v3 = [(PDSlideChild *)self themeOverrides];
  v4 = [v3 colorScheme];

  if (!v4)
  {
    v5 = [(PDSlideBase *)self parentSlideBase];
    v4 = [v5 colorScheme];
  }
  return v4;
}

- (id)themeOverrides
{
  return *(id *)&self->mShowMasterPlaceholderAnimations;
}

- (id)colorMap
{
  v3 = [(PDSlideChild *)self colorMapOverride];
  if (!v3)
  {
    v4 = [(PDSlideBase *)self parentSlideBase];
    v3 = [v4 colorMap];
  }
  return v3;
}

- (id)colorMapOverride
{
  return self->mThemeOverrides;
}

- (void)setShowMasterShapes:(BOOL)a3
{
  *((unsigned char *)&self->super + 74) = a3;
}

- (BOOL)showMasterShapes
{
  return *((unsigned char *)&self->super + 74);
}

- (void)setColorMapOverride:(id)a3
{
}

- (void)setShowMasterPlaceholderAnimations:(BOOL)a3
{
  *((unsigned char *)&self->super + 73) = a3;
}

- (id)fontScheme
{
  v3 = [(PDSlideChild *)self themeOverrides];
  v4 = [v3 fontScheme];

  if (!v4)
  {
    v5 = [(PDSlideBase *)self parentSlideBase];
    v4 = [v5 fontScheme];
  }
  return v4;
}

- (id)styleMatrix
{
  v3 = [(PDSlideChild *)self themeOverrides];
  v4 = [v3 styleMatrix];

  if (!v4)
  {
    v5 = [(PDSlideBase *)self parentSlideBase];
    v4 = [v5 styleMatrix];
  }
  return v4;
}

- (BOOL)showMasterPlaceholderAnimations
{
  return *((unsigned char *)&self->super + 73);
}

- (id)defaultTextListStyle
{
  v2 = [(PDSlideBase *)self parentSlideBase];
  v3 = [v2 defaultTextListStyle];

  return v3;
}

- (void)doneWithContent
{
  v3 = *(void **)&self->mShowMasterPlaceholderAnimations;
  *(void *)&self->mShowMasterPlaceholderAnimations = 0;

  mThemeOverrides = self->mThemeOverrides;
  self->mThemeOverrides = 0;

  v5.receiver = self;
  v5.super_class = (Class)PDSlideChild;
  [(PDSlideBase *)&v5 doneWithContent];
}

- (id)drawingTheme
{
  v3 = [(PDSlideBase *)self parentSlideBase];
  v4 = [v3 drawingTheme];

  [v4 applyThemeOverrides:*(void *)&self->mShowMasterPlaceholderAnimations colorMapOverride:self->mThemeOverrides];
  return v4;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)PDSlideChild;
  v2 = [(PDSlideBase *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mThemeOverrides, 0);
  objc_storeStrong((id *)&self->mShowMasterPlaceholderAnimations, 0);
}

@end