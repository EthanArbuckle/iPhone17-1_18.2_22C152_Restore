@interface PLPropertyIndexMapping
+ (BOOL)includesToManyRelationship:(id)a3 entity:(id)a4;
+ (PLPropertyIndexMapping)defaultMapping;
+ (id)attributeNamesForIndexValues:(unint64_t)a3 entity:(id)a4;
+ (id)relationshipNamesForIndexValues:(unint64_t)a3 entity:(id)a4;
+ (unint64_t)indexValueForAttributeNames:(id)a3 entity:(id)a4;
+ (unint64_t)indexValueForRelationshipNames:(id)a3 entity:(id)a4;
+ (void)recordChangedKeys:(id)a3 forObjectID:(id)a4 inAttributesByOID:(id)a5 relationshipsByOID:(id)a6;
+ (void)recordChangedProperties:(id)a3 forObjectID:(id)a4 inAttributesByOID:(id)a5 relationshipsByOID:(id)a6;
- ($61A80719B04F7407D3E47539F1B23CAA)_indexValueForPropertyNames:(id)a3 entityName:(id)a4 indexesByPropertyNamesByEntityNames:(id)a5;
- ($61A80719B04F7407D3E47539F1B23CAA)indexValueForAttributeNames:(id)a3 entity:(id)a4;
- ($61A80719B04F7407D3E47539F1B23CAA)indexValueForRelationshipNames:(id)a3 entity:(id)a4;
- (BOOL)dumpToDirectory:(id)a3 error:(id *)a4;
- (BOOL)includesToManyRelationship:(id)a3 entity:(id)a4;
- (BOOL)includesTransientAttributes:(id)a3 entity:(id)a4;
- (PLPropertyIndexMapping)init;
- (PLPropertyIndexMapping)initWithManagedObjectModel:(id)a3;
- (id)_dumpDictionary:(id)a3 toDir:(id)a4 withName:(id)a5;
- (id)_processEntityByName:(id)a3 obj:(id)a4;
- (id)_processSubEntityByName:(id)a3 entity:(id)a4 withEntityData:(id)a5;
- (id)_propertyNamesForIndexValues:(id)a3 entity:(id)a4 propertyNamesByIndexByEntityNames:(id)a5;
- (id)attributeNamesForIndexValues:(id)a3 entity:(id)a4;
- (id)relationshipNamesForIndexValues:(id)a3 entity:(id)a4;
- (void)recordChangedKeys:(id)a3 forObjectID:(id)a4 inAttributesByOID:(id)a5 relationshipsByOID:(id)a6;
- (void)recordChangedProperties:(id)a3 forObjectID:(id)a4 inAttributesByOID:(id)a5 relationshipsByOID:(id)a6;
- (void)updatedIndexesForChangedKeys:(id)a3 entityName:(id)a4 withAttributes:(id)a5 relationships:(id)a6 updateBlock:(id)a7;
@end

@implementation PLPropertyIndexMapping

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toManyRelationshipNamesByEntityNames, 0);
  objc_storeStrong((id *)&self->_transientAttributeNamesByEntityNames, 0);
  objc_storeStrong((id *)&self->_relationshipNamesByIndexByEntityNames, 0);
  objc_storeStrong((id *)&self->_indexesByRelationshipNamesByEntityNames, 0);
  objc_storeStrong((id *)&self->_attributeNamesByIndexByEntityNames, 0);
  objc_storeStrong((id *)&self->_indexesByAttributeNamesByEntityNames, 0);
}

