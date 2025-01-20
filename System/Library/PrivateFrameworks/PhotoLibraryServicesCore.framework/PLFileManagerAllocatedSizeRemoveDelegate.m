@interface PLFileManagerAllocatedSizeRemoveDelegate
- (BOOL)fileManager:(id)a3 shouldRemoveItemAtURL:(id)a4;
- (int64_t)totalFileAllocatedSize;
- (unint64_t)count;
@end

@implementation PLFileManagerAllocatedSizeRemoveDelegate

- (unint64_t)count
{
  return self->_count;
}

- (int64_t)totalFileAllocatedSize
{
  return self->_totalFileAllocatedSize;
}

- (BOOL)fileManager:(id)a3 shouldRemoveItemAtURL:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v14 = *MEMORY[0x1E4F1C718];
  uint64_t v5 = v14;
  v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  v8 = [v6 arrayWithObjects:&v14 count:1];
  v9 = objc_msgSend(v7, "resourceValuesForKeys:error:", v8, 0, v14, v15);

  v10 = [v9 objectForKeyedSubscript:v5];
  uint64_t v11 = [v10 longLongValue];

  int64x2_t v12 = vdupq_n_s64(1uLL);
  v12.i64[0] = v11;
  *(int64x2_t *)&self->_totalFileAllocatedSize = vaddq_s64(*(int64x2_t *)&self->_totalFileAllocatedSize, v12);

  return 1;
}

@end