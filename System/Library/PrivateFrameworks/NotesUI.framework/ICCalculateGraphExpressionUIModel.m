@interface ICCalculateGraphExpressionUIModel
- (_NSRange)highlightRangeForTextFindingMatchRange:(_NSRange)a3;
- (id)attributedStringWithSurroundingAttributes:(id)a3 formatter:(id)a4;
- (id)labelColor;
@end

@implementation ICCalculateGraphExpressionUIModel

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
    v7.super_class = (Class)ICCalculateGraphExpressionUIModel;
    uint64_t v4 = [(ICInlineAttachmentUIModel *)&v7 labelColor];
  }
  v5 = (void *)v4;

  return v5;
}

- (id)attributedStringWithSurroundingAttributes:(id)a3 formatter:(id)a4
{
  v35[3] = *MEMORY[0x1E4F143B8];
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
    uint64_t v18 = v16 - v15;
    v34[0] = *MEMORY[0x1E4FB0700];
    uint64_t v19 = v34[0];
    v20 = [(ICCalculateGraphExpressionUIModel *)self labelColor];
    v35[0] = v20;
    v34[1] = *MEMORY[0x1E4F83588];
    v21 = [(ICCalculateGraphExpressionUIModel *)self labelColor];
    v35[1] = v21;
    v34[2] = *MEMORY[0x1E4F83218];
    id v22 = [(ICCalculateGraphExpressionUIModel *)self labelColor];
    v35[2] = [v22 CGColor];
    v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:3];

    objc_msgSend(v10, "addAttributes:range:", v23, 0, v18);
    v24 = [v6 objectForKeyedSubscript:v19];
    v25 = v24;
    if (v24)
    {
      id v26 = v24;
    }
    else
    {
      id v26 = [MEMORY[0x1E4FB1618] preferredDefaultFontColor];
    }
    v27 = v26;

    uint64_t v28 = *MEMORY[0x1E4F83588];
    v32[0] = v19;
    v32[1] = v28;
    v33[0] = v27;
    v33[1] = v27;
    v32[2] = *MEMORY[0x1E4F83218];
    id v29 = v27;
    v33[2] = [v29 CGColor];
    v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:3];
    objc_msgSend(v10, "addAttributes:range:", v30, v13, v15);
    v17 = (void *)[v10 copy];
  }
  return v17;
}

- (_NSRange)highlightRangeForTextFindingMatchRange:(_NSRange)a3
{
  NSUInteger length = 4;
  NSUInteger v4 = a3.length + 3;
  if (a3.length != 2) {
    NSUInteger length = a3.length + 3;
  }
  if (a3.length <= 1) {
    NSUInteger length = a3.length;
  }
  NSUInteger v5 = a3.location + 3;
  NSUInteger v6 = 4;
  if (a3.length != 2) {
    NSUInteger v6 = a3.length + 3;
  }
  if (a3.length <= 1) {
    NSUInteger v6 = a3.length;
  }
  if (!a3.location)
  {
    NSUInteger v5 = 1;
    NSUInteger v4 = v6;
  }
  if (a3.location == 1) {
    NSUInteger v7 = 3;
  }
  else {
    NSUInteger v7 = v5;
  }
  if (a3.location == 1) {
    NSUInteger v8 = length;
  }
  else {
    NSUInteger v8 = v4;
  }
  result.NSUInteger length = v8;
  result.location = v7;
  return result;
}

@end