@interface SATrialExperiment
- (SATrialExperiment)init;
- (id)compatibilityVersion;
- (id)deploymentID;
- (id)experimentID;
- (id)experimentNamespace;
- (id)treatmentID;
- (int)allocationStatus;
@end

@implementation SATrialExperiment

- (id)experimentNamespace
{
  return sub_25BC8FD54((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SATrialExperiment__experimentNamespace);
}

- (id)experimentID
{
  return sub_25BC8FD54((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SATrialExperiment__experimentID);
}

- (id)treatmentID
{
  return sub_25BC8FD54((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SATrialExperiment__treatmentID);
}

- (id)deploymentID
{
  v2 = sub_25BC8FDF4();
  return v2;
}

- (id)compatibilityVersion
{
  v2 = sub_25BC8FE58();
  return v2;
}

- (int)allocationStatus
{
  return sub_25BC8FEBC();
}

- (SATrialExperiment)init
{
  return (SATrialExperiment *)SATrialExperiment.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SATrialExperiment__compatibilityVersion);
}

@end