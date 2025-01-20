@interface UISlotId
@end

@implementation UISlotId

void __28___UISlotId_snapshotContext__block_invoke()
{
  id v2 = [MEMORY[0x1E4F1CA60] dictionary];
  [v2 setObject:@"SnapshotContext" forKey:*MEMORY[0x1E4F39E60]];
  [v2 setObject:*MEMORY[0x1E4F1CFD0] forKey:*MEMORY[0x1E4F39E80]];
  uint64_t v0 = [MEMORY[0x1E4F39B58] remoteContextWithOptions:v2];
  v1 = (void *)qword_1EB262550;
  qword_1EB262550 = v0;
}

@end