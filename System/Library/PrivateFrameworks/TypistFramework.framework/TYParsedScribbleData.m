@interface TYParsedScribbleData
- (BOOL)isCursive;
- (NSArray)parsedData;
- (NSDictionary)pathMap;
- (NSString)convertedString;
- (NSString)regionCode;
- (TYParsedScribbleData)initWithText:(id)a3 regionCode:(id)a4 isCursive:(BOOL)a5;
- (id)_latexRegularExpression;
- (unint64_t)_calculateTotalWidthWithPathMap:(id)a3;
- (unint64_t)totalWidth;
- (void)setConvertedString:(id)a3;
- (void)setIsCursive:(BOOL)a3;
- (void)setParsedData:(id)a3;
- (void)setPathMap:(id)a3;
- (void)setRegionCode:(id)a3;
- (void)setTotalWidth:(unint64_t)a3;
@end

@implementation TYParsedScribbleData

- (id)_latexRegularExpression
{
  if (_latexRegularExpression_onceToken != -1) {
    dispatch_once(&_latexRegularExpression_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)_latexRegularExpression_latexRegularExpression;
  return v2;
}

uint64_t __47__TYParsedScribbleData__latexRegularExpression__block_invoke()
{
  _latexRegularExpression_latexRegularExpression = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"(?<!\\\\)((?:((?<!\\$)\\${1}(?!\\$)))(.*?)(?<!\\\\)(?:((?<!\\$)\\${1}(?!\\$)))|(?:((?<!\\$)\\${2}(?!\\$)))(.*?)(?<!\\\\)(?:((?<!\\$)\\${2}(?!\\$)))|(?:(\\\\begin\\{equation\\}))(.*?)(?<!\\\\)(?:(\\\\end\\{equation\\})))" options:0 error:0];
  return MEMORY[0x270F9A758]();
}

- (unint64_t)_calculateTotalWidthWithPathMap:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v16 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = [(TYParsedScribbleData *)self parsedData];
  uint64_t v4 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([v9 isLatexString])
        {
          [v9 boundingSize];
          unint64_t v6 = (unint64_t)(v10 + (double)v6);
        }
        else
        {
          v11 = [v9 string];
          BOOL v12 = [(TYParsedScribbleData *)self isCursive];
          v13 = [(TYParsedScribbleData *)self regionCode];
          unint64_t v14 = +[TypistPathUtilities getTotalWidthForText:v11 isCursive:v12 withRegion:v13 fromPathMap:v16];

          objc_msgSend(v9, "setBoundingSize:", (double)v14, 0.0);
          v6 += v14;
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (TYParsedScribbleData)initWithText:(id)a3 regionCode:(id)a4 isCursive:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v53.receiver = self;
  v53.super_class = (Class)TYParsedScribbleData;
  double v10 = [(TYParsedScribbleData *)&v53 init];
  if (v10)
  {
    BOOL v42 = v5;
    id v44 = v9;
    v48 = objc_opt_new();
    v47 = objc_opt_new();
    v43 = v10;
    v41 = [(TYParsedScribbleData *)v10 _latexRegularExpression];
    objc_msgSend(v41, "matchesInString:options:range:", v8, 0, 0, objc_msgSend(v8, "length"));
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      unint64_t v13 = 0;
      uint64_t v46 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v50 != v46) {
            objc_enumerationMutation(obj);
          }
          v15 = v8;
          id v16 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          uint64_t v17 = [v16 range];
          uint64_t v19 = v18;
          uint64_t v20 = 2;
          if ([v16 rangeAtIndex:2] == 0x7FFFFFFFFFFFFFFFLL)
          {
            if ([v16 rangeAtIndex:5] == 0x7FFFFFFFFFFFFFFFLL) {
              uint64_t v20 = 8;
            }
            else {
              uint64_t v20 = 5;
            }
          }
          unint64_t v21 = [v16 rangeAtIndex:v20];
          unint64_t v22 = v21 - v13;
          if (v21 > v13)
          {
            uint64_t v23 = [TYParsedLatexData alloc];
            v24 = objc_msgSend(v15, "substringWithRange:", v13, v22);
            v25 = [(TYParsedLatexData *)v23 initWithString:v24 isLatex:0];

            v26 = [(TYParsedLatexData *)v25 string];
            [v47 appendString:v26];

            [v48 addObject:v25];
          }
          uint64_t v27 = 9;
          if (v20 == 5) {
            uint64_t v27 = 6;
          }
          if (v20 == 2) {
            uint64_t v28 = 3;
          }
          else {
            uint64_t v28 = v27;
          }
          v29 = [TYParsedLatexData alloc];
          uint64_t v30 = [v16 rangeAtIndex:v28];
          id v8 = v15;
          v32 = objc_msgSend(v15, "substringWithRange:", v30, v31);
          v33 = [(TYParsedLatexData *)v29 initWithString:v32 isLatex:1];

          v34 = [(TYParsedLatexData *)v33 convertedString];
          [v47 appendString:v34];

          [v48 addObject:v33];
          unint64_t v13 = v17 + v19;
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
      }
      while (v12);
    }
    else
    {
      unint64_t v13 = 0;
    }
    if (v13 < [v8 length])
    {
      v35 = [TYParsedLatexData alloc];
      v36 = [v8 substringFromIndex:v13];
      v37 = [(TYParsedLatexData *)v35 initWithString:v36 isLatex:0];

      v38 = [(TYParsedLatexData *)v37 string];
      [v47 appendString:v38];

      [v48 addObject:v37];
    }
    id v9 = v44;
    v39 = +[TypistPathUtilities getPathDataForCharacters:v47 withRegion:v44 isCursive:v42];
    double v10 = v43;
    [(TYParsedScribbleData *)v43 setParsedData:v48];
    [(TYParsedScribbleData *)v43 setConvertedString:v47];
    [(TYParsedScribbleData *)v43 setPathMap:v39];
    [(TYParsedScribbleData *)v43 setIsCursive:v42];
    [(TYParsedScribbleData *)v43 setRegionCode:v44];
    [(TYParsedScribbleData *)v43 setTotalWidth:[(TYParsedScribbleData *)v43 _calculateTotalWidthWithPathMap:v39]];
  }
  return v10;
}

- (NSArray)parsedData
{
  return self->_parsedData;
}

- (void)setParsedData:(id)a3
{
}

- (NSDictionary)pathMap
{
  return self->_pathMap;
}

- (void)setPathMap:(id)a3
{
}

- (NSString)convertedString
{
  return self->_convertedString;
}

- (void)setConvertedString:(id)a3
{
}

- (NSString)regionCode
{
  return self->_regionCode;
}

- (void)setRegionCode:(id)a3
{
}

- (BOOL)isCursive
{
  return self->_isCursive;
}

- (void)setIsCursive:(BOOL)a3
{
  self->_isCursive = a3;
}

- (unint64_t)totalWidth
{
  return self->_totalWidth;
}

- (void)setTotalWidth:(unint64_t)a3
{
  self->_totalWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionCode, 0);
  objc_storeStrong((id *)&self->_convertedString, 0);
  objc_storeStrong((id *)&self->_pathMap, 0);
  objc_storeStrong((id *)&self->_parsedData, 0);
}

@end