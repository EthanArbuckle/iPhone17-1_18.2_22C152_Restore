@interface RadioRecentStationsGroup
- (BOOL)isActive;
- (BOOL)isEqual:(id)a3;
- (NSArray)stations;
- (NSString)localizedTitle;
- (id)_copyWithRecentStationsGroupClass:(Class)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation RadioRecentStationsGroup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stations, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

- (NSArray)stations
{
  return self->_stations;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (BOOL)isActive
{
  return self->_active;
}

- (id)_copyWithRecentStationsGroupClass:(Class)a3
{
  v4 = (id *)objc_alloc_init(a3);
  v5 = v4;
  if (v4)
  {
    *((unsigned char *)v4 + 8) = self->_active;
    objc_storeStrong(v4 + 2, self->_localizedTitle);
    objc_storeStrong(v5 + 3, self->_stations);
  }
  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_class();
  return [(RadioRecentStationsGroup *)self _copyWithRecentStationsGroupClass:v4];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (RadioRecentStationsGroup *)a3;
  if (v4 == self) {
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || self->_active != v4->_active
    || (localizedTitle = self->_localizedTitle, localizedTitle != v4->_localizedTitle)
    && !-[NSString isEqualToString:](localizedTitle, "isEqualToString:"))
  {
    char v7 = 0;
    goto LABEL_10;
  }
  stations = self->_stations;
  if (stations == v4->_stations)
  {
LABEL_9:
    char v7 = 1;
    goto LABEL_10;
  }
  char v7 = -[NSArray isEqualToArray:](stations, "isEqualToArray:");
LABEL_10:

  return v7;
}

- (unint64_t)hash
{
  BOOL active = self->_active;
  NSUInteger v4 = [(NSString *)self->_localizedTitle hash] ^ active;
  return v4 ^ [(NSArray *)self->_stations hash];
}

- (id)description
{
  v3 = NSString;
  NSUInteger v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v6 = (void *)v5;
  if (self->_active) {
    char v7 = @"true";
  }
  else {
    char v7 = @"false";
  }
  v8 = [v3 stringWithFormat:@"<%@ %p '%@' active:%@ stations:%@>", v5, self, self->_localizedTitle, v7, self->_stations];

  return v8;
}

@end