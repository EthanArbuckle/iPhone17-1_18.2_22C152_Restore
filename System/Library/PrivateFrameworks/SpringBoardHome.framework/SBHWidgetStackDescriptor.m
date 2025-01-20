@interface SBHWidgetStackDescriptor
- (BOOL)isEqual:(id)a3;
- (BOOL)sbh_canBeAddedToStack;
- (BOOL)sbh_isLinkedOnOrAfter:(unint64_t)a3;
- (BOOL)sbh_supportsRemovableBackground;
- (BOOL)sbh_supportsRemovableBackgroundOrAccessoryFamilies;
- (NSArray)extraLargeStackDescriptors;
- (NSArray)largeStackDescriptors;
- (NSArray)mediumStackDescriptors;
- (NSArray)smallStackDescriptors;
- (NSString)sbh_appName;
- (NSString)sbh_galleryItemIdentifier;
- (NSString)sbh_widgetDescription;
- (NSString)sbh_widgetName;
- (SBHWidgetStackDescriptor)initWithSmallStackDescriptors:(id)a3 mediumStackDescriptors:(id)a4 largeStackDescriptors:(id)a5 extraLargeStackDescriptors:(id)a6;
- (UIColor)accentColor;
- (UIColor)backgroundColor;
- (UIColor)mostInterestingColor;
- (id)descriptorsForSizeClass:(int64_t)a3;
- (unint64_t)sbh_disfavoredSizeClassesForAddWidgetSheetLocation:(unint64_t)a3;
- (unint64_t)sbh_favoredSizeClassesForAddWidgetSheetLocation:(unint64_t)a3;
- (unint64_t)sbh_supportedSizeClasses;
- (void)setExtraLargeStackDescriptors:(id)a3;
- (void)setLargeStackDescriptors:(id)a3;
- (void)setMediumStackDescriptors:(id)a3;
- (void)setSmallStackDescriptors:(id)a3;
@end

@implementation SBHWidgetStackDescriptor

- (SBHWidgetStackDescriptor)initWithSmallStackDescriptors:(id)a3 mediumStackDescriptors:(id)a4 largeStackDescriptors:(id)a5 extraLargeStackDescriptors:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)SBHWidgetStackDescriptor;
  v14 = [(SBHWidgetStackDescriptor *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    smallStackDescriptors = v14->_smallStackDescriptors;
    v14->_smallStackDescriptors = (NSArray *)v15;

    uint64_t v17 = [v11 copy];
    mediumStackDescriptors = v14->_mediumStackDescriptors;
    v14->_mediumStackDescriptors = (NSArray *)v17;

    uint64_t v19 = [v12 copy];
    largeStackDescriptors = v14->_largeStackDescriptors;
    v14->_largeStackDescriptors = (NSArray *)v19;

    uint64_t v21 = [v13 copy];
    extraLargeStackDescriptors = v14->_extraLargeStackDescriptors;
    v14->_extraLargeStackDescriptors = (NSArray *)v21;
  }
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:self ofExpectedClass:objc_opt_class()];
  smallStackDescriptors = self->_smallStackDescriptors;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __36__SBHWidgetStackDescriptor_isEqual___block_invoke;
  v28[3] = &unk_1E6AAD5D8;
  id v7 = v4;
  id v29 = v7;
  id v8 = (id)[v5 appendObject:smallStackDescriptors counterpart:v28];
  mediumStackDescriptors = self->_mediumStackDescriptors;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __36__SBHWidgetStackDescriptor_isEqual___block_invoke_2;
  v26[3] = &unk_1E6AAD5D8;
  id v10 = v7;
  id v27 = v10;
  id v11 = (id)[v5 appendObject:mediumStackDescriptors counterpart:v26];
  largeStackDescriptors = self->_largeStackDescriptors;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __36__SBHWidgetStackDescriptor_isEqual___block_invoke_3;
  v24[3] = &unk_1E6AAD5D8;
  id v13 = v10;
  id v25 = v13;
  id v14 = (id)[v5 appendObject:largeStackDescriptors counterpart:v24];
  extraLargeStackDescriptors = self->_extraLargeStackDescriptors;
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  uint64_t v21 = __36__SBHWidgetStackDescriptor_isEqual___block_invoke_4;
  v22 = &unk_1E6AAD5D8;
  id v23 = v13;
  id v16 = v13;
  id v17 = (id)[v5 appendObject:extraLargeStackDescriptors counterpart:&v19];
  LOBYTE(extraLargeStackDescriptors) = objc_msgSend(v5, "isEqual", v19, v20, v21, v22);

  return (char)extraLargeStackDescriptors;
}

id __36__SBHWidgetStackDescriptor_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 16);
}

id __36__SBHWidgetStackDescriptor_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 24);
}

id __36__SBHWidgetStackDescriptor_isEqual___block_invoke_3(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 32);
}

