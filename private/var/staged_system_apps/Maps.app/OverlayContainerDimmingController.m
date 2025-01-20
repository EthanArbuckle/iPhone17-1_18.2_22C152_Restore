@interface OverlayContainerDimmingController
- (DimmingBehaviour)behaviour;
- (NSMapTable)customBehaviours;
- (OverlayContainerDimmingController)initWithDimmingBehaviour:(id)a3 customBehaviours:(id)a4;
- (double)overlayContainer:(id)a3 dimmingPercentageForCurrentContaineeWithNewHeight:(double)a4;
- (id)_dimmingBehaviourForContainee:(id)a3;
- (unint64_t)overlayContainerLayoutForContaineeDimmingDismissal:(id)a3;
@end

@implementation OverlayContainerDimmingController

- (OverlayContainerDimmingController)initWithDimmingBehaviour:(id)a3 customBehaviours:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)OverlayContainerDimmingController;
  v9 = [(OverlayContainerDimmingController *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_behaviour, a3);
    v11 = (NSMapTable *)[v8 copy];
    customBehaviours = v10->_customBehaviours;
    v10->_customBehaviours = v11;
  }
  return v10;
}

- (double)overlayContainer:(id)a3 dimmingPercentageForCurrentContaineeWithNewHeight:(double)a4
{
  id v6 = a3;
  id v7 = [v6 currentViewController];
  id v8 = [(OverlayContainerDimmingController *)self _dimmingBehaviourForContainee:v7];

  [v8 overlayContainer:v6 dimmingPercentageForCurrentContaineeWithNewHeight:a4];
  double v10 = v9;

  return v10;
}

- (unint64_t)overlayContainerLayoutForContaineeDimmingDismissal:(id)a3
{
  id v4 = a3;
  v5 = [v4 currentViewController];
  id v6 = [(OverlayContainerDimmingController *)self _dimmingBehaviourForContainee:v5];

  id v7 = [v6 overlayContainerLayoutForContaineeDimmingDismissal:v4];
  return (unint64_t)v7;
}

- (id)_dimmingBehaviourForContainee:(id)a3
{
  id v4 = a3;
  v5 = [(OverlayContainerDimmingController *)self customBehaviours];
  id v6 = [v5 objectForKey:v4];

  if (v6)
  {
    id v7 = v6;
LABEL_8:
    v11 = v7;
    goto LABEL_9;
  }
  uint64_t v8 = objc_opt_class();
  if (!v8)
  {
LABEL_7:
    id v7 = [(OverlayContainerDimmingController *)self behaviour];
    goto LABEL_8;
  }
  Superclass = (objc_class *)v8;
  while (1)
  {
    double v10 = [(OverlayContainerDimmingController *)self customBehaviours];
    v11 = [v10 objectForKey:Superclass];

    if (v11) {
      break;
    }
    Superclass = class_getSuperclass(Superclass);
    if (!Superclass) {
      goto LABEL_7;
    }
  }
LABEL_9:

  return v11;
}

- (DimmingBehaviour)behaviour
{
  return self->_behaviour;
}

- (NSMapTable)customBehaviours
{
  return self->_customBehaviours;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customBehaviours, 0);

  objc_storeStrong((id *)&self->_behaviour, 0);
}

@end