@interface NSMutableString
@end

@implementation NSMutableString

uint64_t __49__NSMutableString_ICSWriter__controlCharacterSet__block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F28E58], "characterSetWithRange:", 0, 9);
  v1 = (void *)controlCharacterSet_controlCharacterSet;
  controlCharacterSet_controlCharacterSet = v0;

  objc_msgSend((id)controlCharacterSet_controlCharacterSet, "addCharactersInRange:", 10, 22);
  v2 = (void *)controlCharacterSet_controlCharacterSet;
  return objc_msgSend(v2, "addCharactersInRange:", 127, 1);
}

@end