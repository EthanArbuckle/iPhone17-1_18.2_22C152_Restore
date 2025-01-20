@interface SKUISettingsDescriptionUpdate
- (NSArray)indexPaths;
- (NSIndexSet)indexSet;
- (SKUISettingsDescriptionUpdate)initWithUpdateType:(int64_t)a3;
- (int64_t)updateType;
- (void)setIndexPaths:(id)a3;
- (void)setIndexSet:(id)a3;
@end

@implementation SKUISettingsDescriptionUpdate

- (SKUISettingsDescriptionUpdate)initWithUpdateType:(int64_t)a3
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUISettingsDescriptionUpdate initWithUpdateType:]();
  }
  v6.receiver = self;
  v6.super_class = (Class)SKUISettingsDescriptionUpdate;
  result = [(SKUISettingsDescriptionUpdate *)&v6 init];
  if (result) {
    result->_updateType = a3;
  }
  return result;
}

- (NSArray)indexPaths
{
  return self->_indexPaths;
}

- (void)setIndexPaths:(id)a3
{
}

- (NSIndexSet)indexSet
{
  return self->_indexSet;
}

- (void)setIndexSet:(id)a3
{
}

- (int64_t)updateType
{
  return self->_updateType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexSet, 0);

  objc_storeStrong((id *)&self->_indexPaths, 0);
}

- (void)initWithUpdateType:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUISettingsDescriptionUpdate initWithUpdateType:]";
}

@end