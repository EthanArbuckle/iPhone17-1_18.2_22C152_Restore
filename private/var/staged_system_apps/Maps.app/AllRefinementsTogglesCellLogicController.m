@interface AllRefinementsTogglesCellLogicController
- (void)toggleValueDidChange:(id)a3 newValue:(BOOL)a4 selectionSequenceNumber:(id)a5;
@end

@implementation AllRefinementsTogglesCellLogicController

- (void)toggleValueDidChange:(id)a3 newValue:(BOOL)a4 selectionSequenceNumber:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = a3;
  [v8 setIsSelected:v5];
  [v8 setSelectionSequenceNumber:v7];
}

@end