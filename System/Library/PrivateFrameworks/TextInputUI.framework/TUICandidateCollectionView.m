@interface TUICandidateCollectionView
- (BOOL)_shouldFadeCellsForBoundChangeWhileRotating;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation TUICandidateCollectionView

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v6 _authenticationMessage];
  v9 = [MEMORY[0x1E4FB1900] activeInstance];
  [v9 _attemptAuthenticationWithMessage:v8];

  v10.receiver = self;
  v10.super_class = (Class)TUICandidateCollectionView;
  [(TUICandidateCollectionView *)&v10 touchesEnded:v7 withEvent:v6];
}

- (BOOL)_shouldFadeCellsForBoundChangeWhileRotating
{
  return 0;
}

@end