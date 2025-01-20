@interface RVItem
+ (BOOL)supportsSecureCoding;
- (DDScannerResult)ddResult;
- (NSString)clientIdentifier;
- (NSString)contactPropertyValue;
- (NSString)leadingText;
- (NSString)originalSelectedText;
- (NSString)text;
- (NSString)textSearchContext;
- (NSString)trailingText;
- (NSURL)normalizedURL;
- (NSURL)url;
- (RVItem)initWithClientIdentifier:(id)a3 rangeInContext:(_NSRange)a4;
- (RVItem)initWithCoder:(id)a3;
- (RVItem)initWithContactProperty:(int64_t)a3 value:(id)a4 rangeInContext:(_NSRange)a5;
- (RVItem)initWithDDResult:(id)a3;
- (RVItem)initWithDDResult:(id)a3 text:(id)a4 range:(_NSRange)a5;
- (RVItem)initWithSearchQuery:(id)a3 rangeInContext:(_NSRange)a4;
- (RVItem)initWithText:(id)a3 clickedIndex:(unint64_t)a4 selectionRanges:(id)a5 shouldUpdateSelection:(BOOL *)a6;
- (RVItem)initWithText:(id)a3 selectedRange:(_NSRange)a4;
- (RVItem)initWithText:(id)a3 selectedRange:(_NSRange)a4 customURLParser:(id)a5;
- (RVItem)initWithURL:(id)a3 rangeInContext:(_NSRange)a4;
- (RVQuery)query;
- (_NSRange)highlightRange;
- (id)clientHints;
- (id)constrainContextSubstring:(uint64_t)a3 range:(unint64_t)a4 leading:(unsigned __int8)a5;
- (id)getClientHintKey:(id)a3 ofType:(Class)a4;
- (id)lookupContextFetchingBlock;
- (id)reportAnIssueBlock;
- (id)reportAnIssueExtendedBlock;
- (id)reportAnIssueMetadataFetchingBlock;
- (id)textQueryProvider;
- (int64_t)contactPropertyType;
- (int64_t)normalizedType;
- (int64_t)selectionType;
- (int64_t)type;
- (uint64_t)textContentRange;
- (void)commonInitWithText:(unint64_t)a3 selectedRange:(uint64_t)a4 customURLParser:(void *)a5 lookup:;
- (void)encodeWithCoder:(id)a3;
- (void)normalizeWithParser:(uint64_t)a1 lookupOnly:(void *)a2;
- (void)setClientHints:(id)a3;
- (void)setLeadingText:(id)a3;
- (void)setLookupContextFetchingBlock:(id)a3;
- (void)setOriginalSelectedText:(id)a3;
- (void)setReportAnIssueBlock:(id)a3;
- (void)setReportAnIssueExtendedBlock:(id)a3;
- (void)setReportAnIssueMetadataFetchingBlock:(id)a3;
- (void)setTextQueryProvider:(id)a3;
- (void)setTrailingText:(id)a3;
@end

