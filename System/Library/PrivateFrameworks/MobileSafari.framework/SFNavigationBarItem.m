@interface SFNavigationBarItem
- (BOOL)_showsAvailabilityTextForType:(int64_t)a3 style:(int64_t)a4;
- (BOOL)didFinishShowingAvailabilityLabels;
- (BOOL)didFinishShowingReaderAvailabilityLabel;
- (BOOL)didFinishShowingTranslationAvailabilityLabel;
- (BOOL)extensionsAreActive;
- (BOOL)hasFocusedSensitiveFieldOnCurrentPage;
- (BOOL)hasHiddenElements;
- (BOOL)menuButtonSelected;
- (BOOL)needsExtensionBadge;
- (BOOL)overrideBarStyleForSecurityWarning;
- (BOOL)readerButtonSelected;
- (BOOL)shouldShowListeningControls;
- (BOOL)showsLockIcon;
- (BOOL)showsPageFormatButton;
- (BOOL)showsReaderAvailabilityTextForStyle:(int64_t)a3;
- (BOOL)showsReaderButton;
- (BOOL)showsSearchIndicator;
- (BOOL)showsSecurityAnnotation;
- (BOOL)showsSiriReaderPlayingIcon;
- (BOOL)showsStopReloadButtons;
- (BOOL)showsTranslationAvailabilityTextForStyle:(int64_t)a3;
- (BOOL)showsTranslationButton;
- (BOOL)showsTranslationIcon;
- (BOOL)showsVoiceSearchButton;
- (BOOL)stopReloadButtonShowsStop;
- (NSString)customPlaceholderText;
- (NSString)text;
- (NSString)textWhenExpanded;
- (NSString)webpageIdentifier;
- (SFNavigationBarItem)init;
- (SFURLFieldOverlayConfiguration)overlayConfiguration;
- (SFURLFieldOverlayConfiguration)overlayNarrowConfiguration;
- (SFWebExtensionButtonConfiguration)extensionButtonConfiguration;
- (WBSFluidProgressController)fluidProgressController;
- (WBSFluidProgressStateSource)fluidProgressStateSource;
- (int64_t)lockdownModeAnnotation;
- (int64_t)securityAnnotation;
- (unint64_t)contentOptions;
- (unint64_t)mediaStateIcon;
- (unint64_t)startIndexOfTextInExpandedText;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)resetContentOptions;
- (void)setCustomPlaceholderText:(id)a3;
- (void)setDidFinishShowingAvailabilityLabel:(BOOL)a3 ofType:(int64_t)a4;
- (void)setExtensionButtonConfiguration:(id)a3;
- (void)setExtensionsAreActive:(BOOL)a3;
- (void)setFluidProgressController:(id)a3;
- (void)setFluidProgressStateSource:(id)a3;
- (void)setHasHiddenElements:(BOOL)a3;
- (void)setLockdownModeAnnotation:(int64_t)a3;
- (void)setMediaStateIcon:(unint64_t)a3;
- (void)setNeedsExtensionBadge:(BOOL)a3;
- (void)setOverlayConfiguration:(id)a3;
- (void)setOverlayNarrowConfiguration:(id)a3;
- (void)setOverrideBarStyleForSecurityWarning:(BOOL)a3;
- (void)setReaderButtonSelected:(BOOL)a3;
- (void)setSecurityAnnotation:(int64_t)a3;
- (void)setSecurityAnnotation:(int64_t)a3 hasFocusedInputFieldOnCurrentPage:(BOOL)a4;
- (void)setShouldShowListeningControls:(BOOL)a3;
- (void)setShowsLockIcon:(BOOL)a3;
- (void)setShowsPageFormatButton:(BOOL)a3;
- (void)setShowsReaderButton:(BOOL)a3;
- (void)setShowsReaderButton:(BOOL)a3 showsAvailabilityText:(BOOL)a4;
- (void)setShowsSearchIndicator:(BOOL)a3;
- (void)setShowsSiriReaderPlayingIcon:(BOOL)a3;
- (void)setShowsStopReloadButtons:(BOOL)a3;
- (void)setShowsTranslationButton:(BOOL)a3;
- (void)setShowsTranslationButton:(BOOL)a3 showsAvailabilityText:(BOOL)a4;
- (void)setShowsTranslationIcon:(BOOL)a3;
- (void)setShowsVoiceSearchButton:(BOOL)a3;
- (void)setStopReloadButtonShowsStop:(BOOL)a3;
- (void)setTemporarilySuppressText:(BOOL)a3;
- (void)setText:(id)a3 textWhenExpanded:(id)a4 startIndex:(unint64_t)a5;
- (void)setWebpageIdentifier:(id)a3;
- (void)updateContentOptions:(unint64_t)a3;
@end

