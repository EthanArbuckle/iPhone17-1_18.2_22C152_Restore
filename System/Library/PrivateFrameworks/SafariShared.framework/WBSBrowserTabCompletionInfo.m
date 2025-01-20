@interface WBSBrowserTabCompletionInfo
- (NSString)tabGroupTitle;
- (NSString)title;
- (NSURL)url;
- (NSUUID)tabGroupUUID;
- (NSUUID)uuid;
- (NSUUID)windowUUID;
- (WBSBrowserTabCompletionInfo)initWithUUID:(id)a3 windowUUID:(id)a4 tabGroupUUID:(id)a5 tabGroupTitle:(id)a6 tabIndex:(unint64_t)a7 url:(id)a8 title:(id)a9 pageStatus:(int64_t)a10;
- (WBSBrowserTabCompletionInfo)initWithUUID:(id)a3 windowUUID:(id)a4 tabIndex:(unint64_t)a5 url:(id)a6 title:(id)a7;
- (int64_t)pageStatus;
- (unint64_t)tabIndex;
@end

@implementation WBSBrowserTabCompletionInfo

- (WBSBrowserTabCompletionInfo)initWithUUID:(id)a3 windowUUID:(id)a4 tabIndex:(unint64_t)a5 url:(id)a6 title:(id)a7
{
  return [(WBSBrowserTabCompletionInfo *)self initWithUUID:a3 windowUUID:a4 tabGroupUUID:0 tabGroupTitle:0 tabIndex:a5 url:a6 title:a7 pageStatus:0];
}

- (WBSBrowserTabCompletionInfo)initWithUUID:(id)a3 windowUUID:(id)a4 tabGroupUUID:(id)a5 tabGroupTitle:(id)a6 tabIndex:(unint64_t)a7 url:(id)a8 title:(id)a9 pageStatus:(int64_t)a10
{
  id v30 = a3;
  id v29 = a4;
  id v28 = a5;
  id v17 = a6;
  id v18 = a8;
  id v19 = a9;
  v31.receiver = self;
  v31.super_class = (Class)WBSBrowserTabCompletionInfo;
  v20 = [(WBSBrowserTabCompletionInfo *)&v31 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_uuid, a3);
    objc_storeStrong((id *)&v21->_windowUUID, a4);
    objc_storeStrong((id *)&v21->_tabGroupUUID, a5);
    uint64_t v22 = [v17 copy];
    tabGroupTitle = v21->_tabGroupTitle;
    v21->_tabGroupTitle = (NSString *)v22;

    v21->_tabIndex = a7;
    objc_storeStrong((id *)&v21->_url, a8);
    uint64_t v24 = [v19 copy];
    title = v21->_title;
    v21->_title = (NSString *)v24;

    v21->_pageStatus = a10;
    v26 = v21;
  }

  return v21;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSUUID)windowUUID
{
  return self->_windowUUID;
}

- (NSUUID)tabGroupUUID
{
  return self->_tabGroupUUID;
}

- (NSString)tabGroupTitle
{
  return self->_tabGroupTitle;
}

- (unint64_t)tabIndex
{
  return self->_tabIndex;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)title
{
  return self->_title;
}

- (int64_t)pageStatus
{
  return self->_pageStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_tabGroupTitle, 0);
  objc_storeStrong((id *)&self->_tabGroupUUID, 0);
  objc_storeStrong((id *)&self->_windowUUID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end