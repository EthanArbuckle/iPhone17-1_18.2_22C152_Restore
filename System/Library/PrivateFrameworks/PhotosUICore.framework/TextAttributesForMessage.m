@interface TextAttributesForMessage
@end

@implementation TextAttributesForMessage

void ___TextAttributesForMessage_block_invoke()
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4FB1618] labelColor];
  v1 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28C8]];
  v2 = [v1 fontDescriptorWithSymbolicTraits:32770];

  v3 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v2 size:0.0];
  uint64_t v4 = *MEMORY[0x1E4FB0700];
  v7[0] = *MEMORY[0x1E4FB06F8];
  v7[1] = v4;
  v8[0] = v3;
  v8[1] = v0;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
  v6 = (void *)_TextAttributesForMessage__textAttributes;
  _TextAttributesForMessage__textAttributes = v5;
}

@end