@implementation RVItem

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lookupContextFetchingBlock, 0);
  objc_storeStrong(&self->_reportAnIssueMetadataFetchingBlock, 0);
  objc_storeStrong(&self->_reportAnIssueExtendedBlock, 0);
  objc_storeStrong(&self->_reportAnIssueBlock, 0);
  objc_storeStrong(&self->_textQueryProvider, 0);
  objc_storeStrong((id *)&self->_trailingText, 0);
  objc_storeStrong((id *)&self->_leadingText, 0);
  objc_storeStrong(&self->_clientHints, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_contactPropertyValue, 0);
  objc_storeStrong((id *)&self->_originalSelectedText, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_ddResult, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

- (void)setLookupContextFetchingBlock:(id)a3
{
}

- (id)lookupContextFetchingBlock
{
  return self->_lookupContextFetchingBlock;
}

- (void)setReportAnIssueMetadataFetchingBlock:(id)a3
{
}

- (id)reportAnIssueMetadataFetchingBlock
{
  return self->_reportAnIssueMetadataFetchingBlock;
}

- (void)setReportAnIssueExtendedBlock:(id)a3
{
}

- (id)reportAnIssueExtendedBlock
{
  return self->_reportAnIssueExtendedBlock;
}

- (void)setReportAnIssueBlock:(id)a3
{
}

- (id)reportAnIssueBlock
{
  return self->_reportAnIssueBlock;
}

- (void)setTextQueryProvider:(id)a3
{
}

- (id)textQueryProvider
{
  return self->_textQueryProvider;
}

- (void)setOriginalSelectedText:(id)a3
{
}

- (NSString)originalSelectedText
{
  return self->_originalSelectedText;
}

- (int64_t)selectionType
{
  return self->_selectionType;
}

- (void)setClientHints:(id)a3
{
}

- (id)clientHints
{
  return self->_clientHints;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (int64_t)contactPropertyType
{
  return self->_contactPropertyType;
}

- (NSString)contactPropertyValue
{
  return self->_contactPropertyValue;
}

- (_NSRange)highlightRange
{
  NSUInteger length = self->_highlightRange.length;
  NSUInteger location = self->_highlightRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (NSString)text
{
  return self->_text;
}

- (RVQuery)query
{
  return self->_query;
}

- (DDScannerResult)ddResult
{
  return self->_ddResult;
}

- (NSURL)url
{
  return self->_url;
}

- (int64_t)normalizedType
{
  return self->_normalizedType;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)trailingText
{
  trailingText = self->_trailingText;
  if (!trailingText)
  {
    if (self->_text && self->_type == 2)
    {
      uint64_t v4 = -[RVItem textContentRange]((uint64_t)self);
      v6 = [(RVItem *)(uint64_t)self constrainContextSubstring:v4 + v5 range:[(NSString *)self->_text length] - (v4 + v5) leading:0];
      v7 = self->_trailingText;
      self->_trailingText = v6;

      trailingText = self->_trailingText;
    }
    else
    {
      trailingText = 0;
    }
  }

  return trailingText;
}

- (uint64_t)textContentRange
{
  if (result)
  {
    uint64_t v1 = result;
    v2 = *(void **)(result + 32);
    if (v2 && *(void *)(v1 + 8) == 2 && *(void *)(v1 + 16) == 3)
    {
      uint64_t v3 = [v2 urlificationRange];
      return *(void *)(v1 + 64) - (v3 - [*(id *)(v1 + 32) range]);
    }
    else
    {
      return *(void *)(v1 + 64);
    }
  }
  return result;
}

- (id)constrainContextSubstring:(uint64_t)a3 range:(unint64_t)a4 leading:(unsigned __int8)a5
{
  id v9 = a2;
  v10 = 0;
  if (a1 && a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v11 = +[RVSelection maxContextLength];
    unint64_t v12 = a4 - v11;
    if (((a4 > v11) & a5) == 0) {
      unint64_t v12 = 0;
    }
    unint64_t v13 = v12 + a3;
    unint64_t v14 = [v9 length];
    v10 = 0;
    if (v14 > v13)
    {
      if (a4 >= v11) {
        unint64_t v15 = v11;
      }
      else {
        unint64_t v15 = a4;
      }
      if (v13 + v15 <= v14) {
        unint64_t v16 = v15;
      }
      else {
        unint64_t v16 = v14 - v13;
      }
      if (v16)
      {
        if (v13) {
          BOOL v17 = 0;
        }
        else {
          BOOL v17 = v16 == v14;
        }
        if (v17)
        {
          id v18 = v9;
        }
        else
        {
          id v18 = [v9 substringWithRange:v13];
        }
        v10 = v18;
      }
      else
      {
        v10 = 0;
      }
    }
  }

  return v10;
}

- (void)setTrailingText:(id)a3
{
  id v7 = a3;
  unint64_t v4 = [v7 length];
  if (v4)
  {
    uint64_t v5 = [(RVItem *)(uint64_t)self constrainContextSubstring:0 range:v4 leading:1u];
    trailingText = self->_trailingText;
    self->_trailingText = v5;
  }
  else
  {
    trailingText = self->_trailingText;
    self->_trailingText = 0;
  }
}

- (NSString)leadingText
{
  leadingText = self->_leadingText;
  if (!leadingText)
  {
    if (self->_text && self->_type == 2)
    {
      unint64_t v4 = -[RVItem textContentRange]((uint64_t)self);
      uint64_t v5 = [(RVItem *)(uint64_t)self constrainContextSubstring:0 range:v4 leading:1u];
      v6 = self->_leadingText;
      self->_leadingText = v5;

      leadingText = self->_leadingText;
    }
    else
    {
      leadingText = 0;
    }
  }

  return leadingText;
}

- (void)setLeadingText:(id)a3
{
  id v7 = a3;
  unint64_t v4 = [v7 length];
  if (v4)
  {
    uint64_t v5 = [(RVItem *)(uint64_t)self constrainContextSubstring:0 range:v4 leading:1u];
    leadingText = self->_leadingText;
    self->_leadingText = v5;
  }
  else
  {
    leadingText = self->_leadingText;
    self->_leadingText = 0;
  }
}

- (id)getClientHintKey:(id)a3 ofType:(Class)a4
{
  id v5 = a3;
  v6 = [(RVItem *)self clientHints];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [v6 objectForKeyedSubscript:v5];
      if (objc_opt_isKindOfClass()) {
        goto LABEL_6;
      }
    }
  }
  id v7 = 0;
LABEL_6:

  return v7;
}

- (NSURL)normalizedURL
{
  if (self) {
    -[RVItem normalizeWithParser:lookupOnly:]((uint64_t)self, 0);
  }
  url = self->_url;

  return url;
}

- (void)normalizeWithParser:(uint64_t)a1 lookupOnly:(void *)a2
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  uint64_t v3 = a2;
  if (!*(unsigned char *)(a1 + 96))
  {
    *(void *)(a1 + 16) = *(void *)(a1 + 8);
    unint64_t v4 = [(id)a1 text];
    id v5 = v4;
    uint64_t v6 = *(void *)(a1 + 16);
    if (v6 != 2) {
      goto LABEL_67;
    }
    id v7 = (unint64_t *)(a1 + 64);
    if (*(void *)(a1 + 64) == 0x7FFFFFFFFFFFFFFFLL || ![v4 length]) {
      goto LABEL_66;
    }
    uint64_t v8 = *(void *)(a1 + 64);
    uint64_t v9 = *(void *)(a1 + 72);
    uint64_t v10 = +[RVSelection searchRangeForString:*(void *)(a1 + 48) aroundLocation:v8];
    if (v11 < 2)
    {
LABEL_52:
      if (!v3) {
        goto LABEL_66;
      }
      if (!v9)
      {
LABEL_56:
        *(void *)&long long v58 = v8;
        *((void *)&v58 + 1) = v9;
        v41 = v3[2](v3, &v58);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unint64_t v42 = *(void *)(a1 + 72);
          if (v42)
          {
            if (__PAIR128__(v42, *v7) != v58)
            {
LABEL_65:

              goto LABEL_66;
            }
          }
          else
          {
            if (!*((void *)&v58 + 1)) {
              goto LABEL_65;
            }
            unint64_t v43 = v58;
            if (v43 >= [v5 length]) {
              goto LABEL_65;
            }
            *(_OWORD *)id v7 = v58;
          }
        }
        if (v41)
        {
          v44 = *(void **)(a1 + 24);
          *(void *)(a1 + 24) = v41;
          id v45 = v41;

          *(void *)(a1 + 16) = 1;
          goto LABEL_65;
        }
LABEL_66:
        uint64_t v6 = *(void *)(a1 + 16);
        goto LABEL_67;
      }
      uint64_t v6 = *(void *)(a1 + 16);
      if (v6 == 2)
      {
        if (v9 != *(void *)(a1 + 72))
        {
LABEL_74:
          *(unsigned char *)(a1 + 96) = 1;

          goto LABEL_75;
        }
        goto LABEL_56;
      }
LABEL_67:
      if (v6 == 3)
      {
        [*(id *)(a1 + 32) coreResult];
        if (DDResultGetCategory() == 1)
        {
          v46 = (void *)DDResultCopyExtractedURL();
          if (v46)
          {
            v47 = [NSURL URLWithString:v46];
            if (v47)
            {
              objc_storeStrong((id *)(a1 + 24), v47);
              *(void *)(a1 + 16) = 1;
            }
          }
        }
      }
      goto LABEL_74;
    }
    uint64_t v54 = v9;
    uint64_t v57 = v10;
    unint64_t v48 = v11;
    unint64_t v12 = objc_msgSend(v5, "substringWithRange:", v10, v11);
    unint64_t v13 = [NSURL URLWithString:v12];
    unint64_t v14 = [v13 scheme];
    id obj = v13;
    if ([v14 length])
    {
      unint64_t v15 = [v13 absoluteString];
      if ([v15 length])
      {
        unint64_t v16 = [v13 scheme];
        BOOL v17 = [v16 lowercaseString];
        int v55 = [&unk_26C1EBF40 containsObject:v17];

        if (v55)
        {
          id v18 = obj;
          objc_storeStrong((id *)(a1 + 24), obj);
          *(void *)(a1 + 16) = 1;
          *(void *)(a1 + 64) = v57;
          *(void *)(a1 + 72) = v48;
LABEL_51:

          uint64_t v9 = v54;
          goto LABEL_52;
        }
LABEL_12:
        uint64_t v51 = v8;
        v52 = v5;
        unint64_t v56 = *v7;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        v49 = (void *)[objc_alloc(MEMORY[0x263F394B8]) initWithScannerType:0 passiveIntent:0];
        v50 = v12;
        v19 = [MEMORY[0x263F394B0] scanString:v12 range:0x7FFFFFFFFFFFFFFFLL configuration:0];
        uint64_t v20 = [v19 countByEnumeratingWithState:&v60 objects:v65 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v61;
          do
          {
            uint64_t v23 = 0;
            do
            {
              if (*(void *)v61 != v22) {
                objc_enumerationMutation(v19);
              }
              v24 = *(void **)(*((void *)&v60 + 1) + 8 * v23);
              [v24 coreResult];
              int Category = DDResultGetCategory();
              if (Category) {
                BOOL v26 = Category == 7;
              }
              else {
                BOOL v26 = 1;
              }
              if (!v26)
              {
                char HasType = DDResultHasType();
                if ((HasType & 1) == 0)
                {
                  v28.NSUInteger location = DDResultGetRangeForURLification();
                  NSUInteger length = v28.length;
                  unint64_t v30 = v28.location + v57;
                  v31.NSUInteger length = *(void *)(a1 + 72);
                  if (v31.length)
                  {
                    if (v28.length >= 2 && floor((double)v28.length * 0.66) <= (double)v31.length)
                    {
                      uint64_t v32 = v30 + 2;
                      if (v30 >= 2) {
                        v28.NSUInteger location = v30 - 2;
                      }
                      else {
                        v28.NSUInteger location = 0;
                      }
                      if (v30 >= 2) {
                        uint64_t v32 = 4;
                      }
                      v28.length += v32;
                      v31.NSUInteger location = *(void *)(a1 + 64);
                      NSRange v33 = NSIntersectionRange(v28, v31);
                      if (v33.location == *(void *)(a1 + 64) && v33.length == *(void *)(a1 + 72))
                      {
LABEL_46:
                        *(void *)(a1 + 64) = v30;
                        *(void *)(a1 + 72) = length;
                        objc_storeStrong((id *)(a1 + 32), v24);
                        *(void *)(a1 + 16) = 3;
                        goto LABEL_47;
                      }
                    }
                  }
                  else if (v56 >= v30 && v56 - v30 < v28.length)
                  {
                    goto LABEL_46;
                  }
                }
              }
              ++v23;
            }
            while (v21 != v23);
            uint64_t v36 = [v19 countByEnumeratingWithState:&v60 objects:v65 count:16];
            uint64_t v21 = v36;
          }
          while (v36);
        }
LABEL_47:

        unint64_t v12 = v50;
        if (*(void *)(a1 + 16) == 2 && !*(void *)(a1 + 72))
        {
          uint64_t v64 = *MEMORY[0x263F13FC0];
          uint64_t v37 = v64;
          v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v64 count:1];
          v39 = (void *)[objc_alloc(MEMORY[0x263F14038]) initWithTagSchemes:v38];
          [v39 setString:v50];
          uint64_t v40 = [v50 length];
          v59[0] = MEMORY[0x263EF8330];
          v59[1] = 3221225472;
          v59[2] = __41__RVItem_normalizeWithParser_lookupOnly___block_invoke;
          v59[3] = &unk_264104D80;
          v59[6] = v48;
          v59[7] = v56;
          v59[4] = a1;
          v59[5] = v57;
          objc_msgSend(v39, "enumerateTagsInRange:unit:scheme:options:usingBlock:", 0, v40, 0, v37, 46, v59);
        }
        id v7 = (unint64_t *)(a1 + 64);
        id v5 = v52;
        uint64_t v8 = v51;
        id v18 = obj;
        goto LABEL_51;
      }
    }
    goto LABEL_12;
  }
