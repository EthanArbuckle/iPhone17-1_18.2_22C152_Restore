@interface WFIconView
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation WFIconView

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFIconView;
  id v4 = a3;
  [(WFIconView *)&v7 traitCollectionDidChange:v4];
  v5 = [(WFIconView *)self traitCollection];
  BOOL v6 = WFShouldRedrawIconForTraitCollectionChange(v5, v4);

  if (v6) {
    [(WFIconView *)self redrawIcon];
  }
}

@end