id __36__SBHWidgetStackDescriptor_isEqual___block_invoke_4(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 40);
}

- (id)descriptorsForSizeClass:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3)
  {
    id v4 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    id v4 = *((id *)&self->_sbh_galleryItemIdentifier + a3);
  }
  return v4;
}

- (unint64_t)sbh_supportedSizeClasses
{
  BOOL v3 = [(NSArray *)self->_smallStackDescriptors count] != 0;
  if ([(NSArray *)self->_mediumStackDescriptors count]) {
    unint64_t v4 = (2 * v3) | 4;
  }
  else {
    unint64_t v4 = 2 * v3;
  }
  if ([(NSArray *)self->_largeStackDescriptors count]) {
    v4 |= 8uLL;
  }
  if ([(NSArray *)self->_extraLargeStackDescriptors count]) {
    return v4 | 0x10;
  }
  else {
    return v4;
  }
}

- (unint64_t)sbh_favoredSizeClassesForAddWidgetSheetLocation:(unint64_t)a3
{
  unint64_t v5 = [(SBHWidgetStackDescriptor *)self sbh_supportedSizeClasses];
  return v5 & ~[(SBHWidgetStackDescriptor *)self sbh_disfavoredSizeClassesForAddWidgetSheetLocation:a3];
}

- (unint64_t)sbh_disfavoredSizeClassesForAddWidgetSheetLocation:(unint64_t)a3
{
  return 0;
}

- (BOOL)sbh_canBeAddedToStack
{
  return 0;
}

- (BOOL)sbh_supportsRemovableBackground
{
  return 0;
}

- (BOOL)sbh_supportsRemovableBackgroundOrAccessoryFamilies
{
  return 0;
}

- (NSString)sbh_appName
{
  v2 = SBHBundle();
  BOOL v3 = [v2 localizedStringForKey:@"WIDGET_ADD_SHEET_SUGGESTED_STACK_DISPLAY_NAME" value:&stru_1F2FA0300 table:@"SpringBoardHome"];

  return (NSString *)v3;
}

- (NSString)sbh_widgetName
{
  return 0;
}

- (NSString)sbh_widgetDescription
{
  v2 = SBHBundle();
  BOOL v3 = [v2 localizedStringForKey:@"WIDGET_ADD_SHEET_SUGGESTED_STACK_DESCRIPTION" value:&stru_1F2FA0300 table:@"SpringBoardHome"];

  return (NSString *)v3;
}

- (NSString)sbh_galleryItemIdentifier
{
  sbh_galleryItemIdentifier = self->_sbh_galleryItemIdentifier;
  if (!sbh_galleryItemIdentifier)
  {
    unint64_t v4 = NSString;
    unint64_t v5 = [(SBHWidgetStackDescriptor *)self sbh_appName];
    v6 = [(SBHWidgetStackDescriptor *)self sbh_widgetName];
    id v7 = [(SBHWidgetStackDescriptor *)self sbh_widgetDescription];
    id v8 = [v4 stringWithFormat:@"'%@'-'%@'-'%@'-%lu", v5, v6, v7, -[SBHWidgetStackDescriptor sbh_supportedSizeClasses](self, "sbh_supportedSizeClasses")];
    v9 = self->_sbh_galleryItemIdentifier;
    self->_sbh_galleryItemIdentifier = v8;

    sbh_galleryItemIdentifier = self->_sbh_galleryItemIdentifier;
  }
  id v10 = sbh_galleryItemIdentifier;
  return v10;
}

- (BOOL)sbh_isLinkedOnOrAfter:(unint64_t)a3
{
  return 1;
}

- (UIColor)accentColor
{
  return 0;
}

- (UIColor)backgroundColor
{
  return 0;
}

- (UIColor)mostInterestingColor
{
  return (UIColor *)[MEMORY[0x1E4FB1618] colorWithRed:0.360784314 green:0.807843137 blue:0.937254902 alpha:1.0];
}

- (NSArray)smallStackDescriptors
{
  return self->_smallStackDescriptors;
}

- (void)setSmallStackDescriptors:(id)a3
{
}

- (NSArray)mediumStackDescriptors
{
  return self->_mediumStackDescriptors;
}

- (void)setMediumStackDescriptors:(id)a3
{
}

- (NSArray)largeStackDescriptors
{
  return self->_largeStackDescriptors;
}

- (void)setLargeStackDescriptors:(id)a3
{
}

- (NSArray)extraLargeStackDescriptors
{
  return self->_extraLargeStackDescriptors;
}

- (void)setExtraLargeStackDescriptors:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extraLargeStackDescriptors, 0);
  objc_storeStrong((id *)&self->_largeStackDescriptors, 0);
  objc_storeStrong((id *)&self->_mediumStackDescriptors, 0);
  objc_storeStrong((id *)&self->_smallStackDescriptors, 0);
  objc_storeStrong((id *)&self->_sbh_galleryItemIdentifier, 0);
}

@end