LABEL_75:
}

void *__41__RVItem_normalizeWithParser_lookupOnly___block_invoke(void *result, uint64_t a2, uint64_t a3, unint64_t a4, unsigned char *a5)
{
  unint64_t v5 = result[5] + a3;
  unint64_t v6 = result[7];
  BOOL v7 = v6 >= v5;
  unint64_t v8 = v6 - v5;
  if (v7)
  {
    if (v8 >= a4) {
      return result;
    }
    uint64_t v9 = result[4];
    *(void *)(v9 + 64) = v5;
    *(void *)(v9 + 72) = a4;
  }
  *a5 = 1;
  return result;
}

- (NSString)textSearchContext
{
  if (self->_highlightRange.location == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_5;
  }
  uint64_t v3 = [(NSString *)self->_text length];
  if (!v3) {
    goto LABEL_6;
  }
  uint64_t v4 = +[RVSelection searchRangeForString:self->_text aroundLocation:self->_highlightRange.location];
  if (v5 < 2)
  {
LABEL_5:
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = -[NSString substringWithRange:](self->_text, "substringWithRange:", v4, v5);
  }
LABEL_6:

  return (NSString *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v13 = a3;
  [v13 encodeInteger:self->_type forKey:@"type"];
  [v13 encodeInteger:self->_normalizedType forKey:@"normalizedType"];
  url = self->_url;
  if (url) {
    [v13 encodeObject:url forKey:@"url"];
  }
  ddResult = self->_ddResult;
  if (ddResult) {
    [v13 encodeObject:ddResult forKey:@"ddResult"];
  }
  text = self->_text;
  BOOL v7 = v13;
  if (text)
  {
    [v13 encodeObject:text forKey:@"text"];
    unint64_t v8 = NSStringFromRange(self->_highlightRange);
    [v13 encodeObject:v8 forKey:@"highlightRange"];

    BOOL v7 = v13;
  }
  if (self->_contactPropertyValue)
  {
    [v13 encodeInteger:self->_contactPropertyType forKey:@"contactPropertyType"];
    [v13 encodeObject:self->_contactPropertyValue forKey:@"contactPropertyValue"];
    BOOL v7 = v13;
  }
  clientIdentifier = self->_clientIdentifier;
  if (clientIdentifier)
  {
    [v13 encodeObject:clientIdentifier forKey:@"clientIdentifier"];
    BOOL v7 = v13;
  }
  leadingText = self->_leadingText;
  if (leadingText)
  {
    [v13 encodeObject:leadingText forKey:@"leadingText"];
    BOOL v7 = v13;
  }
  trailingText = self->_trailingText;
  if (trailingText)
  {
    [v13 encodeObject:trailingText forKey:@"trailingText"];
    BOOL v7 = v13;
  }
  originalSelectedText = self->_originalSelectedText;
  if (originalSelectedText)
  {
    [v13 encodeObject:originalSelectedText forKey:@"originalSelectedText"];
    BOOL v7 = v13;
  }
}

- (RVItem)initWithCoder:(id)a3
{
  v31[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)RVItem;
  unint64_t v5 = [(RVItem *)&v30 init];
  if (v5)
  {
    v5->_type = [v4 decodeIntegerForKey:@"type"];
    v5->_normalizedType = [v4 decodeIntegerForKey:@"normalizedType"];
    Class v6 = NSClassFromString(&cfstr_Wksecurecoding.isa);
    if (v6)
    {
      BOOL v7 = (void *)MEMORY[0x263EFFA08];
      v31[0] = v6;
      v31[1] = objc_opt_class();
      unint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:2];
      uint64_t v9 = [v7 setWithArray:v8];
      uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"url"];
      url = v5->_url;
      v5->_url = (NSURL *)v10;
    }
    else
    {
      uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
      unint64_t v8 = v5->_url;
      v5->_url = (NSURL *)v12;
    }

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ddResult"];
    ddResult = v5->_ddResult;
    v5->_ddResult = (DDScannerResult *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"text"];
    text = v5->_text;
    v5->_text = (NSString *)v15;

    BOOL v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"highlightRange"];
    id v18 = v17;
    if (v17) {
      v5->_highlightRange = NSRangeFromString(v17);
    }
    v5->_contactPropertyType = [v4 decodeIntegerForKey:@"contactPropertyType"];
    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contactPropertyValue"];
    contactPropertyValue = v5->_contactPropertyValue;
    v5->_contactPropertyValue = (NSString *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientIdentifier"];
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = (NSString *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"leadingText"];
    leadingText = v5->_leadingText;
    v5->_leadingText = (NSString *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"trailingText"];
    trailingText = v5->_trailingText;
    v5->_trailingText = (NSString *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originalSelectedText"];
    originalSelectedText = v5->_originalSelectedText;
    v5->_originalSelectedText = (NSString *)v27;
  }
  return v5;
}

