@interface UICellConfigurationState
+ (BOOL)supportsSecureCoding;
+ (UICellConfigurationState)_readonlyCellState:(uint64_t)a1;
+ (UICellConfigurationState)_readonlyCellStateFromViewConfigurationState:(uint64_t)a1;
- (BOOL)_inMultiSelectGroup;
- (BOOL)_usesAnyPlainListStyle;
- (BOOL)isEditing;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExpanded;
- (BOOL)isReordering;
- (BOOL)isSwiped;
- (UICellConfigurationDragState)cellDragState;
- (UICellConfigurationDropState)cellDropState;
- (UICellConfigurationState)initWithCoder:(id)a3;
- (id)_initWithState:(id)a3;
- (unint64_t)_viewConfigurationState;
- (unint64_t)hash;
- (void)_appendPropertiesForDescription:(id)a3;
- (void)_configureWithViewConfigurationState:(unint64_t)a3;
- (void)_setInMultiSelectGroup:(BOOL)a3;
- (void)_setUsesAnyPlainListStyle:(BOOL)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCellDragState:(UICellConfigurationDragState)cellDragState;
- (void)setCellDropState:(UICellConfigurationDropState)cellDropState;
- (void)setEditing:(BOOL)editing;
- (void)setExpanded:(BOOL)expanded;
- (void)setReordering:(BOOL)reordering;
- (void)setSwiped:(BOOL)swiped;
@end

@implementation UICellConfigurationState

- (UICellConfigurationDropState)cellDropState
{
  return (unint64_t)(*(_WORD *)&self->_cellStateFlags >> 6);
}

- (BOOL)isReordering
{
  return (*(_WORD *)&self->_cellStateFlags >> 3) & 1;
}

- (BOOL)isSwiped
{
  return (*(_WORD *)&self->_cellStateFlags >> 2) & 1;
}

- (BOOL)isEditing
{
  return *(_WORD *)&self->_cellStateFlags & 1;
}

- (BOOL)isExpanded
{
  return (*(_WORD *)&self->_cellStateFlags >> 1) & 1;
}

- (UICellConfigurationDragState)cellDragState
{
  return ((unint64_t)*(_WORD *)&self->_cellStateFlags >> 4) & 3;
}

- (BOOL)_usesAnyPlainListStyle
{
  return HIBYTE(*(_WORD *)&self->_cellStateFlags) & 1;
}

- (BOOL)_inMultiSelectGroup
{
  return (*(_WORD *)&self->_cellStateFlags >> 9) & 1;
}

- (void)setSwiped:(BOOL)swiped
{
  if (((((*(_WORD *)&self->_cellStateFlags & 4) == 0) ^ swiped) & 1) == 0)
  {
    ++self->super._mutations;
    if (swiped) {
      __int16 v3 = 4;
    }
    else {
      __int16 v3 = 0;
    }
    *(_WORD *)&self->_cellStateFlags = *(_WORD *)&self->_cellStateFlags & 0xFFFB | v3;
  }
}

- (void)setReordering:(BOOL)reordering
{
  if (((((*(_WORD *)&self->_cellStateFlags & 8) == 0) ^ reordering) & 1) == 0)
  {
    ++self->super._mutations;
    if (reordering) {
      __int16 v3 = 8;
    }
    else {
      __int16 v3 = 0;
    }
    *(_WORD *)&self->_cellStateFlags = *(_WORD *)&self->_cellStateFlags & 0xFFF7 | v3;
  }
}

- (void)setEditing:(BOOL)editing
{
  if (((((*(_WORD *)&self->_cellStateFlags & 1) == 0) ^ editing) & 1) == 0)
  {
    ++self->super._mutations;
    *(_WORD *)&self->_cellStateFlags = *(_WORD *)&self->_cellStateFlags & 0xFFFE | editing;
  }
}

- (void)setCellDropState:(UICellConfigurationDropState)cellDropState
{
  if (*(_WORD *)&self->_cellStateFlags >> 6 != cellDropState)
  {
    ++self->super._mutations;
    *(_WORD *)&self->_cellStateFlags = *(_WORD *)&self->_cellStateFlags & 0xFF3F | ((cellDropState & 3) << 6);
  }
}

- (void)_setUsesAnyPlainListStyle:(BOOL)a3
{
  if (((((*(_WORD *)&self->_cellStateFlags & 0x100) == 0) ^ a3) & 1) == 0)
  {
    ++self->super._mutations;
    if (a3) {
      __int16 v3 = 256;
    }
    else {
      __int16 v3 = 0;
    }
    *(_WORD *)&self->_cellStateFlags = *(_WORD *)&self->_cellStateFlags & 0xFEFF | v3;
  }
}

