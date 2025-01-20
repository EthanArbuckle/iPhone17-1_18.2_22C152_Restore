@interface PKPassTileState
+ (BOOL)supportsSecureCoding;
+ (id)_createForDictionary:(id)a3 withTileType:(int64_t)a4;
+ (id)_createWithType:(int64_t)a3;
+ (id)createResolvedStateWithType:(int64_t)a3;
+ (void)_createForDictionary:(uint64_t)a3 withTileType:(int)a4 isRoot:;
- (BOOL)_setUpWithDictionary:(id)a3;
- (BOOL)isEnabled;
- (BOOL)isEqualToUnresolvedState:(id)a3;
- (BOOL)isFullBleed;
- (BOOL)isResolved;
- (BOOL)isSelected;
- (NSArray)actionDictionaries;
- (NSArray)actions;
- (PKPassTileImage)icon;
- (PKPassTileState)actionState;
- (PKPassTileState)init;
- (PKPassTileState)initWithCoder:(id)a3;
- (PKPassTileStateCheckIn)stateTypeCheckIn;
- (PKPassTileStateDefault)stateTypeDefault;
- (PKPassTileStateDefaultV2)stateTypeDefaultV2;
- (PKPassTileStateGroup)stateTypeGroup;
- (PKPassTileStateHostedView)stateTypeHostedView;
- (PKPassTileStateMetadata)metadata;
- (PKPaymentPassAction)action;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createResolvedStateWithBundle:(id)a3 privateBundle:(id)a4;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setActionDictionaries:(id)a3;
- (void)setActionState:(id)a3;
- (void)setActions:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFullBleed:(BOOL)a3;
- (void)setIcon:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation PKPassTileState

+ (id)_createForDictionary:(id)a3 withTileType:(int64_t)a4
{
  return +[PKPassTileState _createForDictionary:withTileType:isRoot:]((uint64_t)a1, a3, a4, 1);
}

+ (void)_createForDictionary:(uint64_t)a3 withTileType:(int)a4 isRoot:
{
  id v6 = a2;
  self;
  if (!v6) {
    goto LABEL_10;
  }
  uint64_t v17 = 0;
  if (+[PKPassTileMetadata isGroupType:a3])
  {
    uint64_t v17 = 3;
    goto LABEL_5;
  }
  v7 = [v6 PKStringForKey:@"type"];
  int v8 = PKPassTileStateTypeFromString(v7, &v17);

  if (!v8)
  {
LABEL_10:
    v15 = 0;
    goto LABEL_13;
  }
LABEL_5:
  v9 = +[PKPassTileState _createWithType:](PKPassTileState, "_createWithType:");
  if (v9
    && (+[PKPassTileStateMetadata _createForType:dictionary:](PKPassTileStateMetadata, "_createForType:dictionary:", a3, v6), uint64_t v10 = objc_claimAutoreleasedReturnValue(), v11 = (void *)v9[4], v9[4] = v10, v11, [v9 _setUpWithDictionary:v6]))
  {
    if (a4)
    {
      v12 = [v6 PKDictionaryForKey:@"actionState"];
      uint64_t v13 = +[PKPassTileState _createForDictionary:withTileType:isRoot:](PKPassTileState, v12, a3, 0);
      v14 = (void *)v9[5];
      v9[5] = v13;
    }
    v15 = v9;
  }
  else
  {
    v15 = 0;
  }

LABEL_13:
  return v15;
}

+ (id)_createWithType:(int64_t)a3
{
  if ((unint64_t)a3 >= 5)
  {
    v5 = 0;
    goto LABEL_6;
  }
  id v4 = objc_alloc(*off_1E56DDC78[a3]);
  v5 = v4;
  if (!v4)
  {
LABEL_6:
    v7 = 0;
    goto LABEL_7;
  }
  v9.receiver = v4;
  v9.super_class = (Class)PKPassTileState;
  id v6 = objc_msgSendSuper2(&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    *((void *)v6 + 3) = a3;
    *((unsigned char *)v6 + 18) = 0;
  }
LABEL_7:

  return v7;
}

+ (id)createResolvedStateWithType:(int64_t)a3
{
  if ((unint64_t)a3 >= 5)
  {
    v5 = 0;
    goto LABEL_6;
  }
  id v4 = objc_alloc(*off_1E56DDC78[a3]);
  v5 = v4;
  if (!v4)
  {
LABEL_6:
    v7 = 0;
    goto LABEL_7;
  }
  v9.receiver = v4;
  v9.super_class = (Class)PKPassTileState;
  id v6 = objc_msgSendSuper2(&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    *((void *)v6 + 3) = a3;
    v6[18] = 1;
  }
LABEL_7:

  v7[16] = 1;
  return v7;
}

