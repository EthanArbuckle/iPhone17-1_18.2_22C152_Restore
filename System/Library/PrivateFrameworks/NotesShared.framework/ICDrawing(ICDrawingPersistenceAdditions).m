@interface ICDrawing(ICDrawingPersistenceAdditions)
@end

@implementation ICDrawing(ICDrawingPersistenceAdditions)

- (void)initWithData:()ICDrawingPersistenceAdditions version:replicaID:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C3A61000, log, OS_LOG_TYPE_ERROR, "ICDrawing protobuf corrupt.", v1, 2u);
}

- (void)initWithArchive:()ICDrawingPersistenceAdditions version:replicaID:.cold.1(int *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = *a1;
  v3[0] = 67109376;
  v3[1] = v2;
  __int16 v4 = 1024;
  int v5 = 6;
  _os_log_error_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_ERROR, "Skipped loading drawing. Drawing archive is wrong version (%d != %d).", (uint8_t *)v3, 0xEu);
}

@end