- (RVItem)initWithContactProperty:(int64_t)a3 value:(id)a4 rangeInContext:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RVItem;
  unint64_t v11 = [(RVItem *)&v14 init];
  uint64_t v12 = v11;
  if (v11)
  {
    v11->_type = 4;
    v11->_contactPropertyType = a3;
    objc_storeStrong((id *)&v11->_contactPropertyValue, a4);
    v12->_highlightRange.NSUInteger location = location;
    v12->_highlightRange.NSUInteger length = length;
    v12->_selectionType = 0;
    -[RVItem normalizeWithParser:lookupOnly:]((uint64_t)v12, 0);
  }

  return v12;
}

- (RVItem)initWithClientIdentifier:(id)a3 rangeInContext:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RVItem;
  uint64_t v9 = [(RVItem *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    v9->_type = 5;
    v9->_highlightRange.NSUInteger location = location;
    v9->_highlightRange.NSUInteger length = length;
    objc_storeStrong((id *)&v9->_clientIdentifier, a3);
    v10->_selectionType = 0;
    -[RVItem normalizeWithParser:lookupOnly:]((uint64_t)v10, 0);
  }

  return v10;
}

- (RVItem)initWithText:(id)a3 selectedRange:(_NSRange)a4 customURLParser:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)RVItem;
  unint64_t v11 = [(RVItem *)&v14 init];
  objc_super v12 = v11;
  if (v11) {
    -[RVItem commonInitWithText:selectedRange:customURLParser:lookup:](v11, v9, location, length, v10);
  }

  return v12;
}

