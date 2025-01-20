@interface WBSFrequentlyVisitedSiteCandidate
- (NSString)title;
- (NSString)urlString;
- (WBSFrequentlyVisitedSiteCandidate)initWithURLString:(id)a3 title:(id)a4 score:(float)a5;
- (float)score;
@end

@implementation WBSFrequentlyVisitedSiteCandidate

- (WBSFrequentlyVisitedSiteCandidate)initWithURLString:(id)a3 title:(id)a4 score:(float)a5
{
  id v9 = a3;
  id v10 = a4;
  v20.receiver = self;
  v20.super_class = (Class)WBSFrequentlyVisitedSiteCandidate;
  v11 = [(WBSFrequentlyVisitedSiteCandidate *)&v20 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_urlString, a3);
    v12->_score = a5;
    uint64_t v13 = [v10 length];
    if (v13)
    {
      uint64_t v14 = __67__WBSFrequentlyVisitedSiteCandidate_initWithURLString_title_score___block_invoke(v13, v10);
      title = v12->_title;
      v12->_title = (NSString *)v14;
    }
    else
    {
      title = (NSString *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v9];
      uint64_t v16 = [(NSString *)title safari_userVisibleHostWithoutWWWSubdomain];
      v17 = v12->_title;
      v12->_title = (NSString *)v16;
    }
    v18 = v12;
  }

  return v12;
}

id __67__WBSFrequentlyVisitedSiteCandidate_initWithURLString_title_score___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)[a2 mutableCopy];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:@"\\(\\d+\\)" options:0 error:0];
  objc_msgSend(v3, "replaceMatchesInString:options:range:withTemplate:", v2, 0, 0, objc_msgSend(v2, "length"), &stru_1EFBE3CF8);
  v4 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  v5 = [v2 stringByTrimmingCharactersInSet:v4];

  return v5;
}

- (NSString)urlString
{
  return self->_urlString;
}

- (NSString)title
{
  return self->_title;
}

- (float)score
{
  return self->_score;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_urlString, 0);
}

@end