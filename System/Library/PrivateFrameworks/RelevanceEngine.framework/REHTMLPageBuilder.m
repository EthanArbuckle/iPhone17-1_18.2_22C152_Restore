@interface REHTMLPageBuilder
+ (id)_bodyElement;
+ (id)_docTypeElement;
+ (id)_headElement;
+ (id)_htmlElement;
+ (id)_iosIcon;
+ (id)_largeFavicon;
+ (id)_mainNavigationElement;
+ (id)_safariIcon;
+ (id)_scriptElementWithLocation:(id)a3;
+ (id)_smallFavicon;
+ (id)_stylesheetElementWithLocation:(id)a3;
+ (id)_viewportElement;
- (NSArray)links;
- (NSArray)loadingScripts;
- (NSArray)stylesheets;
- (NSString)pageDescription;
- (REHTMLPageBuilder)init;
- (id)pageWithTitle:(id)a3 content:(id)a4 backLocation:(id)a5;
- (void)setLinks:(id)a3;
- (void)setLoadingScripts:(id)a3;
- (void)setPageDescription:(id)a3;
- (void)setStylesheets:(id)a3;
@end

@implementation REHTMLPageBuilder

+ (id)_docTypeElement
{
  if (_docTypeElement_onceToken != -1) {
    dispatch_once(&_docTypeElement_onceToken, &__block_literal_global_17);
  }
  v2 = (void *)_docTypeElement_Element;
  return v2;
}

uint64_t __36__REHTMLPageBuilder__docTypeElement__block_invoke()
{
  uint64_t v0 = +[REHTMLElement elementWithHTMLString:@"<!DOCTYPE html>"];
  uint64_t v1 = _docTypeElement_Element;
  _docTypeElement_Element = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (id)_htmlElement
{
  if (_htmlElement_onceToken != -1) {
    dispatch_once(&_htmlElement_onceToken, &__block_literal_global_17);
  }
  v2 = (void *)_htmlElement_Element;
  return v2;
}

uint64_t __33__REHTMLPageBuilder__htmlElement__block_invoke()
{
  uint64_t v0 = +[REHTMLElement htmlElementWithTag:@"html" content:&stru_26CFA57D0];
  uint64_t v1 = _htmlElement_Element;
  _htmlElement_Element = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (id)_headElement
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__REHTMLPageBuilder__headElement__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_headElement_onceToken != -1) {
    dispatch_once(&_headElement_onceToken, block);
  }
  v2 = (void *)_headElement_Element;
  return v2;
}

void __33__REHTMLPageBuilder__headElement__block_invoke(uint64_t a1)
{
  v2 = +[REHTMLElement htmlElementWithTag:@"meta" content:0];
  id v30 = [v2 elementByAddingAtttibute:@"charset" value:@"utf-8"];

  v3 = +[REHTMLElement htmlElementWithTag:@"head" content:&stru_26CFA57D0];
  uint64_t v4 = [v3 addChild:v30];
  v5 = (void *)_headElement_Element;
  _headElement_Element = v4;

  v6 = (void *)_headElement_Element;
  v7 = [*(id *)(a1 + 32) _viewportElement];
  uint64_t v8 = [v6 addChild:v7];
  v9 = (void *)_headElement_Element;
  _headElement_Element = v8;

  v10 = (void *)_headElement_Element;
  v11 = [*(id *)(a1 + 32) _iosIcon];
  uint64_t v12 = [v10 addChild:v11];
  v13 = (void *)_headElement_Element;
  _headElement_Element = v12;

  v14 = (void *)_headElement_Element;
  v15 = [*(id *)(a1 + 32) _smallFavicon];
  uint64_t v16 = [v14 addChild:v15];
  v17 = (void *)_headElement_Element;
  _headElement_Element = v16;

  v18 = (void *)_headElement_Element;
  v19 = [*(id *)(a1 + 32) _largeFavicon];
  uint64_t v20 = [v18 addChild:v19];
  v21 = (void *)_headElement_Element;
  _headElement_Element = v20;

  v22 = (void *)_headElement_Element;
  v23 = [*(id *)(a1 + 32) _safariIcon];
  uint64_t v24 = [v22 addChild:v23];
  v25 = (void *)_headElement_Element;
  _headElement_Element = v24;

  v26 = +[REHTMLElement htmlElementWithTag:@"meta" content:0];
  v27 = [v26 elementByAddingAtttibutes:&unk_26CFCD7A0];

  uint64_t v28 = [(id)_headElement_Element addChild:v27];
  v29 = (void *)_headElement_Element;
  _headElement_Element = v28;
}

