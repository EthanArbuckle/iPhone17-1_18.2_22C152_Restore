@interface SignpostMetricsSnapshotter
- (void)encodeWithOSLogCoder:(id)a3 options:(unint64_t)a4 maxLength:(unint64_t)a5;
@end

@implementation SignpostMetricsSnapshotter

- (void)encodeWithOSLogCoder:(id)a3 options:(unint64_t)a4 maxLength:(unint64_t)a5
{
  id v5 = a3;
  if (encodeWithOSLogCoder_options_maxLength__onceToken != -1) {
    dispatch_once(&encodeWithOSLogCoder_options_maxLength__onceToken, &__block_literal_global);
  }
  if (encodeWithOSLogCoder_options_maxLength__session) {
    pc_session_create_snapshot_buf();
  }
  [v5 appendBytes:0 length:0];
}

uint64_t __69__SignpostMetricsSnapshotter_encodeWithOSLogCoder_options_maxLength___block_invoke()
{
  uint64_t v0 = pc_session_create();
  encodeWithOSLogCoder_options_maxLength__session = v0;
  uint64_t v1 = getpid();

  return MEMORY[0x270F9ABE8](v0, v1);
}

@end