@implementation SFNavigationBarItem

- (BOOL)stopReloadButtonShowsStop
{
  return self->_stopReloadButtonShowsStop;
}

- (BOOL)showsStopReloadButtons
{
  return self->_showsStopReloadButtons;
}

- (BOOL)showsPageFormatButton
{
  return self->_showsPageFormatButton;
}

- (int64_t)securityAnnotation
{
  return self->_securityAnnotation;
}

- (BOOL)hasFocusedSensitiveFieldOnCurrentPage
{
  return self->_hasFocusedSensitiveFieldOnCurrentPage;
}

- (SFURLFieldOverlayConfiguration)overlayConfiguration
{
  return self->_overlayConfiguration;
}

- (BOOL)showsSearchIndicator
{
  return self->_showsSearchIndicator;
}

- (unint64_t)contentOptions
{
  return self->_contentOptions;
}

- (BOOL)menuButtonSelected
{
  return self->_readerButtonSelected || self->_showsTranslationIcon || self->_showsSiriReaderPlayingIcon;
}

- (BOOL)showsTranslationIcon
{
  return self->_showsTranslationIcon;
}

- (BOOL)showsSiriReaderPlayingIcon
{
  return self->_showsSiriReaderPlayingIcon;
}

- (BOOL)readerButtonSelected
{
  return self->_readerButtonSelected;
}

- (BOOL)needsExtensionBadge
{
  return self->_needsExtensionBadge;
}

- (unint64_t)mediaStateIcon
{
  return self->_mediaStateIcon;
}

- (BOOL)hasHiddenElements
{
  return self->_hasHiddenElements;
}

- (BOOL)extensionsAreActive
{
  return self->_extensionsAreActive;
}

- (NSString)text
{
  if (self->_temporarilySuppressText) {
    return (NSString *)&stru_1EDA07C28;
  }
  else {
    return self->_text;
  }
}

- (WBSFluidProgressController)fluidProgressController
{
  return self->_fluidProgressController;
}

- (WBSFluidProgressStateSource)fluidProgressStateSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fluidProgressStateSource);

  return (WBSFluidProgressStateSource *)WeakRetained;
}

- (void)addObserver:(id)a3
{
}

- (BOOL)showsLockIcon
{
  return self->_showsLockIcon;
}

- (SFURLFieldOverlayConfiguration)overlayNarrowConfiguration
{
  return self->_overlayNarrowConfiguration;
}