- (void)_setInMultiSelectGroup:(BOOL)a3
{
  if (((((*(_WORD *)&self->_cellStateFlags & 0x200) == 0) ^ a3) & 1) == 0)
  {
    ++self->super._mutations;
    if (a3) {
      __int16 v3 = 512;
    }
    else {
      __int16 v3 = 0;
    }
    *(_WORD *)&self->_cellStateFlags = *(_WORD *)&self->_cellStateFlags & 0xFDFF | v3;
  }
}

- (unint64_t)_viewConfigurationState
{
  v10.receiver = self;
  v10.super_class = (Class)UICellConfigurationState;
  unint64_t v3 = [(UIViewConfigurationState *)&v10 _viewConfigurationState];
  $A3BE8D2F9F885AB89DA145E2B19EE74D cellStateFlags = self->_cellStateFlags;
  unint64_t v5 = v3 | (16 * *(_DWORD *)&cellStateFlags) & 0x10 | (*(_DWORD *)&cellStateFlags << 6) & 0x80 | (unint64_t)((16 * *(_DWORD *)&cellStateFlags) & 0x40) | (*(_DWORD *)&cellStateFlags << 6) & 0x200;
  int v6 = *(unsigned char *)&cellStateFlags >> 6;
  uint64_t v7 = v5 | 0x20;
  if (v6 == 1) {
    v5 |= 0x100uLL;
  }
  if (v6 == 2) {
    unint64_t v8 = v7;
  }
  else {
    unint64_t v8 = v5;
  }
  return v8 | (*(_WORD *)&self->_cellStateFlags << 7) & 0x8000;
}

- (void)setExpanded:(BOOL)expanded
{
  if (((((*(_WORD *)&self->_cellStateFlags & 2) == 0) ^ expanded) & 1) == 0)
  {
    ++self->super._mutations;
    if (expanded) {
      __int16 v3 = 2;
    }
    else {
      __int16 v3 = 0;
    }
    *(_WORD *)&self->_$A3BE8D2F9F885AB89DA145E2B19EE74D cellStateFlags = *(_WORD *)&self->_cellStateFlags & 0xFFFD | v3;
  }
}

+ (UICellConfigurationState)_readonlyCellState:(uint64_t)a1
{
  id v2 = a2;
  self;
  if (!v2)
  {
    if (qword_1EB264EE8 != -1) {
      dispatch_once(&qword_1EB264EE8, &__block_literal_global_633);
    }
    __int16 v3 = (UICellConfigurationState *)(id)_MergedGlobals_1312;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    __int16 v3 = (UICellConfigurationState *)v2;
LABEL_9:
    uint64_t v7 = v3;
    goto LABEL_10;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  unint64_t v5 = [UICellConfigurationState alloc];
  int v6 = v5;
  if (isKindOfClass)
  {
    __int16 v3 = [(UICellConfigurationState *)v5 _initWithState:v2];
    goto LABEL_9;
  }
  v9 = [v2 traitCollection];
  uint64_t v7 = [(UIViewConfigurationState *)v6 initWithTraitCollection:v9];

LABEL_10:
  return v7;
}

+ (UICellConfigurationState)_readonlyCellStateFromViewConfigurationState:(uint64_t)a1
{
  uint64_t v3 = self;
  if (a2)
  {
    v4 = (void *)_readonlyCellStateFromViewConfigurationState__cachedStates;
    if (!_readonlyCellStateFromViewConfigurationState__cachedStates)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1C998]);
      int v6 = (void *)_readonlyCellStateFromViewConfigurationState__cachedStates;
      _readonlyCellStateFromViewConfigurationState__cachedStates = (uint64_t)v5;

      v4 = (void *)_readonlyCellStateFromViewConfigurationState__cachedStates;
    }
    uint64_t v7 = [NSNumber numberWithUnsignedInteger:a2];
    unint64_t v8 = [v4 objectForKey:v7];

    if (!v8)
    {
      v9 = [UICellConfigurationState alloc];
      objc_super v10 = +[UITraitCollection _emptyTraitCollection]();
      unint64_t v8 = [(UIViewConfigurationState *)v9 initWithTraitCollection:v10];

      [(UICellConfigurationState *)v8 _configureWithViewConfigurationState:a2];
      v11 = (void *)_readonlyCellStateFromViewConfigurationState__cachedStates;
      v12 = [NSNumber numberWithUnsignedInteger:a2];
      [v11 setObject:v8 forKey:v12];
    }
  }
  else
  {
    +[UICellConfigurationState _readonlyCellState:](v3, 0);
    unint64_t v8 = (UICellConfigurationState *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (void)_configureWithViewConfigurationState:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UICellConfigurationState;
  -[UIViewConfigurationState _configureWithViewConfigurationState:](&v6, sel__configureWithViewConfigurationState_);
  [(UICellConfigurationState *)self setEditing:(a3 >> 4) & 1];
  [(UICellConfigurationState *)self setSwiped:(a3 >> 6) & 1];
  [(UICellConfigurationState *)self setExpanded:(a3 >> 7) & 1];
  [(UICellConfigurationState *)self setReordering:(a3 >> 9) & 1];
  [(UICellConfigurationState *)self setCellDragState:0];
  if ((a3 & 0x20) != 0) {
    unint64_t v5 = 2;
  }
  else {
    unint64_t v5 = (a3 >> 8) & 1;
  }
  [(UICellConfigurationState *)self setCellDropState:v5];
  [(UICellConfigurationState *)self _setUsesAnyPlainListStyle:(a3 >> 15) & 1];
}

- (void)setCellDragState:(UICellConfigurationDragState)cellDragState
{
  if ((((unint64_t)*(_WORD *)&self->_cellStateFlags >> 4) & 3) != cellDragState)
  {
    ++self->super._mutations;
    *(_WORD *)&self->_$A3BE8D2F9F885AB89DA145E2B19EE74D cellStateFlags = *(_WORD *)&self->_cellStateFlags & 0xFFCF | (16 * (cellDragState & 3));
  }
}

- (id)_initWithState:(id)a3
{
  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UICellConfigurationState;
  unint64_t v5 = [(UIViewConfigurationState *)&v7 _initWithState:v4];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5[10] = v4[10];
    }
  }

  return v5;
}

