@interface TSDPropertySourceForModifyPrototypeChange
- (BOOL)containsProperty:(int)a3;
- (TSDPropertySourceForModifyPrototypeChange)initWithPrototypeChange:(id)a3 afterChange:(BOOL)a4;
- (double)CGFloatValueForProperty:(int)a3;
- (double)doubleValueForProperty:(int)a3;
- (float)floatValueForProperty:(int)a3;
- (id)boxedObjectForProperty:(int)a3;
- (id)objectForProperty:(int)a3;
- (id)p_propertyMap;
- (int)intValueForProperty:(int)a3;
@end

@implementation TSDPropertySourceForModifyPrototypeChange

- (TSDPropertySourceForModifyPrototypeChange)initWithPrototypeChange:(id)a3 afterChange:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TSDPropertySourceForModifyPrototypeChange;
  result = [(TSDPropertySourceForModifyPrototypeChange *)&v7 init];
  if (result)
  {
    result->mChange = (TSDModifyPrototypeChange *)a3;
    result->mAfterChange = a4;
  }
  return result;
}

- (id)p_propertyMap
{
  BOOL mAfterChange = self->mAfterChange;
  mChange = self->mChange;
  if (mAfterChange) {
    return [(TSDModifyPrototypeChange *)mChange changedPropertyMapAfterChange];
  }
  else {
    return [(TSDModifyPrototypeChange *)mChange changedPropertyMapBeforeChange];
  }
}

- (BOOL)containsProperty:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(TSSPropertySet *)[(TSDModifyPrototypeChange *)self->mChange changedPropertySet] containsProperty:*(void *)&a3])
  {
    return 1;
  }
  id v6 = [(TSDModifyPrototypeChange *)self->mChange prototype];

  return [v6 containsProperty:v3];
}

- (id)boxedObjectForProperty:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(TSSPropertySet *)[(TSDModifyPrototypeChange *)self->mChange changedPropertySet] containsProperty:*(void *)&a3])
  {
    id v5 = [(TSDPropertySourceForModifyPrototypeChange *)self p_propertyMap];
  }
  else
  {
    id v5 = [(TSDModifyPrototypeChange *)self->mChange prototype];
  }

  return (id)[v5 boxedObjectForProperty:v3];
}

- (id)objectForProperty:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(TSSPropertySet *)[(TSDModifyPrototypeChange *)self->mChange changedPropertySet] containsProperty:*(void *)&a3])
  {
    id v5 = [(TSDPropertySourceForModifyPrototypeChange *)self p_propertyMap];
  }
  else
  {
    id v5 = [(TSDModifyPrototypeChange *)self->mChange prototype];
  }

  return (id)[v5 objectForProperty:v3];
}

- (int)intValueForProperty:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(TSSPropertySet *)[(TSDModifyPrototypeChange *)self->mChange changedPropertySet] containsProperty:*(void *)&a3])
  {
    id v5 = [(TSDPropertySourceForModifyPrototypeChange *)self p_propertyMap];
  }
  else
  {
    id v5 = [(TSDModifyPrototypeChange *)self->mChange prototype];
  }

  return [v5 intValueForProperty:v3];
}

- (float)floatValueForProperty:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(TSSPropertySet *)[(TSDModifyPrototypeChange *)self->mChange changedPropertySet] containsProperty:*(void *)&a3])
  {
    id v5 = [(TSDPropertySourceForModifyPrototypeChange *)self p_propertyMap];
  }
  else
  {
    id v5 = [(TSDModifyPrototypeChange *)self->mChange prototype];
  }

  [v5 floatValueForProperty:v3];
  return result;
}

- (double)doubleValueForProperty:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(TSSPropertySet *)[(TSDModifyPrototypeChange *)self->mChange changedPropertySet] containsProperty:*(void *)&a3])
  {
    id v5 = [(TSDPropertySourceForModifyPrototypeChange *)self p_propertyMap];
  }
  else
  {
    id v5 = [(TSDModifyPrototypeChange *)self->mChange prototype];
  }

  [v5 doubleValueForProperty:v3];
  return result;
}

- (double)CGFloatValueForProperty:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(TSSPropertySet *)[(TSDModifyPrototypeChange *)self->mChange changedPropertySet] containsProperty:*(void *)&a3])
  {
    id v5 = [(TSDPropertySourceForModifyPrototypeChange *)self p_propertyMap];
  }
  else
  {
    id v5 = [(TSDModifyPrototypeChange *)self->mChange prototype];
  }

  [v5 CGFloatValueForProperty:v3];
  return result;
}

@end