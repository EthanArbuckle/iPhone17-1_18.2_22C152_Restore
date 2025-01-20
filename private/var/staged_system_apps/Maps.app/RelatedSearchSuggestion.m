@interface RelatedSearchSuggestion
- (BOOL)showCloseButton;
- (NSArray)components;
- (NSArray)pdSubstitutes;
- (NSArray)substitutes;
- (NSString)displayString;
- (NSString)resultDisplayHeader;
- (RelatedSearchSuggestion)initWithResultDisplayHeader:(id)a3 substitutes:(id)a4 visibleTime:(double)a5 showCloseButton:(BOOL)a6;
- (double)visibleTime;
- (void)_parseComponents;
- (void)_parseSubtitutes;
- (void)setComponents:(id)a3;
- (void)setPdSubstitutes:(id)a3;
- (void)setResultDisplayHeader:(id)a3;
- (void)setSubstitutes:(id)a3;
@end

@implementation RelatedSearchSuggestion

- (RelatedSearchSuggestion)initWithResultDisplayHeader:(id)a3 substitutes:(id)a4 visibleTime:(double)a5 showCloseButton:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  v16.receiver = self;
  v16.super_class = (Class)RelatedSearchSuggestion;
  v12 = [(RelatedSearchSuggestion *)&v16 init];
  if (v12)
  {
    v13 = (NSString *)[v10 copy];
    resultDisplayHeader = v12->_resultDisplayHeader;
    v12->_resultDisplayHeader = v13;

    objc_storeStrong((id *)&v12->_pdSubstitutes, a4);
    v12->_visibleTime = a5;
    v12->_showCloseButton = a6;
    [(RelatedSearchSuggestion *)v12 _parseSubtitutes];
    [(RelatedSearchSuggestion *)v12 _parseComponents];
  }

  return v12;
}

- (void)_parseSubtitutes
{
  id v21 = objc_alloc_init((Class)NSMutableArray);
  v3 = (char *)[(NSString *)self->_resultDisplayHeader rangeOfString:@"%s"];
  if (v3 != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = v3;
    uint64_t v6 = v4;
    unint64_t v7 = 0;
    v8 = 0;
    do
    {
      if (v7 >= [(NSArray *)self->_pdSubstitutes count]) {
        break;
      }
      unsigned __int8 v9 = -[NSString maps_isSubstringStartingAtRangeEscaped:](self->_resultDisplayHeader, "maps_isSubstringStartingAtRangeEscaped:", v5, v6);
      if (v5 > v8 && (v9 & 1) == 0)
      {
        id v10 = [RelatedSearchSuggestionSubstitute alloc];
        id v11 = [(NSArray *)self->_pdSubstitutes objectAtIndexedSubscript:v7];
        v12 = [(RelatedSearchSuggestionSubstitute *)v10 initWithLocation:v5 substitute:v11];

        [v21 addObject:v12];
        resultDisplayHeader = self->_resultDisplayHeader;
        v14 = [(RelatedSearchSuggestionSubstitute *)v12 substituteText];
        -[NSString stringByReplacingCharactersInRange:withString:](resultDisplayHeader, "stringByReplacingCharactersInRange:withString:", v5, v6, v14);
        v15 = (NSString *)objc_claimAutoreleasedReturnValue();
        objc_super v16 = self->_resultDisplayHeader;
        self->_resultDisplayHeader = v15;

        v5 = (char *)[(RelatedSearchSuggestionSubstitute *)v12 range];
        uint64_t v6 = v17;
      }
      v8 = &v5[v6];
      v5 = (char *)[(NSString *)self->_resultDisplayHeader rangeOfString:@"%s"];
      uint64_t v6 = v18;
      ++v7;
    }
    while (v5 != (char *)0x7FFFFFFFFFFFFFFFLL);
  }
  v19 = (NSArray *)[v21 copy];
  substitutes = self->_substitutes;
  self->_substitutes = v19;
}

- (NSString)displayString
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = self->_components;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        unsigned __int8 v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) displayText:(void)v12];
        [v3 appendString:v9];
      }
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  id v10 = [v3 copy];

  return (NSString *)v10;
}

