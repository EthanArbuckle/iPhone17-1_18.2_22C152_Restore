@interface ICMarkupUtilities(UI)
+ (id)dataToEditForAttachment:()UI includeMarkupModelData:embedMarkupModelDataInImage:;
+ (uint64_t)dataToEditForAttachment:()UI includeMarkupModelData:;
@end

@implementation ICMarkupUtilities(UI)

+ (uint64_t)dataToEditForAttachment:()UI includeMarkupModelData:
{
  return [a1 dataToEditForAttachment:a3 includeMarkupModelData:a4 embedMarkupModelDataInImage:1];
}

+ (id)dataToEditForAttachment:()UI includeMarkupModelData:embedMarkupModelDataInImage:
{
  id v8 = a3;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__73;
  v23 = __Block_byref_object_dispose__73;
  id v24 = 0;
  v9 = [v8 managedObjectContext];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __100__ICMarkupUtilities_UI__dataToEditForAttachment_includeMarkupModelData_embedMarkupModelDataInImage___block_invoke;
  v13[3] = &unk_1E5FDE070;
  id v10 = v8;
  id v14 = v10;
  v15 = &v19;
  char v17 = a4;
  uint64_t v16 = a1;
  char v18 = a5;
  [v9 performBlockAndWait:v13];

  id v11 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v11;
}

@end