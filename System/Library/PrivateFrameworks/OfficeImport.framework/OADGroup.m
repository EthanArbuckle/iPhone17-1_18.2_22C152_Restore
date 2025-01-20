@interface OADGroup
- (CGRect)logicalBounds;
- (NSString)description;
- (OADGroup)init;
- (id)childAtIndex:(unint64_t)a3;
- (id)children;
- (id)groupProperties;
- (unint64_t)childCount;
- (void)addChild:(id)a3;
- (void)addChildren:(id)a3;
- (void)changeParentTextListStylePreservingEffectiveValues:(id)a3;
- (void)removeChild:(id)a3;
- (void)removeUnnecessaryOverrides;
- (void)replaceChild:(id)a3 with:(id)a4;
- (void)setLogicalBounds:(CGRect)a3;
- (void)setParentTextListStyle:(id)a3;
@end

@implementation OADGroup

- (OADGroup)init
{
  uint64_t v3 = objc_opt_class();
  v8.receiver = self;
  v8.super_class = (Class)OADGroup;
  v4 = [(OADDrawable *)&v8 initWithPropertiesClass:v3];
  if (v4)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mChildren = v4->mChildren;
    v4->mChildren = v5;
  }
  return v4;
}

- (void)setLogicalBounds:(CGRect)a3
{
  self->mLogicalBounds = a3;
}

- (void)addChildren:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [v7 count];
  if (v4)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      v6 = [v7 objectAtIndex:i];
      [v6 setParent:self];
    }
  }
  [(NSMutableArray *)self->mChildren addObjectsFromArray:v7];
}

- (void)setParentTextListStyle:(id)a3
{
}

- (void)removeUnnecessaryOverrides
{
  v3.receiver = self;
  v3.super_class = (Class)OADGroup;
  [(OADDrawable *)&v3 removeUnnecessaryOverrides];
  [(NSMutableArray *)self->mChildren makeObjectsPerformSelector:sel_removeUnnecessaryOverrides];
}

- (id)children
{
  return self->mChildren;
}

- (unint64_t)childCount
{
  return [(NSMutableArray *)self->mChildren count];
}

- (CGRect)logicalBounds
{
  double x = self->mLogicalBounds.origin.x;
  double y = self->mLogicalBounds.origin.y;
  double width = self->mLogicalBounds.size.width;
  double height = self->mLogicalBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)childAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->mChildren objectAtIndex:a3];
}

- (void)addChild:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(NSMutableArray *)self->mChildren addObject:v4];
    [v4 setParent:self];
  }
}

- (id)groupProperties
{
  return self->super.mDrawableProperties;
}

- (void)replaceChild:(id)a3 with:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  uint64_t v7 = [(NSMutableArray *)self->mChildren indexOfObjectIdenticalTo:v8];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [v8 setParent:0];
    [(NSMutableArray *)self->mChildren replaceObjectAtIndex:v7 withObject:v6];
    [v6 setParent:self];
  }
}

- (void)removeChild:(id)a3
{
  id v5 = a3;
  uint64_t v4 = -[NSMutableArray indexOfObjectIdenticalTo:](self->mChildren, "indexOfObjectIdenticalTo:");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [v5 setParent:0];
    [(NSMutableArray *)self->mChildren removeObjectAtIndex:v4];
  }
}

- (void)changeParentTextListStylePreservingEffectiveValues:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = self->mChildren;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "changeParentTextListStylePreservingEffectiveValues:", v4, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (NSString)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADGroup;
  v2 = [(OADDrawable *)&v4 description];
  return (NSString *)v2;
}

- (void).cxx_destruct
{
}

@end