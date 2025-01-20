@interface SXComponentLayoutRules
+ (id)bodyComponentLayoutRules;
+ (id)defaultLayoutRules;
+ (id)fullWidthLayoutRules;
+ (id)twoColumnLayoutRules;
- (BOOL)allowsIntersection;
- (BOOL)allowsSiblingBasedResizing;
- (BOOL)shouldIgnoreDocumentMargin;
- (BOOL)shouldSpanAllColumns;
- (SXComponentLayoutRules)init;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)minimumColumnSpan;
- (void)setAllowsIntersection:(BOOL)a3;
- (void)setAllowsSiblingBasedResizing:(BOOL)a3;
- (void)setMinimumColumnSpan:(unint64_t)a3;
- (void)setShouldIgnoreDocumentMargin:(BOOL)a3;
- (void)setShouldSpanAllColumns:(BOOL)a3;
@end

@implementation SXComponentLayoutRules

- (SXComponentLayoutRules)init
{
  v3.receiver = self;
  v3.super_class = (Class)SXComponentLayoutRules;
  result = [(SXComponentLayoutRules *)&v3 init];
  if (result)
  {
    result->_minimumColumnSpan = 1;
    *(_DWORD *)&result->_allowsIntersection = 0x10000;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  objc_msgSend(v4, "setMinimumColumnSpan:", -[SXComponentLayoutRules minimumColumnSpan](self, "minimumColumnSpan"));
  objc_msgSend(v4, "setAllowsIntersection:", -[SXComponentLayoutRules allowsIntersection](self, "allowsIntersection"));
  objc_msgSend(v4, "setShouldSpanAllColumns:", -[SXComponentLayoutRules shouldSpanAllColumns](self, "shouldSpanAllColumns"));
  objc_msgSend(v4, "setShouldIgnoreDocumentMargin:", -[SXComponentLayoutRules shouldIgnoreDocumentMargin](self, "shouldIgnoreDocumentMargin"));
  objc_msgSend(v4, "setAllowsSiblingBasedResizing:", -[SXComponentLayoutRules allowsSiblingBasedResizing](self, "allowsSiblingBasedResizing"));
  return v4;
}

- (unint64_t)minimumColumnSpan
{
  return self->_minimumColumnSpan;
}

- (void)setMinimumColumnSpan:(unint64_t)a3
{
  self->_minimumColumnSpan = a3;
}

- (BOOL)allowsIntersection
{
  return self->_allowsIntersection;
}

- (void)setAllowsIntersection:(BOOL)a3
{
  self->_allowsIntersection = a3;
}

- (BOOL)shouldSpanAllColumns
{
  return self->_shouldSpanAllColumns;
}

- (void)setShouldSpanAllColumns:(BOOL)a3
{
  self->_shouldSpanAllColumns = a3;
}

- (BOOL)allowsSiblingBasedResizing
{
  return self->_allowsSiblingBasedResizing;
}

- (void)setAllowsSiblingBasedResizing:(BOOL)a3
{
  self->_allowsSiblingBasedResizing = a3;
}

- (BOOL)shouldIgnoreDocumentMargin
{
  return self->_shouldIgnoreDocumentMargin;
}

- (void)setShouldIgnoreDocumentMargin:(BOOL)a3
{
  self->_shouldIgnoreDocumentMargin = a3;
}

+ (id)defaultLayoutRules
{
  if (defaultLayoutRules_onceToken != -1) {
    dispatch_once(&defaultLayoutRules_onceToken, &__block_literal_global_94);
  }
  v2 = (void *)defaultLayoutRules___defaultComponentLayoutRules;
  return v2;
}

uint64_t __57__SXComponentLayoutRules_Definitions__defaultLayoutRules__block_invoke()
{
  v0 = objc_alloc_init(SXComponentLayoutRules);
  uint64_t v1 = defaultLayoutRules___defaultComponentLayoutRules;
  defaultLayoutRules___defaultComponentLayoutRules = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (id)fullWidthLayoutRules
{
  if (fullWidthLayoutRules_onceToken != -1) {
    dispatch_once(&fullWidthLayoutRules_onceToken, &__block_literal_global_2_1);
  }
  v2 = (void *)fullWidthLayoutRules___fullWidthComponentLayoutRules;
  return v2;
}

uint64_t __59__SXComponentLayoutRules_Definitions__fullWidthLayoutRules__block_invoke()
{
  v0 = objc_alloc_init(SXComponentLayoutRules);
  uint64_t v1 = (void *)fullWidthLayoutRules___fullWidthComponentLayoutRules;
  fullWidthLayoutRules___fullWidthComponentLayoutRules = (uint64_t)v0;

  [(id)fullWidthLayoutRules___fullWidthComponentLayoutRules setMinimumColumnSpan:1];
  [(id)fullWidthLayoutRules___fullWidthComponentLayoutRules setShouldSpanAllColumns:1];
  v2 = (void *)fullWidthLayoutRules___fullWidthComponentLayoutRules;
  return [v2 setAllowsSiblingBasedResizing:0];
}

+ (id)twoColumnLayoutRules
{
  if (twoColumnLayoutRules_onceToken != -1) {
    dispatch_once(&twoColumnLayoutRules_onceToken, &__block_literal_global_4_2);
  }
  v2 = (void *)twoColumnLayoutRules___twoColumnComponentLayoutRules;
  return v2;
}

uint64_t __59__SXComponentLayoutRules_Definitions__twoColumnLayoutRules__block_invoke()
{
  v0 = objc_alloc_init(SXComponentLayoutRules);
  uint64_t v1 = (void *)twoColumnLayoutRules___twoColumnComponentLayoutRules;
  twoColumnLayoutRules___twoColumnComponentLayoutRules = (uint64_t)v0;

  [(id)twoColumnLayoutRules___twoColumnComponentLayoutRules setMinimumColumnSpan:2];
  v2 = (void *)twoColumnLayoutRules___twoColumnComponentLayoutRules;
  return [v2 setAllowsSiblingBasedResizing:0];
}

+ (id)bodyComponentLayoutRules
{
  if (bodyComponentLayoutRules_onceToken != -1) {
    dispatch_once(&bodyComponentLayoutRules_onceToken, &__block_literal_global_6_2);
  }
  v2 = (void *)bodyComponentLayoutRules___bodyComponentLayoutRules;
  return v2;
}

uint64_t __63__SXComponentLayoutRules_Definitions__bodyComponentLayoutRules__block_invoke()
{
  v0 = objc_alloc_init(SXComponentLayoutRules);
  uint64_t v1 = (void *)bodyComponentLayoutRules___bodyComponentLayoutRules;
  bodyComponentLayoutRules___bodyComponentLayoutRules = (uint64_t)v0;

  [(id)bodyComponentLayoutRules___bodyComponentLayoutRules setMinimumColumnSpan:2];
  v2 = (void *)bodyComponentLayoutRules___bodyComponentLayoutRules;
  return [v2 setAllowsIntersection:1];
}

@end