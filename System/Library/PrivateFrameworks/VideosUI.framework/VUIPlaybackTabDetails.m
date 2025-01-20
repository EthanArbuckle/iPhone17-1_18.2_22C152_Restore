@interface VUIPlaybackTabDetails
- (BOOL)isEqual:(id)a3;
- (BOOL)isSelected;
- (NSString)tabId;
- (NSString)title;
- (VUIPlaybackTabDetails)initWithDictionary:(id)a3;
- (VUIPlaybackTabDetails)initWithTabId:(id)a3 andTitle:(id)a4 isSelected:(BOOL)a5;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation VUIPlaybackTabDetails

- (VUIPlaybackTabDetails)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VUIPlaybackTabDetails;
  v5 = [(VUIPlaybackTabDetails *)&v13 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "vui_stringForKey:", @"title");
    v7 = (void *)v6;
    if (v6) {
      v8 = (__CFString *)v6;
    }
    else {
      v8 = &stru_1F3E921E0;
    }
    objc_storeStrong((id *)&v5->_title, v8);

    uint64_t v9 = objc_msgSend(v4, "vui_stringForKey:", @"tabId");
    v10 = (void *)v9;
    if (v9) {
      v11 = (__CFString *)v9;
    }
    else {
      v11 = &stru_1F3E921E0;
    }
    objc_storeStrong((id *)&v5->_tabId, v11);

    v5->_isSelected = objc_msgSend(v4, "vui_BOOLForKey:defaultValue:", @"isSelected", 0);
  }

  return v5;
}

- (VUIPlaybackTabDetails)initWithTabId:(id)a3 andTitle:(id)a4 isSelected:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)VUIPlaybackTabDetails;
  v11 = [(VUIPlaybackTabDetails *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_title, a4);
    objc_storeStrong((id *)&v12->_tabId, a3);
    v12->_isSelected = a5;
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(VUIPlaybackTabDetails);
  uint64_t v5 = [(NSString *)self->_title copy];
  title = v4->_title;
  v4->_title = (NSString *)v5;

  uint64_t v7 = [(NSString *)self->_tabId copy];
  tabId = v4->_tabId;
  v4->_tabId = (NSString *)v7;

  v4->_isSelected = self->_isSelected;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VUIPlaybackTabDetails *)a3;
  if (v4 == self)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      uint64_t v6 = [(VUIPlaybackTabDetails *)self title];
      uint64_t v7 = [(VUIPlaybackTabDetails *)v5 title];
      if ([v6 isEqualToString:v7])
      {
        v8 = [(VUIPlaybackTabDetails *)self tabId];
        id v9 = [(VUIPlaybackTabDetails *)v5 tabId];
        char v10 = [v8 isEqualToString:v9];
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (NSString)tabId
{
  return self->_tabId;
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)isSelected
{
  return self->_isSelected;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_tabId, 0);
}

@end