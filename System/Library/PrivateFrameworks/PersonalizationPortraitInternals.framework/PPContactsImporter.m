@interface PPContactsImporter
+ (id)defaultInstance;
+ (uint64_t)_shouldImport;
- (PPContactsImporter)initWithDatabase:(id)a3;
- (id)_entitiesForScoredContact:(void *)a1;
- (id)_scoredContactWithContactIdentifier:(uint64_t)a1;
- (id)_sourceForContactWithContactIdentifier:(void *)a1;
- (uint64_t)_donateScoredNamedEntities:(void *)a3 source:(void *)a4 error:;
- (uint64_t)importScoredContact:(void *)a3 contactsIdentifier:(void *)a4 error:;
- (void)_deleteAndReAddWholeContact:(void *)a3 contactIdentifier:;
- (void)_flushNamedEntities;
- (void)_handleNotificationWithError:(uint64_t)a1;
- (void)importContactsDataWithShouldContinueBlock:(id)a3;
- (void)visitAddContactEvent:(id)a3;
- (void)visitDeleteContactEvent:(id)a3;
- (void)visitDropEverythingEvent:(id)a3;
- (void)visitUpdateContactEvent:(id)a3;
@end

@implementation PPContactsImporter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namedEntityStore, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

- (void)visitDeleteContactEvent:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v12 = [a3 contactIdentifier];
  if (self)
  {
    v4 = pp_contacts_log_handle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v12;
      _os_log_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_DEFAULT, "PPContactsImporter: _deleteContact: %@", buf, 0xCu);
    }

    v14 = 0;
    namedEntityStore = self->_namedEntityStore;
    uint64_t v6 = *MEMORY[0x1E4F8A050];
    v19[0] = v12;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    id v13 = 0;
    BOOL v8 = [(PPLocalNamedEntityStore *)namedEntityStore deleteAllNamedEntitiesFromSourcesWithBundleId:v6 documentIds:v7 deletedCount:&v14 error:&v13];
    id v9 = v13;

    v10 = pp_contacts_log_handle();
    v11 = v10;
    if (v8)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        id v16 = v14;
        __int16 v17 = 2112;
        id v18 = v12;
        _os_log_impl(&dword_1CA9A8000, v11, OS_LOG_TYPE_DEFAULT, "PPContactsImporter: _deleteContact: deleted %tu named entities for %@", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v9;
      _os_log_error_impl(&dword_1CA9A8000, v11, OS_LOG_TYPE_ERROR, "PPContactsImporter: _deleteContact: failed to delete entities: %@", buf, 0xCu);
    }
  }
}

