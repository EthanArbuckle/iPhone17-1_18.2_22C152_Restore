@interface RAPQuestion
+ (id)RAPTitle;
- (BOOL)_isParentQuestionKindOfClass:(Class)a3;
- (BOOL)isAnonymous;
- (BOOL)isComplete;
- (NSString)localizedDescription;
- (NSString)localizedTitle;
- (RAPAppStateProtocol)_context;
- (RAPAuxiliaryControlsRecording)_alternateAuxiliaryControlsRecording;
- (RAPDirectionsRecording)_alternateDirectionsRecording;
- (RAPMapStateProtocol)_alternateMapViewContext;
- (RAPMapStateProtocol)_alternatePlaceContext;
- (RAPQuestion)initWithReport:(id)a3 parentQuestion:(id)a4;
- (RAPQuestion)parentQuestion;
- (RAPReport)report;
- (UIImage)image;
- (id)_parentQuestionOfClass:(Class)a3;
- (id)_reportedPlace;
- (void)_addChildQuestion:(id)a3;
- (void)_didChange;
- (void)_prepareForSubmission;
- (void)_removeChildQuestion:(id)a3;
- (void)_removeFromParentQuestion;
- (void)_setComplete:(BOOL)a3;
- (void)_setComplete:(BOOL)a3 allowInvokingDidChange:(BOOL)a4;
- (void)addObserver:(id)a3 changeHandler:(id)a4;
- (void)removeObserver:(id)a3;
@end

@implementation RAPQuestion

+ (id)RAPTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Report an Issue" value:@"localized string not found" table:0];

  return v3;
}

- (NSString)localizedTitle
{
  v2 = objc_opt_class();

  return (NSString *)[v2 RAPTitle];
}

- (NSString)localizedDescription
{
  return 0;
}

- (UIImage)image
{
  return 0;
}

- (BOOL)isAnonymous
{
  v2 = +[UserProfileReportHistoryManager sharedInstance];
  unsigned __int8 v3 = [v2 inChina];

  if (v3) {
    return 0;
  }

  return MapsFeature_IsEnabled_RAPCommunityID();
}

- (RAPQuestion)initWithReport:(id)a3 parentQuestion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RAPQuestion;
  v8 = [(RAPQuestion *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_report, v6);
    id v10 = objc_storeWeak((id *)&v9->_parentQuestion, v7);
    [v7 _addChildQuestion:v9];
  }
  return v9;
}

- (void)_addChildQuestion:(id)a3
{
  id v4 = a3;
  children = self->_children;
  id v8 = v4;
  if (!children)
  {
    id v6 = +[NSHashTable weakObjectsHashTable];
    id v7 = self->_children;
    self->_children = v6;

    id v4 = v8;
    children = self->_children;
  }
  [(NSHashTable *)children addObject:v4];
}

- (void)_removeChildQuestion:(id)a3
{
}

- (void)_removeFromParentQuestion
{
  p_parentQuestion = &self->_parentQuestion;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentQuestion);
  [WeakRetained _removeChildQuestion:self];

  objc_storeWeak((id *)p_parentQuestion, 0);
}

- (void)addObserver:(id)a3 changeHandler:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  observers = self->_observers;
  if (!observers)
  {
    id v8 = +[NSMapTable weakToStrongObjectsMapTable];
    v9 = self->_observers;
    self->_observers = v8;

    observers = self->_observers;
  }
  id v10 = [v6 copy];
  [(NSMapTable *)observers setObject:v10 forKey:v11];
}

- (void)removeObserver:(id)a3
{
}

- (void)_didChange
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = [(NSMapTable *)self->_observers copy];
  id v4 = [v3 keyEnumerator];

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
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        id v10 = [(NSMapTable *)self->_observers objectForKey:v9];
        ((void (**)(void, RAPQuestion *, uint64_t))v10)[2](v10, self, v9);
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  id v11 = [(RAPQuestion *)self report];
  [v11 _questionDidChange:self];
}

- (void)_setComplete:(BOOL)a3
{
}

- (void)_setComplete:(BOOL)a3 allowInvokingDidChange:(BOOL)a4
{
  if (self->_complete != a3)
  {
    self->_complete = a3;
    if (a4) {
      [(RAPQuestion *)self _didChange];
    }
  }
}

- (void)_prepareForSubmission
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(NSHashTable *)self->_children allObjects];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) _prepareForSubmission];
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (RAPAppStateProtocol)_context
{
  v2 = [(RAPQuestion *)self report];
  id v3 = [v2 _context];

  return (RAPAppStateProtocol *)v3;
}

- (RAPMapStateProtocol)_alternateMapViewContext
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(NSHashTable *)self->_children allObjects];
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = [*(id *)(*((void *)&v10 + 1) + 8 * i) _alternateMapViewContext];
        if (v7)
        {
          long long v8 = (void *)v7;
          goto LABEL_11;
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  long long v8 = 0;
LABEL_11:

  return (RAPMapStateProtocol *)v8;
}

- (RAPMapStateProtocol)_alternatePlaceContext
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(NSHashTable *)self->_children allObjects];
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = [*(id *)(*((void *)&v10 + 1) + 8 * i) _alternatePlaceContext];
        if (v7)
        {
          long long v8 = (void *)v7;
          goto LABEL_11;
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  long long v8 = 0;
LABEL_11:

  return (RAPMapStateProtocol *)v8;
}

- (RAPAuxiliaryControlsRecording)_alternateAuxiliaryControlsRecording
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(NSHashTable *)self->_children allObjects];
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = [*(id *)(*((void *)&v10 + 1) + 8 * i) _alternateAuxiliaryControlsRecording];
        if (v7)
        {
          long long v8 = (void *)v7;
          goto LABEL_11;
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  long long v8 = 0;
LABEL_11:

  return (RAPAuxiliaryControlsRecording *)v8;
}

- (id)_reportedPlace
{
  v2 = self;
  id v3 = v2;
  do
  {
    id v4 = v3;
    uint64_t v5 = [v3 _alternatePlaceContext];
    id v3 = [v3 parentQuestion];
  }
  while (!v5 && v3);
  if (!v5)
  {
    uint64_t v5 = [(RAPQuestion *)v2 _context];
  }
  id v6 = [v5 reportedPlace];

  return v6;
}

- (BOOL)_isParentQuestionKindOfClass:(Class)a3
{
  p_parentQuestion = &self->_parentQuestion;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentQuestion);
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    return 1;
  }
  id v8 = objc_loadWeakRetained((id *)p_parentQuestion);
  unsigned __int8 v9 = [v8 _isParentQuestionKindOfClass:a3];

  return v9;
}

- (id)_parentQuestionOfClass:(Class)a3
{
  p_parentQuestion = &self->_parentQuestion;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentQuestion);
  char isKindOfClass = objc_opt_isKindOfClass();

  id v7 = objc_loadWeakRetained((id *)p_parentQuestion);
  id v8 = v7;
  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v9 = [v7 _parentQuestionOfClass:a3];

    id v8 = (void *)v9;
  }

  return v8;
}

- (RAPQuestion)parentQuestion
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentQuestion);

  return (RAPQuestion *)WeakRetained;
}

- (RAPReport)report
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_report);

  return (RAPReport *)WeakRetained;
}

- (BOOL)isComplete
{
  return self->_complete;
}

- (RAPDirectionsRecording)_alternateDirectionsRecording
{
  return self->__alternateDirectionsRecording;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__alternateDirectionsRecording, 0);
  objc_destroyWeak((id *)&self->_report);
  objc_destroyWeak((id *)&self->_parentQuestion);
  objc_storeStrong((id *)&self->_children, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end