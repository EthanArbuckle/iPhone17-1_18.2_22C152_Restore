@interface AutocompleteStringMatcher
- (AutocompleteMatchInfo)matchInfo;
- (AutocompleteStringMatcher)init;
- (AutocompleteStringMatcher)initWithPlaceAddress:(id)a3 matchInfo:(id)a4;
- (AutocompleteStringMatcher)initWithPlaceName:(id)a3 matchInfo:(id)a4;
- (AutocompleteStringMatcher)initWithString:(id)a3 requiredMatchLength:(unint64_t)a4 matchInfo:(id)a5;
- (id)matchForAutocompleteSearchString:(id)a3;
@end

@implementation AutocompleteStringMatcher

- (AutocompleteStringMatcher)init
{
  return 0;
}

- (AutocompleteStringMatcher)initWithString:(id)a3 requiredMatchLength:(unint64_t)a4 matchInfo:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)AutocompleteStringMatcher;
  v11 = [(AutocompleteStringMatcher *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_string, a3);
    v12->_requiredMatchLength = a4;
    objc_storeStrong((id *)&v12->_matchInfo, a5);
  }

  return v12;
}

- (AutocompleteStringMatcher)initWithPlaceName:(id)a3 matchInfo:(id)a4
{
  return [(AutocompleteStringMatcher *)self initWithString:a3 requiredMatchLength:1 matchInfo:a4];
}

- (AutocompleteStringMatcher)initWithPlaceAddress:(id)a3 matchInfo:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if (objc_msgSend(v7, "_navigation_isCJK")) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = 3;
  }
  id v9 = [(AutocompleteStringMatcher *)self initWithString:v7 requiredMatchLength:v8 matchInfo:v6];

  return v9;
}

- (id)matchForAutocompleteSearchString:(id)a3
{
  id v4 = a3;
  if (-[NSString length](self->_string, "length") && [v4 length])
  {
    unsigned __int8 v5 = [v4 _navigation_isCJK];
    id v6 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
    id v7 = [v4 stringByTrimmingCharactersInSet:v6];
    uint64_t v8 = [v7 componentsSeparatedByCharactersInSet:v6];

    if ([v8 count])
    {
      id v9 = [(NSString *)self->_string componentsSeparatedByCharactersInSet:v6];
      id v10 = [v9 mutableCopy];

      id v20 = [v10 count];
      uint64_t v40 = 0;
      v41 = &v40;
      uint64_t v42 = 0x2020000000;
      uint64_t v43 = 0;
      uint64_t v36 = 0;
      v37 = (double *)&v36;
      uint64_t v38 = 0x2020000000;
      uint64_t v39 = 0;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id obj = v8;
      id v11 = [obj countByEnumeratingWithState:&v32 objects:v44 count:16];
      if (v11)
      {
        char v12 = v5 ^ 1;
        uint64_t v13 = *(void *)v33;
        while (2)
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v33 != v13) {
              objc_enumerationMutation(obj);
            }
            uint64_t v15 = *(void *)(*((void *)&v32 + 1) + 8 * i);
            uint64_t v28 = 0;
            v29 = &v28;
            uint64_t v30 = 0x2020000000;
            char v31 = 0;
            uint64_t v24 = 0;
            v25 = &v24;
            uint64_t v26 = 0x2020000000;
            uint64_t v27 = 0x7FFFFFFFFFFFFFFFLL;
            v22[0] = _NSConcreteStackBlock;
            v22[1] = 3221225472;
            v22[2] = sub_1006B3494;
            v22[3] = &unk_1012F4BA0;
            char v23 = v12;
            v22[4] = v15;
            v22[5] = &v28;
            v22[6] = &v40;
            v22[7] = &v24;
            v22[8] = &v36;
            [v10 enumerateObjectsUsingBlock:v22, v20];
            if (!*((unsigned char *)v29 + 24))
            {
              _Block_object_dispose(&v24, 8);
              _Block_object_dispose(&v28, 8);

              goto LABEL_17;
            }
            [v10 removeObjectsInRange:0, v25[3] + 1];
            _Block_object_dispose(&v24, 8);
            _Block_object_dispose(&v28, 8);
          }
          id v11 = [obj countByEnumeratingWithState:&v32 objects:v44 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }

      if (v41[3] < self->_requiredMatchLength)
      {
LABEL_17:
        id v17 = 0;
      }
      else
      {
        v16 = [(AutocompleteStringMatcher *)self matchInfo];
        id v17 = [v16 copy];

        if (v20)
        {
          double v18 = v37[3] / (double)(unint64_t)v20;
          v37[3] = v18;
        }
        else
        {
          double v18 = v37[3];
        }
        [v17 setFractionOfMatch:v18, v20];
      }
      _Block_object_dispose(&v36, 8);
      _Block_object_dispose(&v40, 8);
    }
    else
    {
      id v17 = 0;
    }
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (AutocompleteMatchInfo)matchInfo
{
  return self->_matchInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchInfo, 0);

  objc_storeStrong((id *)&self->_string, 0);
}

@end