@interface NCNotificationSound
- (BOOL)isEqual:(id)a3;
- (BOOL)isRepeating;
- (NCNotificationSound)initWithNotificationSound:(id)a3;
- (NSDictionary)controllerAttributes;
- (NSDictionary)vibrationPattern;
- (NSString)debugDescription;
- (NSString)ringtoneName;
- (NSString)songPath;
- (TLAlertConfiguration)alertConfiguration;
- (double)maxDuration;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)soundType;
- (unint64_t)hash;
- (unint64_t)soundBehavior;
- (unsigned)systemSoundID;
@end

@implementation NCNotificationSound

- (NCNotificationSound)initWithNotificationSound:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)NCNotificationSound;
  v5 = [(NCNotificationSound *)&v23 init];
  if (v5)
  {
    v5->_soundType = [v4 soundType];
    v5->_systemSoundID = [v4 systemSoundID];
    v5->_soundBehavior = [v4 soundBehavior];
    v6 = [v4 ringtoneName];
    uint64_t v7 = [v6 copy];
    ringtoneName = v5->_ringtoneName;
    v5->_ringtoneName = (NSString *)v7;

    v9 = [v4 vibrationPattern];
    uint64_t v10 = [v9 copy];
    vibrationPattern = v5->_vibrationPattern;
    v5->_vibrationPattern = (NSDictionary *)v10;

    v5->_repeats = [v4 isRepeating];
    [v4 maxDuration];
    v5->_maxDuration = v12;
    v13 = [v4 controllerAttributes];
    uint64_t v14 = [v13 copy];
    controllerAttributes = v5->_controllerAttributes;
    v5->_controllerAttributes = (NSDictionary *)v14;

    v16 = [v4 songPath];
    uint64_t v17 = [v16 copy];
    songPath = v5->_songPath;
    v5->_songPath = (NSString *)v17;

    v19 = [v4 alertConfiguration];
    uint64_t v20 = [v19 copy];
    alertConfiguration = v5->_alertConfiguration;
    v5->_alertConfiguration = (TLAlertConfiguration *)v20;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v5 = 0;
LABEL_15:
      char v27 = 0;
      goto LABEL_16;
    }
  }
  id v5 = v4;
  if (!v5) {
    goto LABEL_15;
  }
  int64_t v6 = [(NCNotificationSound *)self soundType];
  if (v6 != [v5 soundType]) {
    goto LABEL_15;
  }
  unsigned int v7 = [(NCNotificationSound *)self systemSoundID];
  if (v7 != [v5 systemSoundID]) {
    goto LABEL_15;
  }
  unint64_t v8 = [(NCNotificationSound *)self soundBehavior];
  if (v8 != [v5 soundBehavior]) {
    goto LABEL_15;
  }
  v9 = [(NCNotificationSound *)self ringtoneName];
  uint64_t v10 = [v5 ringtoneName];
  int v11 = NCIsEqual(v9, v10);

  if (!v11) {
    goto LABEL_15;
  }
  double v12 = [(NCNotificationSound *)self vibrationPattern];
  v13 = [v5 vibrationPattern];
  int v14 = NCIsEqual(v12, v13);

  if (!v14) {
    goto LABEL_15;
  }
  int v15 = [(NCNotificationSound *)self isRepeating];
  if (v15 != [v5 isRepeating]) {
    goto LABEL_15;
  }
  [(NCNotificationSound *)self maxDuration];
  double v17 = v16;
  [v5 maxDuration];
  if (v17 != v18) {
    goto LABEL_15;
  }
  v19 = [(NCNotificationSound *)self controllerAttributes];
  uint64_t v20 = [v5 controllerAttributes];
  int v21 = NCIsEqual(v19, v20);

  if (!v21) {
    goto LABEL_15;
  }
  v22 = [(NCNotificationSound *)self songPath];
  objc_super v23 = [v5 songPath];
  int v24 = NCIsEqual(v22, v23);

  if (!v24) {
    goto LABEL_15;
  }
  v25 = [(NCNotificationSound *)self alertConfiguration];
  v26 = [v5 alertConfiguration];
  char v27 = NCIsEqual(v25, v26);

LABEL_16:
  return v27;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_ringtoneName hash];
  NSUInteger v4 = [(NSDictionary *)self->_vibrationPattern hash] + v3;
  uint64_t v5 = [(NSDictionary *)self->_controllerAttributes hash];
  NSUInteger v6 = v4 + v5 + [(TLAlertConfiguration *)self->_alertConfiguration hash];
  return v6 + [(NSString *)self->_songPath hash];
}

