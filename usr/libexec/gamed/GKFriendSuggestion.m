@interface GKFriendSuggestion
- (GKFriendSuggestion)initWithContactID:(id)a3 handle:(id)a4 prefixedHandle:(id)a5 contactAssociationID:(id)a6;
- (GKFriendSuggestion)initWithSuggestion:(id)a3;
- (NSString)contactAssociationID;
- (NSString)contactID;
- (NSString)handle;
- (NSString)prefixedHandle;
- (id)description;
- (void)setContactAssociationID:(id)a3;
- (void)setContactID:(id)a3;
- (void)setHandle:(id)a3;
- (void)setPrefixedHandle:(id)a3;
@end

@implementation GKFriendSuggestion

- (GKFriendSuggestion)initWithSuggestion:(id)a3
{
  id v4 = a3;
  v5 = [v4 recipients];
  id v6 = [v5 count];

  if ((unint64_t)v6 <= 1)
  {
    v8 = [v4 recipients];
    v9 = [v8 firstObject];

    if (v9)
    {
      v10 = [v9 _gkPrefixedURIHandle];
      v11 = [v9 identifier];
      v12 = [v9 handle];
      self = [(GKFriendSuggestion *)self initWithContactID:v11 handle:v12 prefixedHandle:v10 contactAssociationID:0];

      v7 = self;
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (GKFriendSuggestion)initWithContactID:(id)a3 handle:(id)a4 prefixedHandle:(id)a5 contactAssociationID:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)GKFriendSuggestion;
  v15 = [(GKFriendSuggestion *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_contactID, a3);
    objc_storeStrong((id *)&v16->_handle, a4);
    objc_storeStrong((id *)&v16->_prefixedHandle, a5);
    objc_storeStrong((id *)&v16->_contactAssociationID, a6);
  }

  return v16;
}

- (id)description
{
  if (os_log_is_debug_enabled(os_log_GKContacts))
  {
    uint64_t v3 = objc_opt_class();
    uint64_t v4 = [(GKFriendSuggestion *)self contactID];
    v5 = (void *)v4;
    if (v4) {
      CFStringRef v6 = (const __CFString *)v4;
    }
    else {
      CFStringRef v6 = @"nil";
    }
    uint64_t v7 = [(GKFriendSuggestion *)self prefixedHandle];
    v8 = (void *)v7;
    if (v7) {
      CFStringRef v9 = (const __CFString *)v7;
    }
    else {
      CFStringRef v9 = @"nil";
    }
    uint64_t v10 = [(GKFriendSuggestion *)self contactAssociationID];
    id v11 = (void *)v10;
    if (v10) {
      CFStringRef v12 = (const __CFString *)v10;
    }
    else {
      CFStringRef v12 = @"nil";
    }
    id v13 = +[NSString stringWithFormat:@"%@(%p)(contactID:%@, prefixedHandle:%@, CAID:%@)", v3, self, v6, v9, v12];
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)GKFriendSuggestion;
    id v13 = [(GKFriendSuggestion *)&v15 description];
  }

  return v13;
}

- (NSString)contactID
{
  return self->_contactID;
}

- (void)setContactID:(id)a3
{
}

- (NSString)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
}

- (NSString)prefixedHandle
{
  return self->_prefixedHandle;
}

- (void)setPrefixedHandle:(id)a3
{
}

- (NSString)contactAssociationID
{
  return self->_contactAssociationID;
}

- (void)setContactAssociationID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactAssociationID, 0);
  objc_storeStrong((id *)&self->_prefixedHandle, 0);
  objc_storeStrong((id *)&self->_handle, 0);

  objc_storeStrong((id *)&self->_contactID, 0);
}

@end