- (id)_dumpDictionary:(id)a3 toDir:(id)a4 withName:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = a3;
  v9 = [a4 URLByAppendingPathComponent:v7];
  v10 = [v9 URLByAppendingPathExtension:@"txt"];
  v11 = objc_msgSend(v8, "_pl_prettyDescription");

  id v19 = 0;
  char v12 = [v11 writeToURL:v10 atomically:0 encoding:4 error:&v19];
  id v13 = v19;
  if (v12)
  {
    v14 = (void *)MEMORY[0x1E4F8B9B8];
    v15 = [MEMORY[0x1E4F1CA98] null];
    v16 = [v14 successWithResult:v15];
  }
  else
  {
    v17 = PLBackendGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v21 = v7;
      __int16 v22 = 2112;
      id v23 = v13;
      _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "Unable to dump text for %@: %@", buf, 0x16u);
    }

    v16 = [MEMORY[0x1E4F8B9B8] failureWithError:v13];
  }

  return v16;
}

- (BOOL)dumpToDirectory:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1E4F8B9B8];
  id v8 = [MEMORY[0x1E4F1CA98] null];
  v9 = [v7 successWithResult:v8];

  if ([v9 isSuccess])
  {
    uint64_t v10 = [(PLPropertyIndexMapping *)self _dumpDictionary:self->_indexesByAttributeNamesByEntityNames toDir:v6 withName:@"indexesByAttributeNamesByEntityNames"];

    v9 = (void *)v10;
  }
  if ([v9 isSuccess])
  {
    uint64_t v11 = [(PLPropertyIndexMapping *)self _dumpDictionary:self->_attributeNamesByIndexByEntityNames toDir:v6 withName:@"attributeNamesByIndexByEntityNames"];

    v9 = (void *)v11;
  }
  if ([v9 isSuccess])
  {
    uint64_t v12 = [(PLPropertyIndexMapping *)self _dumpDictionary:self->_transientAttributeNamesByEntityNames toDir:v6 withName:@"transientAttributeNamesByEntityNames"];

    v9 = (void *)v12;
  }
  if ([v9 isSuccess])
  {
    uint64_t v13 = [(PLPropertyIndexMapping *)self _dumpDictionary:self->_indexesByRelationshipNamesByEntityNames toDir:v6 withName:@"indexesByRelationshipNamesByEntityNames"];

    v9 = (void *)v13;
  }
  if ([v9 isSuccess])
  {
    uint64_t v14 = [(PLPropertyIndexMapping *)self _dumpDictionary:self->_relationshipNamesByIndexByEntityNames toDir:v6 withName:@"relationshipNamesByIndexByEntityNames"];

    v9 = (void *)v14;
  }
  if ([v9 isSuccess])
  {
    uint64_t v15 = [(PLPropertyIndexMapping *)self _dumpDictionary:self->_toManyRelationshipNamesByEntityNames toDir:v6 withName:@"toManyRelationshipNamesByEntityNames"];

    v9 = (void *)v15;
  }
  v16 = [v9 resultWithError:a4];
  BOOL v17 = v16 != 0;

  return v17;
}

- (void)updatedIndexesForChangedKeys:(id)a3 entityName:(id)a4 withAttributes:(id)a5 relationships:(id)a6 updateBlock:(id)a7
{
  id v19 = a3;
  id v12 = a4;
  uint64_t v13 = (void (**)(id, unint64_t, unint64_t))a7;
  unint64_t v14 = [(PLPropertyIndexMapping *)self indexValueForAttributeNames:v19 entity:v12] | a5.var0;
  unint64_t v15 = [(PLPropertyIndexMapping *)self indexValueForRelationshipNames:v19 entity:v12] | a6.var0;
  if (v14 | v15
    || (-[NSDictionary objectForKeyedSubscript:](self->_transientAttributeNamesByEntityNames, "objectForKeyedSubscript:", v12), v16 = objc_claimAutoreleasedReturnValue(), [MEMORY[0x1E4F1CAD0] setWithArray:v19], BOOL v17 = objc_claimAutoreleasedReturnValue(), v18 = objc_msgSend(v16, "intersectsSet:", v17), v17, v16, v18))
  {
    v13[2](v13, v14, v15);
  }
}

