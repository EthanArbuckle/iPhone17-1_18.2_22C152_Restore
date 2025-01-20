@interface NSAttributedString(VideosExtras)
+ (id)attributedStringWithTextElement:()VideosExtras baseFont:;
@end

@implementation NSAttributedString(VideosExtras)

+ (id)attributedStringWithTextElement:()VideosExtras baseFont:
{
  id v5 = a3;
  v6 = [v5 attributedStringWithFont:a4];
  uint64_t v7 = [v6 string];
  if (v7) {
    v8 = (__CFString *)v7;
  }
  else {
    v8 = &stru_1F3E921E0;
  }
  uint64_t v9 = [(__CFString *)v8 length];
  v10 = [v5 textAttributes];

  v11 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v8];
  objc_msgSend(v11, "addAttributes:range:", v10, 0, v9);

  return v11;
}

@end