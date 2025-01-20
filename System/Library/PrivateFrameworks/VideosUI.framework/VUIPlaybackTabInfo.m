@interface VUIPlaybackTabInfo
- (BOOL)isEqual:(id)a3;
- (BOOL)isInfoTabAllowed;
- (NSArray)tabDetails;
- (NSString)adamId;
- (NSString)canonicalId;
- (NSString)focusedTabIdOnFirstDisplay;
- (VUIPlaybackTabDetails)multiviewTabInfo;
- (VUIPlaybackTabInfo)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)insertTabDetails:(id)a3 atIndex:(unint64_t)a4;
- (void)setAdamId:(id)a3;
- (void)setCanonicalId:(id)a3;
@end

@implementation VUIPlaybackTabInfo

- (VUIPlaybackTabInfo)initWithDictionary:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)VUIPlaybackTabInfo;
  v5 = [(VUIPlaybackTabInfo *)&v44 init];
  if (v5)
  {
    v39 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v6 = objc_msgSend(v4, "vui_stringForKey:", @"canonicalId");
    v7 = (void *)v6;
    if (v6) {
      v8 = (__CFString *)v6;
    }
    else {
      v8 = &stru_1F3E921E0;
    }
    objc_storeStrong((id *)&v5->_canonicalId, v8);

    uint64_t v9 = objc_msgSend(v4, "vui_stringForKey:", @"adamId");
    v10 = (void *)v9;
    if (v9) {
      v11 = (__CFString *)v9;
    }
    else {
      v11 = &stru_1F3E921E0;
    }
    objc_storeStrong((id *)&v5->_adamId, v11);

    v12 = objc_msgSend(v4, "vui_dictionaryForKey:", @"multiView");
    v13 = v12;
    if (v12)
    {
      if (objc_msgSend(v12, "vui_BOOLForKey:defaultValue:", @"isMultiViewAllowed", 0))
      {
        v14 = +[VUIInterfaceFactory sharedInstance];
        v15 = [v14 groupActivitiesManager];
        char v16 = [v15 isSessionActive];

        if ((v16 & 1) == 0)
        {
          v17 = [[VUIPlaybackTabDetails alloc] initWithDictionary:v13];
          multiviewTabInfo = v5->_multiviewTabInfo;
          v5->_multiviewTabInfo = v17;
        }
      }
    }
    id v37 = v4;
    v19 = objc_msgSend(v4, "vui_arrayForKey:", @"tabs", v13);
    v5->_isInfoTabAllowed = 0;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id obj = v19;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v41 != v22) {
            objc_enumerationMutation(obj);
          }
          v24 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          int v25 = objc_msgSend(v24, "vui_BOOLForKey:defaultValue:", @"isMarkerShelf", 0);
          int v26 = 0;
          if (_os_feature_enabled_impl())
          {
            v27 = objc_msgSend(v24, "vui_stringForKey:", @"tabId");
            int v26 = [v27 isEqualToString:@"uts.marker.Spotlight"];
          }
          if (!v25) {
            goto LABEL_23;
          }
          v28 = objc_msgSend(v24, "vui_stringForKey:", @"markerType");
          int v29 = [v28 isEqualToString:@"Info"];

          if (v29)
          {
            v5->_isInfoTabAllowed = 1;
            continue;
          }
          if (v26)
          {
LABEL_23:
            v30 = [[VUIPlaybackTabDetails alloc] initWithDictionary:v24];
            [v39 addObject:v30];
            if ([(VUIPlaybackTabDetails *)v30 isSelected] && !v5->_focusedTabIdOnFirstDisplay)
            {
              v31 = [(VUIPlaybackTabDetails *)v30 tabId];
            }
            else
            {
              v31 = @"uts.marker.Spotlight";
              if (!v26) {
                goto LABEL_29;
              }
            }
            focusedTabIdOnFirstDisplay = v5->_focusedTabIdOnFirstDisplay;
            v5->_focusedTabIdOnFirstDisplay = &v31->isa;

LABEL_29:
            continue;
          }
        }
        uint64_t v21 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
      }
      while (v21);
    }
    uint64_t v33 = [v39 copy];
    tabDetails = v5->_tabDetails;
    v5->_tabDetails = (NSArray *)v33;

    id v4 = v37;
  }

  return v5;
}

