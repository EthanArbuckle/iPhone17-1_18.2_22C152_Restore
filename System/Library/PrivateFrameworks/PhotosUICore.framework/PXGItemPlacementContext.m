@interface PXGItemPlacementContext
- (CGRect)_convertRect:(CGRect)a3 fromCoordinateSpace:(id)a4 toLayout:(id)a5;
- (CGRect)_convertRect:(CGRect)a3 fromLayout:(id)a4 toCoordinateSpace:(id)a5;
- (NSString)diagnosticDescription;
- (PXGItemPlacementContext)init;
- (PXGItemPlacementContext)initWithOriginOfLayout:(id)a3 atPoint:(CGPoint)a4 inCoordinateSpace:(id)a5;
- (id)_adjustedPreferredPlacementForPlacement:(id)a3;
- (void)_adjustPreferredPlacementInSourceWithIdentifier:(id)a3 configuration:(id)a4;
- (void)_registerOriginalPlacement:(id)a3 forSourceIdentifiers:(id)a4;
@end

@implementation PXGItemPlacementContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placementUUIDsBySourceIdentifier, 0);
  objc_storeStrong((id *)&self->_adjustedPreferredPlacementsByPlacementUUID, 0);
  objc_destroyWeak((id *)&self->_referenceCoordinateSpace);
  objc_storeStrong((id *)&self->_referenceLayout, 0);
}

- (id)_adjustedPreferredPlacementForPlacement:(id)a3
{
  adjustedPreferredPlacementsByPlacementUUID = self->_adjustedPreferredPlacementsByPlacementUUID;
  v4 = [a3 uuid];
  v5 = [(NSMutableDictionary *)adjustedPreferredPlacementsByPlacementUUID objectForKeyedSubscript:v4];

  return v5;
}

- (void)_adjustPreferredPlacementInSourceWithIdentifier:(id)a3 configuration:(id)a4
{
  id v11 = a4;
  v7 = [(NSMutableDictionary *)self->_placementUUIDsBySourceIdentifier objectForKeyedSubscript:a3];
  if (v7)
  {
    v8 = [(NSMutableDictionary *)self->_adjustedPreferredPlacementsByPlacementUUID objectForKeyedSubscript:v7];
    if (!v8)
    {
      v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2, self, @"PXGItemPlacement.m", 348, @"Invalid parameter not satisfying: %@", @"placement != nil" object file lineNumber description];
    }
    v9 = (void *)[v8 copyWithConfiguration:v11];
    [(NSMutableDictionary *)self->_adjustedPreferredPlacementsByPlacementUUID setObject:v9 forKeyedSubscript:v7];
  }
}

- (void)_registerOriginalPlacement:(id)a3 forSourceIdentifiers:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v7 count])
  {
    v8 = [v6 uuid];
    if (!self->_placementUUIDsBySourceIdentifier)
    {
      v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      placementUUIDsBySourceIdentifier = self->_placementUUIDsBySourceIdentifier;
      self->_placementUUIDsBySourceIdentifier = v9;
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v11 = v7;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_placementUUIDsBySourceIdentifier, "setObject:forKeyedSubscript:", v8, *(void *)(*((void *)&v20 + 1) + 8 * v15++), (void)v20);
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v13);
    }

    adjustedPreferredPlacementsByPlacementUUID = self->_adjustedPreferredPlacementsByPlacementUUID;
    if (!adjustedPreferredPlacementsByPlacementUUID)
    {
      v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v18 = self->_adjustedPreferredPlacementsByPlacementUUID;
      self->_adjustedPreferredPlacementsByPlacementUUID = v17;

      adjustedPreferredPlacementsByPlacementUUID = self->_adjustedPreferredPlacementsByPlacementUUID;
    }
    v19 = -[NSMutableDictionary objectForKeyedSubscript:](adjustedPreferredPlacementsByPlacementUUID, "objectForKeyedSubscript:", v8, (void)v20);

    if (!v19) {
      [(NSMutableDictionary *)self->_adjustedPreferredPlacementsByPlacementUUID setObject:v6 forKeyedSubscript:v8];
    }
  }
}

- (CGRect)_convertRect:(CGRect)a3 fromCoordinateSpace:(id)a4 toLayout:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (objc_loadWeakRetained((id *)&self->_referenceCoordinateSpace)) {
    PXRectConvertFromCoordinateSpaceToCoordinateSpace();
  }
  PXPointSubtract();
}

- (CGRect)_convertRect:(CGRect)a3 fromLayout:(id)a4 toCoordinateSpace:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a4;
  id v12 = a5;
  id v13 = v11;
  uint64_t v14 = [v13 rootLayout];
  uint64_t v15 = [v14 coordinateSpace];
  v16 = [(PXGLayout *)self->_referenceLayout rootLayout];
  v17 = [v16 coordinateSpace];

  if (v15 != v17)
  {
    v18 = [v13 rootLayout];
    objc_msgSend(v18, "convertRect:fromLayout:", v13, x, y, width, height);

    v19 = [v13 rootLayout];

    [v19 coordinateSpace];
    objc_claimAutoreleasedReturnValue();
    [(PXGLayout *)self->_referenceLayout rootLayout];
    [(id)objc_claimAutoreleasedReturnValue() coordinateSpace];
    objc_claimAutoreleasedReturnValue();
    PXRectConvertFromCoordinateSpaceToCoordinateSpace();
  }
  -[PXGLayout convertRect:fromLayout:](self->_referenceLayout, "convertRect:fromLayout:", v13, x, y, width, height);
  PXPointAdd();
}

- (NSString)diagnosticDescription
{
  id v2 = [NSString alloc];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  PXPointDescription();
}

- (PXGItemPlacementContext)initWithOriginOfLayout:(id)a3 atPoint:(CGPoint)a4 inCoordinateSpace:(id)a5
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  id v10 = a3;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PXGItemPlacementContext;
  id v12 = [(PXGItemPlacementContext *)&v15 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_referenceLayout, a3);
    v13->_referenceOrigin.CGFloat x = x;
    v13->_referenceOrigin.CGFloat y = y;
    objc_storeWeak((id *)&v13->_referenceCoordinateSpace, v11);
  }

  return v13;
}

- (PXGItemPlacementContext)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXGItemPlacement.m", 271, @"%s is not available as initializer", "-[PXGItemPlacementContext init]");

  abort();
}

@end