- (void)commonInitWithText:(unint64_t)a3 selectedRange:(uint64_t)a4 customURLParser:(void *)a5 lookup:
{
  id v21 = a2;
  id v9 = a5;
  a1[1] = 2;
  uint64_t v10 = [v21 copy];
  unint64_t v11 = (void *)a1[6];
  a1[6] = v10;

  a1[8] = a3;
  a1[9] = a4;
  a1[15] = a4 != 0;
  -[RVItem normalizeWithParser:lookupOnly:]((uint64_t)a1, v9);
  if (!a1[15] && !a1[9] && a3 < [v21 length])
  {
    objc_super v12 = [MEMORY[0x263F08708] whitespaceCharacterSet];
    int v13 = objc_msgSend(v12, "characterIsMember:", objc_msgSend(v21, "characterAtIndex:", a3));

    if (v13)
    {
      objc_super v14 = [MEMORY[0x263F08708] whitespaceCharacterSet];
      unint64_t v15 = [v21 length];
      unint64_t v16 = a3;
      do
        unint64_t v17 = v16--;
      while (v16 < v15
           && (objc_msgSend(v14, "characterIsMember:", objc_msgSend(v21, "characterAtIndex:", v16)) & 1) != 0);
      unint64_t v18 = a3 + 1;
      do
      {
        unint64_t v19 = v18;
        if (v18 >= v15) {
          break;
        }
        char v20 = objc_msgSend(v14, "characterIsMember:", objc_msgSend(v21, "characterAtIndex:", v18));
        unint64_t v18 = v19 + 1;
      }
      while ((v20 & 1) != 0);
      a1[8] = v17;
      a1[9] = v19 - v17;
      a1[2] = 2;
    }
  }
}

