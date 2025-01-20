@interface PLFeatureAvailabilityProgressDelegate
- (PLFeatureAvailabilityProgressDelegate)initWithLibraryServicesManager:(id)a3;
- (void)featureAvailability:(id)a3 updateProgressForFeature:(id)a4;
@end

@implementation PLFeatureAvailabilityProgressDelegate

- (void).cxx_destruct
{
}

- (void)featureAvailability:(id)a3 updateProgressForFeature:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "unsignedIntegerValue", a3);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
  v6 = [WeakRetained analysisCoordinator];
  [v6 reportBGSTCheckpointProgressForFeature:v5];
}

- (PLFeatureAvailabilityProgressDelegate)initWithLibraryServicesManager:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLFeatureAvailabilityProgressDelegate;
  uint64_t v5 = [(PLFeatureAvailabilityProgressDelegate *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_lsm, v4);
    v7 = v6;
  }

  return v6;
}

@end