@interface UILabel(VideosExtras)
- (uint64_t)_textAlignmentFromElementAlignment:()VideosExtras;
- (uint64_t)configureForIKTextElement:()VideosExtras fontDescriptor:textStyle:;
- (uint64_t)configureForIKTextElement:()VideosExtras fontDescriptor:textStyle:capitalize:;
- (void)configureForIKTextElement:()VideosExtras fontDescriptor:textStyle:capitalize:overrideWithTraitCollection:;
@end

@implementation UILabel(VideosExtras)

- (uint64_t)_textAlignmentFromElementAlignment:()VideosExtras
{
  if (a3 == 2) {
    return 1;
  }
  else {
    return 2 * (a3 == 3);
  }
}

- (uint64_t)configureForIKTextElement:()VideosExtras fontDescriptor:textStyle:
{
  return [a1 configureForIKTextElement:a3 fontDescriptor:a4 textStyle:a5 capitalize:0];
}

- (uint64_t)configureForIKTextElement:()VideosExtras fontDescriptor:textStyle:capitalize:
{
  return [a1 configureForIKTextElement:a3 fontDescriptor:a4 textStyle:a5 capitalize:a6 overrideWithTraitCollection:0];
}

- (void)configureForIKTextElement:()VideosExtras fontDescriptor:textStyle:capitalize:overrideWithTraitCollection:
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  v15 = (void *)MEMORY[0x1E4FB08E8];
  id v16 = a4;
  v17 = [v15 preferredFontDescriptorWithTextStyle:v13];
  v18 = [v16 fontAttributes];

  uint64_t v19 = [v17 fontDescriptorByAddingAttributes:v18];

  v33 = (void *)v19;
  v20 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v19 size:0.0];
  if (v14)
  {
    v21 = (void *)MEMORY[0x1E4FB08E0];
    v22 = [v14 preferredContentSizeCategory];
    uint64_t v23 = [v21 _preferredFontForTextStyle:v13 maximumContentSizeCategory:v22];

    v20 = (void *)v23;
  }
  [a1 setFont:v20];
  uint64_t v24 = [v12 maxLines];
  [a1 setNumberOfLines:v24 & ~(v24 >> 63)];
  v25 = [v12 color];
  if (v25) {
    [a1 setTextColor:v25];
  }
  objc_msgSend(a1, "setTextAlignment:", objc_msgSend(a1, "_textAlignmentFromElementAlignment:", objc_msgSend(v12, "alignment")));
  v26 = [MEMORY[0x1E4F28B18] attributedStringWithTextElement:v12 baseFont:v20];
  if (a6)
  {
    v27 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithAttributedString:v26];
    v28 = [v26 string];
    v29 = [v28 uppercaseString];

    objc_msgSend(v27, "replaceCharactersInRange:withString:", 0, objc_msgSend(v29, "length"), v29);
    v26 = v27;
  }
  if (v14)
  {
    uint64_t v30 = [v26 length];
    uint64_t v34 = *MEMORY[0x1E4FB06F8];
    v35[0] = v20;
    v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
    v32 = (void *)[v26 mutableCopy];
    objc_msgSend(v32, "addAttributes:range:", v31, 0, v30);

    v26 = v32;
  }
  [a1 setAttributedText:v26];
}

@end