- (void)recordChangedKeys:(id)a3 forObjectID:(id)a4 inAttributesByOID:(id)a5 relationshipsByOID:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  unint64_t v14 = [v10 entity];
  unint64_t v15 = [v14 name];

  v16 = [v11 objectForKeyedSubscript:v10];
  BOOL v17 = v16;
  if (v16) {
    uint64_t v18 = [v16 unsignedLongLongValue];
  }
  else {
    uint64_t v18 = 0;
  }

  id v19 = [v12 objectForKeyedSubscript:v10];
  v20 = v19;
  if (v19) {
    uint64_t v21 = [v19 unsignedLongLongValue];
  }
  else {
    uint64_t v21 = 0;
  }

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __93__PLPropertyIndexMapping_recordChangedKeys_forObjectID_inAttributesByOID_relationshipsByOID___block_invoke;
  v25[3] = &unk_1E586AD68;
  id v26 = v11;
  id v27 = v10;
  id v28 = v12;
  id v22 = v12;
  id v23 = v10;
  id v24 = v11;
  [(PLPropertyIndexMapping *)self updatedIndexesForChangedKeys:v13 entityName:v15 withAttributes:v18 relationships:v21 updateBlock:v25];
}

void __93__PLPropertyIndexMapping_recordChangedKeys_forObjectID_inAttributesByOID_relationshipsByOID___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5 = [NSNumber numberWithUnsignedLongLong:a2];
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:*(void *)(a1 + 40)];

  id v6 = [NSNumber numberWithUnsignedLongLong:a3];
  [*(id *)(a1 + 48) setObject:v6 forKeyedSubscript:*(void *)(a1 + 40)];
}

- (void)recordChangedProperties:(id)a3 forObjectID:(id)a4 inAttributesByOID:(id)a5 relationshipsByOID:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v14 = [a3 allObjects];
  id v13 = objc_msgSend(v14, "_pl_map:", &__block_literal_global_56);
  [(PLPropertyIndexMapping *)self recordChangedKeys:v13 forObjectID:v12 inAttributesByOID:v11 relationshipsByOID:v10];
}

uint64_t __99__PLPropertyIndexMapping_recordChangedProperties_forObjectID_inAttributesByOID_relationshipsByOID___block_invoke(uint64_t a1, void *a2)
{
  return [a2 name];
}

- (BOOL)includesTransientAttributes:(id)a3 entity:(id)a4
{
  transientAttributeNamesByEntityNames = self->_transientAttributeNamesByEntityNames;
  id v6 = a3;
  id v7 = [(NSDictionary *)transientAttributeNamesByEntityNames objectForKeyedSubscript:a4];
  id v8 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];

  LOBYTE(v6) = [v7 intersectsSet:v8];
  return (char)v6;
}

- (BOOL)includesToManyRelationship:(id)a3 entity:(id)a4
{
  toManyRelationshipNamesByEntityNames = self->_toManyRelationshipNamesByEntityNames;
  id v6 = a3;
  id v7 = [(NSDictionary *)toManyRelationshipNamesByEntityNames objectForKeyedSubscript:a4];
  LOBYTE(toManyRelationshipNamesByEntityNames) = [v7 intersectsSet:v6];

  return (char)toManyRelationshipNamesByEntityNames;
}

- (id)relationshipNamesForIndexValues:(id)a3 entity:(id)a4
{
  return [(PLPropertyIndexMapping *)self _propertyNamesForIndexValues:a3.var0 entity:a4 propertyNamesByIndexByEntityNames:self->_relationshipNamesByIndexByEntityNames];
}

- ($61A80719B04F7407D3E47539F1B23CAA)indexValueForRelationshipNames:(id)a3 entity:(id)a4
{
  return ($61A80719B04F7407D3E47539F1B23CAA)[(PLPropertyIndexMapping *)self _indexValueForPropertyNames:a3 entityName:a4 indexesByPropertyNamesByEntityNames:self->_indexesByRelationshipNamesByEntityNames];
}

- (id)attributeNamesForIndexValues:(id)a3 entity:(id)a4
{
  return [(PLPropertyIndexMapping *)self _propertyNamesForIndexValues:a3.var0 entity:a4 propertyNamesByIndexByEntityNames:self->_attributeNamesByIndexByEntityNames];
}

