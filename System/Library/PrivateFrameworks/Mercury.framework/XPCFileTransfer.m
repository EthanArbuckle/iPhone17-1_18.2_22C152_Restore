@interface XPCFileTransfer
@end

@implementation XPCFileTransfer

void __XPCFileTransfer_open_block_invoke()
{
  v5[4] = *MEMORY[0x1E4F143C0];
  uint64_t v0 = *MEMORY[0x1E4F1C570];
  v4[0] = *MEMORY[0x1E4F1C598];
  v4[1] = v0;
  v5[0] = &unk_1F2EF48D8;
  v5[1] = &unk_1F2EF48F0;
  uint64_t v1 = *MEMORY[0x1E4F1C580];
  v4[2] = *MEMORY[0x1E4F1C578];
  v4[3] = v1;
  v5[2] = &unk_1F2EF4908;
  v5[3] = &unk_1F2EF4920;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:4];
  v3 = (void *)XPCFileTransfer_open_protectionTypes;
  XPCFileTransfer_open_protectionTypes = v2;
}

@end