- (PKPassTileState)init
{
  return 0;
}

- (BOOL)_setUpWithDictionary:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 PKNumberForKey:@"enabled"];
  id v6 = v5;
  if (v5) {
    char v7 = [v5 BOOLValue];
  }
  else {
    char v7 = 1;
  }
  self->_enabled = v7;
  self->_selected = [v4 PKBoolForKey:@"selected"];
  int v8 = [v4 PKDictionaryForKey:@"icon"];
  if (v8)
  {
    objc_super v9 = +[PKPassTileImage _createForDictionary:v8];
    icon = self->_icon;
    self->_icon = v9;
  }
  v11 = [v4 PKArrayContaining:objc_opt_class() forKey:@"actions"];
  actionDictionaries = self->_actionDictionaries;
  self->_actionDictionaries = v11;

  if (!self->_actionDictionaries)
  {
    uint64_t v13 = [v4 PKDictionaryForKey:@"action"];
    v14 = (void *)v13;
    if (v13)
    {
      v18[0] = v13;
      v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
      v16 = self->_actionDictionaries;
      self->_actionDictionaries = v15;
    }
  }

  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[PKPassTileState _createWithType:self->_type];
  objc_storeStrong(v4 + 4, self->_metadata);
  *((unsigned char *)v4 + 16) = self->_enabled;
  *((unsigned char *)v4 + 17) = self->_selected;
  objc_storeStrong(v4 + 5, self->_actionState);
  objc_storeStrong(v4 + 6, self->_icon);
  objc_storeStrong(v4 + 1, self->_actions);
  objc_storeStrong(v4 + 7, self->_actionDictionaries);
  *((unsigned char *)v4 + 18) = self->_resolved;
  return v4;
}

- (id)createResolvedStateWithBundle:(id)a3 privateBundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_resolved) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"PKPassTileState %@ attempting double resolution.", objc_opt_class() format];
  }
  int v8 = +[PKPassTileState _createWithType:self->_type];
  objc_storeStrong(v8 + 4, self->_metadata);
  *((unsigned char *)v8 + 16) = self->_enabled;
  *((unsigned char *)v8 + 17) = self->_selected;
  id v9 = [(PKPassTileState *)self->_actionState createResolvedStateWithBundle:v6 privateBundle:v7];
  id v10 = v8[5];
  v8[5] = v9;

  id v11 = [(PKPassTileImage *)self->_icon createResolvedImageWithBundle:v6 privateBundle:v7];
  id v12 = v8[6];
  v8[6] = v11;

  actionDictionaries = self->_actionDictionaries;
  if (actionDictionaries)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __63__PKPassTileState_createResolvedStateWithBundle_privateBundle___block_invoke;
    v17[3] = &unk_1E56DDC58;
    id v18 = v6;
    uint64_t v14 = [(NSArray *)actionDictionaries pk_createArrayBySafelyApplyingBlock:v17];
    id v15 = v8[1];
    v8[1] = (id)v14;
  }
  *((unsigned char *)v8 + 18) = 1;

  return v8;
}

PKPaymentPassAction *__63__PKPassTileState_createResolvedStateWithBundle_privateBundle___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[PKPaymentPassAction alloc] initWithDictionary:v3 bundle:*(void *)(a1 + 32)];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassTileState)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v21 = 0;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
  char v6 = PKPassTileStateTypeFromString(v5, &v21);

  if (v6 & 1) != 0 && v21 <= 4 && objc_opt_class() && (objc_opt_isKindOfClass())
  {
    if (self
      && (unint64_t v7 = v21,
          v22.receiver = self,
          v22.super_class = (Class)PKPassTileState,
          (int v8 = [(PKPassTileState *)&v22 init]) != 0))
    {
      id v9 = v8;
      v8->_type = v7;
      v8->_resolved = 1;
      uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metadata"];
      metadata = v9->_metadata;
      v9->_metadata = (PKPassTileStateMetadata *)v10;

      v9->_enabled = [v4 decodeBoolForKey:@"enabled"];
      v9->_selected = [v4 decodeBoolForKey:@"selected"];
      uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionState"];
      actionState = v9->_actionState;
      v9->_actionState = (PKPassTileState *)v12;

      uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"icon"];
      icon = v9->_icon;
      v9->_icon = (PKPassTileImage *)v14;

      uint64_t v16 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"actions"];
      actions = v9->_actions;
      v9->_actions = (NSArray *)v16;
    }
    else
    {
      id v9 = 0;
    }
    self = v9;
    v19 = self;
  }
  else
  {
    id v18 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"PKPassTileStateDecoder" code:0 userInfo:0];
    [v4 failWithError:v18];

    v19 = 0;
  }

  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (!self->_resolved)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"PKPassTileState %@ attempting unresolved XPC transfer.", objc_opt_class() format];
    id v4 = v7;
  }
  unint64_t type = self->_type;
  if (type > 4) {
    char v6 = 0;
  }
  else {
    char v6 = off_1E56DDCA0[type];
  }
  [v4 encodeObject:v6 forKey:@"type"];
  [v7 encodeObject:self->_metadata forKey:@"metadata"];
  [v7 encodeBool:self->_enabled forKey:@"enabled"];
  [v7 encodeBool:self->_selected forKey:@"selected"];
  [v7 encodeObject:self->_actionState forKey:@"actionState"];
  [v7 encodeObject:self->_icon forKey:@"icon"];
  [v7 encodeObject:self->_actions forKey:@"actions"];
}