- ($61A80719B04F7407D3E47539F1B23CAA)indexValueForAttributeNames:(id)a3 entity:(id)a4
{
  return ($61A80719B04F7407D3E47539F1B23CAA)[(PLPropertyIndexMapping *)self _indexValueForPropertyNames:a3 entityName:a4 indexesByPropertyNamesByEntityNames:self->_indexesByAttributeNamesByEntityNames];
}

- (id)_propertyNamesForIndexValues:(id)a3 entity:(id)a4 propertyNamesByIndexByEntityNames:(id)a5
{
  id v6 = [a5 objectForKeyedSubscript:a4];
  if (a3.var0)
  {
    id v7 = [MEMORY[0x1E4F1CA48] array];
    if ([v6 count])
    {
      unint64_t v8 = 0;
      do
      {
        PLPropertyIndexSetValidateIndex(v8);
        if ((a3.var0 >> v8))
        {
          v9 = [NSNumber numberWithUnsignedInteger:v8];
          id v10 = [v6 objectForKeyedSubscript:v9];

          if (v10) {
            [v7 addObject:v10];
          }
        }
        ++v8;
      }
      while (v8 < [v6 count]);
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- ($61A80719B04F7407D3E47539F1B23CAA)_indexValueForPropertyNames:(id)a3 entityName:(id)a4 indexesByPropertyNamesByEntityNames:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  unint64_t v8 = [a5 objectForKeyedSubscript:a4];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    v12.var0 = 0;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v9);
        }
        unint64_t v15 = objc_msgSend(v8, "objectForKeyedSubscript:", *(void *)(*((void *)&v20 + 1) + 8 * i), (void)v20);
        v16 = v15;
        if (v15)
        {
          unint64_t v17 = [v15 unsignedIntegerValue];
          char v18 = v17;
          PLPropertyIndexSetValidateIndex(v17);
          v12.var0 |= 1 << v18;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }
  else
  {
    v12.var0 = 0;
  }

  return v12;
}

