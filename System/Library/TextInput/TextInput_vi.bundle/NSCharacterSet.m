@interface NSCharacterSet
@end

@implementation NSCharacterSet

uint64_t __68__NSCharacterSet_VietnameseAdditions__TI_vietnameseBaseCharacterSet__block_invoke()
{
  TI_vietnameseBaseCharacterSet___vietnameseBaseCharacterSet = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"];
  return MEMORY[0x270F9A758]();
}

uint64_t __77__NSCharacterSet_VietnameseAdditions__TI_vietnameseTelexSpecialsCharacterSet__block_invoke()
{
  TI_vietnameseTelexSpecialsCharacterSet___vietnameseTelexSpecialsCharacterSet = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"[]{}"];
  return MEMORY[0x270F9A758]();
}

uint64_t __76__NSCharacterSet_VietnameseAdditions__TI_vietnameseVIQRSpecialsCharacterSet__block_invoke()
{
  TI_vietnameseVIQRSpecialsCharacterSet___vietnameseVIQRSpecialsCharacterSet = ;
  return MEMORY[0x270F9A758]();
}

uint64_t __75__NSCharacterSet_VietnameseAdditions__TI_vietnameseVNISpecialsCharacterSet__block_invoke()
{
  TI_vietnameseVNISpecialsCharacterSet___vietnameseVNISpecialsCharacterSet = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"1234567890"];
  return MEMORY[0x270F9A758]();
}

@end