- (RVItem)initWithText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RVItem;
  id v8 = [(RVItem *)&v11 init];
  id v9 = v8;
  if (v8) {
    -[RVItem commonInitWithText:selectedRange:customURLParser:lookup:](v8, v7, location, length, 0);
  }

  return v9;
}

- (RVItem)initWithText:(id)a3 clickedIndex:(unint64_t)a4 selectionRanges:(id)a5 shouldUpdateSelection:(BOOL *)a6
{
  id v10 = a3;
  id v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)RVItem;
  objc_super v12 = [(RVItem *)&v24 init];
  if (v12)
  {
    BOOL v23 = 0;
    unint64_t v13 = +[RVSelection revealRangeAtIndex:a4 selectedRanges:v11 shouldUpdateSelection:&v23];
    uint64_t v15 = v14;
    unint64_t v16 = [v11 firstObject];
    unint64_t v17 = [v16 rangeValue];
    NSUInteger v19 = v18;

    -[RVItem commonInitWithText:selectedRange:customURLParser:lookup:](v12, v10, v13, v15, 0);
    if (a4 >= v17 && a4 - v17 < v19 && v19 > v12->_highlightRange.length)
    {
      uint64_t v20 = objc_msgSend(v10, "substringWithRange:", v17, v19);
      originalSelectedText = v12->_originalSelectedText;
      v12->_originalSelectedText = (NSString *)v20;
    }
    if (a6) {
      *a6 = v23;
    }
  }

  return v12;
}