- (id)_processSubEntityByName:(id)a3 entity:(id)a4 withEntityData:(id)a5
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v69 = a3;
  id v67 = a4;
  id v8 = a5;
  v49 = v8;
  if (v8)
  {
    id v9 = v8;
  }
  else
  {
    id v9 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
    [v9 setObject:v10 forKey:@"indexByAttr"];

    uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
    [v9 setObject:v11 forKey:@"attrByIndex"];

    $61A80719B04F7407D3E47539F1B23CAA v12 = [MEMORY[0x1E4F1CA60] dictionary];
    [v9 setObject:v12 forKey:@"indexByRelation"];

    uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
    [v9 setObject:v13 forKey:@"relationByIndex"];

    id v14 = [MEMORY[0x1E4F1CA60] dictionary];
    unint64_t v15 = [MEMORY[0x1E4F1CA60] dictionary];
    [v14 setObject:v15 forKey:@"indexByAttrByEntity"];

    v16 = [MEMORY[0x1E4F1CA60] dictionary];
    [v14 setObject:v16 forKey:@"attrByIndexByEntity"];

    unint64_t v17 = [MEMORY[0x1E4F1CA60] dictionary];
    [v14 setObject:v17 forKey:@"transientAttrByEntity"];

    char v18 = [MEMORY[0x1E4F1CA60] dictionary];
    [v14 setObject:v18 forKey:@"indexByRelationByEntity"];

    id v19 = [MEMORY[0x1E4F1CA60] dictionary];
    [v14 setObject:v19 forKey:@"relationByIndexByEntity"];

    long long v20 = [MEMORY[0x1E4F1CA60] dictionary];
    [v14 setObject:v20 forKey:@"toManyRelationsByEntity"];

    [v9 setObject:v14 forKey:@"resultDictionary"];
  }
  v63 = [v9 objectForKey:@"indexByAttr"];
  v55 = [v9 objectForKey:@"attrByIndex"];
  v62 = [v9 objectForKey:@"indexByRelation"];
  v52 = [v9 objectForKey:@"relationByIndex"];
  v70 = [v9 objectForKey:@"resultDictionary"];
  v54 = [v70 objectForKey:@"indexByAttrByEntity"];
  v53 = [v70 objectForKey:@"attrByIndexByEntity"];
  v60 = [v70 objectForKey:@"transientAttrByEntity"];
  v51 = [v70 objectForKey:@"indexByRelationByEntity"];
  v50 = [v70 objectForKey:@"relationByIndexByEntity"];
  v58 = [v70 objectForKey:@"toManyRelationsByEntity"];
  v68 = [v67 attributesByName];
  long long v21 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v68, "count"));
  long long v22 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v68, "count"));
  v93[0] = MEMORY[0x1E4F143A8];
  v93[1] = 3221225472;
  v93[2] = __72__PLPropertyIndexMapping__processSubEntityByName_entity_withEntityData___block_invoke;
  v93[3] = &unk_1E5872520;
  id v59 = v22;
  id v94 = v59;
  id v61 = v21;
  id v95 = v61;
  [v68 enumerateKeysAndObjectsUsingBlock:v93];
  v66 = [v61 sortedArrayUsingSelector:sel_compare_];
  if ((unint64_t)[v66 count] >= 0x41)
  {
    v47 = [MEMORY[0x1E4F28B00] currentHandler];
    [v47 handleFailureInMethod:a2, self, @"PLPropertyIndexMapping.m", 203, @"%@ (%lu) has too many attributes to treat as a single bitfield", v69, objc_msgSend(v66, "count") object file lineNumber description];
  }
  if ([v66 count])
  {
    uint64_t v89 = 0;
    v90 = &v89;
    uint64_t v91 = 0x2020000000;
    uint64_t v92 = 0;
    uint64_t v92 = [v63 count];
    v85[0] = MEMORY[0x1E4F143A8];
    v85[1] = 3221225472;
    v85[2] = __72__PLPropertyIndexMapping__processSubEntityByName_entity_withEntityData___block_invoke_2;
    v85[3] = &unk_1E586CB80;
    id v23 = v63;
    id v86 = v23;
    v88 = &v89;
    id v24 = v55;
    id v87 = v24;
    [v66 enumerateObjectsUsingBlock:v85];
    [v54 setObject:v23 forKey:v69];
    [v53 setObject:v24 forKey:v69];

    _Block_object_dispose(&v89, 8);
  }
  uint64_t v25 = (void *)[v59 copy];
  [v60 setObject:v25 forKey:v69];

  v64 = [v67 relationshipsByName];
  id v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v64, "count"));
  id v27 = [MEMORY[0x1E4F1CA48] array];
  v82[0] = MEMORY[0x1E4F143A8];
  v82[1] = 3221225472;
  v82[2] = __72__PLPropertyIndexMapping__processSubEntityByName_entity_withEntityData___block_invoke_3;
  v82[3] = &unk_1E5872A70;
  id v56 = v27;
  id v83 = v56;
  id v57 = v26;
  id v84 = v57;
  [v64 enumerateKeysAndObjectsUsingBlock:v82];
  id v28 = (void *)[v57 copy];
  [v58 setObject:v28 forKey:v69];

  v65 = [v56 sortedArrayUsingSelector:sel_compare_];
  if ((unint64_t)[v65 count] >= 0x41)
  {
    v48 = [MEMORY[0x1E4F28B00] currentHandler];
    [v48 handleFailureInMethod:a2, self, @"PLPropertyIndexMapping.m", 241, @"%@ (%lu) has too many relationships to treat as a single bitfield", v69, objc_msgSend(v65, "count") object file lineNumber description];
  }
  if ([v65 count])
  {
    uint64_t v89 = 0;
    v90 = &v89;
    uint64_t v91 = 0x2020000000;
    uint64_t v92 = 0;
    uint64_t v92 = [v62 count];
    v78[0] = MEMORY[0x1E4F143A8];
    v78[1] = 3221225472;
    v78[2] = __72__PLPropertyIndexMapping__processSubEntityByName_entity_withEntityData___block_invoke_4;
    v78[3] = &unk_1E586CB80;
    id v29 = v62;
    id v79 = v29;
    v81 = &v89;
    id v30 = v52;
    id v80 = v30;
    [v65 enumerateObjectsUsingBlock:v78];
    [v51 setObject:v29 forKey:v69];
    [v50 setObject:v30 forKey:v69];

    _Block_object_dispose(&v89, 8);
  }
  id obj = [v67 subentities];
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  uint64_t v31 = [obj countByEnumeratingWithState:&v74 objects:v96 count:16];
  if (v31)
  {
    uint64_t v72 = *(void *)v75;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v75 != v72) {
          objc_enumerationMutation(obj);
        }
        v33 = *(void **)(*((void *)&v74 + 1) + 8 * i);
        v34 = [MEMORY[0x1E4F1CA60] dictionary];
        v35 = [v9 objectForKey:@"indexByAttr"];
        v36 = (void *)[v35 mutableCopy];
        [v34 setObject:v36 forKey:@"indexByAttr"];

        v37 = [v9 objectForKey:@"attrByIndex"];
        v38 = (void *)[v37 mutableCopy];
        [v34 setObject:v38 forKey:@"attrByIndex"];

        v39 = [v9 objectForKey:@"indexByRelation"];
        v40 = (void *)[v39 mutableCopy];
        [v34 setObject:v40 forKey:@"indexByRelation"];

        v41 = [v9 objectForKey:@"relationByIndex"];
        v42 = (void *)[v41 mutableCopy];
        [v34 setObject:v42 forKey:@"relationByIndex"];

        v43 = [v9 objectForKey:@"resultDictionary"];
        [v34 setObject:v43 forKey:@"resultDictionary"];

        v44 = [v33 name];
        id v45 = [(PLPropertyIndexMapping *)self _processSubEntityByName:v44 entity:v33 withEntityData:v34];
      }
      uint64_t v31 = [obj countByEnumeratingWithState:&v74 objects:v96 count:16];
    }
    while (v31);
  }

  return v9;
}