- (void)visitUpdateContactEvent:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v47 = [a3 contact];
  id v4 = [v47 identifier];
  if (self)
  {
    v5 = pp_contacts_log_handle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_1CA9A8000, v5, OS_LOG_TYPE_DEFAULT, "PPContactsImporter: _updateContact: %@", (uint8_t *)&buf, 0xCu);
    }

    uint64_t v6 = -[PPContactsImporter _scoredContactWithContactIdentifier:]((uint64_t)self, v4);
    v7 = [v6 contact];
    BOOL v8 = [v7 contactsContactIdentifierWithError:0];

    if ([v8 length])
    {
      v44 = v8;
      v45 = -[PPContactsImporter _entitiesForScoredContact:](v6);
      uint64_t v43 = objc_msgSend(v45, "_pas_mappedArrayWithTransform:", &__block_literal_global_45);
      v46 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v43];
      id v9 = pp_contacts_log_handle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v39 = [v46 count];
        LODWORD(buf) = 134217984;
        *(void *)((char *)&buf + 4) = v39;
        _os_log_debug_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_DEBUG, "PPContactsImporter: _updateContact: new set: %tu", (uint8_t *)&buf, 0xCu);
      }

      v10 = -[PPContactsImporter _sourceForContactWithContactIdentifier:](v4);
      v11 = objc_opt_new();
      id v12 = (void *)MEMORY[0x1CB79D060]();
      id v13 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      v14 = [v10 bundleId];
      v15 = objc_msgSend(v13, "initWithObjects:", v14, 0);

      [v11 setMatchingSourceBundleIds:v15];

      id v16 = (void *)MEMORY[0x1CB79D060]();
      id v17 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      id v18 = [v10 documentId];
      v19 = objc_msgSend(v17, "initWithObjects:", v18, 0);

      [v11 setMatchingSourceDocumentIds:v19];

      v20 = (void *)MEMORY[0x1CB79D060]();
      id v21 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      v22 = [v10 groupId];
      v23 = objc_msgSend(v21, "initWithObjects:", v22, 0);

      [v11 setMatchingSourceGroupIds:v23];

      v24 = objc_opt_new();
      namedEntityStore = self->_namedEntityStore;
      id v49 = 0;
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v55 = __51__PPContactsImporter__updateContactWithIdentifier___block_invoke_47;
      v56 = &unk_1E65DBE80;
      id v26 = v24;
      id v57 = v26;
      LOBYTE(namedEntityStore) = [(PPLocalNamedEntityStore *)namedEntityStore iterNamedEntityRecordsWithQuery:v11 error:&v49 block:&buf];
      v27 = v49;
      v28 = pp_contacts_log_handle();
      v29 = v28;
      if (namedEntityStore)
      {
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v40 = [v26 count];
          LODWORD(v50) = 134217984;
          *(void *)((char *)&v50 + 4) = v40;
          _os_log_debug_impl(&dword_1CA9A8000, v29, OS_LOG_TYPE_DEBUG, "PPContactsImporter: _updateContact: existing set: %tu", (uint8_t *)&v50, 0xCu);
        }

        v30 = (void *)[v26 mutableCopy];
        [v30 minusSet:v46];
        v31 = pp_contacts_log_handle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v41 = [v30 count];
          LODWORD(v50) = 134217984;
          *(void *)((char *)&v50 + 4) = v41;
          _os_log_debug_impl(&dword_1CA9A8000, v31, OS_LOG_TYPE_DEBUG, "PPContactsImporter: _updateContact: to delete: %tu", (uint8_t *)&v50, 0xCu);
        }

        if ([v30 count])
        {
          v32 = pp_contacts_log_handle();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v50) = 0;
            _os_log_impl(&dword_1CA9A8000, v32, OS_LOG_TYPE_DEFAULT, "PPContactsImporter: _updateContact: detected deletions, reimporting whole contact.", (uint8_t *)&v50, 2u);
          }

          -[PPContactsImporter _deleteAndReAddWholeContact:contactIdentifier:]((uint64_t)self, v6, v4);
          v33 = (void *)v43;
          BOOL v8 = v44;
        }
        else
        {
          v34 = (void *)[v46 mutableCopy];
          [v34 minusSet:v26];
          v35 = pp_contacts_log_handle();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v42 = [v34 count];
            LODWORD(v50) = 134217984;
            *(void *)((char *)&v50 + 4) = v42;
            _os_log_debug_impl(&dword_1CA9A8000, v35, OS_LOG_TYPE_DEBUG, "PPContactsImporter: _updateContact: to add: %tu", (uint8_t *)&v50, 0xCu);
          }

          *(void *)&long long v50 = MEMORY[0x1E4F143A8];
          *((void *)&v50 + 1) = 3221225472;
          v51 = __51__PPContactsImporter__updateContactWithIdentifier___block_invoke_49;
          v52 = &unk_1E65D6C88;
          id v36 = v34;
          id v53 = v36;
          v37 = objc_msgSend(v45, "_pas_filteredArrayWithTest:", &v50);
          if ([v37 count])
          {
            v48 = v27;
            -[PPContactsImporter _donateScoredNamedEntities:source:error:]((uint64_t)self, v37, v10, &v48);
            v38 = v48;

            v27 = v38;
          }
          v33 = (void *)v43;

          BOOL v8 = v44;
        }
      }
      else
      {
        BOOL v8 = v44;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          LODWORD(v50) = 138412290;
          *(void *)((char *)&v50 + 4) = v27;
          _os_log_error_impl(&dword_1CA9A8000, v29, OS_LOG_TYPE_ERROR, "PPContactsImporter: _updateContact: failed to iterate existing records: %@", (uint8_t *)&v50, 0xCu);
        }

        -[PPContactsImporter _deleteAndReAddWholeContact:contactIdentifier:]((uint64_t)self, v6, v4);
        v33 = (void *)v43;
      }
    }
    else
    {
      v27 = pp_contacts_log_handle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v4;
        _os_log_error_impl(&dword_1CA9A8000, v27, OS_LOG_TYPE_ERROR, "failed to load contact %@", (uint8_t *)&buf, 0xCu);
      }
    }
  }
}

