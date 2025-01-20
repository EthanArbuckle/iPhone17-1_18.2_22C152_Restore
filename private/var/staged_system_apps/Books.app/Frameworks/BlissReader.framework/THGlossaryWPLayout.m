@interface THGlossaryWPLayout
- (THGlossaryLayoutRequirementsProvider)layoutRequirementsProvider;
- (id)reliedOnLayouts;
- (void)setLayoutRequirementsProvider:(id)a3;
@end

@implementation THGlossaryWPLayout

- (id)reliedOnLayouts
{
  if ([(THGlossaryWPLayout *)self layoutRequirementsProvider])
  {
    v3 = [(THGlossaryWPLayout *)self layoutRequirementsProvider];
    return [(THGlossaryLayoutRequirementsProvider *)v3 reliedOnLayoutsForLayout:self];
  }
  else
  {
    return +[NSSet set];
  }
}

- (THGlossaryLayoutRequirementsProvider)layoutRequirementsProvider
{
  return self->mLayoutRequirementsProvider;
}

- (void)setLayoutRequirementsProvider:(id)a3
{
  self->mLayoutRequirementsProvider = (THGlossaryLayoutRequirementsProvider *)a3;
}

@end