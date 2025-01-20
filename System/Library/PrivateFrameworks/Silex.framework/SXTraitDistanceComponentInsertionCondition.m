@interface SXTraitDistanceComponentInsertionCondition
- (BOOL)validateMarker:(id)a3 componentTraits:(unint64_t)a4 layoutProvider:(id)a5;
- (NSMutableIndexSet)otherTraitAreas;
- (NSMutableIndexSet)traitAreas;
- (SXTraitDistanceComponentInsertionCondition)initWithTrait:(unint64_t)a3 otherTrait:(unint64_t)a4 distance:(_SXConvertibleValue)a5;
- (_SXConvertibleValue)distance;
- (unint64_t)componentTrait;
- (unint64_t)otherComponentTrait;
- (void)insertedComponent:(id)a3 approximateLocation:(CGPoint)a4;
- (void)inspectTraitAreasForComponents:(id)a3 layoutProvider:(id)a4 DOMObjectProvider:(id)a5;
- (void)prepareWithComponents:(id)a3 layoutProvider:(id)a4 DOMObjectProvider:(id)a5;
- (void)setOtherTraitAreas:(id)a3;
- (void)setTraitAreas:(id)a3;
@end

@implementation SXTraitDistanceComponentInsertionCondition

- (SXTraitDistanceComponentInsertionCondition)initWithTrait:(unint64_t)a3 otherTrait:(unint64_t)a4 distance:(_SXConvertibleValue)a5
{
  unint64_t unit = a5.unit;
  double value = a5.value;
  v10.receiver = self;
  v10.super_class = (Class)SXTraitDistanceComponentInsertionCondition;
  result = [(SXTraitDistanceComponentInsertionCondition *)&v10 init];
  if (result)
  {
    result->_componentTrait = a3;
    result->_otherComponentTrait = a4;
    result->_distance.double value = value;
    result->_distance.unint64_t unit = unit;
  }
  return result;
}

- (void)prepareWithComponents:(id)a3 layoutProvider:(id)a4 DOMObjectProvider:(id)a5
{
  v8 = (void *)MEMORY[0x263F089C8];
  id v9 = a5;
  id v10 = a4;
  id v15 = a3;
  v11 = [v8 indexSet];
  traitAreas = self->_traitAreas;
  self->_traitAreas = v11;

  v13 = [MEMORY[0x263F089C8] indexSet];
  otherTraitAreas = self->_otherTraitAreas;
  self->_otherTraitAreas = v13;

  [(SXTraitDistanceComponentInsertionCondition *)self inspectTraitAreasForComponents:v15 layoutProvider:v10 DOMObjectProvider:v9];
}

- (void)insertedComponent:(id)a3 approximateLocation:(CGPoint)a4
{
  double y = a4.y;
  id v10 = a3;
  uint64_t v6 = [v10 traits];
  if (([(SXTraitDistanceComponentInsertionCondition *)self componentTrait] & v6) != 0)
  {
    v7 = [(SXTraitDistanceComponentInsertionCondition *)self traitAreas];
    [v7 addIndex:(unint64_t)y];
  }
  uint64_t v8 = [v10 traits];
  if (([(SXTraitDistanceComponentInsertionCondition *)self otherComponentTrait] & v8) != 0)
  {
    id v9 = [(SXTraitDistanceComponentInsertionCondition *)self otherTraitAreas];
    [v9 addIndex:(unint64_t)y];
  }
}

- (BOOL)validateMarker:(id)a3 componentTraits:(unint64_t)a4 layoutProvider:(id)a5
{
  id v8 = a3;
  id v9 = [a5 unitConverterForMarker:v8];
  uint64_t v10 = [(SXTraitDistanceComponentInsertionCondition *)self distance];
  objc_msgSend(v9, "convertValueToPoints:", v10, v11);
  double v13 = v12;
  [v8 approximateLocation];
  double v15 = v14;

  if (([(SXTraitDistanceComponentInsertionCondition *)self otherComponentTrait] & a4) != 0)
  {
    v16 = [(SXTraitDistanceComponentInsertionCondition *)self traitAreas];
    char v17 = objc_msgSend(v16, "intersectsIndexesInRange:", (unint64_t)(v15 - v13), (unint64_t)(v13 + v13));

    if (v17) {
      goto LABEL_5;
    }
  }
  if (([(SXTraitDistanceComponentInsertionCondition *)self componentTrait] & a4) != 0
    && ([(SXTraitDistanceComponentInsertionCondition *)self otherTraitAreas],
        v18 = objc_claimAutoreleasedReturnValue(),
        char v19 = objc_msgSend(v18, "intersectsIndexesInRange:", (unint64_t)(v15 - v13), (unint64_t)(v13 + v13)), v18, (v19 & 1) != 0))
  {
LABEL_5:
    BOOL v20 = 0;
  }
  else
  {
    BOOL v20 = 1;
  }

  return v20;
}