- (void)_parseComponents
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  uint64_t v47 = 0;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2020000000;
  uint64_t v43 = 0;
  uint64_t v4 = self->_substitutes;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100AF767C;
  v35[3] = &unk_1013173F8;
  v38 = &v44;
  id v5 = v4;
  v36 = v5;
  id v34 = v3;
  id v37 = v34;
  v39 = &v40;
  id v6 = objc_retainBlock(v35);
  v8 = (char *)[(NSString *)self->_resultDisplayHeader rangeOfString:@"["];
  if (v8 != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v9 = v7;
    v33 = v6 + 16;
    do
    {
      unint64_t v10 = v45[3];
      if (v10 >= [(NSArray *)v5 count]) {
        break;
      }
      unsigned __int8 v11 = -[NSString maps_isSubstringStartingAtRangeEscaped:](self->_resultDisplayHeader, "maps_isSubstringStartingAtRangeEscaped:", v8, v9);
      if ((unint64_t)v8 <= v41[3]) {
        char v12 = 1;
      }
      else {
        char v12 = v11;
      }
      if ((v12 & 1) == 0)
      {
        long long v14 = (char *)[(NSString *)self->_resultDisplayHeader rangeOfString:@"]"];
        if (v14 != (char *)0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v15 = v13;
          while (1)
          {
            unint64_t v16 = v45[3];
            if (v16 >= [(NSArray *)v5 count]) {
              break;
            }
            unsigned __int8 v17 = -[NSString maps_isSubstringStartingAtRangeEscaped:](self->_resultDisplayHeader, "maps_isSubstringStartingAtRangeEscaped:", v14, v15);
            uint64_t v18 = (char *)v41[3];
            if (v14 <= v18) {
              char v19 = 1;
            }
            else {
              char v19 = v17;
            }
            if ((v19 & 1) == 0)
            {
              if (v8 > v18)
              {
                v20 = -[NSString substringWithRange:](self->_resultDisplayHeader, "substringWithRange:", v41[3], v8 - v18);
                (*((void (**)(char *, void *, char *, int64_t))v6 + 2))(v6, v20, v18, v8 - v18);

                uint64_t v18 = (char *)v41[3];
              }
              if (v18 == v8)
              {
                id v21 = &v14[v15 - (void)v8];
                v22 = -[NSString substringWithRange:](self->_resultDisplayHeader, "substringWithRange:", v8 + 1, v21 - 2);
                (*((void (**)(char *, void *, char *, char *))v6 + 2))(v6, v22, v8 + 1, v21 - 2);
                -[NSString stringByReplacingCharactersInRange:withString:](self->_resultDisplayHeader, "stringByReplacingCharactersInRange:withString:", v8, v21, v22);
                v23 = (NSString *)objc_claimAutoreleasedReturnValue();
                resultDisplayHeader = self->_resultDisplayHeader;
                self->_resultDisplayHeader = v23;
              }
              v8 = (char *)[(NSString *)self->_resultDisplayHeader rangeOfString:@"["];
              uint64_t v9 = v25;
              break;
            }
          }
        }
      }
    }
    while (v8 != (char *)0x7FFFFFFFFFFFFFFFLL);
  }
  unint64_t v26 = v41[3];
  if (v26 < [(NSString *)self->_resultDisplayHeader length])
  {
    NSUInteger v27 = [(NSString *)self->_resultDisplayHeader length];
    uint64_t v28 = v41[3];
    NSUInteger v29 = v27 - v28;
    v30 = -[NSString substringWithRange:](self->_resultDisplayHeader, "substringWithRange:", v28, v27 - v28);
    (*((void (**)(char *, void *, uint64_t, NSUInteger))v6 + 2))(v6, v30, v28, v29);
  }
  v31 = (NSArray *)[v34 copy];
  components = self->_components;
  self->_components = v31;

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);
}

- (NSArray)components
{
  return self->_components;
}

- (void)setComponents:(id)a3
{
}

- (double)visibleTime
{
  return self->_visibleTime;
}

- (BOOL)showCloseButton
{
  return self->_showCloseButton;
}

- (NSString)resultDisplayHeader
{
  return self->_resultDisplayHeader;
}

- (void)setResultDisplayHeader:(id)a3
{
}

- (NSArray)substitutes
{
  return self->_substitutes;
}

- (void)setSubstitutes:(id)a3
{
}

- (NSArray)pdSubstitutes
{
  return self->_pdSubstitutes;
}

- (void)setPdSubstitutes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pdSubstitutes, 0);
  objc_storeStrong((id *)&self->_substitutes, 0);
  objc_storeStrong((id *)&self->_resultDisplayHeader, 0);

  objc_storeStrong((id *)&self->_components, 0);
}

@end