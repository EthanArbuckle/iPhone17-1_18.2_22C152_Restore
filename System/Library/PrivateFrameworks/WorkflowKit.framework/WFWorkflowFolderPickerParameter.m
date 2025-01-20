@interface WFWorkflowFolderPickerParameter
- (Class)singleStateClass;
- (id)accessoryIconForPossibleState:(id)a3;
- (id)accessoryImageForPossibleState:(id)a3;
- (id)defaultSerializedRepresentation;
- (id)localizedLabelForPossibleState:(id)a3;
- (id)possibleStates;
@end

@implementation WFWorkflowFolderPickerParameter

- (void).cxx_destruct
{
}

- (id)accessoryIconForPossibleState:(id)a3
{
  v3 = [a3 value];
  v4 = [v3 identifier];

  if ([v4 isEqualToString:@"AllShortcuts"])
  {
    id v5 = objc_alloc(MEMORY[0x1E4FB49C8]);
    v6 = [MEMORY[0x1E4FB4760] clearBackground];
    v7 = (void *)[v5 initWithSymbolName:@"app.2.stack.3d" background:v6];
  }
  else
  {
    v8 = +[WFDatabase defaultDatabase];
    v6 = [v8 collectionWithIdentifier:v4];

    [v6 glyphCharacter];
    v9 = WFSystemImageNameForOutlineGlyphCharacter();
    if (v9)
    {
      id v10 = objc_alloc(MEMORY[0x1E4FB49C8]);
      v11 = [MEMORY[0x1E4FB4760] clearBackground];
      v7 = (void *)[v10 initWithSymbolName:v9 background:v11];
    }
    else
    {
      v7 = 0;
    }
  }
  return v7;
}

- (id)accessoryImageForPossibleState:(id)a3
{
  v3 = [(WFWorkflowFolderPickerParameter *)self accessoryIconForPossibleState:a3];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = (void *)MEMORY[0x1E4FB4770];
    id v5 = [v3 symbolName];
    v6 = [v4 glyphNamed:v5 pointSize:25.0];
    v7 = [v6 imageWithRenderingMode:2];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)localizedLabelForPossibleState:(id)a3
{
  v3 = [a3 value];
  v4 = [v3 displayString];

  return v4;
}

- (id)defaultSerializedRepresentation
{
  v2 = WFAllShortcutsParameterState();
  v3 = [v2 serializedRepresentation];

  return v3;
}

- (id)possibleStates
{
  v15[1] = *MEMORY[0x1E4F143B8];
  possibleStates = self->_possibleStates;
  if (!possibleStates)
  {
    v4 = +[WFDatabaseProxy defaultDatabase];
    uint64_t v5 = [v4 sortedVisibleFoldersWithError:0];
    v6 = (void *)v5;
    v7 = (void *)MEMORY[0x1E4F1CBF0];
    if (v5) {
      v7 = (void *)v5;
    }
    id v8 = v7;

    v9 = objc_msgSend(v8, "if_map:", &__block_literal_global_67902);

    id v10 = WFAllShortcutsParameterState();
    v15[0] = v10;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    v12 = [v11 arrayByAddingObjectsFromArray:v9];
    v13 = self->_possibleStates;
    self->_possibleStates = v12;

    possibleStates = self->_possibleStates;
  }
  return possibleStates;
}

WFINObjectSubstitutableState *__49__WFWorkflowFolderPickerParameter_possibleStates__block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F30568];
  id v3 = a2;
  id v4 = [v2 alloc];
  uint64_t v5 = [v3 identifier];
  v6 = [v3 name];

  v7 = (void *)[v4 initWithIdentifier:v5 displayString:v6];
  id v8 = [(WFVariableSubstitutableParameterState *)[WFINObjectSubstitutableState alloc] initWithValue:v7];

  return v8;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

@end