+ (id)_stylesheetElementWithLocation:(id)a3
{
  uint64_t v3 = _stylesheetElementWithLocation__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_stylesheetElementWithLocation__onceToken, &__block_literal_global_51);
  }
  v5 = [(id)_stylesheetElementWithLocation__Element elementByAddingAtttibute:@"href" value:v4];

  return v5;
}

uint64_t __52__REHTMLPageBuilder__stylesheetElementWithLocation___block_invoke()
{
  uint64_t v0 = +[REHTMLElement htmlElementWithTag:@"link" content:0];
  uint64_t v1 = (void *)_stylesheetElementWithLocation__Element;
  _stylesheetElementWithLocation__Element = v0;

  uint64_t v2 = [(id)_stylesheetElementWithLocation__Element elementByAddingAtttibute:@"rel" value:@"stylesheet"];
  uint64_t v3 = _stylesheetElementWithLocation__Element;
  _stylesheetElementWithLocation__Element = v2;
  return MEMORY[0x270F9A758](v2, v3);
}

+ (id)_scriptElementWithLocation:(id)a3
{
  uint64_t v3 = _scriptElementWithLocation__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_scriptElementWithLocation__onceToken, &__block_literal_global_65);
  }
  v5 = [(id)_scriptElementWithLocation__Element elementByAddingAtttibute:@"src" value:v4];

  return v5;
}

