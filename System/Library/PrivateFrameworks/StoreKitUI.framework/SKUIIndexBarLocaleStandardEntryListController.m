@interface SKUIIndexBarLocaleStandardEntryListController
- (SKUIIndexBarLocaleStandardEntryListController)initWithSKUIIndexBarEntryListViewElement:(id)a3;
- (id)entryDescriptorAtIndex:(int64_t)a3;
- (id)targetIndexBarEntryIDForEntryDescriptorAtIndex:(int64_t)a3 returningRelativeSectionIndex:(int64_t *)a4;
- (int64_t)numberOfEntryDescriptors;
- (void)reloadViewElementData;
@end

@implementation SKUIIndexBarLocaleStandardEntryListController

- (SKUIIndexBarLocaleStandardEntryListController)initWithSKUIIndexBarEntryListViewElement:(id)a3
{
  id v5 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v6) {
        -[SKUIIndexBarLocaleStandardEntryListController initWithSKUIIndexBarEntryListViewElement:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  v19.receiver = self;
  v19.super_class = (Class)SKUIIndexBarLocaleStandardEntryListController;
  v14 = [(SKUIIndexBarLocaleStandardEntryListController *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_entryListViewElement, a3);
    uint64_t v16 = SKUIRequiredVisibilitySetForLocalizedIndexedCollation();
    requiredVisibilitySet = v15->_requiredVisibilitySet;
    v15->_requiredVisibilitySet = (NSSet *)v16;
  }
  return v15;
}

- (int64_t)numberOfEntryDescriptors
{
  v2 = [MEMORY[0x1E4FB1960] currentCollation];
  v3 = [v2 sectionIndexTitles];
  int64_t v4 = [v3 count];

  return v4;
}

- (id)entryDescriptorAtIndex:(int64_t)a3
{
  id v5 = [MEMORY[0x1E4FB1960] currentCollation];
  BOOL v6 = [v5 sectionIndexTitles];
  uint64_t v7 = [v6 objectAtIndex:a3];

  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v7];
  uint64_t v9 = [v8 length];
  uint64_t v10 = SKUIViewElementFontWithStyle(self->_style);
  if (v10) {
    objc_msgSend(v8, "addAttribute:value:range:", *MEMORY[0x1E4FB06F8], v10, 0, v9);
  }
  uint64_t v11 = SKUIViewElementPlainColorWithStyle(self->_style, 0);
  if (v11) {
    objc_msgSend(v8, "addAttribute:value:range:", *MEMORY[0x1E4FB0700], v11, 0, v9);
  }
  uint64_t v12 = +[SKUIIndexBarEntryDescriptor entryDescriptorWithAttributedString:v8];
  if ([(NSSet *)self->_requiredVisibilitySet containsObject:v7]) {
    [v12 setVisibilityPriority:1000];
  }

  return v12;
}

- (id)targetIndexBarEntryIDForEntryDescriptorAtIndex:(int64_t)a3 returningRelativeSectionIndex:(int64_t *)a4
{
  if (a4) {
    *a4 = 0;
  }
  id v5 = [MEMORY[0x1E4FB1960] currentCollation];
  uint64_t v6 = [v5 sectionForSectionIndexTitleAtIndex:a3];

  uint64_t v7 = [MEMORY[0x1E4FB1960] currentCollation];
  uint64_t v8 = [v7 sectionTitles];
  uint64_t v9 = [v8 objectAtIndex:v6];

  uint64_t v10 = SKUIIndexBarIDForLocaleStandardIndexBarEntrySectionTitle(v9);

  return v10;
}

- (void)reloadViewElementData
{
  v5.receiver = self;
  v5.super_class = (Class)SKUIIndexBarLocaleStandardEntryListController;
  [(SKUIIndexBarEntryListController *)&v5 reloadViewElementData];
  v3 = [(SKUIIndexBarEntryListViewElement *)self->_entryListViewElement style];
  style = self->_style;
  if (style != v3 && ([(IKViewElementStyle *)style isEqual:v3] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_style, v3);
    [(SKUIIndexBarEntryListController *)self _didInvalidate];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_requiredVisibilitySet, 0);

  objc_storeStrong((id *)&self->_entryListViewElement, 0);
}

- (void)initWithSKUIIndexBarEntryListViewElement:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end