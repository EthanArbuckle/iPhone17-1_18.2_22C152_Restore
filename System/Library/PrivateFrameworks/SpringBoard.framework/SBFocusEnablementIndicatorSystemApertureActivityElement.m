@interface SBFocusEnablementIndicatorSystemApertureActivityElement
- (BOOL)isExpanding;
- (BOOL)isMinimalPresentationPossible;
- (BOOL)isPreviewing;
- (BOOL)isProminent;
- (BOOL)isUrgent;
- (SBFocusEnablementIndicatorSystemApertureActivityElement)initWithActivityDescription:(id)a3 enabled:(BOOL)a4;
- (SBSystemAperturePlatformElementHosting)platformElementHost;
- (int64_t)systemApertureLayoutCustomizingOptions;
- (void)pop;
- (void)setExpanding:(BOOL)a3;
- (void)setLayoutMode:(int64_t)a3 reason:(int64_t)a4;
- (void)setPlatformElementHost:(id)a3;
- (void)setPreviewing:(BOOL)a3;
- (void)setProminent:(BOOL)a3;
- (void)setUrgent:(BOOL)a3;
@end

@implementation SBFocusEnablementIndicatorSystemApertureActivityElement

- (SBFocusEnablementIndicatorSystemApertureActivityElement)initWithActivityDescription:(id)a3 enabled:(BOOL)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SBFocusEnablementIndicatorSystemApertureActivityElement;
  v4 = [(FCUIFocusEnablementIndicatorSystemApertureElement *)&v8 initWithActivityDescription:a3 enabled:a4];
  if (v4)
  {
    uint64_t v5 = -[SBSystemActionElementPreviewingCoordinator initWithElement:]([SBSystemActionElementPreviewingCoordinator alloc], v4);
    previewingCoordinator = v4->_previewingCoordinator;
    v4->_previewingCoordinator = (SBSystemActionElementPreviewingCoordinator *)v5;
  }
  return v4;
}

- (void)setLayoutMode:(int64_t)a3 reason:(int64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SBFocusEnablementIndicatorSystemApertureActivityElement;
  if ([(FCUIFocusEnablementIndicatorSystemApertureElement *)&v8 layoutMode] != a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)SBFocusEnablementIndicatorSystemApertureActivityElement;
    [(FCUIFocusEnablementIndicatorSystemApertureElement *)&v7 setLayoutMode:a3 reason:a4];
    -[SBSystemActionElementPreviewingCoordinator elementInvalidatedProperties]((uint64_t)self->_previewingCoordinator);
  }
}

- (BOOL)isMinimalPresentationPossible
{
  return 1;
}

- (void)setPreviewing:(BOOL)a3
{
  if (self->_previewing != a3)
  {
    self->_previewing = a3;
    -[SBSystemActionElementPreviewingCoordinator elementInvalidatedProperties]((uint64_t)self->_previewingCoordinator);
  }
}

- (void)setUrgent:(BOOL)a3
{
  if (self->_urgent != a3)
  {
    self->_urgent = a3;
    -[SBSystemActionElementPreviewingCoordinator elementInvalidatedProperties]((uint64_t)self->_previewingCoordinator);
  }
}

- (void)setExpanding:(BOOL)a3
{
  if (self->_expanding != a3)
  {
    self->_expanding = a3;
    -[SBSystemActionElementPreviewingCoordinator elementInvalidatedProperties]((uint64_t)self->_previewingCoordinator);
  }
}

- (void)setProminent:(BOOL)a3
{
  if (self->_prominent != a3)
  {
    self->_prominent = a3;
    id v4 = [(FCUIFocusEnablementIndicatorSystemApertureElement *)self layoutHost];
    [v4 preferredEdgeOutsetsDidInvalidateForLayoutSpecifier:self];
  }
}

- (void)pop
{
}

- (int64_t)systemApertureLayoutCustomizingOptions
{
  return [(SBFocusEnablementIndicatorSystemApertureActivityElement *)self isProminent];
}

- (SBSystemAperturePlatformElementHosting)platformElementHost
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_platformElementHost);
  return (SBSystemAperturePlatformElementHosting *)WeakRetained;
}

- (void)setPlatformElementHost:(id)a3
{
}

- (BOOL)isPreviewing
{
  return self->_previewing;
}

- (BOOL)isUrgent
{
  return self->_urgent;
}

- (BOOL)isExpanding
{
  return self->_expanding;
}

- (BOOL)isProminent
{
  return self->_prominent;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_platformElementHost);
  objc_storeStrong((id *)&self->_previewingCoordinator, 0);
}

@end