void __72__PLPropertyIndexMapping__processSubEntityByName_entity_withEntityData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if ([v5 isTransient])
  {
    id v6 = (id *)(a1 + 32);
  }
  else
  {
    id v7 = [v5 userInfo];
    id v8 = [v7 objectForKey:@"com.apple.photos.photoKit.ignoreForUpdates"];
    char v9 = [v8 BOOLValue];

    if (v9) {
      goto LABEL_6;
    }
    id v6 = (id *)(a1 + 40);
  }
  [*v6 addObject:v10];
LABEL_6:
}

void __72__PLPropertyIndexMapping__processSubEntityByName_entity_withEntityData___block_invoke_2(uint64_t a1, void *a2)
{
  id v9 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:");

  if (!v3)
  {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    id v5 = *(void **)(a1 + 32);
    id v6 = [NSNumber numberWithUnsignedInteger:v4];
    [v5 setObject:v6 forKey:v9];

    id v7 = *(void **)(a1 + 40);
    id v8 = [NSNumber numberWithUnsignedInteger:v4];
    [v7 setObject:v9 forKey:v8];

    ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
}

void __72__PLPropertyIndexMapping__processSubEntityByName_entity_withEntityData___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = [v5 userInfo];
  id v7 = [v6 objectForKey:@"com.apple.photos.photoKit.ignoreForUpdates"];
  char v8 = [v7 BOOLValue];

  if ((v8 & 1) == 0) {
    [*(id *)(a1 + 32) addObject:v9];
  }
  if ([v5 isToMany]) {
    [*(id *)(a1 + 40) addObject:v9];
  }
}