- (BOOL)isEqualToUnresolvedState:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  v5 = v4;
  if (v4[18] || self->_resolved || *((void *)v4 + 3) != self->_type) {
    goto LABEL_23;
  }
  char v6 = (void *)*((void *)v4 + 4);
  metadata = self->_metadata;
  if (v6)
  {
    if (!metadata || (objc_msgSend(v6, "isEqualToUnresolvedMetadata:") & 1) == 0) {
      goto LABEL_23;
    }
  }
  else if (metadata)
  {
    goto LABEL_23;
  }
  if (v5[16] != self->_enabled || v5[17] != self->_selected) {
    goto LABEL_23;
  }
  int v8 = (void *)*((void *)v5 + 6);
  icon = self->_icon;
  if (v8)
  {
    if (!icon || (objc_msgSend(v8, "isEqualToUnresolvedImage:") & 1) == 0) {
      goto LABEL_23;
    }
  }
  else if (icon)
  {
    goto LABEL_23;
  }
  uint64_t v10 = (NSArray *)*((void *)v5 + 7);
  actionDictionaries = self->_actionDictionaries;
  if (!v10 || !actionDictionaries)
  {
    if (v10 == actionDictionaries) {
      goto LABEL_19;
    }
LABEL_23:
    BOOL v14 = 0;
    goto LABEL_24;
  }
  if ((-[NSArray isEqual:](v10, "isEqual:") & 1) == 0) {
    goto LABEL_23;
  }
LABEL_19:
  uint64_t v12 = (PKPassTileState *)*((void *)v5 + 5);
  actionState = self->_actionState;
  if (v12 && actionState) {
    BOOL v14 = -[PKPassTileState isEqualToUnresolvedState:](v12, "isEqualToUnresolvedState:");
  }
  else {
    BOOL v14 = v12 == actionState;
  }
LABEL_24:

  return v14;
}

- (PKPaymentPassAction)action
{
  actions = self->_actions;
  if (actions)
  {
    actions = [actions firstObject];
  }
  return (PKPaymentPassAction *)actions;
}

- (void)setActions:(id)a3
{
  id v5 = a3;
  if (self->_resolved)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_actions, a3);
    id v5 = v6;
  }
}

- (PKPassTileStateDefault)stateTypeDefault
{
  if (self->_type) {
    self = 0;
  }
  return (PKPassTileStateDefault *)self;
}

- (PKPassTileStateDefaultV2)stateTypeDefaultV2
{
  if (self->_type != 1) {
    self = 0;
  }
  return (PKPassTileStateDefaultV2 *)self;
}

- (PKPassTileStateCheckIn)stateTypeCheckIn
{
  if (self->_type != 2) {
    self = 0;
  }
  return (PKPassTileStateCheckIn *)self;
}

- (PKPassTileStateGroup)stateTypeGroup
{
  if (self->_type != 3) {
    self = 0;
  }
  return (PKPassTileStateGroup *)self;
}

- (PKPassTileStateHostedView)stateTypeHostedView
{
  if (self->_type != 4) {
    self = 0;
  }
  return (PKPassTileStateHostedView *)self;
}

- (int64_t)type
{
  return self->_type;
}

- (PKPassTileStateMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (PKPassTileState)actionState
{
  return self->_actionState;
}

- (void)setActionState:(id)a3
{
}

- (PKPassTileImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (BOOL)isResolved
{
  return self->_resolved;
}

- (NSArray)actions
{
  return self->_actions;
}

- (BOOL)isFullBleed
{
  return self->_fullBleed;
}

- (void)setFullBleed:(BOOL)a3
{
  self->_fullBleed = a3;
}

- (NSArray)actionDictionaries
{
  return self->_actionDictionaries;
}

- (void)setActionDictionaries:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionDictionaries, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_actionState, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_actions, 0);
}

@end