uint64_t __48__REHTMLPageBuilder__scriptElementWithLocation___block_invoke()
{
  uint64_t v0 = +[REHTMLElement htmlElementWithTag:@"script" content:&stru_26CFA57D0];
  uint64_t v1 = _scriptElementWithLocation__Element;
  _scriptElementWithLocation__Element = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (id)_bodyElement
{
  if (_bodyElement_onceToken != -1) {
    dispatch_once(&_bodyElement_onceToken, &__block_literal_global_73);
  }
  uint64_t v2 = (void *)_bodyElement_Element;
  return v2;
}

uint64_t __33__REHTMLPageBuilder__bodyElement__block_invoke()
{
  uint64_t v0 = +[REHTMLElement htmlElementWithTag:@"body" content:&stru_26CFA57D0];
  uint64_t v1 = (void *)_bodyElement_Element;
  _bodyElement_Element = v0;

  uint64_t v2 = [(id)_bodyElement_Element elementByAddingAtttibute:@"onload" value:@"pageDidLoad();"];
  uint64_t v3 = _bodyElement_Element;
  _bodyElement_Element = v2;
  return MEMORY[0x270F9A758](v2, v3);
}

+ (id)_mainNavigationElement
{
  if (_mainNavigationElement_onceToken != -1) {
    dispatch_once(&_mainNavigationElement_onceToken, &__block_literal_global_84);
  }
  uint64_t v2 = (void *)_mainNavigationElement_Element;
  return v2;
}

void __43__REHTMLPageBuilder__mainNavigationElement__block_invoke()
{
  id v2 = +[REHTMLElement nav];
  uint64_t v0 = [v2 elementByAddingClass:@"main_nav"];
  uint64_t v1 = (void *)_mainNavigationElement_Element;
  _mainNavigationElement_Element = v0;
}

+ (id)_viewportElement
{
  id v2 = +[REHTMLElement htmlElementWithTag:@"meta" content:0];
  uint64_t v3 = [v2 elementByAddingAtttibutes:&unk_26CFCD7C8];

  return v3;
}

+ (id)_iosIcon
{
  id v2 = +[REHTMLElement htmlElementWithTag:@"link" content:0];
  uint64_t v3 = [v2 elementByAddingAtttibutes:&unk_26CFCD7F0];

  return v3;
}

+ (id)_smallFavicon
{
  id v2 = +[REHTMLElement htmlElementWithTag:@"link" content:0];
  uint64_t v3 = [v2 elementByAddingAtttibutes:&unk_26CFCD818];

  return v3;
}

+ (id)_largeFavicon
{
  id v2 = +[REHTMLElement htmlElementWithTag:@"link" content:0];
  uint64_t v3 = [v2 elementByAddingAtttibutes:&unk_26CFCD840];

  return v3;
}

+ (id)_safariIcon
{
  id v2 = +[REHTMLElement htmlElementWithTag:@"link" content:0];
  uint64_t v3 = [v2 elementByAddingAtttibutes:&unk_26CFCD868];

  return v3;
}

- (REHTMLPageBuilder)init
{
  v6.receiver = self;
  v6.super_class = (Class)REHTMLPageBuilder;
  id v2 = [(REHTMLPageBuilder *)&v6 init];
  uint64_t v3 = v2;
  if (v2)
  {
    [(REHTMLPageBuilder *)v2 setPageDescription:&stru_26CFA57D0];
    uint64_t v4 = MEMORY[0x263EFFA68];
    [(REHTMLPageBuilder *)v3 setStylesheets:MEMORY[0x263EFFA68]];
    [(REHTMLPageBuilder *)v3 setLinks:v4];
    [(REHTMLPageBuilder *)v3 setLoadingScripts:v4];
  }
  return v3;
}

- (void)setStylesheets:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v5 = (NSArray *)a3;
  objc_super v6 = self->_stylesheets;
  if (v6 == v5)
  {
  }
  else
  {
    v7 = v6;
    char v8 = [(NSArray *)v5 isEqual:v6];

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_stylesheets, a3);
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      v9 = v5;
      uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        id v12 = 0;
        uint64_t v13 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v22 != v13) {
              objc_enumerationMutation(v9);
            }
            v15 = [(id)objc_opt_class() _stylesheetElementWithLocation:*(void *)(*((void *)&v21 + 1) + 8 * i)];
            uint64_t v16 = v15;
            if (v12)
            {
              uint64_t v17 = [v12 append:v15];

              id v12 = (id)v17;
            }
            else
            {
              id v12 = v15;
            }
          }
          uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v11);

        if (v12) {
          goto LABEL_18;
        }
      }
      else
      {
      }
      id v12 = +[REHTMLElement elementWithHTMLString:&stru_26CFA57D0];
LABEL_18:
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __36__REHTMLPageBuilder_setStylesheets___block_invoke;
      v19[3] = &unk_2644BC688;
      v19[4] = self;
      id v20 = v12;
      id v18 = v12;
      REHTMLElementAccessLock(v19);
    }
  }
}

void __36__REHTMLPageBuilder_setStylesheets___block_invoke(uint64_t a1)
{
}

- (void)setLoadingScripts:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v5 = (NSArray *)a3;
  objc_super v6 = self->_loadingScripts;
  if (v6 == v5)
  {
  }
  else
  {
    v7 = v6;
    char v8 = [(NSArray *)v5 isEqual:v6];

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_loadingScripts, a3);
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      v9 = v5;
      uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        id v12 = 0;
        uint64_t v13 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v22 != v13) {
              objc_enumerationMutation(v9);
            }
            v15 = [(id)objc_opt_class() _scriptElementWithLocation:*(void *)(*((void *)&v21 + 1) + 8 * i)];
            uint64_t v16 = v15;
            if (v12)
            {
              uint64_t v17 = [v12 append:v15];

              id v12 = (id)v17;
            }
            else
            {
              id v12 = v15;
            }
          }
          uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v11);

        if (v12) {
          goto LABEL_18;
        }
      }
      else
      {
      }
      id v12 = +[REHTMLElement elementWithHTMLString:&stru_26CFA57D0];
LABEL_18:
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __39__REHTMLPageBuilder_setLoadingScripts___block_invoke;
      v19[3] = &unk_2644BC688;
      v19[4] = self;
      id v20 = v12;
      id v18 = v12;
      REHTMLElementAccessLock(v19);
    }
  }
}

