@interface SearchAddressBookOperationMatch
- (AutocompleteMatchInfo)autocompleteMatchInfo;
- (BOOL)isGoodMatch;
- (BOOL)isNameMatch;
- (BOOL)isOrganizationMatch;
- (CNContact)contact;
- (SearchAddressBookOperationMatch)init;
- (SearchAddressBookOperationMatch)initWithContact:(id)a3 context:(id)a4;
- (double)fractionOfMatch;
- (double)peopleSuggesterRank;
- (int64_t)compare:(id)a3;
- (void)setPeopleSuggesterRank:(double)a3;
@end

@implementation SearchAddressBookOperationMatch

- (SearchAddressBookOperationMatch)init
{
  return 0;
}

- (SearchAddressBookOperationMatch)initWithContact:(id)a3 context:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v56.receiver = self;
  v56.super_class = (Class)SearchAddressBookOperationMatch;
  v9 = [(SearchAddressBookOperationMatch *)&v56 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contact, a3);
    v10->_peopleSuggesterRank = 0.0;
    v10->_isCJK = [v8 isCJK];
    v11 = [v7 postalAddresses];
    v10->_hasAddress = [v11 count] != 0;

    if (v10->_hasAddress)
    {
      v12 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
      v49 = +[NSMutableArray array];
      v13 = +[NSMutableDictionary dictionary];
      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472;
      v54[2] = sub_100AC4B80;
      v54[3] = &unk_101316B18;
      id v48 = v12;
      id v55 = v48;
      v14 = objc_retainBlock(v54);
      v15 = [v7 namePrefix];
      v16 = ((void (*)(void *, void *))v14[2])(v14, v15);
      [v13 setObject:v16 forKeyedSubscript:@"namePrefix"];

      v17 = [v7 nickname];
      v18 = ((void (*)(void *, void *))v14[2])(v14, v17);
      [v13 setObject:v18 forKeyedSubscript:@"nickname"];

      v19 = [v7 givenName];
      v20 = ((void (*)(void *, void *))v14[2])(v14, v19);
      [v13 setObject:v20 forKeyedSubscript:@"givenName"];

      v21 = [v7 middleName];
      v22 = ((void (*)(void *, void *))v14[2])(v14, v21);
      [v13 setObject:v22 forKeyedSubscript:@"middleName"];

      v23 = [v7 familyName];
      v24 = ((void (*)(void *, void *))v14[2])(v14, v23);
      [v13 setObject:v24 forKeyedSubscript:@"familyName"];

      v25 = [v7 nameSuffix];
      v26 = ((void (*)(void *, void *))v14[2])(v14, v25);
      [v13 setObject:v26 forKeyedSubscript:@"nameSuffix"];

      v51[0] = _NSConcreteStackBlock;
      v51[1] = 3221225472;
      v51[2] = sub_100AC4D24;
      v51[3] = &unk_1012EE6E0;
      id v50 = v13;
      id v52 = v50;
      id v27 = v49;
      id v53 = v27;
      v28 = objc_retainBlock(v51);
      ((void (*)(void *, const __CFString *))v28[2])(v28, @"namePrefix");
      ((void (*)(void *, const __CFString *))v28[2])(v28, @"nickname");
      ((void (*)(void *, const __CFString *))v28[2])(v28, @"givenName");
      ((void (*)(void *, const __CFString *))v28[2])(v28, @"middleName");
      ((void (*)(void *, const __CFString *))v28[2])(v28, @"familyName");
      ((void (*)(void *, const __CFString *))v28[2])(v28, @"nameSuffix");
      v29 = +[CNContactFormatter stringFromContact:v7 style:0];
      if ([v27 count])
      {
        v30 = [v8 query];
        uint64_t v31 = [v30 matchesInStringTerms:v27 displayString:v29];
        stringMatch = v10->_stringMatch;
        v10->_stringMatch = (AutocompleteQueryStringMatch *)v31;

        if (!v10->_stringMatch)
        {
          [v27 removeAllObjects];
          ((void (*)(void *, const __CFString *))v28[2])(v28, @"namePrefix");
          ((void (*)(void *, const __CFString *))v28[2])(v28, @"familyName");
          ((void (*)(void *, const __CFString *))v28[2])(v28, @"nickname");
          ((void (*)(void *, const __CFString *))v28[2])(v28, @"givenName");
          ((void (*)(void *, const __CFString *))v28[2])(v28, @"middleName");
          ((void (*)(void *, const __CFString *))v28[2])(v28, @"nameSuffix");
          v40 = [v8 query];
          uint64_t v41 = [v40 matchesInStringTerms:v27 displayString:v29];
          v42 = v10->_stringMatch;
          v10->_stringMatch = (AutocompleteQueryStringMatch *)v41;

          v43 = v10->_stringMatch;
          v10->_isNameMatch = v43 != 0;
          v38 = v48;
          if (!v43 && v10->_isCJK)
          {
            v44 = [v27 componentsJoinedByString:&stru_101324E70];
            v45 = [v8 query];
            uint64_t v46 = [v45 matchesInString:v44];
            v47 = v10->_stringMatch;
            v10->_stringMatch = (AutocompleteQueryStringMatch *)v46;

            v10->_isNameMatch = v10->_stringMatch != 0;
          }
          goto LABEL_8;
        }
        v10->_isNameMatch = 1;
      }
      else
      {
        v33 = [v7 organizationName];
        v34 = ((void (*)(void *, void *))v14[2])(v14, v33);

        v35 = [v8 query];
        uint64_t v36 = [v35 matchesInStringTerms:v34 displayString:v29];
        v37 = v10->_stringMatch;
        v10->_stringMatch = (AutocompleteQueryStringMatch *)v36;

        v10->_isOrganizationMatch = v10->_stringMatch != 0;
      }
      v38 = v48;
LABEL_8:
    }
  }

  return v10;
}

