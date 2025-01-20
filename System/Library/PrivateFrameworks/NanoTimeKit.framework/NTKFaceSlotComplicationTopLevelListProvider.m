@interface NTKFaceSlotComplicationTopLevelListProvider
- (BOOL)pickerListProviderSlotIsRich;
- (NSArray)complications;
- (NSDictionary)complicationsBySectionIdentifier;
- (NSDiffableDataSourceSnapshot)pickerListDataSourceSnapshot;
- (NTKComplication)selectedItemIgnoringMoreButton;
- (NTKComplicationItem)pickerSelectedItem;
- (NTKFaceSlotComplicationTopLevelListProvider)initWithRichSlot:(BOOL)a3 complicationFamily:(int64_t)a4 complications:(id)a5 selectedComplication:(id)a6;
- (id)detailListProviderForSectionIdentifier:(id)a3;
- (int64_t)pickerComplicationFamily;
- (void)_buildDataIfNeeded;
- (void)setComplications:(id)a3;
- (void)setComplicationsBySectionIdentifier:(id)a3;
- (void)setPickerListDataSourceSnapshot:(id)a3;
- (void)setPickerSelectedItem:(id)a3;
- (void)setSelectedItemIgnoringMoreButton:(id)a3;
@end

@implementation NTKFaceSlotComplicationTopLevelListProvider

- (NTKFaceSlotComplicationTopLevelListProvider)initWithRichSlot:(BOOL)a3 complicationFamily:(int64_t)a4 complications:(id)a5 selectedComplication:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v16.receiver = self;
  v16.super_class = (Class)NTKFaceSlotComplicationTopLevelListProvider;
  v12 = [(NTKFaceSlotComplicationTopLevelListProvider *)&v16 init];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    complications = v12->_complications;
    v12->_complications = (NSArray *)v13;

    objc_storeStrong((id *)&v12->_selectedItemIgnoringMoreButton, a6);
    v12->_pickerListProviderSlotIsRich = a3;
    v12->_pickerComplicationFamily = a4;
  }

  return v12;
}

- (id)detailListProviderForSectionIdentifier:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    [(NTKFaceSlotComplicationTopLevelListProvider *)self _buildDataIfNeeded];
    v5 = [(NTKFaceSlotComplicationTopLevelListProvider *)self complicationsBySectionIdentifier];
    v6 = [v5 objectForKey:v4];

    v7 = [[NTKFaceSlotComplicationDetailListProvider alloc] initWithRichSlot:[(NTKFaceSlotComplicationTopLevelListProvider *)self pickerListProviderSlotIsRich] complicationFamily:self->_pickerComplicationFamily complications:v6 selectedComplication:0];
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (NSDiffableDataSourceSnapshot)pickerListDataSourceSnapshot
{
  [(NTKFaceSlotComplicationTopLevelListProvider *)self _buildDataIfNeeded];
  pickerListDataSourceSnapshot = self->_pickerListDataSourceSnapshot;
  return pickerListDataSourceSnapshot;
}