- (id)_scoredContactWithContactIdentifier:(uint64_t)a1
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_opt_new();
  v19[0] = v3;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  [v4 setMatchingIdentifiers:v5];

  uint64_t v6 = *(void **)(a1 + 16);
  id v14 = 0;
  v7 = [v6 contactsWithQuery:v4 error:&v14];
  id v8 = v14;
  if (v7)
  {
    id v9 = +[PPContactScorer scoredContactsWithContacts:v7];
    if ((unint64_t)[v9 count] >= 2)
    {
      v10 = pp_default_log_handle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        uint64_t v13 = [v9 count];
        *(_DWORD *)long long buf = 138412546;
        id v16 = v3;
        __int16 v17 = 2048;
        uint64_t v18 = v13;
        _os_log_fault_impl(&dword_1CA9A8000, v10, OS_LOG_TYPE_FAULT, "received an unexpected number of contacts back from identifier query: %@ -> %tu", buf, 0x16u);
      }
    }
    v11 = [v9 firstObject];
  }
  else
  {
    id v9 = pp_contacts_log_handle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v16 = v8;
      _os_log_error_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_ERROR, "PPContactsImporter: _addContact: failed to load contacts to import from CN: %@", buf, 0xCu);
    }
    v11 = 0;
  }

  return v11;
}

- (id)_entitiesForScoredContact:(void *)a1
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v3 = [v1 scoredPostalAddresses];
  id v4 = objc_msgSend(v2, "initWithCapacity:", objc_msgSend(v3, "count") + 2);

  v5 = [v1 contact];
  uint64_t v6 = [v5 localizedFullName];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F89E90]);
    id v9 = [v1 contact];
    v10 = [v9 localizedFullName];
    v11 = [MEMORY[0x1E4F1CA20] currentLocale];
    id v12 = [v11 languageCode];
    uint64_t v13 = (void *)[v8 initWithName:v10 category:1 language:v12];

    id v14 = objc_alloc(MEMORY[0x1E4F89F00]);
    [v1 score];
    id v16 = objc_msgSend(v14, "initWithItem:score:", v13, fmin(v15, 1.0));
    [v4 addObject:v16];
  }
  __int16 v17 = [v1 contact];
  uint64_t v18 = [v17 organizationName];
  uint64_t v19 = [v18 length];

  if (v19)
  {
    id v20 = objc_alloc(MEMORY[0x1E4F89E90]);
    id v21 = [v1 contact];
    v22 = [v21 organizationName];
    v23 = [MEMORY[0x1E4F1CA20] currentLocale];
    v24 = [v23 languageCode];
    v25 = (void *)[v20 initWithName:v22 category:2 language:v24];

    id v26 = objc_alloc(MEMORY[0x1E4F89F00]);
    [v1 score];
    v28 = objc_msgSend(v26, "initWithItem:score:", v25, fmin(v27, 1.0));
    [v4 addObject:v28];
  }
  v48 = v1;
  id v49 = v4;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = [v1 scoredPostalAddresses];
  uint64_t v29 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v52 != v31) {
          objc_enumerationMutation(obj);
        }
        v33 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        v34 = [v33 labeledValue];
        v35 = [v34 value];

        id v36 = [v35 singleLineNormalizedAddressString];
        if (v36)
        {
          v37 = [v35 thoroughfare];
          if ([v37 length])
          {
            v38 = [v35 locality];
            if ([v38 length])
            {
            }
            else
            {
              uint64_t v39 = [v35 postalCode];
              uint64_t v40 = [v39 length];

              if (!v40) {
                goto LABEL_17;
              }
            }
            id v41 = objc_alloc(MEMORY[0x1E4F89E90]);
            uint64_t v42 = [MEMORY[0x1E4F1CA20] currentLocale];
            uint64_t v43 = [v42 languageCode];
            v37 = (void *)[v41 initWithName:v36 category:12 language:v43];

            id v44 = objc_alloc(MEMORY[0x1E4F89F00]);
            [v33 score];
            v46 = objc_msgSend(v44, "initWithItem:score:", v37, fmin(v45, 1.0));
            [v49 addObject:v46];
          }
        }
