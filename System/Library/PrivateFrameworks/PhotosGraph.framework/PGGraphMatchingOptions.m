@interface PGGraphMatchingOptions
+ (id)optionsWithRelatedType:(unint64_t)a3;
+ (unsigned)defaultTargetEventDomain;
- (BOOL)needsKeywords;
- (NSArray)sortDescriptors;
- (NSSet)focusedNodes;
- (PGGraphMatchingOptions)init;
- (unint64_t)relatedType;
- (unsigned)targetEventDomain;
- (void)setFocusedNodes:(id)a3;
- (void)setNeedsKeywords:(BOOL)a3;
- (void)setRelatedType:(unint64_t)a3;
- (void)setSortDescriptors:(id)a3;
- (void)setTargetEventDomain:(unsigned __int16)a3;
@end

@implementation PGGraphMatchingOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_focusedNodes, 0);
}

- (void)setNeedsKeywords:(BOOL)a3
{
  self->_needsKeywords = a3;
}

- (BOOL)needsKeywords
{
  return self->_needsKeywords;
}

- (void)setSortDescriptors:(id)a3
{
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (void)setFocusedNodes:(id)a3
{
}

- (NSSet)focusedNodes
{
  return self->_focusedNodes;
}

- (void)setTargetEventDomain:(unsigned __int16)a3
{
  self->_targetEventDomain = a3;
}

- (unsigned)targetEventDomain
{
  return self->_targetEventDomain;
}

- (void)setRelatedType:(unint64_t)a3
{
  self->_relatedType = a3;
}

- (unint64_t)relatedType
{
  return self->_relatedType;
}

- (PGGraphMatchingOptions)init
{
  v5.receiver = self;
  v5.super_class = (Class)PGGraphMatchingOptions;
  v2 = [(PGGraphMatchingOptions *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_relatedType = 63;
    v2->_targetEventDomain = [(id)objc_opt_class() defaultTargetEventDomain];
    v3->_needsKeywords = 0;
  }
  return v3;
}

+ (unsigned)defaultTargetEventDomain
{
  return 102;
}

+ (id)optionsWithRelatedType:(unint64_t)a3
{
  v4 = objc_opt_new();
  [v4 setRelatedType:a3];
  return v4;
}

@end