- (double)fractionOfMatch
{
  [(AutocompleteQueryStringMatch *)self->_stringMatch fractionOfMatch];
  return result;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  [(SearchAddressBookOperationMatch *)self peopleSuggesterRank];
  double v6 = v5;
  [v4 peopleSuggesterRank];
  if (v6 == v7)
  {
    [(SearchAddressBookOperationMatch *)self fractionOfMatch];
    v11 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v4 fractionOfMatch];
    v12 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    int64_t v10 = (int64_t)[v12 compare:v11];
  }
  else
  {
    uint64_t v8 = -1;
    if (v6 >= v7) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = -1;
    }
    if (v7 != 0.0) {
      uint64_t v8 = v9;
    }
    if (v6 == 0.0) {
      int64_t v10 = 1;
    }
    else {
      int64_t v10 = v8;
    }
  }

  return v10;
}

- (BOOL)isGoodMatch
{
  return self->_hasAddress && self->_stringMatch != 0;
}

- (BOOL)isNameMatch
{
  return self->_isNameMatch;
}

- (BOOL)isOrganizationMatch
{
  return self->_isOrganizationMatch;
}

- (AutocompleteMatchInfo)autocompleteMatchInfo
{
  if ([(SearchAddressBookOperationMatch *)self isGoodMatch])
  {
    if (self->_isNameMatch) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = 2 * self->_isOrganizationMatch;
    }
    id v4 = +[AutocompleteMatchInfo matchInfoWithType:v3];
    [(SearchAddressBookOperationMatch *)self peopleSuggesterRank];
    [v4 setPeopleSuggesterRank:];
    [(SearchAddressBookOperationMatch *)self fractionOfMatch];
    [v4 setFractionOfMatch:];
    double v5 = [(AutocompleteQueryStringMatch *)self->_stringMatch prefixLastTokenMatchCover];
    [v4 setPrefixLastTokenMatchCover:v5];

    double v6 = [(AutocompleteQueryStringMatch *)self->_stringMatch prefixMatchCover];
    [v4 setPrefixMatchCover:v6];

    double v7 = [(AutocompleteQueryStringMatch *)self->_stringMatch prefixMatchPosition];
    [v4 setPrefixMatchPosition:v7];

    [v4 setPrefixMatchesWordBoundary:[self->_stringMatch prefixMatchesWordBoundary]];
    uint64_t v8 = [(AutocompleteQueryStringMatch *)self->_stringMatch firstPrefixToken];
    [v4 setFirstPrefixToken:v8];

    uint64_t v9 = [(AutocompleteQueryStringMatch *)self->_stringMatch secondPrefixToken];
    [v4 setSecondPrefixToken:v9];
  }
  else
  {
    id v4 = 0;
  }

  return (AutocompleteMatchInfo *)v4;
}

- (CNContact)contact
{
  return self->_contact;
}

- (double)peopleSuggesterRank
{
  return self->_peopleSuggesterRank;
}

- (void)setPeopleSuggesterRank:(double)a3
{
  self->_peopleSuggesterRank = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);

  objc_storeStrong((id *)&self->_stringMatch, 0);
}

@end