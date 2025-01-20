@interface TKTonePickerItem
- (BOOL)needsActivityIndicator;
- (BOOL)needsDownloadProgress;
- (BOOL)needsRoomForCheckmark;
- (NSArray)childrenToneClassicsPickerItems;
- (TKTonePickerSectionItem)parentSectionItem;
- (float)downloadProgress;
- (id)childItemAtIndex:(int64_t)a3;
- (int64_t)numberOfChildren;
- (unint64_t)itemKind;
- (void)_appendDescriptionOfAttributesToString:(id)a3;
- (void)_setChildrenToneClassicsPickerItems:(id)a3;
- (void)_setDownloadProgress:(float)a3;
- (void)_setItemKind:(unint64_t)a3;
- (void)_setNeedsActivityIndicator:(BOOL)a3;
- (void)_setNeedsDownloadProgress:(BOOL)a3;
- (void)_setNeedsRoomForCheckmark:(BOOL)a3;
- (void)_setParentSectionItem:(id)a3;
@end

@implementation TKTonePickerItem

- (int64_t)numberOfChildren
{
  return [(NSArray *)self->_childrenToneClassicsPickerItems count];
}

- (id)childItemAtIndex:(int64_t)a3
{
  if ((int64_t)[(NSArray *)self->_childrenToneClassicsPickerItems count] <= a3)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(NSArray *)self->_childrenToneClassicsPickerItems objectAtIndex:a3];
  }

  return v5;
}

- (void)_appendDescriptionOfAttributesToString:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)TKTonePickerItem;
  [(TKPickerSelectableItem *)&v6 _appendDescriptionOfAttributesToString:v4];
  unint64_t v5 = [(TKTonePickerItem *)self itemKind] - 1;
  if (v5 <= 2) {
    [(TKPickerItem *)self _appendDescriptionOfAttributeNamed:@"itemKind" withStringValue:off_264589C08[v5] toString:v4];
  }
}

- (unint64_t)itemKind
{
  return self->_itemKind;
}

- (void)_setItemKind:(unint64_t)a3
{
  self->_itemKind = a3;
}

- (TKTonePickerSectionItem)parentSectionItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentSectionItem);

  return (TKTonePickerSectionItem *)WeakRetained;
}

- (void)_setParentSectionItem:(id)a3
{
}

- (BOOL)needsRoomForCheckmark
{
  return self->_needsRoomForCheckmark;
}

- (void)_setNeedsRoomForCheckmark:(BOOL)a3
{
  self->_needsRoomForCheckmark = a3;
}

- (BOOL)needsActivityIndicator
{
  return self->_needsActivityIndicator;
}

- (void)_setNeedsActivityIndicator:(BOOL)a3
{
  self->_needsActivityIndicator = a3;
}

- (BOOL)needsDownloadProgress
{
  return self->_needsDownloadProgress;
}

- (void)_setNeedsDownloadProgress:(BOOL)a3
{
  self->_needsDownloadProgress = a3;
}

- (float)downloadProgress
{
  return self->_downloadProgress;
}

- (void)_setDownloadProgress:(float)a3
{
  self->_downloadProgress = a3;
}

- (NSArray)childrenToneClassicsPickerItems
{
  return self->_childrenToneClassicsPickerItems;
}

- (void)_setChildrenToneClassicsPickerItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childrenToneClassicsPickerItems, 0);

  objc_destroyWeak((id *)&self->_parentSectionItem);
}

@end