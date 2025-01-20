@interface PFAIEntryOrientationState
- (PFAIEntryOrientationState)initWithStackEntry:(id)a3 parentEntryOrientationState:(id)a4;
- (PFAIEntryOrientationState)parentEntryOrientationState;
- (void)loadPropertiesIfNecessary;
@end

@implementation PFAIEntryOrientationState

- (PFAIEntryOrientationState)initWithStackEntry:(id)a3 parentEntryOrientationState:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PFAIEntryOrientationState;
  return [(PFXHtmlEntryMediaState *)&v5 initWithHtmlStackEntry:a3 parentEntryMediaState:a4];
}

- (PFAIEntryOrientationState)parentEntryOrientationState
{
  return (PFAIEntryOrientationState *)self->super.mParentEntryMediaState;
}

- (void)loadPropertiesIfNecessary
{
  if (!self->super.mPropertySet)
  {
    mHtmlStackEntry = self->super.mHtmlStackEntry;
    id v4 = [(PFXHtmlStackEntry *)mHtmlStackEntry currentEntryOrientationState];
    id v5 = [(PFXHtmlStackEntry *)mHtmlStackEntry flowState];
    v7.receiver = self;
    v7.super_class = (Class)PFAIEntryOrientationState;
    [(PFXHtmlEntryMediaState *)&v7 loadPropertiesIfNecessary];
    id v6 = [(PFXHtmlStackEntry *)mHtmlStackEntry applePubReaderState];
    if (v4 == v5) {
      [v6 setFlowAsCurrent];
    }
    else {
      [v6 setPaginatedAsCurrent];
    }
  }
}

@end