LABEL_17:
      }
      uint64_t v30 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
    }
    while (v30);
  }

  return v49;
}

- (id)_sourceForContactWithContactIdentifier:(void *)a1
{
  id v1 = (objc_class *)MEMORY[0x1E4F89F48];
  id v2 = a1;
  id v3 = (void *)[[v1 alloc] initWithDwellTimeSeconds:0 lengthSeconds:0 lengthCharacters:0 donationCount:0 contactHandleCount:0 flags:1];
  id v4 = objc_alloc(MEMORY[0x1E4F89F40]);
  uint64_t v5 = *MEMORY[0x1E4F8A050];
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (void *)[v4 initWithBundleId:v5 groupId:0 documentId:v2 date:v6 relevanceDate:0 contactHandles:0 language:0 metadata:v3];

  return v7;
}

void __51__PPContactsImporter__updateContactWithIdentifier___block_invoke_47(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 entity];
  [v2 addObject:v3];
}

- (void)_deleteAndReAddWholeContact:(void *)a3 contactIdentifier:
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void **)(a1 + 24);
  uint64_t v8 = *MEMORY[0x1E4F8A050];
  v19[0] = v6;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  id v16 = 0;
  LOBYTE(v8) = [v7 deleteAllNamedEntitiesFromSourcesWithBundleId:v8 documentIds:v9 deletedCount:0 error:&v16];
  id v10 = v16;

  if ((v8 & 1) == 0)
  {
    v11 = pp_default_log_handle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v18 = v10;
      _os_log_fault_impl(&dword_1CA9A8000, v11, OS_LOG_TYPE_FAULT, "PPContactsImporter failed to delete old entities during contact update and reimport: %@", buf, 0xCu);
    }
  }
  id v15 = v10;
  char v12 = -[PPContactsImporter importScoredContact:contactsIdentifier:error:](a1, v5, v6, &v15);
  id v13 = v15;

  if ((v12 & 1) == 0)
  {
    id v14 = pp_contacts_log_handle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v18 = v13;
      _os_log_error_impl(&dword_1CA9A8000, v14, OS_LOG_TYPE_ERROR, "PPContactsImporter: failed to import scored contact during update and reimport: %@", buf, 0xCu);
    }
  }
}

uint64_t __51__PPContactsImporter__updateContactWithIdentifier___block_invoke_49(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 item];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (uint64_t)_donateScoredNamedEntities:(void *)a3 source:(void *)a4 error:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = pp_contacts_log_handle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [v7 count];
    v11 = [v8 documentId];
    *(_DWORD *)long long buf = 134218242;
    uint64_t v20 = v10;
    __int16 v21 = 2112;
    v22 = v11;
    _os_log_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_DEFAULT, "PPContactsImporter: donating %tu entities from %@", buf, 0x16u);
  }
  char v12 = *(void **)(a1 + 24);
  id v18 = 0;
  uint64_t v13 = [v12 donateNamedEntities:v7 source:v8 algorithm:14 cloudSync:0 sentimentScore:&v18 error:0.0];
  id v14 = v18;
  id v15 = v14;
  if ((v13 & 1) == 0)
  {
    if (a4) {
      *a4 = v14;
    }
    id v16 = pp_contacts_log_handle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v20 = (uint64_t)v15;
      _os_log_error_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_ERROR, "PPContactsImporter: failed to donate named entity: %@", buf, 0xCu);
    }
  }
  return v13;
}

- (uint64_t)importScoredContact:(void *)a3 contactsIdentifier:(void *)a4 error:
{
  if (!a1) {
    return 0;
  }
  id v7 = a2;
  id v8 = -[PPContactsImporter _sourceForContactWithContactIdentifier:](a3);
  id v9 = -[PPContactsImporter _entitiesForScoredContact:](v7);

  if ([v9 count]) {
    uint64_t v10 = -[PPContactsImporter _donateScoredNamedEntities:source:error:](a1, v9, v8, a4);
  }
  else {
    uint64_t v10 = 1;
  }

  return v10;
}

