@interface ICCalculateResultUIModel
- (_NSRange)highlightRangeForTextFindingMatchRange:(_NSRange)a3;
- (id)attributedStringWithSurroundingAttributes:(id)a3 formatter:(id)a4;
- (id)labelColor;
@end

@implementation ICCalculateResultUIModel

- (id)labelColor
{
  v3 = [(ICInlineAttachmentUIModel *)self attachment];
  if ([v3 isValidCalculateAttachment])
  {
    uint64_t v4 = [MEMORY[0x1E4FB1618] ICControlAccentColor];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)ICCalculateResultUIModel;
    uint64_t v4 = [(ICInlineAttachmentUIModel *)&v7 labelColor];
  }
  v5 = (void *)v4;

  return v5;
}

- (id)attributedStringWithSurroundingAttributes:(id)a3 formatter:(id)a4
{
  v39[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [(id)objc_opt_class() filteredStyleAttributes:v5];

  id v7 = objc_alloc(MEMORY[0x1E4F28E48]);
  v8 = [(ICInlineAttachmentUIModel *)self attachment];
  v9 = [v8 displayText];
  v10 = (void *)[v7 initWithString:v9 attributes:v6];

  v11 = [v10 string];
  v12 = objc_msgSend(NSString, "ic_calculateEqualsSignString");
  uint64_t v13 = [v11 rangeOfString:v12];
  uint64_t v15 = v14;

  uint64_t v16 = [v10 length];
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v17 = (void *)[v10 copy];
  }
  else
  {
    uint64_t v35 = v13 + v15;
    uint64_t v34 = v16 - (v13 + v15);
    uint64_t v18 = *MEMORY[0x1E4FB0700];
    v19 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4FB0700]];
    v20 = v19;
    if (v19)
    {
      id v21 = v19;
    }
    else
    {
      id v21 = [MEMORY[0x1E4FB1618] preferredDefaultFontColor];
    }
    v22 = v21;

    v23 = (void *)MEMORY[0x1E4F83588];
    uint64_t v24 = *MEMORY[0x1E4F83588];
    v38[0] = v18;
    v38[1] = v24;
    v39[0] = v22;
    v39[1] = v22;
    v25 = (void *)MEMORY[0x1E4F83218];
    v38[2] = *MEMORY[0x1E4F83218];
    id v26 = v22;
    v39[2] = [v26 CGColor];
    v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:3];
    objc_msgSend(v10, "addAttributes:range:", v27, v13, v15);
    v36[0] = v18;
    v28 = [(ICCalculateResultUIModel *)self labelColor];
    v37[0] = v28;
    v36[1] = *v23;
    v29 = [(ICCalculateResultUIModel *)self labelColor];
    v37[1] = v29;
    v36[2] = *v25;
    id v30 = [(ICCalculateResultUIModel *)self labelColor];
    v37[2] = [v30 CGColor];
    v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:3];

    objc_msgSend(v10, "addAttributes:range:", v31, v35, v34);
    v32 = objc_msgSend(NSString, "ic_thinSpaceCharacterString");
    objc_msgSend(v10, "ic_appendString:", v32);

    v17 = (void *)[v10 copy];
  }

  return v17;
}

- (_NSRange)highlightRangeForTextFindingMatchRange:(_NSRange)a3
{
  if (a3.location) {
    NSUInteger v3 = a3.location + 3;
  }
  else {
    NSUInteger v3 = 2;
  }
  BOOL v4 = a3.length > 1 && a3.location == 0;
  NSUInteger v5 = a3.length + v4;
  result.length = v5;
  result.location = v3;
  return result;
}

@end