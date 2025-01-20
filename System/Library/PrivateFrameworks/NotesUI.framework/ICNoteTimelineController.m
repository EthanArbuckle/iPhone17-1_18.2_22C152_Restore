@interface ICNoteTimelineController
+ (id)adjustedDateForReferenceDate:(id)a3;
+ (id)invitationsTimelineSectionIdentifierWithTitle:(id)a3 referenceDate:(id)a4;
+ (id)pinnedTimelineSectionIdentifierWithTitle:(id)a3 referenceDate:(id)a4;
+ (id)sanitizedDatesForDates:(id)a3 referenceDate:(id)a4;
+ (id)timelineSectionIdentifierForNoteObjectID:(id)a3 date:(id)a4 referenceDate:(id)a5;
+ (id)timelineSectionIdentifierForNoteObjectID:(id)a3 date:(id)a4 sectionIdentifiersToManagedObjectIDs:(id)a5;
+ (id)timelineSectionsForNoteObjectIDs:(id)a3 dates:(id)a4 referenceDate:(id)a5 direction:(int64_t)a6;
+ (void)setTimeZone:(id)a3;
@end

@implementation ICNoteTimelineController

id __65__ICNoteTimelineController_sanitizedDatesForDates_referenceDate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  v4 = ICDynamicCast();

  v5 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v4)
  {
    objc_storeStrong(v5, v4);
    id v6 = v4;
  }
  else
  {
    id v6 = *v5;
    if (!*v5)
    {
      objc_storeStrong(v5, *(id *)(a1 + 32));
      id v6 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
  }
  id v7 = v6;

  return v7;
}

BOOL __65__ICNoteTimelineController_sanitizedDatesForDates_referenceDate___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = ICDynamicCast();

  return v3 != 0;
}

+ (id)timelineSectionsForNoteObjectIDs:(id)a3 dates:(id)a4 referenceDate:(id)a5 direction:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10 && v11 && (uint64_t v13 = [v10 count], v13 == objc_msgSend(v11, "count")))
  {
    v14 = [a1 adjustedDateForReferenceDate:v12];
    v15 = [a1 sanitizedDatesForDates:v11 referenceDate:v14];
    if (a6 == 1)
    {
      v16 = [v10 reverseObjectEnumerator];
      id v17 = [v16 allObjects];

      v18 = [v15 reverseObjectEnumerator];
      id v19 = [v18 allObjects];
    }
    else
    {
      id v17 = v10;
      id v19 = v15;
    }
    v22 = +[ICNoteTimelineControllerInternal ascendingTimelineSectionsForNoteObjectIds:v17 dates:v19 referenceDate:v14 direction:a6];
    v23 = v22;
    if (a6 == 1)
    {
      v24 = [v22 reverseObjectEnumerator];
      uint64_t v25 = [v24 allObjects];

      v23 = (void *)v25;
    }
    v26 = (void *)MEMORY[0x1E4F1CBF0];
    if (v23) {
      v26 = v23;
    }
    id v21 = v26;
  }
  else
  {
    v20 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      +[ICNoteTimelineController timelineSectionsForNoteObjectIDs:dates:referenceDate:direction:](v20);
    }

    id v21 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v21;
}

+ (id)sanitizedDatesForDates:(id)a3 referenceDate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x3032000000;
    v12[3] = __Block_byref_object_copy__5;
    v12[4] = __Block_byref_object_dispose__5;
    objc_msgSend(v5, "ic_objectPassingTest:", &__block_literal_global_7);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __65__ICNoteTimelineController_sanitizedDatesForDates_referenceDate___block_invoke_2;
    v9[3] = &unk_1E5FD98B8;
    id v11 = v12;
    id v10 = v6;
    id v7 = objc_msgSend(v5, "ic_map:", v9);

    _Block_object_dispose(v12, 8);
  }
  else
  {
    id v7 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v7;
}

+ (id)adjustedDateForReferenceDate:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1C9C8] now];
  }
  objc_opt_class();
  id v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v6 = [v5 objectForKey:@"dateForTimelineGroups"];
  id v7 = ICDynamicCast();

  if (v7)
  {
    id v8 = v7;

    v4 = v8;
  }

  return v4;
}

+ (id)timelineSectionIdentifierForNoteObjectID:(id)a3 date:(id)a4 sectionIdentifiersToManagedObjectIDs:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [MEMORY[0x1E4F1C9C8] now];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v12 = [v10 allKeys];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    id v25 = a1;
    uint64_t v15 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v18 = [v17 referenceDate];

          id v11 = (void *)v18;
          goto LABEL_11;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v32 count:16];
      if (v14) {
        continue;
      }
      break;
    }
LABEL_11:
    a1 = v25;
  }

  id v31 = v8;
  id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
  id v30 = v9;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
  id v21 = [a1 timelineSectionsForNoteObjectIDs:v19 dates:v20 referenceDate:v11 direction:0];
  v22 = [v21 firstObject];
  v23 = [v22 identifier];

  return v23;
}

+ (id)timelineSectionIdentifierForNoteObjectID:(id)a3 date:(id)a4 referenceDate:(id)a5
{
  v19[1] = *MEMORY[0x1E4F143B8];
  v19[0] = a3;
  id v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 arrayWithObjects:v19 count:1];
  id v18 = v10;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];

  uint64_t v14 = [a1 timelineSectionsForNoteObjectIDs:v12 dates:v13 referenceDate:v9 direction:0];

  uint64_t v15 = [v14 firstObject];
  v16 = [v15 identifier];

  return v16;
}

+ (id)invitationsTimelineSectionIdentifierWithTitle:(id)a3 referenceDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [ICNoteTimelineSectionIdentifier alloc];
  id v9 = [a1 adjustedDateForReferenceDate:v6];

  id v10 = [(ICNoteTimelineSectionIdentifier *)v8 initWithTimelineSectionType:0 referenceDate:v9 title:v7 sortOrder:0];
  return v10;
}

+ (id)pinnedTimelineSectionIdentifierWithTitle:(id)a3 referenceDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [ICNoteTimelineSectionIdentifier alloc];
  id v9 = [a1 adjustedDateForReferenceDate:v6];

  id v10 = [(ICNoteTimelineSectionIdentifier *)v8 initWithTimelineSectionType:1 referenceDate:v9 title:v7 sortOrder:0];
  return v10;
}

+ (void)setTimeZone:(id)a3
{
}

+ (void)timelineSectionsForNoteObjectIDs:(os_log_t)log dates:referenceDate:direction:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B08EB000, log, OS_LOG_TYPE_ERROR, "timelineSectionsForNoteObjectIDs:dates:referenceDate:direction: sizes of arrays don't match", v1, 2u);
}

@end