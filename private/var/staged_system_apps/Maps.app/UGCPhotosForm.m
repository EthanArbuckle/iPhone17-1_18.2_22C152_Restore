@interface UGCPhotosForm
+ (id)addPhotosFormWithPlaceQuestionnaire:(id)a3 photosWithMetadata:(id)a4;
+ (id)editPhotosFormWithPlaceQuestionnaire:(id)a3 previouslySubmittedImages:(id)a4;
- (BOOL)_addPhoto:(id)a3;
- (BOOL)_isCompleteForDelete;
- (BOOL)isComplete;
- (BOOL)isEdited;
- (BOOL)isEmpty;
- (BOOL)passesMinimumRequirementsToBeSubmittable;
- (BOOL)removePhotoWithIdentifier:(id)a3;
- (NSArray)activePhotoList;
- (NSArray)addedPhotosWithMetadata;
- (NSArray)currentExistingPhotos;
- (NSArray)removedExistingPhotos;
- (UGCPhotosForm)initWithActionType:(int64_t)a3 initialPhotos:(id)a4 maximumNumberOfPhotos:(unint64_t)a5;
- (id)addedPhotos;
- (id)parentSubmissionIdentifier;
- (int64_t)actionType;
- (int64_t)indexOfPhotoWithIdentifier:(id)a3;
- (unint64_t)maximumNumberOfPhotos;
- (unint64_t)maximumNumberOfPhotosPerSubmission;
- (unint64_t)numberOfAddedPhotos;
- (void)_fillSubmissionFieldsForAddOrEdit:(id)a3;
- (void)_fillSubmissionFieldsForDelete:(id)a3;
- (void)addPhoto:(id)a3;
- (void)addPhotoListWithMetadata:(id)a3;
- (void)fillSubmissionFields:(id)a3;
- (void)setParentSubmissionIdentifier:(id)a3;
@end

@implementation UGCPhotosForm

+ (id)editPhotosFormWithPlaceQuestionnaire:(id)a3 previouslySubmittedImages:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 count])
  {
    id v8 = objc_alloc_init((Class)NSMutableArray);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v9 = v7;
    id v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v24;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          v15 = [UGCDownloadablePhoto alloc];
          v16 = -[UGCDownloadablePhoto initWithGEORPEnrichmentImage:](v15, "initWithGEORPEnrichmentImage:", v14, (void)v23);
          [v8 addObject:v16];
        }
        id v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v11);
    }

    if (MapsFeature_IsEnabled_SydneyARP()) {
      id UInteger = [v6 maximumNumberOfPhotos];
    }
    else {
      id UInteger = (id)GEOConfigGetUInteger();
    }
    id v19 = UInteger;
    v20 = [UGCPhotosForm alloc];
    id v21 = [v8 copy];
    v18 = [(UGCPhotosForm *)v20 initWithActionType:1 initialPhotos:v21 maximumNumberOfPhotos:v19];
  }
  else
  {
    v18 = [a1 addPhotosFormWithPlaceQuestionnaire:v6 photosWithMetadata:&__NSArray0__struct];
  }

  return v18;
}

+ (id)addPhotosFormWithPlaceQuestionnaire:(id)a3 photosWithMetadata:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 canCollectPhotos])
  {
    if (MapsFeature_IsEnabled_SydneyARP()) {
      id UInteger = [v5 maximumNumberOfPhotos];
    }
    else {
      id UInteger = (id)GEOConfigGetUInteger();
    }
    id v8 = [[UGCPhotosForm alloc] initWithActionType:0 initialPhotos:&__NSArray0__struct maximumNumberOfPhotos:UInteger];
    [(UGCPhotosForm *)v8 addPhotoListWithMetadata:v6];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (UGCPhotosForm)initWithActionType:(int64_t)a3 initialPhotos:(id)a4 maximumNumberOfPhotos:(unint64_t)a5
{
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)UGCPhotosForm;
  id v9 = [(UGCForm *)&v16 init];
  id v10 = v9;
  if (v9)
  {
    v9->_actionType = a3;
    id v11 = (NSMutableArray *)[v8 mutableCopy];
    activePhotoList = v10->_activePhotoList;
    v10->_activePhotoList = v11;

    v13 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    removedExistingPhotos = v10->_removedExistingPhotos;
    v10->_removedExistingPhotos = v13;

    v10->_maximumNumberOfPhotos = a5;
  }

  return v10;
}

