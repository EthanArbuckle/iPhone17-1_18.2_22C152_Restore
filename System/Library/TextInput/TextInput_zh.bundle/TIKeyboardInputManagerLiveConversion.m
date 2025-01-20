@interface TIKeyboardInputManagerLiveConversion
@end

@implementation TIKeyboardInputManagerLiveConversion

void __71__TIKeyboardInputManagerLiveConversion_zh_presentSegmentPickerIfNeeded__block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v7 = (void *)a1[4];
  id v8 = a2;
  LODWORD(v7) = [v7 inputIndex];
  uint64_t v9 = *(void *)(*(void *)(a1[5] + 8) + 24);
  v10 = [v8 surface];
  unint64_t v11 = [v10 length] + v9;

  if (v11 >= v7)
  {
    *(void *)(*(void *)(a1[6] + 8) + 24) = a3;
    *a4 = 1;
  }
  id v12 = [v8 surface];

  *(void *)(*(void *)(a1[5] + 8) + 24) += [v12 length];
}

@end