void __39__REHTMLPageBuilder_setLoadingScripts___block_invoke(uint64_t a1)
{
}

- (void)setPageDescription:(id)a3
{
  uint64_t v4 = (NSString *)a3;
  v5 = self->_pageDescription;
  if (v5 == v4)
  {
  }
  else
  {
    objc_super v6 = v5;
    uint64_t v4 = v4;
    char v7 = [(NSString *)v4 isEqual:v6];

    if ((v7 & 1) == 0)
    {
      pageDescription = self->_pageDescription;
      self->_pageDescription = v4;
      v9 = v4;

      uint64_t v10 = &stru_26CFA57D0;
      if (v9) {
        uint64_t v10 = (__CFString *)v9;
      }
      uint64_t v4 = v10;

      uint64_t v11 = +[REHTMLElement htmlElementWithTag:@"meta" content:0];
      id v12 = [v11 elementByAddingAtttibute:@"name" value:@"description"];

      uint64_t v13 = [v12 elementByAddingAtttibute:@"content" value:v4];

      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __40__REHTMLPageBuilder_setPageDescription___block_invoke;
      v15[3] = &unk_2644BC688;
      v15[4] = self;
      id v16 = v13;
      id v14 = v13;
      REHTMLElementAccessLock(v15);
    }
  }
}

void __40__REHTMLPageBuilder_setPageDescription___block_invoke(uint64_t a1)
{
}

- (void)setLinks:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v5 = (NSArray *)a3;
  objc_super v6 = self->_links;
  if (v6 == v5)
  {

    goto LABEL_21;
  }
  char v7 = v6;
  char v8 = [(NSArray *)v5 isEqual:v6];

  if ((v8 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_links, a3);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v9 = v5;
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (!v10)
    {

      goto LABEL_19;
    }
    uint64_t v11 = v10;
    long long v24 = self;
    v25 = v5;
    id v12 = 0;
    uint64_t v13 = *(void *)v29;
    while (1)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(v9);
        }
        v15 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v16 = objc_msgSend(v15, "location", v24, v25);
        uint64_t v17 = [v15 title];
        id v18 = +[REHTMLElement link:v16 title:v17];

        v19 = [v15 location];
        uint64_t v20 = [v19 length];

        if (v20)
        {
          if (v12) {
            goto LABEL_10;
          }
        }
        else
        {
          uint64_t v22 = [v18 elementByAddingClass:@"no-highlight"];

          id v18 = (void *)v22;
          if (v12)
          {
LABEL_10:
            uint64_t v21 = [v12 append:v18];

            id v12 = (void *)v21;
            goto LABEL_13;
          }
        }
        id v12 = [v18 elementByAddingClass:@"main"];
LABEL_13:
      }
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (!v11)
      {

        self = v24;
        v5 = v25;
        if (!v12)
        {
LABEL_19:
          id v12 = +[REHTMLElement elementWithHTMLString:&stru_26CFA57D0];
        }
        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = __30__REHTMLPageBuilder_setLinks___block_invoke;
        v26[3] = &unk_2644BC688;
        v26[4] = self;
        id v27 = v12;
        id v23 = v12;
        REHTMLElementAccessLock(v26);

        break;
      }
    }
  }
LABEL_21:
}

void __30__REHTMLPageBuilder_setLinks___block_invoke(uint64_t a1)
{
}