- (RVItem)initWithDDResult:(id)a3 text:(id)a4 range:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v10 = a3;
  id v11 = a4;
  v21.receiver = self;
  v21.super_class = (Class)RVItem;
  objc_super v12 = [(RVItem *)&v21 init];
  unint64_t v13 = v12;
  if (v12)
  {
    v12->_type = 3;
    objc_storeStrong((id *)&v12->_ddResult, a3);
    v13->_highlightRange.NSUInteger location = [v10 urlificationRange];
    v13->_highlightRange.NSUInteger length = v14;
    v13->_selectionType = 2;
    if (v11)
    {
      uint64_t v15 = (void *)[v11 copy];

      uint64_t v16 = [(RVItem *)(uint64_t)v13 constrainContextSubstring:0 range:location leading:1u];
      leadingText = v13->_leadingText;
      v13->_leadingText = (NSString *)v16;

      uint64_t v18 = -[RVItem constrainContextSubstring:range:leading:]((uint64_t)v13, v15, location + length, [v15 length] - (location + length), 0);
      trailingText = v13->_trailingText;
      v13->_trailingText = (NSString *)v18;

      id v11 = v15;
    }
    -[RVItem normalizeWithParser:lookupOnly:]((uint64_t)v13, 0);
  }

  return v13;
}

- (RVItem)initWithDDResult:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RVItem;
  Class v6 = [(RVItem *)&v10 init];
  id v7 = v6;
  if (v6)
  {
    v6->_type = 3;
    objc_storeStrong((id *)&v6->_ddResult, a3);
    v7->_highlightRange.NSUInteger location = [v5 urlificationRange];
    v7->_highlightRange.NSUInteger length = v8;
    v7->_selectionType = 2;
    -[RVItem normalizeWithParser:lookupOnly:]((uint64_t)v7, 0);
  }

  return v7;
}

- (RVItem)initWithURL:(id)a3 rangeInContext:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RVItem;
  id v9 = [(RVItem *)&v12 init];
  objc_super v10 = v9;
  if (v9)
  {
    v9->_type = 1;
    objc_storeStrong((id *)&v9->_url, a3);
    v10->_highlightRange.NSUInteger location = location;
    v10->_highlightRange.NSUInteger length = length;
    v10->_selectionType = 0;
    -[RVItem normalizeWithParser:lookupOnly:]((uint64_t)v10, 0);
  }

  return v10;
}

- (RVItem)initWithSearchQuery:(id)a3 rangeInContext:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RVItem;
  id v9 = [(RVItem *)&v12 init];
  objc_super v10 = v9;
  if (v9)
  {
    v9->_type = 6;
    objc_storeStrong((id *)&v9->_query, a3);
    v10->_highlightRange.NSUInteger location = location;
    v10->_highlightRange.NSUInteger length = length;
    v10->_selectionType = 0;
    -[RVItem normalizeWithParser:lookupOnly:]((uint64_t)v10, 0);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end