uint64_t __51__PPContactsImporter__updateContactWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 item];
}

- (void)visitAddContactEvent:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v15 = [a3 contact];
  id v4 = [v15 identifier];
  if (self)
  {
    id v5 = pp_contacts_log_handle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v18 = v4;
      _os_log_impl(&dword_1CA9A8000, v5, OS_LOG_TYPE_DEFAULT, "PPContactsImporter: _addContact: %@", buf, 0xCu);
    }

    id v6 = -[PPContactsImporter _scoredContactWithContactIdentifier:]((uint64_t)self, v4);
    id v7 = [v6 contact];
    id v8 = [v7 contactsContactIdentifierWithError:0];

    if (![v8 length])
    {
      uint64_t v10 = pp_contacts_log_handle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v18 = v4;
        _os_log_error_impl(&dword_1CA9A8000, v10, OS_LOG_TYPE_ERROR, "failed to load contact %@", buf, 0xCu);
      }
      goto LABEL_13;
    }
    id v16 = 0;
    int v9 = -[PPContactsImporter importScoredContact:contactsIdentifier:error:]((uint64_t)self, v6, v8, &v16);
    uint64_t v10 = v16;
    v11 = pp_contacts_log_handle();
    char v12 = v11;
    if (v9)
    {
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
LABEL_12:

LABEL_13:
        goto LABEL_14;
      }
      uint64_t v13 = [v6 contact];
      id v14 = [v13 identifier];
      *(_DWORD *)long long buf = 138412290;
      id v18 = v14;
      _os_log_impl(&dword_1CA9A8000, v12, OS_LOG_TYPE_DEFAULT, "PPContactsImporter: _addContact: imported %@ due to CN change", buf, 0xCu);
    }
    else
    {
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        goto LABEL_12;
      }
      uint64_t v13 = [v6 contact];
      id v14 = [v13 identifier];
      *(_DWORD *)long long buf = 138412546;
      id v18 = v14;
      __int16 v19 = 2112;
      uint64_t v20 = v10;
      _os_log_error_impl(&dword_1CA9A8000, v12, OS_LOG_TYPE_ERROR, "PPContactsImporter: _addContact: failed to import %@: %@", buf, 0x16u);
    }

    goto LABEL_12;
  }
LABEL_14:
}

- (void)visitDropEverythingEvent:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = pp_contacts_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_DEFAULT, "PPContactsImporter: CNChangeHistoryDropEverythingEvent", buf, 2u);
  }

  char v12 = 0;
  namedEntityStore = self->_namedEntityStore;
  uint64_t v6 = *MEMORY[0x1E4F8A050];
  id v11 = 0;
  BOOL v7 = [(PPLocalNamedEntityStore *)namedEntityStore deleteAllNamedEntitiesFromSourcesWithBundleId:v6 deletedCount:&v12 error:&v11];
  id v8 = v11;
  int v9 = pp_contacts_log_handle();
  uint64_t v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134217984;
      id v14 = v12;
      _os_log_impl(&dword_1CA9A8000, v10, OS_LOG_TYPE_DEFAULT, "PPContactsImporter: CNChangeHistoryDropEverythingEvent: deleted %tu named entities", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    id v14 = v8;
    _os_log_error_impl(&dword_1CA9A8000, v10, OS_LOG_TYPE_ERROR, "PPContactsImporter: CNChangeHistoryDropEverythingEvent: failed to delete entities: %@", buf, 0xCu);
  }
}