void __47__UICellConfigurationState__readonlyCellState___block_invoke()
{
  v0 = [UICellConfigurationState alloc];
  +[UITraitCollection _emptyTraitCollection]();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [(UIViewConfigurationState *)v0 initWithTraitCollection:v3];
  id v2 = (void *)_MergedGlobals_1312;
  _MergedGlobals_1312 = v1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UICellConfigurationState)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UICellConfigurationState;
  unint64_t v5 = [(UIViewConfigurationState *)&v12 initWithCoder:v4];
  if (v5)
  {
    *(_WORD *)&v5->_$A3BE8D2F9F885AB89DA145E2B19EE74D cellStateFlags = *(_WORD *)&v5->_cellStateFlags & 0xFFFE | [v4 decodeBoolForKey:@"editing"];
    if ([v4 decodeBoolForKey:@"expanded"]) {
      __int16 v6 = 2;
    }
    else {
      __int16 v6 = 0;
    }
    *(_WORD *)&v5->_$A3BE8D2F9F885AB89DA145E2B19EE74D cellStateFlags = *(_WORD *)&v5->_cellStateFlags & 0xFFFD | v6;
    if ([v4 decodeBoolForKey:@"swiped"]) {
      __int16 v7 = 4;
    }
    else {
      __int16 v7 = 0;
    }
    *(_WORD *)&v5->_$A3BE8D2F9F885AB89DA145E2B19EE74D cellStateFlags = *(_WORD *)&v5->_cellStateFlags & 0xFFFB | v7;
    if ([v4 decodeBoolForKey:@"reordering"]) {
      __int16 v8 = 8;
    }
    else {
      __int16 v8 = 0;
    }
    *(_WORD *)&v5->_$A3BE8D2F9F885AB89DA145E2B19EE74D cellStateFlags = *(_WORD *)&v5->_cellStateFlags & 0xFFF7 | v8;
    *(_WORD *)&v5->_$A3BE8D2F9F885AB89DA145E2B19EE74D cellStateFlags = (16 * ([v4 decodeIntegerForKey:@"cellDragState"] & 3)) | *(_WORD *)&v5->_cellStateFlags & 0xFFCF;
    *(_WORD *)&v5->_$A3BE8D2F9F885AB89DA145E2B19EE74D cellStateFlags = (([v4 decodeIntegerForKey:@"cellDropState"] & 3) << 6) | *(_WORD *)&v5->_cellStateFlags & 0xFF3F;
    if ([v4 decodeBoolForKey:@"usesAnyPlainListStyle"]) {
      __int16 v9 = 256;
    }
    else {
      __int16 v9 = 0;
    }
    *(_WORD *)&v5->_$A3BE8D2F9F885AB89DA145E2B19EE74D cellStateFlags = *(_WORD *)&v5->_cellStateFlags & 0xFEFF | v9;
    if ([v4 decodeBoolForKey:@"inMultiSelectGroup"]) {
      __int16 v10 = 512;
    }
    else {
      __int16 v10 = 0;
    }
    *(_WORD *)&v5->_$A3BE8D2F9F885AB89DA145E2B19EE74D cellStateFlags = *(_WORD *)&v5->_cellStateFlags & 0xFDFF | v10;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UICellConfigurationState;
  id v4 = a3;
  [(UIViewConfigurationState *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", *(_WORD *)&self->_cellStateFlags & 1, @"editing", v5.receiver, v5.super_class);
  [v4 encodeBool:(*(_WORD *)&self->_cellStateFlags >> 1) & 1 forKey:@"expanded"];
  [v4 encodeBool:(*(_WORD *)&self->_cellStateFlags >> 2) & 1 forKey:@"swiped"];
  [v4 encodeBool:(*(_WORD *)&self->_cellStateFlags >> 3) & 1 forKey:@"reordering"];
  [v4 encodeInteger:((unint64_t)*(_WORD *)&self->_cellStateFlags >> 4) & 3 forKey:@"cellDragState"];
  [v4 encodeInteger:*(_WORD *)&self->_cellStateFlags >> 6 forKey:@"cellDropState"];
  [v4 encodeBool:HIBYTE(*(_WORD *)&self->_cellStateFlags) & 1 forKey:@"usesAnyPlainListStyle"];
  [v4 encodeBool:(*(_WORD *)&self->_cellStateFlags >> 9) & 1 forKey:@"inMultiSelectGroup"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (UICellConfigurationState *)a3;
  objc_super v5 = (unsigned __int16 *)v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && (v8.receiver = self,
          v8.super_class = (Class)UICellConfigurationState,
          [(UIViewConfigurationState *)&v8 isEqual:v5])
      && ((v5[20] ^ *(_WORD *)&self->_cellStateFlags) & 0x3FF) == 0;

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2 = *(_WORD *)&self->_cellStateFlags & 0x3FF;
  v4.receiver = self;
  v4.super_class = (Class)UICellConfigurationState;
  return [(UIViewConfigurationState *)&v4 hash] ^ v2;
}

- (void)_appendPropertiesForDescription:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UICellConfigurationState;
  [(UIViewConfigurationState *)&v10 _appendPropertiesForDescription:v4];
  $A3BE8D2F9F885AB89DA145E2B19EE74D cellStateFlags = self->_cellStateFlags;
  if (*(unsigned char *)&cellStateFlags)
  {
    [v4 addObject:@"Editing"];
    $A3BE8D2F9F885AB89DA145E2B19EE74D cellStateFlags = self->_cellStateFlags;
    if ((*(unsigned char *)&cellStateFlags & 2) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&cellStateFlags & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&cellStateFlags & 2) == 0)
  {
    goto LABEL_3;
  }
  [v4 addObject:@"Expanded"];
  $A3BE8D2F9F885AB89DA145E2B19EE74D cellStateFlags = self->_cellStateFlags;
  if ((*(unsigned char *)&cellStateFlags & 4) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&cellStateFlags & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  [v4 addObject:@"Swiped"];
  $A3BE8D2F9F885AB89DA145E2B19EE74D cellStateFlags = self->_cellStateFlags;
  if ((*(unsigned char *)&cellStateFlags & 8) != 0)
  {
LABEL_5:
    [v4 addObject:@"Reordering"];
    $A3BE8D2F9F885AB89DA145E2B19EE74D cellStateFlags = self->_cellStateFlags;
  }
LABEL_6:
  int v6 = (*(unsigned int *)&cellStateFlags >> 4) & 3;
  if (v6 == 1)
  {
    __int16 v7 = @"cellDragState = Lifting";
  }
  else
  {
    if (v6 != 2) {
      goto LABEL_15;
    }
    __int16 v7 = @"cellDragState = Dragging";
  }
  [v4 addObject:v7];
  *(_WORD *)&$A3BE8D2F9F885AB89DA145E2B19EE74D cellStateFlags = self->_cellStateFlags;
LABEL_15:
  int v8 = *(unsigned char *)&cellStateFlags >> 6;
  if (v8 == 1)
  {
    __int16 v9 = @"cellDropState = Not Targeted";
    goto LABEL_19;
  }
  if (v8 == 2)
  {
    __int16 v9 = @"cellDropState = Targeted";
LABEL_19:
    [v4 addObject:v9];
  }
}

@end