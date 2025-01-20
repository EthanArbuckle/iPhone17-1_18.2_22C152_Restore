@interface VSAppDocumentController
- (BOOL)_updateViewModel:(id)a3 error:(id *)a4;
- (BOOL)document:(id)a3 evaluateStyleMediaQuery:(id)a4;
- (IKAppDocument)appDocument;
- (IKViewElement)templateElement;
- (NSArray)filteredButtonLockupElements;
- (NSError)viewModelError;
- (VSAppDocumentController)init;
- (VSAppDocumentController)initWithAppDocument:(id)a3;
- (VSAppDocumentControllerDelegate)delegate;
- (VSViewModel)viewModel;
- (id)_getSupportedButtonTextsforTemplate:(id)a3 andElementKeys:(id)a4 supportedCount:(unint64_t)a5;
- (id)_imageItemProviderWithImageElement:(id)a3;
- (id)_newViewModel;
- (void)_notiftyDidFailToUpdateViewModelWithError:(id)a3;
- (void)_notiftyDidUpdateViewModel:(id)a3;
- (void)_notifyDidUpdateLogoViewModel:(id)a3;
- (void)_startObservingViewModel:(id)a3;
- (void)_stopObservingViewModel:(id)a3;
- (void)dealloc;
- (void)documentDidUpdate:(id)a3;
- (void)documentNeedsUpdate:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAppDocument:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFilteredButtonLockupElements:(id)a3;
- (void)setTemplateElement:(id)a3;
- (void)setViewModel:(id)a3;
- (void)setViewModelError:(id)a3;
- (void)userInterfaceStyleDidUpdate;
@end

@implementation VSAppDocumentController

- (VSAppDocumentController)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (VSAppDocumentController)initWithAppDocument:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)VSAppDocumentController;
  v6 = [(VSAppDocumentController *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_appDocument, a3);
    [(IKAppDocument *)v7->_appDocument setDelegate:v7];
    uint64_t v8 = [(IKAppDocument *)v7->_appDocument templateElement];
    templateElement = v7->_templateElement;
    v7->_templateElement = (IKViewElement *)v8;

    id v10 = [(VSAppDocumentController *)v7 _newViewModel];
    objc_storeStrong((id *)&v7->_viewModel, v10);
    id v16 = 0;
    BOOL v11 = [(VSAppDocumentController *)v7 _updateViewModel:v10 error:&v16];
    id v12 = v16;
    id v13 = v16;
    if (v11)
    {
      [(VSAppDocumentController *)v7 _startObservingViewModel:v10];
    }
    else
    {
      viewModel = v7->_viewModel;
      v7->_viewModel = 0;

      objc_storeStrong((id *)&v7->_viewModelError, v12);
    }
  }
  return v7;
}

- (void)dealloc
{
  [(IKAppDocument *)self->_appDocument setDelegate:0];
  v3 = self->_viewModel;
  if (v3) {
    [(VSAppDocumentController *)self _stopObservingViewModel:v3];
  }

  v4.receiver = self;
  v4.super_class = (Class)VSAppDocumentController;
  [(VSAppDocumentController *)&v4 dealloc];
}

- (void)documentNeedsUpdate:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a3;
  objc_super v4 = VSDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_23F9AB000, v4, OS_LOG_TYPE_DEFAULT, "Document needs update: %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)documentDidUpdate:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = VSDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v4;
    _os_log_impl(&dword_23F9AB000, v5, OS_LOG_TYPE_DEFAULT, "Document did update: %@", buf, 0xCu);
  }

  id v6 = (void *)MEMORY[0x263F1E250];
  uint64_t v7 = [(VSAppDocumentController *)self viewModel];
  uint64_t v8 = [v6 optionalWithObject:v7];

  v9 = [v8 forceUnwrapObject];
  id v14 = 0;
  BOOL v10 = [(VSAppDocumentController *)self _updateViewModel:v9 error:&v14];
  id v11 = v14;
  id v12 = v11;
  if (v10)
  {
    [(VSAppDocumentController *)self _notiftyDidUpdateViewModel:v9];
  }
  else
  {
    if (!v11) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The errorOrNil parameter must not be nil."];
    }
    id v13 = v12;
    [(VSAppDocumentController *)self _stopObservingViewModel:v9];
    [(VSAppDocumentController *)self setViewModel:0];
    [(VSAppDocumentController *)self setViewModelError:v13];
    [(VSAppDocumentController *)self _notiftyDidFailToUpdateViewModelWithError:v13];
  }
}

