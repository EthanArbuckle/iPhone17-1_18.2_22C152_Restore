@interface PXCollectionSortOrderUtilities
+ (BOOL)supportsFetchSortOrder:(int64_t)a3 inCollection:(id)a4;
+ (BOOL)userCanChangeSortOrderInCollection:(id)a3;
+ (int64_t)_sortOrderFromCollection:(id)a3 sortKey:(unsigned int)a4;
+ (int64_t)sortOrderFromCollection:(id)a3 isAscending:(BOOL *)a4;
@end

@implementation PXCollectionSortOrderUtilities

+ (BOOL)userCanChangeSortOrderInCollection:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v8 = 0;
    goto LABEL_15;
  }
  id v6 = v5;
  if (!v6)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    [v13 handleFailureInMethod:a2, a1, @"PXCollectionSortOrderUtilities.m", 68, @"%@ should be an instance inheriting from %@, but it is nil", @"collection", v15 object file lineNumber description];
LABEL_18:

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    v16 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v16);
    v17 = objc_msgSend(v6, "px_descriptionForAssertionMessage");
    [v13 handleFailureInMethod:a2, a1, @"PXCollectionSortOrderUtilities.m", 68, @"%@ should be an instance inheriting from %@, but it is %@", @"collection", v15, v17 object file lineNumber description];

    goto LABEL_18;
  }
LABEL_4:
  BOOL v7 = [v6 assetCollectionType] == 2 && objc_msgSend(v6, "assetCollectionSubtype") == 1000000204;
  char v9 = objc_msgSend(v6, "px_isSharedAlbum");
  if ([v6 canPerformEditOperation:5]) {
    BOOL v10 = (unint64_t)[v6 estimatedAssetCount] > 1;
  }
  else {
    BOOL v10 = 0;
  }
  char v11 = v9 | v10;
  if (v7) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v11;
  }

LABEL_15:
  return v8;
}

+ (BOOL)supportsFetchSortOrder:(int64_t)a3 inCollection:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if ((unint64_t)(a3 - 1) < 2)
  {
    char v8 = objc_msgSend(v5, "px_isRegularAlbum");
LABEL_8:
    BOOL v7 = v8;
    goto LABEL_10;
  }
  if (a3 == 4) {
    goto LABEL_7;
  }
  if (a3 != 3)
  {
    BOOL v7 = 0;
    goto LABEL_10;
  }
  if ((objc_msgSend(v5, "px_isRegularAlbum") & 1) == 0)
  {
LABEL_7:
    char v8 = objc_msgSend(v6, "px_isSharedAlbum");
    goto LABEL_8;
  }
  BOOL v7 = 1;
LABEL_10:

  return v7;
}

+ (int64_t)_sortOrderFromCollection:(id)a3 sortKey:(unsigned int)a4
{
  id v5 = a3;
  id v6 = v5;
  int64_t v7 = 3;
  switch(a4)
  {
    case 0u:
      if (objc_msgSend(v5, "px_isSharedAlbum")) {
        int64_t v7 = 4;
      }
      else {
        int64_t v7 = 1;
      }
      break;
    case 1u:
      break;
    case 2u:
    case 4u:
    case 5u:
      goto LABEL_2;
    case 3u:
      int64_t v7 = 2;
      break;
    default:
      if (a4 == 101) {
LABEL_2:
      }
        int64_t v7 = 0;
      break;
  }

  return v7;
}

+ (int64_t)sortOrderFromCollection:(id)a3 isAscending:(BOOL *)a4
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    char v8 = [v7 customSortAscending];
    uint64_t v9 = [v7 customSortKey];
  }
  else
  {
    char v8 = 0;
    uint64_t v9 = 1;
  }
  int64_t v10 = [a1 _sortOrderFromCollection:v6 sortKey:v9];
  if (a4) {
    *a4 = v8;
  }

  return v10;
}

@end