- (void)_buildDataIfNeeded
{
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  if (!self->_pickerListDataSourceSnapshot)
  {
    v2 = self;
    id v70 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v73 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v93 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    obuint64_t j = [(NTKFaceSlotComplicationTopLevelListProvider *)v2 complications];
    uint64_t v3 = [obj countByEnumeratingWithState:&v93 objects:v105 count:16];
    v68 = v2;
    if (v3)
    {
      uint64_t v4 = v3;
      v69 = 0;
      uint64_t v5 = *(void *)v94;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v94 != v5) {
            objc_enumerationMutation(obj);
          }
          v7 = *(void **)(*((void *)&v93 + 1) + 8 * i);
          objc_msgSend(v7, "ntk_sectionIdentifier");
          v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (v8)
          {
            v9 = v8;
            if ([(__CFString *)v8 isEqualToString:@"com.apple.DateComplicationsHost"])
            {

              v9 = @"com.apple.NanoCalendar";
            }
            id v10 = [v70 objectForKeyedSubscript:v9];
            if (!v10)
            {
              id v10 = [MEMORY[0x1E4F1CA48] array];
              [v70 setObject:v10 forKeyedSubscript:v9];
              id v11 = [v7 localizedSectionHeaderName];
              if (!v11) {
                id v11 = v9;
              }
              v12 = [[NTKTopLevelSectionInfo alloc] initWithIdentifier:v9 localizedSectionName:v11];
              [v73 addObject:v12];
            }
            uint64_t v13 = [(NTKFaceSlotComplicationTopLevelListProvider *)v2 selectedItemIgnoringMoreButton];
            v14 = objc_msgSend(v13, "ntk_identifier");
            v15 = objc_msgSend(v7, "ntk_identifier");
            int v16 = [v14 isEqual:v15];

            if (v16)
            {
              v17 = v9;

              v69 = v17;
            }
            v2 = v68;
            if ([v7 complicationType] == 31 || objc_msgSend(v7, "complicationType") == 37)
            {
              [v10 addObject:v7];
            }
            else
            {
              if ([(__CFString *)v9 isEqualToString:@"com.apple.NanoWorldClock"])
              {
                uint64_t v18 = [v10 count];
                v19 = v10;
                v20 = v7;
                v21 = &__block_literal_global_84;
              }
              else if ([(__CFString *)v9 isEqualToString:@"com.apple.private.NanoTimer"])
              {
                uint64_t v18 = [v10 count];
                v19 = v10;
                v20 = v7;
                v21 = &__block_literal_global_13;
              }
              else
              {
                if ([(__CFString *)v9 isEqualToString:@"com.apple.NanoCompass.watchkitapp.waypoints"])
                {
                  uint64_t v18 = [v10 count];
                  v92[0] = MEMORY[0x1E4F143A8];
                  v92[1] = 3221225472;
                  v92[2] = __65__NTKFaceSlotComplicationTopLevelListProvider__buildDataIfNeeded__block_invoke_3;
                  v92[3] = &unk_1E62C4B68;
                  v92[4] = v68;
                  v92[5] = 1;
                  v21 = v92;
                }
                else
                {
                  BOOL v22 = [(NTKFaceSlotComplicationTopLevelListProvider *)v68 pickerListProviderSlotIsRich];
                  uint64_t v18 = [v10 count];
                  v90[0] = MEMORY[0x1E4F143A8];
                  v90[1] = 3221225472;
                  v90[2] = __65__NTKFaceSlotComplicationTopLevelListProvider__buildDataIfNeeded__block_invoke_4;
                  v90[3] = &__block_descriptor_41_e45_q24__0__NTKComplication_8__NTKComplication_16l;
                  v90[4] = 1;
                  BOOL v91 = v22;
                  v21 = v90;
                }
                v19 = v10;
                v20 = v7;
              }
              objc_msgSend(v10, "insertObject:atIndex:", v7, objc_msgSend(v19, "indexOfObject:inSortedRange:options:usingComparator:", v20, 0, v18, 1024, v21));
            }
          }
        }
        uint64_t v4 = [obj countByEnumeratingWithState:&v93 objects:v105 count:16];
      }
      while (v4);
    }
    else
    {
      v69 = 0;
    }

    [v73 sortUsingComparator:&__block_literal_global_18];
    v23 = [MEMORY[0x1E4F1CA80] set];
    id v66 = objc_alloc_init(MEMORY[0x1E4FB1360]);
    [v66 appendSectionsWithIdentifiers:v73];
    long long v88 = 0u;
    long long v89 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    id v64 = v73;
    uint64_t v67 = [v64 countByEnumeratingWithState:&v86 objects:v104 count:16];
    if (v67)
    {
      uint64_t v65 = *(void *)v87;
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v87 != v65) {
            objc_enumerationMutation(v64);
          }
          v71 = *(void **)(*((void *)&v86 + 1) + 8 * v24);
          v25 = objc_msgSend(v71, "ntk_identifier");
          v26 = [v70 objectForKey:v25];
          v74 = v25;
          if ([v25 isEqualToString:@"com.apple.nanotimekit.contacts"])
          {
            BOOL v27 = +[NTKPeopleComplication _complicationPickerShouldShowMoreButtonForList:v26];
            if ((unint64_t)[v26 count] <= 4)
            {
              unint64_t v28 = [v26 count];
              if (!v27) {
                goto LABEL_45;
              }
              goto LABEL_52;
            }
LABEL_50:
            if (!v27)
            {
LABEL_47:
              int v31 = 0;
              unint64_t v28 = 3;
              goto LABEL_53;
            }
            goto LABEL_51;
          }
          int v29 = [v25 isEqualToString:@"com.apple.NanoHome"];
          unint64_t v30 = [v26 count];
          if (!v29)
          {
            if (v30 <= 4) {
              goto LABEL_47;
            }
LABEL_51:
            unint64_t v28 = 3;
LABEL_52:
            uint64_t v33 = objc_msgSend(v26, "subarrayWithRange:", 0, v28);

            int v31 = 1;
            v26 = (void *)v33;
            goto LABEL_53;
          }
          if (v30 <= 4)
          {
            unint64_t v28 = [v26 count];
LABEL_45:
            int v31 = 0;
            goto LABEL_53;
          }
          v32 = +[NTKHomeListPickerDataSource topLevelItemsForComplicationFamily:[(NTKFaceSlotComplicationTopLevelListProvider *)v2 pickerComplicationFamily] sectionIdentifier:v25];

          BOOL v27 = +[NTKHomeListPickerDataSource shouldShowTopLevelMoreButton];
          if ((unint64_t)[v32 count] > 4)
          {
            v26 = v32;
            v25 = v74;
            goto LABEL_50;
          }
          unint64_t v28 = [v32 count];
          if (v27)
          {
            v26 = v32;
            v25 = v74;
            goto LABEL_52;
          }
          int v31 = 0;
          v26 = v32;
          v25 = v74;
