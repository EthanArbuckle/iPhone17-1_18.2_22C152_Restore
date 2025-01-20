@interface NSCharacterSet
@end

@implementation NSCharacterSet

uint64_t __73__NSCharacterSet_LanguageIdentificationAdditions__vietnameseCharacterSet__block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x263F089C0], "characterSetWithRange:", 7840, 95);
  v1 = (void *)vietnameseCharacterSet___vietnameseCharset;
  vietnameseCharacterSet___vietnameseCharset = v0;

  v2 = (void *)vietnameseCharacterSet___vietnameseCharset;
  return [v2 addCharactersInString:@"àÀãÃáÁăĂâÂđĐèÈéÉêÊìÌĩĨíÍòÒõÕóÓôÔơƠùÙũŨúÚưýÝ"];
}

@end