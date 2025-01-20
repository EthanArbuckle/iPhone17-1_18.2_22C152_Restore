@interface SUUIIndexBarLocaleStandardEntryListController
- (SUUIIndexBarLocaleStandardEntryListController)initWithSUUIIndexBarEntryListViewElement:(id)a3;
- (id)entryDescriptorAtIndex:(int64_t)a3;
- (id)targetIndexBarEntryIDForEntryDescriptorAtIndex:(int64_t)a3 returningRelativeSectionIndex:(int64_t *)a4;
- (int64_t)numberOfEntryDescriptors;
- (void)reloadViewElementData;
@end

@implementation SUUIIndexBarLocaleStandardEntryListController

- (SUUIIndexBarLocaleStandardEntryListController)initWithSUUIIndexBarEntryListViewElement:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SUUIIndexBarLocaleStandardEntryListController;
  v6 = [(SUUIIndexBarLocaleStandardEntryListController *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_entryListViewElement, a3);
    uint64_t v8 = SUUIRequiredVisibilitySetForLocalizedIndexedCollation();
    requiredVisibilitySet = v7->_requiredVisibilitySet;
    v7->_requiredVisibilitySet = (NSSet *)v8;
  }
  return v7;
}

- (int64_t)numberOfEntryDescriptors
{
  v2 = [MEMORY[0x263F82928] currentCollation];
  v3 = [v2 sectionIndexTitles];
  int64_t v4 = [v3 count];

  return v4;
}

- (id)entryDescriptorAtIndex:(int64_t)a3
{
  id v5 = [MEMORY[0x263F82928] currentCollation];
  v6 = [v5 sectionIndexTitles];
  v7 = [v6 objectAtIndex:a3];

  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v7];
  uint64_t v9 = [v8 length];
  v10 = SUUIViewElementFontWithStyle(self->_style);
  if (v10) {
    objc_msgSend(v8, "addAttribute:value:range:", *MEMORY[0x263F814F0], v10, 0, v9);
  }
  objc_super v11 = SUUIViewElementPlainColorWithStyle(self->_style, 0);
  if (v11) {
    objc_msgSend(v8, "addAttribute:value:range:", *MEMORY[0x263F81500], v11, 0, v9);
  }
  v12 = +[SUUIIndexBarEntryDescriptor entryDescriptorWithAttributedString:v8];
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
  id v5 = [MEMORY[0x263F82928] currentCollation];
  uint64_t v6 = [v5 sectionForSectionIndexTitleAtIndex:a3];

  v7 = [MEMORY[0x263F82928] currentCollation];
  uint64_t v8 = [v7 sectionTitles];
  uint64_t v9 = [v8 objectAtIndex:v6];

  v10 = [NSString stringWithFormat:@"systemBucketID-%@", v9];

  return v10;
}

- (void)reloadViewElementData
{
  v5.receiver = self;
  v5.super_class = (Class)SUUIIndexBarLocaleStandardEntryListController;
  [(SUUIIndexBarEntryListController *)&v5 reloadViewElementData];
  v3 = [(SUUIIndexBarEntryListViewElement *)self->_entryListViewElement style];
  style = self->_style;
  if (style != v3 && ([(IKViewElementStyle *)style isEqual:v3] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_style, v3);
    [(SUUIIndexBarEntryListController *)self _didInvalidate];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_requiredVisibilitySet, 0);
  objc_storeStrong((id *)&self->_entryListViewElement, 0);
}

@end