LABEL_53:
          if ([(__CFString *)v69 isEqual:v25])
          {
            v34 = [(NTKFaceSlotComplicationTopLevelListProvider *)v2 selectedItemIgnoringMoreButton];
            v35 = v34;
            char v36 = v31 ^ 1;
            if (!v34) {
              char v36 = 1;
            }
            if ((v36 & 1) == 0)
            {
              v84[0] = MEMORY[0x1E4F143A8];
              v84[1] = 3221225472;
              v84[2] = __65__NTKFaceSlotComplicationTopLevelListProvider__buildDataIfNeeded__block_invoke_6;
              v84[3] = &unk_1E62C4BD0;
              id v37 = v34;
              id v85 = v37;
              unint64_t v38 = [v26 indexOfObjectPassingTest:v84];
              if (v38 != 0x7FFFFFFFFFFFFFFFLL && v38 >= v28)
              {
                v39 = objc_msgSend(v26, "subarrayWithRange:", 0, v28 - 1);
                id v103 = v37;
                v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v103 count:1];
                uint64_t v41 = [v40 arrayByAddingObjectsFromArray:v39];

                v26 = (void *)v41;
              }
              v25 = v74;
            }
            [(NTKFaceSlotComplicationTopLevelListProvider *)v2 setPickerSelectedItem:v35];
          }
          uint64_t v72 = v24;
          if (v31)
          {
            v42 = [[NTKMoreButtonListItem alloc] initWithSectionIdentifier:v25];
            uint64_t v43 = [v26 arrayByAddingObject:v42];

            v26 = (void *)v43;
          }
          v44 = [MEMORY[0x1E4F1CA70] orderedSetWithArray:v26];
          uint64_t v45 = [v44 count];
          if (v45 != [v26 count])
          {
            v46 = [MEMORY[0x1E4F1CA48] array];
            long long v80 = 0u;
            long long v81 = 0u;
            long long v82 = 0u;
            long long v83 = 0u;
            id v47 = v26;
            uint64_t v48 = [v47 countByEnumeratingWithState:&v80 objects:v102 count:16];
            if (v48)
            {
              uint64_t v49 = v48;
              uint64_t v50 = *(void *)v81;
              do
              {
                for (uint64_t j = 0; j != v49; ++j)
                {
                  if (*(void *)v81 != v50) {
                    objc_enumerationMutation(v47);
                  }
                  v52 = objc_msgSend(*(id *)(*((void *)&v80 + 1) + 8 * j), "ntk_identifier");
                  [v46 addObject:v52];
                }
                uint64_t v49 = [v47 countByEnumeratingWithState:&v80 objects:v102 count:16];
              }
              while (v49);
            }

            v53 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
            if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              v99 = v46;
              __int16 v100 = 2112;
              id v101 = v47;
              _os_log_fault_impl(&dword_1BC5A9000, v53, OS_LOG_TYPE_FAULT, "NTKListProviderError: Items %@ has a duplicate (%@)", buf, 0x16u);
            }
          }
          long long v78 = 0u;
          long long v79 = 0u;
          long long v76 = 0u;
          long long v77 = 0u;
          id v54 = v26;
          uint64_t v55 = [v54 countByEnumeratingWithState:&v76 objects:v97 count:16];
          if (v55)
          {
            uint64_t v56 = v55;
            uint64_t v57 = *(void *)v77;
            do
            {
              for (uint64_t k = 0; k != v56; ++k)
              {
                if (*(void *)v77 != v57) {
                  objc_enumerationMutation(v54);
                }
                v59 = *(void **)(*((void *)&v76 + 1) + 8 * k);
                if ([v23 containsObject:v59])
                {
                  [v44 removeObject:v59];
                  v60 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
                  if (os_log_type_enabled(v60, OS_LOG_TYPE_FAULT))
                  {
                    v61 = objc_msgSend(v59, "ntk_identifier");
                    *(_DWORD *)buf = 138412546;
                    v99 = v61;
                    __int16 v100 = 2112;
                    id v101 = v59;
                    _os_log_fault_impl(&dword_1BC5A9000, v60, OS_LOG_TYPE_FAULT, "NTKListProviderError: Item %@ (%@) already in list provider", buf, 0x16u);
                  }
                }
              }
              uint64_t v56 = [v54 countByEnumeratingWithState:&v76 objects:v97 count:16];
            }
            while (v56);
          }

          v62 = [v44 array];
          [v23 addObjectsFromArray:v62];
          [v66 appendItemsWithIdentifiers:v62 intoSectionWithIdentifier:v71];

          uint64_t v24 = v72 + 1;
          v2 = v68;
        }
        while (v72 + 1 != v67);
        uint64_t v63 = [v64 countByEnumeratingWithState:&v86 objects:v104 count:16];
        uint64_t v67 = v63;
      }
      while (v63);
    }

    [(NTKFaceSlotComplicationTopLevelListProvider *)v2 setPickerListDataSourceSnapshot:v66];
    [(NTKFaceSlotComplicationTopLevelListProvider *)v2 setComplicationsBySectionIdentifier:v70];
  }
}