- (void)inspectTraitAreasForComponents:(id)a3 layoutProvider:(id)a4 DOMObjectProvider:(id)a5
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v8;
  uint64_t v11 = [v8 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v41 = *(void *)v43;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v43 != v41) {
          objc_enumerationMutation(obj);
        }
        double v14 = *(void **)(*((void *)&v42 + 1) + 8 * v13);
        double v15 = [[SXComponentTraitsProvider alloc] initWithDOMObjectProvider:v10];
        uint64_t v16 = [(SXComponentTraitsProvider *)v15 traitsForComponent:v14];
        if (([(SXTraitDistanceComponentInsertionCondition *)self componentTrait] & v16) != 0)
        {
          [v9 frameForComponent:v14];
          CGFloat v18 = v17;
          CGFloat v20 = v19;
          CGFloat v22 = v21;
          CGFloat v24 = v23;
          v25 = [(SXTraitDistanceComponentInsertionCondition *)self traitAreas];
          v48.origin.x = v18;
          v48.origin.double y = v20;
          v48.size.width = v22;
          v48.size.height = v24;
          unint64_t MinY = (unint64_t)CGRectGetMinY(v48);
          v49.origin.x = v18;
          v49.origin.double y = v20;
          v49.size.width = v22;
          v49.size.height = v24;
          double Height = CGRectGetHeight(v49);
          if (Height < 1.0) {
            double Height = 1.0;
          }
          objc_msgSend(v25, "addIndexesInRange:", MinY, (unint64_t)Height);
        }
        if (([(SXTraitDistanceComponentInsertionCondition *)self otherComponentTrait] & v16) != 0)
        {
          [v9 frameForComponent:v14];
          CGFloat v29 = v28;
          CGFloat v31 = v30;
          CGFloat v33 = v32;
          CGFloat v35 = v34;
          v36 = [(SXTraitDistanceComponentInsertionCondition *)self otherTraitAreas];
          v50.origin.x = v29;
          v50.origin.double y = v31;
          v50.size.width = v33;
          v50.size.height = v35;
          unint64_t v37 = (unint64_t)CGRectGetMinY(v50);
          v51.origin.x = v29;
          v51.origin.double y = v31;
          v51.size.width = v33;
          v51.size.height = v35;
          double v38 = CGRectGetHeight(v51);
          if (v38 < 1.0) {
            double v38 = 1.0;
          }
          objc_msgSend(v36, "addIndexesInRange:", v37, (unint64_t)v38);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v39 = [v14 components];
          [(SXTraitDistanceComponentInsertionCondition *)self inspectTraitAreasForComponents:v39 layoutProvider:v9 DOMObjectProvider:v10];
        }
        ++v13;
      }
      while (v12 != v13);
      uint64_t v12 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v12);
  }
}

- (unint64_t)componentTrait
{
  return self->_componentTrait;
}

- (unint64_t)otherComponentTrait
{
  return self->_otherComponentTrait;
}

- (_SXConvertibleValue)distance
{
  unint64_t unit = self->_distance.unit;
  double value = self->_distance.value;
  result.unint64_t unit = unit;
  result.double value = value;
  return result;
}

- (NSMutableIndexSet)traitAreas
{
  return self->_traitAreas;
}

- (void)setTraitAreas:(id)a3
{
}

- (NSMutableIndexSet)otherTraitAreas
{
  return self->_otherTraitAreas;
}

- (void)setOtherTraitAreas:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherTraitAreas, 0);
  objc_storeStrong((id *)&self->_traitAreas, 0);
}

@end