- (void)importContactsDataWithShouldContinueBlock:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v26 = (uint64_t (**)(void))a3;
  char v3 = +[PPContactsImporter _shouldImport]();
  id v4 = pp_contacts_log_handle();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_DEFAULT, "PPContactsImporter: performing contacts import.", (uint8_t *)&buf, 2u);
    }

    id v4 = +[PPContactScorer mostRelevantContactsWithStore:self->_contactStore shouldContinueBlock:v26];
    uint64_t v6 = pp_contacts_log_handle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [v4 count];
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v7;
      _os_log_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_DEFAULT, "PPContactsImporter: got %tu scored contacts", (uint8_t *)&buf, 0xCu);
    }

    if ([v4 count])
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v40 = 0x3032000000;
      id v41 = __Block_byref_object_copy__9006;
      uint64_t v42 = __Block_byref_object_dispose__9007;
      id v43 = 0;
      uint64_t v32 = 0;
      v33 = &v32;
      uint64_t v34 = 0x3032000000;
      v35 = __Block_byref_object_copy__9006;
      id v36 = __Block_byref_object_dispose__9007;
      id v37 = 0;
      db = self->_db;
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __69__PPContactsImporter__loadContactIdentifiersAlreadyImportedInPastDay__block_invoke;
      v31[3] = &unk_1E65D6C60;
      v31[4] = &buf;
      v31[5] = &v32;
      [(PPSQLDatabase *)db readTransactionWithClient:6 block:v31];
      if (*(void *)(*((void *)&buf + 1) + 40))
      {
        int v9 = objc_opt_new();
        [v9 timeIntervalSinceDate:*(void *)(*((void *)&buf + 1) + 40)];
        if ((int)(v10 / 86400.0) >= 1)
        {
          id v11 = (void *)v33[5];
          v33[5] = 0;
        }
      }
      id v12 = (id)v33[5];
      _Block_object_dispose(&v32, 8);

      _Block_object_dispose(&buf, 8);
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v4 = v4;
      uint64_t v13 = [v4 countByEnumeratingWithState:&v27 objects:v38 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v28;
        while (2)
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v28 != v14) {
              objc_enumerationMutation(v4);
            }
            id v16 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            __int16 v17 = (void *)MEMORY[0x1CB79D060]();
            if ((v26[2]() & 1) == 0)
            {
              if (v12)
              {
                id v21 = v12;
                v22 = v21;
                if (self)
                {
                  uint64_t v23 = self->_db;
                  *(void *)&long long buf = MEMORY[0x1E4F143A8];
                  *((void *)&buf + 1) = 3221225472;
                  uint64_t v40 = (uint64_t)__56__PPContactsImporter__stashImportedContactsIdentifiers___block_invoke;
                  id v41 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E65DB8F0;
                  uint64_t v42 = (void (*)(uint64_t))v21;
                  [(PPSQLDatabase *)v23 writeTransactionWithClient:6 block:&buf];
                }
              }
              goto LABEL_32;
            }
            id v18 = [v16 contact];
            __int16 v19 = [v18 contactsContactIdentifierWithError:0];

            if (![v19 length] || objc_msgSend(v12, "containsObject:", v19))
            {

LABEL_32:

              goto LABEL_33;
            }
            -[PPContactsImporter importScoredContact:contactsIdentifier:error:]((uint64_t)self, v16, v19, 0);
            [v12 addObject:v19];
          }
          uint64_t v13 = [v4 countByEnumeratingWithState:&v27 objects:v38 count:16];
          if (v13) {
            continue;
          }
          break;
        }

        uint64_t v20 = self;
        if (!self) {
          goto LABEL_33;
        }
      }
      else
      {

        uint64_t v20 = self;
      }
      -[PPSQLDatabase writeTransactionWithClient:block:](v20->_db, "writeTransactionWithClient:block:", 6, &__block_literal_global_37, self);
      -[PPContactsImporter _flushNamedEntities](v25);
LABEL_33:
    }
  }
  else if (v5)
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_DEFAULT, "PPContactsImporter: skipping Contacts import due to settings.", (uint8_t *)&buf, 2u);
  }
}

+ (uint64_t)_shouldImport
{
  self;
  v0 = +[PPSettings sharedInstance];
  uint64_t v1 = [v0 bundleIdentifierIsEnabledForDonation:*MEMORY[0x1E4F8A050]];

  return v1;
}

- (void)_flushNamedEntities
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v1 = *(void **)(a1 + 24);
    id v5 = 0;
    char v2 = [v1 flushDonationsWithError:&v5];
    id v3 = v5;
    if ((v2 & 1) == 0)
    {
      id v4 = pp_default_log_handle();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v7 = v3;
        _os_log_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_DEFAULT, "PPContactsImporter: Warning: failed to flush named entities: %@", buf, 0xCu);
      }
    }
  }
}

