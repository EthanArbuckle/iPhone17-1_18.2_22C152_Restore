@interface SXBlueprintMarker
- (BOOL)isEqualToMarker:(id)a3;
- (CGPoint)approximateLocation;
- (NSArray)path;
- (NSString)description;
- (SXBlueprintMarker)initWithLeadingComponent:(id)a3 trailingComponent:(id)a4 approximateLocation:(CGPoint)a5 path:(id)a6;
- (SXComponent)leadingComponent;
- (SXComponent)trailingComponent;
- (SXComponentAnchor)componentAnchor;
- (void)setComponentAnchor:(id)a3;
@end

@implementation SXBlueprintMarker

- (SXBlueprintMarker)initWithLeadingComponent:(id)a3 trailingComponent:(id)a4 approximateLocation:(CGPoint)a5 path:(id)a6
{
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SXBlueprintMarker;
  v15 = [(SXBlueprintMarker *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_leadingComponent, a3);
    objc_storeStrong((id *)&v16->_trailingComponent, a4);
    v16->_approximateLocation.CGFloat x = x;
    v16->_approximateLocation.CGFloat y = y;
    objc_storeStrong((id *)&v16->_path, a6);
  }

  return v16;
}

- (BOOL)isEqualToMarker:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_9;
  }
  v5 = [(SXBlueprintMarker *)self leadingComponent];
  v6 = [v4 leadingComponent];
  int v7 = [v5 isEqual:v6];

  if (!v7) {
    goto LABEL_9;
  }
  uint64_t v8 = [(SXBlueprintMarker *)self trailingComponent];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(SXBlueprintMarker *)self trailingComponent];
    v11 = [v4 trailingComponent];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_9;
    }
  }
  id v13 = [(SXBlueprintMarker *)self path];
  id v14 = [v4 path];
  int v15 = [v13 isEqualToArray:v14];

  if (v15)
  {
    uint64_t v16 = [(SXBlueprintMarker *)self componentAnchor];
    if (v16)
    {
      v17 = (void *)v16;
      objc_super v18 = [(SXBlueprintMarker *)self componentAnchor];
      v19 = [v4 componentAnchor];
      char v20 = [v18 isEqual:v19];
    }
    else
    {
      char v20 = 1;
    }
  }
  else
  {
LABEL_9:
    char v20 = 0;
  }

  return v20;
}

- (NSString)description
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  id v4 = [(SXBlueprintMarker *)self leadingComponent];
  v5 = [v4 identifier];
  v6 = [(SXBlueprintMarker *)self leadingComponent];
  int v7 = [v6 type];
  [v3 appendFormat:@"; leading component: %@ (%@)", v5, v7];

  uint64_t v8 = [(SXBlueprintMarker *)self trailingComponent];
  v9 = [v8 identifier];
  v10 = [(SXBlueprintMarker *)self trailingComponent];
  v11 = [v10 type];
  [v3 appendFormat:@"; trailing component: %@ (%@)", v9, v11];

  [(SXBlueprintMarker *)self approximateLocation];
  int v12 = NSStringFromCGPoint(v28);
  [v3 appendFormat:@"; approximate location: %@", v12];

  objc_msgSend(v3, "appendFormat:", @"; path: (");
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v13 = [(SXBlueprintMarker *)self path];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        objc_super v18 = [*(id *)(*((void *)&v21 + 1) + 8 * i) identifier];
        [v3 appendFormat:@"%@", v18];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v15);
  }

  [v3 appendFormat:@""]);
  v19 = [(SXBlueprintMarker *)self componentAnchor];
  [v3 appendFormat:@"; anchor: %@", v19];

  [v3 appendFormat:@">"];
  return (NSString *)v3;
}

- (SXComponent)leadingComponent
{
  return self->_leadingComponent;
}

- (SXComponent)trailingComponent
{
  return self->_trailingComponent;
}

- (CGPoint)approximateLocation
{
  double x = self->_approximateLocation.x;
  double y = self->_approximateLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (NSArray)path
{
  return self->_path;
}

- (SXComponentAnchor)componentAnchor
{
  return self->_componentAnchor;
}

- (void)setComponentAnchor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentAnchor, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_trailingComponent, 0);
  objc_storeStrong((id *)&self->_leadingComponent, 0);
}

@end