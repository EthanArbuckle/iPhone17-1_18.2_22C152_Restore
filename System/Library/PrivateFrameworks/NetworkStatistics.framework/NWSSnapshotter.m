@interface NWSSnapshotter
- (NWSSnapshotSource)snapshotSource;
- (id)snapshot;
- (unint64_t)kernelSourceRef;
- (void)setKernelSourceRef:(unint64_t)a3;
- (void)setSnapshotSource:(id)a3;
@end

@implementation NWSSnapshotter

- (id)snapshot
{
  return 0;
}

- (unint64_t)kernelSourceRef
{
  return self->_kernelSourceRef;
}

- (void)setKernelSourceRef:(unint64_t)a3
{
  self->_kernelSourceRef = a3;
}

- (NWSSnapshotSource)snapshotSource
{
  return (NWSSnapshotSource *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSnapshotSource:(id)a3
{
}

- (void).cxx_destruct
{
}

@end