uint64_t __52__PPContactsImporter__removeStashedImportedContacts__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[PPSQLKVStore removeBlobForKey:@"alreadyImportedContactsIdentifiers" transaction:a2];
}

void __56__PPContactsImporter__stashImportedContactsIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_opt_new();
  id v5 = objc_opt_new();
  [v4 addObject:v5];

  [v4 addObject:*(void *)(a1 + 32)];
  id v9 = 0;
  uint64_t v6 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v9];
  id v7 = v9;
  if (v6)
  {
    +[PPSQLKVStore storeBlob:v6 forKey:@"alreadyImportedContactsIdentifiers" transaction:v3];
  }
  else
  {
    uint64_t v8 = pp_contacts_log_handle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v11 = v7;
      _os_log_error_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_ERROR, "_stashAlreadyImportedContactsIdentifiers: failed to serialize NSArray: %@", buf, 0xCu);
    }
  }
}

void __69__PPContactsImporter__loadContactIdentifiersAlreadyImportedInPastDay__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[PPSQLKVStore loadBlobForKey:@"alreadyImportedContactsIdentifiers" transaction:v3];
  if (v4)
  {
    id v5 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v6 = (void *)MEMORY[0x1CB79D060]();
    id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    id v11 = objc_msgSend(v7, "initWithObjects:", v8, v9, v10, objc_opt_class(), 0);
    id v20 = 0;
    uint64_t v12 = [v5 unarchivedObjectOfClasses:v11 fromData:v4 error:&v20];
    id v13 = v20;

    if (v12 && [v12 count] == 2)
    {
      uint64_t v14 = [v12 objectAtIndexedSubscript:0];
      uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 8);
      id v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v14;

      uint64_t v17 = [v12 objectAtIndexedSubscript:1];
      uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
      __int16 v19 = *(NSObject **)(v18 + 40);
      *(void *)(v18 + 40) = v17;
    }
    else
    {
      __int16 v19 = pp_contacts_log_handle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412546;
        v22 = @"alreadyImportedContactsIdentifiers";
        __int16 v23 = 2112;
        id v24 = v13;
        _os_log_error_impl(&dword_1CA9A8000, v19, OS_LOG_TYPE_ERROR, "Failed to unarchive _PASTuple2 for KVS key %@: %@", buf, 0x16u);
      }
    }
  }
}

- (PPContactsImporter)initWithDatabase:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PPContactsImporter;
  uint64_t v6 = [(PPContactsImporter *)&v20 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_db, a3);
    uint64_t v8 = [[PPContactStorage alloc] initWithDatabase:v7->_db foundInAppsHarvestStoreGetter:&__block_literal_global_9015];
    uint64_t v9 = [[PPLocalContactStore alloc] initWithStorage:v8 namedEntityStoreOverride:0];
    contactStore = v7->_contactStore;
    v7->_contactStore = v9;

    id v11 = [[PPNamedEntityStorage alloc] initWithDatabase:v7->_db];
    uint64_t v12 = [PPLocalNamedEntityStore alloc];
    id v13 = (void *)[objc_alloc(MEMORY[0x1E4F93B68]) initWithResult:v7->_contactStore];
    uint64_t v14 = +[PPTrialWrapper sharedInstance];
    uint64_t v15 = [(PPLocalNamedEntityStore *)v12 initWithStorage:v11 topicStoreForNamedEntityMapping:0 lazyContactStoreForMapsFeedback:v13 trialWrapper:v14];
    namedEntityStore = v7->_namedEntityStore;
    v7->_namedEntityStore = (PPLocalNamedEntityStore *)v15;

    id location = 0;
    objc_initWeak(&location, v7);
    uint64_t v17 = (void *)MEMORY[0x1E4F89EC0];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __47__PPContactsImporter__registerForNotifications__block_invoke;
    v22[3] = &unk_1E65DC540;
    objc_copyWeak(&v23, &location);
    [v17 addContactsObserverForLifetimeOfObject:v7 block:v22];
    uint64_t v18 = pp_contacts_log_handle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1CA9A8000, v18, OS_LOG_TYPE_DEFAULT, "PPContactsImporter: performing initial history sync up.", buf, 2u);
    }

    -[PPContactsImporter _handleNotificationWithError:]((uint64_t)v7);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  return v7;
}

