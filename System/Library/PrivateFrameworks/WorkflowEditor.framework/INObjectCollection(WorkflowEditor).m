@interface INObjectCollection(WorkflowEditor)
- (id)wf_filteredCollectionUsingBlock:()WorkflowEditor;
- (id)wf_itemAtIndexPath:()WorkflowEditor;
- (uint64_t)wf_objectCount;
@end

@implementation INObjectCollection(WorkflowEditor)

- (id)wf_filteredCollectionUsingBlock:()WorkflowEditor
{
  id v4 = a3;
  v5 = [a1 sections];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __70__INObjectCollection_WorkflowEditor__wf_filteredCollectionUsingBlock___block_invoke;
  v10[3] = &unk_264BFD1F8;
  id v11 = v4;
  id v6 = v4;
  v7 = objc_msgSend(v5, "if_compactMap:", v10);

  v8 = (void *)[objc_alloc((Class)objc_opt_class()) initWithSections:v7];
  objc_msgSend(v8, "setUsesIndexedCollation:", objc_msgSend(a1, "usesIndexedCollation"));

  return v8;
}

- (id)wf_itemAtIndexPath:()WorkflowEditor
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = [v4 section];
  id v6 = [a1 sections];
  unint64_t v7 = [v6 count];

  if (v5 >= v7)
  {
    v9 = getWFEditorLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136315394;
      v18 = "-[INObjectCollection(WorkflowEditor) wf_itemAtIndexPath:]";
      __int16 v19 = 2114;
      id v20 = v4;
      _os_log_impl(&dword_23490C000, v9, OS_LOG_TYPE_ERROR, "%s Illegal indexPath (section): %{public}@", (uint8_t *)&v17, 0x16u);
    }
  }
  else
  {
    v8 = [a1 sections];
    v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v4, "section"));

    unint64_t v10 = [v4 item];
    id v11 = [v9 items];
    unint64_t v12 = [v11 count];

    if (v10 < v12)
    {
      v13 = [v9 items];
      v14 = objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));

      goto LABEL_10;
    }
    v15 = getWFEditorLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136315394;
      v18 = "-[INObjectCollection(WorkflowEditor) wf_itemAtIndexPath:]";
      __int16 v19 = 2114;
      id v20 = v4;
      _os_log_impl(&dword_23490C000, v15, OS_LOG_TYPE_ERROR, "%s Illegal indexPath (item): %{public}@", (uint8_t *)&v17, 0x16u);
    }
  }
  v14 = 0;
LABEL_10:

  return v14;
}

- (uint64_t)wf_objectCount
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v1 = [a1 sections];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __52__INObjectCollection_WorkflowEditor__wf_objectCount__block_invoke;
  v4[3] = &unk_264BFD1D0;
  v4[4] = &v5;
  [v1 enumerateObjectsUsingBlock:v4];

  uint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

@end