- (BOOL)document:(id)a3 evaluateStyleMediaQuery:(id)a4
{
  id v4 = (void *)MEMORY[0x263F1C920];
  id v5 = a4;
  id v6 = [v4 mainScreen];
  [v6 scale];
  double v8 = v7;

  v9 = [v5 featureValues];

  BOOL v10 = [v9 objectForKey:@"min-pixel-ratio"];
  uint64_t v11 = [v10 integerValue];

  return v8 == (double)v11;
}

- (id)_newViewModel
{
  return objc_alloc_init(VSViewModel);
}

- (BOOL)_updateViewModel:(id)a3 error:(id *)a4
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v6 = [(VSAppDocumentController *)self templateElement];
  double v7 = [v6 children];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v41 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        if (objc_msgSend(v12, "vs_elementType") == 156) {
          [v5 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v40 objects:v48 count:16];
    }
    while (v9);
  }

  if ((unint64_t)[v5 count] < 3)
  {
    [(VSAppDocumentController *)self setFilteredButtonLockupElements:v5];
  }
  else
  {
    id v13 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithArray:v5];
    id v14 = objc_alloc(MEMORY[0x263EFF980]);
    v15 = [v13 objectAtIndex:0];
    v47[0] = v15;
    id v16 = [v13 objectAtIndex:1];
    v47[1] = v16;
    uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v47 count:2];
    uint64_t v18 = [v14 initWithArray:v17];

    v35 = (void *)v18;
    [v13 removeObjectsInArray:v18];
    v19 = VSErrorLogObject();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[VSAppDocumentController _updateViewModel:error:](v13, v19);
    }

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v20 = v13;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v36 objects:v46 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v37;
      uint64_t v24 = *MEMORY[0x263EFF4A0];
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v37 != v23) {
            objc_enumerationMutation(v20);
          }
          v26 = *(void **)(*((void *)&v36 + 1) + 8 * j);
          if (objc_msgSend(v26, "vs_elementType") == 138)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v27 = (void *)MEMORY[0x263EFF940];
              v28 = (objc_class *)objc_opt_class();
              v29 = NSStringFromClass(v28);
              [v27 raise:v24, @"Unexpectedly, extraButton was %@, instead of IKTextElement.", v29 format];
            }
            id v30 = v26;
            v31 = [v30 text];
            v32 = [v31 string];

            v33 = VSErrorLogObject();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v45 = v32;
              _os_log_error_impl(&dword_23F9AB000, v33, OS_LOG_TYPE_ERROR, "Attempted to add extra button with text: %@", buf, 0xCu);
            }
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v36 objects:v46 count:16];
      }
      while (v22);
    }

    [(VSAppDocumentController *)self setFilteredButtonLockupElements:v35];
  }

  return 1;
}

- (id)_getSupportedButtonTextsforTemplate:(id)a3 andElementKeys:(id)a4 supportedCount:(unint64_t)a5
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v34 = a3;
  id v7 = a4;
  id v35 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v8 = [(VSAppDocumentController *)self filteredButtonLockupElements];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    uint64_t v10 = [(VSAppDocumentController *)self filteredButtonLockupElements];
    uint64_t v11 = [v10 count];

    if (v11)
    {
      unint64_t v12 = 0;
      uint64_t v36 = *MEMORY[0x263EFF4A0];
      v32 = self;
      do
      {
        id v13 = [(VSAppDocumentController *)self filteredButtonLockupElements];
        id v14 = [v13 objectAtIndex:v12];

        if (v14)
        {
          unint64_t v38 = v12;
          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          v33 = v14;
          v15 = objc_msgSend(v14, "vs_itemElementsOfType:", 138);
          uint64_t v16 = [v15 countByEnumeratingWithState:&v39 objects:v47 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            BOOL v18 = 0;
            uint64_t v19 = *(void *)v40;
            do
            {
              for (uint64_t i = 0; i != v17; ++i)
              {
                if (*(void *)v40 != v19) {
                  objc_enumerationMutation(v15);
                }
                if (v18)
                {
                  BOOL v18 = 1;
                }
                else
                {
                  uint64_t v21 = *(void **)(*((void *)&v39 + 1) + 8 * i);
                  uint64_t v22 = [v21 elementName];
                  if (v22 && [v7 containsObject:v22])
                  {
                    if (!v21) {
                      [MEMORY[0x263EFF940] raise:v36 format:@"The textElement parameter must not be nil."];
                    }
                    id v23 = v21;
                    uint64_t v24 = [v23 text];
                    v25 = [v24 string];

                    if (v25)
                    {
                      if (v38 >= a5)
                      {
                        v27 = VSErrorLogObject();
                        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 138412546;
                          id v44 = v34;
                          __int16 v45 = 2112;
                          v46 = v25;
                          _os_log_error_impl(&dword_23F9AB000, v27, OS_LOG_TYPE_ERROR, "Tried to add invalid extra button to %@ Template with text: %@", buf, 0x16u);
                        }
                      }
                      else
                      {
                        v26 = VSDefaultLogObject();
                        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 138412546;
                          id v44 = v34;
                          __int16 v45 = 2112;
                          v46 = v25;
                          _os_log_impl(&dword_23F9AB000, v26, OS_LOG_TYPE_DEFAULT, "Setting %@ Template button with text: %@", buf, 0x16u);
                        }

                        v27 = [v25 copy];
                        [v35 addObject:v27];
                      }

                      BOOL v18 = v38 < a5;
                    }
                    else
                    {
                      BOOL v18 = 0;
                    }
                  }
                  else
                  {
                    BOOL v18 = 0;
                  }
                }
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v39 objects:v47 count:16];
            }
            while (v17);
          }

          self = v32;
          id v14 = v33;
          unint64_t v12 = v38;
        }

        ++v12;
        v28 = [(VSAppDocumentController *)self filteredButtonLockupElements];
        unint64_t v29 = [v28 count];
      }
      while (v12 < v29);
    }
  }
  else
  {
    id v30 = VSErrorLogObject();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      -[VSAppDocumentController _getSupportedButtonTextsforTemplate:andElementKeys:supportedCount:]((uint64_t)v34, v30);
    }
  }
  return v35;
}