- (void)insertTabDetails:(id)a3 atIndex:(unint64_t)a4
{
  tabDetails = self->_tabDetails;
  id v7 = a3;
  id v10 = (id)[(NSArray *)tabDetails mutableCopy];
  [v10 insertObject:v7 atIndex:a4];

  v8 = (NSArray *)[v10 copy];
  uint64_t v9 = self->_tabDetails;
  self->_tabDetails = v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(VUIPlaybackTabInfo);
  uint64_t v5 = [(NSString *)self->_canonicalId copy];
  canonicalId = v4->_canonicalId;
  v4->_canonicalId = (NSString *)v5;

  uint64_t v7 = [(NSString *)self->_adamId copy];
  adamId = v4->_adamId;
  v4->_adamId = (NSString *)v7;

  v4->_isInfoTabAllowed = self->_isInfoTabAllowed;
  objc_storeStrong((id *)&v4->_focusedTabIdOnFirstDisplay, self->_focusedTabIdOnFirstDisplay);
  uint64_t v9 = [(VUIPlaybackTabDetails *)self->_multiviewTabInfo copy];
  multiviewTabInfo = v4->_multiviewTabInfo;
  v4->_multiviewTabInfo = (VUIPlaybackTabDetails *)v9;

  uint64_t v11 = [(NSArray *)self->_tabDetails copy];
  tabDetails = v4->_tabDetails;
  v4->_tabDetails = (NSArray *)v11;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VUIPlaybackTabInfo *)a3;
  if (v4 == self)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      uint64_t v6 = [(VUIPlaybackTabInfo *)self canonicalId];
      uint64_t v7 = [(VUIPlaybackTabInfo *)v5 canonicalId];
      if ([v6 isEqualToString:v7])
      {
        v8 = [(VUIPlaybackTabInfo *)self adamId];
        uint64_t v9 = [(VUIPlaybackTabInfo *)v5 adamId];
        if ([v8 isEqualToString:v9]
          && (BOOL v10 = [(VUIPlaybackTabInfo *)self isInfoTabAllowed],
              v10 == [(VUIPlaybackTabInfo *)v5 isInfoTabAllowed]))
        {
          v12 = [(VUIPlaybackTabInfo *)self multiviewTabInfo];
          v13 = [(VUIPlaybackTabInfo *)v5 multiviewTabInfo];
          if ([v12 isEqual:v13])
          {
            char v16 = [(VUIPlaybackTabInfo *)self tabDetails];
            v14 = [(VUIPlaybackTabInfo *)v5 tabDetails];
            char v11 = [v16 isEqualToArray:v14];
          }
          else
          {
            char v11 = 0;
          }
        }
        else
        {
          char v11 = 0;
        }
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

- (NSString)canonicalId
{
  return self->_canonicalId;
}

- (void)setCanonicalId:(id)a3
{
}

- (NSString)adamId
{
  return self->_adamId;
}

- (void)setAdamId:(id)a3
{
}

- (BOOL)isInfoTabAllowed
{
  return self->_isInfoTabAllowed;
}

- (VUIPlaybackTabDetails)multiviewTabInfo
{
  return self->_multiviewTabInfo;
}

- (NSArray)tabDetails
{
  return self->_tabDetails;
}

- (NSString)focusedTabIdOnFirstDisplay
{
  return self->_focusedTabIdOnFirstDisplay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusedTabIdOnFirstDisplay, 0);
  objc_storeStrong((id *)&self->_tabDetails, 0);
  objc_storeStrong((id *)&self->_multiviewTabInfo, 0);
  objc_storeStrong((id *)&self->_adamId, 0);
  objc_storeStrong((id *)&self->_canonicalId, 0);
}

@end