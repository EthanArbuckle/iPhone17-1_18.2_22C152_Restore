@interface PXAssistantListViewItem
+ (id)itemWithTag:(int64_t)a3 title:(id)a4 enabled:(BOOL)a5;
+ (id)itemWithTitle:(id)a3;
+ (id)navigationItemWithTag:(int64_t)a3 title:(id)a4 subtitle:(id)a5 enabled:(BOOL)a6;
+ (id)ruleItemWithTag:(int64_t)a3 title:(id)a4 subtitle:(id)a5 detail:(id)a6 systemImageName:(id)a7 enabled:(BOOL)a8;
+ (id)selectionItemWithTag:(int64_t)a3 title:(id)a4 subtitle:(id)a5 selected:(BOOL)a6 enabled:(BOOL)a7;
- (BOOL)enabled;
- (BOOL)selected;
- (NSString)detail;
- (NSString)subtitle;
- (NSString)systemImageName;
- (NSString)title;
- (PXAssistantListViewItem)init;
- (PXAssistantListViewItem)initWithType:(int64_t)a3 tag:(int64_t)a4 representedObject:(id)a5 title:(id)a6 subtitle:(id)a7 detail:(id)a8 systemImageName:(id)a9 selected:(BOOL)a10 enabled:(BOOL)a11;
- (id)representedObject;
- (int64_t)tag;
- (int64_t)type;
@end

@implementation PXAssistantListViewItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detail, 0);
  objc_storeStrong((id *)&self->_systemImageName, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong(&self->_representedObject, 0);
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (BOOL)selected
{
  return self->_selected;
}

- (NSString)detail
{
  return self->_detail;
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)title
{
  return self->_title;
}

- (id)representedObject
{
  return self->_representedObject;
}

- (int64_t)tag
{
  return self->_tag;
}

- (int64_t)type
{
  return self->_type;
}

- (PXAssistantListViewItem)initWithType:(int64_t)a3 tag:(int64_t)a4 representedObject:(id)a5 title:(id)a6 subtitle:(id)a7 detail:(id)a8 systemImageName:(id)a9 selected:(BOOL)a10 enabled:(BOOL)a11
{
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  if (!v20)
  {
    v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, self, @"PXAssistantListViewItem.m", 27, @"Invalid parameter not satisfying: %@", @"title" object file lineNumber description];
  }
  v36.receiver = self;
  v36.super_class = (Class)PXAssistantListViewItem;
  v24 = [(PXAssistantListViewItem *)&v36 init];
  v25 = v24;
  if (v24)
  {
    v24->_type = a3;
    v24->_tag = a4;
    objc_storeStrong(&v24->_representedObject, a5);
    uint64_t v26 = [v20 copy];
    title = v25->_title;
    v25->_title = (NSString *)v26;

    uint64_t v28 = [v21 copy];
    subtitle = v25->_subtitle;
    v25->_subtitle = (NSString *)v28;

    uint64_t v30 = [v22 copy];
    detail = v25->_detail;
    v25->_detail = (NSString *)v30;

    uint64_t v32 = [v23 copy];
    systemImageName = v25->_systemImageName;
    v25->_systemImageName = (NSString *)v32;

    v25->_selected = a10;
    v25->_enabled = a11;
  }

  return v25;
}

- (PXAssistantListViewItem)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXAssistantListViewItem.m", 23, @"%s is not available as initializer", "-[PXAssistantListViewItem init]");

  abort();
}

+ (id)ruleItemWithTag:(int64_t)a3 title:(id)a4 subtitle:(id)a5 detail:(id)a6 systemImageName:(id)a7 enabled:(BOOL)a8
{
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  BYTE1(v20) = a8;
  LOBYTE(v20) = 0;
  v18 = objc_msgSend(objc_alloc((Class)a1), "initWithType:tag:representedObject:title:subtitle:detail:systemImageName:selected:enabled:", 4, a3, 0, v17, v16, v15, v14, v20);

  return v18;
}

+ (id)navigationItemWithTag:(int64_t)a3 title:(id)a4 subtitle:(id)a5 enabled:(BOOL)a6
{
  id v10 = a5;
  id v11 = a4;
  BYTE1(v14) = a6;
  LOBYTE(v14) = 0;
  v12 = objc_msgSend(objc_alloc((Class)a1), "initWithType:tag:representedObject:title:subtitle:detail:systemImageName:selected:enabled:", 2, a3, 0, v11, v10, 0, 0, v14);

  return v12;
}

+ (id)selectionItemWithTag:(int64_t)a3 title:(id)a4 subtitle:(id)a5 selected:(BOOL)a6 enabled:(BOOL)a7
{
  id v12 = a5;
  id v13 = a4;
  BYTE1(v16) = a7;
  LOBYTE(v16) = a6;
  uint64_t v14 = objc_msgSend(objc_alloc((Class)a1), "initWithType:tag:representedObject:title:subtitle:detail:systemImageName:selected:enabled:", 1, a3, 0, v13, v12, 0, 0, v16);

  return v14;
}

+ (id)itemWithTag:(int64_t)a3 title:(id)a4 enabled:(BOOL)a5
{
  id v8 = a4;
  BYTE1(v11) = a5;
  LOBYTE(v11) = 0;
  v9 = objc_msgSend(objc_alloc((Class)a1), "initWithType:tag:representedObject:title:subtitle:detail:systemImageName:selected:enabled:", 0, a3, 0, v8, 0, 0, 0, v11);

  return v9;
}

+ (id)itemWithTitle:(id)a3
{
  id v4 = a3;
  LOWORD(v7) = 256;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithType:tag:representedObject:title:subtitle:detail:systemImageName:selected:enabled:", 0, 0, 0, v4, 0, 0, 0, v7);

  return v5;
}

@end