- (void)addPhoto:(id)a3
{
  id v4 = a3;
  if (sub_1004CF958(self))
  {
    if ([(UGCPhotosForm *)self _addPhoto:v4]) {
      [(UGCForm *)self _notifyObserversOfChange];
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: numberOfPhotoSlotsAvailableForForm(self) > 0", v5, 2u);
  }
}

- (void)addPhotoListWithMetadata:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    int v7 = 0;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v4);
        }
        v7 |= [(UGCPhotosForm *)self _addPhoto:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
    if (v7) {
      [(UGCForm *)self _notifyObserversOfChange];
    }
  }
}

- (BOOL)_addPhoto:(id)a3
{
  id v4 = a3;
  if (([(NSMutableArray *)self->_activePhotoList containsObject:v4] & 1) != 0
    || MapsFeature_IsEnabled_SydneyARP()
    && (unint64_t v5 = [(UGCPhotosForm *)self numberOfAddedPhotos],
        v5 >= [(UGCPhotosForm *)self maximumNumberOfPhotos]))
  {
    BOOL v6 = 0;
  }
  else
  {
    [(NSMutableArray *)self->_activePhotoList addObject:v4];
    BOOL v6 = 1;
  }

  return v6;
}

- (BOOL)removePhotoWithIdentifier:(id)a3
{
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v5 = 24;
  BOOL v6 = self->_activePhotoList;
  int v7 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v17 = 24;
    v18 = self;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v20;
    while (2)
    {
      long long v10 = 0;
      long long v11 = &v8[(void)v7];
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v12 = *(void **)(*((void *)&v19 + 1) + 8 * (void)v10);
        long long v13 = [v12 identifier:v17, v18, v19];
        unsigned int v14 = [v13 isEqualToString:v4];

        if (v14)
        {
          int v7 = v12;
          long long v11 = &v10[(void)v8];
          goto LABEL_11;
        }
        ++v10;
      }
      while (v7 != v10);
      int v7 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      uint64_t v8 = v11;
      if (v7) {
        continue;
      }
      break;
    }
LABEL_11:
    uint64_t v5 = v17;
    self = v18;
  }
  else
  {
    long long v11 = 0;
  }

  v15 = (char *)[*(id *)((char *)&self->super.super.isa + v5) count];
  if (v11 < v15)
  {
    [*(id *)((char *)&self->super.super.isa + v5) removeObjectAtIndex:v11];
    if (v7 && [v7 needsToBeDownloaded]) {
      [(NSMutableArray *)self->_removedExistingPhotos addObject:v7];
    }
    [(UGCForm *)self _notifyObserversOfChange];
  }

  return v11 < v15;
}

- (NSArray)activePhotoList
{
  id v2 = [(NSMutableArray *)self->_activePhotoList copy];

  return (NSArray *)v2;
}

- (NSArray)addedPhotosWithMetadata
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(UGCPhotosForm *)self activePhotoList];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (([v9 needsToBeDownloaded] & 1) == 0) {
          [v3 addObject:v9];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  id v10 = [v3 copy];

  return (NSArray *)v10;
}

- (int64_t)indexOfPhotoWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(UGCPhotosForm *)self activePhotoList];
  id v6 = [v5 count];

  if (v6)
  {
    unint64_t v7 = 0;
    while (1)
    {
      uint64_t v8 = [(UGCPhotosForm *)self activePhotoList];
      uint64_t v9 = [v8 objectAtIndexedSubscript:v7];
      id v10 = [v9 identifier];
      unsigned __int8 v11 = [v10 isEqualToString:v4];

      if (v11) {
        break;
      }
      ++v7;
      long long v12 = [(UGCPhotosForm *)self activePhotoList];
      id v13 = [v12 count];

      if (v7 >= (unint64_t)v13) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (NSArray)currentExistingPhotos
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(UGCPhotosForm *)self activePhotoList];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 needsToBeDownloaded]) {
          [v3 addObject:v9];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  id v10 = [v3 copy];

  return (NSArray *)v10;
}

- (NSArray)removedExistingPhotos
{
  id v2 = [(NSMutableArray *)self->_removedExistingPhotos copy];

  return (NSArray *)v2;
}

- (unint64_t)numberOfAddedPhotos
{
  id v2 = [(UGCPhotosForm *)self addedPhotosWithMetadata];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (id)addedPhotos
{
  id v2 = [(UGCPhotosForm *)self addedPhotosWithMetadata];
  id v3 = [v2 copy];

  return v3;
}

- (BOOL)isComplete
{
  if (![(UGCPhotosForm *)self passesMinimumRequirementsToBeSubmittable]) {
    return 0;
  }
  unint64_t actionType = self->_actionType;
  if (actionType < 2)
  {
    return [(UGCPhotosForm *)self _isCompleteForAddOrEdit];
  }
  if (actionType != 2) {
    return 0;
  }

  return [(UGCPhotosForm *)self _isCompleteForDelete];
}

- (BOOL)passesMinimumRequirementsToBeSubmittable
{
  return 1;
}

- (BOOL)_isCompleteForDelete
{
  id v3 = [(UGCPhotosForm *)self activePhotoList];
  if ([v3 count]) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = [(UGCPhotosForm *)self isEdited];
  }

  return v4;
}

