@interface LTWordTimingInfo
@end

@implementation LTWordTimingInfo

void __58___LTWordTimingInfo_Daemon__wordTimingInfoFromArray_text___block_invoke(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x263F1C1C8];
  id v4 = a2;
  id v9 = objc_alloc_init(v3);
  objc_msgSend(v9, "setLength:", objc_msgSend(v4, "length"));
  objc_msgSend(v9, "setOffset:", objc_msgSend(v4, "offset"));
  v5 = [v4 word];
  [v9 setWord:v5];

  objc_msgSend(v9, "setSampleIndex:", objc_msgSend(v4, "sample_idx"));
  [v4 timestamp];
  [v9 setStartTime:v6];
  uint64_t v7 = [v4 offset];
  unsigned int v8 = [v4 length];

  objc_msgSend(v9, "setTextRange:", v7, v8);
  [*(id *)(a1 + 32) addObject:v9];
}

void __67___LTWordTimingInfo_Daemon__wordTimingInfoFromSiriTTSService_text___block_invoke(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x263F1C1C8];
  id v4 = a2;
  id v10 = objc_alloc_init(v3);
  [v4 textRange];
  [v10 setLength:v5];
  objc_msgSend(v10, "setOffset:", objc_msgSend(v4, "textRange"));
  [v10 setWord:&stru_270C008E8];
  [v4 startTime];
  [v10 setStartTime:v6 * 1000.0];
  uint64_t v7 = [v4 textRange];
  uint64_t v9 = v8;

  objc_msgSend(v10, "setTextRange:", v7, v9);
  [*(id *)(a1 + 32) addObject:v10];
}

@end