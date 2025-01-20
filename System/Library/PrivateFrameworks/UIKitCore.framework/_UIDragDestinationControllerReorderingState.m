@interface _UIDragDestinationControllerReorderingState
- (UICollectionView)collectionView;
- (_UIDragDestinationControllerSessionState)sessionState;
- (double)reorderBecamePossibleTime;
- (id)_reorderCadenceSettings;
- (int64_t)dragMovementPhase;
- (void)didReorder;
- (void)reorderResetToStartingLocation;
- (void)setCollectionView:(id)a3;
- (void)setDragMovementPhase:(int64_t)a3;
- (void)setHasStartedInteractiveReorder:(BOOL)a3;
- (void)setReorderBecamePossibleTime:(double)a3;
- (void)setReorderCadenceSettings:(id)a3;
- (void)setReorderCount:(int64_t)a3;
- (void)setSessionState:(id)a3;
- (void)setVelocityIntegrator:(id)a3;
@end

@implementation _UIDragDestinationControllerReorderingState

- (void)didReorder
{
  ++a1[3];
  a1[7] = 0;
  if (!a1[8])
  {
    a1[8] = 1;
    uint64_t v2 = [a1 _reorderCadenceSettings];
    v3 = (void *)a1[4];
    a1[4] = v2;
  }
}

- (void)reorderResetToStartingLocation
{
  self->_reorderCount = 0;
}

- (id)_reorderCadenceSettings
{
  v3 = [(_UIDragDestinationControllerReorderingState *)self collectionView];
  uint64_t v4 = [v3 reorderingCadence];

  double v5 = 0.0;
  if (_UIInternalPreferenceUsesDefault_1((int *)&unk_1EB256F40, @"DraggingCadenceVelocityThreshold"))double v6 = 0.0; {
  else
  }
    double v6 = *(double *)&qword_1EB256F48;
  if (!_UIInternalPreferenceUsesDefault_1((int *)&_MergedGlobals_902, @"DraggingCadenceDwellTimeThreshold"))double v5 = *(double *)&qword_1EB256F38; {
  if (v6 == 0.0 && v5 == 0.0)
  }
  {
    v7 = +[_UIDragMovementCadenceSettings defaultSettingsForMovementPhase:[(_UIDragDestinationControllerReorderingState *)self dragMovementPhase] cadence:v4];
  }
  else
  {
    v7 = [[_UIDragMovementCadenceSettings alloc] initWithVelocityMagnitudeThreshold:v6 dwellTimeThreshold:v5];
  }
  return v7;
}

- (void)setVelocityIntegrator:(id)a3
{
}

- (void)setReorderCount:(int64_t)a3
{
  self->_reorderCount = a3;
}

- (void)setReorderCadenceSettings:(id)a3
{
}

- (void)setHasStartedInteractiveReorder:(BOOL)a3
{
  self->_hasStartedInteractiveReorder = a3;
}

- (_UIDragDestinationControllerSessionState)sessionState
{
  return self->_sessionState;
}

- (void)setSessionState:(id)a3
{
}

- (UICollectionView)collectionView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  return (UICollectionView *)WeakRetained;
}

- (void)setCollectionView:(id)a3
{
}

- (double)reorderBecamePossibleTime
{
  return self->_reorderBecamePossibleTime;
}

- (void)setReorderBecamePossibleTime:(double)a3
{
  self->_reorderBecamePossibleTime = a3;
}

- (int64_t)dragMovementPhase
{
  return self->_dragMovementPhase;
}

- (void)setDragMovementPhase:(int64_t)a3
{
  self->_dragMovementPhase = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_collectionView);
  objc_storeStrong((id *)&self->_sessionState, 0);
  objc_storeStrong((id *)&self->_reorderCadenceSettings, 0);
  objc_storeStrong((id *)&self->_velocityIntegrator, 0);
}

@end