- (BOOL)isEmpty
{
  id v2 = [(UGCPhotosForm *)self activePhotoList];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (BOOL)isEdited
{
  BOOL v3 = [(UGCPhotosForm *)self removedExistingPhotos];
  if ([v3 count])
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [(UGCPhotosForm *)self addedPhotosWithMetadata];
    BOOL v4 = [v5 count] != 0;
  }
  return v4;
}

- (void)fillSubmissionFields:(id)a3
{
  id v4 = a3;
  unint64_t actionType = self->_actionType;
  if (actionType >= 2)
  {
    if (actionType != 2) {
      goto LABEL_6;
    }
    id v6 = v4;
    [(UGCPhotosForm *)self _fillSubmissionFieldsForDelete:v4];
  }
  else
  {
    id v6 = v4;
    [(UGCPhotosForm *)self _fillSubmissionFieldsForAddOrEdit:v4];
  }
  id v4 = v6;
LABEL_6:
}

- (void)_fillSubmissionFieldsForAddOrEdit:(id)a3
{
  id v4 = a3;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v5 = [(UGCPhotosForm *)self addedPhotosWithMetadata];
  id v6 = [v5 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v34;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v34 != v8) {
          objc_enumerationMutation(v5);
        }
        [v4 addPhoto:*(void *)(*((void *)&v33 + 1) + 8 * (void)v9)];
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v7);
  }

  id v10 = [v4 poiEnrichment];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  unsigned __int8 v11 = [(UGCPhotosForm *)self currentExistingPhotos];
  id v12 = [v11 countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v30;
    do
    {
      long long v15 = 0;
      do
      {
        if (*(void *)v30 != v14) {
          objc_enumerationMutation(v11);
        }
        objc_super v16 = [*(id *)(*((void *)&v29 + 1) + 8 * (void)v15) identifier];
        uint64_t v17 = +[GEORPImageUpdate unmodifiedImageUpdateWithImageId:v16];

        [v10 addImageUpdate:v17];
        long long v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v29 objects:v38 count:16];
    }
    while (v13);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v18 = [(UGCPhotosForm *)self removedExistingPhotos];
  id v19 = [v18 countByEnumeratingWithState:&v25 objects:v37 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v26;
    do
    {
      long long v22 = 0;
      do
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(v18);
        }
        long long v23 = [*(id *)(*((void *)&v25 + 1) + 8 * (void)v22) identifier];
        long long v24 = +[GEORPImageUpdate deleteImageUpdateWithImageId:v23];

        [v10 addImageUpdate:v24];
        long long v22 = (char *)v22 + 1;
      }
      while (v20 != v22);
      id v20 = [v18 countByEnumeratingWithState:&v25 objects:v37 count:16];
    }
    while (v20);
  }
}

- (void)_fillSubmissionFieldsForDelete:(id)a3
{
  id v4 = [a3 poiEnrichment];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v5 = [(UGCPhotosForm *)self currentExistingPhotos];
  id v6 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v23 + 1) + 8 * (void)v9) identifier];
        unsigned __int8 v11 = +[GEORPImageUpdate deleteImageUpdateWithImageId:v10];

        [v4 addImageUpdate:v11];
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v7);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v12 = [(UGCPhotosForm *)self removedExistingPhotos];
  id v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      objc_super v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = [*(id *)(*((void *)&v19 + 1) + 8 * (void)v16) identifier];
        v18 = +[GEORPImageUpdate deleteImageUpdateWithImageId:v17];

        [v4 addImageUpdate:v18];
        objc_super v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }
}

- (unint64_t)maximumNumberOfPhotosPerSubmission
{
  if (MapsFeature_IsEnabled_SydneyARP())
  {
    return [(UGCPhotosForm *)self maximumNumberOfPhotos];
  }
  else
  {
    return GEOConfigGetUInteger();
  }
}

- (int64_t)actionType
{
  return self->_actionType;
}

- (id)parentSubmissionIdentifier
{
  return self->_parentSubmissionIdentifier;
}

- (void)setParentSubmissionIdentifier:(id)a3
{
  self->_parentSubmissionIdentifier = (NSString *)a3;
}

- (unint64_t)maximumNumberOfPhotos
{
  return self->_maximumNumberOfPhotos;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedExistingPhotos, 0);

  objc_storeStrong((id *)&self->_activePhotoList, 0);
}

@end