int64_t __65__NTKFaceSlotComplicationTopLevelListProvider__buildDataIfNeeded__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[NTKWorldClockComplication compareComplication:a2 toComplication:a3];
}

int64_t __65__NTKFaceSlotComplicationTopLevelListProvider__buildDataIfNeeded__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[NTKTimerComplication compareComplication:a2 toComplication:a3];
}

uint64_t __65__NTKFaceSlotComplicationTopLevelListProvider__buildDataIfNeeded__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_8;
  }
  id v7 = v6;
  v8 = [v5 complication];
  v9 = [v8 bundleIdentifier];
  int v10 = [v9 isEqualToString:@"com.apple.NanoCompass.complications.waypoint"];

  id v11 = [v7 complication];
  v12 = [v11 bundleIdentifier];
  char v13 = [v12 isEqualToString:@"com.apple.NanoCompass.complications.waypoint"];

  uint64_t v14 = v10 ? -1 : 1;
  if ((v10 & 1) == 0 && (v13 & 1) == 0)
  {
LABEL_8:
    uint64_t v15 = [*(id *)(a1 + 32) pickerListProviderSlotIsRich];
    int v16 = objc_msgSend(v5, "ntk_localizedNameWithOptions:forRichComplicationSlot:", *(void *)(a1 + 40), v15);
    v17 = objc_msgSend(v6, "ntk_localizedNameWithOptions:forRichComplicationSlot:", *(void *)(a1 + 40), v15);
    uint64_t v14 = [v16 localizedCaseInsensitiveCompare:v17];
  }
  return v14;
}

