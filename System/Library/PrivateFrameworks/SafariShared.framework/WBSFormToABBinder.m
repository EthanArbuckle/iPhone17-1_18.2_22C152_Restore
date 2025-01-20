@interface WBSFormToABBinder
+ (__WBSFieldLabelPatternMatcherArray)addressBookFieldLabelPatternMatchers;
+ (__WBSFieldLabelPatternMatcherArray)emailFieldLabelPatternMatchers;
+ (id)allSynonymsForMatch:(id)a3 formAppearsToBeChinese:(BOOL)a4;
+ (id)specifierForAutocompleteToken:(id)a3;
+ (id)specifierForClassification:(id)a3 hints:(id)a4 orderedParts:(id)a5;
+ (id)specifierForLabel:(id)a3;
+ (unint64_t)indexOfBestMatchForString:(id)a3 inArray:(id)a4 startingPosition:(unint64_t *)a5;
@end

@implementation WBSFormToABBinder

+ (id)allSynonymsForMatch:(id)a3 formAppearsToBeChinese:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = [v5 key];

  if (v6)
  {
    if (v4)
    {
      v7 = [v5 key];
      if ([v7 isEqualToString:@"City"])
      {

LABEL_7:
        v8 = [v5 stringValue];
        v13 = [MEMORY[0x1E4F1CA48] arrayWithObject:v8];
        if (([v8 hasSuffix:@"省"] & 1) != 0
          || [v8 hasSuffix:@"市"])
        {
          v9 = [v8 substringWithRange:0, objc_msgSend(v8, "length") - objc_msgSend(@"省", "length")];
          [v13 addObject:v9];
        }
        else
        {
          v18 = [v8 stringByAppendingString:@"省"];
          [v13 addObject:v18];

          v9 = [v8 stringByAppendingString:@"市"];
          [v13 addObject:v9];
        }
        goto LABEL_15;
      }
      v11 = [v5 key];
      int v12 = [v11 isEqualToString:@"State"];

      if (v12) {
        goto LABEL_7;
      }
    }
    v14 = [v5 property];
    v15 = findEntry<SafariShared::AddressBookAutoCompleteMappingData::SynonymCollectionMap>((uint64_t)&SafariShared::AddressBookAutoCompleteMappingData::synonyms, v14);
    if (v15) {
      uint64_t v16 = v15[1];
    }
    else {
      uint64_t v16 = 0;
    }

    v8 = [v5 key];
    v9 = [v5 stringValue];
    uint64_t v10 = lookupSynonyms(v16, v8, v9);
  }
  else
  {
    v8 = [v5 property];
    v9 = [v5 stringValue];
    uint64_t v10 = lookupSynonyms(0, v8, v9);
  }
  v13 = (void *)v10;
LABEL_15:

  return v13;
}

+ (id)specifierForLabel:(id)a3
{
  v3 = lookupSpecifier((uint64_t)&SafariShared::AddressBookAutoCompleteMappingData::fieldLabelMap, a3);
  return v3;
}

+ (id)specifierForAutocompleteToken:(id)a3
{
  v3 = lookupSpecifier((uint64_t)&SafariShared::AddressBookAutoCompleteMappingData::autocompleteTokenMap, a3);
  return v3;
}

+ (unint64_t)indexOfBestMatchForString:(id)a3 inArray:(id)a4 startingPosition:(unint64_t *)a5
{
  id v7 = a3;
  id v8 = a4;
  v21 = v7;
  CFCharacterSetRef Predefined = CFCharacterSetGetPredefined(kCFCharacterSetAlphaNumeric);
  uint64_t v10 = [v7 stringByReplacingOccurrencesOfString:@"." withString:&stru_1EFBE3CF8];
  uint64_t v11 = [v8 count];
  if (v11)
  {
    unint64_t v12 = 0;
    v13 = 0;
    v22 = a5;
    unint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      v14 = objc_msgSend(v8, "safari_stringAtIndex:", v12);
      v15 = [v14 stringByReplacingOccurrencesOfString:@"." withString:&stru_1EFBE3CF8];

      uint64_t v16 = [v15 rangeOfString:v10 options:1];
      unint64_t v17 = v16;
      if (v16
        && (v16 == 0x7FFFFFFFFFFFFFFFLL
         || CFCharacterSetIsCharacterMember(Predefined, [v15 characterAtIndex:v16 - 1]))
        || (unint64_t v18 = [v15 length], objc_msgSend(v10, "length") + v17 < v18)
        && CFCharacterSetIsCharacterMember(Predefined, objc_msgSend(v15, "characterAtIndex:"))
        || v13 && v18 >= [v13 length])
      {
        id v19 = v13;
      }
      else
      {
        id v19 = v15;

        if (v22) {
          unint64_t *v22 = v17;
        }
        unint64_t v23 = v12;
      }

      ++v12;
      v13 = v19;
    }
    while (v11 != v12);
  }
  else
  {
    id v19 = 0;
    unint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v23;
}

+ (__WBSFieldLabelPatternMatcherArray)addressBookFieldLabelPatternMatchers
{
  return (__WBSFieldLabelPatternMatcherArray *)&SafariShared::AddressBookAutoCompleteMappingData::addressBookFieldLabelPatternMatchers;
}

+ (__WBSFieldLabelPatternMatcherArray)emailFieldLabelPatternMatchers
{
  return (__WBSFieldLabelPatternMatcherArray *)&SafariShared::AddressBookAutoCompleteMappingData::emailFieldLabelPatternMatchers;
}

+ (id)specifierForClassification:(id)a3 hints:(id)a4 orderedParts:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v7;
  if (v10)
  {
    uint64_t v11 = v10;
    if ([v9 count] == 1)
    {
      uint64_t v11 = v10;
      if ([v10 isEqualToString:@"name"])
      {
        uint64_t v11 = [v9 objectAtIndexedSubscript:0];
      }
    }
    unint64_t v12 = [v8 firstObject];
    if (@"FullNameComposite")
    {
      v13 = &qword_1E5C8E5A0;
      while (![(id)v13[1] isEqualToString:v11]
           || v12 && ![v12 isEqualToString:v13[2]])
      {
        uint64_t v14 = v13[3];
        v13 += 7;
        if (!v14) {
          goto LABEL_11;
        }
      }
      v15 = (void *)[objc_alloc(MEMORY[0x1E4F97E40]) initWithProperty:*(v13 - 4) component:*(v13 - 3) label:*(v13 - 2) category:*(v13 - 1) parentProperty:*v13 classification:v13[1] classificationHint:v13[2]];
    }
    else
    {
LABEL_11:
      v15 = 0;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

@end