- (void)_startObservingViewModel:(id)a3
{
  uint64_t v4 = kVSKeyValueObservingContext_ViewModelViewState;
  id v5 = a3;
  [v5 addObserver:self forKeyPath:@"viewState" options:3 context:v4];
  [v5 addObserver:self forKeyPath:@"userInterfaceStyle" options:1 context:kVSKeyValueObservingContext_ViewModelUserInterfaceStyle];
}

- (void)_stopObservingViewModel:(id)a3
{
  uint64_t v4 = kVSKeyValueObservingContext_ViewModelViewState;
  id v5 = a3;
  [v5 removeObserver:self forKeyPath:@"viewState" context:v4];
  [v5 removeObserver:self forKeyPath:@"userInterfaceStyle" context:kVSKeyValueObservingContext_ViewModelUserInterfaceStyle];
}

- (id)_imageItemProviderWithImageElement:(id)a3
{
  id v3 = objc_msgSend(a3, "vs_url");
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F088E0]);
    id v5 = (void *)[v4 initWithItem:v3 typeIdentifier:*MEMORY[0x263F01A68]];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = v12;
  if ((void *)kVSKeyValueObservingContext_ViewModelViewState == a6)
  {
    id v14 = [v12 objectForKey:*MEMORY[0x263F081B8]];
    uint64_t v15 = [v14 unsignedIntegerValue];

    switch(v15)
    {
      case 1:
        uint64_t v16 = VSDefaultLogObject();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_23F9AB000, v16, OS_LOG_TYPE_DEFAULT, "Will call onLoad()", buf, 2u);
        }

        uint64_t v17 = [(VSAppDocumentController *)self appDocument];
        [v17 onLoad];

        BOOL v18 = VSDefaultLogObject();
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_23;
        }
        *(_WORD *)buf = 0;
        uint64_t v19 = "Did call onLoad()";
        break;
      case 2:
        id v20 = VSDefaultLogObject();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_23F9AB000, v20, OS_LOG_TYPE_DEFAULT, "Will call onAppear()", buf, 2u);
        }

        uint64_t v21 = [(VSAppDocumentController *)self appDocument];
        [v21 onAppear];

        BOOL v18 = VSDefaultLogObject();
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_23;
        }
        *(_WORD *)buf = 0;
        uint64_t v19 = "Did call onAppear()";
        break;
      case 4:
        uint64_t v22 = VSDefaultLogObject();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_23F9AB000, v22, OS_LOG_TYPE_DEFAULT, "Will call onDisappear()", buf, 2u);
        }

        id v23 = [(VSAppDocumentController *)self appDocument];
        [v23 onDisappear];

        BOOL v18 = VSDefaultLogObject();
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_23;
        }
        *(_WORD *)buf = 0;
        uint64_t v19 = "Did call onDisappear()";
        break;
      case 6:
        uint64_t v24 = VSDefaultLogObject();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_23F9AB000, v24, OS_LOG_TYPE_DEFAULT, "Will call onUnload()", buf, 2u);
        }

        v25 = [(VSAppDocumentController *)self appDocument];
        [v25 onUnload];

        BOOL v18 = VSDefaultLogObject();
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_23;
        }
        *(_WORD *)buf = 0;
        uint64_t v19 = "Did call onUnload()";
        break;
      default:
        goto LABEL_24;
    }
    _os_log_impl(&dword_23F9AB000, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 2u);
