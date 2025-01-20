@interface NMAPIRadioResponseParser
- (id)resultsWithDictionary:(id)a3 error:(id *)a4;
@end

@implementation NMAPIRadioResponseParser

- (id)resultsWithDictionary:(id)a3 error:(id *)a4
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  v8 = [v6 objectForKey:@"data"];
  v9 = NMAPIArrayWithObject(v8, @"data", a4);

  if (v9)
  {
    v10 = NMAPIDictionaryInSingleObjectArray(v9, @"radioGrouping", a4);
    v11 = v10;
    if (v10)
    {
      v12 = [v10 objectForKey:@"type"];
      v13 = NMAPIStringWithObject(v12, @"type", a4);

      if ([v13 isEqualToString:@"groupings"])
      {
        v14 = [v11 valueForKeyPath:@"relationships.tabs.data"];
        v15 = NMAPIArrayWithObject(v14, @"tabs", a4);

        if (v15 && [v15 count])
        {
          v16 = [v15 firstObject];
          v17 = NMAPIDictionaryWithObject(v16, @"tabsDictionary", a4);

          v18 = v17;
          if (v17)
          {
            id v48 = v17;
            v19 = [v17 valueForKeyPath:@"relationships.children.data"];
            v17 = NMAPIArrayWithObject(v19, @"sectionsArray", a4);

            v20 = v17;
            if (v17)
            {
              long long v56 = 0u;
              long long v57 = 0u;
              long long v54 = 0u;
              long long v55 = 0u;
              v47 = v17;
              id obj = v17;
              uint64_t v52 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
              if (v52)
              {
                v50 = v13;
                uint64_t v51 = *(void *)v55;
                v45 = v11;
                id v46 = v6;
                v53 = v7;
                v44 = v15;
                while (2)
                {
                  for (uint64_t i = 0; i != v52; ++i)
                  {
                    if (*(void *)v55 != v51) {
                      objc_enumerationMutation(obj);
                    }
                    v22 = NMAPIDictionaryWithObject(*(void **)(*((void *)&v54 + 1) + 8 * i), @"section", a4);
                    if (!v22) {
                      goto LABEL_36;
                    }
                    v23 = v22;
                    v24 = [v22 objectForKey:@"id"];
                    v25 = NMAPIStringWithObject(v24, @"sectionIdentifier", a4);

                    if (!v25)
                    {

LABEL_36:
                      v17 = 0;
                      v11 = v45;
                      id v6 = v46;
                      id v7 = v53;
                      v15 = v44;
                      goto LABEL_37;
                    }
                    v26 = [v23 valueForKeyPath:@"relationships.children.data"];
                    v27 = NMAPIOptionalArrayWithObject(v26, @"AppleRadio", a4);

                    if (v27)
                    {
                      v28 = (void *)[v23 mutableCopy];
                      [v28 removeObjectForKey:@"relationships"];
                      v29 = [NMAPISectionResult alloc];
                      v30 = (void *)[v28 copy];
                      v31 = [(NMAPISectionResult *)v29 initWithSectionIdentifier:v25 sectionDictionary:v30 itemsArray:v27];
                      [v53 addObject:v31];
                    }
                    v32 = objc_msgSend(v23, "valueForKeyPath:", @"relationships.contents.data", v44, v45, v46);
                    v33 = NMAPIOptionalArrayWithObject(v32, @"FeaturedStations", a4);

                    if (v33)
                    {
                      v34 = (void *)[v23 mutableCopy];
                      [v34 removeObjectForKey:@"relationships"];
                      v35 = [NMAPISectionResult alloc];
                      v36 = (void *)[v34 copy];
                      v37 = [(NMAPISectionResult *)v35 initWithSectionIdentifier:v25 sectionDictionary:v36 itemsArray:v33];
                      [v53 addObject:v37];
                    }
                    v38 = [v23 valueForKeyPath:@"attributes.links"];
                    v39 = NMAPIOptionalArrayWithObject(v38, @"GenreLinks", a4);

                    if (v39)
                    {
                      v40 = [[NMAPISectionResult alloc] initWithSectionIdentifier:v25 sectionDictionary:v23 itemsArray:v39];
                      [v53 addObject:v40];
                    }
                    v13 = v50;
                  }
                  v11 = v45;
                  id v6 = v46;
                  id v7 = v53;
                  v15 = v44;
                  uint64_t v52 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
                  if (v52) {
                    continue;
                  }
                  break;
                }
              }

              uint64_t v41 = [v7 count];
              if (a4 && !v41)
              {
                *a4 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F88F00] code:-7102 userInfo:0];
              }
              v17 = (void *)[v7 copy];
LABEL_37:
              v20 = v47;
            }

            v18 = v48;
          }
        }
        else
        {
          v17 = 0;
        }
      }
      else
      {
        v42 = NMLogForCategory(9);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v60 = self;
          __int16 v61 = 2112;
          v62 = v13;
          _os_log_impl(&dword_2269EF000, v42, OS_LOG_TYPE_DEFAULT, "[NMAPIResponseParser] Invalid response for request (%@) due to unexpected type: %@", buf, 0x16u);
        }

        if (a4)
        {
          [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F88F00] code:-7102 userInfo:0];
          v17 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v17 = 0;
        }
      }
    }
    else
    {
      v17 = 0;
    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

@end