- (id)pageWithTitle:(id)a3 content:(id)a4 backLocation:(id)a5
{
  v71[2] = *MEMORY[0x263EF8340];
  char v8 = (__CFString *)a3;
  id v45 = a4;
  id v9 = a5;
  if (![(__CFString *)v8 length])
  {

    char v8 = 0;
  }
  v44 = v9;
  if (!v45)
  {
    id v45 = +[REHTMLElement elementWithHTMLString:&stru_26CFA57D0];
  }
  uint64_t v65 = 0;
  v66 = &v65;
  uint64_t v67 = 0x3032000000;
  v68 = __Block_byref_object_copy__6;
  v69 = __Block_byref_object_dispose__6;
  id v70 = 0;
  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__6;
  v63 = __Block_byref_object_dispose__6;
  id v64 = 0;
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__6;
  v57 = __Block_byref_object_dispose__6;
  id v58 = 0;
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__6;
  v51 = __Block_byref_object_dispose__6;
  id v52 = 0;
  v46[0] = MEMORY[0x263EF8330];
  v46[1] = 3221225472;
  v46[2] = __56__REHTMLPageBuilder_pageWithTitle_content_backLocation___block_invoke;
  v46[3] = &unk_2644BDA68;
  v46[4] = self;
  v46[5] = &v65;
  v46[6] = &v59;
  v46[7] = &v53;
  v46[8] = &v47;
  REHTMLElementAccessLock(v46);
  uint64_t v10 = [(id)objc_opt_class() _headElement];
  uint64_t v11 = v66[5];
  v71[0] = v54[5];
  v71[1] = v11;
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v71 count:2];
  uint64_t v13 = [v10 addChildren:v12];

  if (v8) {
    id v14 = v8;
  }
  else {
    id v14 = @"Relevance Engine";
  }
  uint64_t v15 = +[REHTMLElement htmlElementWithTag:@"title" content:v14];
  id v16 = [v13 addChild:v15];
  uint64_t v42 = v15;

  uint64_t v17 = [(id)objc_opt_class() _htmlElement];
  id v18 = [v17 addChild:v16];

  v19 = [v18 addChild:v60[5]];

  uint64_t v20 = [(id)objc_opt_class() _bodyElement];
  uint64_t v21 = [(id)objc_opt_class() _mainNavigationElement];
  uint64_t v22 = [v21 addChild:v48[5]];

  id v23 = [v20 addChild:v22];

  long long v24 = +[REHTMLElement div];
  v25 = [v24 elementByAddingClass:@"content"];

  uint64_t v26 = [v25 elementByAddingAtttibute:@"id" value:@"main-content"];

  if (v8)
  {
    id v27 = +[REHTMLElement div];
    long long v28 = [v27 elementByAddingClass:@"header"];

    long long v29 = [v28 elementByAddingAtttibute:@"id" value:@"main-header"];

    if (v44)
    {
      long long v30 = +[REHTMLElement link:v44 title:@"‹"];
      long long v31 = [v30 elementByAddingClass:@"chevron-back"];

      uint64_t v32 = [v29 addChild:v31];

      long long v29 = (void *)v32;
    }
    uint64_t v33 = +[REHTMLElement h1:v8];
    v34 = [v29 addChild:v33];

    uint64_t v35 = [v26 addChild:v34];

    uint64_t v26 = (void *)v35;
  }
  v36 = objc_msgSend(v26, "addChild:", v45, v42);

  v37 = [v23 addChild:v36];

  v38 = [v19 addChild:v37];

  v39 = [(id)objc_opt_class() _docTypeElement];
  v40 = [v39 append:v38];

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v53, 8);

  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v65, 8);

  return v40;
}

void __56__REHTMLPageBuilder_pageWithTitle_content_backLocation___block_invoke(void *a1)
{
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), *(id *)(a1[4] + 8));
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), *(id *)(a1[4] + 16));
  objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), *(id *)(a1[4] + 24));
  id v2 = *(void **)(a1[4] + 32);
  uint64_t v3 = (id *)(*(void *)(a1[8] + 8) + 40);
  objc_storeStrong(v3, v2);
}

- (NSArray)stylesheets
{
  return self->_stylesheets;
}

- (NSArray)loadingScripts
{
  return self->_loadingScripts;
}

- (NSString)pageDescription
{
  return self->_pageDescription;
}

- (NSArray)links
{
  return self->_links;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_links, 0);
  objc_storeStrong((id *)&self->_pageDescription, 0);
  objc_storeStrong((id *)&self->_loadingScripts, 0);
  objc_storeStrong((id *)&self->_stylesheets, 0);
  objc_storeStrong((id *)&self->_navigationLinksElement, 0);
  objc_storeStrong((id *)&self->_pageDescriptionElement, 0);
  objc_storeStrong((id *)&self->_scriptsElement, 0);
  objc_storeStrong((id *)&self->_stylesheetsElement, 0);
}

@end