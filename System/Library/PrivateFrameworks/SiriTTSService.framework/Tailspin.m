@interface Tailspin
+ (void)collectTailspinToFile:(id)a3 minTimestamp:(unint64_t)a4 completion:(id)a5;
@end

@implementation Tailspin

+ (void)collectTailspinToFile:(id)a3 minTimestamp:(unint64_t)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v9 = dispatch_get_global_queue(9, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__Tailspin_collectTailspinToFile_minTimestamp_completion___block_invoke;
  block[3] = &unk_1E5920418;
  id v14 = v8;
  unint64_t v15 = a4;
  id v13 = v7;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, block);
}

void __58__Tailspin_collectTailspinToFile_minTimestamp_completion___block_invoke(uint64_t a1)
{
  v8[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4FBA988];
  v8[0] = MEMORY[0x1E4F1CC38];
  uint64_t v3 = *MEMORY[0x1E4FBA9A8];
  v7[0] = v2;
  v7[1] = v3;
  v4 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 48)];
  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  [*(id *)(a1 + 32) fileDescriptor];
  id v6 = *(id *)(a1 + 40);
  tailspin_dump_output_with_options();
}

void __58__Tailspin_collectTailspinToFile_minTimestamp_completion___block_invoke_2(uint64_t a1, char a2)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = 0;
  }
  else
  {
    v4 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v6 = *MEMORY[0x1E4F28568];
    v7[0] = @"Unable to dump tailspin";
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
    uint64_t v3 = [v4 errorWithDomain:&stru_1EEE20510 code:-1 userInfo:v5];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end