uint64_t __65__NTKFaceSlotComplicationTopLevelListProvider__buildDataIfNeeded__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(unsigned __int8 *)(a1 + 40);
  id v7 = a3;
  v8 = objc_msgSend(a2, "ntk_localizedNameWithOptions:forRichComplicationSlot:", v5, v6);
  v9 = objc_msgSend(v7, "ntk_localizedNameWithOptions:forRichComplicationSlot:", *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

  uint64_t v10 = [v8 localizedCaseInsensitiveCompare:v9];
  return v10;
}

uint64_t __65__NTKFaceSlotComplicationTopLevelListProvider__buildDataIfNeeded__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = objc_msgSend(v4, "ntk_identifier");
  char v7 = [v6 isEqualToString:@"com.apple.nanotimekit.off"];

  if (v7)
  {
    uint64_t v8 = -1;
  }
  else
  {
    v9 = objc_msgSend(v4, "ntk_localizedSectionName");
    uint64_t v10 = objc_msgSend(v5, "ntk_localizedSectionName");
    uint64_t v8 = [v9 localizedCaseInsensitiveCompare:v10];
  }
  return v8;
}

uint64_t __65__NTKFaceSlotComplicationTopLevelListProvider__buildDataIfNeeded__block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(a2, "ntk_identifier");
  id v4 = objc_msgSend(*(id *)(a1 + 32), "ntk_identifier");
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

- (BOOL)pickerListProviderSlotIsRich
{
  return self->_pickerListProviderSlotIsRich;
}

- (int64_t)pickerComplicationFamily
{
  return self->_pickerComplicationFamily;
}

- (NTKComplication)selectedItemIgnoringMoreButton
{
  return self->_selectedItemIgnoringMoreButton;
}

- (void)setSelectedItemIgnoringMoreButton:(id)a3
{
}

- (NSArray)complications
{
  return self->_complications;
}

- (void)setComplications:(id)a3
{
}

- (NSDictionary)complicationsBySectionIdentifier
{
  return self->_complicationsBySectionIdentifier;
}

- (void)setComplicationsBySectionIdentifier:(id)a3
{
}

- (NTKComplicationItem)pickerSelectedItem
{
  return self->_pickerSelectedItem;
}

- (void)setPickerSelectedItem:(id)a3
{
}

- (void)setPickerListDataSourceSnapshot:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pickerListDataSourceSnapshot, 0);
  objc_storeStrong((id *)&self->_pickerSelectedItem, 0);
  objc_storeStrong((id *)&self->_complicationsBySectionIdentifier, 0);
  objc_storeStrong((id *)&self->_complications, 0);
  objc_storeStrong((id *)&self->_selectedItemIgnoringMoreButton, 0);
}

@end