void __47__PPContactsImporter__registerForNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    -[PPContactsImporter _handleNotificationWithError:]((uint64_t)WeakRetained);
    id WeakRetained = v2;
  }
}

- (void)_handleNotificationWithError:(uint64_t)a1
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (+[PPContactsImporter _shouldImport]())
  {
    id v2 = *(void **)(a1 + 16);
    id v18 = 0;
    id v3 = [v2 contactsChangeHistoryForClient:@"com.apple.proactive.PersonalizationPortrait.PPContactsImporter" error:&v18];
    id v4 = v18;
    if (v3)
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v5 = [v3 value];
      uint64_t v13 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
      if (v13)
      {
        uint64_t v6 = *(void *)v15;
        uint64_t v7 = v13;
LABEL_5:
        uint64_t v8 = 0;
        while (1)
        {
          if (*(void *)v15 != v6) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * v8);
          uint64_t v10 = (void *)MEMORY[0x1CB79D060]();
          [v9 acceptEventVisitor:a1];
          objc_opt_class();
          LOBYTE(v9) = objc_opt_isKindOfClass();
          if (v9) {
            break;
          }
          if (v7 == ++v8)
          {
            uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
            if (v7) {
              goto LABEL_5;
            }
            break;
          }
        }
      }

      [*(id *)(a1 + 16) clearChangeHistoryForClient:@"com.apple.proactive.PersonalizationPortrait.PPContactsImporter" historyResult:v3];
      id v11 = pp_contacts_log_handle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1CA9A8000, v11, OS_LOG_TYPE_DEFAULT, "PPContactsImporter: done handling contact change history.", buf, 2u);
      }

      if (v13) {
        -[PPContactsImporter _flushNamedEntities](a1);
      }
    }
    else
    {
      uint64_t v12 = pp_contacts_log_handle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v21 = v4;
        _os_log_error_impl(&dword_1CA9A8000, v12, OS_LOG_TYPE_ERROR, "PPContactsImporter: failed to load CN change history: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    id v4 = pp_contacts_log_handle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_DEFAULT, "PPContactsImporter: _handleNotificationWithError bypassed due to settings", buf, 2u);
    }
  }
}

uint64_t __39__PPContactsImporter_initWithDatabase___block_invoke()
{
  return [MEMORY[0x1E4F5DF80] defaultHarvestStore];
}

+ (id)defaultInstance
{
  if (+[PPContactsImporter _shouldImport]())
  {
    id v2 = +[PPSQLDatabase sharedInstance];
    id v3 = v2;
    if (v2)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __37__PPContactsImporter_defaultInstance__block_invoke;
      block[3] = &unk_1E65DBE30;
      uint64_t v8 = v2;
      if (defaultInstance__pasOnceToken4 != -1) {
        dispatch_once(&defaultInstance__pasOnceToken4, block);
      }
      id v4 = (id)defaultInstance__pasExprOnceResult;
      id v5 = v8;
    }
    else
    {
      id v5 = pp_contacts_log_handle();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1CA9A8000, v5, OS_LOG_TYPE_INFO, "PPContactsImporter: giving up on initialization due to lack of DB singleton.", buf, 2u);
      }
      id v4 = 0;
    }
  }
  else
  {
    id v3 = pp_contacts_log_handle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1CA9A8000, v3, OS_LOG_TYPE_DEFAULT, "PPContactsImporter: defaultInstance bypassed due to settings", buf, 2u);
    }
    id v4 = 0;
  }

  return v4;
}

void __37__PPContactsImporter_defaultInstance__block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1CB79D060]();
  id v3 = [[PPContactsImporter alloc] initWithDatabase:*(void *)(a1 + 32)];
  id v4 = (void *)defaultInstance__pasExprOnceResult;
  defaultInstance__pasExprOnceResult = (uint64_t)v3;
}

@end