@interface PUAdjustmentInfo
- (BOOL)enabled;
- (BOOL)iconIsColor;
- (NSString)adjustmentKey;
- (NSString)altIconName;
- (NSString)attributeKey;
- (NSString)iconName;
- (NSString)identifier;
- (NSString)localizedActionName;
- (NSString)localizedName;
- (NSString)localizedSectionName;
- (NSString)settingKey;
- (PUAdjustmentCustomBehavior)customSettingDelegate;
- (double)baseLevel;
- (double)currentLevel;
- (double)defaultLevel;
- (double)identityLevel;
- (double)lastAdjustedLevel;
- (double)maximumLevel;
- (double)minimumLevel;
- (double)normalizedCurrentLevel;
- (double)normalizedDefaultLevel;
- (id)altImageTransformBlock;
- (id)copy;
- (id)description;
- (void)setAdjustmentKey:(id)a3;
- (void)setAltIconName:(id)a3;
- (void)setAltImageTransformBlock:(id)a3;
- (void)setAttributeKey:(id)a3;
- (void)setBaseLevel:(double)a3;
- (void)setCurrentLevel:(double)a3;
- (void)setCustomSettingDelegate:(id)a3;
- (void)setDefaultLevel:(double)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setIconIsColor:(BOOL)a3;
- (void)setIconName:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIdentityLevel:(double)a3;
- (void)setLastAdjustedLevel:(double)a3;
- (void)setLocalizedActionName:(id)a3;
- (void)setLocalizedName:(id)a3;
- (void)setLocalizedSectionName:(id)a3;
- (void)setMaximumLevel:(double)a3;
- (void)setMinimumLevel:(double)a3;
- (void)setSettingKey:(id)a3;
@end

@implementation PUAdjustmentInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributeKey, 0);
  objc_storeStrong((id *)&self->_customSettingDelegate, 0);
  objc_storeStrong((id *)&self->_settingKey, 0);
  objc_storeStrong((id *)&self->_adjustmentKey, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_altImageTransformBlock, 0);
  objc_storeStrong((id *)&self->_altIconName, 0);
  objc_storeStrong((id *)&self->_iconName, 0);
  objc_storeStrong((id *)&self->_localizedSectionName, 0);
  objc_storeStrong((id *)&self->_localizedActionName, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
}

- (void)setAttributeKey:(id)a3
{
}

- (NSString)attributeKey
{
  return self->_attributeKey;
}

- (void)setCustomSettingDelegate:(id)a3
{
}

- (PUAdjustmentCustomBehavior)customSettingDelegate
{
  return self->_customSettingDelegate;
}

- (void)setSettingKey:(id)a3
{
}

- (NSString)settingKey
{
  return self->_settingKey;
}

- (void)setAdjustmentKey:(id)a3
{
}

