@interface CNVCardXABPHOTOParser
+ (id)valueWithName:(id)a3;
@end

@implementation CNVCardXABPHOTOParser

+ (id)valueWithName:(id)a3
{
  id v4 = a3;
  if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))())
  {
    v5 = 0;
  }
  else
  {
    v6 = [MEMORY[0x1E4F28B50] bundleForClass:a1];
    v7 = [v6 URLForResource:v4 withExtension:@"png"];
    v5 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v7];
  }
  return v5;
}

@end