- (void)setFluidProgressController:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v5 = (WBSFluidProgressController *)a3;
  if (self->_fluidProgressController != v5)
  {
    objc_storeStrong((id *)&self->_fluidProgressController, a3);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v6 = [(NSHashTable *)self->_observers allObjects];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v11 navigationBarItemDidUpdateFluidProgressController:self];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (void)setShowsSearchIndicator:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (((!self->_showsSearchIndicator ^ a3) & 1) == 0)
  {
    self->_showsSearchIndicator = a3;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v4 = [(NSHashTable *)self->_observers allObjects];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
          if (objc_opt_respondsToSelector()) {
            [v9 navigationBarItemDidUpdateShowsSearchIndicator:self];
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
}

- (void)setShowsVoiceSearchButton:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (((!self->_showsVoiceSearchButton ^ a3) & 1) == 0)
  {
    self->_showsVoiceSearchButton = a3;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v4 = [(NSHashTable *)self->_observers allObjects];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
          if (objc_opt_respondsToSelector()) {
            [v9 navigationBarItemDidUpdateShowsVoiceSearchButton:self];
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
}

- (BOOL)showsVoiceSearchButton
{
  return self->_showsVoiceSearchButton;
}

- (void)setText:(id)a3 textWhenExpanded:(id)a4 startIndex:(unint64_t)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (NSString *)a3;
  uint64_t v9 = (NSString *)a4;
  if (self->_text == v8 || -[NSString isEqualToString:](v8, "isEqualToString:"))
  {
    int v10 = 0;
  }
  else
  {
    long long v11 = (NSString *)[(NSString *)v8 copy];
    text = self->_text;
    self->_text = v11;

    int v10 = 1;
  }
  if (self->_textWhenExpanded == v9 || -[NSString isEqualToString:](v9, "isEqualToString:"))
  {
    p_startIndexOfTextInExpandedText = &self->_startIndexOfTextInExpandedText;
    if (self->_startIndexOfTextInExpandedText == a5)
    {
      if (!v10) {
        goto LABEL_22;
      }
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  long long v14 = (NSString *)[(NSString *)v9 copy];
  textWhenExpanded = self->_textWhenExpanded;
  self->_textWhenExpanded = v14;

  p_startIndexOfTextInExpandedText = &self->_startIndexOfTextInExpandedText;
  if (self->_startIndexOfTextInExpandedText != a5) {
LABEL_11:
  }
    unint64_t *p_startIndexOfTextInExpandedText = a5;
LABEL_12:
  [(SFNavigationBarItem *)self setTemporarilySuppressText:0];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v16 = [(NSHashTable *)self->_observers allObjects];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v23;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v23 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = *(void **)(*((void *)&v22 + 1) + 8 * v20);
        if (objc_opt_respondsToSelector()) {
          [v21 navigationBarItemDidUpdateText:self];
        }
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v18);
  }

LABEL_22:
}

- (NSString)textWhenExpanded
{
  if (self->_temporarilySuppressText) {
    return (NSString *)&stru_1EDA07C28;
  }
  else {
    return self->_textWhenExpanded;
  }
}

- (unint64_t)startIndexOfTextInExpandedText
{
  return self->_startIndexOfTextInExpandedText;
}

- (void)setTemporarilySuppressText:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_temporarilySuppressText != a3)
  {
    self->_temporarilySuppressText = a3;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v4 = [(NSHashTable *)self->_observers allObjects];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
          if (objc_opt_respondsToSelector()) {
            [v9 navigationBarItemDidUpdateText:self];
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
}

- (void)setExtensionButtonConfiguration:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_extensionButtonConfiguration, a3);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v6 = [(NSHashTable *)self->_observers allObjects];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
          if (objc_opt_respondsToSelector()) {
            [v11 navigationBarItemDidUpdateExtensionButtonConfiguration:self];
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (SFWebExtensionButtonConfiguration)extensionButtonConfiguration
{
  return self->_extensionButtonConfiguration;
}

- (void)setFluidProgressStateSource:(id)a3
{
}

- (SFNavigationBarItem)init
{
  v7.receiver = self;
  v7.super_class = (Class)SFNavigationBarItem;
  v2 = [(SFNavigationBarItem *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    id v5 = v2;
  }

  return v2;
}

- (void)setShowsStopReloadButtons:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (((!self->_showsStopReloadButtons ^ a3) & 1) == 0)
  {
    self->_showsStopReloadButtons = a3;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v4 = [(NSHashTable *)self->_observers allObjects];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
          if (objc_opt_respondsToSelector()) {
            [v9 navigationBarItemDidUpdateShowsStopReloadButtons:self];
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
}

- (void)setNeedsExtensionBadge:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_needsExtensionBadge != a3)
  {
    self->_needsExtensionBadge = a3;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v4 = [(NSHashTable *)self->_observers allObjects];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
          if (objc_opt_respondsToSelector()) {
            [v9 navigationBarItemDidUpdateNeedsExtensionBadge:self];
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
}

- (void)setLockdownModeAnnotation:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_lockdownModeAnnotation != a3)
  {
    self->_lockdownModeAnnotation = a3;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v4 = [(NSHashTable *)self->_observers allObjects];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
          if (objc_opt_respondsToSelector()) {
            [v9 navigationBarItemDidUpdateLockdownModeAnnotation:self];
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
}

- (void)setExtensionsAreActive:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_extensionsAreActive != a3)
  {
    self->_extensionsAreActive = a3;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v4 = [(NSHashTable *)self->_observers allObjects];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
          if (objc_opt_respondsToSelector()) {
            [v9 navigationBarItemDidUpdateShowsExtensionsAvailability:self];
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
}

- (void)setStopReloadButtonShowsStop:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (((!self->_stopReloadButtonShowsStop ^ a3) & 1) == 0)
  {
    self->_stopReloadButtonShowsStop = a3;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v4 = [(NSHashTable *)self->_observers allObjects];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
          if (objc_opt_respondsToSelector()) {
            [v9 navigationBarItemDidUpdateStopReloadButtonShowsStop:self];
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
}

- (void)setShowsPageFormatButton:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (((!self->_showsPageFormatButton ^ a3) & 1) == 0)
  {
    self->_showsPageFormatButton = a3;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v4 = [(NSHashTable *)self->_observers allObjects];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
          if (objc_opt_respondsToSelector()) {
            [v9 navigationBarItemDidUpdateShowsPageFormatButton:self];
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
}

- (void)setShowsLockIcon:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (((!self->_showsLockIcon ^ a3) & 1) == 0)
  {
    self->_showsLockIcon = a3;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v4 = [(NSHashTable *)self->_observers allObjects];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
          if (objc_opt_respondsToSelector()) {
            [v9 navigationBarItemDidUpdateShowsLockIcon:self];
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
}

- (void)setOverrideBarStyleForSecurityWarning:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (((!self->_overrideBarStyleForSecurityWarning ^ a3) & 1) == 0)
  {
    self->_overrideBarStyleForSecurityWarning = a3;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v4 = [(NSHashTable *)self->_observers allObjects];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
          if (objc_opt_respondsToSelector()) {
            [v9 navigationBarItemDidUpdateOverrideBarStyleForSecurityWarning:self];
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
}

- (void)setSecurityAnnotation:(int64_t)a3 hasFocusedInputFieldOnCurrentPage:(BOOL)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_securityAnnotation != a3 || self->_hasFocusedSensitiveFieldOnCurrentPage != a4)
  {
    self->_securityAnnotation = a3;
    self->_hasFocusedSensitiveFieldOnCurrentPage = a4;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v5 = [(NSHashTable *)self->_observers allObjects];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
          if (objc_opt_respondsToSelector()) {
            [v10 navigationBarItemDidUpdateSecurityAnnotation:self];
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

- (void)setShowsTranslationButton:(BOOL)a3 showsAvailabilityText:(BOOL)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_showsTranslationButton != a3 || self->_showsTranslationAvailabilityTextWhenReplacingDomain != a4)
  {
    BOOL v5 = !self->_overrideBarStyleForSecurityWarning && a3;
    self->_showsTranslationButton = v5;
    self->_showsTranslationAvailabilityTextWhenReplacingDomain = a4;
    [(SFNavigationBarItem *)self setDidFinishShowingAvailabilityLabel:0 ofType:1];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v6 = [(NSHashTable *)self->_observers allObjects];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v11 navigationBarItemDidUpdateShowsTranslationButton:self];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (void)setShowsReaderButton:(BOOL)a3 showsAvailabilityText:(BOOL)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self->_showsReaderButton != a3 || self->_showsReaderAvailabilityTextWhenReplacingDomain != a4)
  {
    BOOL v5 = !self->_overrideBarStyleForSecurityWarning && a4;
    BOOL v6 = !self->_overrideBarStyleForSecurityWarning && a3;
    self->_showsReaderButton = v6;
    self->_showsReaderAvailabilityTextWhenReplacingDomain = v5;
    [(SFNavigationBarItem *)self setDidFinishShowingAvailabilityLabel:0 ofType:0];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v7 = [(NSHashTable *)self->_observers allObjects];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v12 navigationBarItemDidUpdateShowsReaderButton:self];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
  }
}

- (void)removeObserver:(id)a3
{
}

- (void)setReaderButtonSelected:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (((!self->_readerButtonSelected ^ a3) & 1) == 0)
  {
    self->_readerButtonSelected = a3;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v4 = [(NSHashTable *)self->_observers allObjects];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
          if (objc_opt_respondsToSelector()) {
            [v9 navigationBarItemDidUpdateFormatButtonSelected:self];
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
}

- (void)setShowsTranslationIcon:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (((!self->_showsTranslationIcon ^ a3) & 1) == 0)
  {
    self->_showsTranslationIcon = a3;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v4 = [(NSHashTable *)self->_observers allObjects];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
          if (objc_opt_respondsToSelector()) {
            [v9 navigationBarItemDidUpdateShowsTranslationIcon:self];
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
}

- (void)setShowsSiriReaderPlayingIcon:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (((!self->_showsSiriReaderPlayingIcon ^ a3) & 1) == 0)
  {
    self->_showsSiriReaderPlayingIcon = a3;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v4 = [(NSHashTable *)self->_observers allObjects];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
          if (objc_opt_respondsToSelector()) {
            [v9 navigationBarItemDidUpdateShowsSiriReaderPlayingIcon:self];
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
}

- (void)setShouldShowListeningControls:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (((!self->_shouldShowListeningControls ^ a3) & 1) == 0)
  {
    self->_shouldShowListeningControls = a3;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v4 = [(NSHashTable *)self->_observers allObjects];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
          if (objc_opt_respondsToSelector()) {
            [v9 navigationBarItemDidUpdateShouldShowListeningControls:self];
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
}

- (void)updateContentOptions:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  unint64_t contentOptions = self->_contentOptions;
  if (contentOptions != (contentOptions | a3))
  {
    self->_unint64_t contentOptions = contentOptions | a3;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v5 = [(NSHashTable *)self->_observers allObjects];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v10 navigationBarItemDidUpdateContentOptions:self resetDisplay:0];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

- (void)resetContentOptions
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  self->_unint64_t contentOptions = 0;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [(NSHashTable *)self->_observers allObjects];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 navigationBarItemDidUpdateContentOptions:self resetDisplay:1];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)setDidFinishShowingAvailabilityLabel:(BOOL)a3 ofType:(int64_t)a4
{
  if (a4)
  {
    if (a4 != 1) {
      return;
    }
    uint64_t v4 = 34;
  }
  else
  {
    uint64_t v4 = 33;
  }
  *((unsigned char *)&self->super.isa + v4) = a3;
}

- (void)setShowsReaderButton:(BOOL)a3
{
}

- (BOOL)showsReaderAvailabilityTextForStyle:(int64_t)a3
{
  if (!a3)
  {
    uint64_t v4 = 24;
    return *((unsigned char *)&self->super.isa + v4) != 0;
  }
  if (a3 == 1)
  {
    uint64_t v4 = 32;
    return *((unsigned char *)&self->super.isa + v4) != 0;
  }
  return v3;
}

- (void)setShowsTranslationButton:(BOOL)a3
{
}

- (BOOL)showsTranslationAvailabilityTextForStyle:(int64_t)a3
{
  if (!a3)
  {
    uint64_t v4 = 25;
    return *((unsigned char *)&self->super.isa + v4) != 0;
  }
  if (a3 == 1)
  {
    uint64_t v4 = 35;
    return *((unsigned char *)&self->super.isa + v4) != 0;
  }
  return v3;
}

- (BOOL)_showsAvailabilityTextForType:(int64_t)a3 style:(int64_t)a4
{
  if (a3 == 1) {
    return [(SFNavigationBarItem *)self showsTranslationAvailabilityTextForStyle:a4];
  }
  if (a3) {
    return 0;
  }
  return [(SFNavigationBarItem *)self showsReaderAvailabilityTextForStyle:a4];
}

- (void)setMediaStateIcon:(unint64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_mediaStateIcon != a3)
  {
    self->_mediaStateIcon = a3;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v4 = [(NSHashTable *)self->_observers allObjects];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          long long v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
          if (objc_opt_respondsToSelector()) {
            [v9 navigationBarItemDidUpdateMediaStateIcon:self];
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
}

- (void)setSecurityAnnotation:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_securityAnnotation != a3)
  {
    self->_securityAnnotation = a3;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v4 = [(NSHashTable *)self->_observers allObjects];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          long long v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
          if (objc_opt_respondsToSelector()) {
            [v9 navigationBarItemDidUpdateSecurityAnnotation:self];
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
}

- (BOOL)showsSecurityAnnotation
{
  return self->_securityAnnotation != 0;
}

- (void)setCustomPlaceholderText:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (NSString *)a3;
  customPlaceholderText = self->_customPlaceholderText;
  if (customPlaceholderText != v4 && ![(NSString *)customPlaceholderText isEqualToString:v4])
  {
    uint64_t v6 = (NSString *)[(NSString *)v4 copy];
    uint64_t v7 = self->_customPlaceholderText;
    self->_customPlaceholderText = v6;

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v8 = [(NSHashTable *)self->_observers allObjects];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
          if (objc_opt_respondsToSelector()) {
            [v13 navigationBarItemDidUpdateCustomPlaceholderText:self];
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
  }
}

- (void)setHasHiddenElements:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (((!self->_hasHiddenElements ^ a3) & 1) == 0)
  {
    self->_hasHiddenElements = a3;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v4 = [(NSHashTable *)self->_observers allObjects];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
          if (objc_opt_respondsToSelector()) {
            [v9 navigationBarItemDidUpdateHasHiddenElements:self];
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
}

- (void)setOverlayConfiguration:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (SFURLFieldOverlayConfiguration *)a3;
  if (self->_overlayConfiguration != v5)
  {
    objc_storeStrong((id *)&self->_overlayConfiguration, a3);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v6 = [(NSHashTable *)self->_observers allObjects];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v11 navigationBarItemDidUpdateOverlayConfiguration:self];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (void)setOverlayNarrowConfiguration:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (SFURLFieldOverlayConfiguration *)a3;
  if (self->_overlayNarrowConfiguration != v5)
  {
    objc_storeStrong((id *)&self->_overlayNarrowConfiguration, a3);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v6 = [(NSHashTable *)self->_observers allObjects];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v11 navigationBarItemDidUpdateOverlayNarrowConfiguration:self];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (NSString)customPlaceholderText
{
  return self->_customPlaceholderText;
}

- (BOOL)showsReaderButton
{
  return self->_showsReaderButton;
}

- (BOOL)didFinishShowingReaderAvailabilityLabel
{
  return self->_didFinishShowingReaderAvailabilityLabel;
}

- (BOOL)didFinishShowingTranslationAvailabilityLabel
{
  return self->_didFinishShowingTranslationAvailabilityLabel;
}

- (BOOL)showsTranslationButton
{
  return self->_showsTranslationButton;
}

- (BOOL)shouldShowListeningControls
{
  return self->_shouldShowListeningControls;
}

- (BOOL)didFinishShowingAvailabilityLabels
{
  return self->_didFinishShowingAvailabilityLabels;
}

- (NSString)webpageIdentifier
{
  return self->_webpageIdentifier;
}

- (void)setWebpageIdentifier:(id)a3
{
}

- (BOOL)overrideBarStyleForSecurityWarning
{
  return self->_overrideBarStyleForSecurityWarning;
}

- (int64_t)lockdownModeAnnotation
{
  return self->_lockdownModeAnnotation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayNarrowConfiguration, 0);
  objc_storeStrong((id *)&self->_overlayConfiguration, 0);
  objc_destroyWeak((id *)&self->_fluidProgressStateSource);
  objc_storeStrong((id *)&self->_fluidProgressController, 0);
  objc_storeStrong((id *)&self->_extensionButtonConfiguration, 0);
  objc_storeStrong((id *)&self->_webpageIdentifier, 0);
  objc_storeStrong((id *)&self->_customPlaceholderText, 0);
  objc_storeStrong((id *)&self->_textWhenExpanded, 0);
  objc_storeStrong((id *)&self->_text, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end