- (NSString)adjustmentKey
{
  return self->_adjustmentKey;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (double)lastAdjustedLevel
{
  return self->_lastAdjustedLevel;
}

- (double)currentLevel
{
  return self->_currentLevel;
}

- (void)setBaseLevel:(double)a3
{
  self->_baseLevel = a3;
}

- (double)baseLevel
{
  return self->_baseLevel;
}

- (void)setMaximumLevel:(double)a3
{
  self->_maximumLevel = a3;
}

- (double)maximumLevel
{
  return self->_maximumLevel;
}

- (void)setMinimumLevel:(double)a3
{
  self->_minimumLevel = a3;
}

- (double)minimumLevel
{
  return self->_minimumLevel;
}

- (void)setIdentityLevel:(double)a3
{
  self->_identityLevel = a3;
}

- (double)identityLevel
{
  return self->_identityLevel;
}

- (void)setDefaultLevel:(double)a3
{
  self->_defaultLevel = a3;
}

- (double)defaultLevel
{
  return self->_defaultLevel;
}

- (void)setIconIsColor:(BOOL)a3
{
  self->_iconIsColor = a3;
}

- (BOOL)iconIsColor
{
  return self->_iconIsColor;
}

- (void)setAltImageTransformBlock:(id)a3
{
}

- (id)altImageTransformBlock
{
  return self->_altImageTransformBlock;
}

- (void)setAltIconName:(id)a3
{
}

- (NSString)altIconName
{
  return self->_altIconName;
}

- (void)setIconName:(id)a3
{
}

- (NSString)iconName
{
  return self->_iconName;
}

- (void)setLocalizedSectionName:(id)a3
{
}

- (NSString)localizedSectionName
{
  return self->_localizedSectionName;
}

- (void)setLocalizedActionName:(id)a3
{
}

- (void)setLocalizedName:(id)a3
{
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(PUAdjustmentInfo *)self localizedName];
  BOOL v7 = [(PUAdjustmentInfo *)self enabled];
  v8 = [(PUAdjustmentInfo *)self localizedSectionName];
  v9 = [(PUAdjustmentInfo *)self adjustmentKey];
  v10 = [(PUAdjustmentInfo *)self settingKey];
  v11 = [(PUAdjustmentInfo *)self attributeKey];
  [(PUAdjustmentInfo *)self minimumLevel];
  uint64_t v13 = v12;
  [(PUAdjustmentInfo *)self maximumLevel];
  uint64_t v15 = v14;
  [(PUAdjustmentInfo *)self defaultLevel];
  uint64_t v17 = v16;
  [(PUAdjustmentInfo *)self identityLevel];
  uint64_t v19 = v18;
  [(PUAdjustmentInfo *)self lastAdjustedLevel];
  uint64_t v21 = v20;
  [(PUAdjustmentInfo *)self currentLevel];
  v23 = [v3 stringWithFormat:@"<%@: %p, name=%@, enabled:%d, sectionName:%@, adjustmentKey=%@, settingsKey:%@, attributeKey:%@, min=%f, max=%f, default=%f, identity=%f, lastAdjusted=%f, current=%f", v5, self, v6, v7, v8, v9, v10, v11, v13, v15, v17, v19, v21, v22];

  return v23;
}

- (NSString)localizedActionName
{
  localizedActionName = self->_localizedActionName;
  if (localizedActionName)
  {
    v3 = localizedActionName;
  }
  else
  {
    v5 = PULocalizedString(@"PHOTOEDIT_ADJUSTMENT_CHANGE_TITLE");
    BOOL v7 = [(PUAdjustmentInfo *)self localizedName];
    PULocalizedStringWithValidatedFormat(v5, @"%@");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)setLastAdjustedLevel:(double)a3
{
  if (self->_lastAdjustedLevel != a3) {
    self->_lastAdjustedLevel = a3;
  }
}

- (void)setCurrentLevel:(double)a3
{
  if (self->_currentLevel != a3)
  {
    -[PUAdjustmentInfo setLastAdjustedLevel:](self, "setLastAdjustedLevel:");
    self->_currentLevel = a3;
  }
}

- (double)normalizedDefaultLevel
{
  [(PUAdjustmentInfo *)self maximumLevel];
  double v4 = v3;
  [(PUAdjustmentInfo *)self minimumLevel];
  if (v4 <= v5) {
    return 2.22507386e-308;
  }
  [(PUAdjustmentInfo *)self defaultLevel];
  double v7 = v6;
  [(PUAdjustmentInfo *)self minimumLevel];
  double v9 = v7 - v8;
  [(PUAdjustmentInfo *)self maximumLevel];
  double v11 = v10;
  [(PUAdjustmentInfo *)self minimumLevel];
  return v9 / (v11 - v12);
}

- (double)normalizedCurrentLevel
{
  [(PUAdjustmentInfo *)self maximumLevel];
  double v4 = v3;
  [(PUAdjustmentInfo *)self minimumLevel];
  if (v4 <= v5) {
    return 2.22507386e-308;
  }
  [(PUAdjustmentInfo *)self currentLevel];
  double v7 = v6;
  [(PUAdjustmentInfo *)self minimumLevel];
  double v9 = v7 - v8;
  [(PUAdjustmentInfo *)self maximumLevel];
  double v11 = v10;
  [(PUAdjustmentInfo *)self minimumLevel];
  return v9 / (v11 - v12);
}

- (id)copy
{
  id result = (id)[(PUAdjustmentInfo *)self doesNotRecognizeSelector:a2];
  __break(1u);
  return result;
}

@end