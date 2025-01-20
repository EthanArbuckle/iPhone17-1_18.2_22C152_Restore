@interface PGRecurrentTripMemoryTitleGenerator
- (NSSet)locationNodes;
- (PGRecurrentTripMemoryTitleGenerator)initWithLocationNodes:(id)a3 titleGenerationContext:(id)a4;
- (id)_locationTitle;
- (id)_timeTitle;
- (void)_generateTitleAndSubtitleWithResult:(id)a3;
- (void)setLocationNodes:(id)a3;
@end

@implementation PGRecurrentTripMemoryTitleGenerator

- (void).cxx_destruct
{
}

- (void)setLocationNodes:(id)a3
{
}

- (NSSet)locationNodes
{
  return self->_locationNodes;
}

- (id)_timeTitle
{
  v2 = objc_alloc_init(PGTimeTitleOptions);
  [(PGTimeTitleOptions *)v2 setAllowedFormats:16];
  v3 = +[PGTimeTitleUtility timeTitleWithOptions:v2];
  v4 = +[PGTitle titleWithString:v3 category:5];

  return v4;
}

- (id)_locationTitle
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [(NSSet *)self->_locationNodes count];
  v4 = [MEMORY[0x1E4F1CA80] setWithCapacity:v3];
  v5 = [(NSSet *)self->_locationNodes anyObject];
  v6 = [v5 label];

  if ([v6 isEqualToString:@"State"]) {
    unsigned __int8 v42 = 0;
  }
  else {
    unsigned __int8 v42 = [v6 isEqualToString:@"Country"] ^ 1;
  }
  v43 = v6;
  v7 = [(PGTitleGenerator *)self titleGenerationContext];
  v8 = [v7 locationHelper];

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  v9 = self->_locationNodes;
  uint64_t v10 = [(NSSet *)v9 countByEnumeratingWithState:&v45 objects:v51 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v46;
    char v13 = 1;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v46 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void *)(*((void *)&v45 + 1) + 8 * i);
        char v16 = [v8 locationIsInSupersetCategoryForLocationNode:v15];
        v17 = +[PGLocationTitleUtility beautifiedLocationNodeStringWithPlaceNode:v15 locationHelper:v8];
        if ([v17 length]) {
          [v4 addObject:v17];
        }
        v13 &= v16;
      }
      uint64_t v11 = [(NSSet *)v9 countByEnumeratingWithState:&v45 objects:v51 count:16];
    }
    while (v11);
    unsigned __int8 v18 = v13 ^ 1;
  }
  else
  {
    unsigned __int8 v18 = 0;
  }

  v19 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:0 ascending:1 selector:sel_localizedCompare_];
  v50 = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
  v21 = [v4 sortedArrayUsingDescriptors:v20];

  uint64_t v22 = [v21 count];
  id v23 = v21;
  v24 = v23;
  if (v22 == 2)
  {
    v30 = [v23 firstObject];
    v31 = [v24 lastObject];
    v32 = NSString;
    v33 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v34 = [v33 localizedStringForKey:@"PGRecurrentTripMemoryTitleFormatWithLocation %@ otherLocation %@" value:@"PGRecurrentTripMemoryTitleFormatWithLocation %@ otherLocation %@" table:@"Localizable"];
    v35 = objc_msgSend(v32, "localizedStringWithFormat:", v34, v30, v31);

LABEL_27:
    v29 = v24;
LABEL_28:

    if (v35)
    {
      v27 = +[PGCommonTitleUtility titleWithLineBreakForTitle:v35 andUsedNames:v29];

      v28 = +[PGTitle titleWithString:v27 category:4];
    }
    else
    {
      v27 = 0;
      v28 = 0;
    }
    goto LABEL_31;
  }
  if (v22 == 1)
  {
    v30 = [v23 firstObject];
    v36 = NSString;
    v37 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v31 = v37;
    if ((v18 | v42)) {
      v38 = @"PGRecurrentTripMemoryTitleFormatWithLocation %@";
    }
    else {
      v38 = @"PGRecurrentTripMemoryTitleFormatInSupersetWithLocation %@";
    }
    v33 = [v37 localizedStringForKey:v38 value:v38 table:@"Localizable"];
    v35 = objc_msgSend(v36, "localizedStringWithFormat:", v33, v30);
    goto LABEL_27;
  }
  if (v22)
  {
    v30 = [v23 firstObject];
    v31 = [v24 lastObject];
    v49[0] = v30;
    v49[1] = v31;
    v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];

    v39 = NSString;
    v33 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v40 = [v33 localizedStringForKey:@"PGRecurrentTripMemoryTitleFormatWithFromLocation %@ toLocation %@" value:@"PGRecurrentTripMemoryTitleFormatWithFromLocation %@ toLocation %@" table:@"Localizable"];
    v35 = objc_msgSend(v39, "localizedStringWithFormat:", v40, v30, v31);

    goto LABEL_28;
  }
  v25 = +[PGLogging sharedLogging];
  v26 = [v25 loggingConnection];

  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1805000, v26, OS_LOG_TYPE_ERROR, "RecurrentTripTitle requires at least one location node", buf, 2u);
  }

  v27 = 0;
  v28 = 0;
  v29 = v24;
LABEL_31:

  return v28;
}

- (void)_generateTitleAndSubtitleWithResult:(id)a3
{
  v6 = (void (**)(id, void *, void *))a3;
  v4 = [(PGRecurrentTripMemoryTitleGenerator *)self _locationTitle];
  v5 = [(PGRecurrentTripMemoryTitleGenerator *)self _timeTitle];
  if (v6) {
    v6[2](v6, v4, v5);
  }
}

- (PGRecurrentTripMemoryTitleGenerator)initWithLocationNodes:(id)a3 titleGenerationContext:(id)a4
{
  id v7 = a3;
  v8 = (void *)MEMORY[0x1E4F1CAD0];
  id v9 = a4;
  uint64_t v10 = [v8 set];
  v13.receiver = self;
  v13.super_class = (Class)PGRecurrentTripMemoryTitleGenerator;
  uint64_t v11 = [(PGTitleGenerator *)&v13 initWithMomentNodes:v10 type:0 titleGenerationContext:v9];

  if (v11) {
    objc_storeStrong((id *)&v11->_locationNodes, a3);
  }

  return v11;
}

@end