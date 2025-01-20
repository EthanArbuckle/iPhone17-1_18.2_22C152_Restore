@interface FCLocalRegion
- (BOOL)isEqual:(id)a3;
- (CGRect)rect;
- (CGRect)rectForEntireRegion;
- (CLLocationCoordinate2D)centerLocationCoordinateForEntireRegion;
- (FCLocalRegion)init;
- (FCLocalRegion)initWithDictionary:(id)a3;
- (NSArray)autoFavoriteTagIDs;
- (NSArray)localVersionedTagIDs;
- (NSMutableSet)areas;
- (NSString)identifier;
- (NSString)name;
- (id)description;
- (unint64_t)hash;
- (void)addLocalArea:(id)a3;
- (void)setAreas:(id)a3;
- (void)setName:(id)a3;
- (void)setRect:(CGRect)a3;
@end

@implementation FCLocalRegion

- (FCLocalRegion)initWithDictionary:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)FCLocalRegion;
  v5 = [(FCLocalRegion *)&v23 init];
  if (v5)
  {
    uint64_t v6 = FCAppConfigurationStringValue(v4, @"id", 0);
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = FCAppConfigurationStringValue(v4, @"name", 0);
    name = v5->_name;
    v5->_name = (NSString *)v8;

    uint64_t v10 = FCAppConfigurationArrayValueWithDefaultValue(v4, @"tagIds", 0);
    autoFavoriteTagIDs = v5->_autoFavoriteTagIDs;
    v5->_autoFavoriteTagIDs = (NSArray *)v10;

    v12 = +[FCRestrictions sharedInstance];
    v13 = FCAppConfigurationArrayValueWithDefaultValue(v4, @"localVersionedTags", 0);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __36__FCLocalRegion_initWithDictionary___block_invoke;
    v21[3] = &unk_1E5B4C410;
    id v22 = v12;
    id v14 = v12;
    uint64_t v15 = objc_msgSend(v13, "fc_arrayByTransformingWithBlock:", v21);
    localVersionedTagIDs = v5->_localVersionedTagIDs;
    v5->_localVersionedTagIDs = (NSArray *)v15;

    uint64_t v17 = [MEMORY[0x1E4F1CA80] set];
    areas = v5->_areas;
    v5->_areas = (NSMutableSet *)v17;

    CGSize v19 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    v5->_rect.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    v5->_rect.size = v19;
  }
  return v5;
}

id __36__FCLocalRegion_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[FCLocalVersionedTag alloc] initWithDictionary:v3];

  if (objc_msgSend(*(id *)(a1 + 32), "isNewsVersionAllowedWithMinNewsVersion:maxNewsVersion:", -[FCLocalVersionedTag minVersion](v4, "minVersion"), -[FCLocalVersionedTag maxVersion](v4, "maxVersion")))
  {
    v5 = [(FCLocalVersionedTag *)v4 identifier];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (FCLocalRegion)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    uint64_t v8 = "-[FCLocalRegion init]";
    __int16 v9 = 2080;
    uint64_t v10 = "FCLocalRegion.m";
    __int16 v11 = 1024;
    int v12 = 57;
    __int16 v13 = 2114;
    id v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCLocalRegion init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@: id: %@, name: %@, autoFavoriteTagIDs: %@, localVersionTagIDs: %@", objc_opt_class(), self->_identifier, self->_name, self->_autoFavoriteTagIDs, self->_localVersionedTagIDs];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    v7 = [(FCLocalRegion *)self identifier];
    uint64_t v8 = [v6 identifier];
    char v9 = [v7 isEqual:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v2 = [(FCLocalRegion *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (void)addLocalArea:(id)a3
{
  id v4 = a3;
  id v5 = [(FCLocalRegion *)self areas];
  [v5 addObject:v4];
}

- (CGRect)rectForEntireRegion
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(FCLocalRegion *)self areas];
  if (![v3 count])
  {

    goto LABEL_21;
  }
  [(FCLocalRegion *)self rect];
  BOOL IsEmpty = CGRectIsEmpty(v38);

  if (!IsEmpty)
  {
LABEL_21:
    uint64_t v31 = MEMORY[0x1E4F143A8];
    uint64_t v32 = 3221225472;
    v33 = __36__FCLocalRegion_rectForEntireRegion__block_invoke;
    v34 = &unk_1E5B4C438;
    v35 = self;
    goto LABEL_24;
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v5 = [(FCLocalRegion *)self areas];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v28;
    double v9 = 90.0;
    double v10 = -90.0;
    double v11 = 180.0;
    double v12 = -180.0;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v5);
        }
        id v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if ([v14 isBboxValid])
        {
          [v14 minLat];
          if (v15 < v9)
          {
            [v14 minLat];
            double v9 = v16;
          }
          [v14 maxLat];
          if (v17 > v10)
          {
            [v14 maxLat];
            double v10 = v18;
          }
          [v14 minLon];
          if (v19 < v11)
          {
            [v14 minLon];
            double v11 = v20;
          }
          [v14 maxLon];
          if (v21 > v12)
          {
            [v14 maxLon];
            double v12 = v22;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v27 objects:v36 count:16];
    }
    while (v7);
  }
  else
  {
    double v9 = 90.0;
    double v10 = -90.0;
    double v11 = 180.0;
    double v12 = -180.0;
  }

  -[FCLocalRegion setRect:](self, "setRect:", v11, v9, v12 - v11, v10 - v9);
LABEL_24:
  [(FCLocalRegion *)self rect];
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

uint64_t __36__FCLocalRegion_rectForEntireRegion__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) rect];
}

- (CLLocationCoordinate2D)centerLocationCoordinateForEntireRegion
{
  [(FCLocalRegion *)self rectForEntireRegion];
  CGFloat x = v13.origin.x;
  CGFloat y = v13.origin.y;
  CGFloat width = v13.size.width;
  CGFloat height = v13.size.height;
  CGFloat MidY = CGRectGetMidY(v13);
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  CGFloat MidX = CGRectGetMidX(v14);
  CLLocationCoordinate2D v10 = CLLocationCoordinate2DMake(MidY, MidX);
  double longitude = v10.longitude;
  double latitude = v10.latitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSArray)autoFavoriteTagIDs
{
  return self->_autoFavoriteTagIDs;
}

- (NSArray)localVersionedTagIDs
{
  return self->_localVersionedTagIDs;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSMutableSet)areas
{
  return self->_areas;
}

- (void)setAreas:(id)a3
{
}

- (CGRect)rect
{
  double x = self->_rect.origin.x;
  double y = self->_rect.origin.y;
  double width = self->_rect.size.width;
  double height = self->_rect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setRect:(CGRect)a3
{
  self->_rect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_areas, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_localVersionedTagIDs, 0);
  objc_storeStrong((id *)&self->_autoFavoriteTagIDs, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end