- (NSString)debugDescription
{
  return (NSString *)[(NCNotificationSound *)self descriptionWithMultilinePrefix:0];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  NSUInteger v4 = [NCMutableNotificationSound alloc];

  return [(NCNotificationSound *)v4 initWithNotificationSound:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  NSUInteger v3 = [(NCNotificationSound *)self descriptionBuilderWithMultilinePrefix:a3];
  NSUInteger v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  NSUInteger v4 = (void *)MEMORY[0x263F29C40];
  id v5 = a3;
  NSUInteger v6 = [v4 builderWithObject:self];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __61__NCNotificationSound_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_264559E60;
  id v7 = v6;
  id v11 = v7;
  double v12 = self;
  [v7 appendBodySectionWithName:0 multilinePrefix:v5 block:v10];

  id v8 = v7;
  return v8;
}

void __61__NCNotificationSound_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "soundType"), @"soundType");
  id v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "systemSoundID"), @"systemSoundID");
  id v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "soundBehavior"), @"soundBehavior");
  id v5 = *(void **)(a1 + 32);
  NSUInteger v6 = [*(id *)(a1 + 40) ringtoneName];
  id v7 = (id)[v5 appendObject:v6 withName:@"ringtoneName" skipIfNil:1];

  id v8 = *(void **)(a1 + 32);
  v9 = [*(id *)(a1 + 40) vibrationPattern];
  [v8 appendDictionarySection:v9 withName:@"vibrationPattern" skipIfEmpty:1];

  id v10 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isRepeating"), @"isRepeating");
  id v11 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) maxDuration];
  id v12 = (id)objc_msgSend(v11, "appendTimeInterval:withName:decomposeUnits:", @"maxDuration", 0);
  v13 = *(void **)(a1 + 32);
  int v14 = [*(id *)(a1 + 40) controllerAttributes];
  [v13 appendDictionarySection:v14 withName:@"controllerAttributes" skipIfEmpty:1];

  int v15 = *(void **)(a1 + 32);
  double v16 = [*(id *)(a1 + 40) alertConfiguration];
  id v17 = (id)[v15 appendObject:v16 withName:@"alertConfiguration" skipIfNil:1];

  double v18 = *(void **)(a1 + 32);
  id v20 = [*(id *)(a1 + 40) songPath];
  id v19 = (id)[v18 appendObject:v20 withName:@"songPath" skipIfNil:1];
}

- (id)succinctDescription
{
  id v2 = [(NCNotificationSound *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  id v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", -[NCNotificationSound soundType](self, "soundType"));
  id v5 = (id)[v3 appendObject:v4 withName:@"soundType"];

  NSUInteger v6 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", -[NCNotificationSound systemSoundID](self, "systemSoundID"));
  id v7 = (id)[v3 appendObject:v6 withName:@"systemSoundID" skipIfNil:1];

  id v8 = [(NCNotificationSound *)self ringtoneName];
  id v9 = (id)[v3 appendObject:v8 withName:@"ringtoneName" skipIfNil:1];

  id v10 = [(NCNotificationSound *)self alertConfiguration];
  id v11 = (id)[v3 appendObject:v10 withName:@"alertConfiguration" skipIfNil:1];

  id v12 = [(NCNotificationSound *)self songPath];
  id v13 = (id)[v3 appendObject:v12 withName:@"songPath" skipIfNil:1];

  return v3;
}

- (int64_t)soundType
{
  return self->_soundType;
}

- (unsigned)systemSoundID
{
  return self->_systemSoundID;
}

- (unint64_t)soundBehavior
{
  return self->_soundBehavior;
}

- (NSString)ringtoneName
{
  return self->_ringtoneName;
}

- (NSDictionary)vibrationPattern
{
  return self->_vibrationPattern;
}

- (BOOL)isRepeating
{
  return self->_repeats;
}

- (double)maxDuration
{
  return self->_maxDuration;
}

- (NSDictionary)controllerAttributes
{
  return self->_controllerAttributes;
}

- (NSString)songPath
{
  return self->_songPath;
}

- (TLAlertConfiguration)alertConfiguration
{
  return self->_alertConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertConfiguration, 0);
  objc_storeStrong((id *)&self->_songPath, 0);
  objc_storeStrong((id *)&self->_controllerAttributes, 0);
  objc_storeStrong((id *)&self->_vibrationPattern, 0);

  objc_storeStrong((id *)&self->_ringtoneName, 0);
}

@end