void __72__PLPropertyIndexMapping__processSubEntityByName_entity_withEntityData___block_invoke_4(uint64_t a1, void *a2)
{
  id v9 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:");

  if (!v3)
  {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    id v5 = *(void **)(a1 + 32);
    id v6 = [NSNumber numberWithUnsignedInteger:v4];
    [v5 setObject:v6 forKey:v9];

    id v7 = *(void **)(a1 + 40);
    char v8 = [NSNumber numberWithUnsignedInteger:v4];
    [v7 setObject:v9 forKey:v8];

    ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
}

- (id)_processEntityByName:(id)a3 obj:(id)a4
{
  id v5 = a4;
  id v6 = [v5 superentity];
  id v7 = v5;
  char v8 = v7;
  id v9 = v7;
  if (v6)
  {
    id v10 = v7;
    do
    {
      id v9 = v6;

      id v6 = [v9 superentity];

      id v10 = v9;
    }
    while (v6);
  }
  uint64_t v11 = [v9 name];
  $61A80719B04F7407D3E47539F1B23CAA v12 = [(PLPropertyIndexMapping *)self _processSubEntityByName:v11 entity:v9 withEntityData:0];

  uint64_t v13 = [v12 objectForKey:@"resultDictionary"];

  return v13;
}

- (PLPropertyIndexMapping)initWithManagedObjectModel:(id)a3
{
  id v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)PLPropertyIndexMapping;
  id v5 = [(PLPropertyIndexMapping *)&v44 init];
  if (v5)
  {
    v35 = [v4 entitiesByName];
    uint64_t v6 = [v35 count];
    id v34 = v4;
    id v7 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v6];
    char v8 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v6];
    id v9 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v6];
    id v10 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v6];
    uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v6];
    $61A80719B04F7407D3E47539F1B23CAA v12 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v6];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __53__PLPropertyIndexMapping_initWithManagedObjectModel___block_invoke;
    v36[3] = &unk_1E586AD18;
    uint64_t v13 = v7;
    v37 = v13;
    id v14 = v5;
    v38 = v14;
    unint64_t v15 = v8;
    v39 = v15;
    v16 = v9;
    v40 = v16;
    unint64_t v17 = v10;
    v41 = v17;
    char v18 = v11;
    v42 = v18;
    id v19 = v12;
    v43 = v19;
    [v35 enumerateKeysAndObjectsUsingBlock:v36];
    indexesByAttributeNamesByEntityNames = v14->_indexesByAttributeNamesByEntityNames;
    v14->_indexesByAttributeNamesByEntityNames = v13;
    long long v21 = v13;

    attributeNamesByIndexByEntityNames = v14->_attributeNamesByIndexByEntityNames;
    v14->_attributeNamesByIndexByEntityNames = v15;
    id v23 = v15;

    transientAttributeNamesByEntityNames = v14->_transientAttributeNamesByEntityNames;
    v14->_transientAttributeNamesByEntityNames = v16;
    uint64_t v25 = v16;

    indexesByRelationshipNamesByEntityNames = v14->_indexesByRelationshipNamesByEntityNames;
    v14->_indexesByRelationshipNamesByEntityNames = v17;
    id v27 = v17;

    relationshipNamesByIndexByEntityNames = v14->_relationshipNamesByIndexByEntityNames;
    v14->_relationshipNamesByIndexByEntityNames = v18;
    id v29 = v18;

    toManyRelationshipNamesByEntityNames = v14->_toManyRelationshipNamesByEntityNames;
    v14->_toManyRelationshipNamesByEntityNames = v19;
    uint64_t v31 = v19;

    v32 = v14;
    id v4 = v34;
  }
  return v5;
}