LABEL_23:
  }
  else if ((void *)kVSKeyValueObservingContext_ViewModelUserInterfaceStyle == a6)
  {
    [(VSAppDocumentController *)self userInterfaceStyleDidUpdate];
  }
  else
  {
    v26.receiver = self;
    v26.super_class = (Class)VSAppDocumentController;
    [(VSAppDocumentController *)&v26 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
LABEL_24:
}

- (void)_notiftyDidUpdateViewModel:(id)a3
{
  id v5 = a3;
  id v4 = [(VSAppDocumentController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 appDocumentController:self didUpdateViewModel:v5];
  }
}

- (void)_notiftyDidFailToUpdateViewModelWithError:(id)a3
{
  id v5 = a3;
  id v4 = [(VSAppDocumentController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 appDocumentController:self didFailToUpdateViewModelWithError:v5];
  }
}

- (void)_notifyDidUpdateLogoViewModel:(id)a3
{
  id v5 = a3;
  id v4 = [(VSAppDocumentController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 appDocumentController:self didUpdateLogoViewModel:v5];
  }
}

- (void)userInterfaceStyleDidUpdate
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = [(VSAppDocumentController *)self viewModel];
  if (v3)
  {
    id v4 = [(VSAppDocumentController *)self viewModel];

    if (!v4) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The [self viewModel] parameter must not be nil."];
    }
    id v5 = [(VSAppDocumentController *)self viewModel];
    if ([v5 conformsToProtocol:&unk_26F394860])
    {
      id v6 = v5;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v7 = [(VSAppDocumentController *)self templateElement];
      uint64_t v8 = [v7 children];

      uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v20;
        while (2)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v20 != v11) {
              objc_enumerationMutation(v8);
            }
            id v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            if (objc_msgSend(v13, "vs_elementType") == 49)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                id v14 = (void *)MEMORY[0x263EFF940];
                uint64_t v15 = *MEMORY[0x263EFF4A0];
                uint64_t v16 = (objc_class *)objc_opt_class();
                uint64_t v17 = NSStringFromClass(v16);
                [v14 raise:v15, @"Unexpectedly, childElement was %@, instead of IKImageElement.", v17 format];
              }
              BOOL v18 = [(VSAppDocumentController *)self _imageItemProviderWithImageElement:v13];
              [v6 setLogoProvider:v18];
              [(VSAppDocumentController *)self _notifyDidUpdateLogoViewModel:v6];

              goto LABEL_17;
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }
LABEL_17:
    }
  }
}

- (IKAppDocument)appDocument
{
  return self->_appDocument;
}

- (void)setAppDocument:(id)a3
{
}

- (NSArray)filteredButtonLockupElements
{
  return self->_filteredButtonLockupElements;
}

- (void)setFilteredButtonLockupElements:(id)a3
{
}

- (VSAppDocumentControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VSAppDocumentControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (VSViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
}

- (NSError)viewModelError
{
  return self->_viewModelError;
}

- (void)setViewModelError:(id)a3
{
}

- (IKViewElement)templateElement
{
  return self->_templateElement;
}

- (void)setTemplateElement:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateElement, 0);
  objc_storeStrong((id *)&self->_viewModelError, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_filteredButtonLockupElements, 0);
  objc_storeStrong((id *)&self->_appDocument, 0);
}

- (void)_updateViewModel:(void *)a1 error:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218240;
  uint64_t v4 = 2;
  __int16 v5 = 2048;
  uint64_t v6 = [a1 count];
  _os_log_error_impl(&dword_23F9AB000, a2, OS_LOG_TYPE_ERROR, "Only %ld button lockups are allowed, attempted adding %ld extra button(s).", (uint8_t *)&v3, 0x16u);
}

- (void)_getSupportedButtonTextsforTemplate:(uint64_t)a1 andElementKeys:(NSObject *)a2 supportedCount:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23F9AB000, a2, OS_LOG_TYPE_ERROR, "No button specified for the %@ Template", (uint8_t *)&v2, 0xCu);
}

@end