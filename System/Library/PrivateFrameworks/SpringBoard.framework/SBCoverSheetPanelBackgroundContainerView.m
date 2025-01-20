@interface SBCoverSheetPanelBackgroundContainerView
- (void)_setPresentationValue:(id)a3 forKey:(id)a4;
@end

@implementation SBCoverSheetPanelBackgroundContainerView

- (void)_setPresentationValue:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  v9 = v8;
  if ([v7 isEqualToString:@"position"])
  {
    [v8 CGPointValue];
    double v11 = v10;
    double v13 = v12;
    [(SBCoverSheetPanelBackgroundContainerView *)self bounds];
    if (v13 >= v14 * 0.5) {
      double v15 = v14 * 0.5;
    }
    else {
      double v15 = v13;
    }
    v9 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v11, v15);
  }
  v16.receiver = self;
  v16.super_class = (Class)SBCoverSheetPanelBackgroundContainerView;
  [(SBCoverSheetPanelBackgroundContainerView *)&v16 _setPresentationValue:v9 forKey:v7];
}

@end