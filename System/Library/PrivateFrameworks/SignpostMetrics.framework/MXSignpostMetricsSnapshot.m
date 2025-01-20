@interface MXSignpostMetricsSnapshot
@end

@implementation MXSignpostMetricsSnapshot

uint64_t ___MXSignpostMetricsSnapshot_block_invoke()
{
  _MXSignpostMetricsSnapshot_snapshotter = objc_alloc_init(SignpostMetricsSnapshotter);

  return MEMORY[0x270F9A758]();
}

@end