void __53__PLPropertyIndexMapping_initWithManagedObjectModel___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v21 = a2;
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) objectForKey:v21];

  if (!v6)
  {
    id v7 = [*(id *)(a1 + 40) _processEntityByName:v21 obj:v5];
    char v8 = v7;
    if (v7)
    {
      id v9 = *(void **)(a1 + 32);
      id v10 = [v7 objectForKey:@"indexByAttrByEntity"];
      [v9 addEntriesFromDictionary:v10];

      uint64_t v11 = *(void **)(a1 + 48);
      $61A80719B04F7407D3E47539F1B23CAA v12 = [v8 objectForKey:@"attrByIndexByEntity"];
      [v11 addEntriesFromDictionary:v12];

      uint64_t v13 = *(void **)(a1 + 56);
      id v14 = [v8 objectForKey:@"transientAttrByEntity"];
      [v13 addEntriesFromDictionary:v14];

      unint64_t v15 = *(void **)(a1 + 64);
      v16 = [v8 objectForKey:@"indexByRelationByEntity"];
      [v15 addEntriesFromDictionary:v16];

      unint64_t v17 = *(void **)(a1 + 72);
      char v18 = [v8 objectForKey:@"relationByIndexByEntity"];
      [v17 addEntriesFromDictionary:v18];

      id v19 = *(void **)(a1 + 80);
      long long v20 = [v8 objectForKey:@"toManyRelationsByEntity"];
      [v19 addEntriesFromDictionary:v20];
    }
  }
}

- (PLPropertyIndexMapping)init
{
  v3 = +[PLPersistentContainer managedObjectModel];
  id v4 = [(PLPropertyIndexMapping *)self initWithManagedObjectModel:v3];

  return v4;
}

+ (void)recordChangedProperties:(id)a3 forObjectID:(id)a4 inAttributesByOID:(id)a5 relationshipsByOID:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = +[PLPropertyIndexMapping defaultMapping];
  [v13 recordChangedProperties:v12 forObjectID:v11 inAttributesByOID:v10 relationshipsByOID:v9];
}

+ (void)recordChangedKeys:(id)a3 forObjectID:(id)a4 inAttributesByOID:(id)a5 relationshipsByOID:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = +[PLPropertyIndexMapping defaultMapping];
  [v13 recordChangedKeys:v12 forObjectID:v11 inAttributesByOID:v10 relationshipsByOID:v9];
}

+ (BOOL)includesToManyRelationship:(id)a3 entity:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[PLPropertyIndexMapping defaultMapping];
  char v8 = [v7 includesToManyRelationship:v6 entity:v5];

  return v8;
}

+ (id)relationshipNamesForIndexValues:(unint64_t)a3 entity:(id)a4
{
  id v5 = a4;
  id v6 = +[PLPropertyIndexMapping defaultMapping];
  id v7 = [v6 relationshipNamesForIndexValues:a3 entity:v5];

  return v7;
}

+ (unint64_t)indexValueForRelationshipNames:(id)a3 entity:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[PLPropertyIndexMapping defaultMapping];
  unint64_t v8 = [v7 indexValueForRelationshipNames:v6 entity:v5];

  return v8;
}

+ (id)attributeNamesForIndexValues:(unint64_t)a3 entity:(id)a4
{
  id v5 = a4;
  id v6 = +[PLPropertyIndexMapping defaultMapping];
  id v7 = [v6 attributeNamesForIndexValues:a3 entity:v5];

  return v7;
}

+ (unint64_t)indexValueForAttributeNames:(id)a3 entity:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[PLPropertyIndexMapping defaultMapping];
  unint64_t v8 = [v7 indexValueForAttributeNames:v6 entity:v5];

  return v8;
}

+ (PLPropertyIndexMapping)defaultMapping
{
  pl_dispatch_once();
  v2 = (void *)defaultMapping_pl_once_object_17;
  return (PLPropertyIndexMapping *)v2;
}

void __40__PLPropertyIndexMapping_defaultMapping__block_invoke()
{
  v0 = objc_alloc_init(PLPropertyIndexMapping);
  v1 = (void *)defaultMapping_pl_once_object_17;
  defaultMapping_pl_once_object_17 = (uint64_t)v0;
}

@end