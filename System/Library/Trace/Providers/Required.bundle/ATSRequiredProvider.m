@interface ATSRequiredProvider
- (BOOL)shouldInitializeWithLogger:(id)a3 machine:(ktrace_machine *)a4 options:(id)a5 error:(id *)a6;
- (BOOL)shouldStartTracingWithConfiguration:(ktrace_config *)a3 error:(id *)a4;
- (id)describeChunk:(ktrace_chunk *)a3;
- (void)_appendSyscallMapToFile:(ktrace_file *)a3;
- (void)configurePostprocessingWithSession:(ktrace_session *)a3;
- (void)configureWithSession:(ktrace_session *)a3;
- (void)didStartTracingToFile:(ktrace_file *)a3;
- (void)didStopTracingToFile:(ktrace_file *)a3;
- (void)emitVnodePathTracepointsIfEnabled;
- (void)postprocessingCompleteWithFile:(ktrace_file *)a3;
- (void)willFinishWithCatalog:(ktrace_catalog *)a3 file:(ktrace_file *)a4;
- (void)willStartTracingToFile:(ktrace_file *)a3;
@end

@implementation ATSRequiredProvider

- (BOOL)shouldInitializeWithLogger:(id)a3 machine:(ktrace_machine *)a4 options:(id)a5 error:(id *)a6
{
  objc_storeStrong((id *)&self->_logger, a3);
  id v8 = a3;
  v9 = [[ATSIORegCapture alloc] initWithLogger:v8];
  ioRegCapture = self->_ioRegCapture;
  self->_ioRegCapture = v9;

  v11 = [[ATSSignpostPlistCapture alloc] initWithLogger:v8];
  signpostPlistCapture = self->_signpostPlistCapture;
  self->_signpostPlistCapture = v11;

  v13 = [[ATSSymbolsMapCapture alloc] initWithLogger:v8];
  symbolsMapCapture = self->_symbolsMapCapture;
  self->_symbolsMapCapture = v13;

  return 1;
}

- (BOOL)shouldStartTracingWithConfiguration:(ktrace_config *)a3 error:(id *)a4
{
  v5 = [[ATSGraphicsCapture alloc] initWithLogger:self->_logger config:a3];
  graphicsCapture = self->_graphicsCapture;
  self->_graphicsCapture = v5;

  self->_shouldEmitVnodePathNameTracepoints = ktrace_config_kdebug_get_debugid_enabled();
  ats_will_start_tracing();
  return 1;
}

- (void)configureWithSession:(ktrace_session *)a3
{
  ktrace_set_thread_groups_enabled();

  _ktrace_add_stackshot_flags(a3, 0x200000000);
}

- (void)willStartTracingToFile:(ktrace_file *)a3
{
}

- (void)didStartTracingToFile:(ktrace_file *)a3
{
}

- (void)didStopTracingToFile:(ktrace_file *)a3
{
  [(ATSGraphicsCapture *)self->_graphicsCapture disableGFXTracingIfNeeded];
  [(ATSSymbolsMapCapture *)self->_symbolsMapCapture addChunksToFile:a3];

  [(ATSRequiredProvider *)self _appendSyscallMapToFile:a3];
}

- (void)willFinishWithCatalog:(ktrace_catalog *)a3 file:(ktrace_file *)a4
{
}

- (void)configurePostprocessingWithSession:(ktrace_session *)a3
{
}

- (void)postprocessingCompleteWithFile:(ktrace_file *)a3
{
  -[ATSIORegCapture addChunksToFile:](self->_ioRegCapture, "addChunksToFile:");
  [(ATSSignpostPlistCapture *)self->_signpostPlistCapture addChunksToFile:a3];
  if (self->_foundLostEvents) {
    [(KTProviderLogger *)self->_logger warnWithMessage:@"Trace has lost events. Trace may not contain full data needed to visualize in tools."];
  }

  _ats_postprocessing_complete_write_processmaps(a3);
}

- (id)describeChunk:(ktrace_chunk *)a3
{
  uint64_t v4 = ktrace_chunk_tag();
  if ((v4 - 20584) >= 3)
  {
    uint64_t v6 = v4;
    v7 = [(ATSIORegCapture *)self->_ioRegCapture describeChunkWithTag:v4];
    if (!v7)
    {
      v7 = [(ATSSignpostPlistCapture *)self->_signpostPlistCapture describeChunkWithTag:v6];
    }
    id v5 = v7;
  }
  else
  {
    id v5 = *(&off_10690 + (int)v4 - 20584);
  }

  return v5;
}

- (void)_appendSyscallMapToFile:(ktrace_file *)a3
{
  uint64_t v4 = +[NSData dataWithContentsOfFile:@"/usr/share/misc/syscalls.json"];
  id v6 = v4;
  if (v4)
  {
    id v5 = v4;
    [v5 bytes];
    [v5 length];
    ktrace_file_append_chunk();
  }
  else
  {
    [(KTProviderLogger *)self->_logger failWithReason:@"Failed to capture syscall data from '/usr/share/misc/syscalls.json'"];
  }
}

- (void)emitVnodePathTracepointsIfEnabled
{
  if (self->_shouldEmitVnodePathNameTracepoints && sysctlbyname("vfs.generic.trace_paths", 0, 0, 0, 0))
  {
    logger = self->_logger;
    [(KTProviderLogger *)logger warnWithMessage:@"WARNING: Unable to dump full vnode-to-path mappings; some vnodes may be missing paths"];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_symbolsMapCapture, 0);
  objc_storeStrong((id *)&self->_graphicsCapture, 0);
  objc_storeStrong((id *)&self->_signpostPlistCapture, 0);

  objc_storeStrong((id *)&self->_ioRegCapture, 0);
}

@end